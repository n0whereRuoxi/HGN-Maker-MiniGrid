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
      ?auto_709825 - BLOCK
    )
    :vars
    (
      ?auto_709826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709825 ?auto_709826 ) ( CLEAR ?auto_709825 ) ( HAND-EMPTY ) ( not ( = ?auto_709825 ?auto_709826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_709825 ?auto_709826 )
      ( !PUTDOWN ?auto_709825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_709832 - BLOCK
      ?auto_709833 - BLOCK
    )
    :vars
    (
      ?auto_709834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_709832 ) ( ON ?auto_709833 ?auto_709834 ) ( CLEAR ?auto_709833 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_709832 ) ( not ( = ?auto_709832 ?auto_709833 ) ) ( not ( = ?auto_709832 ?auto_709834 ) ) ( not ( = ?auto_709833 ?auto_709834 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_709833 ?auto_709834 )
      ( !STACK ?auto_709833 ?auto_709832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_709842 - BLOCK
      ?auto_709843 - BLOCK
    )
    :vars
    (
      ?auto_709844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709843 ?auto_709844 ) ( not ( = ?auto_709842 ?auto_709843 ) ) ( not ( = ?auto_709842 ?auto_709844 ) ) ( not ( = ?auto_709843 ?auto_709844 ) ) ( ON ?auto_709842 ?auto_709843 ) ( CLEAR ?auto_709842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_709842 )
      ( MAKE-2PILE ?auto_709842 ?auto_709843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_709853 - BLOCK
      ?auto_709854 - BLOCK
      ?auto_709855 - BLOCK
    )
    :vars
    (
      ?auto_709856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_709854 ) ( ON ?auto_709855 ?auto_709856 ) ( CLEAR ?auto_709855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_709853 ) ( ON ?auto_709854 ?auto_709853 ) ( not ( = ?auto_709853 ?auto_709854 ) ) ( not ( = ?auto_709853 ?auto_709855 ) ) ( not ( = ?auto_709853 ?auto_709856 ) ) ( not ( = ?auto_709854 ?auto_709855 ) ) ( not ( = ?auto_709854 ?auto_709856 ) ) ( not ( = ?auto_709855 ?auto_709856 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_709855 ?auto_709856 )
      ( !STACK ?auto_709855 ?auto_709854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_709867 - BLOCK
      ?auto_709868 - BLOCK
      ?auto_709869 - BLOCK
    )
    :vars
    (
      ?auto_709870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709869 ?auto_709870 ) ( ON-TABLE ?auto_709867 ) ( not ( = ?auto_709867 ?auto_709868 ) ) ( not ( = ?auto_709867 ?auto_709869 ) ) ( not ( = ?auto_709867 ?auto_709870 ) ) ( not ( = ?auto_709868 ?auto_709869 ) ) ( not ( = ?auto_709868 ?auto_709870 ) ) ( not ( = ?auto_709869 ?auto_709870 ) ) ( CLEAR ?auto_709867 ) ( ON ?auto_709868 ?auto_709869 ) ( CLEAR ?auto_709868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_709867 ?auto_709868 )
      ( MAKE-3PILE ?auto_709867 ?auto_709868 ?auto_709869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_709881 - BLOCK
      ?auto_709882 - BLOCK
      ?auto_709883 - BLOCK
    )
    :vars
    (
      ?auto_709884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709883 ?auto_709884 ) ( not ( = ?auto_709881 ?auto_709882 ) ) ( not ( = ?auto_709881 ?auto_709883 ) ) ( not ( = ?auto_709881 ?auto_709884 ) ) ( not ( = ?auto_709882 ?auto_709883 ) ) ( not ( = ?auto_709882 ?auto_709884 ) ) ( not ( = ?auto_709883 ?auto_709884 ) ) ( ON ?auto_709882 ?auto_709883 ) ( ON ?auto_709881 ?auto_709882 ) ( CLEAR ?auto_709881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_709881 )
      ( MAKE-3PILE ?auto_709881 ?auto_709882 ?auto_709883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_709896 - BLOCK
      ?auto_709897 - BLOCK
      ?auto_709898 - BLOCK
      ?auto_709899 - BLOCK
    )
    :vars
    (
      ?auto_709900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_709898 ) ( ON ?auto_709899 ?auto_709900 ) ( CLEAR ?auto_709899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_709896 ) ( ON ?auto_709897 ?auto_709896 ) ( ON ?auto_709898 ?auto_709897 ) ( not ( = ?auto_709896 ?auto_709897 ) ) ( not ( = ?auto_709896 ?auto_709898 ) ) ( not ( = ?auto_709896 ?auto_709899 ) ) ( not ( = ?auto_709896 ?auto_709900 ) ) ( not ( = ?auto_709897 ?auto_709898 ) ) ( not ( = ?auto_709897 ?auto_709899 ) ) ( not ( = ?auto_709897 ?auto_709900 ) ) ( not ( = ?auto_709898 ?auto_709899 ) ) ( not ( = ?auto_709898 ?auto_709900 ) ) ( not ( = ?auto_709899 ?auto_709900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_709899 ?auto_709900 )
      ( !STACK ?auto_709899 ?auto_709898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_709914 - BLOCK
      ?auto_709915 - BLOCK
      ?auto_709916 - BLOCK
      ?auto_709917 - BLOCK
    )
    :vars
    (
      ?auto_709918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709917 ?auto_709918 ) ( ON-TABLE ?auto_709914 ) ( ON ?auto_709915 ?auto_709914 ) ( not ( = ?auto_709914 ?auto_709915 ) ) ( not ( = ?auto_709914 ?auto_709916 ) ) ( not ( = ?auto_709914 ?auto_709917 ) ) ( not ( = ?auto_709914 ?auto_709918 ) ) ( not ( = ?auto_709915 ?auto_709916 ) ) ( not ( = ?auto_709915 ?auto_709917 ) ) ( not ( = ?auto_709915 ?auto_709918 ) ) ( not ( = ?auto_709916 ?auto_709917 ) ) ( not ( = ?auto_709916 ?auto_709918 ) ) ( not ( = ?auto_709917 ?auto_709918 ) ) ( CLEAR ?auto_709915 ) ( ON ?auto_709916 ?auto_709917 ) ( CLEAR ?auto_709916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_709914 ?auto_709915 ?auto_709916 )
      ( MAKE-4PILE ?auto_709914 ?auto_709915 ?auto_709916 ?auto_709917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_709932 - BLOCK
      ?auto_709933 - BLOCK
      ?auto_709934 - BLOCK
      ?auto_709935 - BLOCK
    )
    :vars
    (
      ?auto_709936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709935 ?auto_709936 ) ( ON-TABLE ?auto_709932 ) ( not ( = ?auto_709932 ?auto_709933 ) ) ( not ( = ?auto_709932 ?auto_709934 ) ) ( not ( = ?auto_709932 ?auto_709935 ) ) ( not ( = ?auto_709932 ?auto_709936 ) ) ( not ( = ?auto_709933 ?auto_709934 ) ) ( not ( = ?auto_709933 ?auto_709935 ) ) ( not ( = ?auto_709933 ?auto_709936 ) ) ( not ( = ?auto_709934 ?auto_709935 ) ) ( not ( = ?auto_709934 ?auto_709936 ) ) ( not ( = ?auto_709935 ?auto_709936 ) ) ( ON ?auto_709934 ?auto_709935 ) ( CLEAR ?auto_709932 ) ( ON ?auto_709933 ?auto_709934 ) ( CLEAR ?auto_709933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_709932 ?auto_709933 )
      ( MAKE-4PILE ?auto_709932 ?auto_709933 ?auto_709934 ?auto_709935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_709950 - BLOCK
      ?auto_709951 - BLOCK
      ?auto_709952 - BLOCK
      ?auto_709953 - BLOCK
    )
    :vars
    (
      ?auto_709954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709953 ?auto_709954 ) ( not ( = ?auto_709950 ?auto_709951 ) ) ( not ( = ?auto_709950 ?auto_709952 ) ) ( not ( = ?auto_709950 ?auto_709953 ) ) ( not ( = ?auto_709950 ?auto_709954 ) ) ( not ( = ?auto_709951 ?auto_709952 ) ) ( not ( = ?auto_709951 ?auto_709953 ) ) ( not ( = ?auto_709951 ?auto_709954 ) ) ( not ( = ?auto_709952 ?auto_709953 ) ) ( not ( = ?auto_709952 ?auto_709954 ) ) ( not ( = ?auto_709953 ?auto_709954 ) ) ( ON ?auto_709952 ?auto_709953 ) ( ON ?auto_709951 ?auto_709952 ) ( ON ?auto_709950 ?auto_709951 ) ( CLEAR ?auto_709950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_709950 )
      ( MAKE-4PILE ?auto_709950 ?auto_709951 ?auto_709952 ?auto_709953 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_709969 - BLOCK
      ?auto_709970 - BLOCK
      ?auto_709971 - BLOCK
      ?auto_709972 - BLOCK
      ?auto_709973 - BLOCK
    )
    :vars
    (
      ?auto_709974 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_709972 ) ( ON ?auto_709973 ?auto_709974 ) ( CLEAR ?auto_709973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_709969 ) ( ON ?auto_709970 ?auto_709969 ) ( ON ?auto_709971 ?auto_709970 ) ( ON ?auto_709972 ?auto_709971 ) ( not ( = ?auto_709969 ?auto_709970 ) ) ( not ( = ?auto_709969 ?auto_709971 ) ) ( not ( = ?auto_709969 ?auto_709972 ) ) ( not ( = ?auto_709969 ?auto_709973 ) ) ( not ( = ?auto_709969 ?auto_709974 ) ) ( not ( = ?auto_709970 ?auto_709971 ) ) ( not ( = ?auto_709970 ?auto_709972 ) ) ( not ( = ?auto_709970 ?auto_709973 ) ) ( not ( = ?auto_709970 ?auto_709974 ) ) ( not ( = ?auto_709971 ?auto_709972 ) ) ( not ( = ?auto_709971 ?auto_709973 ) ) ( not ( = ?auto_709971 ?auto_709974 ) ) ( not ( = ?auto_709972 ?auto_709973 ) ) ( not ( = ?auto_709972 ?auto_709974 ) ) ( not ( = ?auto_709973 ?auto_709974 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_709973 ?auto_709974 )
      ( !STACK ?auto_709973 ?auto_709972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_709991 - BLOCK
      ?auto_709992 - BLOCK
      ?auto_709993 - BLOCK
      ?auto_709994 - BLOCK
      ?auto_709995 - BLOCK
    )
    :vars
    (
      ?auto_709996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709995 ?auto_709996 ) ( ON-TABLE ?auto_709991 ) ( ON ?auto_709992 ?auto_709991 ) ( ON ?auto_709993 ?auto_709992 ) ( not ( = ?auto_709991 ?auto_709992 ) ) ( not ( = ?auto_709991 ?auto_709993 ) ) ( not ( = ?auto_709991 ?auto_709994 ) ) ( not ( = ?auto_709991 ?auto_709995 ) ) ( not ( = ?auto_709991 ?auto_709996 ) ) ( not ( = ?auto_709992 ?auto_709993 ) ) ( not ( = ?auto_709992 ?auto_709994 ) ) ( not ( = ?auto_709992 ?auto_709995 ) ) ( not ( = ?auto_709992 ?auto_709996 ) ) ( not ( = ?auto_709993 ?auto_709994 ) ) ( not ( = ?auto_709993 ?auto_709995 ) ) ( not ( = ?auto_709993 ?auto_709996 ) ) ( not ( = ?auto_709994 ?auto_709995 ) ) ( not ( = ?auto_709994 ?auto_709996 ) ) ( not ( = ?auto_709995 ?auto_709996 ) ) ( CLEAR ?auto_709993 ) ( ON ?auto_709994 ?auto_709995 ) ( CLEAR ?auto_709994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_709991 ?auto_709992 ?auto_709993 ?auto_709994 )
      ( MAKE-5PILE ?auto_709991 ?auto_709992 ?auto_709993 ?auto_709994 ?auto_709995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_710013 - BLOCK
      ?auto_710014 - BLOCK
      ?auto_710015 - BLOCK
      ?auto_710016 - BLOCK
      ?auto_710017 - BLOCK
    )
    :vars
    (
      ?auto_710018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710017 ?auto_710018 ) ( ON-TABLE ?auto_710013 ) ( ON ?auto_710014 ?auto_710013 ) ( not ( = ?auto_710013 ?auto_710014 ) ) ( not ( = ?auto_710013 ?auto_710015 ) ) ( not ( = ?auto_710013 ?auto_710016 ) ) ( not ( = ?auto_710013 ?auto_710017 ) ) ( not ( = ?auto_710013 ?auto_710018 ) ) ( not ( = ?auto_710014 ?auto_710015 ) ) ( not ( = ?auto_710014 ?auto_710016 ) ) ( not ( = ?auto_710014 ?auto_710017 ) ) ( not ( = ?auto_710014 ?auto_710018 ) ) ( not ( = ?auto_710015 ?auto_710016 ) ) ( not ( = ?auto_710015 ?auto_710017 ) ) ( not ( = ?auto_710015 ?auto_710018 ) ) ( not ( = ?auto_710016 ?auto_710017 ) ) ( not ( = ?auto_710016 ?auto_710018 ) ) ( not ( = ?auto_710017 ?auto_710018 ) ) ( ON ?auto_710016 ?auto_710017 ) ( CLEAR ?auto_710014 ) ( ON ?auto_710015 ?auto_710016 ) ( CLEAR ?auto_710015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_710013 ?auto_710014 ?auto_710015 )
      ( MAKE-5PILE ?auto_710013 ?auto_710014 ?auto_710015 ?auto_710016 ?auto_710017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_710035 - BLOCK
      ?auto_710036 - BLOCK
      ?auto_710037 - BLOCK
      ?auto_710038 - BLOCK
      ?auto_710039 - BLOCK
    )
    :vars
    (
      ?auto_710040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710039 ?auto_710040 ) ( ON-TABLE ?auto_710035 ) ( not ( = ?auto_710035 ?auto_710036 ) ) ( not ( = ?auto_710035 ?auto_710037 ) ) ( not ( = ?auto_710035 ?auto_710038 ) ) ( not ( = ?auto_710035 ?auto_710039 ) ) ( not ( = ?auto_710035 ?auto_710040 ) ) ( not ( = ?auto_710036 ?auto_710037 ) ) ( not ( = ?auto_710036 ?auto_710038 ) ) ( not ( = ?auto_710036 ?auto_710039 ) ) ( not ( = ?auto_710036 ?auto_710040 ) ) ( not ( = ?auto_710037 ?auto_710038 ) ) ( not ( = ?auto_710037 ?auto_710039 ) ) ( not ( = ?auto_710037 ?auto_710040 ) ) ( not ( = ?auto_710038 ?auto_710039 ) ) ( not ( = ?auto_710038 ?auto_710040 ) ) ( not ( = ?auto_710039 ?auto_710040 ) ) ( ON ?auto_710038 ?auto_710039 ) ( ON ?auto_710037 ?auto_710038 ) ( CLEAR ?auto_710035 ) ( ON ?auto_710036 ?auto_710037 ) ( CLEAR ?auto_710036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_710035 ?auto_710036 )
      ( MAKE-5PILE ?auto_710035 ?auto_710036 ?auto_710037 ?auto_710038 ?auto_710039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_710057 - BLOCK
      ?auto_710058 - BLOCK
      ?auto_710059 - BLOCK
      ?auto_710060 - BLOCK
      ?auto_710061 - BLOCK
    )
    :vars
    (
      ?auto_710062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710061 ?auto_710062 ) ( not ( = ?auto_710057 ?auto_710058 ) ) ( not ( = ?auto_710057 ?auto_710059 ) ) ( not ( = ?auto_710057 ?auto_710060 ) ) ( not ( = ?auto_710057 ?auto_710061 ) ) ( not ( = ?auto_710057 ?auto_710062 ) ) ( not ( = ?auto_710058 ?auto_710059 ) ) ( not ( = ?auto_710058 ?auto_710060 ) ) ( not ( = ?auto_710058 ?auto_710061 ) ) ( not ( = ?auto_710058 ?auto_710062 ) ) ( not ( = ?auto_710059 ?auto_710060 ) ) ( not ( = ?auto_710059 ?auto_710061 ) ) ( not ( = ?auto_710059 ?auto_710062 ) ) ( not ( = ?auto_710060 ?auto_710061 ) ) ( not ( = ?auto_710060 ?auto_710062 ) ) ( not ( = ?auto_710061 ?auto_710062 ) ) ( ON ?auto_710060 ?auto_710061 ) ( ON ?auto_710059 ?auto_710060 ) ( ON ?auto_710058 ?auto_710059 ) ( ON ?auto_710057 ?auto_710058 ) ( CLEAR ?auto_710057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_710057 )
      ( MAKE-5PILE ?auto_710057 ?auto_710058 ?auto_710059 ?auto_710060 ?auto_710061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710080 - BLOCK
      ?auto_710081 - BLOCK
      ?auto_710082 - BLOCK
      ?auto_710083 - BLOCK
      ?auto_710084 - BLOCK
      ?auto_710085 - BLOCK
    )
    :vars
    (
      ?auto_710086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_710084 ) ( ON ?auto_710085 ?auto_710086 ) ( CLEAR ?auto_710085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_710080 ) ( ON ?auto_710081 ?auto_710080 ) ( ON ?auto_710082 ?auto_710081 ) ( ON ?auto_710083 ?auto_710082 ) ( ON ?auto_710084 ?auto_710083 ) ( not ( = ?auto_710080 ?auto_710081 ) ) ( not ( = ?auto_710080 ?auto_710082 ) ) ( not ( = ?auto_710080 ?auto_710083 ) ) ( not ( = ?auto_710080 ?auto_710084 ) ) ( not ( = ?auto_710080 ?auto_710085 ) ) ( not ( = ?auto_710080 ?auto_710086 ) ) ( not ( = ?auto_710081 ?auto_710082 ) ) ( not ( = ?auto_710081 ?auto_710083 ) ) ( not ( = ?auto_710081 ?auto_710084 ) ) ( not ( = ?auto_710081 ?auto_710085 ) ) ( not ( = ?auto_710081 ?auto_710086 ) ) ( not ( = ?auto_710082 ?auto_710083 ) ) ( not ( = ?auto_710082 ?auto_710084 ) ) ( not ( = ?auto_710082 ?auto_710085 ) ) ( not ( = ?auto_710082 ?auto_710086 ) ) ( not ( = ?auto_710083 ?auto_710084 ) ) ( not ( = ?auto_710083 ?auto_710085 ) ) ( not ( = ?auto_710083 ?auto_710086 ) ) ( not ( = ?auto_710084 ?auto_710085 ) ) ( not ( = ?auto_710084 ?auto_710086 ) ) ( not ( = ?auto_710085 ?auto_710086 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_710085 ?auto_710086 )
      ( !STACK ?auto_710085 ?auto_710084 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710106 - BLOCK
      ?auto_710107 - BLOCK
      ?auto_710108 - BLOCK
      ?auto_710109 - BLOCK
      ?auto_710110 - BLOCK
      ?auto_710111 - BLOCK
    )
    :vars
    (
      ?auto_710112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710111 ?auto_710112 ) ( ON-TABLE ?auto_710106 ) ( ON ?auto_710107 ?auto_710106 ) ( ON ?auto_710108 ?auto_710107 ) ( ON ?auto_710109 ?auto_710108 ) ( not ( = ?auto_710106 ?auto_710107 ) ) ( not ( = ?auto_710106 ?auto_710108 ) ) ( not ( = ?auto_710106 ?auto_710109 ) ) ( not ( = ?auto_710106 ?auto_710110 ) ) ( not ( = ?auto_710106 ?auto_710111 ) ) ( not ( = ?auto_710106 ?auto_710112 ) ) ( not ( = ?auto_710107 ?auto_710108 ) ) ( not ( = ?auto_710107 ?auto_710109 ) ) ( not ( = ?auto_710107 ?auto_710110 ) ) ( not ( = ?auto_710107 ?auto_710111 ) ) ( not ( = ?auto_710107 ?auto_710112 ) ) ( not ( = ?auto_710108 ?auto_710109 ) ) ( not ( = ?auto_710108 ?auto_710110 ) ) ( not ( = ?auto_710108 ?auto_710111 ) ) ( not ( = ?auto_710108 ?auto_710112 ) ) ( not ( = ?auto_710109 ?auto_710110 ) ) ( not ( = ?auto_710109 ?auto_710111 ) ) ( not ( = ?auto_710109 ?auto_710112 ) ) ( not ( = ?auto_710110 ?auto_710111 ) ) ( not ( = ?auto_710110 ?auto_710112 ) ) ( not ( = ?auto_710111 ?auto_710112 ) ) ( CLEAR ?auto_710109 ) ( ON ?auto_710110 ?auto_710111 ) ( CLEAR ?auto_710110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_710106 ?auto_710107 ?auto_710108 ?auto_710109 ?auto_710110 )
      ( MAKE-6PILE ?auto_710106 ?auto_710107 ?auto_710108 ?auto_710109 ?auto_710110 ?auto_710111 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710132 - BLOCK
      ?auto_710133 - BLOCK
      ?auto_710134 - BLOCK
      ?auto_710135 - BLOCK
      ?auto_710136 - BLOCK
      ?auto_710137 - BLOCK
    )
    :vars
    (
      ?auto_710138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710137 ?auto_710138 ) ( ON-TABLE ?auto_710132 ) ( ON ?auto_710133 ?auto_710132 ) ( ON ?auto_710134 ?auto_710133 ) ( not ( = ?auto_710132 ?auto_710133 ) ) ( not ( = ?auto_710132 ?auto_710134 ) ) ( not ( = ?auto_710132 ?auto_710135 ) ) ( not ( = ?auto_710132 ?auto_710136 ) ) ( not ( = ?auto_710132 ?auto_710137 ) ) ( not ( = ?auto_710132 ?auto_710138 ) ) ( not ( = ?auto_710133 ?auto_710134 ) ) ( not ( = ?auto_710133 ?auto_710135 ) ) ( not ( = ?auto_710133 ?auto_710136 ) ) ( not ( = ?auto_710133 ?auto_710137 ) ) ( not ( = ?auto_710133 ?auto_710138 ) ) ( not ( = ?auto_710134 ?auto_710135 ) ) ( not ( = ?auto_710134 ?auto_710136 ) ) ( not ( = ?auto_710134 ?auto_710137 ) ) ( not ( = ?auto_710134 ?auto_710138 ) ) ( not ( = ?auto_710135 ?auto_710136 ) ) ( not ( = ?auto_710135 ?auto_710137 ) ) ( not ( = ?auto_710135 ?auto_710138 ) ) ( not ( = ?auto_710136 ?auto_710137 ) ) ( not ( = ?auto_710136 ?auto_710138 ) ) ( not ( = ?auto_710137 ?auto_710138 ) ) ( ON ?auto_710136 ?auto_710137 ) ( CLEAR ?auto_710134 ) ( ON ?auto_710135 ?auto_710136 ) ( CLEAR ?auto_710135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_710132 ?auto_710133 ?auto_710134 ?auto_710135 )
      ( MAKE-6PILE ?auto_710132 ?auto_710133 ?auto_710134 ?auto_710135 ?auto_710136 ?auto_710137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710158 - BLOCK
      ?auto_710159 - BLOCK
      ?auto_710160 - BLOCK
      ?auto_710161 - BLOCK
      ?auto_710162 - BLOCK
      ?auto_710163 - BLOCK
    )
    :vars
    (
      ?auto_710164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710163 ?auto_710164 ) ( ON-TABLE ?auto_710158 ) ( ON ?auto_710159 ?auto_710158 ) ( not ( = ?auto_710158 ?auto_710159 ) ) ( not ( = ?auto_710158 ?auto_710160 ) ) ( not ( = ?auto_710158 ?auto_710161 ) ) ( not ( = ?auto_710158 ?auto_710162 ) ) ( not ( = ?auto_710158 ?auto_710163 ) ) ( not ( = ?auto_710158 ?auto_710164 ) ) ( not ( = ?auto_710159 ?auto_710160 ) ) ( not ( = ?auto_710159 ?auto_710161 ) ) ( not ( = ?auto_710159 ?auto_710162 ) ) ( not ( = ?auto_710159 ?auto_710163 ) ) ( not ( = ?auto_710159 ?auto_710164 ) ) ( not ( = ?auto_710160 ?auto_710161 ) ) ( not ( = ?auto_710160 ?auto_710162 ) ) ( not ( = ?auto_710160 ?auto_710163 ) ) ( not ( = ?auto_710160 ?auto_710164 ) ) ( not ( = ?auto_710161 ?auto_710162 ) ) ( not ( = ?auto_710161 ?auto_710163 ) ) ( not ( = ?auto_710161 ?auto_710164 ) ) ( not ( = ?auto_710162 ?auto_710163 ) ) ( not ( = ?auto_710162 ?auto_710164 ) ) ( not ( = ?auto_710163 ?auto_710164 ) ) ( ON ?auto_710162 ?auto_710163 ) ( ON ?auto_710161 ?auto_710162 ) ( CLEAR ?auto_710159 ) ( ON ?auto_710160 ?auto_710161 ) ( CLEAR ?auto_710160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_710158 ?auto_710159 ?auto_710160 )
      ( MAKE-6PILE ?auto_710158 ?auto_710159 ?auto_710160 ?auto_710161 ?auto_710162 ?auto_710163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710184 - BLOCK
      ?auto_710185 - BLOCK
      ?auto_710186 - BLOCK
      ?auto_710187 - BLOCK
      ?auto_710188 - BLOCK
      ?auto_710189 - BLOCK
    )
    :vars
    (
      ?auto_710190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710189 ?auto_710190 ) ( ON-TABLE ?auto_710184 ) ( not ( = ?auto_710184 ?auto_710185 ) ) ( not ( = ?auto_710184 ?auto_710186 ) ) ( not ( = ?auto_710184 ?auto_710187 ) ) ( not ( = ?auto_710184 ?auto_710188 ) ) ( not ( = ?auto_710184 ?auto_710189 ) ) ( not ( = ?auto_710184 ?auto_710190 ) ) ( not ( = ?auto_710185 ?auto_710186 ) ) ( not ( = ?auto_710185 ?auto_710187 ) ) ( not ( = ?auto_710185 ?auto_710188 ) ) ( not ( = ?auto_710185 ?auto_710189 ) ) ( not ( = ?auto_710185 ?auto_710190 ) ) ( not ( = ?auto_710186 ?auto_710187 ) ) ( not ( = ?auto_710186 ?auto_710188 ) ) ( not ( = ?auto_710186 ?auto_710189 ) ) ( not ( = ?auto_710186 ?auto_710190 ) ) ( not ( = ?auto_710187 ?auto_710188 ) ) ( not ( = ?auto_710187 ?auto_710189 ) ) ( not ( = ?auto_710187 ?auto_710190 ) ) ( not ( = ?auto_710188 ?auto_710189 ) ) ( not ( = ?auto_710188 ?auto_710190 ) ) ( not ( = ?auto_710189 ?auto_710190 ) ) ( ON ?auto_710188 ?auto_710189 ) ( ON ?auto_710187 ?auto_710188 ) ( ON ?auto_710186 ?auto_710187 ) ( CLEAR ?auto_710184 ) ( ON ?auto_710185 ?auto_710186 ) ( CLEAR ?auto_710185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_710184 ?auto_710185 )
      ( MAKE-6PILE ?auto_710184 ?auto_710185 ?auto_710186 ?auto_710187 ?auto_710188 ?auto_710189 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_710210 - BLOCK
      ?auto_710211 - BLOCK
      ?auto_710212 - BLOCK
      ?auto_710213 - BLOCK
      ?auto_710214 - BLOCK
      ?auto_710215 - BLOCK
    )
    :vars
    (
      ?auto_710216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710215 ?auto_710216 ) ( not ( = ?auto_710210 ?auto_710211 ) ) ( not ( = ?auto_710210 ?auto_710212 ) ) ( not ( = ?auto_710210 ?auto_710213 ) ) ( not ( = ?auto_710210 ?auto_710214 ) ) ( not ( = ?auto_710210 ?auto_710215 ) ) ( not ( = ?auto_710210 ?auto_710216 ) ) ( not ( = ?auto_710211 ?auto_710212 ) ) ( not ( = ?auto_710211 ?auto_710213 ) ) ( not ( = ?auto_710211 ?auto_710214 ) ) ( not ( = ?auto_710211 ?auto_710215 ) ) ( not ( = ?auto_710211 ?auto_710216 ) ) ( not ( = ?auto_710212 ?auto_710213 ) ) ( not ( = ?auto_710212 ?auto_710214 ) ) ( not ( = ?auto_710212 ?auto_710215 ) ) ( not ( = ?auto_710212 ?auto_710216 ) ) ( not ( = ?auto_710213 ?auto_710214 ) ) ( not ( = ?auto_710213 ?auto_710215 ) ) ( not ( = ?auto_710213 ?auto_710216 ) ) ( not ( = ?auto_710214 ?auto_710215 ) ) ( not ( = ?auto_710214 ?auto_710216 ) ) ( not ( = ?auto_710215 ?auto_710216 ) ) ( ON ?auto_710214 ?auto_710215 ) ( ON ?auto_710213 ?auto_710214 ) ( ON ?auto_710212 ?auto_710213 ) ( ON ?auto_710211 ?auto_710212 ) ( ON ?auto_710210 ?auto_710211 ) ( CLEAR ?auto_710210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_710210 )
      ( MAKE-6PILE ?auto_710210 ?auto_710211 ?auto_710212 ?auto_710213 ?auto_710214 ?auto_710215 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710237 - BLOCK
      ?auto_710238 - BLOCK
      ?auto_710239 - BLOCK
      ?auto_710240 - BLOCK
      ?auto_710241 - BLOCK
      ?auto_710242 - BLOCK
      ?auto_710243 - BLOCK
    )
    :vars
    (
      ?auto_710244 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_710242 ) ( ON ?auto_710243 ?auto_710244 ) ( CLEAR ?auto_710243 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_710237 ) ( ON ?auto_710238 ?auto_710237 ) ( ON ?auto_710239 ?auto_710238 ) ( ON ?auto_710240 ?auto_710239 ) ( ON ?auto_710241 ?auto_710240 ) ( ON ?auto_710242 ?auto_710241 ) ( not ( = ?auto_710237 ?auto_710238 ) ) ( not ( = ?auto_710237 ?auto_710239 ) ) ( not ( = ?auto_710237 ?auto_710240 ) ) ( not ( = ?auto_710237 ?auto_710241 ) ) ( not ( = ?auto_710237 ?auto_710242 ) ) ( not ( = ?auto_710237 ?auto_710243 ) ) ( not ( = ?auto_710237 ?auto_710244 ) ) ( not ( = ?auto_710238 ?auto_710239 ) ) ( not ( = ?auto_710238 ?auto_710240 ) ) ( not ( = ?auto_710238 ?auto_710241 ) ) ( not ( = ?auto_710238 ?auto_710242 ) ) ( not ( = ?auto_710238 ?auto_710243 ) ) ( not ( = ?auto_710238 ?auto_710244 ) ) ( not ( = ?auto_710239 ?auto_710240 ) ) ( not ( = ?auto_710239 ?auto_710241 ) ) ( not ( = ?auto_710239 ?auto_710242 ) ) ( not ( = ?auto_710239 ?auto_710243 ) ) ( not ( = ?auto_710239 ?auto_710244 ) ) ( not ( = ?auto_710240 ?auto_710241 ) ) ( not ( = ?auto_710240 ?auto_710242 ) ) ( not ( = ?auto_710240 ?auto_710243 ) ) ( not ( = ?auto_710240 ?auto_710244 ) ) ( not ( = ?auto_710241 ?auto_710242 ) ) ( not ( = ?auto_710241 ?auto_710243 ) ) ( not ( = ?auto_710241 ?auto_710244 ) ) ( not ( = ?auto_710242 ?auto_710243 ) ) ( not ( = ?auto_710242 ?auto_710244 ) ) ( not ( = ?auto_710243 ?auto_710244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_710243 ?auto_710244 )
      ( !STACK ?auto_710243 ?auto_710242 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710267 - BLOCK
      ?auto_710268 - BLOCK
      ?auto_710269 - BLOCK
      ?auto_710270 - BLOCK
      ?auto_710271 - BLOCK
      ?auto_710272 - BLOCK
      ?auto_710273 - BLOCK
    )
    :vars
    (
      ?auto_710274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710273 ?auto_710274 ) ( ON-TABLE ?auto_710267 ) ( ON ?auto_710268 ?auto_710267 ) ( ON ?auto_710269 ?auto_710268 ) ( ON ?auto_710270 ?auto_710269 ) ( ON ?auto_710271 ?auto_710270 ) ( not ( = ?auto_710267 ?auto_710268 ) ) ( not ( = ?auto_710267 ?auto_710269 ) ) ( not ( = ?auto_710267 ?auto_710270 ) ) ( not ( = ?auto_710267 ?auto_710271 ) ) ( not ( = ?auto_710267 ?auto_710272 ) ) ( not ( = ?auto_710267 ?auto_710273 ) ) ( not ( = ?auto_710267 ?auto_710274 ) ) ( not ( = ?auto_710268 ?auto_710269 ) ) ( not ( = ?auto_710268 ?auto_710270 ) ) ( not ( = ?auto_710268 ?auto_710271 ) ) ( not ( = ?auto_710268 ?auto_710272 ) ) ( not ( = ?auto_710268 ?auto_710273 ) ) ( not ( = ?auto_710268 ?auto_710274 ) ) ( not ( = ?auto_710269 ?auto_710270 ) ) ( not ( = ?auto_710269 ?auto_710271 ) ) ( not ( = ?auto_710269 ?auto_710272 ) ) ( not ( = ?auto_710269 ?auto_710273 ) ) ( not ( = ?auto_710269 ?auto_710274 ) ) ( not ( = ?auto_710270 ?auto_710271 ) ) ( not ( = ?auto_710270 ?auto_710272 ) ) ( not ( = ?auto_710270 ?auto_710273 ) ) ( not ( = ?auto_710270 ?auto_710274 ) ) ( not ( = ?auto_710271 ?auto_710272 ) ) ( not ( = ?auto_710271 ?auto_710273 ) ) ( not ( = ?auto_710271 ?auto_710274 ) ) ( not ( = ?auto_710272 ?auto_710273 ) ) ( not ( = ?auto_710272 ?auto_710274 ) ) ( not ( = ?auto_710273 ?auto_710274 ) ) ( CLEAR ?auto_710271 ) ( ON ?auto_710272 ?auto_710273 ) ( CLEAR ?auto_710272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_710267 ?auto_710268 ?auto_710269 ?auto_710270 ?auto_710271 ?auto_710272 )
      ( MAKE-7PILE ?auto_710267 ?auto_710268 ?auto_710269 ?auto_710270 ?auto_710271 ?auto_710272 ?auto_710273 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710297 - BLOCK
      ?auto_710298 - BLOCK
      ?auto_710299 - BLOCK
      ?auto_710300 - BLOCK
      ?auto_710301 - BLOCK
      ?auto_710302 - BLOCK
      ?auto_710303 - BLOCK
    )
    :vars
    (
      ?auto_710304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710303 ?auto_710304 ) ( ON-TABLE ?auto_710297 ) ( ON ?auto_710298 ?auto_710297 ) ( ON ?auto_710299 ?auto_710298 ) ( ON ?auto_710300 ?auto_710299 ) ( not ( = ?auto_710297 ?auto_710298 ) ) ( not ( = ?auto_710297 ?auto_710299 ) ) ( not ( = ?auto_710297 ?auto_710300 ) ) ( not ( = ?auto_710297 ?auto_710301 ) ) ( not ( = ?auto_710297 ?auto_710302 ) ) ( not ( = ?auto_710297 ?auto_710303 ) ) ( not ( = ?auto_710297 ?auto_710304 ) ) ( not ( = ?auto_710298 ?auto_710299 ) ) ( not ( = ?auto_710298 ?auto_710300 ) ) ( not ( = ?auto_710298 ?auto_710301 ) ) ( not ( = ?auto_710298 ?auto_710302 ) ) ( not ( = ?auto_710298 ?auto_710303 ) ) ( not ( = ?auto_710298 ?auto_710304 ) ) ( not ( = ?auto_710299 ?auto_710300 ) ) ( not ( = ?auto_710299 ?auto_710301 ) ) ( not ( = ?auto_710299 ?auto_710302 ) ) ( not ( = ?auto_710299 ?auto_710303 ) ) ( not ( = ?auto_710299 ?auto_710304 ) ) ( not ( = ?auto_710300 ?auto_710301 ) ) ( not ( = ?auto_710300 ?auto_710302 ) ) ( not ( = ?auto_710300 ?auto_710303 ) ) ( not ( = ?auto_710300 ?auto_710304 ) ) ( not ( = ?auto_710301 ?auto_710302 ) ) ( not ( = ?auto_710301 ?auto_710303 ) ) ( not ( = ?auto_710301 ?auto_710304 ) ) ( not ( = ?auto_710302 ?auto_710303 ) ) ( not ( = ?auto_710302 ?auto_710304 ) ) ( not ( = ?auto_710303 ?auto_710304 ) ) ( ON ?auto_710302 ?auto_710303 ) ( CLEAR ?auto_710300 ) ( ON ?auto_710301 ?auto_710302 ) ( CLEAR ?auto_710301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_710297 ?auto_710298 ?auto_710299 ?auto_710300 ?auto_710301 )
      ( MAKE-7PILE ?auto_710297 ?auto_710298 ?auto_710299 ?auto_710300 ?auto_710301 ?auto_710302 ?auto_710303 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710327 - BLOCK
      ?auto_710328 - BLOCK
      ?auto_710329 - BLOCK
      ?auto_710330 - BLOCK
      ?auto_710331 - BLOCK
      ?auto_710332 - BLOCK
      ?auto_710333 - BLOCK
    )
    :vars
    (
      ?auto_710334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710333 ?auto_710334 ) ( ON-TABLE ?auto_710327 ) ( ON ?auto_710328 ?auto_710327 ) ( ON ?auto_710329 ?auto_710328 ) ( not ( = ?auto_710327 ?auto_710328 ) ) ( not ( = ?auto_710327 ?auto_710329 ) ) ( not ( = ?auto_710327 ?auto_710330 ) ) ( not ( = ?auto_710327 ?auto_710331 ) ) ( not ( = ?auto_710327 ?auto_710332 ) ) ( not ( = ?auto_710327 ?auto_710333 ) ) ( not ( = ?auto_710327 ?auto_710334 ) ) ( not ( = ?auto_710328 ?auto_710329 ) ) ( not ( = ?auto_710328 ?auto_710330 ) ) ( not ( = ?auto_710328 ?auto_710331 ) ) ( not ( = ?auto_710328 ?auto_710332 ) ) ( not ( = ?auto_710328 ?auto_710333 ) ) ( not ( = ?auto_710328 ?auto_710334 ) ) ( not ( = ?auto_710329 ?auto_710330 ) ) ( not ( = ?auto_710329 ?auto_710331 ) ) ( not ( = ?auto_710329 ?auto_710332 ) ) ( not ( = ?auto_710329 ?auto_710333 ) ) ( not ( = ?auto_710329 ?auto_710334 ) ) ( not ( = ?auto_710330 ?auto_710331 ) ) ( not ( = ?auto_710330 ?auto_710332 ) ) ( not ( = ?auto_710330 ?auto_710333 ) ) ( not ( = ?auto_710330 ?auto_710334 ) ) ( not ( = ?auto_710331 ?auto_710332 ) ) ( not ( = ?auto_710331 ?auto_710333 ) ) ( not ( = ?auto_710331 ?auto_710334 ) ) ( not ( = ?auto_710332 ?auto_710333 ) ) ( not ( = ?auto_710332 ?auto_710334 ) ) ( not ( = ?auto_710333 ?auto_710334 ) ) ( ON ?auto_710332 ?auto_710333 ) ( ON ?auto_710331 ?auto_710332 ) ( CLEAR ?auto_710329 ) ( ON ?auto_710330 ?auto_710331 ) ( CLEAR ?auto_710330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_710327 ?auto_710328 ?auto_710329 ?auto_710330 )
      ( MAKE-7PILE ?auto_710327 ?auto_710328 ?auto_710329 ?auto_710330 ?auto_710331 ?auto_710332 ?auto_710333 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710357 - BLOCK
      ?auto_710358 - BLOCK
      ?auto_710359 - BLOCK
      ?auto_710360 - BLOCK
      ?auto_710361 - BLOCK
      ?auto_710362 - BLOCK
      ?auto_710363 - BLOCK
    )
    :vars
    (
      ?auto_710364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710363 ?auto_710364 ) ( ON-TABLE ?auto_710357 ) ( ON ?auto_710358 ?auto_710357 ) ( not ( = ?auto_710357 ?auto_710358 ) ) ( not ( = ?auto_710357 ?auto_710359 ) ) ( not ( = ?auto_710357 ?auto_710360 ) ) ( not ( = ?auto_710357 ?auto_710361 ) ) ( not ( = ?auto_710357 ?auto_710362 ) ) ( not ( = ?auto_710357 ?auto_710363 ) ) ( not ( = ?auto_710357 ?auto_710364 ) ) ( not ( = ?auto_710358 ?auto_710359 ) ) ( not ( = ?auto_710358 ?auto_710360 ) ) ( not ( = ?auto_710358 ?auto_710361 ) ) ( not ( = ?auto_710358 ?auto_710362 ) ) ( not ( = ?auto_710358 ?auto_710363 ) ) ( not ( = ?auto_710358 ?auto_710364 ) ) ( not ( = ?auto_710359 ?auto_710360 ) ) ( not ( = ?auto_710359 ?auto_710361 ) ) ( not ( = ?auto_710359 ?auto_710362 ) ) ( not ( = ?auto_710359 ?auto_710363 ) ) ( not ( = ?auto_710359 ?auto_710364 ) ) ( not ( = ?auto_710360 ?auto_710361 ) ) ( not ( = ?auto_710360 ?auto_710362 ) ) ( not ( = ?auto_710360 ?auto_710363 ) ) ( not ( = ?auto_710360 ?auto_710364 ) ) ( not ( = ?auto_710361 ?auto_710362 ) ) ( not ( = ?auto_710361 ?auto_710363 ) ) ( not ( = ?auto_710361 ?auto_710364 ) ) ( not ( = ?auto_710362 ?auto_710363 ) ) ( not ( = ?auto_710362 ?auto_710364 ) ) ( not ( = ?auto_710363 ?auto_710364 ) ) ( ON ?auto_710362 ?auto_710363 ) ( ON ?auto_710361 ?auto_710362 ) ( ON ?auto_710360 ?auto_710361 ) ( CLEAR ?auto_710358 ) ( ON ?auto_710359 ?auto_710360 ) ( CLEAR ?auto_710359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_710357 ?auto_710358 ?auto_710359 )
      ( MAKE-7PILE ?auto_710357 ?auto_710358 ?auto_710359 ?auto_710360 ?auto_710361 ?auto_710362 ?auto_710363 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710387 - BLOCK
      ?auto_710388 - BLOCK
      ?auto_710389 - BLOCK
      ?auto_710390 - BLOCK
      ?auto_710391 - BLOCK
      ?auto_710392 - BLOCK
      ?auto_710393 - BLOCK
    )
    :vars
    (
      ?auto_710394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710393 ?auto_710394 ) ( ON-TABLE ?auto_710387 ) ( not ( = ?auto_710387 ?auto_710388 ) ) ( not ( = ?auto_710387 ?auto_710389 ) ) ( not ( = ?auto_710387 ?auto_710390 ) ) ( not ( = ?auto_710387 ?auto_710391 ) ) ( not ( = ?auto_710387 ?auto_710392 ) ) ( not ( = ?auto_710387 ?auto_710393 ) ) ( not ( = ?auto_710387 ?auto_710394 ) ) ( not ( = ?auto_710388 ?auto_710389 ) ) ( not ( = ?auto_710388 ?auto_710390 ) ) ( not ( = ?auto_710388 ?auto_710391 ) ) ( not ( = ?auto_710388 ?auto_710392 ) ) ( not ( = ?auto_710388 ?auto_710393 ) ) ( not ( = ?auto_710388 ?auto_710394 ) ) ( not ( = ?auto_710389 ?auto_710390 ) ) ( not ( = ?auto_710389 ?auto_710391 ) ) ( not ( = ?auto_710389 ?auto_710392 ) ) ( not ( = ?auto_710389 ?auto_710393 ) ) ( not ( = ?auto_710389 ?auto_710394 ) ) ( not ( = ?auto_710390 ?auto_710391 ) ) ( not ( = ?auto_710390 ?auto_710392 ) ) ( not ( = ?auto_710390 ?auto_710393 ) ) ( not ( = ?auto_710390 ?auto_710394 ) ) ( not ( = ?auto_710391 ?auto_710392 ) ) ( not ( = ?auto_710391 ?auto_710393 ) ) ( not ( = ?auto_710391 ?auto_710394 ) ) ( not ( = ?auto_710392 ?auto_710393 ) ) ( not ( = ?auto_710392 ?auto_710394 ) ) ( not ( = ?auto_710393 ?auto_710394 ) ) ( ON ?auto_710392 ?auto_710393 ) ( ON ?auto_710391 ?auto_710392 ) ( ON ?auto_710390 ?auto_710391 ) ( ON ?auto_710389 ?auto_710390 ) ( CLEAR ?auto_710387 ) ( ON ?auto_710388 ?auto_710389 ) ( CLEAR ?auto_710388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_710387 ?auto_710388 )
      ( MAKE-7PILE ?auto_710387 ?auto_710388 ?auto_710389 ?auto_710390 ?auto_710391 ?auto_710392 ?auto_710393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_710417 - BLOCK
      ?auto_710418 - BLOCK
      ?auto_710419 - BLOCK
      ?auto_710420 - BLOCK
      ?auto_710421 - BLOCK
      ?auto_710422 - BLOCK
      ?auto_710423 - BLOCK
    )
    :vars
    (
      ?auto_710424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710423 ?auto_710424 ) ( not ( = ?auto_710417 ?auto_710418 ) ) ( not ( = ?auto_710417 ?auto_710419 ) ) ( not ( = ?auto_710417 ?auto_710420 ) ) ( not ( = ?auto_710417 ?auto_710421 ) ) ( not ( = ?auto_710417 ?auto_710422 ) ) ( not ( = ?auto_710417 ?auto_710423 ) ) ( not ( = ?auto_710417 ?auto_710424 ) ) ( not ( = ?auto_710418 ?auto_710419 ) ) ( not ( = ?auto_710418 ?auto_710420 ) ) ( not ( = ?auto_710418 ?auto_710421 ) ) ( not ( = ?auto_710418 ?auto_710422 ) ) ( not ( = ?auto_710418 ?auto_710423 ) ) ( not ( = ?auto_710418 ?auto_710424 ) ) ( not ( = ?auto_710419 ?auto_710420 ) ) ( not ( = ?auto_710419 ?auto_710421 ) ) ( not ( = ?auto_710419 ?auto_710422 ) ) ( not ( = ?auto_710419 ?auto_710423 ) ) ( not ( = ?auto_710419 ?auto_710424 ) ) ( not ( = ?auto_710420 ?auto_710421 ) ) ( not ( = ?auto_710420 ?auto_710422 ) ) ( not ( = ?auto_710420 ?auto_710423 ) ) ( not ( = ?auto_710420 ?auto_710424 ) ) ( not ( = ?auto_710421 ?auto_710422 ) ) ( not ( = ?auto_710421 ?auto_710423 ) ) ( not ( = ?auto_710421 ?auto_710424 ) ) ( not ( = ?auto_710422 ?auto_710423 ) ) ( not ( = ?auto_710422 ?auto_710424 ) ) ( not ( = ?auto_710423 ?auto_710424 ) ) ( ON ?auto_710422 ?auto_710423 ) ( ON ?auto_710421 ?auto_710422 ) ( ON ?auto_710420 ?auto_710421 ) ( ON ?auto_710419 ?auto_710420 ) ( ON ?auto_710418 ?auto_710419 ) ( ON ?auto_710417 ?auto_710418 ) ( CLEAR ?auto_710417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_710417 )
      ( MAKE-7PILE ?auto_710417 ?auto_710418 ?auto_710419 ?auto_710420 ?auto_710421 ?auto_710422 ?auto_710423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710448 - BLOCK
      ?auto_710449 - BLOCK
      ?auto_710450 - BLOCK
      ?auto_710451 - BLOCK
      ?auto_710452 - BLOCK
      ?auto_710453 - BLOCK
      ?auto_710454 - BLOCK
      ?auto_710455 - BLOCK
    )
    :vars
    (
      ?auto_710456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_710454 ) ( ON ?auto_710455 ?auto_710456 ) ( CLEAR ?auto_710455 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_710448 ) ( ON ?auto_710449 ?auto_710448 ) ( ON ?auto_710450 ?auto_710449 ) ( ON ?auto_710451 ?auto_710450 ) ( ON ?auto_710452 ?auto_710451 ) ( ON ?auto_710453 ?auto_710452 ) ( ON ?auto_710454 ?auto_710453 ) ( not ( = ?auto_710448 ?auto_710449 ) ) ( not ( = ?auto_710448 ?auto_710450 ) ) ( not ( = ?auto_710448 ?auto_710451 ) ) ( not ( = ?auto_710448 ?auto_710452 ) ) ( not ( = ?auto_710448 ?auto_710453 ) ) ( not ( = ?auto_710448 ?auto_710454 ) ) ( not ( = ?auto_710448 ?auto_710455 ) ) ( not ( = ?auto_710448 ?auto_710456 ) ) ( not ( = ?auto_710449 ?auto_710450 ) ) ( not ( = ?auto_710449 ?auto_710451 ) ) ( not ( = ?auto_710449 ?auto_710452 ) ) ( not ( = ?auto_710449 ?auto_710453 ) ) ( not ( = ?auto_710449 ?auto_710454 ) ) ( not ( = ?auto_710449 ?auto_710455 ) ) ( not ( = ?auto_710449 ?auto_710456 ) ) ( not ( = ?auto_710450 ?auto_710451 ) ) ( not ( = ?auto_710450 ?auto_710452 ) ) ( not ( = ?auto_710450 ?auto_710453 ) ) ( not ( = ?auto_710450 ?auto_710454 ) ) ( not ( = ?auto_710450 ?auto_710455 ) ) ( not ( = ?auto_710450 ?auto_710456 ) ) ( not ( = ?auto_710451 ?auto_710452 ) ) ( not ( = ?auto_710451 ?auto_710453 ) ) ( not ( = ?auto_710451 ?auto_710454 ) ) ( not ( = ?auto_710451 ?auto_710455 ) ) ( not ( = ?auto_710451 ?auto_710456 ) ) ( not ( = ?auto_710452 ?auto_710453 ) ) ( not ( = ?auto_710452 ?auto_710454 ) ) ( not ( = ?auto_710452 ?auto_710455 ) ) ( not ( = ?auto_710452 ?auto_710456 ) ) ( not ( = ?auto_710453 ?auto_710454 ) ) ( not ( = ?auto_710453 ?auto_710455 ) ) ( not ( = ?auto_710453 ?auto_710456 ) ) ( not ( = ?auto_710454 ?auto_710455 ) ) ( not ( = ?auto_710454 ?auto_710456 ) ) ( not ( = ?auto_710455 ?auto_710456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_710455 ?auto_710456 )
      ( !STACK ?auto_710455 ?auto_710454 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710482 - BLOCK
      ?auto_710483 - BLOCK
      ?auto_710484 - BLOCK
      ?auto_710485 - BLOCK
      ?auto_710486 - BLOCK
      ?auto_710487 - BLOCK
      ?auto_710488 - BLOCK
      ?auto_710489 - BLOCK
    )
    :vars
    (
      ?auto_710490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710489 ?auto_710490 ) ( ON-TABLE ?auto_710482 ) ( ON ?auto_710483 ?auto_710482 ) ( ON ?auto_710484 ?auto_710483 ) ( ON ?auto_710485 ?auto_710484 ) ( ON ?auto_710486 ?auto_710485 ) ( ON ?auto_710487 ?auto_710486 ) ( not ( = ?auto_710482 ?auto_710483 ) ) ( not ( = ?auto_710482 ?auto_710484 ) ) ( not ( = ?auto_710482 ?auto_710485 ) ) ( not ( = ?auto_710482 ?auto_710486 ) ) ( not ( = ?auto_710482 ?auto_710487 ) ) ( not ( = ?auto_710482 ?auto_710488 ) ) ( not ( = ?auto_710482 ?auto_710489 ) ) ( not ( = ?auto_710482 ?auto_710490 ) ) ( not ( = ?auto_710483 ?auto_710484 ) ) ( not ( = ?auto_710483 ?auto_710485 ) ) ( not ( = ?auto_710483 ?auto_710486 ) ) ( not ( = ?auto_710483 ?auto_710487 ) ) ( not ( = ?auto_710483 ?auto_710488 ) ) ( not ( = ?auto_710483 ?auto_710489 ) ) ( not ( = ?auto_710483 ?auto_710490 ) ) ( not ( = ?auto_710484 ?auto_710485 ) ) ( not ( = ?auto_710484 ?auto_710486 ) ) ( not ( = ?auto_710484 ?auto_710487 ) ) ( not ( = ?auto_710484 ?auto_710488 ) ) ( not ( = ?auto_710484 ?auto_710489 ) ) ( not ( = ?auto_710484 ?auto_710490 ) ) ( not ( = ?auto_710485 ?auto_710486 ) ) ( not ( = ?auto_710485 ?auto_710487 ) ) ( not ( = ?auto_710485 ?auto_710488 ) ) ( not ( = ?auto_710485 ?auto_710489 ) ) ( not ( = ?auto_710485 ?auto_710490 ) ) ( not ( = ?auto_710486 ?auto_710487 ) ) ( not ( = ?auto_710486 ?auto_710488 ) ) ( not ( = ?auto_710486 ?auto_710489 ) ) ( not ( = ?auto_710486 ?auto_710490 ) ) ( not ( = ?auto_710487 ?auto_710488 ) ) ( not ( = ?auto_710487 ?auto_710489 ) ) ( not ( = ?auto_710487 ?auto_710490 ) ) ( not ( = ?auto_710488 ?auto_710489 ) ) ( not ( = ?auto_710488 ?auto_710490 ) ) ( not ( = ?auto_710489 ?auto_710490 ) ) ( CLEAR ?auto_710487 ) ( ON ?auto_710488 ?auto_710489 ) ( CLEAR ?auto_710488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_710482 ?auto_710483 ?auto_710484 ?auto_710485 ?auto_710486 ?auto_710487 ?auto_710488 )
      ( MAKE-8PILE ?auto_710482 ?auto_710483 ?auto_710484 ?auto_710485 ?auto_710486 ?auto_710487 ?auto_710488 ?auto_710489 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710516 - BLOCK
      ?auto_710517 - BLOCK
      ?auto_710518 - BLOCK
      ?auto_710519 - BLOCK
      ?auto_710520 - BLOCK
      ?auto_710521 - BLOCK
      ?auto_710522 - BLOCK
      ?auto_710523 - BLOCK
    )
    :vars
    (
      ?auto_710524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710523 ?auto_710524 ) ( ON-TABLE ?auto_710516 ) ( ON ?auto_710517 ?auto_710516 ) ( ON ?auto_710518 ?auto_710517 ) ( ON ?auto_710519 ?auto_710518 ) ( ON ?auto_710520 ?auto_710519 ) ( not ( = ?auto_710516 ?auto_710517 ) ) ( not ( = ?auto_710516 ?auto_710518 ) ) ( not ( = ?auto_710516 ?auto_710519 ) ) ( not ( = ?auto_710516 ?auto_710520 ) ) ( not ( = ?auto_710516 ?auto_710521 ) ) ( not ( = ?auto_710516 ?auto_710522 ) ) ( not ( = ?auto_710516 ?auto_710523 ) ) ( not ( = ?auto_710516 ?auto_710524 ) ) ( not ( = ?auto_710517 ?auto_710518 ) ) ( not ( = ?auto_710517 ?auto_710519 ) ) ( not ( = ?auto_710517 ?auto_710520 ) ) ( not ( = ?auto_710517 ?auto_710521 ) ) ( not ( = ?auto_710517 ?auto_710522 ) ) ( not ( = ?auto_710517 ?auto_710523 ) ) ( not ( = ?auto_710517 ?auto_710524 ) ) ( not ( = ?auto_710518 ?auto_710519 ) ) ( not ( = ?auto_710518 ?auto_710520 ) ) ( not ( = ?auto_710518 ?auto_710521 ) ) ( not ( = ?auto_710518 ?auto_710522 ) ) ( not ( = ?auto_710518 ?auto_710523 ) ) ( not ( = ?auto_710518 ?auto_710524 ) ) ( not ( = ?auto_710519 ?auto_710520 ) ) ( not ( = ?auto_710519 ?auto_710521 ) ) ( not ( = ?auto_710519 ?auto_710522 ) ) ( not ( = ?auto_710519 ?auto_710523 ) ) ( not ( = ?auto_710519 ?auto_710524 ) ) ( not ( = ?auto_710520 ?auto_710521 ) ) ( not ( = ?auto_710520 ?auto_710522 ) ) ( not ( = ?auto_710520 ?auto_710523 ) ) ( not ( = ?auto_710520 ?auto_710524 ) ) ( not ( = ?auto_710521 ?auto_710522 ) ) ( not ( = ?auto_710521 ?auto_710523 ) ) ( not ( = ?auto_710521 ?auto_710524 ) ) ( not ( = ?auto_710522 ?auto_710523 ) ) ( not ( = ?auto_710522 ?auto_710524 ) ) ( not ( = ?auto_710523 ?auto_710524 ) ) ( ON ?auto_710522 ?auto_710523 ) ( CLEAR ?auto_710520 ) ( ON ?auto_710521 ?auto_710522 ) ( CLEAR ?auto_710521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_710516 ?auto_710517 ?auto_710518 ?auto_710519 ?auto_710520 ?auto_710521 )
      ( MAKE-8PILE ?auto_710516 ?auto_710517 ?auto_710518 ?auto_710519 ?auto_710520 ?auto_710521 ?auto_710522 ?auto_710523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710550 - BLOCK
      ?auto_710551 - BLOCK
      ?auto_710552 - BLOCK
      ?auto_710553 - BLOCK
      ?auto_710554 - BLOCK
      ?auto_710555 - BLOCK
      ?auto_710556 - BLOCK
      ?auto_710557 - BLOCK
    )
    :vars
    (
      ?auto_710558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710557 ?auto_710558 ) ( ON-TABLE ?auto_710550 ) ( ON ?auto_710551 ?auto_710550 ) ( ON ?auto_710552 ?auto_710551 ) ( ON ?auto_710553 ?auto_710552 ) ( not ( = ?auto_710550 ?auto_710551 ) ) ( not ( = ?auto_710550 ?auto_710552 ) ) ( not ( = ?auto_710550 ?auto_710553 ) ) ( not ( = ?auto_710550 ?auto_710554 ) ) ( not ( = ?auto_710550 ?auto_710555 ) ) ( not ( = ?auto_710550 ?auto_710556 ) ) ( not ( = ?auto_710550 ?auto_710557 ) ) ( not ( = ?auto_710550 ?auto_710558 ) ) ( not ( = ?auto_710551 ?auto_710552 ) ) ( not ( = ?auto_710551 ?auto_710553 ) ) ( not ( = ?auto_710551 ?auto_710554 ) ) ( not ( = ?auto_710551 ?auto_710555 ) ) ( not ( = ?auto_710551 ?auto_710556 ) ) ( not ( = ?auto_710551 ?auto_710557 ) ) ( not ( = ?auto_710551 ?auto_710558 ) ) ( not ( = ?auto_710552 ?auto_710553 ) ) ( not ( = ?auto_710552 ?auto_710554 ) ) ( not ( = ?auto_710552 ?auto_710555 ) ) ( not ( = ?auto_710552 ?auto_710556 ) ) ( not ( = ?auto_710552 ?auto_710557 ) ) ( not ( = ?auto_710552 ?auto_710558 ) ) ( not ( = ?auto_710553 ?auto_710554 ) ) ( not ( = ?auto_710553 ?auto_710555 ) ) ( not ( = ?auto_710553 ?auto_710556 ) ) ( not ( = ?auto_710553 ?auto_710557 ) ) ( not ( = ?auto_710553 ?auto_710558 ) ) ( not ( = ?auto_710554 ?auto_710555 ) ) ( not ( = ?auto_710554 ?auto_710556 ) ) ( not ( = ?auto_710554 ?auto_710557 ) ) ( not ( = ?auto_710554 ?auto_710558 ) ) ( not ( = ?auto_710555 ?auto_710556 ) ) ( not ( = ?auto_710555 ?auto_710557 ) ) ( not ( = ?auto_710555 ?auto_710558 ) ) ( not ( = ?auto_710556 ?auto_710557 ) ) ( not ( = ?auto_710556 ?auto_710558 ) ) ( not ( = ?auto_710557 ?auto_710558 ) ) ( ON ?auto_710556 ?auto_710557 ) ( ON ?auto_710555 ?auto_710556 ) ( CLEAR ?auto_710553 ) ( ON ?auto_710554 ?auto_710555 ) ( CLEAR ?auto_710554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_710550 ?auto_710551 ?auto_710552 ?auto_710553 ?auto_710554 )
      ( MAKE-8PILE ?auto_710550 ?auto_710551 ?auto_710552 ?auto_710553 ?auto_710554 ?auto_710555 ?auto_710556 ?auto_710557 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710584 - BLOCK
      ?auto_710585 - BLOCK
      ?auto_710586 - BLOCK
      ?auto_710587 - BLOCK
      ?auto_710588 - BLOCK
      ?auto_710589 - BLOCK
      ?auto_710590 - BLOCK
      ?auto_710591 - BLOCK
    )
    :vars
    (
      ?auto_710592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710591 ?auto_710592 ) ( ON-TABLE ?auto_710584 ) ( ON ?auto_710585 ?auto_710584 ) ( ON ?auto_710586 ?auto_710585 ) ( not ( = ?auto_710584 ?auto_710585 ) ) ( not ( = ?auto_710584 ?auto_710586 ) ) ( not ( = ?auto_710584 ?auto_710587 ) ) ( not ( = ?auto_710584 ?auto_710588 ) ) ( not ( = ?auto_710584 ?auto_710589 ) ) ( not ( = ?auto_710584 ?auto_710590 ) ) ( not ( = ?auto_710584 ?auto_710591 ) ) ( not ( = ?auto_710584 ?auto_710592 ) ) ( not ( = ?auto_710585 ?auto_710586 ) ) ( not ( = ?auto_710585 ?auto_710587 ) ) ( not ( = ?auto_710585 ?auto_710588 ) ) ( not ( = ?auto_710585 ?auto_710589 ) ) ( not ( = ?auto_710585 ?auto_710590 ) ) ( not ( = ?auto_710585 ?auto_710591 ) ) ( not ( = ?auto_710585 ?auto_710592 ) ) ( not ( = ?auto_710586 ?auto_710587 ) ) ( not ( = ?auto_710586 ?auto_710588 ) ) ( not ( = ?auto_710586 ?auto_710589 ) ) ( not ( = ?auto_710586 ?auto_710590 ) ) ( not ( = ?auto_710586 ?auto_710591 ) ) ( not ( = ?auto_710586 ?auto_710592 ) ) ( not ( = ?auto_710587 ?auto_710588 ) ) ( not ( = ?auto_710587 ?auto_710589 ) ) ( not ( = ?auto_710587 ?auto_710590 ) ) ( not ( = ?auto_710587 ?auto_710591 ) ) ( not ( = ?auto_710587 ?auto_710592 ) ) ( not ( = ?auto_710588 ?auto_710589 ) ) ( not ( = ?auto_710588 ?auto_710590 ) ) ( not ( = ?auto_710588 ?auto_710591 ) ) ( not ( = ?auto_710588 ?auto_710592 ) ) ( not ( = ?auto_710589 ?auto_710590 ) ) ( not ( = ?auto_710589 ?auto_710591 ) ) ( not ( = ?auto_710589 ?auto_710592 ) ) ( not ( = ?auto_710590 ?auto_710591 ) ) ( not ( = ?auto_710590 ?auto_710592 ) ) ( not ( = ?auto_710591 ?auto_710592 ) ) ( ON ?auto_710590 ?auto_710591 ) ( ON ?auto_710589 ?auto_710590 ) ( ON ?auto_710588 ?auto_710589 ) ( CLEAR ?auto_710586 ) ( ON ?auto_710587 ?auto_710588 ) ( CLEAR ?auto_710587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_710584 ?auto_710585 ?auto_710586 ?auto_710587 )
      ( MAKE-8PILE ?auto_710584 ?auto_710585 ?auto_710586 ?auto_710587 ?auto_710588 ?auto_710589 ?auto_710590 ?auto_710591 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710618 - BLOCK
      ?auto_710619 - BLOCK
      ?auto_710620 - BLOCK
      ?auto_710621 - BLOCK
      ?auto_710622 - BLOCK
      ?auto_710623 - BLOCK
      ?auto_710624 - BLOCK
      ?auto_710625 - BLOCK
    )
    :vars
    (
      ?auto_710626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710625 ?auto_710626 ) ( ON-TABLE ?auto_710618 ) ( ON ?auto_710619 ?auto_710618 ) ( not ( = ?auto_710618 ?auto_710619 ) ) ( not ( = ?auto_710618 ?auto_710620 ) ) ( not ( = ?auto_710618 ?auto_710621 ) ) ( not ( = ?auto_710618 ?auto_710622 ) ) ( not ( = ?auto_710618 ?auto_710623 ) ) ( not ( = ?auto_710618 ?auto_710624 ) ) ( not ( = ?auto_710618 ?auto_710625 ) ) ( not ( = ?auto_710618 ?auto_710626 ) ) ( not ( = ?auto_710619 ?auto_710620 ) ) ( not ( = ?auto_710619 ?auto_710621 ) ) ( not ( = ?auto_710619 ?auto_710622 ) ) ( not ( = ?auto_710619 ?auto_710623 ) ) ( not ( = ?auto_710619 ?auto_710624 ) ) ( not ( = ?auto_710619 ?auto_710625 ) ) ( not ( = ?auto_710619 ?auto_710626 ) ) ( not ( = ?auto_710620 ?auto_710621 ) ) ( not ( = ?auto_710620 ?auto_710622 ) ) ( not ( = ?auto_710620 ?auto_710623 ) ) ( not ( = ?auto_710620 ?auto_710624 ) ) ( not ( = ?auto_710620 ?auto_710625 ) ) ( not ( = ?auto_710620 ?auto_710626 ) ) ( not ( = ?auto_710621 ?auto_710622 ) ) ( not ( = ?auto_710621 ?auto_710623 ) ) ( not ( = ?auto_710621 ?auto_710624 ) ) ( not ( = ?auto_710621 ?auto_710625 ) ) ( not ( = ?auto_710621 ?auto_710626 ) ) ( not ( = ?auto_710622 ?auto_710623 ) ) ( not ( = ?auto_710622 ?auto_710624 ) ) ( not ( = ?auto_710622 ?auto_710625 ) ) ( not ( = ?auto_710622 ?auto_710626 ) ) ( not ( = ?auto_710623 ?auto_710624 ) ) ( not ( = ?auto_710623 ?auto_710625 ) ) ( not ( = ?auto_710623 ?auto_710626 ) ) ( not ( = ?auto_710624 ?auto_710625 ) ) ( not ( = ?auto_710624 ?auto_710626 ) ) ( not ( = ?auto_710625 ?auto_710626 ) ) ( ON ?auto_710624 ?auto_710625 ) ( ON ?auto_710623 ?auto_710624 ) ( ON ?auto_710622 ?auto_710623 ) ( ON ?auto_710621 ?auto_710622 ) ( CLEAR ?auto_710619 ) ( ON ?auto_710620 ?auto_710621 ) ( CLEAR ?auto_710620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_710618 ?auto_710619 ?auto_710620 )
      ( MAKE-8PILE ?auto_710618 ?auto_710619 ?auto_710620 ?auto_710621 ?auto_710622 ?auto_710623 ?auto_710624 ?auto_710625 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710652 - BLOCK
      ?auto_710653 - BLOCK
      ?auto_710654 - BLOCK
      ?auto_710655 - BLOCK
      ?auto_710656 - BLOCK
      ?auto_710657 - BLOCK
      ?auto_710658 - BLOCK
      ?auto_710659 - BLOCK
    )
    :vars
    (
      ?auto_710660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710659 ?auto_710660 ) ( ON-TABLE ?auto_710652 ) ( not ( = ?auto_710652 ?auto_710653 ) ) ( not ( = ?auto_710652 ?auto_710654 ) ) ( not ( = ?auto_710652 ?auto_710655 ) ) ( not ( = ?auto_710652 ?auto_710656 ) ) ( not ( = ?auto_710652 ?auto_710657 ) ) ( not ( = ?auto_710652 ?auto_710658 ) ) ( not ( = ?auto_710652 ?auto_710659 ) ) ( not ( = ?auto_710652 ?auto_710660 ) ) ( not ( = ?auto_710653 ?auto_710654 ) ) ( not ( = ?auto_710653 ?auto_710655 ) ) ( not ( = ?auto_710653 ?auto_710656 ) ) ( not ( = ?auto_710653 ?auto_710657 ) ) ( not ( = ?auto_710653 ?auto_710658 ) ) ( not ( = ?auto_710653 ?auto_710659 ) ) ( not ( = ?auto_710653 ?auto_710660 ) ) ( not ( = ?auto_710654 ?auto_710655 ) ) ( not ( = ?auto_710654 ?auto_710656 ) ) ( not ( = ?auto_710654 ?auto_710657 ) ) ( not ( = ?auto_710654 ?auto_710658 ) ) ( not ( = ?auto_710654 ?auto_710659 ) ) ( not ( = ?auto_710654 ?auto_710660 ) ) ( not ( = ?auto_710655 ?auto_710656 ) ) ( not ( = ?auto_710655 ?auto_710657 ) ) ( not ( = ?auto_710655 ?auto_710658 ) ) ( not ( = ?auto_710655 ?auto_710659 ) ) ( not ( = ?auto_710655 ?auto_710660 ) ) ( not ( = ?auto_710656 ?auto_710657 ) ) ( not ( = ?auto_710656 ?auto_710658 ) ) ( not ( = ?auto_710656 ?auto_710659 ) ) ( not ( = ?auto_710656 ?auto_710660 ) ) ( not ( = ?auto_710657 ?auto_710658 ) ) ( not ( = ?auto_710657 ?auto_710659 ) ) ( not ( = ?auto_710657 ?auto_710660 ) ) ( not ( = ?auto_710658 ?auto_710659 ) ) ( not ( = ?auto_710658 ?auto_710660 ) ) ( not ( = ?auto_710659 ?auto_710660 ) ) ( ON ?auto_710658 ?auto_710659 ) ( ON ?auto_710657 ?auto_710658 ) ( ON ?auto_710656 ?auto_710657 ) ( ON ?auto_710655 ?auto_710656 ) ( ON ?auto_710654 ?auto_710655 ) ( CLEAR ?auto_710652 ) ( ON ?auto_710653 ?auto_710654 ) ( CLEAR ?auto_710653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_710652 ?auto_710653 )
      ( MAKE-8PILE ?auto_710652 ?auto_710653 ?auto_710654 ?auto_710655 ?auto_710656 ?auto_710657 ?auto_710658 ?auto_710659 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_710686 - BLOCK
      ?auto_710687 - BLOCK
      ?auto_710688 - BLOCK
      ?auto_710689 - BLOCK
      ?auto_710690 - BLOCK
      ?auto_710691 - BLOCK
      ?auto_710692 - BLOCK
      ?auto_710693 - BLOCK
    )
    :vars
    (
      ?auto_710694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710693 ?auto_710694 ) ( not ( = ?auto_710686 ?auto_710687 ) ) ( not ( = ?auto_710686 ?auto_710688 ) ) ( not ( = ?auto_710686 ?auto_710689 ) ) ( not ( = ?auto_710686 ?auto_710690 ) ) ( not ( = ?auto_710686 ?auto_710691 ) ) ( not ( = ?auto_710686 ?auto_710692 ) ) ( not ( = ?auto_710686 ?auto_710693 ) ) ( not ( = ?auto_710686 ?auto_710694 ) ) ( not ( = ?auto_710687 ?auto_710688 ) ) ( not ( = ?auto_710687 ?auto_710689 ) ) ( not ( = ?auto_710687 ?auto_710690 ) ) ( not ( = ?auto_710687 ?auto_710691 ) ) ( not ( = ?auto_710687 ?auto_710692 ) ) ( not ( = ?auto_710687 ?auto_710693 ) ) ( not ( = ?auto_710687 ?auto_710694 ) ) ( not ( = ?auto_710688 ?auto_710689 ) ) ( not ( = ?auto_710688 ?auto_710690 ) ) ( not ( = ?auto_710688 ?auto_710691 ) ) ( not ( = ?auto_710688 ?auto_710692 ) ) ( not ( = ?auto_710688 ?auto_710693 ) ) ( not ( = ?auto_710688 ?auto_710694 ) ) ( not ( = ?auto_710689 ?auto_710690 ) ) ( not ( = ?auto_710689 ?auto_710691 ) ) ( not ( = ?auto_710689 ?auto_710692 ) ) ( not ( = ?auto_710689 ?auto_710693 ) ) ( not ( = ?auto_710689 ?auto_710694 ) ) ( not ( = ?auto_710690 ?auto_710691 ) ) ( not ( = ?auto_710690 ?auto_710692 ) ) ( not ( = ?auto_710690 ?auto_710693 ) ) ( not ( = ?auto_710690 ?auto_710694 ) ) ( not ( = ?auto_710691 ?auto_710692 ) ) ( not ( = ?auto_710691 ?auto_710693 ) ) ( not ( = ?auto_710691 ?auto_710694 ) ) ( not ( = ?auto_710692 ?auto_710693 ) ) ( not ( = ?auto_710692 ?auto_710694 ) ) ( not ( = ?auto_710693 ?auto_710694 ) ) ( ON ?auto_710692 ?auto_710693 ) ( ON ?auto_710691 ?auto_710692 ) ( ON ?auto_710690 ?auto_710691 ) ( ON ?auto_710689 ?auto_710690 ) ( ON ?auto_710688 ?auto_710689 ) ( ON ?auto_710687 ?auto_710688 ) ( ON ?auto_710686 ?auto_710687 ) ( CLEAR ?auto_710686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_710686 )
      ( MAKE-8PILE ?auto_710686 ?auto_710687 ?auto_710688 ?auto_710689 ?auto_710690 ?auto_710691 ?auto_710692 ?auto_710693 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710721 - BLOCK
      ?auto_710722 - BLOCK
      ?auto_710723 - BLOCK
      ?auto_710724 - BLOCK
      ?auto_710725 - BLOCK
      ?auto_710726 - BLOCK
      ?auto_710727 - BLOCK
      ?auto_710728 - BLOCK
      ?auto_710729 - BLOCK
    )
    :vars
    (
      ?auto_710730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_710728 ) ( ON ?auto_710729 ?auto_710730 ) ( CLEAR ?auto_710729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_710721 ) ( ON ?auto_710722 ?auto_710721 ) ( ON ?auto_710723 ?auto_710722 ) ( ON ?auto_710724 ?auto_710723 ) ( ON ?auto_710725 ?auto_710724 ) ( ON ?auto_710726 ?auto_710725 ) ( ON ?auto_710727 ?auto_710726 ) ( ON ?auto_710728 ?auto_710727 ) ( not ( = ?auto_710721 ?auto_710722 ) ) ( not ( = ?auto_710721 ?auto_710723 ) ) ( not ( = ?auto_710721 ?auto_710724 ) ) ( not ( = ?auto_710721 ?auto_710725 ) ) ( not ( = ?auto_710721 ?auto_710726 ) ) ( not ( = ?auto_710721 ?auto_710727 ) ) ( not ( = ?auto_710721 ?auto_710728 ) ) ( not ( = ?auto_710721 ?auto_710729 ) ) ( not ( = ?auto_710721 ?auto_710730 ) ) ( not ( = ?auto_710722 ?auto_710723 ) ) ( not ( = ?auto_710722 ?auto_710724 ) ) ( not ( = ?auto_710722 ?auto_710725 ) ) ( not ( = ?auto_710722 ?auto_710726 ) ) ( not ( = ?auto_710722 ?auto_710727 ) ) ( not ( = ?auto_710722 ?auto_710728 ) ) ( not ( = ?auto_710722 ?auto_710729 ) ) ( not ( = ?auto_710722 ?auto_710730 ) ) ( not ( = ?auto_710723 ?auto_710724 ) ) ( not ( = ?auto_710723 ?auto_710725 ) ) ( not ( = ?auto_710723 ?auto_710726 ) ) ( not ( = ?auto_710723 ?auto_710727 ) ) ( not ( = ?auto_710723 ?auto_710728 ) ) ( not ( = ?auto_710723 ?auto_710729 ) ) ( not ( = ?auto_710723 ?auto_710730 ) ) ( not ( = ?auto_710724 ?auto_710725 ) ) ( not ( = ?auto_710724 ?auto_710726 ) ) ( not ( = ?auto_710724 ?auto_710727 ) ) ( not ( = ?auto_710724 ?auto_710728 ) ) ( not ( = ?auto_710724 ?auto_710729 ) ) ( not ( = ?auto_710724 ?auto_710730 ) ) ( not ( = ?auto_710725 ?auto_710726 ) ) ( not ( = ?auto_710725 ?auto_710727 ) ) ( not ( = ?auto_710725 ?auto_710728 ) ) ( not ( = ?auto_710725 ?auto_710729 ) ) ( not ( = ?auto_710725 ?auto_710730 ) ) ( not ( = ?auto_710726 ?auto_710727 ) ) ( not ( = ?auto_710726 ?auto_710728 ) ) ( not ( = ?auto_710726 ?auto_710729 ) ) ( not ( = ?auto_710726 ?auto_710730 ) ) ( not ( = ?auto_710727 ?auto_710728 ) ) ( not ( = ?auto_710727 ?auto_710729 ) ) ( not ( = ?auto_710727 ?auto_710730 ) ) ( not ( = ?auto_710728 ?auto_710729 ) ) ( not ( = ?auto_710728 ?auto_710730 ) ) ( not ( = ?auto_710729 ?auto_710730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_710729 ?auto_710730 )
      ( !STACK ?auto_710729 ?auto_710728 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710759 - BLOCK
      ?auto_710760 - BLOCK
      ?auto_710761 - BLOCK
      ?auto_710762 - BLOCK
      ?auto_710763 - BLOCK
      ?auto_710764 - BLOCK
      ?auto_710765 - BLOCK
      ?auto_710766 - BLOCK
      ?auto_710767 - BLOCK
    )
    :vars
    (
      ?auto_710768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710767 ?auto_710768 ) ( ON-TABLE ?auto_710759 ) ( ON ?auto_710760 ?auto_710759 ) ( ON ?auto_710761 ?auto_710760 ) ( ON ?auto_710762 ?auto_710761 ) ( ON ?auto_710763 ?auto_710762 ) ( ON ?auto_710764 ?auto_710763 ) ( ON ?auto_710765 ?auto_710764 ) ( not ( = ?auto_710759 ?auto_710760 ) ) ( not ( = ?auto_710759 ?auto_710761 ) ) ( not ( = ?auto_710759 ?auto_710762 ) ) ( not ( = ?auto_710759 ?auto_710763 ) ) ( not ( = ?auto_710759 ?auto_710764 ) ) ( not ( = ?auto_710759 ?auto_710765 ) ) ( not ( = ?auto_710759 ?auto_710766 ) ) ( not ( = ?auto_710759 ?auto_710767 ) ) ( not ( = ?auto_710759 ?auto_710768 ) ) ( not ( = ?auto_710760 ?auto_710761 ) ) ( not ( = ?auto_710760 ?auto_710762 ) ) ( not ( = ?auto_710760 ?auto_710763 ) ) ( not ( = ?auto_710760 ?auto_710764 ) ) ( not ( = ?auto_710760 ?auto_710765 ) ) ( not ( = ?auto_710760 ?auto_710766 ) ) ( not ( = ?auto_710760 ?auto_710767 ) ) ( not ( = ?auto_710760 ?auto_710768 ) ) ( not ( = ?auto_710761 ?auto_710762 ) ) ( not ( = ?auto_710761 ?auto_710763 ) ) ( not ( = ?auto_710761 ?auto_710764 ) ) ( not ( = ?auto_710761 ?auto_710765 ) ) ( not ( = ?auto_710761 ?auto_710766 ) ) ( not ( = ?auto_710761 ?auto_710767 ) ) ( not ( = ?auto_710761 ?auto_710768 ) ) ( not ( = ?auto_710762 ?auto_710763 ) ) ( not ( = ?auto_710762 ?auto_710764 ) ) ( not ( = ?auto_710762 ?auto_710765 ) ) ( not ( = ?auto_710762 ?auto_710766 ) ) ( not ( = ?auto_710762 ?auto_710767 ) ) ( not ( = ?auto_710762 ?auto_710768 ) ) ( not ( = ?auto_710763 ?auto_710764 ) ) ( not ( = ?auto_710763 ?auto_710765 ) ) ( not ( = ?auto_710763 ?auto_710766 ) ) ( not ( = ?auto_710763 ?auto_710767 ) ) ( not ( = ?auto_710763 ?auto_710768 ) ) ( not ( = ?auto_710764 ?auto_710765 ) ) ( not ( = ?auto_710764 ?auto_710766 ) ) ( not ( = ?auto_710764 ?auto_710767 ) ) ( not ( = ?auto_710764 ?auto_710768 ) ) ( not ( = ?auto_710765 ?auto_710766 ) ) ( not ( = ?auto_710765 ?auto_710767 ) ) ( not ( = ?auto_710765 ?auto_710768 ) ) ( not ( = ?auto_710766 ?auto_710767 ) ) ( not ( = ?auto_710766 ?auto_710768 ) ) ( not ( = ?auto_710767 ?auto_710768 ) ) ( CLEAR ?auto_710765 ) ( ON ?auto_710766 ?auto_710767 ) ( CLEAR ?auto_710766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_710759 ?auto_710760 ?auto_710761 ?auto_710762 ?auto_710763 ?auto_710764 ?auto_710765 ?auto_710766 )
      ( MAKE-9PILE ?auto_710759 ?auto_710760 ?auto_710761 ?auto_710762 ?auto_710763 ?auto_710764 ?auto_710765 ?auto_710766 ?auto_710767 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710797 - BLOCK
      ?auto_710798 - BLOCK
      ?auto_710799 - BLOCK
      ?auto_710800 - BLOCK
      ?auto_710801 - BLOCK
      ?auto_710802 - BLOCK
      ?auto_710803 - BLOCK
      ?auto_710804 - BLOCK
      ?auto_710805 - BLOCK
    )
    :vars
    (
      ?auto_710806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710805 ?auto_710806 ) ( ON-TABLE ?auto_710797 ) ( ON ?auto_710798 ?auto_710797 ) ( ON ?auto_710799 ?auto_710798 ) ( ON ?auto_710800 ?auto_710799 ) ( ON ?auto_710801 ?auto_710800 ) ( ON ?auto_710802 ?auto_710801 ) ( not ( = ?auto_710797 ?auto_710798 ) ) ( not ( = ?auto_710797 ?auto_710799 ) ) ( not ( = ?auto_710797 ?auto_710800 ) ) ( not ( = ?auto_710797 ?auto_710801 ) ) ( not ( = ?auto_710797 ?auto_710802 ) ) ( not ( = ?auto_710797 ?auto_710803 ) ) ( not ( = ?auto_710797 ?auto_710804 ) ) ( not ( = ?auto_710797 ?auto_710805 ) ) ( not ( = ?auto_710797 ?auto_710806 ) ) ( not ( = ?auto_710798 ?auto_710799 ) ) ( not ( = ?auto_710798 ?auto_710800 ) ) ( not ( = ?auto_710798 ?auto_710801 ) ) ( not ( = ?auto_710798 ?auto_710802 ) ) ( not ( = ?auto_710798 ?auto_710803 ) ) ( not ( = ?auto_710798 ?auto_710804 ) ) ( not ( = ?auto_710798 ?auto_710805 ) ) ( not ( = ?auto_710798 ?auto_710806 ) ) ( not ( = ?auto_710799 ?auto_710800 ) ) ( not ( = ?auto_710799 ?auto_710801 ) ) ( not ( = ?auto_710799 ?auto_710802 ) ) ( not ( = ?auto_710799 ?auto_710803 ) ) ( not ( = ?auto_710799 ?auto_710804 ) ) ( not ( = ?auto_710799 ?auto_710805 ) ) ( not ( = ?auto_710799 ?auto_710806 ) ) ( not ( = ?auto_710800 ?auto_710801 ) ) ( not ( = ?auto_710800 ?auto_710802 ) ) ( not ( = ?auto_710800 ?auto_710803 ) ) ( not ( = ?auto_710800 ?auto_710804 ) ) ( not ( = ?auto_710800 ?auto_710805 ) ) ( not ( = ?auto_710800 ?auto_710806 ) ) ( not ( = ?auto_710801 ?auto_710802 ) ) ( not ( = ?auto_710801 ?auto_710803 ) ) ( not ( = ?auto_710801 ?auto_710804 ) ) ( not ( = ?auto_710801 ?auto_710805 ) ) ( not ( = ?auto_710801 ?auto_710806 ) ) ( not ( = ?auto_710802 ?auto_710803 ) ) ( not ( = ?auto_710802 ?auto_710804 ) ) ( not ( = ?auto_710802 ?auto_710805 ) ) ( not ( = ?auto_710802 ?auto_710806 ) ) ( not ( = ?auto_710803 ?auto_710804 ) ) ( not ( = ?auto_710803 ?auto_710805 ) ) ( not ( = ?auto_710803 ?auto_710806 ) ) ( not ( = ?auto_710804 ?auto_710805 ) ) ( not ( = ?auto_710804 ?auto_710806 ) ) ( not ( = ?auto_710805 ?auto_710806 ) ) ( ON ?auto_710804 ?auto_710805 ) ( CLEAR ?auto_710802 ) ( ON ?auto_710803 ?auto_710804 ) ( CLEAR ?auto_710803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_710797 ?auto_710798 ?auto_710799 ?auto_710800 ?auto_710801 ?auto_710802 ?auto_710803 )
      ( MAKE-9PILE ?auto_710797 ?auto_710798 ?auto_710799 ?auto_710800 ?auto_710801 ?auto_710802 ?auto_710803 ?auto_710804 ?auto_710805 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710835 - BLOCK
      ?auto_710836 - BLOCK
      ?auto_710837 - BLOCK
      ?auto_710838 - BLOCK
      ?auto_710839 - BLOCK
      ?auto_710840 - BLOCK
      ?auto_710841 - BLOCK
      ?auto_710842 - BLOCK
      ?auto_710843 - BLOCK
    )
    :vars
    (
      ?auto_710844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710843 ?auto_710844 ) ( ON-TABLE ?auto_710835 ) ( ON ?auto_710836 ?auto_710835 ) ( ON ?auto_710837 ?auto_710836 ) ( ON ?auto_710838 ?auto_710837 ) ( ON ?auto_710839 ?auto_710838 ) ( not ( = ?auto_710835 ?auto_710836 ) ) ( not ( = ?auto_710835 ?auto_710837 ) ) ( not ( = ?auto_710835 ?auto_710838 ) ) ( not ( = ?auto_710835 ?auto_710839 ) ) ( not ( = ?auto_710835 ?auto_710840 ) ) ( not ( = ?auto_710835 ?auto_710841 ) ) ( not ( = ?auto_710835 ?auto_710842 ) ) ( not ( = ?auto_710835 ?auto_710843 ) ) ( not ( = ?auto_710835 ?auto_710844 ) ) ( not ( = ?auto_710836 ?auto_710837 ) ) ( not ( = ?auto_710836 ?auto_710838 ) ) ( not ( = ?auto_710836 ?auto_710839 ) ) ( not ( = ?auto_710836 ?auto_710840 ) ) ( not ( = ?auto_710836 ?auto_710841 ) ) ( not ( = ?auto_710836 ?auto_710842 ) ) ( not ( = ?auto_710836 ?auto_710843 ) ) ( not ( = ?auto_710836 ?auto_710844 ) ) ( not ( = ?auto_710837 ?auto_710838 ) ) ( not ( = ?auto_710837 ?auto_710839 ) ) ( not ( = ?auto_710837 ?auto_710840 ) ) ( not ( = ?auto_710837 ?auto_710841 ) ) ( not ( = ?auto_710837 ?auto_710842 ) ) ( not ( = ?auto_710837 ?auto_710843 ) ) ( not ( = ?auto_710837 ?auto_710844 ) ) ( not ( = ?auto_710838 ?auto_710839 ) ) ( not ( = ?auto_710838 ?auto_710840 ) ) ( not ( = ?auto_710838 ?auto_710841 ) ) ( not ( = ?auto_710838 ?auto_710842 ) ) ( not ( = ?auto_710838 ?auto_710843 ) ) ( not ( = ?auto_710838 ?auto_710844 ) ) ( not ( = ?auto_710839 ?auto_710840 ) ) ( not ( = ?auto_710839 ?auto_710841 ) ) ( not ( = ?auto_710839 ?auto_710842 ) ) ( not ( = ?auto_710839 ?auto_710843 ) ) ( not ( = ?auto_710839 ?auto_710844 ) ) ( not ( = ?auto_710840 ?auto_710841 ) ) ( not ( = ?auto_710840 ?auto_710842 ) ) ( not ( = ?auto_710840 ?auto_710843 ) ) ( not ( = ?auto_710840 ?auto_710844 ) ) ( not ( = ?auto_710841 ?auto_710842 ) ) ( not ( = ?auto_710841 ?auto_710843 ) ) ( not ( = ?auto_710841 ?auto_710844 ) ) ( not ( = ?auto_710842 ?auto_710843 ) ) ( not ( = ?auto_710842 ?auto_710844 ) ) ( not ( = ?auto_710843 ?auto_710844 ) ) ( ON ?auto_710842 ?auto_710843 ) ( ON ?auto_710841 ?auto_710842 ) ( CLEAR ?auto_710839 ) ( ON ?auto_710840 ?auto_710841 ) ( CLEAR ?auto_710840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_710835 ?auto_710836 ?auto_710837 ?auto_710838 ?auto_710839 ?auto_710840 )
      ( MAKE-9PILE ?auto_710835 ?auto_710836 ?auto_710837 ?auto_710838 ?auto_710839 ?auto_710840 ?auto_710841 ?auto_710842 ?auto_710843 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710873 - BLOCK
      ?auto_710874 - BLOCK
      ?auto_710875 - BLOCK
      ?auto_710876 - BLOCK
      ?auto_710877 - BLOCK
      ?auto_710878 - BLOCK
      ?auto_710879 - BLOCK
      ?auto_710880 - BLOCK
      ?auto_710881 - BLOCK
    )
    :vars
    (
      ?auto_710882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710881 ?auto_710882 ) ( ON-TABLE ?auto_710873 ) ( ON ?auto_710874 ?auto_710873 ) ( ON ?auto_710875 ?auto_710874 ) ( ON ?auto_710876 ?auto_710875 ) ( not ( = ?auto_710873 ?auto_710874 ) ) ( not ( = ?auto_710873 ?auto_710875 ) ) ( not ( = ?auto_710873 ?auto_710876 ) ) ( not ( = ?auto_710873 ?auto_710877 ) ) ( not ( = ?auto_710873 ?auto_710878 ) ) ( not ( = ?auto_710873 ?auto_710879 ) ) ( not ( = ?auto_710873 ?auto_710880 ) ) ( not ( = ?auto_710873 ?auto_710881 ) ) ( not ( = ?auto_710873 ?auto_710882 ) ) ( not ( = ?auto_710874 ?auto_710875 ) ) ( not ( = ?auto_710874 ?auto_710876 ) ) ( not ( = ?auto_710874 ?auto_710877 ) ) ( not ( = ?auto_710874 ?auto_710878 ) ) ( not ( = ?auto_710874 ?auto_710879 ) ) ( not ( = ?auto_710874 ?auto_710880 ) ) ( not ( = ?auto_710874 ?auto_710881 ) ) ( not ( = ?auto_710874 ?auto_710882 ) ) ( not ( = ?auto_710875 ?auto_710876 ) ) ( not ( = ?auto_710875 ?auto_710877 ) ) ( not ( = ?auto_710875 ?auto_710878 ) ) ( not ( = ?auto_710875 ?auto_710879 ) ) ( not ( = ?auto_710875 ?auto_710880 ) ) ( not ( = ?auto_710875 ?auto_710881 ) ) ( not ( = ?auto_710875 ?auto_710882 ) ) ( not ( = ?auto_710876 ?auto_710877 ) ) ( not ( = ?auto_710876 ?auto_710878 ) ) ( not ( = ?auto_710876 ?auto_710879 ) ) ( not ( = ?auto_710876 ?auto_710880 ) ) ( not ( = ?auto_710876 ?auto_710881 ) ) ( not ( = ?auto_710876 ?auto_710882 ) ) ( not ( = ?auto_710877 ?auto_710878 ) ) ( not ( = ?auto_710877 ?auto_710879 ) ) ( not ( = ?auto_710877 ?auto_710880 ) ) ( not ( = ?auto_710877 ?auto_710881 ) ) ( not ( = ?auto_710877 ?auto_710882 ) ) ( not ( = ?auto_710878 ?auto_710879 ) ) ( not ( = ?auto_710878 ?auto_710880 ) ) ( not ( = ?auto_710878 ?auto_710881 ) ) ( not ( = ?auto_710878 ?auto_710882 ) ) ( not ( = ?auto_710879 ?auto_710880 ) ) ( not ( = ?auto_710879 ?auto_710881 ) ) ( not ( = ?auto_710879 ?auto_710882 ) ) ( not ( = ?auto_710880 ?auto_710881 ) ) ( not ( = ?auto_710880 ?auto_710882 ) ) ( not ( = ?auto_710881 ?auto_710882 ) ) ( ON ?auto_710880 ?auto_710881 ) ( ON ?auto_710879 ?auto_710880 ) ( ON ?auto_710878 ?auto_710879 ) ( CLEAR ?auto_710876 ) ( ON ?auto_710877 ?auto_710878 ) ( CLEAR ?auto_710877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_710873 ?auto_710874 ?auto_710875 ?auto_710876 ?auto_710877 )
      ( MAKE-9PILE ?auto_710873 ?auto_710874 ?auto_710875 ?auto_710876 ?auto_710877 ?auto_710878 ?auto_710879 ?auto_710880 ?auto_710881 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710911 - BLOCK
      ?auto_710912 - BLOCK
      ?auto_710913 - BLOCK
      ?auto_710914 - BLOCK
      ?auto_710915 - BLOCK
      ?auto_710916 - BLOCK
      ?auto_710917 - BLOCK
      ?auto_710918 - BLOCK
      ?auto_710919 - BLOCK
    )
    :vars
    (
      ?auto_710920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710919 ?auto_710920 ) ( ON-TABLE ?auto_710911 ) ( ON ?auto_710912 ?auto_710911 ) ( ON ?auto_710913 ?auto_710912 ) ( not ( = ?auto_710911 ?auto_710912 ) ) ( not ( = ?auto_710911 ?auto_710913 ) ) ( not ( = ?auto_710911 ?auto_710914 ) ) ( not ( = ?auto_710911 ?auto_710915 ) ) ( not ( = ?auto_710911 ?auto_710916 ) ) ( not ( = ?auto_710911 ?auto_710917 ) ) ( not ( = ?auto_710911 ?auto_710918 ) ) ( not ( = ?auto_710911 ?auto_710919 ) ) ( not ( = ?auto_710911 ?auto_710920 ) ) ( not ( = ?auto_710912 ?auto_710913 ) ) ( not ( = ?auto_710912 ?auto_710914 ) ) ( not ( = ?auto_710912 ?auto_710915 ) ) ( not ( = ?auto_710912 ?auto_710916 ) ) ( not ( = ?auto_710912 ?auto_710917 ) ) ( not ( = ?auto_710912 ?auto_710918 ) ) ( not ( = ?auto_710912 ?auto_710919 ) ) ( not ( = ?auto_710912 ?auto_710920 ) ) ( not ( = ?auto_710913 ?auto_710914 ) ) ( not ( = ?auto_710913 ?auto_710915 ) ) ( not ( = ?auto_710913 ?auto_710916 ) ) ( not ( = ?auto_710913 ?auto_710917 ) ) ( not ( = ?auto_710913 ?auto_710918 ) ) ( not ( = ?auto_710913 ?auto_710919 ) ) ( not ( = ?auto_710913 ?auto_710920 ) ) ( not ( = ?auto_710914 ?auto_710915 ) ) ( not ( = ?auto_710914 ?auto_710916 ) ) ( not ( = ?auto_710914 ?auto_710917 ) ) ( not ( = ?auto_710914 ?auto_710918 ) ) ( not ( = ?auto_710914 ?auto_710919 ) ) ( not ( = ?auto_710914 ?auto_710920 ) ) ( not ( = ?auto_710915 ?auto_710916 ) ) ( not ( = ?auto_710915 ?auto_710917 ) ) ( not ( = ?auto_710915 ?auto_710918 ) ) ( not ( = ?auto_710915 ?auto_710919 ) ) ( not ( = ?auto_710915 ?auto_710920 ) ) ( not ( = ?auto_710916 ?auto_710917 ) ) ( not ( = ?auto_710916 ?auto_710918 ) ) ( not ( = ?auto_710916 ?auto_710919 ) ) ( not ( = ?auto_710916 ?auto_710920 ) ) ( not ( = ?auto_710917 ?auto_710918 ) ) ( not ( = ?auto_710917 ?auto_710919 ) ) ( not ( = ?auto_710917 ?auto_710920 ) ) ( not ( = ?auto_710918 ?auto_710919 ) ) ( not ( = ?auto_710918 ?auto_710920 ) ) ( not ( = ?auto_710919 ?auto_710920 ) ) ( ON ?auto_710918 ?auto_710919 ) ( ON ?auto_710917 ?auto_710918 ) ( ON ?auto_710916 ?auto_710917 ) ( ON ?auto_710915 ?auto_710916 ) ( CLEAR ?auto_710913 ) ( ON ?auto_710914 ?auto_710915 ) ( CLEAR ?auto_710914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_710911 ?auto_710912 ?auto_710913 ?auto_710914 )
      ( MAKE-9PILE ?auto_710911 ?auto_710912 ?auto_710913 ?auto_710914 ?auto_710915 ?auto_710916 ?auto_710917 ?auto_710918 ?auto_710919 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710949 - BLOCK
      ?auto_710950 - BLOCK
      ?auto_710951 - BLOCK
      ?auto_710952 - BLOCK
      ?auto_710953 - BLOCK
      ?auto_710954 - BLOCK
      ?auto_710955 - BLOCK
      ?auto_710956 - BLOCK
      ?auto_710957 - BLOCK
    )
    :vars
    (
      ?auto_710958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710957 ?auto_710958 ) ( ON-TABLE ?auto_710949 ) ( ON ?auto_710950 ?auto_710949 ) ( not ( = ?auto_710949 ?auto_710950 ) ) ( not ( = ?auto_710949 ?auto_710951 ) ) ( not ( = ?auto_710949 ?auto_710952 ) ) ( not ( = ?auto_710949 ?auto_710953 ) ) ( not ( = ?auto_710949 ?auto_710954 ) ) ( not ( = ?auto_710949 ?auto_710955 ) ) ( not ( = ?auto_710949 ?auto_710956 ) ) ( not ( = ?auto_710949 ?auto_710957 ) ) ( not ( = ?auto_710949 ?auto_710958 ) ) ( not ( = ?auto_710950 ?auto_710951 ) ) ( not ( = ?auto_710950 ?auto_710952 ) ) ( not ( = ?auto_710950 ?auto_710953 ) ) ( not ( = ?auto_710950 ?auto_710954 ) ) ( not ( = ?auto_710950 ?auto_710955 ) ) ( not ( = ?auto_710950 ?auto_710956 ) ) ( not ( = ?auto_710950 ?auto_710957 ) ) ( not ( = ?auto_710950 ?auto_710958 ) ) ( not ( = ?auto_710951 ?auto_710952 ) ) ( not ( = ?auto_710951 ?auto_710953 ) ) ( not ( = ?auto_710951 ?auto_710954 ) ) ( not ( = ?auto_710951 ?auto_710955 ) ) ( not ( = ?auto_710951 ?auto_710956 ) ) ( not ( = ?auto_710951 ?auto_710957 ) ) ( not ( = ?auto_710951 ?auto_710958 ) ) ( not ( = ?auto_710952 ?auto_710953 ) ) ( not ( = ?auto_710952 ?auto_710954 ) ) ( not ( = ?auto_710952 ?auto_710955 ) ) ( not ( = ?auto_710952 ?auto_710956 ) ) ( not ( = ?auto_710952 ?auto_710957 ) ) ( not ( = ?auto_710952 ?auto_710958 ) ) ( not ( = ?auto_710953 ?auto_710954 ) ) ( not ( = ?auto_710953 ?auto_710955 ) ) ( not ( = ?auto_710953 ?auto_710956 ) ) ( not ( = ?auto_710953 ?auto_710957 ) ) ( not ( = ?auto_710953 ?auto_710958 ) ) ( not ( = ?auto_710954 ?auto_710955 ) ) ( not ( = ?auto_710954 ?auto_710956 ) ) ( not ( = ?auto_710954 ?auto_710957 ) ) ( not ( = ?auto_710954 ?auto_710958 ) ) ( not ( = ?auto_710955 ?auto_710956 ) ) ( not ( = ?auto_710955 ?auto_710957 ) ) ( not ( = ?auto_710955 ?auto_710958 ) ) ( not ( = ?auto_710956 ?auto_710957 ) ) ( not ( = ?auto_710956 ?auto_710958 ) ) ( not ( = ?auto_710957 ?auto_710958 ) ) ( ON ?auto_710956 ?auto_710957 ) ( ON ?auto_710955 ?auto_710956 ) ( ON ?auto_710954 ?auto_710955 ) ( ON ?auto_710953 ?auto_710954 ) ( ON ?auto_710952 ?auto_710953 ) ( CLEAR ?auto_710950 ) ( ON ?auto_710951 ?auto_710952 ) ( CLEAR ?auto_710951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_710949 ?auto_710950 ?auto_710951 )
      ( MAKE-9PILE ?auto_710949 ?auto_710950 ?auto_710951 ?auto_710952 ?auto_710953 ?auto_710954 ?auto_710955 ?auto_710956 ?auto_710957 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_710987 - BLOCK
      ?auto_710988 - BLOCK
      ?auto_710989 - BLOCK
      ?auto_710990 - BLOCK
      ?auto_710991 - BLOCK
      ?auto_710992 - BLOCK
      ?auto_710993 - BLOCK
      ?auto_710994 - BLOCK
      ?auto_710995 - BLOCK
    )
    :vars
    (
      ?auto_710996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_710995 ?auto_710996 ) ( ON-TABLE ?auto_710987 ) ( not ( = ?auto_710987 ?auto_710988 ) ) ( not ( = ?auto_710987 ?auto_710989 ) ) ( not ( = ?auto_710987 ?auto_710990 ) ) ( not ( = ?auto_710987 ?auto_710991 ) ) ( not ( = ?auto_710987 ?auto_710992 ) ) ( not ( = ?auto_710987 ?auto_710993 ) ) ( not ( = ?auto_710987 ?auto_710994 ) ) ( not ( = ?auto_710987 ?auto_710995 ) ) ( not ( = ?auto_710987 ?auto_710996 ) ) ( not ( = ?auto_710988 ?auto_710989 ) ) ( not ( = ?auto_710988 ?auto_710990 ) ) ( not ( = ?auto_710988 ?auto_710991 ) ) ( not ( = ?auto_710988 ?auto_710992 ) ) ( not ( = ?auto_710988 ?auto_710993 ) ) ( not ( = ?auto_710988 ?auto_710994 ) ) ( not ( = ?auto_710988 ?auto_710995 ) ) ( not ( = ?auto_710988 ?auto_710996 ) ) ( not ( = ?auto_710989 ?auto_710990 ) ) ( not ( = ?auto_710989 ?auto_710991 ) ) ( not ( = ?auto_710989 ?auto_710992 ) ) ( not ( = ?auto_710989 ?auto_710993 ) ) ( not ( = ?auto_710989 ?auto_710994 ) ) ( not ( = ?auto_710989 ?auto_710995 ) ) ( not ( = ?auto_710989 ?auto_710996 ) ) ( not ( = ?auto_710990 ?auto_710991 ) ) ( not ( = ?auto_710990 ?auto_710992 ) ) ( not ( = ?auto_710990 ?auto_710993 ) ) ( not ( = ?auto_710990 ?auto_710994 ) ) ( not ( = ?auto_710990 ?auto_710995 ) ) ( not ( = ?auto_710990 ?auto_710996 ) ) ( not ( = ?auto_710991 ?auto_710992 ) ) ( not ( = ?auto_710991 ?auto_710993 ) ) ( not ( = ?auto_710991 ?auto_710994 ) ) ( not ( = ?auto_710991 ?auto_710995 ) ) ( not ( = ?auto_710991 ?auto_710996 ) ) ( not ( = ?auto_710992 ?auto_710993 ) ) ( not ( = ?auto_710992 ?auto_710994 ) ) ( not ( = ?auto_710992 ?auto_710995 ) ) ( not ( = ?auto_710992 ?auto_710996 ) ) ( not ( = ?auto_710993 ?auto_710994 ) ) ( not ( = ?auto_710993 ?auto_710995 ) ) ( not ( = ?auto_710993 ?auto_710996 ) ) ( not ( = ?auto_710994 ?auto_710995 ) ) ( not ( = ?auto_710994 ?auto_710996 ) ) ( not ( = ?auto_710995 ?auto_710996 ) ) ( ON ?auto_710994 ?auto_710995 ) ( ON ?auto_710993 ?auto_710994 ) ( ON ?auto_710992 ?auto_710993 ) ( ON ?auto_710991 ?auto_710992 ) ( ON ?auto_710990 ?auto_710991 ) ( ON ?auto_710989 ?auto_710990 ) ( CLEAR ?auto_710987 ) ( ON ?auto_710988 ?auto_710989 ) ( CLEAR ?auto_710988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_710987 ?auto_710988 )
      ( MAKE-9PILE ?auto_710987 ?auto_710988 ?auto_710989 ?auto_710990 ?auto_710991 ?auto_710992 ?auto_710993 ?auto_710994 ?auto_710995 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_711025 - BLOCK
      ?auto_711026 - BLOCK
      ?auto_711027 - BLOCK
      ?auto_711028 - BLOCK
      ?auto_711029 - BLOCK
      ?auto_711030 - BLOCK
      ?auto_711031 - BLOCK
      ?auto_711032 - BLOCK
      ?auto_711033 - BLOCK
    )
    :vars
    (
      ?auto_711034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711033 ?auto_711034 ) ( not ( = ?auto_711025 ?auto_711026 ) ) ( not ( = ?auto_711025 ?auto_711027 ) ) ( not ( = ?auto_711025 ?auto_711028 ) ) ( not ( = ?auto_711025 ?auto_711029 ) ) ( not ( = ?auto_711025 ?auto_711030 ) ) ( not ( = ?auto_711025 ?auto_711031 ) ) ( not ( = ?auto_711025 ?auto_711032 ) ) ( not ( = ?auto_711025 ?auto_711033 ) ) ( not ( = ?auto_711025 ?auto_711034 ) ) ( not ( = ?auto_711026 ?auto_711027 ) ) ( not ( = ?auto_711026 ?auto_711028 ) ) ( not ( = ?auto_711026 ?auto_711029 ) ) ( not ( = ?auto_711026 ?auto_711030 ) ) ( not ( = ?auto_711026 ?auto_711031 ) ) ( not ( = ?auto_711026 ?auto_711032 ) ) ( not ( = ?auto_711026 ?auto_711033 ) ) ( not ( = ?auto_711026 ?auto_711034 ) ) ( not ( = ?auto_711027 ?auto_711028 ) ) ( not ( = ?auto_711027 ?auto_711029 ) ) ( not ( = ?auto_711027 ?auto_711030 ) ) ( not ( = ?auto_711027 ?auto_711031 ) ) ( not ( = ?auto_711027 ?auto_711032 ) ) ( not ( = ?auto_711027 ?auto_711033 ) ) ( not ( = ?auto_711027 ?auto_711034 ) ) ( not ( = ?auto_711028 ?auto_711029 ) ) ( not ( = ?auto_711028 ?auto_711030 ) ) ( not ( = ?auto_711028 ?auto_711031 ) ) ( not ( = ?auto_711028 ?auto_711032 ) ) ( not ( = ?auto_711028 ?auto_711033 ) ) ( not ( = ?auto_711028 ?auto_711034 ) ) ( not ( = ?auto_711029 ?auto_711030 ) ) ( not ( = ?auto_711029 ?auto_711031 ) ) ( not ( = ?auto_711029 ?auto_711032 ) ) ( not ( = ?auto_711029 ?auto_711033 ) ) ( not ( = ?auto_711029 ?auto_711034 ) ) ( not ( = ?auto_711030 ?auto_711031 ) ) ( not ( = ?auto_711030 ?auto_711032 ) ) ( not ( = ?auto_711030 ?auto_711033 ) ) ( not ( = ?auto_711030 ?auto_711034 ) ) ( not ( = ?auto_711031 ?auto_711032 ) ) ( not ( = ?auto_711031 ?auto_711033 ) ) ( not ( = ?auto_711031 ?auto_711034 ) ) ( not ( = ?auto_711032 ?auto_711033 ) ) ( not ( = ?auto_711032 ?auto_711034 ) ) ( not ( = ?auto_711033 ?auto_711034 ) ) ( ON ?auto_711032 ?auto_711033 ) ( ON ?auto_711031 ?auto_711032 ) ( ON ?auto_711030 ?auto_711031 ) ( ON ?auto_711029 ?auto_711030 ) ( ON ?auto_711028 ?auto_711029 ) ( ON ?auto_711027 ?auto_711028 ) ( ON ?auto_711026 ?auto_711027 ) ( ON ?auto_711025 ?auto_711026 ) ( CLEAR ?auto_711025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_711025 )
      ( MAKE-9PILE ?auto_711025 ?auto_711026 ?auto_711027 ?auto_711028 ?auto_711029 ?auto_711030 ?auto_711031 ?auto_711032 ?auto_711033 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711064 - BLOCK
      ?auto_711065 - BLOCK
      ?auto_711066 - BLOCK
      ?auto_711067 - BLOCK
      ?auto_711068 - BLOCK
      ?auto_711069 - BLOCK
      ?auto_711070 - BLOCK
      ?auto_711071 - BLOCK
      ?auto_711072 - BLOCK
      ?auto_711073 - BLOCK
    )
    :vars
    (
      ?auto_711074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_711072 ) ( ON ?auto_711073 ?auto_711074 ) ( CLEAR ?auto_711073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_711064 ) ( ON ?auto_711065 ?auto_711064 ) ( ON ?auto_711066 ?auto_711065 ) ( ON ?auto_711067 ?auto_711066 ) ( ON ?auto_711068 ?auto_711067 ) ( ON ?auto_711069 ?auto_711068 ) ( ON ?auto_711070 ?auto_711069 ) ( ON ?auto_711071 ?auto_711070 ) ( ON ?auto_711072 ?auto_711071 ) ( not ( = ?auto_711064 ?auto_711065 ) ) ( not ( = ?auto_711064 ?auto_711066 ) ) ( not ( = ?auto_711064 ?auto_711067 ) ) ( not ( = ?auto_711064 ?auto_711068 ) ) ( not ( = ?auto_711064 ?auto_711069 ) ) ( not ( = ?auto_711064 ?auto_711070 ) ) ( not ( = ?auto_711064 ?auto_711071 ) ) ( not ( = ?auto_711064 ?auto_711072 ) ) ( not ( = ?auto_711064 ?auto_711073 ) ) ( not ( = ?auto_711064 ?auto_711074 ) ) ( not ( = ?auto_711065 ?auto_711066 ) ) ( not ( = ?auto_711065 ?auto_711067 ) ) ( not ( = ?auto_711065 ?auto_711068 ) ) ( not ( = ?auto_711065 ?auto_711069 ) ) ( not ( = ?auto_711065 ?auto_711070 ) ) ( not ( = ?auto_711065 ?auto_711071 ) ) ( not ( = ?auto_711065 ?auto_711072 ) ) ( not ( = ?auto_711065 ?auto_711073 ) ) ( not ( = ?auto_711065 ?auto_711074 ) ) ( not ( = ?auto_711066 ?auto_711067 ) ) ( not ( = ?auto_711066 ?auto_711068 ) ) ( not ( = ?auto_711066 ?auto_711069 ) ) ( not ( = ?auto_711066 ?auto_711070 ) ) ( not ( = ?auto_711066 ?auto_711071 ) ) ( not ( = ?auto_711066 ?auto_711072 ) ) ( not ( = ?auto_711066 ?auto_711073 ) ) ( not ( = ?auto_711066 ?auto_711074 ) ) ( not ( = ?auto_711067 ?auto_711068 ) ) ( not ( = ?auto_711067 ?auto_711069 ) ) ( not ( = ?auto_711067 ?auto_711070 ) ) ( not ( = ?auto_711067 ?auto_711071 ) ) ( not ( = ?auto_711067 ?auto_711072 ) ) ( not ( = ?auto_711067 ?auto_711073 ) ) ( not ( = ?auto_711067 ?auto_711074 ) ) ( not ( = ?auto_711068 ?auto_711069 ) ) ( not ( = ?auto_711068 ?auto_711070 ) ) ( not ( = ?auto_711068 ?auto_711071 ) ) ( not ( = ?auto_711068 ?auto_711072 ) ) ( not ( = ?auto_711068 ?auto_711073 ) ) ( not ( = ?auto_711068 ?auto_711074 ) ) ( not ( = ?auto_711069 ?auto_711070 ) ) ( not ( = ?auto_711069 ?auto_711071 ) ) ( not ( = ?auto_711069 ?auto_711072 ) ) ( not ( = ?auto_711069 ?auto_711073 ) ) ( not ( = ?auto_711069 ?auto_711074 ) ) ( not ( = ?auto_711070 ?auto_711071 ) ) ( not ( = ?auto_711070 ?auto_711072 ) ) ( not ( = ?auto_711070 ?auto_711073 ) ) ( not ( = ?auto_711070 ?auto_711074 ) ) ( not ( = ?auto_711071 ?auto_711072 ) ) ( not ( = ?auto_711071 ?auto_711073 ) ) ( not ( = ?auto_711071 ?auto_711074 ) ) ( not ( = ?auto_711072 ?auto_711073 ) ) ( not ( = ?auto_711072 ?auto_711074 ) ) ( not ( = ?auto_711073 ?auto_711074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_711073 ?auto_711074 )
      ( !STACK ?auto_711073 ?auto_711072 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711106 - BLOCK
      ?auto_711107 - BLOCK
      ?auto_711108 - BLOCK
      ?auto_711109 - BLOCK
      ?auto_711110 - BLOCK
      ?auto_711111 - BLOCK
      ?auto_711112 - BLOCK
      ?auto_711113 - BLOCK
      ?auto_711114 - BLOCK
      ?auto_711115 - BLOCK
    )
    :vars
    (
      ?auto_711116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711115 ?auto_711116 ) ( ON-TABLE ?auto_711106 ) ( ON ?auto_711107 ?auto_711106 ) ( ON ?auto_711108 ?auto_711107 ) ( ON ?auto_711109 ?auto_711108 ) ( ON ?auto_711110 ?auto_711109 ) ( ON ?auto_711111 ?auto_711110 ) ( ON ?auto_711112 ?auto_711111 ) ( ON ?auto_711113 ?auto_711112 ) ( not ( = ?auto_711106 ?auto_711107 ) ) ( not ( = ?auto_711106 ?auto_711108 ) ) ( not ( = ?auto_711106 ?auto_711109 ) ) ( not ( = ?auto_711106 ?auto_711110 ) ) ( not ( = ?auto_711106 ?auto_711111 ) ) ( not ( = ?auto_711106 ?auto_711112 ) ) ( not ( = ?auto_711106 ?auto_711113 ) ) ( not ( = ?auto_711106 ?auto_711114 ) ) ( not ( = ?auto_711106 ?auto_711115 ) ) ( not ( = ?auto_711106 ?auto_711116 ) ) ( not ( = ?auto_711107 ?auto_711108 ) ) ( not ( = ?auto_711107 ?auto_711109 ) ) ( not ( = ?auto_711107 ?auto_711110 ) ) ( not ( = ?auto_711107 ?auto_711111 ) ) ( not ( = ?auto_711107 ?auto_711112 ) ) ( not ( = ?auto_711107 ?auto_711113 ) ) ( not ( = ?auto_711107 ?auto_711114 ) ) ( not ( = ?auto_711107 ?auto_711115 ) ) ( not ( = ?auto_711107 ?auto_711116 ) ) ( not ( = ?auto_711108 ?auto_711109 ) ) ( not ( = ?auto_711108 ?auto_711110 ) ) ( not ( = ?auto_711108 ?auto_711111 ) ) ( not ( = ?auto_711108 ?auto_711112 ) ) ( not ( = ?auto_711108 ?auto_711113 ) ) ( not ( = ?auto_711108 ?auto_711114 ) ) ( not ( = ?auto_711108 ?auto_711115 ) ) ( not ( = ?auto_711108 ?auto_711116 ) ) ( not ( = ?auto_711109 ?auto_711110 ) ) ( not ( = ?auto_711109 ?auto_711111 ) ) ( not ( = ?auto_711109 ?auto_711112 ) ) ( not ( = ?auto_711109 ?auto_711113 ) ) ( not ( = ?auto_711109 ?auto_711114 ) ) ( not ( = ?auto_711109 ?auto_711115 ) ) ( not ( = ?auto_711109 ?auto_711116 ) ) ( not ( = ?auto_711110 ?auto_711111 ) ) ( not ( = ?auto_711110 ?auto_711112 ) ) ( not ( = ?auto_711110 ?auto_711113 ) ) ( not ( = ?auto_711110 ?auto_711114 ) ) ( not ( = ?auto_711110 ?auto_711115 ) ) ( not ( = ?auto_711110 ?auto_711116 ) ) ( not ( = ?auto_711111 ?auto_711112 ) ) ( not ( = ?auto_711111 ?auto_711113 ) ) ( not ( = ?auto_711111 ?auto_711114 ) ) ( not ( = ?auto_711111 ?auto_711115 ) ) ( not ( = ?auto_711111 ?auto_711116 ) ) ( not ( = ?auto_711112 ?auto_711113 ) ) ( not ( = ?auto_711112 ?auto_711114 ) ) ( not ( = ?auto_711112 ?auto_711115 ) ) ( not ( = ?auto_711112 ?auto_711116 ) ) ( not ( = ?auto_711113 ?auto_711114 ) ) ( not ( = ?auto_711113 ?auto_711115 ) ) ( not ( = ?auto_711113 ?auto_711116 ) ) ( not ( = ?auto_711114 ?auto_711115 ) ) ( not ( = ?auto_711114 ?auto_711116 ) ) ( not ( = ?auto_711115 ?auto_711116 ) ) ( CLEAR ?auto_711113 ) ( ON ?auto_711114 ?auto_711115 ) ( CLEAR ?auto_711114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_711106 ?auto_711107 ?auto_711108 ?auto_711109 ?auto_711110 ?auto_711111 ?auto_711112 ?auto_711113 ?auto_711114 )
      ( MAKE-10PILE ?auto_711106 ?auto_711107 ?auto_711108 ?auto_711109 ?auto_711110 ?auto_711111 ?auto_711112 ?auto_711113 ?auto_711114 ?auto_711115 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711148 - BLOCK
      ?auto_711149 - BLOCK
      ?auto_711150 - BLOCK
      ?auto_711151 - BLOCK
      ?auto_711152 - BLOCK
      ?auto_711153 - BLOCK
      ?auto_711154 - BLOCK
      ?auto_711155 - BLOCK
      ?auto_711156 - BLOCK
      ?auto_711157 - BLOCK
    )
    :vars
    (
      ?auto_711158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711157 ?auto_711158 ) ( ON-TABLE ?auto_711148 ) ( ON ?auto_711149 ?auto_711148 ) ( ON ?auto_711150 ?auto_711149 ) ( ON ?auto_711151 ?auto_711150 ) ( ON ?auto_711152 ?auto_711151 ) ( ON ?auto_711153 ?auto_711152 ) ( ON ?auto_711154 ?auto_711153 ) ( not ( = ?auto_711148 ?auto_711149 ) ) ( not ( = ?auto_711148 ?auto_711150 ) ) ( not ( = ?auto_711148 ?auto_711151 ) ) ( not ( = ?auto_711148 ?auto_711152 ) ) ( not ( = ?auto_711148 ?auto_711153 ) ) ( not ( = ?auto_711148 ?auto_711154 ) ) ( not ( = ?auto_711148 ?auto_711155 ) ) ( not ( = ?auto_711148 ?auto_711156 ) ) ( not ( = ?auto_711148 ?auto_711157 ) ) ( not ( = ?auto_711148 ?auto_711158 ) ) ( not ( = ?auto_711149 ?auto_711150 ) ) ( not ( = ?auto_711149 ?auto_711151 ) ) ( not ( = ?auto_711149 ?auto_711152 ) ) ( not ( = ?auto_711149 ?auto_711153 ) ) ( not ( = ?auto_711149 ?auto_711154 ) ) ( not ( = ?auto_711149 ?auto_711155 ) ) ( not ( = ?auto_711149 ?auto_711156 ) ) ( not ( = ?auto_711149 ?auto_711157 ) ) ( not ( = ?auto_711149 ?auto_711158 ) ) ( not ( = ?auto_711150 ?auto_711151 ) ) ( not ( = ?auto_711150 ?auto_711152 ) ) ( not ( = ?auto_711150 ?auto_711153 ) ) ( not ( = ?auto_711150 ?auto_711154 ) ) ( not ( = ?auto_711150 ?auto_711155 ) ) ( not ( = ?auto_711150 ?auto_711156 ) ) ( not ( = ?auto_711150 ?auto_711157 ) ) ( not ( = ?auto_711150 ?auto_711158 ) ) ( not ( = ?auto_711151 ?auto_711152 ) ) ( not ( = ?auto_711151 ?auto_711153 ) ) ( not ( = ?auto_711151 ?auto_711154 ) ) ( not ( = ?auto_711151 ?auto_711155 ) ) ( not ( = ?auto_711151 ?auto_711156 ) ) ( not ( = ?auto_711151 ?auto_711157 ) ) ( not ( = ?auto_711151 ?auto_711158 ) ) ( not ( = ?auto_711152 ?auto_711153 ) ) ( not ( = ?auto_711152 ?auto_711154 ) ) ( not ( = ?auto_711152 ?auto_711155 ) ) ( not ( = ?auto_711152 ?auto_711156 ) ) ( not ( = ?auto_711152 ?auto_711157 ) ) ( not ( = ?auto_711152 ?auto_711158 ) ) ( not ( = ?auto_711153 ?auto_711154 ) ) ( not ( = ?auto_711153 ?auto_711155 ) ) ( not ( = ?auto_711153 ?auto_711156 ) ) ( not ( = ?auto_711153 ?auto_711157 ) ) ( not ( = ?auto_711153 ?auto_711158 ) ) ( not ( = ?auto_711154 ?auto_711155 ) ) ( not ( = ?auto_711154 ?auto_711156 ) ) ( not ( = ?auto_711154 ?auto_711157 ) ) ( not ( = ?auto_711154 ?auto_711158 ) ) ( not ( = ?auto_711155 ?auto_711156 ) ) ( not ( = ?auto_711155 ?auto_711157 ) ) ( not ( = ?auto_711155 ?auto_711158 ) ) ( not ( = ?auto_711156 ?auto_711157 ) ) ( not ( = ?auto_711156 ?auto_711158 ) ) ( not ( = ?auto_711157 ?auto_711158 ) ) ( ON ?auto_711156 ?auto_711157 ) ( CLEAR ?auto_711154 ) ( ON ?auto_711155 ?auto_711156 ) ( CLEAR ?auto_711155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_711148 ?auto_711149 ?auto_711150 ?auto_711151 ?auto_711152 ?auto_711153 ?auto_711154 ?auto_711155 )
      ( MAKE-10PILE ?auto_711148 ?auto_711149 ?auto_711150 ?auto_711151 ?auto_711152 ?auto_711153 ?auto_711154 ?auto_711155 ?auto_711156 ?auto_711157 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711190 - BLOCK
      ?auto_711191 - BLOCK
      ?auto_711192 - BLOCK
      ?auto_711193 - BLOCK
      ?auto_711194 - BLOCK
      ?auto_711195 - BLOCK
      ?auto_711196 - BLOCK
      ?auto_711197 - BLOCK
      ?auto_711198 - BLOCK
      ?auto_711199 - BLOCK
    )
    :vars
    (
      ?auto_711200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711199 ?auto_711200 ) ( ON-TABLE ?auto_711190 ) ( ON ?auto_711191 ?auto_711190 ) ( ON ?auto_711192 ?auto_711191 ) ( ON ?auto_711193 ?auto_711192 ) ( ON ?auto_711194 ?auto_711193 ) ( ON ?auto_711195 ?auto_711194 ) ( not ( = ?auto_711190 ?auto_711191 ) ) ( not ( = ?auto_711190 ?auto_711192 ) ) ( not ( = ?auto_711190 ?auto_711193 ) ) ( not ( = ?auto_711190 ?auto_711194 ) ) ( not ( = ?auto_711190 ?auto_711195 ) ) ( not ( = ?auto_711190 ?auto_711196 ) ) ( not ( = ?auto_711190 ?auto_711197 ) ) ( not ( = ?auto_711190 ?auto_711198 ) ) ( not ( = ?auto_711190 ?auto_711199 ) ) ( not ( = ?auto_711190 ?auto_711200 ) ) ( not ( = ?auto_711191 ?auto_711192 ) ) ( not ( = ?auto_711191 ?auto_711193 ) ) ( not ( = ?auto_711191 ?auto_711194 ) ) ( not ( = ?auto_711191 ?auto_711195 ) ) ( not ( = ?auto_711191 ?auto_711196 ) ) ( not ( = ?auto_711191 ?auto_711197 ) ) ( not ( = ?auto_711191 ?auto_711198 ) ) ( not ( = ?auto_711191 ?auto_711199 ) ) ( not ( = ?auto_711191 ?auto_711200 ) ) ( not ( = ?auto_711192 ?auto_711193 ) ) ( not ( = ?auto_711192 ?auto_711194 ) ) ( not ( = ?auto_711192 ?auto_711195 ) ) ( not ( = ?auto_711192 ?auto_711196 ) ) ( not ( = ?auto_711192 ?auto_711197 ) ) ( not ( = ?auto_711192 ?auto_711198 ) ) ( not ( = ?auto_711192 ?auto_711199 ) ) ( not ( = ?auto_711192 ?auto_711200 ) ) ( not ( = ?auto_711193 ?auto_711194 ) ) ( not ( = ?auto_711193 ?auto_711195 ) ) ( not ( = ?auto_711193 ?auto_711196 ) ) ( not ( = ?auto_711193 ?auto_711197 ) ) ( not ( = ?auto_711193 ?auto_711198 ) ) ( not ( = ?auto_711193 ?auto_711199 ) ) ( not ( = ?auto_711193 ?auto_711200 ) ) ( not ( = ?auto_711194 ?auto_711195 ) ) ( not ( = ?auto_711194 ?auto_711196 ) ) ( not ( = ?auto_711194 ?auto_711197 ) ) ( not ( = ?auto_711194 ?auto_711198 ) ) ( not ( = ?auto_711194 ?auto_711199 ) ) ( not ( = ?auto_711194 ?auto_711200 ) ) ( not ( = ?auto_711195 ?auto_711196 ) ) ( not ( = ?auto_711195 ?auto_711197 ) ) ( not ( = ?auto_711195 ?auto_711198 ) ) ( not ( = ?auto_711195 ?auto_711199 ) ) ( not ( = ?auto_711195 ?auto_711200 ) ) ( not ( = ?auto_711196 ?auto_711197 ) ) ( not ( = ?auto_711196 ?auto_711198 ) ) ( not ( = ?auto_711196 ?auto_711199 ) ) ( not ( = ?auto_711196 ?auto_711200 ) ) ( not ( = ?auto_711197 ?auto_711198 ) ) ( not ( = ?auto_711197 ?auto_711199 ) ) ( not ( = ?auto_711197 ?auto_711200 ) ) ( not ( = ?auto_711198 ?auto_711199 ) ) ( not ( = ?auto_711198 ?auto_711200 ) ) ( not ( = ?auto_711199 ?auto_711200 ) ) ( ON ?auto_711198 ?auto_711199 ) ( ON ?auto_711197 ?auto_711198 ) ( CLEAR ?auto_711195 ) ( ON ?auto_711196 ?auto_711197 ) ( CLEAR ?auto_711196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_711190 ?auto_711191 ?auto_711192 ?auto_711193 ?auto_711194 ?auto_711195 ?auto_711196 )
      ( MAKE-10PILE ?auto_711190 ?auto_711191 ?auto_711192 ?auto_711193 ?auto_711194 ?auto_711195 ?auto_711196 ?auto_711197 ?auto_711198 ?auto_711199 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711232 - BLOCK
      ?auto_711233 - BLOCK
      ?auto_711234 - BLOCK
      ?auto_711235 - BLOCK
      ?auto_711236 - BLOCK
      ?auto_711237 - BLOCK
      ?auto_711238 - BLOCK
      ?auto_711239 - BLOCK
      ?auto_711240 - BLOCK
      ?auto_711241 - BLOCK
    )
    :vars
    (
      ?auto_711242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711241 ?auto_711242 ) ( ON-TABLE ?auto_711232 ) ( ON ?auto_711233 ?auto_711232 ) ( ON ?auto_711234 ?auto_711233 ) ( ON ?auto_711235 ?auto_711234 ) ( ON ?auto_711236 ?auto_711235 ) ( not ( = ?auto_711232 ?auto_711233 ) ) ( not ( = ?auto_711232 ?auto_711234 ) ) ( not ( = ?auto_711232 ?auto_711235 ) ) ( not ( = ?auto_711232 ?auto_711236 ) ) ( not ( = ?auto_711232 ?auto_711237 ) ) ( not ( = ?auto_711232 ?auto_711238 ) ) ( not ( = ?auto_711232 ?auto_711239 ) ) ( not ( = ?auto_711232 ?auto_711240 ) ) ( not ( = ?auto_711232 ?auto_711241 ) ) ( not ( = ?auto_711232 ?auto_711242 ) ) ( not ( = ?auto_711233 ?auto_711234 ) ) ( not ( = ?auto_711233 ?auto_711235 ) ) ( not ( = ?auto_711233 ?auto_711236 ) ) ( not ( = ?auto_711233 ?auto_711237 ) ) ( not ( = ?auto_711233 ?auto_711238 ) ) ( not ( = ?auto_711233 ?auto_711239 ) ) ( not ( = ?auto_711233 ?auto_711240 ) ) ( not ( = ?auto_711233 ?auto_711241 ) ) ( not ( = ?auto_711233 ?auto_711242 ) ) ( not ( = ?auto_711234 ?auto_711235 ) ) ( not ( = ?auto_711234 ?auto_711236 ) ) ( not ( = ?auto_711234 ?auto_711237 ) ) ( not ( = ?auto_711234 ?auto_711238 ) ) ( not ( = ?auto_711234 ?auto_711239 ) ) ( not ( = ?auto_711234 ?auto_711240 ) ) ( not ( = ?auto_711234 ?auto_711241 ) ) ( not ( = ?auto_711234 ?auto_711242 ) ) ( not ( = ?auto_711235 ?auto_711236 ) ) ( not ( = ?auto_711235 ?auto_711237 ) ) ( not ( = ?auto_711235 ?auto_711238 ) ) ( not ( = ?auto_711235 ?auto_711239 ) ) ( not ( = ?auto_711235 ?auto_711240 ) ) ( not ( = ?auto_711235 ?auto_711241 ) ) ( not ( = ?auto_711235 ?auto_711242 ) ) ( not ( = ?auto_711236 ?auto_711237 ) ) ( not ( = ?auto_711236 ?auto_711238 ) ) ( not ( = ?auto_711236 ?auto_711239 ) ) ( not ( = ?auto_711236 ?auto_711240 ) ) ( not ( = ?auto_711236 ?auto_711241 ) ) ( not ( = ?auto_711236 ?auto_711242 ) ) ( not ( = ?auto_711237 ?auto_711238 ) ) ( not ( = ?auto_711237 ?auto_711239 ) ) ( not ( = ?auto_711237 ?auto_711240 ) ) ( not ( = ?auto_711237 ?auto_711241 ) ) ( not ( = ?auto_711237 ?auto_711242 ) ) ( not ( = ?auto_711238 ?auto_711239 ) ) ( not ( = ?auto_711238 ?auto_711240 ) ) ( not ( = ?auto_711238 ?auto_711241 ) ) ( not ( = ?auto_711238 ?auto_711242 ) ) ( not ( = ?auto_711239 ?auto_711240 ) ) ( not ( = ?auto_711239 ?auto_711241 ) ) ( not ( = ?auto_711239 ?auto_711242 ) ) ( not ( = ?auto_711240 ?auto_711241 ) ) ( not ( = ?auto_711240 ?auto_711242 ) ) ( not ( = ?auto_711241 ?auto_711242 ) ) ( ON ?auto_711240 ?auto_711241 ) ( ON ?auto_711239 ?auto_711240 ) ( ON ?auto_711238 ?auto_711239 ) ( CLEAR ?auto_711236 ) ( ON ?auto_711237 ?auto_711238 ) ( CLEAR ?auto_711237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_711232 ?auto_711233 ?auto_711234 ?auto_711235 ?auto_711236 ?auto_711237 )
      ( MAKE-10PILE ?auto_711232 ?auto_711233 ?auto_711234 ?auto_711235 ?auto_711236 ?auto_711237 ?auto_711238 ?auto_711239 ?auto_711240 ?auto_711241 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711274 - BLOCK
      ?auto_711275 - BLOCK
      ?auto_711276 - BLOCK
      ?auto_711277 - BLOCK
      ?auto_711278 - BLOCK
      ?auto_711279 - BLOCK
      ?auto_711280 - BLOCK
      ?auto_711281 - BLOCK
      ?auto_711282 - BLOCK
      ?auto_711283 - BLOCK
    )
    :vars
    (
      ?auto_711284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711283 ?auto_711284 ) ( ON-TABLE ?auto_711274 ) ( ON ?auto_711275 ?auto_711274 ) ( ON ?auto_711276 ?auto_711275 ) ( ON ?auto_711277 ?auto_711276 ) ( not ( = ?auto_711274 ?auto_711275 ) ) ( not ( = ?auto_711274 ?auto_711276 ) ) ( not ( = ?auto_711274 ?auto_711277 ) ) ( not ( = ?auto_711274 ?auto_711278 ) ) ( not ( = ?auto_711274 ?auto_711279 ) ) ( not ( = ?auto_711274 ?auto_711280 ) ) ( not ( = ?auto_711274 ?auto_711281 ) ) ( not ( = ?auto_711274 ?auto_711282 ) ) ( not ( = ?auto_711274 ?auto_711283 ) ) ( not ( = ?auto_711274 ?auto_711284 ) ) ( not ( = ?auto_711275 ?auto_711276 ) ) ( not ( = ?auto_711275 ?auto_711277 ) ) ( not ( = ?auto_711275 ?auto_711278 ) ) ( not ( = ?auto_711275 ?auto_711279 ) ) ( not ( = ?auto_711275 ?auto_711280 ) ) ( not ( = ?auto_711275 ?auto_711281 ) ) ( not ( = ?auto_711275 ?auto_711282 ) ) ( not ( = ?auto_711275 ?auto_711283 ) ) ( not ( = ?auto_711275 ?auto_711284 ) ) ( not ( = ?auto_711276 ?auto_711277 ) ) ( not ( = ?auto_711276 ?auto_711278 ) ) ( not ( = ?auto_711276 ?auto_711279 ) ) ( not ( = ?auto_711276 ?auto_711280 ) ) ( not ( = ?auto_711276 ?auto_711281 ) ) ( not ( = ?auto_711276 ?auto_711282 ) ) ( not ( = ?auto_711276 ?auto_711283 ) ) ( not ( = ?auto_711276 ?auto_711284 ) ) ( not ( = ?auto_711277 ?auto_711278 ) ) ( not ( = ?auto_711277 ?auto_711279 ) ) ( not ( = ?auto_711277 ?auto_711280 ) ) ( not ( = ?auto_711277 ?auto_711281 ) ) ( not ( = ?auto_711277 ?auto_711282 ) ) ( not ( = ?auto_711277 ?auto_711283 ) ) ( not ( = ?auto_711277 ?auto_711284 ) ) ( not ( = ?auto_711278 ?auto_711279 ) ) ( not ( = ?auto_711278 ?auto_711280 ) ) ( not ( = ?auto_711278 ?auto_711281 ) ) ( not ( = ?auto_711278 ?auto_711282 ) ) ( not ( = ?auto_711278 ?auto_711283 ) ) ( not ( = ?auto_711278 ?auto_711284 ) ) ( not ( = ?auto_711279 ?auto_711280 ) ) ( not ( = ?auto_711279 ?auto_711281 ) ) ( not ( = ?auto_711279 ?auto_711282 ) ) ( not ( = ?auto_711279 ?auto_711283 ) ) ( not ( = ?auto_711279 ?auto_711284 ) ) ( not ( = ?auto_711280 ?auto_711281 ) ) ( not ( = ?auto_711280 ?auto_711282 ) ) ( not ( = ?auto_711280 ?auto_711283 ) ) ( not ( = ?auto_711280 ?auto_711284 ) ) ( not ( = ?auto_711281 ?auto_711282 ) ) ( not ( = ?auto_711281 ?auto_711283 ) ) ( not ( = ?auto_711281 ?auto_711284 ) ) ( not ( = ?auto_711282 ?auto_711283 ) ) ( not ( = ?auto_711282 ?auto_711284 ) ) ( not ( = ?auto_711283 ?auto_711284 ) ) ( ON ?auto_711282 ?auto_711283 ) ( ON ?auto_711281 ?auto_711282 ) ( ON ?auto_711280 ?auto_711281 ) ( ON ?auto_711279 ?auto_711280 ) ( CLEAR ?auto_711277 ) ( ON ?auto_711278 ?auto_711279 ) ( CLEAR ?auto_711278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_711274 ?auto_711275 ?auto_711276 ?auto_711277 ?auto_711278 )
      ( MAKE-10PILE ?auto_711274 ?auto_711275 ?auto_711276 ?auto_711277 ?auto_711278 ?auto_711279 ?auto_711280 ?auto_711281 ?auto_711282 ?auto_711283 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711316 - BLOCK
      ?auto_711317 - BLOCK
      ?auto_711318 - BLOCK
      ?auto_711319 - BLOCK
      ?auto_711320 - BLOCK
      ?auto_711321 - BLOCK
      ?auto_711322 - BLOCK
      ?auto_711323 - BLOCK
      ?auto_711324 - BLOCK
      ?auto_711325 - BLOCK
    )
    :vars
    (
      ?auto_711326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711325 ?auto_711326 ) ( ON-TABLE ?auto_711316 ) ( ON ?auto_711317 ?auto_711316 ) ( ON ?auto_711318 ?auto_711317 ) ( not ( = ?auto_711316 ?auto_711317 ) ) ( not ( = ?auto_711316 ?auto_711318 ) ) ( not ( = ?auto_711316 ?auto_711319 ) ) ( not ( = ?auto_711316 ?auto_711320 ) ) ( not ( = ?auto_711316 ?auto_711321 ) ) ( not ( = ?auto_711316 ?auto_711322 ) ) ( not ( = ?auto_711316 ?auto_711323 ) ) ( not ( = ?auto_711316 ?auto_711324 ) ) ( not ( = ?auto_711316 ?auto_711325 ) ) ( not ( = ?auto_711316 ?auto_711326 ) ) ( not ( = ?auto_711317 ?auto_711318 ) ) ( not ( = ?auto_711317 ?auto_711319 ) ) ( not ( = ?auto_711317 ?auto_711320 ) ) ( not ( = ?auto_711317 ?auto_711321 ) ) ( not ( = ?auto_711317 ?auto_711322 ) ) ( not ( = ?auto_711317 ?auto_711323 ) ) ( not ( = ?auto_711317 ?auto_711324 ) ) ( not ( = ?auto_711317 ?auto_711325 ) ) ( not ( = ?auto_711317 ?auto_711326 ) ) ( not ( = ?auto_711318 ?auto_711319 ) ) ( not ( = ?auto_711318 ?auto_711320 ) ) ( not ( = ?auto_711318 ?auto_711321 ) ) ( not ( = ?auto_711318 ?auto_711322 ) ) ( not ( = ?auto_711318 ?auto_711323 ) ) ( not ( = ?auto_711318 ?auto_711324 ) ) ( not ( = ?auto_711318 ?auto_711325 ) ) ( not ( = ?auto_711318 ?auto_711326 ) ) ( not ( = ?auto_711319 ?auto_711320 ) ) ( not ( = ?auto_711319 ?auto_711321 ) ) ( not ( = ?auto_711319 ?auto_711322 ) ) ( not ( = ?auto_711319 ?auto_711323 ) ) ( not ( = ?auto_711319 ?auto_711324 ) ) ( not ( = ?auto_711319 ?auto_711325 ) ) ( not ( = ?auto_711319 ?auto_711326 ) ) ( not ( = ?auto_711320 ?auto_711321 ) ) ( not ( = ?auto_711320 ?auto_711322 ) ) ( not ( = ?auto_711320 ?auto_711323 ) ) ( not ( = ?auto_711320 ?auto_711324 ) ) ( not ( = ?auto_711320 ?auto_711325 ) ) ( not ( = ?auto_711320 ?auto_711326 ) ) ( not ( = ?auto_711321 ?auto_711322 ) ) ( not ( = ?auto_711321 ?auto_711323 ) ) ( not ( = ?auto_711321 ?auto_711324 ) ) ( not ( = ?auto_711321 ?auto_711325 ) ) ( not ( = ?auto_711321 ?auto_711326 ) ) ( not ( = ?auto_711322 ?auto_711323 ) ) ( not ( = ?auto_711322 ?auto_711324 ) ) ( not ( = ?auto_711322 ?auto_711325 ) ) ( not ( = ?auto_711322 ?auto_711326 ) ) ( not ( = ?auto_711323 ?auto_711324 ) ) ( not ( = ?auto_711323 ?auto_711325 ) ) ( not ( = ?auto_711323 ?auto_711326 ) ) ( not ( = ?auto_711324 ?auto_711325 ) ) ( not ( = ?auto_711324 ?auto_711326 ) ) ( not ( = ?auto_711325 ?auto_711326 ) ) ( ON ?auto_711324 ?auto_711325 ) ( ON ?auto_711323 ?auto_711324 ) ( ON ?auto_711322 ?auto_711323 ) ( ON ?auto_711321 ?auto_711322 ) ( ON ?auto_711320 ?auto_711321 ) ( CLEAR ?auto_711318 ) ( ON ?auto_711319 ?auto_711320 ) ( CLEAR ?auto_711319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_711316 ?auto_711317 ?auto_711318 ?auto_711319 )
      ( MAKE-10PILE ?auto_711316 ?auto_711317 ?auto_711318 ?auto_711319 ?auto_711320 ?auto_711321 ?auto_711322 ?auto_711323 ?auto_711324 ?auto_711325 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711358 - BLOCK
      ?auto_711359 - BLOCK
      ?auto_711360 - BLOCK
      ?auto_711361 - BLOCK
      ?auto_711362 - BLOCK
      ?auto_711363 - BLOCK
      ?auto_711364 - BLOCK
      ?auto_711365 - BLOCK
      ?auto_711366 - BLOCK
      ?auto_711367 - BLOCK
    )
    :vars
    (
      ?auto_711368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711367 ?auto_711368 ) ( ON-TABLE ?auto_711358 ) ( ON ?auto_711359 ?auto_711358 ) ( not ( = ?auto_711358 ?auto_711359 ) ) ( not ( = ?auto_711358 ?auto_711360 ) ) ( not ( = ?auto_711358 ?auto_711361 ) ) ( not ( = ?auto_711358 ?auto_711362 ) ) ( not ( = ?auto_711358 ?auto_711363 ) ) ( not ( = ?auto_711358 ?auto_711364 ) ) ( not ( = ?auto_711358 ?auto_711365 ) ) ( not ( = ?auto_711358 ?auto_711366 ) ) ( not ( = ?auto_711358 ?auto_711367 ) ) ( not ( = ?auto_711358 ?auto_711368 ) ) ( not ( = ?auto_711359 ?auto_711360 ) ) ( not ( = ?auto_711359 ?auto_711361 ) ) ( not ( = ?auto_711359 ?auto_711362 ) ) ( not ( = ?auto_711359 ?auto_711363 ) ) ( not ( = ?auto_711359 ?auto_711364 ) ) ( not ( = ?auto_711359 ?auto_711365 ) ) ( not ( = ?auto_711359 ?auto_711366 ) ) ( not ( = ?auto_711359 ?auto_711367 ) ) ( not ( = ?auto_711359 ?auto_711368 ) ) ( not ( = ?auto_711360 ?auto_711361 ) ) ( not ( = ?auto_711360 ?auto_711362 ) ) ( not ( = ?auto_711360 ?auto_711363 ) ) ( not ( = ?auto_711360 ?auto_711364 ) ) ( not ( = ?auto_711360 ?auto_711365 ) ) ( not ( = ?auto_711360 ?auto_711366 ) ) ( not ( = ?auto_711360 ?auto_711367 ) ) ( not ( = ?auto_711360 ?auto_711368 ) ) ( not ( = ?auto_711361 ?auto_711362 ) ) ( not ( = ?auto_711361 ?auto_711363 ) ) ( not ( = ?auto_711361 ?auto_711364 ) ) ( not ( = ?auto_711361 ?auto_711365 ) ) ( not ( = ?auto_711361 ?auto_711366 ) ) ( not ( = ?auto_711361 ?auto_711367 ) ) ( not ( = ?auto_711361 ?auto_711368 ) ) ( not ( = ?auto_711362 ?auto_711363 ) ) ( not ( = ?auto_711362 ?auto_711364 ) ) ( not ( = ?auto_711362 ?auto_711365 ) ) ( not ( = ?auto_711362 ?auto_711366 ) ) ( not ( = ?auto_711362 ?auto_711367 ) ) ( not ( = ?auto_711362 ?auto_711368 ) ) ( not ( = ?auto_711363 ?auto_711364 ) ) ( not ( = ?auto_711363 ?auto_711365 ) ) ( not ( = ?auto_711363 ?auto_711366 ) ) ( not ( = ?auto_711363 ?auto_711367 ) ) ( not ( = ?auto_711363 ?auto_711368 ) ) ( not ( = ?auto_711364 ?auto_711365 ) ) ( not ( = ?auto_711364 ?auto_711366 ) ) ( not ( = ?auto_711364 ?auto_711367 ) ) ( not ( = ?auto_711364 ?auto_711368 ) ) ( not ( = ?auto_711365 ?auto_711366 ) ) ( not ( = ?auto_711365 ?auto_711367 ) ) ( not ( = ?auto_711365 ?auto_711368 ) ) ( not ( = ?auto_711366 ?auto_711367 ) ) ( not ( = ?auto_711366 ?auto_711368 ) ) ( not ( = ?auto_711367 ?auto_711368 ) ) ( ON ?auto_711366 ?auto_711367 ) ( ON ?auto_711365 ?auto_711366 ) ( ON ?auto_711364 ?auto_711365 ) ( ON ?auto_711363 ?auto_711364 ) ( ON ?auto_711362 ?auto_711363 ) ( ON ?auto_711361 ?auto_711362 ) ( CLEAR ?auto_711359 ) ( ON ?auto_711360 ?auto_711361 ) ( CLEAR ?auto_711360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_711358 ?auto_711359 ?auto_711360 )
      ( MAKE-10PILE ?auto_711358 ?auto_711359 ?auto_711360 ?auto_711361 ?auto_711362 ?auto_711363 ?auto_711364 ?auto_711365 ?auto_711366 ?auto_711367 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711400 - BLOCK
      ?auto_711401 - BLOCK
      ?auto_711402 - BLOCK
      ?auto_711403 - BLOCK
      ?auto_711404 - BLOCK
      ?auto_711405 - BLOCK
      ?auto_711406 - BLOCK
      ?auto_711407 - BLOCK
      ?auto_711408 - BLOCK
      ?auto_711409 - BLOCK
    )
    :vars
    (
      ?auto_711410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711409 ?auto_711410 ) ( ON-TABLE ?auto_711400 ) ( not ( = ?auto_711400 ?auto_711401 ) ) ( not ( = ?auto_711400 ?auto_711402 ) ) ( not ( = ?auto_711400 ?auto_711403 ) ) ( not ( = ?auto_711400 ?auto_711404 ) ) ( not ( = ?auto_711400 ?auto_711405 ) ) ( not ( = ?auto_711400 ?auto_711406 ) ) ( not ( = ?auto_711400 ?auto_711407 ) ) ( not ( = ?auto_711400 ?auto_711408 ) ) ( not ( = ?auto_711400 ?auto_711409 ) ) ( not ( = ?auto_711400 ?auto_711410 ) ) ( not ( = ?auto_711401 ?auto_711402 ) ) ( not ( = ?auto_711401 ?auto_711403 ) ) ( not ( = ?auto_711401 ?auto_711404 ) ) ( not ( = ?auto_711401 ?auto_711405 ) ) ( not ( = ?auto_711401 ?auto_711406 ) ) ( not ( = ?auto_711401 ?auto_711407 ) ) ( not ( = ?auto_711401 ?auto_711408 ) ) ( not ( = ?auto_711401 ?auto_711409 ) ) ( not ( = ?auto_711401 ?auto_711410 ) ) ( not ( = ?auto_711402 ?auto_711403 ) ) ( not ( = ?auto_711402 ?auto_711404 ) ) ( not ( = ?auto_711402 ?auto_711405 ) ) ( not ( = ?auto_711402 ?auto_711406 ) ) ( not ( = ?auto_711402 ?auto_711407 ) ) ( not ( = ?auto_711402 ?auto_711408 ) ) ( not ( = ?auto_711402 ?auto_711409 ) ) ( not ( = ?auto_711402 ?auto_711410 ) ) ( not ( = ?auto_711403 ?auto_711404 ) ) ( not ( = ?auto_711403 ?auto_711405 ) ) ( not ( = ?auto_711403 ?auto_711406 ) ) ( not ( = ?auto_711403 ?auto_711407 ) ) ( not ( = ?auto_711403 ?auto_711408 ) ) ( not ( = ?auto_711403 ?auto_711409 ) ) ( not ( = ?auto_711403 ?auto_711410 ) ) ( not ( = ?auto_711404 ?auto_711405 ) ) ( not ( = ?auto_711404 ?auto_711406 ) ) ( not ( = ?auto_711404 ?auto_711407 ) ) ( not ( = ?auto_711404 ?auto_711408 ) ) ( not ( = ?auto_711404 ?auto_711409 ) ) ( not ( = ?auto_711404 ?auto_711410 ) ) ( not ( = ?auto_711405 ?auto_711406 ) ) ( not ( = ?auto_711405 ?auto_711407 ) ) ( not ( = ?auto_711405 ?auto_711408 ) ) ( not ( = ?auto_711405 ?auto_711409 ) ) ( not ( = ?auto_711405 ?auto_711410 ) ) ( not ( = ?auto_711406 ?auto_711407 ) ) ( not ( = ?auto_711406 ?auto_711408 ) ) ( not ( = ?auto_711406 ?auto_711409 ) ) ( not ( = ?auto_711406 ?auto_711410 ) ) ( not ( = ?auto_711407 ?auto_711408 ) ) ( not ( = ?auto_711407 ?auto_711409 ) ) ( not ( = ?auto_711407 ?auto_711410 ) ) ( not ( = ?auto_711408 ?auto_711409 ) ) ( not ( = ?auto_711408 ?auto_711410 ) ) ( not ( = ?auto_711409 ?auto_711410 ) ) ( ON ?auto_711408 ?auto_711409 ) ( ON ?auto_711407 ?auto_711408 ) ( ON ?auto_711406 ?auto_711407 ) ( ON ?auto_711405 ?auto_711406 ) ( ON ?auto_711404 ?auto_711405 ) ( ON ?auto_711403 ?auto_711404 ) ( ON ?auto_711402 ?auto_711403 ) ( CLEAR ?auto_711400 ) ( ON ?auto_711401 ?auto_711402 ) ( CLEAR ?auto_711401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_711400 ?auto_711401 )
      ( MAKE-10PILE ?auto_711400 ?auto_711401 ?auto_711402 ?auto_711403 ?auto_711404 ?auto_711405 ?auto_711406 ?auto_711407 ?auto_711408 ?auto_711409 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_711442 - BLOCK
      ?auto_711443 - BLOCK
      ?auto_711444 - BLOCK
      ?auto_711445 - BLOCK
      ?auto_711446 - BLOCK
      ?auto_711447 - BLOCK
      ?auto_711448 - BLOCK
      ?auto_711449 - BLOCK
      ?auto_711450 - BLOCK
      ?auto_711451 - BLOCK
    )
    :vars
    (
      ?auto_711452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711451 ?auto_711452 ) ( not ( = ?auto_711442 ?auto_711443 ) ) ( not ( = ?auto_711442 ?auto_711444 ) ) ( not ( = ?auto_711442 ?auto_711445 ) ) ( not ( = ?auto_711442 ?auto_711446 ) ) ( not ( = ?auto_711442 ?auto_711447 ) ) ( not ( = ?auto_711442 ?auto_711448 ) ) ( not ( = ?auto_711442 ?auto_711449 ) ) ( not ( = ?auto_711442 ?auto_711450 ) ) ( not ( = ?auto_711442 ?auto_711451 ) ) ( not ( = ?auto_711442 ?auto_711452 ) ) ( not ( = ?auto_711443 ?auto_711444 ) ) ( not ( = ?auto_711443 ?auto_711445 ) ) ( not ( = ?auto_711443 ?auto_711446 ) ) ( not ( = ?auto_711443 ?auto_711447 ) ) ( not ( = ?auto_711443 ?auto_711448 ) ) ( not ( = ?auto_711443 ?auto_711449 ) ) ( not ( = ?auto_711443 ?auto_711450 ) ) ( not ( = ?auto_711443 ?auto_711451 ) ) ( not ( = ?auto_711443 ?auto_711452 ) ) ( not ( = ?auto_711444 ?auto_711445 ) ) ( not ( = ?auto_711444 ?auto_711446 ) ) ( not ( = ?auto_711444 ?auto_711447 ) ) ( not ( = ?auto_711444 ?auto_711448 ) ) ( not ( = ?auto_711444 ?auto_711449 ) ) ( not ( = ?auto_711444 ?auto_711450 ) ) ( not ( = ?auto_711444 ?auto_711451 ) ) ( not ( = ?auto_711444 ?auto_711452 ) ) ( not ( = ?auto_711445 ?auto_711446 ) ) ( not ( = ?auto_711445 ?auto_711447 ) ) ( not ( = ?auto_711445 ?auto_711448 ) ) ( not ( = ?auto_711445 ?auto_711449 ) ) ( not ( = ?auto_711445 ?auto_711450 ) ) ( not ( = ?auto_711445 ?auto_711451 ) ) ( not ( = ?auto_711445 ?auto_711452 ) ) ( not ( = ?auto_711446 ?auto_711447 ) ) ( not ( = ?auto_711446 ?auto_711448 ) ) ( not ( = ?auto_711446 ?auto_711449 ) ) ( not ( = ?auto_711446 ?auto_711450 ) ) ( not ( = ?auto_711446 ?auto_711451 ) ) ( not ( = ?auto_711446 ?auto_711452 ) ) ( not ( = ?auto_711447 ?auto_711448 ) ) ( not ( = ?auto_711447 ?auto_711449 ) ) ( not ( = ?auto_711447 ?auto_711450 ) ) ( not ( = ?auto_711447 ?auto_711451 ) ) ( not ( = ?auto_711447 ?auto_711452 ) ) ( not ( = ?auto_711448 ?auto_711449 ) ) ( not ( = ?auto_711448 ?auto_711450 ) ) ( not ( = ?auto_711448 ?auto_711451 ) ) ( not ( = ?auto_711448 ?auto_711452 ) ) ( not ( = ?auto_711449 ?auto_711450 ) ) ( not ( = ?auto_711449 ?auto_711451 ) ) ( not ( = ?auto_711449 ?auto_711452 ) ) ( not ( = ?auto_711450 ?auto_711451 ) ) ( not ( = ?auto_711450 ?auto_711452 ) ) ( not ( = ?auto_711451 ?auto_711452 ) ) ( ON ?auto_711450 ?auto_711451 ) ( ON ?auto_711449 ?auto_711450 ) ( ON ?auto_711448 ?auto_711449 ) ( ON ?auto_711447 ?auto_711448 ) ( ON ?auto_711446 ?auto_711447 ) ( ON ?auto_711445 ?auto_711446 ) ( ON ?auto_711444 ?auto_711445 ) ( ON ?auto_711443 ?auto_711444 ) ( ON ?auto_711442 ?auto_711443 ) ( CLEAR ?auto_711442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_711442 )
      ( MAKE-10PILE ?auto_711442 ?auto_711443 ?auto_711444 ?auto_711445 ?auto_711446 ?auto_711447 ?auto_711448 ?auto_711449 ?auto_711450 ?auto_711451 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711485 - BLOCK
      ?auto_711486 - BLOCK
      ?auto_711487 - BLOCK
      ?auto_711488 - BLOCK
      ?auto_711489 - BLOCK
      ?auto_711490 - BLOCK
      ?auto_711491 - BLOCK
      ?auto_711492 - BLOCK
      ?auto_711493 - BLOCK
      ?auto_711494 - BLOCK
      ?auto_711495 - BLOCK
    )
    :vars
    (
      ?auto_711496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_711494 ) ( ON ?auto_711495 ?auto_711496 ) ( CLEAR ?auto_711495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_711485 ) ( ON ?auto_711486 ?auto_711485 ) ( ON ?auto_711487 ?auto_711486 ) ( ON ?auto_711488 ?auto_711487 ) ( ON ?auto_711489 ?auto_711488 ) ( ON ?auto_711490 ?auto_711489 ) ( ON ?auto_711491 ?auto_711490 ) ( ON ?auto_711492 ?auto_711491 ) ( ON ?auto_711493 ?auto_711492 ) ( ON ?auto_711494 ?auto_711493 ) ( not ( = ?auto_711485 ?auto_711486 ) ) ( not ( = ?auto_711485 ?auto_711487 ) ) ( not ( = ?auto_711485 ?auto_711488 ) ) ( not ( = ?auto_711485 ?auto_711489 ) ) ( not ( = ?auto_711485 ?auto_711490 ) ) ( not ( = ?auto_711485 ?auto_711491 ) ) ( not ( = ?auto_711485 ?auto_711492 ) ) ( not ( = ?auto_711485 ?auto_711493 ) ) ( not ( = ?auto_711485 ?auto_711494 ) ) ( not ( = ?auto_711485 ?auto_711495 ) ) ( not ( = ?auto_711485 ?auto_711496 ) ) ( not ( = ?auto_711486 ?auto_711487 ) ) ( not ( = ?auto_711486 ?auto_711488 ) ) ( not ( = ?auto_711486 ?auto_711489 ) ) ( not ( = ?auto_711486 ?auto_711490 ) ) ( not ( = ?auto_711486 ?auto_711491 ) ) ( not ( = ?auto_711486 ?auto_711492 ) ) ( not ( = ?auto_711486 ?auto_711493 ) ) ( not ( = ?auto_711486 ?auto_711494 ) ) ( not ( = ?auto_711486 ?auto_711495 ) ) ( not ( = ?auto_711486 ?auto_711496 ) ) ( not ( = ?auto_711487 ?auto_711488 ) ) ( not ( = ?auto_711487 ?auto_711489 ) ) ( not ( = ?auto_711487 ?auto_711490 ) ) ( not ( = ?auto_711487 ?auto_711491 ) ) ( not ( = ?auto_711487 ?auto_711492 ) ) ( not ( = ?auto_711487 ?auto_711493 ) ) ( not ( = ?auto_711487 ?auto_711494 ) ) ( not ( = ?auto_711487 ?auto_711495 ) ) ( not ( = ?auto_711487 ?auto_711496 ) ) ( not ( = ?auto_711488 ?auto_711489 ) ) ( not ( = ?auto_711488 ?auto_711490 ) ) ( not ( = ?auto_711488 ?auto_711491 ) ) ( not ( = ?auto_711488 ?auto_711492 ) ) ( not ( = ?auto_711488 ?auto_711493 ) ) ( not ( = ?auto_711488 ?auto_711494 ) ) ( not ( = ?auto_711488 ?auto_711495 ) ) ( not ( = ?auto_711488 ?auto_711496 ) ) ( not ( = ?auto_711489 ?auto_711490 ) ) ( not ( = ?auto_711489 ?auto_711491 ) ) ( not ( = ?auto_711489 ?auto_711492 ) ) ( not ( = ?auto_711489 ?auto_711493 ) ) ( not ( = ?auto_711489 ?auto_711494 ) ) ( not ( = ?auto_711489 ?auto_711495 ) ) ( not ( = ?auto_711489 ?auto_711496 ) ) ( not ( = ?auto_711490 ?auto_711491 ) ) ( not ( = ?auto_711490 ?auto_711492 ) ) ( not ( = ?auto_711490 ?auto_711493 ) ) ( not ( = ?auto_711490 ?auto_711494 ) ) ( not ( = ?auto_711490 ?auto_711495 ) ) ( not ( = ?auto_711490 ?auto_711496 ) ) ( not ( = ?auto_711491 ?auto_711492 ) ) ( not ( = ?auto_711491 ?auto_711493 ) ) ( not ( = ?auto_711491 ?auto_711494 ) ) ( not ( = ?auto_711491 ?auto_711495 ) ) ( not ( = ?auto_711491 ?auto_711496 ) ) ( not ( = ?auto_711492 ?auto_711493 ) ) ( not ( = ?auto_711492 ?auto_711494 ) ) ( not ( = ?auto_711492 ?auto_711495 ) ) ( not ( = ?auto_711492 ?auto_711496 ) ) ( not ( = ?auto_711493 ?auto_711494 ) ) ( not ( = ?auto_711493 ?auto_711495 ) ) ( not ( = ?auto_711493 ?auto_711496 ) ) ( not ( = ?auto_711494 ?auto_711495 ) ) ( not ( = ?auto_711494 ?auto_711496 ) ) ( not ( = ?auto_711495 ?auto_711496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_711495 ?auto_711496 )
      ( !STACK ?auto_711495 ?auto_711494 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711531 - BLOCK
      ?auto_711532 - BLOCK
      ?auto_711533 - BLOCK
      ?auto_711534 - BLOCK
      ?auto_711535 - BLOCK
      ?auto_711536 - BLOCK
      ?auto_711537 - BLOCK
      ?auto_711538 - BLOCK
      ?auto_711539 - BLOCK
      ?auto_711540 - BLOCK
      ?auto_711541 - BLOCK
    )
    :vars
    (
      ?auto_711542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711541 ?auto_711542 ) ( ON-TABLE ?auto_711531 ) ( ON ?auto_711532 ?auto_711531 ) ( ON ?auto_711533 ?auto_711532 ) ( ON ?auto_711534 ?auto_711533 ) ( ON ?auto_711535 ?auto_711534 ) ( ON ?auto_711536 ?auto_711535 ) ( ON ?auto_711537 ?auto_711536 ) ( ON ?auto_711538 ?auto_711537 ) ( ON ?auto_711539 ?auto_711538 ) ( not ( = ?auto_711531 ?auto_711532 ) ) ( not ( = ?auto_711531 ?auto_711533 ) ) ( not ( = ?auto_711531 ?auto_711534 ) ) ( not ( = ?auto_711531 ?auto_711535 ) ) ( not ( = ?auto_711531 ?auto_711536 ) ) ( not ( = ?auto_711531 ?auto_711537 ) ) ( not ( = ?auto_711531 ?auto_711538 ) ) ( not ( = ?auto_711531 ?auto_711539 ) ) ( not ( = ?auto_711531 ?auto_711540 ) ) ( not ( = ?auto_711531 ?auto_711541 ) ) ( not ( = ?auto_711531 ?auto_711542 ) ) ( not ( = ?auto_711532 ?auto_711533 ) ) ( not ( = ?auto_711532 ?auto_711534 ) ) ( not ( = ?auto_711532 ?auto_711535 ) ) ( not ( = ?auto_711532 ?auto_711536 ) ) ( not ( = ?auto_711532 ?auto_711537 ) ) ( not ( = ?auto_711532 ?auto_711538 ) ) ( not ( = ?auto_711532 ?auto_711539 ) ) ( not ( = ?auto_711532 ?auto_711540 ) ) ( not ( = ?auto_711532 ?auto_711541 ) ) ( not ( = ?auto_711532 ?auto_711542 ) ) ( not ( = ?auto_711533 ?auto_711534 ) ) ( not ( = ?auto_711533 ?auto_711535 ) ) ( not ( = ?auto_711533 ?auto_711536 ) ) ( not ( = ?auto_711533 ?auto_711537 ) ) ( not ( = ?auto_711533 ?auto_711538 ) ) ( not ( = ?auto_711533 ?auto_711539 ) ) ( not ( = ?auto_711533 ?auto_711540 ) ) ( not ( = ?auto_711533 ?auto_711541 ) ) ( not ( = ?auto_711533 ?auto_711542 ) ) ( not ( = ?auto_711534 ?auto_711535 ) ) ( not ( = ?auto_711534 ?auto_711536 ) ) ( not ( = ?auto_711534 ?auto_711537 ) ) ( not ( = ?auto_711534 ?auto_711538 ) ) ( not ( = ?auto_711534 ?auto_711539 ) ) ( not ( = ?auto_711534 ?auto_711540 ) ) ( not ( = ?auto_711534 ?auto_711541 ) ) ( not ( = ?auto_711534 ?auto_711542 ) ) ( not ( = ?auto_711535 ?auto_711536 ) ) ( not ( = ?auto_711535 ?auto_711537 ) ) ( not ( = ?auto_711535 ?auto_711538 ) ) ( not ( = ?auto_711535 ?auto_711539 ) ) ( not ( = ?auto_711535 ?auto_711540 ) ) ( not ( = ?auto_711535 ?auto_711541 ) ) ( not ( = ?auto_711535 ?auto_711542 ) ) ( not ( = ?auto_711536 ?auto_711537 ) ) ( not ( = ?auto_711536 ?auto_711538 ) ) ( not ( = ?auto_711536 ?auto_711539 ) ) ( not ( = ?auto_711536 ?auto_711540 ) ) ( not ( = ?auto_711536 ?auto_711541 ) ) ( not ( = ?auto_711536 ?auto_711542 ) ) ( not ( = ?auto_711537 ?auto_711538 ) ) ( not ( = ?auto_711537 ?auto_711539 ) ) ( not ( = ?auto_711537 ?auto_711540 ) ) ( not ( = ?auto_711537 ?auto_711541 ) ) ( not ( = ?auto_711537 ?auto_711542 ) ) ( not ( = ?auto_711538 ?auto_711539 ) ) ( not ( = ?auto_711538 ?auto_711540 ) ) ( not ( = ?auto_711538 ?auto_711541 ) ) ( not ( = ?auto_711538 ?auto_711542 ) ) ( not ( = ?auto_711539 ?auto_711540 ) ) ( not ( = ?auto_711539 ?auto_711541 ) ) ( not ( = ?auto_711539 ?auto_711542 ) ) ( not ( = ?auto_711540 ?auto_711541 ) ) ( not ( = ?auto_711540 ?auto_711542 ) ) ( not ( = ?auto_711541 ?auto_711542 ) ) ( CLEAR ?auto_711539 ) ( ON ?auto_711540 ?auto_711541 ) ( CLEAR ?auto_711540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_711531 ?auto_711532 ?auto_711533 ?auto_711534 ?auto_711535 ?auto_711536 ?auto_711537 ?auto_711538 ?auto_711539 ?auto_711540 )
      ( MAKE-11PILE ?auto_711531 ?auto_711532 ?auto_711533 ?auto_711534 ?auto_711535 ?auto_711536 ?auto_711537 ?auto_711538 ?auto_711539 ?auto_711540 ?auto_711541 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711577 - BLOCK
      ?auto_711578 - BLOCK
      ?auto_711579 - BLOCK
      ?auto_711580 - BLOCK
      ?auto_711581 - BLOCK
      ?auto_711582 - BLOCK
      ?auto_711583 - BLOCK
      ?auto_711584 - BLOCK
      ?auto_711585 - BLOCK
      ?auto_711586 - BLOCK
      ?auto_711587 - BLOCK
    )
    :vars
    (
      ?auto_711588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711587 ?auto_711588 ) ( ON-TABLE ?auto_711577 ) ( ON ?auto_711578 ?auto_711577 ) ( ON ?auto_711579 ?auto_711578 ) ( ON ?auto_711580 ?auto_711579 ) ( ON ?auto_711581 ?auto_711580 ) ( ON ?auto_711582 ?auto_711581 ) ( ON ?auto_711583 ?auto_711582 ) ( ON ?auto_711584 ?auto_711583 ) ( not ( = ?auto_711577 ?auto_711578 ) ) ( not ( = ?auto_711577 ?auto_711579 ) ) ( not ( = ?auto_711577 ?auto_711580 ) ) ( not ( = ?auto_711577 ?auto_711581 ) ) ( not ( = ?auto_711577 ?auto_711582 ) ) ( not ( = ?auto_711577 ?auto_711583 ) ) ( not ( = ?auto_711577 ?auto_711584 ) ) ( not ( = ?auto_711577 ?auto_711585 ) ) ( not ( = ?auto_711577 ?auto_711586 ) ) ( not ( = ?auto_711577 ?auto_711587 ) ) ( not ( = ?auto_711577 ?auto_711588 ) ) ( not ( = ?auto_711578 ?auto_711579 ) ) ( not ( = ?auto_711578 ?auto_711580 ) ) ( not ( = ?auto_711578 ?auto_711581 ) ) ( not ( = ?auto_711578 ?auto_711582 ) ) ( not ( = ?auto_711578 ?auto_711583 ) ) ( not ( = ?auto_711578 ?auto_711584 ) ) ( not ( = ?auto_711578 ?auto_711585 ) ) ( not ( = ?auto_711578 ?auto_711586 ) ) ( not ( = ?auto_711578 ?auto_711587 ) ) ( not ( = ?auto_711578 ?auto_711588 ) ) ( not ( = ?auto_711579 ?auto_711580 ) ) ( not ( = ?auto_711579 ?auto_711581 ) ) ( not ( = ?auto_711579 ?auto_711582 ) ) ( not ( = ?auto_711579 ?auto_711583 ) ) ( not ( = ?auto_711579 ?auto_711584 ) ) ( not ( = ?auto_711579 ?auto_711585 ) ) ( not ( = ?auto_711579 ?auto_711586 ) ) ( not ( = ?auto_711579 ?auto_711587 ) ) ( not ( = ?auto_711579 ?auto_711588 ) ) ( not ( = ?auto_711580 ?auto_711581 ) ) ( not ( = ?auto_711580 ?auto_711582 ) ) ( not ( = ?auto_711580 ?auto_711583 ) ) ( not ( = ?auto_711580 ?auto_711584 ) ) ( not ( = ?auto_711580 ?auto_711585 ) ) ( not ( = ?auto_711580 ?auto_711586 ) ) ( not ( = ?auto_711580 ?auto_711587 ) ) ( not ( = ?auto_711580 ?auto_711588 ) ) ( not ( = ?auto_711581 ?auto_711582 ) ) ( not ( = ?auto_711581 ?auto_711583 ) ) ( not ( = ?auto_711581 ?auto_711584 ) ) ( not ( = ?auto_711581 ?auto_711585 ) ) ( not ( = ?auto_711581 ?auto_711586 ) ) ( not ( = ?auto_711581 ?auto_711587 ) ) ( not ( = ?auto_711581 ?auto_711588 ) ) ( not ( = ?auto_711582 ?auto_711583 ) ) ( not ( = ?auto_711582 ?auto_711584 ) ) ( not ( = ?auto_711582 ?auto_711585 ) ) ( not ( = ?auto_711582 ?auto_711586 ) ) ( not ( = ?auto_711582 ?auto_711587 ) ) ( not ( = ?auto_711582 ?auto_711588 ) ) ( not ( = ?auto_711583 ?auto_711584 ) ) ( not ( = ?auto_711583 ?auto_711585 ) ) ( not ( = ?auto_711583 ?auto_711586 ) ) ( not ( = ?auto_711583 ?auto_711587 ) ) ( not ( = ?auto_711583 ?auto_711588 ) ) ( not ( = ?auto_711584 ?auto_711585 ) ) ( not ( = ?auto_711584 ?auto_711586 ) ) ( not ( = ?auto_711584 ?auto_711587 ) ) ( not ( = ?auto_711584 ?auto_711588 ) ) ( not ( = ?auto_711585 ?auto_711586 ) ) ( not ( = ?auto_711585 ?auto_711587 ) ) ( not ( = ?auto_711585 ?auto_711588 ) ) ( not ( = ?auto_711586 ?auto_711587 ) ) ( not ( = ?auto_711586 ?auto_711588 ) ) ( not ( = ?auto_711587 ?auto_711588 ) ) ( ON ?auto_711586 ?auto_711587 ) ( CLEAR ?auto_711584 ) ( ON ?auto_711585 ?auto_711586 ) ( CLEAR ?auto_711585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_711577 ?auto_711578 ?auto_711579 ?auto_711580 ?auto_711581 ?auto_711582 ?auto_711583 ?auto_711584 ?auto_711585 )
      ( MAKE-11PILE ?auto_711577 ?auto_711578 ?auto_711579 ?auto_711580 ?auto_711581 ?auto_711582 ?auto_711583 ?auto_711584 ?auto_711585 ?auto_711586 ?auto_711587 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711623 - BLOCK
      ?auto_711624 - BLOCK
      ?auto_711625 - BLOCK
      ?auto_711626 - BLOCK
      ?auto_711627 - BLOCK
      ?auto_711628 - BLOCK
      ?auto_711629 - BLOCK
      ?auto_711630 - BLOCK
      ?auto_711631 - BLOCK
      ?auto_711632 - BLOCK
      ?auto_711633 - BLOCK
    )
    :vars
    (
      ?auto_711634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711633 ?auto_711634 ) ( ON-TABLE ?auto_711623 ) ( ON ?auto_711624 ?auto_711623 ) ( ON ?auto_711625 ?auto_711624 ) ( ON ?auto_711626 ?auto_711625 ) ( ON ?auto_711627 ?auto_711626 ) ( ON ?auto_711628 ?auto_711627 ) ( ON ?auto_711629 ?auto_711628 ) ( not ( = ?auto_711623 ?auto_711624 ) ) ( not ( = ?auto_711623 ?auto_711625 ) ) ( not ( = ?auto_711623 ?auto_711626 ) ) ( not ( = ?auto_711623 ?auto_711627 ) ) ( not ( = ?auto_711623 ?auto_711628 ) ) ( not ( = ?auto_711623 ?auto_711629 ) ) ( not ( = ?auto_711623 ?auto_711630 ) ) ( not ( = ?auto_711623 ?auto_711631 ) ) ( not ( = ?auto_711623 ?auto_711632 ) ) ( not ( = ?auto_711623 ?auto_711633 ) ) ( not ( = ?auto_711623 ?auto_711634 ) ) ( not ( = ?auto_711624 ?auto_711625 ) ) ( not ( = ?auto_711624 ?auto_711626 ) ) ( not ( = ?auto_711624 ?auto_711627 ) ) ( not ( = ?auto_711624 ?auto_711628 ) ) ( not ( = ?auto_711624 ?auto_711629 ) ) ( not ( = ?auto_711624 ?auto_711630 ) ) ( not ( = ?auto_711624 ?auto_711631 ) ) ( not ( = ?auto_711624 ?auto_711632 ) ) ( not ( = ?auto_711624 ?auto_711633 ) ) ( not ( = ?auto_711624 ?auto_711634 ) ) ( not ( = ?auto_711625 ?auto_711626 ) ) ( not ( = ?auto_711625 ?auto_711627 ) ) ( not ( = ?auto_711625 ?auto_711628 ) ) ( not ( = ?auto_711625 ?auto_711629 ) ) ( not ( = ?auto_711625 ?auto_711630 ) ) ( not ( = ?auto_711625 ?auto_711631 ) ) ( not ( = ?auto_711625 ?auto_711632 ) ) ( not ( = ?auto_711625 ?auto_711633 ) ) ( not ( = ?auto_711625 ?auto_711634 ) ) ( not ( = ?auto_711626 ?auto_711627 ) ) ( not ( = ?auto_711626 ?auto_711628 ) ) ( not ( = ?auto_711626 ?auto_711629 ) ) ( not ( = ?auto_711626 ?auto_711630 ) ) ( not ( = ?auto_711626 ?auto_711631 ) ) ( not ( = ?auto_711626 ?auto_711632 ) ) ( not ( = ?auto_711626 ?auto_711633 ) ) ( not ( = ?auto_711626 ?auto_711634 ) ) ( not ( = ?auto_711627 ?auto_711628 ) ) ( not ( = ?auto_711627 ?auto_711629 ) ) ( not ( = ?auto_711627 ?auto_711630 ) ) ( not ( = ?auto_711627 ?auto_711631 ) ) ( not ( = ?auto_711627 ?auto_711632 ) ) ( not ( = ?auto_711627 ?auto_711633 ) ) ( not ( = ?auto_711627 ?auto_711634 ) ) ( not ( = ?auto_711628 ?auto_711629 ) ) ( not ( = ?auto_711628 ?auto_711630 ) ) ( not ( = ?auto_711628 ?auto_711631 ) ) ( not ( = ?auto_711628 ?auto_711632 ) ) ( not ( = ?auto_711628 ?auto_711633 ) ) ( not ( = ?auto_711628 ?auto_711634 ) ) ( not ( = ?auto_711629 ?auto_711630 ) ) ( not ( = ?auto_711629 ?auto_711631 ) ) ( not ( = ?auto_711629 ?auto_711632 ) ) ( not ( = ?auto_711629 ?auto_711633 ) ) ( not ( = ?auto_711629 ?auto_711634 ) ) ( not ( = ?auto_711630 ?auto_711631 ) ) ( not ( = ?auto_711630 ?auto_711632 ) ) ( not ( = ?auto_711630 ?auto_711633 ) ) ( not ( = ?auto_711630 ?auto_711634 ) ) ( not ( = ?auto_711631 ?auto_711632 ) ) ( not ( = ?auto_711631 ?auto_711633 ) ) ( not ( = ?auto_711631 ?auto_711634 ) ) ( not ( = ?auto_711632 ?auto_711633 ) ) ( not ( = ?auto_711632 ?auto_711634 ) ) ( not ( = ?auto_711633 ?auto_711634 ) ) ( ON ?auto_711632 ?auto_711633 ) ( ON ?auto_711631 ?auto_711632 ) ( CLEAR ?auto_711629 ) ( ON ?auto_711630 ?auto_711631 ) ( CLEAR ?auto_711630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_711623 ?auto_711624 ?auto_711625 ?auto_711626 ?auto_711627 ?auto_711628 ?auto_711629 ?auto_711630 )
      ( MAKE-11PILE ?auto_711623 ?auto_711624 ?auto_711625 ?auto_711626 ?auto_711627 ?auto_711628 ?auto_711629 ?auto_711630 ?auto_711631 ?auto_711632 ?auto_711633 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711669 - BLOCK
      ?auto_711670 - BLOCK
      ?auto_711671 - BLOCK
      ?auto_711672 - BLOCK
      ?auto_711673 - BLOCK
      ?auto_711674 - BLOCK
      ?auto_711675 - BLOCK
      ?auto_711676 - BLOCK
      ?auto_711677 - BLOCK
      ?auto_711678 - BLOCK
      ?auto_711679 - BLOCK
    )
    :vars
    (
      ?auto_711680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711679 ?auto_711680 ) ( ON-TABLE ?auto_711669 ) ( ON ?auto_711670 ?auto_711669 ) ( ON ?auto_711671 ?auto_711670 ) ( ON ?auto_711672 ?auto_711671 ) ( ON ?auto_711673 ?auto_711672 ) ( ON ?auto_711674 ?auto_711673 ) ( not ( = ?auto_711669 ?auto_711670 ) ) ( not ( = ?auto_711669 ?auto_711671 ) ) ( not ( = ?auto_711669 ?auto_711672 ) ) ( not ( = ?auto_711669 ?auto_711673 ) ) ( not ( = ?auto_711669 ?auto_711674 ) ) ( not ( = ?auto_711669 ?auto_711675 ) ) ( not ( = ?auto_711669 ?auto_711676 ) ) ( not ( = ?auto_711669 ?auto_711677 ) ) ( not ( = ?auto_711669 ?auto_711678 ) ) ( not ( = ?auto_711669 ?auto_711679 ) ) ( not ( = ?auto_711669 ?auto_711680 ) ) ( not ( = ?auto_711670 ?auto_711671 ) ) ( not ( = ?auto_711670 ?auto_711672 ) ) ( not ( = ?auto_711670 ?auto_711673 ) ) ( not ( = ?auto_711670 ?auto_711674 ) ) ( not ( = ?auto_711670 ?auto_711675 ) ) ( not ( = ?auto_711670 ?auto_711676 ) ) ( not ( = ?auto_711670 ?auto_711677 ) ) ( not ( = ?auto_711670 ?auto_711678 ) ) ( not ( = ?auto_711670 ?auto_711679 ) ) ( not ( = ?auto_711670 ?auto_711680 ) ) ( not ( = ?auto_711671 ?auto_711672 ) ) ( not ( = ?auto_711671 ?auto_711673 ) ) ( not ( = ?auto_711671 ?auto_711674 ) ) ( not ( = ?auto_711671 ?auto_711675 ) ) ( not ( = ?auto_711671 ?auto_711676 ) ) ( not ( = ?auto_711671 ?auto_711677 ) ) ( not ( = ?auto_711671 ?auto_711678 ) ) ( not ( = ?auto_711671 ?auto_711679 ) ) ( not ( = ?auto_711671 ?auto_711680 ) ) ( not ( = ?auto_711672 ?auto_711673 ) ) ( not ( = ?auto_711672 ?auto_711674 ) ) ( not ( = ?auto_711672 ?auto_711675 ) ) ( not ( = ?auto_711672 ?auto_711676 ) ) ( not ( = ?auto_711672 ?auto_711677 ) ) ( not ( = ?auto_711672 ?auto_711678 ) ) ( not ( = ?auto_711672 ?auto_711679 ) ) ( not ( = ?auto_711672 ?auto_711680 ) ) ( not ( = ?auto_711673 ?auto_711674 ) ) ( not ( = ?auto_711673 ?auto_711675 ) ) ( not ( = ?auto_711673 ?auto_711676 ) ) ( not ( = ?auto_711673 ?auto_711677 ) ) ( not ( = ?auto_711673 ?auto_711678 ) ) ( not ( = ?auto_711673 ?auto_711679 ) ) ( not ( = ?auto_711673 ?auto_711680 ) ) ( not ( = ?auto_711674 ?auto_711675 ) ) ( not ( = ?auto_711674 ?auto_711676 ) ) ( not ( = ?auto_711674 ?auto_711677 ) ) ( not ( = ?auto_711674 ?auto_711678 ) ) ( not ( = ?auto_711674 ?auto_711679 ) ) ( not ( = ?auto_711674 ?auto_711680 ) ) ( not ( = ?auto_711675 ?auto_711676 ) ) ( not ( = ?auto_711675 ?auto_711677 ) ) ( not ( = ?auto_711675 ?auto_711678 ) ) ( not ( = ?auto_711675 ?auto_711679 ) ) ( not ( = ?auto_711675 ?auto_711680 ) ) ( not ( = ?auto_711676 ?auto_711677 ) ) ( not ( = ?auto_711676 ?auto_711678 ) ) ( not ( = ?auto_711676 ?auto_711679 ) ) ( not ( = ?auto_711676 ?auto_711680 ) ) ( not ( = ?auto_711677 ?auto_711678 ) ) ( not ( = ?auto_711677 ?auto_711679 ) ) ( not ( = ?auto_711677 ?auto_711680 ) ) ( not ( = ?auto_711678 ?auto_711679 ) ) ( not ( = ?auto_711678 ?auto_711680 ) ) ( not ( = ?auto_711679 ?auto_711680 ) ) ( ON ?auto_711678 ?auto_711679 ) ( ON ?auto_711677 ?auto_711678 ) ( ON ?auto_711676 ?auto_711677 ) ( CLEAR ?auto_711674 ) ( ON ?auto_711675 ?auto_711676 ) ( CLEAR ?auto_711675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_711669 ?auto_711670 ?auto_711671 ?auto_711672 ?auto_711673 ?auto_711674 ?auto_711675 )
      ( MAKE-11PILE ?auto_711669 ?auto_711670 ?auto_711671 ?auto_711672 ?auto_711673 ?auto_711674 ?auto_711675 ?auto_711676 ?auto_711677 ?auto_711678 ?auto_711679 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711715 - BLOCK
      ?auto_711716 - BLOCK
      ?auto_711717 - BLOCK
      ?auto_711718 - BLOCK
      ?auto_711719 - BLOCK
      ?auto_711720 - BLOCK
      ?auto_711721 - BLOCK
      ?auto_711722 - BLOCK
      ?auto_711723 - BLOCK
      ?auto_711724 - BLOCK
      ?auto_711725 - BLOCK
    )
    :vars
    (
      ?auto_711726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711725 ?auto_711726 ) ( ON-TABLE ?auto_711715 ) ( ON ?auto_711716 ?auto_711715 ) ( ON ?auto_711717 ?auto_711716 ) ( ON ?auto_711718 ?auto_711717 ) ( ON ?auto_711719 ?auto_711718 ) ( not ( = ?auto_711715 ?auto_711716 ) ) ( not ( = ?auto_711715 ?auto_711717 ) ) ( not ( = ?auto_711715 ?auto_711718 ) ) ( not ( = ?auto_711715 ?auto_711719 ) ) ( not ( = ?auto_711715 ?auto_711720 ) ) ( not ( = ?auto_711715 ?auto_711721 ) ) ( not ( = ?auto_711715 ?auto_711722 ) ) ( not ( = ?auto_711715 ?auto_711723 ) ) ( not ( = ?auto_711715 ?auto_711724 ) ) ( not ( = ?auto_711715 ?auto_711725 ) ) ( not ( = ?auto_711715 ?auto_711726 ) ) ( not ( = ?auto_711716 ?auto_711717 ) ) ( not ( = ?auto_711716 ?auto_711718 ) ) ( not ( = ?auto_711716 ?auto_711719 ) ) ( not ( = ?auto_711716 ?auto_711720 ) ) ( not ( = ?auto_711716 ?auto_711721 ) ) ( not ( = ?auto_711716 ?auto_711722 ) ) ( not ( = ?auto_711716 ?auto_711723 ) ) ( not ( = ?auto_711716 ?auto_711724 ) ) ( not ( = ?auto_711716 ?auto_711725 ) ) ( not ( = ?auto_711716 ?auto_711726 ) ) ( not ( = ?auto_711717 ?auto_711718 ) ) ( not ( = ?auto_711717 ?auto_711719 ) ) ( not ( = ?auto_711717 ?auto_711720 ) ) ( not ( = ?auto_711717 ?auto_711721 ) ) ( not ( = ?auto_711717 ?auto_711722 ) ) ( not ( = ?auto_711717 ?auto_711723 ) ) ( not ( = ?auto_711717 ?auto_711724 ) ) ( not ( = ?auto_711717 ?auto_711725 ) ) ( not ( = ?auto_711717 ?auto_711726 ) ) ( not ( = ?auto_711718 ?auto_711719 ) ) ( not ( = ?auto_711718 ?auto_711720 ) ) ( not ( = ?auto_711718 ?auto_711721 ) ) ( not ( = ?auto_711718 ?auto_711722 ) ) ( not ( = ?auto_711718 ?auto_711723 ) ) ( not ( = ?auto_711718 ?auto_711724 ) ) ( not ( = ?auto_711718 ?auto_711725 ) ) ( not ( = ?auto_711718 ?auto_711726 ) ) ( not ( = ?auto_711719 ?auto_711720 ) ) ( not ( = ?auto_711719 ?auto_711721 ) ) ( not ( = ?auto_711719 ?auto_711722 ) ) ( not ( = ?auto_711719 ?auto_711723 ) ) ( not ( = ?auto_711719 ?auto_711724 ) ) ( not ( = ?auto_711719 ?auto_711725 ) ) ( not ( = ?auto_711719 ?auto_711726 ) ) ( not ( = ?auto_711720 ?auto_711721 ) ) ( not ( = ?auto_711720 ?auto_711722 ) ) ( not ( = ?auto_711720 ?auto_711723 ) ) ( not ( = ?auto_711720 ?auto_711724 ) ) ( not ( = ?auto_711720 ?auto_711725 ) ) ( not ( = ?auto_711720 ?auto_711726 ) ) ( not ( = ?auto_711721 ?auto_711722 ) ) ( not ( = ?auto_711721 ?auto_711723 ) ) ( not ( = ?auto_711721 ?auto_711724 ) ) ( not ( = ?auto_711721 ?auto_711725 ) ) ( not ( = ?auto_711721 ?auto_711726 ) ) ( not ( = ?auto_711722 ?auto_711723 ) ) ( not ( = ?auto_711722 ?auto_711724 ) ) ( not ( = ?auto_711722 ?auto_711725 ) ) ( not ( = ?auto_711722 ?auto_711726 ) ) ( not ( = ?auto_711723 ?auto_711724 ) ) ( not ( = ?auto_711723 ?auto_711725 ) ) ( not ( = ?auto_711723 ?auto_711726 ) ) ( not ( = ?auto_711724 ?auto_711725 ) ) ( not ( = ?auto_711724 ?auto_711726 ) ) ( not ( = ?auto_711725 ?auto_711726 ) ) ( ON ?auto_711724 ?auto_711725 ) ( ON ?auto_711723 ?auto_711724 ) ( ON ?auto_711722 ?auto_711723 ) ( ON ?auto_711721 ?auto_711722 ) ( CLEAR ?auto_711719 ) ( ON ?auto_711720 ?auto_711721 ) ( CLEAR ?auto_711720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_711715 ?auto_711716 ?auto_711717 ?auto_711718 ?auto_711719 ?auto_711720 )
      ( MAKE-11PILE ?auto_711715 ?auto_711716 ?auto_711717 ?auto_711718 ?auto_711719 ?auto_711720 ?auto_711721 ?auto_711722 ?auto_711723 ?auto_711724 ?auto_711725 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711761 - BLOCK
      ?auto_711762 - BLOCK
      ?auto_711763 - BLOCK
      ?auto_711764 - BLOCK
      ?auto_711765 - BLOCK
      ?auto_711766 - BLOCK
      ?auto_711767 - BLOCK
      ?auto_711768 - BLOCK
      ?auto_711769 - BLOCK
      ?auto_711770 - BLOCK
      ?auto_711771 - BLOCK
    )
    :vars
    (
      ?auto_711772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711771 ?auto_711772 ) ( ON-TABLE ?auto_711761 ) ( ON ?auto_711762 ?auto_711761 ) ( ON ?auto_711763 ?auto_711762 ) ( ON ?auto_711764 ?auto_711763 ) ( not ( = ?auto_711761 ?auto_711762 ) ) ( not ( = ?auto_711761 ?auto_711763 ) ) ( not ( = ?auto_711761 ?auto_711764 ) ) ( not ( = ?auto_711761 ?auto_711765 ) ) ( not ( = ?auto_711761 ?auto_711766 ) ) ( not ( = ?auto_711761 ?auto_711767 ) ) ( not ( = ?auto_711761 ?auto_711768 ) ) ( not ( = ?auto_711761 ?auto_711769 ) ) ( not ( = ?auto_711761 ?auto_711770 ) ) ( not ( = ?auto_711761 ?auto_711771 ) ) ( not ( = ?auto_711761 ?auto_711772 ) ) ( not ( = ?auto_711762 ?auto_711763 ) ) ( not ( = ?auto_711762 ?auto_711764 ) ) ( not ( = ?auto_711762 ?auto_711765 ) ) ( not ( = ?auto_711762 ?auto_711766 ) ) ( not ( = ?auto_711762 ?auto_711767 ) ) ( not ( = ?auto_711762 ?auto_711768 ) ) ( not ( = ?auto_711762 ?auto_711769 ) ) ( not ( = ?auto_711762 ?auto_711770 ) ) ( not ( = ?auto_711762 ?auto_711771 ) ) ( not ( = ?auto_711762 ?auto_711772 ) ) ( not ( = ?auto_711763 ?auto_711764 ) ) ( not ( = ?auto_711763 ?auto_711765 ) ) ( not ( = ?auto_711763 ?auto_711766 ) ) ( not ( = ?auto_711763 ?auto_711767 ) ) ( not ( = ?auto_711763 ?auto_711768 ) ) ( not ( = ?auto_711763 ?auto_711769 ) ) ( not ( = ?auto_711763 ?auto_711770 ) ) ( not ( = ?auto_711763 ?auto_711771 ) ) ( not ( = ?auto_711763 ?auto_711772 ) ) ( not ( = ?auto_711764 ?auto_711765 ) ) ( not ( = ?auto_711764 ?auto_711766 ) ) ( not ( = ?auto_711764 ?auto_711767 ) ) ( not ( = ?auto_711764 ?auto_711768 ) ) ( not ( = ?auto_711764 ?auto_711769 ) ) ( not ( = ?auto_711764 ?auto_711770 ) ) ( not ( = ?auto_711764 ?auto_711771 ) ) ( not ( = ?auto_711764 ?auto_711772 ) ) ( not ( = ?auto_711765 ?auto_711766 ) ) ( not ( = ?auto_711765 ?auto_711767 ) ) ( not ( = ?auto_711765 ?auto_711768 ) ) ( not ( = ?auto_711765 ?auto_711769 ) ) ( not ( = ?auto_711765 ?auto_711770 ) ) ( not ( = ?auto_711765 ?auto_711771 ) ) ( not ( = ?auto_711765 ?auto_711772 ) ) ( not ( = ?auto_711766 ?auto_711767 ) ) ( not ( = ?auto_711766 ?auto_711768 ) ) ( not ( = ?auto_711766 ?auto_711769 ) ) ( not ( = ?auto_711766 ?auto_711770 ) ) ( not ( = ?auto_711766 ?auto_711771 ) ) ( not ( = ?auto_711766 ?auto_711772 ) ) ( not ( = ?auto_711767 ?auto_711768 ) ) ( not ( = ?auto_711767 ?auto_711769 ) ) ( not ( = ?auto_711767 ?auto_711770 ) ) ( not ( = ?auto_711767 ?auto_711771 ) ) ( not ( = ?auto_711767 ?auto_711772 ) ) ( not ( = ?auto_711768 ?auto_711769 ) ) ( not ( = ?auto_711768 ?auto_711770 ) ) ( not ( = ?auto_711768 ?auto_711771 ) ) ( not ( = ?auto_711768 ?auto_711772 ) ) ( not ( = ?auto_711769 ?auto_711770 ) ) ( not ( = ?auto_711769 ?auto_711771 ) ) ( not ( = ?auto_711769 ?auto_711772 ) ) ( not ( = ?auto_711770 ?auto_711771 ) ) ( not ( = ?auto_711770 ?auto_711772 ) ) ( not ( = ?auto_711771 ?auto_711772 ) ) ( ON ?auto_711770 ?auto_711771 ) ( ON ?auto_711769 ?auto_711770 ) ( ON ?auto_711768 ?auto_711769 ) ( ON ?auto_711767 ?auto_711768 ) ( ON ?auto_711766 ?auto_711767 ) ( CLEAR ?auto_711764 ) ( ON ?auto_711765 ?auto_711766 ) ( CLEAR ?auto_711765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_711761 ?auto_711762 ?auto_711763 ?auto_711764 ?auto_711765 )
      ( MAKE-11PILE ?auto_711761 ?auto_711762 ?auto_711763 ?auto_711764 ?auto_711765 ?auto_711766 ?auto_711767 ?auto_711768 ?auto_711769 ?auto_711770 ?auto_711771 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711807 - BLOCK
      ?auto_711808 - BLOCK
      ?auto_711809 - BLOCK
      ?auto_711810 - BLOCK
      ?auto_711811 - BLOCK
      ?auto_711812 - BLOCK
      ?auto_711813 - BLOCK
      ?auto_711814 - BLOCK
      ?auto_711815 - BLOCK
      ?auto_711816 - BLOCK
      ?auto_711817 - BLOCK
    )
    :vars
    (
      ?auto_711818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711817 ?auto_711818 ) ( ON-TABLE ?auto_711807 ) ( ON ?auto_711808 ?auto_711807 ) ( ON ?auto_711809 ?auto_711808 ) ( not ( = ?auto_711807 ?auto_711808 ) ) ( not ( = ?auto_711807 ?auto_711809 ) ) ( not ( = ?auto_711807 ?auto_711810 ) ) ( not ( = ?auto_711807 ?auto_711811 ) ) ( not ( = ?auto_711807 ?auto_711812 ) ) ( not ( = ?auto_711807 ?auto_711813 ) ) ( not ( = ?auto_711807 ?auto_711814 ) ) ( not ( = ?auto_711807 ?auto_711815 ) ) ( not ( = ?auto_711807 ?auto_711816 ) ) ( not ( = ?auto_711807 ?auto_711817 ) ) ( not ( = ?auto_711807 ?auto_711818 ) ) ( not ( = ?auto_711808 ?auto_711809 ) ) ( not ( = ?auto_711808 ?auto_711810 ) ) ( not ( = ?auto_711808 ?auto_711811 ) ) ( not ( = ?auto_711808 ?auto_711812 ) ) ( not ( = ?auto_711808 ?auto_711813 ) ) ( not ( = ?auto_711808 ?auto_711814 ) ) ( not ( = ?auto_711808 ?auto_711815 ) ) ( not ( = ?auto_711808 ?auto_711816 ) ) ( not ( = ?auto_711808 ?auto_711817 ) ) ( not ( = ?auto_711808 ?auto_711818 ) ) ( not ( = ?auto_711809 ?auto_711810 ) ) ( not ( = ?auto_711809 ?auto_711811 ) ) ( not ( = ?auto_711809 ?auto_711812 ) ) ( not ( = ?auto_711809 ?auto_711813 ) ) ( not ( = ?auto_711809 ?auto_711814 ) ) ( not ( = ?auto_711809 ?auto_711815 ) ) ( not ( = ?auto_711809 ?auto_711816 ) ) ( not ( = ?auto_711809 ?auto_711817 ) ) ( not ( = ?auto_711809 ?auto_711818 ) ) ( not ( = ?auto_711810 ?auto_711811 ) ) ( not ( = ?auto_711810 ?auto_711812 ) ) ( not ( = ?auto_711810 ?auto_711813 ) ) ( not ( = ?auto_711810 ?auto_711814 ) ) ( not ( = ?auto_711810 ?auto_711815 ) ) ( not ( = ?auto_711810 ?auto_711816 ) ) ( not ( = ?auto_711810 ?auto_711817 ) ) ( not ( = ?auto_711810 ?auto_711818 ) ) ( not ( = ?auto_711811 ?auto_711812 ) ) ( not ( = ?auto_711811 ?auto_711813 ) ) ( not ( = ?auto_711811 ?auto_711814 ) ) ( not ( = ?auto_711811 ?auto_711815 ) ) ( not ( = ?auto_711811 ?auto_711816 ) ) ( not ( = ?auto_711811 ?auto_711817 ) ) ( not ( = ?auto_711811 ?auto_711818 ) ) ( not ( = ?auto_711812 ?auto_711813 ) ) ( not ( = ?auto_711812 ?auto_711814 ) ) ( not ( = ?auto_711812 ?auto_711815 ) ) ( not ( = ?auto_711812 ?auto_711816 ) ) ( not ( = ?auto_711812 ?auto_711817 ) ) ( not ( = ?auto_711812 ?auto_711818 ) ) ( not ( = ?auto_711813 ?auto_711814 ) ) ( not ( = ?auto_711813 ?auto_711815 ) ) ( not ( = ?auto_711813 ?auto_711816 ) ) ( not ( = ?auto_711813 ?auto_711817 ) ) ( not ( = ?auto_711813 ?auto_711818 ) ) ( not ( = ?auto_711814 ?auto_711815 ) ) ( not ( = ?auto_711814 ?auto_711816 ) ) ( not ( = ?auto_711814 ?auto_711817 ) ) ( not ( = ?auto_711814 ?auto_711818 ) ) ( not ( = ?auto_711815 ?auto_711816 ) ) ( not ( = ?auto_711815 ?auto_711817 ) ) ( not ( = ?auto_711815 ?auto_711818 ) ) ( not ( = ?auto_711816 ?auto_711817 ) ) ( not ( = ?auto_711816 ?auto_711818 ) ) ( not ( = ?auto_711817 ?auto_711818 ) ) ( ON ?auto_711816 ?auto_711817 ) ( ON ?auto_711815 ?auto_711816 ) ( ON ?auto_711814 ?auto_711815 ) ( ON ?auto_711813 ?auto_711814 ) ( ON ?auto_711812 ?auto_711813 ) ( ON ?auto_711811 ?auto_711812 ) ( CLEAR ?auto_711809 ) ( ON ?auto_711810 ?auto_711811 ) ( CLEAR ?auto_711810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_711807 ?auto_711808 ?auto_711809 ?auto_711810 )
      ( MAKE-11PILE ?auto_711807 ?auto_711808 ?auto_711809 ?auto_711810 ?auto_711811 ?auto_711812 ?auto_711813 ?auto_711814 ?auto_711815 ?auto_711816 ?auto_711817 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711853 - BLOCK
      ?auto_711854 - BLOCK
      ?auto_711855 - BLOCK
      ?auto_711856 - BLOCK
      ?auto_711857 - BLOCK
      ?auto_711858 - BLOCK
      ?auto_711859 - BLOCK
      ?auto_711860 - BLOCK
      ?auto_711861 - BLOCK
      ?auto_711862 - BLOCK
      ?auto_711863 - BLOCK
    )
    :vars
    (
      ?auto_711864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711863 ?auto_711864 ) ( ON-TABLE ?auto_711853 ) ( ON ?auto_711854 ?auto_711853 ) ( not ( = ?auto_711853 ?auto_711854 ) ) ( not ( = ?auto_711853 ?auto_711855 ) ) ( not ( = ?auto_711853 ?auto_711856 ) ) ( not ( = ?auto_711853 ?auto_711857 ) ) ( not ( = ?auto_711853 ?auto_711858 ) ) ( not ( = ?auto_711853 ?auto_711859 ) ) ( not ( = ?auto_711853 ?auto_711860 ) ) ( not ( = ?auto_711853 ?auto_711861 ) ) ( not ( = ?auto_711853 ?auto_711862 ) ) ( not ( = ?auto_711853 ?auto_711863 ) ) ( not ( = ?auto_711853 ?auto_711864 ) ) ( not ( = ?auto_711854 ?auto_711855 ) ) ( not ( = ?auto_711854 ?auto_711856 ) ) ( not ( = ?auto_711854 ?auto_711857 ) ) ( not ( = ?auto_711854 ?auto_711858 ) ) ( not ( = ?auto_711854 ?auto_711859 ) ) ( not ( = ?auto_711854 ?auto_711860 ) ) ( not ( = ?auto_711854 ?auto_711861 ) ) ( not ( = ?auto_711854 ?auto_711862 ) ) ( not ( = ?auto_711854 ?auto_711863 ) ) ( not ( = ?auto_711854 ?auto_711864 ) ) ( not ( = ?auto_711855 ?auto_711856 ) ) ( not ( = ?auto_711855 ?auto_711857 ) ) ( not ( = ?auto_711855 ?auto_711858 ) ) ( not ( = ?auto_711855 ?auto_711859 ) ) ( not ( = ?auto_711855 ?auto_711860 ) ) ( not ( = ?auto_711855 ?auto_711861 ) ) ( not ( = ?auto_711855 ?auto_711862 ) ) ( not ( = ?auto_711855 ?auto_711863 ) ) ( not ( = ?auto_711855 ?auto_711864 ) ) ( not ( = ?auto_711856 ?auto_711857 ) ) ( not ( = ?auto_711856 ?auto_711858 ) ) ( not ( = ?auto_711856 ?auto_711859 ) ) ( not ( = ?auto_711856 ?auto_711860 ) ) ( not ( = ?auto_711856 ?auto_711861 ) ) ( not ( = ?auto_711856 ?auto_711862 ) ) ( not ( = ?auto_711856 ?auto_711863 ) ) ( not ( = ?auto_711856 ?auto_711864 ) ) ( not ( = ?auto_711857 ?auto_711858 ) ) ( not ( = ?auto_711857 ?auto_711859 ) ) ( not ( = ?auto_711857 ?auto_711860 ) ) ( not ( = ?auto_711857 ?auto_711861 ) ) ( not ( = ?auto_711857 ?auto_711862 ) ) ( not ( = ?auto_711857 ?auto_711863 ) ) ( not ( = ?auto_711857 ?auto_711864 ) ) ( not ( = ?auto_711858 ?auto_711859 ) ) ( not ( = ?auto_711858 ?auto_711860 ) ) ( not ( = ?auto_711858 ?auto_711861 ) ) ( not ( = ?auto_711858 ?auto_711862 ) ) ( not ( = ?auto_711858 ?auto_711863 ) ) ( not ( = ?auto_711858 ?auto_711864 ) ) ( not ( = ?auto_711859 ?auto_711860 ) ) ( not ( = ?auto_711859 ?auto_711861 ) ) ( not ( = ?auto_711859 ?auto_711862 ) ) ( not ( = ?auto_711859 ?auto_711863 ) ) ( not ( = ?auto_711859 ?auto_711864 ) ) ( not ( = ?auto_711860 ?auto_711861 ) ) ( not ( = ?auto_711860 ?auto_711862 ) ) ( not ( = ?auto_711860 ?auto_711863 ) ) ( not ( = ?auto_711860 ?auto_711864 ) ) ( not ( = ?auto_711861 ?auto_711862 ) ) ( not ( = ?auto_711861 ?auto_711863 ) ) ( not ( = ?auto_711861 ?auto_711864 ) ) ( not ( = ?auto_711862 ?auto_711863 ) ) ( not ( = ?auto_711862 ?auto_711864 ) ) ( not ( = ?auto_711863 ?auto_711864 ) ) ( ON ?auto_711862 ?auto_711863 ) ( ON ?auto_711861 ?auto_711862 ) ( ON ?auto_711860 ?auto_711861 ) ( ON ?auto_711859 ?auto_711860 ) ( ON ?auto_711858 ?auto_711859 ) ( ON ?auto_711857 ?auto_711858 ) ( ON ?auto_711856 ?auto_711857 ) ( CLEAR ?auto_711854 ) ( ON ?auto_711855 ?auto_711856 ) ( CLEAR ?auto_711855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_711853 ?auto_711854 ?auto_711855 )
      ( MAKE-11PILE ?auto_711853 ?auto_711854 ?auto_711855 ?auto_711856 ?auto_711857 ?auto_711858 ?auto_711859 ?auto_711860 ?auto_711861 ?auto_711862 ?auto_711863 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711899 - BLOCK
      ?auto_711900 - BLOCK
      ?auto_711901 - BLOCK
      ?auto_711902 - BLOCK
      ?auto_711903 - BLOCK
      ?auto_711904 - BLOCK
      ?auto_711905 - BLOCK
      ?auto_711906 - BLOCK
      ?auto_711907 - BLOCK
      ?auto_711908 - BLOCK
      ?auto_711909 - BLOCK
    )
    :vars
    (
      ?auto_711910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711909 ?auto_711910 ) ( ON-TABLE ?auto_711899 ) ( not ( = ?auto_711899 ?auto_711900 ) ) ( not ( = ?auto_711899 ?auto_711901 ) ) ( not ( = ?auto_711899 ?auto_711902 ) ) ( not ( = ?auto_711899 ?auto_711903 ) ) ( not ( = ?auto_711899 ?auto_711904 ) ) ( not ( = ?auto_711899 ?auto_711905 ) ) ( not ( = ?auto_711899 ?auto_711906 ) ) ( not ( = ?auto_711899 ?auto_711907 ) ) ( not ( = ?auto_711899 ?auto_711908 ) ) ( not ( = ?auto_711899 ?auto_711909 ) ) ( not ( = ?auto_711899 ?auto_711910 ) ) ( not ( = ?auto_711900 ?auto_711901 ) ) ( not ( = ?auto_711900 ?auto_711902 ) ) ( not ( = ?auto_711900 ?auto_711903 ) ) ( not ( = ?auto_711900 ?auto_711904 ) ) ( not ( = ?auto_711900 ?auto_711905 ) ) ( not ( = ?auto_711900 ?auto_711906 ) ) ( not ( = ?auto_711900 ?auto_711907 ) ) ( not ( = ?auto_711900 ?auto_711908 ) ) ( not ( = ?auto_711900 ?auto_711909 ) ) ( not ( = ?auto_711900 ?auto_711910 ) ) ( not ( = ?auto_711901 ?auto_711902 ) ) ( not ( = ?auto_711901 ?auto_711903 ) ) ( not ( = ?auto_711901 ?auto_711904 ) ) ( not ( = ?auto_711901 ?auto_711905 ) ) ( not ( = ?auto_711901 ?auto_711906 ) ) ( not ( = ?auto_711901 ?auto_711907 ) ) ( not ( = ?auto_711901 ?auto_711908 ) ) ( not ( = ?auto_711901 ?auto_711909 ) ) ( not ( = ?auto_711901 ?auto_711910 ) ) ( not ( = ?auto_711902 ?auto_711903 ) ) ( not ( = ?auto_711902 ?auto_711904 ) ) ( not ( = ?auto_711902 ?auto_711905 ) ) ( not ( = ?auto_711902 ?auto_711906 ) ) ( not ( = ?auto_711902 ?auto_711907 ) ) ( not ( = ?auto_711902 ?auto_711908 ) ) ( not ( = ?auto_711902 ?auto_711909 ) ) ( not ( = ?auto_711902 ?auto_711910 ) ) ( not ( = ?auto_711903 ?auto_711904 ) ) ( not ( = ?auto_711903 ?auto_711905 ) ) ( not ( = ?auto_711903 ?auto_711906 ) ) ( not ( = ?auto_711903 ?auto_711907 ) ) ( not ( = ?auto_711903 ?auto_711908 ) ) ( not ( = ?auto_711903 ?auto_711909 ) ) ( not ( = ?auto_711903 ?auto_711910 ) ) ( not ( = ?auto_711904 ?auto_711905 ) ) ( not ( = ?auto_711904 ?auto_711906 ) ) ( not ( = ?auto_711904 ?auto_711907 ) ) ( not ( = ?auto_711904 ?auto_711908 ) ) ( not ( = ?auto_711904 ?auto_711909 ) ) ( not ( = ?auto_711904 ?auto_711910 ) ) ( not ( = ?auto_711905 ?auto_711906 ) ) ( not ( = ?auto_711905 ?auto_711907 ) ) ( not ( = ?auto_711905 ?auto_711908 ) ) ( not ( = ?auto_711905 ?auto_711909 ) ) ( not ( = ?auto_711905 ?auto_711910 ) ) ( not ( = ?auto_711906 ?auto_711907 ) ) ( not ( = ?auto_711906 ?auto_711908 ) ) ( not ( = ?auto_711906 ?auto_711909 ) ) ( not ( = ?auto_711906 ?auto_711910 ) ) ( not ( = ?auto_711907 ?auto_711908 ) ) ( not ( = ?auto_711907 ?auto_711909 ) ) ( not ( = ?auto_711907 ?auto_711910 ) ) ( not ( = ?auto_711908 ?auto_711909 ) ) ( not ( = ?auto_711908 ?auto_711910 ) ) ( not ( = ?auto_711909 ?auto_711910 ) ) ( ON ?auto_711908 ?auto_711909 ) ( ON ?auto_711907 ?auto_711908 ) ( ON ?auto_711906 ?auto_711907 ) ( ON ?auto_711905 ?auto_711906 ) ( ON ?auto_711904 ?auto_711905 ) ( ON ?auto_711903 ?auto_711904 ) ( ON ?auto_711902 ?auto_711903 ) ( ON ?auto_711901 ?auto_711902 ) ( CLEAR ?auto_711899 ) ( ON ?auto_711900 ?auto_711901 ) ( CLEAR ?auto_711900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_711899 ?auto_711900 )
      ( MAKE-11PILE ?auto_711899 ?auto_711900 ?auto_711901 ?auto_711902 ?auto_711903 ?auto_711904 ?auto_711905 ?auto_711906 ?auto_711907 ?auto_711908 ?auto_711909 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_711945 - BLOCK
      ?auto_711946 - BLOCK
      ?auto_711947 - BLOCK
      ?auto_711948 - BLOCK
      ?auto_711949 - BLOCK
      ?auto_711950 - BLOCK
      ?auto_711951 - BLOCK
      ?auto_711952 - BLOCK
      ?auto_711953 - BLOCK
      ?auto_711954 - BLOCK
      ?auto_711955 - BLOCK
    )
    :vars
    (
      ?auto_711956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_711955 ?auto_711956 ) ( not ( = ?auto_711945 ?auto_711946 ) ) ( not ( = ?auto_711945 ?auto_711947 ) ) ( not ( = ?auto_711945 ?auto_711948 ) ) ( not ( = ?auto_711945 ?auto_711949 ) ) ( not ( = ?auto_711945 ?auto_711950 ) ) ( not ( = ?auto_711945 ?auto_711951 ) ) ( not ( = ?auto_711945 ?auto_711952 ) ) ( not ( = ?auto_711945 ?auto_711953 ) ) ( not ( = ?auto_711945 ?auto_711954 ) ) ( not ( = ?auto_711945 ?auto_711955 ) ) ( not ( = ?auto_711945 ?auto_711956 ) ) ( not ( = ?auto_711946 ?auto_711947 ) ) ( not ( = ?auto_711946 ?auto_711948 ) ) ( not ( = ?auto_711946 ?auto_711949 ) ) ( not ( = ?auto_711946 ?auto_711950 ) ) ( not ( = ?auto_711946 ?auto_711951 ) ) ( not ( = ?auto_711946 ?auto_711952 ) ) ( not ( = ?auto_711946 ?auto_711953 ) ) ( not ( = ?auto_711946 ?auto_711954 ) ) ( not ( = ?auto_711946 ?auto_711955 ) ) ( not ( = ?auto_711946 ?auto_711956 ) ) ( not ( = ?auto_711947 ?auto_711948 ) ) ( not ( = ?auto_711947 ?auto_711949 ) ) ( not ( = ?auto_711947 ?auto_711950 ) ) ( not ( = ?auto_711947 ?auto_711951 ) ) ( not ( = ?auto_711947 ?auto_711952 ) ) ( not ( = ?auto_711947 ?auto_711953 ) ) ( not ( = ?auto_711947 ?auto_711954 ) ) ( not ( = ?auto_711947 ?auto_711955 ) ) ( not ( = ?auto_711947 ?auto_711956 ) ) ( not ( = ?auto_711948 ?auto_711949 ) ) ( not ( = ?auto_711948 ?auto_711950 ) ) ( not ( = ?auto_711948 ?auto_711951 ) ) ( not ( = ?auto_711948 ?auto_711952 ) ) ( not ( = ?auto_711948 ?auto_711953 ) ) ( not ( = ?auto_711948 ?auto_711954 ) ) ( not ( = ?auto_711948 ?auto_711955 ) ) ( not ( = ?auto_711948 ?auto_711956 ) ) ( not ( = ?auto_711949 ?auto_711950 ) ) ( not ( = ?auto_711949 ?auto_711951 ) ) ( not ( = ?auto_711949 ?auto_711952 ) ) ( not ( = ?auto_711949 ?auto_711953 ) ) ( not ( = ?auto_711949 ?auto_711954 ) ) ( not ( = ?auto_711949 ?auto_711955 ) ) ( not ( = ?auto_711949 ?auto_711956 ) ) ( not ( = ?auto_711950 ?auto_711951 ) ) ( not ( = ?auto_711950 ?auto_711952 ) ) ( not ( = ?auto_711950 ?auto_711953 ) ) ( not ( = ?auto_711950 ?auto_711954 ) ) ( not ( = ?auto_711950 ?auto_711955 ) ) ( not ( = ?auto_711950 ?auto_711956 ) ) ( not ( = ?auto_711951 ?auto_711952 ) ) ( not ( = ?auto_711951 ?auto_711953 ) ) ( not ( = ?auto_711951 ?auto_711954 ) ) ( not ( = ?auto_711951 ?auto_711955 ) ) ( not ( = ?auto_711951 ?auto_711956 ) ) ( not ( = ?auto_711952 ?auto_711953 ) ) ( not ( = ?auto_711952 ?auto_711954 ) ) ( not ( = ?auto_711952 ?auto_711955 ) ) ( not ( = ?auto_711952 ?auto_711956 ) ) ( not ( = ?auto_711953 ?auto_711954 ) ) ( not ( = ?auto_711953 ?auto_711955 ) ) ( not ( = ?auto_711953 ?auto_711956 ) ) ( not ( = ?auto_711954 ?auto_711955 ) ) ( not ( = ?auto_711954 ?auto_711956 ) ) ( not ( = ?auto_711955 ?auto_711956 ) ) ( ON ?auto_711954 ?auto_711955 ) ( ON ?auto_711953 ?auto_711954 ) ( ON ?auto_711952 ?auto_711953 ) ( ON ?auto_711951 ?auto_711952 ) ( ON ?auto_711950 ?auto_711951 ) ( ON ?auto_711949 ?auto_711950 ) ( ON ?auto_711948 ?auto_711949 ) ( ON ?auto_711947 ?auto_711948 ) ( ON ?auto_711946 ?auto_711947 ) ( ON ?auto_711945 ?auto_711946 ) ( CLEAR ?auto_711945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_711945 )
      ( MAKE-11PILE ?auto_711945 ?auto_711946 ?auto_711947 ?auto_711948 ?auto_711949 ?auto_711950 ?auto_711951 ?auto_711952 ?auto_711953 ?auto_711954 ?auto_711955 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_711992 - BLOCK
      ?auto_711993 - BLOCK
      ?auto_711994 - BLOCK
      ?auto_711995 - BLOCK
      ?auto_711996 - BLOCK
      ?auto_711997 - BLOCK
      ?auto_711998 - BLOCK
      ?auto_711999 - BLOCK
      ?auto_712000 - BLOCK
      ?auto_712001 - BLOCK
      ?auto_712002 - BLOCK
      ?auto_712003 - BLOCK
    )
    :vars
    (
      ?auto_712004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_712002 ) ( ON ?auto_712003 ?auto_712004 ) ( CLEAR ?auto_712003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_711992 ) ( ON ?auto_711993 ?auto_711992 ) ( ON ?auto_711994 ?auto_711993 ) ( ON ?auto_711995 ?auto_711994 ) ( ON ?auto_711996 ?auto_711995 ) ( ON ?auto_711997 ?auto_711996 ) ( ON ?auto_711998 ?auto_711997 ) ( ON ?auto_711999 ?auto_711998 ) ( ON ?auto_712000 ?auto_711999 ) ( ON ?auto_712001 ?auto_712000 ) ( ON ?auto_712002 ?auto_712001 ) ( not ( = ?auto_711992 ?auto_711993 ) ) ( not ( = ?auto_711992 ?auto_711994 ) ) ( not ( = ?auto_711992 ?auto_711995 ) ) ( not ( = ?auto_711992 ?auto_711996 ) ) ( not ( = ?auto_711992 ?auto_711997 ) ) ( not ( = ?auto_711992 ?auto_711998 ) ) ( not ( = ?auto_711992 ?auto_711999 ) ) ( not ( = ?auto_711992 ?auto_712000 ) ) ( not ( = ?auto_711992 ?auto_712001 ) ) ( not ( = ?auto_711992 ?auto_712002 ) ) ( not ( = ?auto_711992 ?auto_712003 ) ) ( not ( = ?auto_711992 ?auto_712004 ) ) ( not ( = ?auto_711993 ?auto_711994 ) ) ( not ( = ?auto_711993 ?auto_711995 ) ) ( not ( = ?auto_711993 ?auto_711996 ) ) ( not ( = ?auto_711993 ?auto_711997 ) ) ( not ( = ?auto_711993 ?auto_711998 ) ) ( not ( = ?auto_711993 ?auto_711999 ) ) ( not ( = ?auto_711993 ?auto_712000 ) ) ( not ( = ?auto_711993 ?auto_712001 ) ) ( not ( = ?auto_711993 ?auto_712002 ) ) ( not ( = ?auto_711993 ?auto_712003 ) ) ( not ( = ?auto_711993 ?auto_712004 ) ) ( not ( = ?auto_711994 ?auto_711995 ) ) ( not ( = ?auto_711994 ?auto_711996 ) ) ( not ( = ?auto_711994 ?auto_711997 ) ) ( not ( = ?auto_711994 ?auto_711998 ) ) ( not ( = ?auto_711994 ?auto_711999 ) ) ( not ( = ?auto_711994 ?auto_712000 ) ) ( not ( = ?auto_711994 ?auto_712001 ) ) ( not ( = ?auto_711994 ?auto_712002 ) ) ( not ( = ?auto_711994 ?auto_712003 ) ) ( not ( = ?auto_711994 ?auto_712004 ) ) ( not ( = ?auto_711995 ?auto_711996 ) ) ( not ( = ?auto_711995 ?auto_711997 ) ) ( not ( = ?auto_711995 ?auto_711998 ) ) ( not ( = ?auto_711995 ?auto_711999 ) ) ( not ( = ?auto_711995 ?auto_712000 ) ) ( not ( = ?auto_711995 ?auto_712001 ) ) ( not ( = ?auto_711995 ?auto_712002 ) ) ( not ( = ?auto_711995 ?auto_712003 ) ) ( not ( = ?auto_711995 ?auto_712004 ) ) ( not ( = ?auto_711996 ?auto_711997 ) ) ( not ( = ?auto_711996 ?auto_711998 ) ) ( not ( = ?auto_711996 ?auto_711999 ) ) ( not ( = ?auto_711996 ?auto_712000 ) ) ( not ( = ?auto_711996 ?auto_712001 ) ) ( not ( = ?auto_711996 ?auto_712002 ) ) ( not ( = ?auto_711996 ?auto_712003 ) ) ( not ( = ?auto_711996 ?auto_712004 ) ) ( not ( = ?auto_711997 ?auto_711998 ) ) ( not ( = ?auto_711997 ?auto_711999 ) ) ( not ( = ?auto_711997 ?auto_712000 ) ) ( not ( = ?auto_711997 ?auto_712001 ) ) ( not ( = ?auto_711997 ?auto_712002 ) ) ( not ( = ?auto_711997 ?auto_712003 ) ) ( not ( = ?auto_711997 ?auto_712004 ) ) ( not ( = ?auto_711998 ?auto_711999 ) ) ( not ( = ?auto_711998 ?auto_712000 ) ) ( not ( = ?auto_711998 ?auto_712001 ) ) ( not ( = ?auto_711998 ?auto_712002 ) ) ( not ( = ?auto_711998 ?auto_712003 ) ) ( not ( = ?auto_711998 ?auto_712004 ) ) ( not ( = ?auto_711999 ?auto_712000 ) ) ( not ( = ?auto_711999 ?auto_712001 ) ) ( not ( = ?auto_711999 ?auto_712002 ) ) ( not ( = ?auto_711999 ?auto_712003 ) ) ( not ( = ?auto_711999 ?auto_712004 ) ) ( not ( = ?auto_712000 ?auto_712001 ) ) ( not ( = ?auto_712000 ?auto_712002 ) ) ( not ( = ?auto_712000 ?auto_712003 ) ) ( not ( = ?auto_712000 ?auto_712004 ) ) ( not ( = ?auto_712001 ?auto_712002 ) ) ( not ( = ?auto_712001 ?auto_712003 ) ) ( not ( = ?auto_712001 ?auto_712004 ) ) ( not ( = ?auto_712002 ?auto_712003 ) ) ( not ( = ?auto_712002 ?auto_712004 ) ) ( not ( = ?auto_712003 ?auto_712004 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_712003 ?auto_712004 )
      ( !STACK ?auto_712003 ?auto_712002 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712042 - BLOCK
      ?auto_712043 - BLOCK
      ?auto_712044 - BLOCK
      ?auto_712045 - BLOCK
      ?auto_712046 - BLOCK
      ?auto_712047 - BLOCK
      ?auto_712048 - BLOCK
      ?auto_712049 - BLOCK
      ?auto_712050 - BLOCK
      ?auto_712051 - BLOCK
      ?auto_712052 - BLOCK
      ?auto_712053 - BLOCK
    )
    :vars
    (
      ?auto_712054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712053 ?auto_712054 ) ( ON-TABLE ?auto_712042 ) ( ON ?auto_712043 ?auto_712042 ) ( ON ?auto_712044 ?auto_712043 ) ( ON ?auto_712045 ?auto_712044 ) ( ON ?auto_712046 ?auto_712045 ) ( ON ?auto_712047 ?auto_712046 ) ( ON ?auto_712048 ?auto_712047 ) ( ON ?auto_712049 ?auto_712048 ) ( ON ?auto_712050 ?auto_712049 ) ( ON ?auto_712051 ?auto_712050 ) ( not ( = ?auto_712042 ?auto_712043 ) ) ( not ( = ?auto_712042 ?auto_712044 ) ) ( not ( = ?auto_712042 ?auto_712045 ) ) ( not ( = ?auto_712042 ?auto_712046 ) ) ( not ( = ?auto_712042 ?auto_712047 ) ) ( not ( = ?auto_712042 ?auto_712048 ) ) ( not ( = ?auto_712042 ?auto_712049 ) ) ( not ( = ?auto_712042 ?auto_712050 ) ) ( not ( = ?auto_712042 ?auto_712051 ) ) ( not ( = ?auto_712042 ?auto_712052 ) ) ( not ( = ?auto_712042 ?auto_712053 ) ) ( not ( = ?auto_712042 ?auto_712054 ) ) ( not ( = ?auto_712043 ?auto_712044 ) ) ( not ( = ?auto_712043 ?auto_712045 ) ) ( not ( = ?auto_712043 ?auto_712046 ) ) ( not ( = ?auto_712043 ?auto_712047 ) ) ( not ( = ?auto_712043 ?auto_712048 ) ) ( not ( = ?auto_712043 ?auto_712049 ) ) ( not ( = ?auto_712043 ?auto_712050 ) ) ( not ( = ?auto_712043 ?auto_712051 ) ) ( not ( = ?auto_712043 ?auto_712052 ) ) ( not ( = ?auto_712043 ?auto_712053 ) ) ( not ( = ?auto_712043 ?auto_712054 ) ) ( not ( = ?auto_712044 ?auto_712045 ) ) ( not ( = ?auto_712044 ?auto_712046 ) ) ( not ( = ?auto_712044 ?auto_712047 ) ) ( not ( = ?auto_712044 ?auto_712048 ) ) ( not ( = ?auto_712044 ?auto_712049 ) ) ( not ( = ?auto_712044 ?auto_712050 ) ) ( not ( = ?auto_712044 ?auto_712051 ) ) ( not ( = ?auto_712044 ?auto_712052 ) ) ( not ( = ?auto_712044 ?auto_712053 ) ) ( not ( = ?auto_712044 ?auto_712054 ) ) ( not ( = ?auto_712045 ?auto_712046 ) ) ( not ( = ?auto_712045 ?auto_712047 ) ) ( not ( = ?auto_712045 ?auto_712048 ) ) ( not ( = ?auto_712045 ?auto_712049 ) ) ( not ( = ?auto_712045 ?auto_712050 ) ) ( not ( = ?auto_712045 ?auto_712051 ) ) ( not ( = ?auto_712045 ?auto_712052 ) ) ( not ( = ?auto_712045 ?auto_712053 ) ) ( not ( = ?auto_712045 ?auto_712054 ) ) ( not ( = ?auto_712046 ?auto_712047 ) ) ( not ( = ?auto_712046 ?auto_712048 ) ) ( not ( = ?auto_712046 ?auto_712049 ) ) ( not ( = ?auto_712046 ?auto_712050 ) ) ( not ( = ?auto_712046 ?auto_712051 ) ) ( not ( = ?auto_712046 ?auto_712052 ) ) ( not ( = ?auto_712046 ?auto_712053 ) ) ( not ( = ?auto_712046 ?auto_712054 ) ) ( not ( = ?auto_712047 ?auto_712048 ) ) ( not ( = ?auto_712047 ?auto_712049 ) ) ( not ( = ?auto_712047 ?auto_712050 ) ) ( not ( = ?auto_712047 ?auto_712051 ) ) ( not ( = ?auto_712047 ?auto_712052 ) ) ( not ( = ?auto_712047 ?auto_712053 ) ) ( not ( = ?auto_712047 ?auto_712054 ) ) ( not ( = ?auto_712048 ?auto_712049 ) ) ( not ( = ?auto_712048 ?auto_712050 ) ) ( not ( = ?auto_712048 ?auto_712051 ) ) ( not ( = ?auto_712048 ?auto_712052 ) ) ( not ( = ?auto_712048 ?auto_712053 ) ) ( not ( = ?auto_712048 ?auto_712054 ) ) ( not ( = ?auto_712049 ?auto_712050 ) ) ( not ( = ?auto_712049 ?auto_712051 ) ) ( not ( = ?auto_712049 ?auto_712052 ) ) ( not ( = ?auto_712049 ?auto_712053 ) ) ( not ( = ?auto_712049 ?auto_712054 ) ) ( not ( = ?auto_712050 ?auto_712051 ) ) ( not ( = ?auto_712050 ?auto_712052 ) ) ( not ( = ?auto_712050 ?auto_712053 ) ) ( not ( = ?auto_712050 ?auto_712054 ) ) ( not ( = ?auto_712051 ?auto_712052 ) ) ( not ( = ?auto_712051 ?auto_712053 ) ) ( not ( = ?auto_712051 ?auto_712054 ) ) ( not ( = ?auto_712052 ?auto_712053 ) ) ( not ( = ?auto_712052 ?auto_712054 ) ) ( not ( = ?auto_712053 ?auto_712054 ) ) ( CLEAR ?auto_712051 ) ( ON ?auto_712052 ?auto_712053 ) ( CLEAR ?auto_712052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_712042 ?auto_712043 ?auto_712044 ?auto_712045 ?auto_712046 ?auto_712047 ?auto_712048 ?auto_712049 ?auto_712050 ?auto_712051 ?auto_712052 )
      ( MAKE-12PILE ?auto_712042 ?auto_712043 ?auto_712044 ?auto_712045 ?auto_712046 ?auto_712047 ?auto_712048 ?auto_712049 ?auto_712050 ?auto_712051 ?auto_712052 ?auto_712053 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712092 - BLOCK
      ?auto_712093 - BLOCK
      ?auto_712094 - BLOCK
      ?auto_712095 - BLOCK
      ?auto_712096 - BLOCK
      ?auto_712097 - BLOCK
      ?auto_712098 - BLOCK
      ?auto_712099 - BLOCK
      ?auto_712100 - BLOCK
      ?auto_712101 - BLOCK
      ?auto_712102 - BLOCK
      ?auto_712103 - BLOCK
    )
    :vars
    (
      ?auto_712104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712103 ?auto_712104 ) ( ON-TABLE ?auto_712092 ) ( ON ?auto_712093 ?auto_712092 ) ( ON ?auto_712094 ?auto_712093 ) ( ON ?auto_712095 ?auto_712094 ) ( ON ?auto_712096 ?auto_712095 ) ( ON ?auto_712097 ?auto_712096 ) ( ON ?auto_712098 ?auto_712097 ) ( ON ?auto_712099 ?auto_712098 ) ( ON ?auto_712100 ?auto_712099 ) ( not ( = ?auto_712092 ?auto_712093 ) ) ( not ( = ?auto_712092 ?auto_712094 ) ) ( not ( = ?auto_712092 ?auto_712095 ) ) ( not ( = ?auto_712092 ?auto_712096 ) ) ( not ( = ?auto_712092 ?auto_712097 ) ) ( not ( = ?auto_712092 ?auto_712098 ) ) ( not ( = ?auto_712092 ?auto_712099 ) ) ( not ( = ?auto_712092 ?auto_712100 ) ) ( not ( = ?auto_712092 ?auto_712101 ) ) ( not ( = ?auto_712092 ?auto_712102 ) ) ( not ( = ?auto_712092 ?auto_712103 ) ) ( not ( = ?auto_712092 ?auto_712104 ) ) ( not ( = ?auto_712093 ?auto_712094 ) ) ( not ( = ?auto_712093 ?auto_712095 ) ) ( not ( = ?auto_712093 ?auto_712096 ) ) ( not ( = ?auto_712093 ?auto_712097 ) ) ( not ( = ?auto_712093 ?auto_712098 ) ) ( not ( = ?auto_712093 ?auto_712099 ) ) ( not ( = ?auto_712093 ?auto_712100 ) ) ( not ( = ?auto_712093 ?auto_712101 ) ) ( not ( = ?auto_712093 ?auto_712102 ) ) ( not ( = ?auto_712093 ?auto_712103 ) ) ( not ( = ?auto_712093 ?auto_712104 ) ) ( not ( = ?auto_712094 ?auto_712095 ) ) ( not ( = ?auto_712094 ?auto_712096 ) ) ( not ( = ?auto_712094 ?auto_712097 ) ) ( not ( = ?auto_712094 ?auto_712098 ) ) ( not ( = ?auto_712094 ?auto_712099 ) ) ( not ( = ?auto_712094 ?auto_712100 ) ) ( not ( = ?auto_712094 ?auto_712101 ) ) ( not ( = ?auto_712094 ?auto_712102 ) ) ( not ( = ?auto_712094 ?auto_712103 ) ) ( not ( = ?auto_712094 ?auto_712104 ) ) ( not ( = ?auto_712095 ?auto_712096 ) ) ( not ( = ?auto_712095 ?auto_712097 ) ) ( not ( = ?auto_712095 ?auto_712098 ) ) ( not ( = ?auto_712095 ?auto_712099 ) ) ( not ( = ?auto_712095 ?auto_712100 ) ) ( not ( = ?auto_712095 ?auto_712101 ) ) ( not ( = ?auto_712095 ?auto_712102 ) ) ( not ( = ?auto_712095 ?auto_712103 ) ) ( not ( = ?auto_712095 ?auto_712104 ) ) ( not ( = ?auto_712096 ?auto_712097 ) ) ( not ( = ?auto_712096 ?auto_712098 ) ) ( not ( = ?auto_712096 ?auto_712099 ) ) ( not ( = ?auto_712096 ?auto_712100 ) ) ( not ( = ?auto_712096 ?auto_712101 ) ) ( not ( = ?auto_712096 ?auto_712102 ) ) ( not ( = ?auto_712096 ?auto_712103 ) ) ( not ( = ?auto_712096 ?auto_712104 ) ) ( not ( = ?auto_712097 ?auto_712098 ) ) ( not ( = ?auto_712097 ?auto_712099 ) ) ( not ( = ?auto_712097 ?auto_712100 ) ) ( not ( = ?auto_712097 ?auto_712101 ) ) ( not ( = ?auto_712097 ?auto_712102 ) ) ( not ( = ?auto_712097 ?auto_712103 ) ) ( not ( = ?auto_712097 ?auto_712104 ) ) ( not ( = ?auto_712098 ?auto_712099 ) ) ( not ( = ?auto_712098 ?auto_712100 ) ) ( not ( = ?auto_712098 ?auto_712101 ) ) ( not ( = ?auto_712098 ?auto_712102 ) ) ( not ( = ?auto_712098 ?auto_712103 ) ) ( not ( = ?auto_712098 ?auto_712104 ) ) ( not ( = ?auto_712099 ?auto_712100 ) ) ( not ( = ?auto_712099 ?auto_712101 ) ) ( not ( = ?auto_712099 ?auto_712102 ) ) ( not ( = ?auto_712099 ?auto_712103 ) ) ( not ( = ?auto_712099 ?auto_712104 ) ) ( not ( = ?auto_712100 ?auto_712101 ) ) ( not ( = ?auto_712100 ?auto_712102 ) ) ( not ( = ?auto_712100 ?auto_712103 ) ) ( not ( = ?auto_712100 ?auto_712104 ) ) ( not ( = ?auto_712101 ?auto_712102 ) ) ( not ( = ?auto_712101 ?auto_712103 ) ) ( not ( = ?auto_712101 ?auto_712104 ) ) ( not ( = ?auto_712102 ?auto_712103 ) ) ( not ( = ?auto_712102 ?auto_712104 ) ) ( not ( = ?auto_712103 ?auto_712104 ) ) ( ON ?auto_712102 ?auto_712103 ) ( CLEAR ?auto_712100 ) ( ON ?auto_712101 ?auto_712102 ) ( CLEAR ?auto_712101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_712092 ?auto_712093 ?auto_712094 ?auto_712095 ?auto_712096 ?auto_712097 ?auto_712098 ?auto_712099 ?auto_712100 ?auto_712101 )
      ( MAKE-12PILE ?auto_712092 ?auto_712093 ?auto_712094 ?auto_712095 ?auto_712096 ?auto_712097 ?auto_712098 ?auto_712099 ?auto_712100 ?auto_712101 ?auto_712102 ?auto_712103 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712142 - BLOCK
      ?auto_712143 - BLOCK
      ?auto_712144 - BLOCK
      ?auto_712145 - BLOCK
      ?auto_712146 - BLOCK
      ?auto_712147 - BLOCK
      ?auto_712148 - BLOCK
      ?auto_712149 - BLOCK
      ?auto_712150 - BLOCK
      ?auto_712151 - BLOCK
      ?auto_712152 - BLOCK
      ?auto_712153 - BLOCK
    )
    :vars
    (
      ?auto_712154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712153 ?auto_712154 ) ( ON-TABLE ?auto_712142 ) ( ON ?auto_712143 ?auto_712142 ) ( ON ?auto_712144 ?auto_712143 ) ( ON ?auto_712145 ?auto_712144 ) ( ON ?auto_712146 ?auto_712145 ) ( ON ?auto_712147 ?auto_712146 ) ( ON ?auto_712148 ?auto_712147 ) ( ON ?auto_712149 ?auto_712148 ) ( not ( = ?auto_712142 ?auto_712143 ) ) ( not ( = ?auto_712142 ?auto_712144 ) ) ( not ( = ?auto_712142 ?auto_712145 ) ) ( not ( = ?auto_712142 ?auto_712146 ) ) ( not ( = ?auto_712142 ?auto_712147 ) ) ( not ( = ?auto_712142 ?auto_712148 ) ) ( not ( = ?auto_712142 ?auto_712149 ) ) ( not ( = ?auto_712142 ?auto_712150 ) ) ( not ( = ?auto_712142 ?auto_712151 ) ) ( not ( = ?auto_712142 ?auto_712152 ) ) ( not ( = ?auto_712142 ?auto_712153 ) ) ( not ( = ?auto_712142 ?auto_712154 ) ) ( not ( = ?auto_712143 ?auto_712144 ) ) ( not ( = ?auto_712143 ?auto_712145 ) ) ( not ( = ?auto_712143 ?auto_712146 ) ) ( not ( = ?auto_712143 ?auto_712147 ) ) ( not ( = ?auto_712143 ?auto_712148 ) ) ( not ( = ?auto_712143 ?auto_712149 ) ) ( not ( = ?auto_712143 ?auto_712150 ) ) ( not ( = ?auto_712143 ?auto_712151 ) ) ( not ( = ?auto_712143 ?auto_712152 ) ) ( not ( = ?auto_712143 ?auto_712153 ) ) ( not ( = ?auto_712143 ?auto_712154 ) ) ( not ( = ?auto_712144 ?auto_712145 ) ) ( not ( = ?auto_712144 ?auto_712146 ) ) ( not ( = ?auto_712144 ?auto_712147 ) ) ( not ( = ?auto_712144 ?auto_712148 ) ) ( not ( = ?auto_712144 ?auto_712149 ) ) ( not ( = ?auto_712144 ?auto_712150 ) ) ( not ( = ?auto_712144 ?auto_712151 ) ) ( not ( = ?auto_712144 ?auto_712152 ) ) ( not ( = ?auto_712144 ?auto_712153 ) ) ( not ( = ?auto_712144 ?auto_712154 ) ) ( not ( = ?auto_712145 ?auto_712146 ) ) ( not ( = ?auto_712145 ?auto_712147 ) ) ( not ( = ?auto_712145 ?auto_712148 ) ) ( not ( = ?auto_712145 ?auto_712149 ) ) ( not ( = ?auto_712145 ?auto_712150 ) ) ( not ( = ?auto_712145 ?auto_712151 ) ) ( not ( = ?auto_712145 ?auto_712152 ) ) ( not ( = ?auto_712145 ?auto_712153 ) ) ( not ( = ?auto_712145 ?auto_712154 ) ) ( not ( = ?auto_712146 ?auto_712147 ) ) ( not ( = ?auto_712146 ?auto_712148 ) ) ( not ( = ?auto_712146 ?auto_712149 ) ) ( not ( = ?auto_712146 ?auto_712150 ) ) ( not ( = ?auto_712146 ?auto_712151 ) ) ( not ( = ?auto_712146 ?auto_712152 ) ) ( not ( = ?auto_712146 ?auto_712153 ) ) ( not ( = ?auto_712146 ?auto_712154 ) ) ( not ( = ?auto_712147 ?auto_712148 ) ) ( not ( = ?auto_712147 ?auto_712149 ) ) ( not ( = ?auto_712147 ?auto_712150 ) ) ( not ( = ?auto_712147 ?auto_712151 ) ) ( not ( = ?auto_712147 ?auto_712152 ) ) ( not ( = ?auto_712147 ?auto_712153 ) ) ( not ( = ?auto_712147 ?auto_712154 ) ) ( not ( = ?auto_712148 ?auto_712149 ) ) ( not ( = ?auto_712148 ?auto_712150 ) ) ( not ( = ?auto_712148 ?auto_712151 ) ) ( not ( = ?auto_712148 ?auto_712152 ) ) ( not ( = ?auto_712148 ?auto_712153 ) ) ( not ( = ?auto_712148 ?auto_712154 ) ) ( not ( = ?auto_712149 ?auto_712150 ) ) ( not ( = ?auto_712149 ?auto_712151 ) ) ( not ( = ?auto_712149 ?auto_712152 ) ) ( not ( = ?auto_712149 ?auto_712153 ) ) ( not ( = ?auto_712149 ?auto_712154 ) ) ( not ( = ?auto_712150 ?auto_712151 ) ) ( not ( = ?auto_712150 ?auto_712152 ) ) ( not ( = ?auto_712150 ?auto_712153 ) ) ( not ( = ?auto_712150 ?auto_712154 ) ) ( not ( = ?auto_712151 ?auto_712152 ) ) ( not ( = ?auto_712151 ?auto_712153 ) ) ( not ( = ?auto_712151 ?auto_712154 ) ) ( not ( = ?auto_712152 ?auto_712153 ) ) ( not ( = ?auto_712152 ?auto_712154 ) ) ( not ( = ?auto_712153 ?auto_712154 ) ) ( ON ?auto_712152 ?auto_712153 ) ( ON ?auto_712151 ?auto_712152 ) ( CLEAR ?auto_712149 ) ( ON ?auto_712150 ?auto_712151 ) ( CLEAR ?auto_712150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_712142 ?auto_712143 ?auto_712144 ?auto_712145 ?auto_712146 ?auto_712147 ?auto_712148 ?auto_712149 ?auto_712150 )
      ( MAKE-12PILE ?auto_712142 ?auto_712143 ?auto_712144 ?auto_712145 ?auto_712146 ?auto_712147 ?auto_712148 ?auto_712149 ?auto_712150 ?auto_712151 ?auto_712152 ?auto_712153 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712192 - BLOCK
      ?auto_712193 - BLOCK
      ?auto_712194 - BLOCK
      ?auto_712195 - BLOCK
      ?auto_712196 - BLOCK
      ?auto_712197 - BLOCK
      ?auto_712198 - BLOCK
      ?auto_712199 - BLOCK
      ?auto_712200 - BLOCK
      ?auto_712201 - BLOCK
      ?auto_712202 - BLOCK
      ?auto_712203 - BLOCK
    )
    :vars
    (
      ?auto_712204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712203 ?auto_712204 ) ( ON-TABLE ?auto_712192 ) ( ON ?auto_712193 ?auto_712192 ) ( ON ?auto_712194 ?auto_712193 ) ( ON ?auto_712195 ?auto_712194 ) ( ON ?auto_712196 ?auto_712195 ) ( ON ?auto_712197 ?auto_712196 ) ( ON ?auto_712198 ?auto_712197 ) ( not ( = ?auto_712192 ?auto_712193 ) ) ( not ( = ?auto_712192 ?auto_712194 ) ) ( not ( = ?auto_712192 ?auto_712195 ) ) ( not ( = ?auto_712192 ?auto_712196 ) ) ( not ( = ?auto_712192 ?auto_712197 ) ) ( not ( = ?auto_712192 ?auto_712198 ) ) ( not ( = ?auto_712192 ?auto_712199 ) ) ( not ( = ?auto_712192 ?auto_712200 ) ) ( not ( = ?auto_712192 ?auto_712201 ) ) ( not ( = ?auto_712192 ?auto_712202 ) ) ( not ( = ?auto_712192 ?auto_712203 ) ) ( not ( = ?auto_712192 ?auto_712204 ) ) ( not ( = ?auto_712193 ?auto_712194 ) ) ( not ( = ?auto_712193 ?auto_712195 ) ) ( not ( = ?auto_712193 ?auto_712196 ) ) ( not ( = ?auto_712193 ?auto_712197 ) ) ( not ( = ?auto_712193 ?auto_712198 ) ) ( not ( = ?auto_712193 ?auto_712199 ) ) ( not ( = ?auto_712193 ?auto_712200 ) ) ( not ( = ?auto_712193 ?auto_712201 ) ) ( not ( = ?auto_712193 ?auto_712202 ) ) ( not ( = ?auto_712193 ?auto_712203 ) ) ( not ( = ?auto_712193 ?auto_712204 ) ) ( not ( = ?auto_712194 ?auto_712195 ) ) ( not ( = ?auto_712194 ?auto_712196 ) ) ( not ( = ?auto_712194 ?auto_712197 ) ) ( not ( = ?auto_712194 ?auto_712198 ) ) ( not ( = ?auto_712194 ?auto_712199 ) ) ( not ( = ?auto_712194 ?auto_712200 ) ) ( not ( = ?auto_712194 ?auto_712201 ) ) ( not ( = ?auto_712194 ?auto_712202 ) ) ( not ( = ?auto_712194 ?auto_712203 ) ) ( not ( = ?auto_712194 ?auto_712204 ) ) ( not ( = ?auto_712195 ?auto_712196 ) ) ( not ( = ?auto_712195 ?auto_712197 ) ) ( not ( = ?auto_712195 ?auto_712198 ) ) ( not ( = ?auto_712195 ?auto_712199 ) ) ( not ( = ?auto_712195 ?auto_712200 ) ) ( not ( = ?auto_712195 ?auto_712201 ) ) ( not ( = ?auto_712195 ?auto_712202 ) ) ( not ( = ?auto_712195 ?auto_712203 ) ) ( not ( = ?auto_712195 ?auto_712204 ) ) ( not ( = ?auto_712196 ?auto_712197 ) ) ( not ( = ?auto_712196 ?auto_712198 ) ) ( not ( = ?auto_712196 ?auto_712199 ) ) ( not ( = ?auto_712196 ?auto_712200 ) ) ( not ( = ?auto_712196 ?auto_712201 ) ) ( not ( = ?auto_712196 ?auto_712202 ) ) ( not ( = ?auto_712196 ?auto_712203 ) ) ( not ( = ?auto_712196 ?auto_712204 ) ) ( not ( = ?auto_712197 ?auto_712198 ) ) ( not ( = ?auto_712197 ?auto_712199 ) ) ( not ( = ?auto_712197 ?auto_712200 ) ) ( not ( = ?auto_712197 ?auto_712201 ) ) ( not ( = ?auto_712197 ?auto_712202 ) ) ( not ( = ?auto_712197 ?auto_712203 ) ) ( not ( = ?auto_712197 ?auto_712204 ) ) ( not ( = ?auto_712198 ?auto_712199 ) ) ( not ( = ?auto_712198 ?auto_712200 ) ) ( not ( = ?auto_712198 ?auto_712201 ) ) ( not ( = ?auto_712198 ?auto_712202 ) ) ( not ( = ?auto_712198 ?auto_712203 ) ) ( not ( = ?auto_712198 ?auto_712204 ) ) ( not ( = ?auto_712199 ?auto_712200 ) ) ( not ( = ?auto_712199 ?auto_712201 ) ) ( not ( = ?auto_712199 ?auto_712202 ) ) ( not ( = ?auto_712199 ?auto_712203 ) ) ( not ( = ?auto_712199 ?auto_712204 ) ) ( not ( = ?auto_712200 ?auto_712201 ) ) ( not ( = ?auto_712200 ?auto_712202 ) ) ( not ( = ?auto_712200 ?auto_712203 ) ) ( not ( = ?auto_712200 ?auto_712204 ) ) ( not ( = ?auto_712201 ?auto_712202 ) ) ( not ( = ?auto_712201 ?auto_712203 ) ) ( not ( = ?auto_712201 ?auto_712204 ) ) ( not ( = ?auto_712202 ?auto_712203 ) ) ( not ( = ?auto_712202 ?auto_712204 ) ) ( not ( = ?auto_712203 ?auto_712204 ) ) ( ON ?auto_712202 ?auto_712203 ) ( ON ?auto_712201 ?auto_712202 ) ( ON ?auto_712200 ?auto_712201 ) ( CLEAR ?auto_712198 ) ( ON ?auto_712199 ?auto_712200 ) ( CLEAR ?auto_712199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_712192 ?auto_712193 ?auto_712194 ?auto_712195 ?auto_712196 ?auto_712197 ?auto_712198 ?auto_712199 )
      ( MAKE-12PILE ?auto_712192 ?auto_712193 ?auto_712194 ?auto_712195 ?auto_712196 ?auto_712197 ?auto_712198 ?auto_712199 ?auto_712200 ?auto_712201 ?auto_712202 ?auto_712203 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712242 - BLOCK
      ?auto_712243 - BLOCK
      ?auto_712244 - BLOCK
      ?auto_712245 - BLOCK
      ?auto_712246 - BLOCK
      ?auto_712247 - BLOCK
      ?auto_712248 - BLOCK
      ?auto_712249 - BLOCK
      ?auto_712250 - BLOCK
      ?auto_712251 - BLOCK
      ?auto_712252 - BLOCK
      ?auto_712253 - BLOCK
    )
    :vars
    (
      ?auto_712254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712253 ?auto_712254 ) ( ON-TABLE ?auto_712242 ) ( ON ?auto_712243 ?auto_712242 ) ( ON ?auto_712244 ?auto_712243 ) ( ON ?auto_712245 ?auto_712244 ) ( ON ?auto_712246 ?auto_712245 ) ( ON ?auto_712247 ?auto_712246 ) ( not ( = ?auto_712242 ?auto_712243 ) ) ( not ( = ?auto_712242 ?auto_712244 ) ) ( not ( = ?auto_712242 ?auto_712245 ) ) ( not ( = ?auto_712242 ?auto_712246 ) ) ( not ( = ?auto_712242 ?auto_712247 ) ) ( not ( = ?auto_712242 ?auto_712248 ) ) ( not ( = ?auto_712242 ?auto_712249 ) ) ( not ( = ?auto_712242 ?auto_712250 ) ) ( not ( = ?auto_712242 ?auto_712251 ) ) ( not ( = ?auto_712242 ?auto_712252 ) ) ( not ( = ?auto_712242 ?auto_712253 ) ) ( not ( = ?auto_712242 ?auto_712254 ) ) ( not ( = ?auto_712243 ?auto_712244 ) ) ( not ( = ?auto_712243 ?auto_712245 ) ) ( not ( = ?auto_712243 ?auto_712246 ) ) ( not ( = ?auto_712243 ?auto_712247 ) ) ( not ( = ?auto_712243 ?auto_712248 ) ) ( not ( = ?auto_712243 ?auto_712249 ) ) ( not ( = ?auto_712243 ?auto_712250 ) ) ( not ( = ?auto_712243 ?auto_712251 ) ) ( not ( = ?auto_712243 ?auto_712252 ) ) ( not ( = ?auto_712243 ?auto_712253 ) ) ( not ( = ?auto_712243 ?auto_712254 ) ) ( not ( = ?auto_712244 ?auto_712245 ) ) ( not ( = ?auto_712244 ?auto_712246 ) ) ( not ( = ?auto_712244 ?auto_712247 ) ) ( not ( = ?auto_712244 ?auto_712248 ) ) ( not ( = ?auto_712244 ?auto_712249 ) ) ( not ( = ?auto_712244 ?auto_712250 ) ) ( not ( = ?auto_712244 ?auto_712251 ) ) ( not ( = ?auto_712244 ?auto_712252 ) ) ( not ( = ?auto_712244 ?auto_712253 ) ) ( not ( = ?auto_712244 ?auto_712254 ) ) ( not ( = ?auto_712245 ?auto_712246 ) ) ( not ( = ?auto_712245 ?auto_712247 ) ) ( not ( = ?auto_712245 ?auto_712248 ) ) ( not ( = ?auto_712245 ?auto_712249 ) ) ( not ( = ?auto_712245 ?auto_712250 ) ) ( not ( = ?auto_712245 ?auto_712251 ) ) ( not ( = ?auto_712245 ?auto_712252 ) ) ( not ( = ?auto_712245 ?auto_712253 ) ) ( not ( = ?auto_712245 ?auto_712254 ) ) ( not ( = ?auto_712246 ?auto_712247 ) ) ( not ( = ?auto_712246 ?auto_712248 ) ) ( not ( = ?auto_712246 ?auto_712249 ) ) ( not ( = ?auto_712246 ?auto_712250 ) ) ( not ( = ?auto_712246 ?auto_712251 ) ) ( not ( = ?auto_712246 ?auto_712252 ) ) ( not ( = ?auto_712246 ?auto_712253 ) ) ( not ( = ?auto_712246 ?auto_712254 ) ) ( not ( = ?auto_712247 ?auto_712248 ) ) ( not ( = ?auto_712247 ?auto_712249 ) ) ( not ( = ?auto_712247 ?auto_712250 ) ) ( not ( = ?auto_712247 ?auto_712251 ) ) ( not ( = ?auto_712247 ?auto_712252 ) ) ( not ( = ?auto_712247 ?auto_712253 ) ) ( not ( = ?auto_712247 ?auto_712254 ) ) ( not ( = ?auto_712248 ?auto_712249 ) ) ( not ( = ?auto_712248 ?auto_712250 ) ) ( not ( = ?auto_712248 ?auto_712251 ) ) ( not ( = ?auto_712248 ?auto_712252 ) ) ( not ( = ?auto_712248 ?auto_712253 ) ) ( not ( = ?auto_712248 ?auto_712254 ) ) ( not ( = ?auto_712249 ?auto_712250 ) ) ( not ( = ?auto_712249 ?auto_712251 ) ) ( not ( = ?auto_712249 ?auto_712252 ) ) ( not ( = ?auto_712249 ?auto_712253 ) ) ( not ( = ?auto_712249 ?auto_712254 ) ) ( not ( = ?auto_712250 ?auto_712251 ) ) ( not ( = ?auto_712250 ?auto_712252 ) ) ( not ( = ?auto_712250 ?auto_712253 ) ) ( not ( = ?auto_712250 ?auto_712254 ) ) ( not ( = ?auto_712251 ?auto_712252 ) ) ( not ( = ?auto_712251 ?auto_712253 ) ) ( not ( = ?auto_712251 ?auto_712254 ) ) ( not ( = ?auto_712252 ?auto_712253 ) ) ( not ( = ?auto_712252 ?auto_712254 ) ) ( not ( = ?auto_712253 ?auto_712254 ) ) ( ON ?auto_712252 ?auto_712253 ) ( ON ?auto_712251 ?auto_712252 ) ( ON ?auto_712250 ?auto_712251 ) ( ON ?auto_712249 ?auto_712250 ) ( CLEAR ?auto_712247 ) ( ON ?auto_712248 ?auto_712249 ) ( CLEAR ?auto_712248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_712242 ?auto_712243 ?auto_712244 ?auto_712245 ?auto_712246 ?auto_712247 ?auto_712248 )
      ( MAKE-12PILE ?auto_712242 ?auto_712243 ?auto_712244 ?auto_712245 ?auto_712246 ?auto_712247 ?auto_712248 ?auto_712249 ?auto_712250 ?auto_712251 ?auto_712252 ?auto_712253 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712292 - BLOCK
      ?auto_712293 - BLOCK
      ?auto_712294 - BLOCK
      ?auto_712295 - BLOCK
      ?auto_712296 - BLOCK
      ?auto_712297 - BLOCK
      ?auto_712298 - BLOCK
      ?auto_712299 - BLOCK
      ?auto_712300 - BLOCK
      ?auto_712301 - BLOCK
      ?auto_712302 - BLOCK
      ?auto_712303 - BLOCK
    )
    :vars
    (
      ?auto_712304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712303 ?auto_712304 ) ( ON-TABLE ?auto_712292 ) ( ON ?auto_712293 ?auto_712292 ) ( ON ?auto_712294 ?auto_712293 ) ( ON ?auto_712295 ?auto_712294 ) ( ON ?auto_712296 ?auto_712295 ) ( not ( = ?auto_712292 ?auto_712293 ) ) ( not ( = ?auto_712292 ?auto_712294 ) ) ( not ( = ?auto_712292 ?auto_712295 ) ) ( not ( = ?auto_712292 ?auto_712296 ) ) ( not ( = ?auto_712292 ?auto_712297 ) ) ( not ( = ?auto_712292 ?auto_712298 ) ) ( not ( = ?auto_712292 ?auto_712299 ) ) ( not ( = ?auto_712292 ?auto_712300 ) ) ( not ( = ?auto_712292 ?auto_712301 ) ) ( not ( = ?auto_712292 ?auto_712302 ) ) ( not ( = ?auto_712292 ?auto_712303 ) ) ( not ( = ?auto_712292 ?auto_712304 ) ) ( not ( = ?auto_712293 ?auto_712294 ) ) ( not ( = ?auto_712293 ?auto_712295 ) ) ( not ( = ?auto_712293 ?auto_712296 ) ) ( not ( = ?auto_712293 ?auto_712297 ) ) ( not ( = ?auto_712293 ?auto_712298 ) ) ( not ( = ?auto_712293 ?auto_712299 ) ) ( not ( = ?auto_712293 ?auto_712300 ) ) ( not ( = ?auto_712293 ?auto_712301 ) ) ( not ( = ?auto_712293 ?auto_712302 ) ) ( not ( = ?auto_712293 ?auto_712303 ) ) ( not ( = ?auto_712293 ?auto_712304 ) ) ( not ( = ?auto_712294 ?auto_712295 ) ) ( not ( = ?auto_712294 ?auto_712296 ) ) ( not ( = ?auto_712294 ?auto_712297 ) ) ( not ( = ?auto_712294 ?auto_712298 ) ) ( not ( = ?auto_712294 ?auto_712299 ) ) ( not ( = ?auto_712294 ?auto_712300 ) ) ( not ( = ?auto_712294 ?auto_712301 ) ) ( not ( = ?auto_712294 ?auto_712302 ) ) ( not ( = ?auto_712294 ?auto_712303 ) ) ( not ( = ?auto_712294 ?auto_712304 ) ) ( not ( = ?auto_712295 ?auto_712296 ) ) ( not ( = ?auto_712295 ?auto_712297 ) ) ( not ( = ?auto_712295 ?auto_712298 ) ) ( not ( = ?auto_712295 ?auto_712299 ) ) ( not ( = ?auto_712295 ?auto_712300 ) ) ( not ( = ?auto_712295 ?auto_712301 ) ) ( not ( = ?auto_712295 ?auto_712302 ) ) ( not ( = ?auto_712295 ?auto_712303 ) ) ( not ( = ?auto_712295 ?auto_712304 ) ) ( not ( = ?auto_712296 ?auto_712297 ) ) ( not ( = ?auto_712296 ?auto_712298 ) ) ( not ( = ?auto_712296 ?auto_712299 ) ) ( not ( = ?auto_712296 ?auto_712300 ) ) ( not ( = ?auto_712296 ?auto_712301 ) ) ( not ( = ?auto_712296 ?auto_712302 ) ) ( not ( = ?auto_712296 ?auto_712303 ) ) ( not ( = ?auto_712296 ?auto_712304 ) ) ( not ( = ?auto_712297 ?auto_712298 ) ) ( not ( = ?auto_712297 ?auto_712299 ) ) ( not ( = ?auto_712297 ?auto_712300 ) ) ( not ( = ?auto_712297 ?auto_712301 ) ) ( not ( = ?auto_712297 ?auto_712302 ) ) ( not ( = ?auto_712297 ?auto_712303 ) ) ( not ( = ?auto_712297 ?auto_712304 ) ) ( not ( = ?auto_712298 ?auto_712299 ) ) ( not ( = ?auto_712298 ?auto_712300 ) ) ( not ( = ?auto_712298 ?auto_712301 ) ) ( not ( = ?auto_712298 ?auto_712302 ) ) ( not ( = ?auto_712298 ?auto_712303 ) ) ( not ( = ?auto_712298 ?auto_712304 ) ) ( not ( = ?auto_712299 ?auto_712300 ) ) ( not ( = ?auto_712299 ?auto_712301 ) ) ( not ( = ?auto_712299 ?auto_712302 ) ) ( not ( = ?auto_712299 ?auto_712303 ) ) ( not ( = ?auto_712299 ?auto_712304 ) ) ( not ( = ?auto_712300 ?auto_712301 ) ) ( not ( = ?auto_712300 ?auto_712302 ) ) ( not ( = ?auto_712300 ?auto_712303 ) ) ( not ( = ?auto_712300 ?auto_712304 ) ) ( not ( = ?auto_712301 ?auto_712302 ) ) ( not ( = ?auto_712301 ?auto_712303 ) ) ( not ( = ?auto_712301 ?auto_712304 ) ) ( not ( = ?auto_712302 ?auto_712303 ) ) ( not ( = ?auto_712302 ?auto_712304 ) ) ( not ( = ?auto_712303 ?auto_712304 ) ) ( ON ?auto_712302 ?auto_712303 ) ( ON ?auto_712301 ?auto_712302 ) ( ON ?auto_712300 ?auto_712301 ) ( ON ?auto_712299 ?auto_712300 ) ( ON ?auto_712298 ?auto_712299 ) ( CLEAR ?auto_712296 ) ( ON ?auto_712297 ?auto_712298 ) ( CLEAR ?auto_712297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_712292 ?auto_712293 ?auto_712294 ?auto_712295 ?auto_712296 ?auto_712297 )
      ( MAKE-12PILE ?auto_712292 ?auto_712293 ?auto_712294 ?auto_712295 ?auto_712296 ?auto_712297 ?auto_712298 ?auto_712299 ?auto_712300 ?auto_712301 ?auto_712302 ?auto_712303 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712342 - BLOCK
      ?auto_712343 - BLOCK
      ?auto_712344 - BLOCK
      ?auto_712345 - BLOCK
      ?auto_712346 - BLOCK
      ?auto_712347 - BLOCK
      ?auto_712348 - BLOCK
      ?auto_712349 - BLOCK
      ?auto_712350 - BLOCK
      ?auto_712351 - BLOCK
      ?auto_712352 - BLOCK
      ?auto_712353 - BLOCK
    )
    :vars
    (
      ?auto_712354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712353 ?auto_712354 ) ( ON-TABLE ?auto_712342 ) ( ON ?auto_712343 ?auto_712342 ) ( ON ?auto_712344 ?auto_712343 ) ( ON ?auto_712345 ?auto_712344 ) ( not ( = ?auto_712342 ?auto_712343 ) ) ( not ( = ?auto_712342 ?auto_712344 ) ) ( not ( = ?auto_712342 ?auto_712345 ) ) ( not ( = ?auto_712342 ?auto_712346 ) ) ( not ( = ?auto_712342 ?auto_712347 ) ) ( not ( = ?auto_712342 ?auto_712348 ) ) ( not ( = ?auto_712342 ?auto_712349 ) ) ( not ( = ?auto_712342 ?auto_712350 ) ) ( not ( = ?auto_712342 ?auto_712351 ) ) ( not ( = ?auto_712342 ?auto_712352 ) ) ( not ( = ?auto_712342 ?auto_712353 ) ) ( not ( = ?auto_712342 ?auto_712354 ) ) ( not ( = ?auto_712343 ?auto_712344 ) ) ( not ( = ?auto_712343 ?auto_712345 ) ) ( not ( = ?auto_712343 ?auto_712346 ) ) ( not ( = ?auto_712343 ?auto_712347 ) ) ( not ( = ?auto_712343 ?auto_712348 ) ) ( not ( = ?auto_712343 ?auto_712349 ) ) ( not ( = ?auto_712343 ?auto_712350 ) ) ( not ( = ?auto_712343 ?auto_712351 ) ) ( not ( = ?auto_712343 ?auto_712352 ) ) ( not ( = ?auto_712343 ?auto_712353 ) ) ( not ( = ?auto_712343 ?auto_712354 ) ) ( not ( = ?auto_712344 ?auto_712345 ) ) ( not ( = ?auto_712344 ?auto_712346 ) ) ( not ( = ?auto_712344 ?auto_712347 ) ) ( not ( = ?auto_712344 ?auto_712348 ) ) ( not ( = ?auto_712344 ?auto_712349 ) ) ( not ( = ?auto_712344 ?auto_712350 ) ) ( not ( = ?auto_712344 ?auto_712351 ) ) ( not ( = ?auto_712344 ?auto_712352 ) ) ( not ( = ?auto_712344 ?auto_712353 ) ) ( not ( = ?auto_712344 ?auto_712354 ) ) ( not ( = ?auto_712345 ?auto_712346 ) ) ( not ( = ?auto_712345 ?auto_712347 ) ) ( not ( = ?auto_712345 ?auto_712348 ) ) ( not ( = ?auto_712345 ?auto_712349 ) ) ( not ( = ?auto_712345 ?auto_712350 ) ) ( not ( = ?auto_712345 ?auto_712351 ) ) ( not ( = ?auto_712345 ?auto_712352 ) ) ( not ( = ?auto_712345 ?auto_712353 ) ) ( not ( = ?auto_712345 ?auto_712354 ) ) ( not ( = ?auto_712346 ?auto_712347 ) ) ( not ( = ?auto_712346 ?auto_712348 ) ) ( not ( = ?auto_712346 ?auto_712349 ) ) ( not ( = ?auto_712346 ?auto_712350 ) ) ( not ( = ?auto_712346 ?auto_712351 ) ) ( not ( = ?auto_712346 ?auto_712352 ) ) ( not ( = ?auto_712346 ?auto_712353 ) ) ( not ( = ?auto_712346 ?auto_712354 ) ) ( not ( = ?auto_712347 ?auto_712348 ) ) ( not ( = ?auto_712347 ?auto_712349 ) ) ( not ( = ?auto_712347 ?auto_712350 ) ) ( not ( = ?auto_712347 ?auto_712351 ) ) ( not ( = ?auto_712347 ?auto_712352 ) ) ( not ( = ?auto_712347 ?auto_712353 ) ) ( not ( = ?auto_712347 ?auto_712354 ) ) ( not ( = ?auto_712348 ?auto_712349 ) ) ( not ( = ?auto_712348 ?auto_712350 ) ) ( not ( = ?auto_712348 ?auto_712351 ) ) ( not ( = ?auto_712348 ?auto_712352 ) ) ( not ( = ?auto_712348 ?auto_712353 ) ) ( not ( = ?auto_712348 ?auto_712354 ) ) ( not ( = ?auto_712349 ?auto_712350 ) ) ( not ( = ?auto_712349 ?auto_712351 ) ) ( not ( = ?auto_712349 ?auto_712352 ) ) ( not ( = ?auto_712349 ?auto_712353 ) ) ( not ( = ?auto_712349 ?auto_712354 ) ) ( not ( = ?auto_712350 ?auto_712351 ) ) ( not ( = ?auto_712350 ?auto_712352 ) ) ( not ( = ?auto_712350 ?auto_712353 ) ) ( not ( = ?auto_712350 ?auto_712354 ) ) ( not ( = ?auto_712351 ?auto_712352 ) ) ( not ( = ?auto_712351 ?auto_712353 ) ) ( not ( = ?auto_712351 ?auto_712354 ) ) ( not ( = ?auto_712352 ?auto_712353 ) ) ( not ( = ?auto_712352 ?auto_712354 ) ) ( not ( = ?auto_712353 ?auto_712354 ) ) ( ON ?auto_712352 ?auto_712353 ) ( ON ?auto_712351 ?auto_712352 ) ( ON ?auto_712350 ?auto_712351 ) ( ON ?auto_712349 ?auto_712350 ) ( ON ?auto_712348 ?auto_712349 ) ( ON ?auto_712347 ?auto_712348 ) ( CLEAR ?auto_712345 ) ( ON ?auto_712346 ?auto_712347 ) ( CLEAR ?auto_712346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_712342 ?auto_712343 ?auto_712344 ?auto_712345 ?auto_712346 )
      ( MAKE-12PILE ?auto_712342 ?auto_712343 ?auto_712344 ?auto_712345 ?auto_712346 ?auto_712347 ?auto_712348 ?auto_712349 ?auto_712350 ?auto_712351 ?auto_712352 ?auto_712353 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712392 - BLOCK
      ?auto_712393 - BLOCK
      ?auto_712394 - BLOCK
      ?auto_712395 - BLOCK
      ?auto_712396 - BLOCK
      ?auto_712397 - BLOCK
      ?auto_712398 - BLOCK
      ?auto_712399 - BLOCK
      ?auto_712400 - BLOCK
      ?auto_712401 - BLOCK
      ?auto_712402 - BLOCK
      ?auto_712403 - BLOCK
    )
    :vars
    (
      ?auto_712404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712403 ?auto_712404 ) ( ON-TABLE ?auto_712392 ) ( ON ?auto_712393 ?auto_712392 ) ( ON ?auto_712394 ?auto_712393 ) ( not ( = ?auto_712392 ?auto_712393 ) ) ( not ( = ?auto_712392 ?auto_712394 ) ) ( not ( = ?auto_712392 ?auto_712395 ) ) ( not ( = ?auto_712392 ?auto_712396 ) ) ( not ( = ?auto_712392 ?auto_712397 ) ) ( not ( = ?auto_712392 ?auto_712398 ) ) ( not ( = ?auto_712392 ?auto_712399 ) ) ( not ( = ?auto_712392 ?auto_712400 ) ) ( not ( = ?auto_712392 ?auto_712401 ) ) ( not ( = ?auto_712392 ?auto_712402 ) ) ( not ( = ?auto_712392 ?auto_712403 ) ) ( not ( = ?auto_712392 ?auto_712404 ) ) ( not ( = ?auto_712393 ?auto_712394 ) ) ( not ( = ?auto_712393 ?auto_712395 ) ) ( not ( = ?auto_712393 ?auto_712396 ) ) ( not ( = ?auto_712393 ?auto_712397 ) ) ( not ( = ?auto_712393 ?auto_712398 ) ) ( not ( = ?auto_712393 ?auto_712399 ) ) ( not ( = ?auto_712393 ?auto_712400 ) ) ( not ( = ?auto_712393 ?auto_712401 ) ) ( not ( = ?auto_712393 ?auto_712402 ) ) ( not ( = ?auto_712393 ?auto_712403 ) ) ( not ( = ?auto_712393 ?auto_712404 ) ) ( not ( = ?auto_712394 ?auto_712395 ) ) ( not ( = ?auto_712394 ?auto_712396 ) ) ( not ( = ?auto_712394 ?auto_712397 ) ) ( not ( = ?auto_712394 ?auto_712398 ) ) ( not ( = ?auto_712394 ?auto_712399 ) ) ( not ( = ?auto_712394 ?auto_712400 ) ) ( not ( = ?auto_712394 ?auto_712401 ) ) ( not ( = ?auto_712394 ?auto_712402 ) ) ( not ( = ?auto_712394 ?auto_712403 ) ) ( not ( = ?auto_712394 ?auto_712404 ) ) ( not ( = ?auto_712395 ?auto_712396 ) ) ( not ( = ?auto_712395 ?auto_712397 ) ) ( not ( = ?auto_712395 ?auto_712398 ) ) ( not ( = ?auto_712395 ?auto_712399 ) ) ( not ( = ?auto_712395 ?auto_712400 ) ) ( not ( = ?auto_712395 ?auto_712401 ) ) ( not ( = ?auto_712395 ?auto_712402 ) ) ( not ( = ?auto_712395 ?auto_712403 ) ) ( not ( = ?auto_712395 ?auto_712404 ) ) ( not ( = ?auto_712396 ?auto_712397 ) ) ( not ( = ?auto_712396 ?auto_712398 ) ) ( not ( = ?auto_712396 ?auto_712399 ) ) ( not ( = ?auto_712396 ?auto_712400 ) ) ( not ( = ?auto_712396 ?auto_712401 ) ) ( not ( = ?auto_712396 ?auto_712402 ) ) ( not ( = ?auto_712396 ?auto_712403 ) ) ( not ( = ?auto_712396 ?auto_712404 ) ) ( not ( = ?auto_712397 ?auto_712398 ) ) ( not ( = ?auto_712397 ?auto_712399 ) ) ( not ( = ?auto_712397 ?auto_712400 ) ) ( not ( = ?auto_712397 ?auto_712401 ) ) ( not ( = ?auto_712397 ?auto_712402 ) ) ( not ( = ?auto_712397 ?auto_712403 ) ) ( not ( = ?auto_712397 ?auto_712404 ) ) ( not ( = ?auto_712398 ?auto_712399 ) ) ( not ( = ?auto_712398 ?auto_712400 ) ) ( not ( = ?auto_712398 ?auto_712401 ) ) ( not ( = ?auto_712398 ?auto_712402 ) ) ( not ( = ?auto_712398 ?auto_712403 ) ) ( not ( = ?auto_712398 ?auto_712404 ) ) ( not ( = ?auto_712399 ?auto_712400 ) ) ( not ( = ?auto_712399 ?auto_712401 ) ) ( not ( = ?auto_712399 ?auto_712402 ) ) ( not ( = ?auto_712399 ?auto_712403 ) ) ( not ( = ?auto_712399 ?auto_712404 ) ) ( not ( = ?auto_712400 ?auto_712401 ) ) ( not ( = ?auto_712400 ?auto_712402 ) ) ( not ( = ?auto_712400 ?auto_712403 ) ) ( not ( = ?auto_712400 ?auto_712404 ) ) ( not ( = ?auto_712401 ?auto_712402 ) ) ( not ( = ?auto_712401 ?auto_712403 ) ) ( not ( = ?auto_712401 ?auto_712404 ) ) ( not ( = ?auto_712402 ?auto_712403 ) ) ( not ( = ?auto_712402 ?auto_712404 ) ) ( not ( = ?auto_712403 ?auto_712404 ) ) ( ON ?auto_712402 ?auto_712403 ) ( ON ?auto_712401 ?auto_712402 ) ( ON ?auto_712400 ?auto_712401 ) ( ON ?auto_712399 ?auto_712400 ) ( ON ?auto_712398 ?auto_712399 ) ( ON ?auto_712397 ?auto_712398 ) ( ON ?auto_712396 ?auto_712397 ) ( CLEAR ?auto_712394 ) ( ON ?auto_712395 ?auto_712396 ) ( CLEAR ?auto_712395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_712392 ?auto_712393 ?auto_712394 ?auto_712395 )
      ( MAKE-12PILE ?auto_712392 ?auto_712393 ?auto_712394 ?auto_712395 ?auto_712396 ?auto_712397 ?auto_712398 ?auto_712399 ?auto_712400 ?auto_712401 ?auto_712402 ?auto_712403 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712442 - BLOCK
      ?auto_712443 - BLOCK
      ?auto_712444 - BLOCK
      ?auto_712445 - BLOCK
      ?auto_712446 - BLOCK
      ?auto_712447 - BLOCK
      ?auto_712448 - BLOCK
      ?auto_712449 - BLOCK
      ?auto_712450 - BLOCK
      ?auto_712451 - BLOCK
      ?auto_712452 - BLOCK
      ?auto_712453 - BLOCK
    )
    :vars
    (
      ?auto_712454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712453 ?auto_712454 ) ( ON-TABLE ?auto_712442 ) ( ON ?auto_712443 ?auto_712442 ) ( not ( = ?auto_712442 ?auto_712443 ) ) ( not ( = ?auto_712442 ?auto_712444 ) ) ( not ( = ?auto_712442 ?auto_712445 ) ) ( not ( = ?auto_712442 ?auto_712446 ) ) ( not ( = ?auto_712442 ?auto_712447 ) ) ( not ( = ?auto_712442 ?auto_712448 ) ) ( not ( = ?auto_712442 ?auto_712449 ) ) ( not ( = ?auto_712442 ?auto_712450 ) ) ( not ( = ?auto_712442 ?auto_712451 ) ) ( not ( = ?auto_712442 ?auto_712452 ) ) ( not ( = ?auto_712442 ?auto_712453 ) ) ( not ( = ?auto_712442 ?auto_712454 ) ) ( not ( = ?auto_712443 ?auto_712444 ) ) ( not ( = ?auto_712443 ?auto_712445 ) ) ( not ( = ?auto_712443 ?auto_712446 ) ) ( not ( = ?auto_712443 ?auto_712447 ) ) ( not ( = ?auto_712443 ?auto_712448 ) ) ( not ( = ?auto_712443 ?auto_712449 ) ) ( not ( = ?auto_712443 ?auto_712450 ) ) ( not ( = ?auto_712443 ?auto_712451 ) ) ( not ( = ?auto_712443 ?auto_712452 ) ) ( not ( = ?auto_712443 ?auto_712453 ) ) ( not ( = ?auto_712443 ?auto_712454 ) ) ( not ( = ?auto_712444 ?auto_712445 ) ) ( not ( = ?auto_712444 ?auto_712446 ) ) ( not ( = ?auto_712444 ?auto_712447 ) ) ( not ( = ?auto_712444 ?auto_712448 ) ) ( not ( = ?auto_712444 ?auto_712449 ) ) ( not ( = ?auto_712444 ?auto_712450 ) ) ( not ( = ?auto_712444 ?auto_712451 ) ) ( not ( = ?auto_712444 ?auto_712452 ) ) ( not ( = ?auto_712444 ?auto_712453 ) ) ( not ( = ?auto_712444 ?auto_712454 ) ) ( not ( = ?auto_712445 ?auto_712446 ) ) ( not ( = ?auto_712445 ?auto_712447 ) ) ( not ( = ?auto_712445 ?auto_712448 ) ) ( not ( = ?auto_712445 ?auto_712449 ) ) ( not ( = ?auto_712445 ?auto_712450 ) ) ( not ( = ?auto_712445 ?auto_712451 ) ) ( not ( = ?auto_712445 ?auto_712452 ) ) ( not ( = ?auto_712445 ?auto_712453 ) ) ( not ( = ?auto_712445 ?auto_712454 ) ) ( not ( = ?auto_712446 ?auto_712447 ) ) ( not ( = ?auto_712446 ?auto_712448 ) ) ( not ( = ?auto_712446 ?auto_712449 ) ) ( not ( = ?auto_712446 ?auto_712450 ) ) ( not ( = ?auto_712446 ?auto_712451 ) ) ( not ( = ?auto_712446 ?auto_712452 ) ) ( not ( = ?auto_712446 ?auto_712453 ) ) ( not ( = ?auto_712446 ?auto_712454 ) ) ( not ( = ?auto_712447 ?auto_712448 ) ) ( not ( = ?auto_712447 ?auto_712449 ) ) ( not ( = ?auto_712447 ?auto_712450 ) ) ( not ( = ?auto_712447 ?auto_712451 ) ) ( not ( = ?auto_712447 ?auto_712452 ) ) ( not ( = ?auto_712447 ?auto_712453 ) ) ( not ( = ?auto_712447 ?auto_712454 ) ) ( not ( = ?auto_712448 ?auto_712449 ) ) ( not ( = ?auto_712448 ?auto_712450 ) ) ( not ( = ?auto_712448 ?auto_712451 ) ) ( not ( = ?auto_712448 ?auto_712452 ) ) ( not ( = ?auto_712448 ?auto_712453 ) ) ( not ( = ?auto_712448 ?auto_712454 ) ) ( not ( = ?auto_712449 ?auto_712450 ) ) ( not ( = ?auto_712449 ?auto_712451 ) ) ( not ( = ?auto_712449 ?auto_712452 ) ) ( not ( = ?auto_712449 ?auto_712453 ) ) ( not ( = ?auto_712449 ?auto_712454 ) ) ( not ( = ?auto_712450 ?auto_712451 ) ) ( not ( = ?auto_712450 ?auto_712452 ) ) ( not ( = ?auto_712450 ?auto_712453 ) ) ( not ( = ?auto_712450 ?auto_712454 ) ) ( not ( = ?auto_712451 ?auto_712452 ) ) ( not ( = ?auto_712451 ?auto_712453 ) ) ( not ( = ?auto_712451 ?auto_712454 ) ) ( not ( = ?auto_712452 ?auto_712453 ) ) ( not ( = ?auto_712452 ?auto_712454 ) ) ( not ( = ?auto_712453 ?auto_712454 ) ) ( ON ?auto_712452 ?auto_712453 ) ( ON ?auto_712451 ?auto_712452 ) ( ON ?auto_712450 ?auto_712451 ) ( ON ?auto_712449 ?auto_712450 ) ( ON ?auto_712448 ?auto_712449 ) ( ON ?auto_712447 ?auto_712448 ) ( ON ?auto_712446 ?auto_712447 ) ( ON ?auto_712445 ?auto_712446 ) ( CLEAR ?auto_712443 ) ( ON ?auto_712444 ?auto_712445 ) ( CLEAR ?auto_712444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_712442 ?auto_712443 ?auto_712444 )
      ( MAKE-12PILE ?auto_712442 ?auto_712443 ?auto_712444 ?auto_712445 ?auto_712446 ?auto_712447 ?auto_712448 ?auto_712449 ?auto_712450 ?auto_712451 ?auto_712452 ?auto_712453 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712492 - BLOCK
      ?auto_712493 - BLOCK
      ?auto_712494 - BLOCK
      ?auto_712495 - BLOCK
      ?auto_712496 - BLOCK
      ?auto_712497 - BLOCK
      ?auto_712498 - BLOCK
      ?auto_712499 - BLOCK
      ?auto_712500 - BLOCK
      ?auto_712501 - BLOCK
      ?auto_712502 - BLOCK
      ?auto_712503 - BLOCK
    )
    :vars
    (
      ?auto_712504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712503 ?auto_712504 ) ( ON-TABLE ?auto_712492 ) ( not ( = ?auto_712492 ?auto_712493 ) ) ( not ( = ?auto_712492 ?auto_712494 ) ) ( not ( = ?auto_712492 ?auto_712495 ) ) ( not ( = ?auto_712492 ?auto_712496 ) ) ( not ( = ?auto_712492 ?auto_712497 ) ) ( not ( = ?auto_712492 ?auto_712498 ) ) ( not ( = ?auto_712492 ?auto_712499 ) ) ( not ( = ?auto_712492 ?auto_712500 ) ) ( not ( = ?auto_712492 ?auto_712501 ) ) ( not ( = ?auto_712492 ?auto_712502 ) ) ( not ( = ?auto_712492 ?auto_712503 ) ) ( not ( = ?auto_712492 ?auto_712504 ) ) ( not ( = ?auto_712493 ?auto_712494 ) ) ( not ( = ?auto_712493 ?auto_712495 ) ) ( not ( = ?auto_712493 ?auto_712496 ) ) ( not ( = ?auto_712493 ?auto_712497 ) ) ( not ( = ?auto_712493 ?auto_712498 ) ) ( not ( = ?auto_712493 ?auto_712499 ) ) ( not ( = ?auto_712493 ?auto_712500 ) ) ( not ( = ?auto_712493 ?auto_712501 ) ) ( not ( = ?auto_712493 ?auto_712502 ) ) ( not ( = ?auto_712493 ?auto_712503 ) ) ( not ( = ?auto_712493 ?auto_712504 ) ) ( not ( = ?auto_712494 ?auto_712495 ) ) ( not ( = ?auto_712494 ?auto_712496 ) ) ( not ( = ?auto_712494 ?auto_712497 ) ) ( not ( = ?auto_712494 ?auto_712498 ) ) ( not ( = ?auto_712494 ?auto_712499 ) ) ( not ( = ?auto_712494 ?auto_712500 ) ) ( not ( = ?auto_712494 ?auto_712501 ) ) ( not ( = ?auto_712494 ?auto_712502 ) ) ( not ( = ?auto_712494 ?auto_712503 ) ) ( not ( = ?auto_712494 ?auto_712504 ) ) ( not ( = ?auto_712495 ?auto_712496 ) ) ( not ( = ?auto_712495 ?auto_712497 ) ) ( not ( = ?auto_712495 ?auto_712498 ) ) ( not ( = ?auto_712495 ?auto_712499 ) ) ( not ( = ?auto_712495 ?auto_712500 ) ) ( not ( = ?auto_712495 ?auto_712501 ) ) ( not ( = ?auto_712495 ?auto_712502 ) ) ( not ( = ?auto_712495 ?auto_712503 ) ) ( not ( = ?auto_712495 ?auto_712504 ) ) ( not ( = ?auto_712496 ?auto_712497 ) ) ( not ( = ?auto_712496 ?auto_712498 ) ) ( not ( = ?auto_712496 ?auto_712499 ) ) ( not ( = ?auto_712496 ?auto_712500 ) ) ( not ( = ?auto_712496 ?auto_712501 ) ) ( not ( = ?auto_712496 ?auto_712502 ) ) ( not ( = ?auto_712496 ?auto_712503 ) ) ( not ( = ?auto_712496 ?auto_712504 ) ) ( not ( = ?auto_712497 ?auto_712498 ) ) ( not ( = ?auto_712497 ?auto_712499 ) ) ( not ( = ?auto_712497 ?auto_712500 ) ) ( not ( = ?auto_712497 ?auto_712501 ) ) ( not ( = ?auto_712497 ?auto_712502 ) ) ( not ( = ?auto_712497 ?auto_712503 ) ) ( not ( = ?auto_712497 ?auto_712504 ) ) ( not ( = ?auto_712498 ?auto_712499 ) ) ( not ( = ?auto_712498 ?auto_712500 ) ) ( not ( = ?auto_712498 ?auto_712501 ) ) ( not ( = ?auto_712498 ?auto_712502 ) ) ( not ( = ?auto_712498 ?auto_712503 ) ) ( not ( = ?auto_712498 ?auto_712504 ) ) ( not ( = ?auto_712499 ?auto_712500 ) ) ( not ( = ?auto_712499 ?auto_712501 ) ) ( not ( = ?auto_712499 ?auto_712502 ) ) ( not ( = ?auto_712499 ?auto_712503 ) ) ( not ( = ?auto_712499 ?auto_712504 ) ) ( not ( = ?auto_712500 ?auto_712501 ) ) ( not ( = ?auto_712500 ?auto_712502 ) ) ( not ( = ?auto_712500 ?auto_712503 ) ) ( not ( = ?auto_712500 ?auto_712504 ) ) ( not ( = ?auto_712501 ?auto_712502 ) ) ( not ( = ?auto_712501 ?auto_712503 ) ) ( not ( = ?auto_712501 ?auto_712504 ) ) ( not ( = ?auto_712502 ?auto_712503 ) ) ( not ( = ?auto_712502 ?auto_712504 ) ) ( not ( = ?auto_712503 ?auto_712504 ) ) ( ON ?auto_712502 ?auto_712503 ) ( ON ?auto_712501 ?auto_712502 ) ( ON ?auto_712500 ?auto_712501 ) ( ON ?auto_712499 ?auto_712500 ) ( ON ?auto_712498 ?auto_712499 ) ( ON ?auto_712497 ?auto_712498 ) ( ON ?auto_712496 ?auto_712497 ) ( ON ?auto_712495 ?auto_712496 ) ( ON ?auto_712494 ?auto_712495 ) ( CLEAR ?auto_712492 ) ( ON ?auto_712493 ?auto_712494 ) ( CLEAR ?auto_712493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_712492 ?auto_712493 )
      ( MAKE-12PILE ?auto_712492 ?auto_712493 ?auto_712494 ?auto_712495 ?auto_712496 ?auto_712497 ?auto_712498 ?auto_712499 ?auto_712500 ?auto_712501 ?auto_712502 ?auto_712503 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_712542 - BLOCK
      ?auto_712543 - BLOCK
      ?auto_712544 - BLOCK
      ?auto_712545 - BLOCK
      ?auto_712546 - BLOCK
      ?auto_712547 - BLOCK
      ?auto_712548 - BLOCK
      ?auto_712549 - BLOCK
      ?auto_712550 - BLOCK
      ?auto_712551 - BLOCK
      ?auto_712552 - BLOCK
      ?auto_712553 - BLOCK
    )
    :vars
    (
      ?auto_712554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712553 ?auto_712554 ) ( not ( = ?auto_712542 ?auto_712543 ) ) ( not ( = ?auto_712542 ?auto_712544 ) ) ( not ( = ?auto_712542 ?auto_712545 ) ) ( not ( = ?auto_712542 ?auto_712546 ) ) ( not ( = ?auto_712542 ?auto_712547 ) ) ( not ( = ?auto_712542 ?auto_712548 ) ) ( not ( = ?auto_712542 ?auto_712549 ) ) ( not ( = ?auto_712542 ?auto_712550 ) ) ( not ( = ?auto_712542 ?auto_712551 ) ) ( not ( = ?auto_712542 ?auto_712552 ) ) ( not ( = ?auto_712542 ?auto_712553 ) ) ( not ( = ?auto_712542 ?auto_712554 ) ) ( not ( = ?auto_712543 ?auto_712544 ) ) ( not ( = ?auto_712543 ?auto_712545 ) ) ( not ( = ?auto_712543 ?auto_712546 ) ) ( not ( = ?auto_712543 ?auto_712547 ) ) ( not ( = ?auto_712543 ?auto_712548 ) ) ( not ( = ?auto_712543 ?auto_712549 ) ) ( not ( = ?auto_712543 ?auto_712550 ) ) ( not ( = ?auto_712543 ?auto_712551 ) ) ( not ( = ?auto_712543 ?auto_712552 ) ) ( not ( = ?auto_712543 ?auto_712553 ) ) ( not ( = ?auto_712543 ?auto_712554 ) ) ( not ( = ?auto_712544 ?auto_712545 ) ) ( not ( = ?auto_712544 ?auto_712546 ) ) ( not ( = ?auto_712544 ?auto_712547 ) ) ( not ( = ?auto_712544 ?auto_712548 ) ) ( not ( = ?auto_712544 ?auto_712549 ) ) ( not ( = ?auto_712544 ?auto_712550 ) ) ( not ( = ?auto_712544 ?auto_712551 ) ) ( not ( = ?auto_712544 ?auto_712552 ) ) ( not ( = ?auto_712544 ?auto_712553 ) ) ( not ( = ?auto_712544 ?auto_712554 ) ) ( not ( = ?auto_712545 ?auto_712546 ) ) ( not ( = ?auto_712545 ?auto_712547 ) ) ( not ( = ?auto_712545 ?auto_712548 ) ) ( not ( = ?auto_712545 ?auto_712549 ) ) ( not ( = ?auto_712545 ?auto_712550 ) ) ( not ( = ?auto_712545 ?auto_712551 ) ) ( not ( = ?auto_712545 ?auto_712552 ) ) ( not ( = ?auto_712545 ?auto_712553 ) ) ( not ( = ?auto_712545 ?auto_712554 ) ) ( not ( = ?auto_712546 ?auto_712547 ) ) ( not ( = ?auto_712546 ?auto_712548 ) ) ( not ( = ?auto_712546 ?auto_712549 ) ) ( not ( = ?auto_712546 ?auto_712550 ) ) ( not ( = ?auto_712546 ?auto_712551 ) ) ( not ( = ?auto_712546 ?auto_712552 ) ) ( not ( = ?auto_712546 ?auto_712553 ) ) ( not ( = ?auto_712546 ?auto_712554 ) ) ( not ( = ?auto_712547 ?auto_712548 ) ) ( not ( = ?auto_712547 ?auto_712549 ) ) ( not ( = ?auto_712547 ?auto_712550 ) ) ( not ( = ?auto_712547 ?auto_712551 ) ) ( not ( = ?auto_712547 ?auto_712552 ) ) ( not ( = ?auto_712547 ?auto_712553 ) ) ( not ( = ?auto_712547 ?auto_712554 ) ) ( not ( = ?auto_712548 ?auto_712549 ) ) ( not ( = ?auto_712548 ?auto_712550 ) ) ( not ( = ?auto_712548 ?auto_712551 ) ) ( not ( = ?auto_712548 ?auto_712552 ) ) ( not ( = ?auto_712548 ?auto_712553 ) ) ( not ( = ?auto_712548 ?auto_712554 ) ) ( not ( = ?auto_712549 ?auto_712550 ) ) ( not ( = ?auto_712549 ?auto_712551 ) ) ( not ( = ?auto_712549 ?auto_712552 ) ) ( not ( = ?auto_712549 ?auto_712553 ) ) ( not ( = ?auto_712549 ?auto_712554 ) ) ( not ( = ?auto_712550 ?auto_712551 ) ) ( not ( = ?auto_712550 ?auto_712552 ) ) ( not ( = ?auto_712550 ?auto_712553 ) ) ( not ( = ?auto_712550 ?auto_712554 ) ) ( not ( = ?auto_712551 ?auto_712552 ) ) ( not ( = ?auto_712551 ?auto_712553 ) ) ( not ( = ?auto_712551 ?auto_712554 ) ) ( not ( = ?auto_712552 ?auto_712553 ) ) ( not ( = ?auto_712552 ?auto_712554 ) ) ( not ( = ?auto_712553 ?auto_712554 ) ) ( ON ?auto_712552 ?auto_712553 ) ( ON ?auto_712551 ?auto_712552 ) ( ON ?auto_712550 ?auto_712551 ) ( ON ?auto_712549 ?auto_712550 ) ( ON ?auto_712548 ?auto_712549 ) ( ON ?auto_712547 ?auto_712548 ) ( ON ?auto_712546 ?auto_712547 ) ( ON ?auto_712545 ?auto_712546 ) ( ON ?auto_712544 ?auto_712545 ) ( ON ?auto_712543 ?auto_712544 ) ( ON ?auto_712542 ?auto_712543 ) ( CLEAR ?auto_712542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_712542 )
      ( MAKE-12PILE ?auto_712542 ?auto_712543 ?auto_712544 ?auto_712545 ?auto_712546 ?auto_712547 ?auto_712548 ?auto_712549 ?auto_712550 ?auto_712551 ?auto_712552 ?auto_712553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712593 - BLOCK
      ?auto_712594 - BLOCK
      ?auto_712595 - BLOCK
      ?auto_712596 - BLOCK
      ?auto_712597 - BLOCK
      ?auto_712598 - BLOCK
      ?auto_712599 - BLOCK
      ?auto_712600 - BLOCK
      ?auto_712601 - BLOCK
      ?auto_712602 - BLOCK
      ?auto_712603 - BLOCK
      ?auto_712604 - BLOCK
      ?auto_712605 - BLOCK
    )
    :vars
    (
      ?auto_712606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_712604 ) ( ON ?auto_712605 ?auto_712606 ) ( CLEAR ?auto_712605 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_712593 ) ( ON ?auto_712594 ?auto_712593 ) ( ON ?auto_712595 ?auto_712594 ) ( ON ?auto_712596 ?auto_712595 ) ( ON ?auto_712597 ?auto_712596 ) ( ON ?auto_712598 ?auto_712597 ) ( ON ?auto_712599 ?auto_712598 ) ( ON ?auto_712600 ?auto_712599 ) ( ON ?auto_712601 ?auto_712600 ) ( ON ?auto_712602 ?auto_712601 ) ( ON ?auto_712603 ?auto_712602 ) ( ON ?auto_712604 ?auto_712603 ) ( not ( = ?auto_712593 ?auto_712594 ) ) ( not ( = ?auto_712593 ?auto_712595 ) ) ( not ( = ?auto_712593 ?auto_712596 ) ) ( not ( = ?auto_712593 ?auto_712597 ) ) ( not ( = ?auto_712593 ?auto_712598 ) ) ( not ( = ?auto_712593 ?auto_712599 ) ) ( not ( = ?auto_712593 ?auto_712600 ) ) ( not ( = ?auto_712593 ?auto_712601 ) ) ( not ( = ?auto_712593 ?auto_712602 ) ) ( not ( = ?auto_712593 ?auto_712603 ) ) ( not ( = ?auto_712593 ?auto_712604 ) ) ( not ( = ?auto_712593 ?auto_712605 ) ) ( not ( = ?auto_712593 ?auto_712606 ) ) ( not ( = ?auto_712594 ?auto_712595 ) ) ( not ( = ?auto_712594 ?auto_712596 ) ) ( not ( = ?auto_712594 ?auto_712597 ) ) ( not ( = ?auto_712594 ?auto_712598 ) ) ( not ( = ?auto_712594 ?auto_712599 ) ) ( not ( = ?auto_712594 ?auto_712600 ) ) ( not ( = ?auto_712594 ?auto_712601 ) ) ( not ( = ?auto_712594 ?auto_712602 ) ) ( not ( = ?auto_712594 ?auto_712603 ) ) ( not ( = ?auto_712594 ?auto_712604 ) ) ( not ( = ?auto_712594 ?auto_712605 ) ) ( not ( = ?auto_712594 ?auto_712606 ) ) ( not ( = ?auto_712595 ?auto_712596 ) ) ( not ( = ?auto_712595 ?auto_712597 ) ) ( not ( = ?auto_712595 ?auto_712598 ) ) ( not ( = ?auto_712595 ?auto_712599 ) ) ( not ( = ?auto_712595 ?auto_712600 ) ) ( not ( = ?auto_712595 ?auto_712601 ) ) ( not ( = ?auto_712595 ?auto_712602 ) ) ( not ( = ?auto_712595 ?auto_712603 ) ) ( not ( = ?auto_712595 ?auto_712604 ) ) ( not ( = ?auto_712595 ?auto_712605 ) ) ( not ( = ?auto_712595 ?auto_712606 ) ) ( not ( = ?auto_712596 ?auto_712597 ) ) ( not ( = ?auto_712596 ?auto_712598 ) ) ( not ( = ?auto_712596 ?auto_712599 ) ) ( not ( = ?auto_712596 ?auto_712600 ) ) ( not ( = ?auto_712596 ?auto_712601 ) ) ( not ( = ?auto_712596 ?auto_712602 ) ) ( not ( = ?auto_712596 ?auto_712603 ) ) ( not ( = ?auto_712596 ?auto_712604 ) ) ( not ( = ?auto_712596 ?auto_712605 ) ) ( not ( = ?auto_712596 ?auto_712606 ) ) ( not ( = ?auto_712597 ?auto_712598 ) ) ( not ( = ?auto_712597 ?auto_712599 ) ) ( not ( = ?auto_712597 ?auto_712600 ) ) ( not ( = ?auto_712597 ?auto_712601 ) ) ( not ( = ?auto_712597 ?auto_712602 ) ) ( not ( = ?auto_712597 ?auto_712603 ) ) ( not ( = ?auto_712597 ?auto_712604 ) ) ( not ( = ?auto_712597 ?auto_712605 ) ) ( not ( = ?auto_712597 ?auto_712606 ) ) ( not ( = ?auto_712598 ?auto_712599 ) ) ( not ( = ?auto_712598 ?auto_712600 ) ) ( not ( = ?auto_712598 ?auto_712601 ) ) ( not ( = ?auto_712598 ?auto_712602 ) ) ( not ( = ?auto_712598 ?auto_712603 ) ) ( not ( = ?auto_712598 ?auto_712604 ) ) ( not ( = ?auto_712598 ?auto_712605 ) ) ( not ( = ?auto_712598 ?auto_712606 ) ) ( not ( = ?auto_712599 ?auto_712600 ) ) ( not ( = ?auto_712599 ?auto_712601 ) ) ( not ( = ?auto_712599 ?auto_712602 ) ) ( not ( = ?auto_712599 ?auto_712603 ) ) ( not ( = ?auto_712599 ?auto_712604 ) ) ( not ( = ?auto_712599 ?auto_712605 ) ) ( not ( = ?auto_712599 ?auto_712606 ) ) ( not ( = ?auto_712600 ?auto_712601 ) ) ( not ( = ?auto_712600 ?auto_712602 ) ) ( not ( = ?auto_712600 ?auto_712603 ) ) ( not ( = ?auto_712600 ?auto_712604 ) ) ( not ( = ?auto_712600 ?auto_712605 ) ) ( not ( = ?auto_712600 ?auto_712606 ) ) ( not ( = ?auto_712601 ?auto_712602 ) ) ( not ( = ?auto_712601 ?auto_712603 ) ) ( not ( = ?auto_712601 ?auto_712604 ) ) ( not ( = ?auto_712601 ?auto_712605 ) ) ( not ( = ?auto_712601 ?auto_712606 ) ) ( not ( = ?auto_712602 ?auto_712603 ) ) ( not ( = ?auto_712602 ?auto_712604 ) ) ( not ( = ?auto_712602 ?auto_712605 ) ) ( not ( = ?auto_712602 ?auto_712606 ) ) ( not ( = ?auto_712603 ?auto_712604 ) ) ( not ( = ?auto_712603 ?auto_712605 ) ) ( not ( = ?auto_712603 ?auto_712606 ) ) ( not ( = ?auto_712604 ?auto_712605 ) ) ( not ( = ?auto_712604 ?auto_712606 ) ) ( not ( = ?auto_712605 ?auto_712606 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_712605 ?auto_712606 )
      ( !STACK ?auto_712605 ?auto_712604 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712647 - BLOCK
      ?auto_712648 - BLOCK
      ?auto_712649 - BLOCK
      ?auto_712650 - BLOCK
      ?auto_712651 - BLOCK
      ?auto_712652 - BLOCK
      ?auto_712653 - BLOCK
      ?auto_712654 - BLOCK
      ?auto_712655 - BLOCK
      ?auto_712656 - BLOCK
      ?auto_712657 - BLOCK
      ?auto_712658 - BLOCK
      ?auto_712659 - BLOCK
    )
    :vars
    (
      ?auto_712660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712659 ?auto_712660 ) ( ON-TABLE ?auto_712647 ) ( ON ?auto_712648 ?auto_712647 ) ( ON ?auto_712649 ?auto_712648 ) ( ON ?auto_712650 ?auto_712649 ) ( ON ?auto_712651 ?auto_712650 ) ( ON ?auto_712652 ?auto_712651 ) ( ON ?auto_712653 ?auto_712652 ) ( ON ?auto_712654 ?auto_712653 ) ( ON ?auto_712655 ?auto_712654 ) ( ON ?auto_712656 ?auto_712655 ) ( ON ?auto_712657 ?auto_712656 ) ( not ( = ?auto_712647 ?auto_712648 ) ) ( not ( = ?auto_712647 ?auto_712649 ) ) ( not ( = ?auto_712647 ?auto_712650 ) ) ( not ( = ?auto_712647 ?auto_712651 ) ) ( not ( = ?auto_712647 ?auto_712652 ) ) ( not ( = ?auto_712647 ?auto_712653 ) ) ( not ( = ?auto_712647 ?auto_712654 ) ) ( not ( = ?auto_712647 ?auto_712655 ) ) ( not ( = ?auto_712647 ?auto_712656 ) ) ( not ( = ?auto_712647 ?auto_712657 ) ) ( not ( = ?auto_712647 ?auto_712658 ) ) ( not ( = ?auto_712647 ?auto_712659 ) ) ( not ( = ?auto_712647 ?auto_712660 ) ) ( not ( = ?auto_712648 ?auto_712649 ) ) ( not ( = ?auto_712648 ?auto_712650 ) ) ( not ( = ?auto_712648 ?auto_712651 ) ) ( not ( = ?auto_712648 ?auto_712652 ) ) ( not ( = ?auto_712648 ?auto_712653 ) ) ( not ( = ?auto_712648 ?auto_712654 ) ) ( not ( = ?auto_712648 ?auto_712655 ) ) ( not ( = ?auto_712648 ?auto_712656 ) ) ( not ( = ?auto_712648 ?auto_712657 ) ) ( not ( = ?auto_712648 ?auto_712658 ) ) ( not ( = ?auto_712648 ?auto_712659 ) ) ( not ( = ?auto_712648 ?auto_712660 ) ) ( not ( = ?auto_712649 ?auto_712650 ) ) ( not ( = ?auto_712649 ?auto_712651 ) ) ( not ( = ?auto_712649 ?auto_712652 ) ) ( not ( = ?auto_712649 ?auto_712653 ) ) ( not ( = ?auto_712649 ?auto_712654 ) ) ( not ( = ?auto_712649 ?auto_712655 ) ) ( not ( = ?auto_712649 ?auto_712656 ) ) ( not ( = ?auto_712649 ?auto_712657 ) ) ( not ( = ?auto_712649 ?auto_712658 ) ) ( not ( = ?auto_712649 ?auto_712659 ) ) ( not ( = ?auto_712649 ?auto_712660 ) ) ( not ( = ?auto_712650 ?auto_712651 ) ) ( not ( = ?auto_712650 ?auto_712652 ) ) ( not ( = ?auto_712650 ?auto_712653 ) ) ( not ( = ?auto_712650 ?auto_712654 ) ) ( not ( = ?auto_712650 ?auto_712655 ) ) ( not ( = ?auto_712650 ?auto_712656 ) ) ( not ( = ?auto_712650 ?auto_712657 ) ) ( not ( = ?auto_712650 ?auto_712658 ) ) ( not ( = ?auto_712650 ?auto_712659 ) ) ( not ( = ?auto_712650 ?auto_712660 ) ) ( not ( = ?auto_712651 ?auto_712652 ) ) ( not ( = ?auto_712651 ?auto_712653 ) ) ( not ( = ?auto_712651 ?auto_712654 ) ) ( not ( = ?auto_712651 ?auto_712655 ) ) ( not ( = ?auto_712651 ?auto_712656 ) ) ( not ( = ?auto_712651 ?auto_712657 ) ) ( not ( = ?auto_712651 ?auto_712658 ) ) ( not ( = ?auto_712651 ?auto_712659 ) ) ( not ( = ?auto_712651 ?auto_712660 ) ) ( not ( = ?auto_712652 ?auto_712653 ) ) ( not ( = ?auto_712652 ?auto_712654 ) ) ( not ( = ?auto_712652 ?auto_712655 ) ) ( not ( = ?auto_712652 ?auto_712656 ) ) ( not ( = ?auto_712652 ?auto_712657 ) ) ( not ( = ?auto_712652 ?auto_712658 ) ) ( not ( = ?auto_712652 ?auto_712659 ) ) ( not ( = ?auto_712652 ?auto_712660 ) ) ( not ( = ?auto_712653 ?auto_712654 ) ) ( not ( = ?auto_712653 ?auto_712655 ) ) ( not ( = ?auto_712653 ?auto_712656 ) ) ( not ( = ?auto_712653 ?auto_712657 ) ) ( not ( = ?auto_712653 ?auto_712658 ) ) ( not ( = ?auto_712653 ?auto_712659 ) ) ( not ( = ?auto_712653 ?auto_712660 ) ) ( not ( = ?auto_712654 ?auto_712655 ) ) ( not ( = ?auto_712654 ?auto_712656 ) ) ( not ( = ?auto_712654 ?auto_712657 ) ) ( not ( = ?auto_712654 ?auto_712658 ) ) ( not ( = ?auto_712654 ?auto_712659 ) ) ( not ( = ?auto_712654 ?auto_712660 ) ) ( not ( = ?auto_712655 ?auto_712656 ) ) ( not ( = ?auto_712655 ?auto_712657 ) ) ( not ( = ?auto_712655 ?auto_712658 ) ) ( not ( = ?auto_712655 ?auto_712659 ) ) ( not ( = ?auto_712655 ?auto_712660 ) ) ( not ( = ?auto_712656 ?auto_712657 ) ) ( not ( = ?auto_712656 ?auto_712658 ) ) ( not ( = ?auto_712656 ?auto_712659 ) ) ( not ( = ?auto_712656 ?auto_712660 ) ) ( not ( = ?auto_712657 ?auto_712658 ) ) ( not ( = ?auto_712657 ?auto_712659 ) ) ( not ( = ?auto_712657 ?auto_712660 ) ) ( not ( = ?auto_712658 ?auto_712659 ) ) ( not ( = ?auto_712658 ?auto_712660 ) ) ( not ( = ?auto_712659 ?auto_712660 ) ) ( CLEAR ?auto_712657 ) ( ON ?auto_712658 ?auto_712659 ) ( CLEAR ?auto_712658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_712647 ?auto_712648 ?auto_712649 ?auto_712650 ?auto_712651 ?auto_712652 ?auto_712653 ?auto_712654 ?auto_712655 ?auto_712656 ?auto_712657 ?auto_712658 )
      ( MAKE-13PILE ?auto_712647 ?auto_712648 ?auto_712649 ?auto_712650 ?auto_712651 ?auto_712652 ?auto_712653 ?auto_712654 ?auto_712655 ?auto_712656 ?auto_712657 ?auto_712658 ?auto_712659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712701 - BLOCK
      ?auto_712702 - BLOCK
      ?auto_712703 - BLOCK
      ?auto_712704 - BLOCK
      ?auto_712705 - BLOCK
      ?auto_712706 - BLOCK
      ?auto_712707 - BLOCK
      ?auto_712708 - BLOCK
      ?auto_712709 - BLOCK
      ?auto_712710 - BLOCK
      ?auto_712711 - BLOCK
      ?auto_712712 - BLOCK
      ?auto_712713 - BLOCK
    )
    :vars
    (
      ?auto_712714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712713 ?auto_712714 ) ( ON-TABLE ?auto_712701 ) ( ON ?auto_712702 ?auto_712701 ) ( ON ?auto_712703 ?auto_712702 ) ( ON ?auto_712704 ?auto_712703 ) ( ON ?auto_712705 ?auto_712704 ) ( ON ?auto_712706 ?auto_712705 ) ( ON ?auto_712707 ?auto_712706 ) ( ON ?auto_712708 ?auto_712707 ) ( ON ?auto_712709 ?auto_712708 ) ( ON ?auto_712710 ?auto_712709 ) ( not ( = ?auto_712701 ?auto_712702 ) ) ( not ( = ?auto_712701 ?auto_712703 ) ) ( not ( = ?auto_712701 ?auto_712704 ) ) ( not ( = ?auto_712701 ?auto_712705 ) ) ( not ( = ?auto_712701 ?auto_712706 ) ) ( not ( = ?auto_712701 ?auto_712707 ) ) ( not ( = ?auto_712701 ?auto_712708 ) ) ( not ( = ?auto_712701 ?auto_712709 ) ) ( not ( = ?auto_712701 ?auto_712710 ) ) ( not ( = ?auto_712701 ?auto_712711 ) ) ( not ( = ?auto_712701 ?auto_712712 ) ) ( not ( = ?auto_712701 ?auto_712713 ) ) ( not ( = ?auto_712701 ?auto_712714 ) ) ( not ( = ?auto_712702 ?auto_712703 ) ) ( not ( = ?auto_712702 ?auto_712704 ) ) ( not ( = ?auto_712702 ?auto_712705 ) ) ( not ( = ?auto_712702 ?auto_712706 ) ) ( not ( = ?auto_712702 ?auto_712707 ) ) ( not ( = ?auto_712702 ?auto_712708 ) ) ( not ( = ?auto_712702 ?auto_712709 ) ) ( not ( = ?auto_712702 ?auto_712710 ) ) ( not ( = ?auto_712702 ?auto_712711 ) ) ( not ( = ?auto_712702 ?auto_712712 ) ) ( not ( = ?auto_712702 ?auto_712713 ) ) ( not ( = ?auto_712702 ?auto_712714 ) ) ( not ( = ?auto_712703 ?auto_712704 ) ) ( not ( = ?auto_712703 ?auto_712705 ) ) ( not ( = ?auto_712703 ?auto_712706 ) ) ( not ( = ?auto_712703 ?auto_712707 ) ) ( not ( = ?auto_712703 ?auto_712708 ) ) ( not ( = ?auto_712703 ?auto_712709 ) ) ( not ( = ?auto_712703 ?auto_712710 ) ) ( not ( = ?auto_712703 ?auto_712711 ) ) ( not ( = ?auto_712703 ?auto_712712 ) ) ( not ( = ?auto_712703 ?auto_712713 ) ) ( not ( = ?auto_712703 ?auto_712714 ) ) ( not ( = ?auto_712704 ?auto_712705 ) ) ( not ( = ?auto_712704 ?auto_712706 ) ) ( not ( = ?auto_712704 ?auto_712707 ) ) ( not ( = ?auto_712704 ?auto_712708 ) ) ( not ( = ?auto_712704 ?auto_712709 ) ) ( not ( = ?auto_712704 ?auto_712710 ) ) ( not ( = ?auto_712704 ?auto_712711 ) ) ( not ( = ?auto_712704 ?auto_712712 ) ) ( not ( = ?auto_712704 ?auto_712713 ) ) ( not ( = ?auto_712704 ?auto_712714 ) ) ( not ( = ?auto_712705 ?auto_712706 ) ) ( not ( = ?auto_712705 ?auto_712707 ) ) ( not ( = ?auto_712705 ?auto_712708 ) ) ( not ( = ?auto_712705 ?auto_712709 ) ) ( not ( = ?auto_712705 ?auto_712710 ) ) ( not ( = ?auto_712705 ?auto_712711 ) ) ( not ( = ?auto_712705 ?auto_712712 ) ) ( not ( = ?auto_712705 ?auto_712713 ) ) ( not ( = ?auto_712705 ?auto_712714 ) ) ( not ( = ?auto_712706 ?auto_712707 ) ) ( not ( = ?auto_712706 ?auto_712708 ) ) ( not ( = ?auto_712706 ?auto_712709 ) ) ( not ( = ?auto_712706 ?auto_712710 ) ) ( not ( = ?auto_712706 ?auto_712711 ) ) ( not ( = ?auto_712706 ?auto_712712 ) ) ( not ( = ?auto_712706 ?auto_712713 ) ) ( not ( = ?auto_712706 ?auto_712714 ) ) ( not ( = ?auto_712707 ?auto_712708 ) ) ( not ( = ?auto_712707 ?auto_712709 ) ) ( not ( = ?auto_712707 ?auto_712710 ) ) ( not ( = ?auto_712707 ?auto_712711 ) ) ( not ( = ?auto_712707 ?auto_712712 ) ) ( not ( = ?auto_712707 ?auto_712713 ) ) ( not ( = ?auto_712707 ?auto_712714 ) ) ( not ( = ?auto_712708 ?auto_712709 ) ) ( not ( = ?auto_712708 ?auto_712710 ) ) ( not ( = ?auto_712708 ?auto_712711 ) ) ( not ( = ?auto_712708 ?auto_712712 ) ) ( not ( = ?auto_712708 ?auto_712713 ) ) ( not ( = ?auto_712708 ?auto_712714 ) ) ( not ( = ?auto_712709 ?auto_712710 ) ) ( not ( = ?auto_712709 ?auto_712711 ) ) ( not ( = ?auto_712709 ?auto_712712 ) ) ( not ( = ?auto_712709 ?auto_712713 ) ) ( not ( = ?auto_712709 ?auto_712714 ) ) ( not ( = ?auto_712710 ?auto_712711 ) ) ( not ( = ?auto_712710 ?auto_712712 ) ) ( not ( = ?auto_712710 ?auto_712713 ) ) ( not ( = ?auto_712710 ?auto_712714 ) ) ( not ( = ?auto_712711 ?auto_712712 ) ) ( not ( = ?auto_712711 ?auto_712713 ) ) ( not ( = ?auto_712711 ?auto_712714 ) ) ( not ( = ?auto_712712 ?auto_712713 ) ) ( not ( = ?auto_712712 ?auto_712714 ) ) ( not ( = ?auto_712713 ?auto_712714 ) ) ( ON ?auto_712712 ?auto_712713 ) ( CLEAR ?auto_712710 ) ( ON ?auto_712711 ?auto_712712 ) ( CLEAR ?auto_712711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_712701 ?auto_712702 ?auto_712703 ?auto_712704 ?auto_712705 ?auto_712706 ?auto_712707 ?auto_712708 ?auto_712709 ?auto_712710 ?auto_712711 )
      ( MAKE-13PILE ?auto_712701 ?auto_712702 ?auto_712703 ?auto_712704 ?auto_712705 ?auto_712706 ?auto_712707 ?auto_712708 ?auto_712709 ?auto_712710 ?auto_712711 ?auto_712712 ?auto_712713 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712755 - BLOCK
      ?auto_712756 - BLOCK
      ?auto_712757 - BLOCK
      ?auto_712758 - BLOCK
      ?auto_712759 - BLOCK
      ?auto_712760 - BLOCK
      ?auto_712761 - BLOCK
      ?auto_712762 - BLOCK
      ?auto_712763 - BLOCK
      ?auto_712764 - BLOCK
      ?auto_712765 - BLOCK
      ?auto_712766 - BLOCK
      ?auto_712767 - BLOCK
    )
    :vars
    (
      ?auto_712768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712767 ?auto_712768 ) ( ON-TABLE ?auto_712755 ) ( ON ?auto_712756 ?auto_712755 ) ( ON ?auto_712757 ?auto_712756 ) ( ON ?auto_712758 ?auto_712757 ) ( ON ?auto_712759 ?auto_712758 ) ( ON ?auto_712760 ?auto_712759 ) ( ON ?auto_712761 ?auto_712760 ) ( ON ?auto_712762 ?auto_712761 ) ( ON ?auto_712763 ?auto_712762 ) ( not ( = ?auto_712755 ?auto_712756 ) ) ( not ( = ?auto_712755 ?auto_712757 ) ) ( not ( = ?auto_712755 ?auto_712758 ) ) ( not ( = ?auto_712755 ?auto_712759 ) ) ( not ( = ?auto_712755 ?auto_712760 ) ) ( not ( = ?auto_712755 ?auto_712761 ) ) ( not ( = ?auto_712755 ?auto_712762 ) ) ( not ( = ?auto_712755 ?auto_712763 ) ) ( not ( = ?auto_712755 ?auto_712764 ) ) ( not ( = ?auto_712755 ?auto_712765 ) ) ( not ( = ?auto_712755 ?auto_712766 ) ) ( not ( = ?auto_712755 ?auto_712767 ) ) ( not ( = ?auto_712755 ?auto_712768 ) ) ( not ( = ?auto_712756 ?auto_712757 ) ) ( not ( = ?auto_712756 ?auto_712758 ) ) ( not ( = ?auto_712756 ?auto_712759 ) ) ( not ( = ?auto_712756 ?auto_712760 ) ) ( not ( = ?auto_712756 ?auto_712761 ) ) ( not ( = ?auto_712756 ?auto_712762 ) ) ( not ( = ?auto_712756 ?auto_712763 ) ) ( not ( = ?auto_712756 ?auto_712764 ) ) ( not ( = ?auto_712756 ?auto_712765 ) ) ( not ( = ?auto_712756 ?auto_712766 ) ) ( not ( = ?auto_712756 ?auto_712767 ) ) ( not ( = ?auto_712756 ?auto_712768 ) ) ( not ( = ?auto_712757 ?auto_712758 ) ) ( not ( = ?auto_712757 ?auto_712759 ) ) ( not ( = ?auto_712757 ?auto_712760 ) ) ( not ( = ?auto_712757 ?auto_712761 ) ) ( not ( = ?auto_712757 ?auto_712762 ) ) ( not ( = ?auto_712757 ?auto_712763 ) ) ( not ( = ?auto_712757 ?auto_712764 ) ) ( not ( = ?auto_712757 ?auto_712765 ) ) ( not ( = ?auto_712757 ?auto_712766 ) ) ( not ( = ?auto_712757 ?auto_712767 ) ) ( not ( = ?auto_712757 ?auto_712768 ) ) ( not ( = ?auto_712758 ?auto_712759 ) ) ( not ( = ?auto_712758 ?auto_712760 ) ) ( not ( = ?auto_712758 ?auto_712761 ) ) ( not ( = ?auto_712758 ?auto_712762 ) ) ( not ( = ?auto_712758 ?auto_712763 ) ) ( not ( = ?auto_712758 ?auto_712764 ) ) ( not ( = ?auto_712758 ?auto_712765 ) ) ( not ( = ?auto_712758 ?auto_712766 ) ) ( not ( = ?auto_712758 ?auto_712767 ) ) ( not ( = ?auto_712758 ?auto_712768 ) ) ( not ( = ?auto_712759 ?auto_712760 ) ) ( not ( = ?auto_712759 ?auto_712761 ) ) ( not ( = ?auto_712759 ?auto_712762 ) ) ( not ( = ?auto_712759 ?auto_712763 ) ) ( not ( = ?auto_712759 ?auto_712764 ) ) ( not ( = ?auto_712759 ?auto_712765 ) ) ( not ( = ?auto_712759 ?auto_712766 ) ) ( not ( = ?auto_712759 ?auto_712767 ) ) ( not ( = ?auto_712759 ?auto_712768 ) ) ( not ( = ?auto_712760 ?auto_712761 ) ) ( not ( = ?auto_712760 ?auto_712762 ) ) ( not ( = ?auto_712760 ?auto_712763 ) ) ( not ( = ?auto_712760 ?auto_712764 ) ) ( not ( = ?auto_712760 ?auto_712765 ) ) ( not ( = ?auto_712760 ?auto_712766 ) ) ( not ( = ?auto_712760 ?auto_712767 ) ) ( not ( = ?auto_712760 ?auto_712768 ) ) ( not ( = ?auto_712761 ?auto_712762 ) ) ( not ( = ?auto_712761 ?auto_712763 ) ) ( not ( = ?auto_712761 ?auto_712764 ) ) ( not ( = ?auto_712761 ?auto_712765 ) ) ( not ( = ?auto_712761 ?auto_712766 ) ) ( not ( = ?auto_712761 ?auto_712767 ) ) ( not ( = ?auto_712761 ?auto_712768 ) ) ( not ( = ?auto_712762 ?auto_712763 ) ) ( not ( = ?auto_712762 ?auto_712764 ) ) ( not ( = ?auto_712762 ?auto_712765 ) ) ( not ( = ?auto_712762 ?auto_712766 ) ) ( not ( = ?auto_712762 ?auto_712767 ) ) ( not ( = ?auto_712762 ?auto_712768 ) ) ( not ( = ?auto_712763 ?auto_712764 ) ) ( not ( = ?auto_712763 ?auto_712765 ) ) ( not ( = ?auto_712763 ?auto_712766 ) ) ( not ( = ?auto_712763 ?auto_712767 ) ) ( not ( = ?auto_712763 ?auto_712768 ) ) ( not ( = ?auto_712764 ?auto_712765 ) ) ( not ( = ?auto_712764 ?auto_712766 ) ) ( not ( = ?auto_712764 ?auto_712767 ) ) ( not ( = ?auto_712764 ?auto_712768 ) ) ( not ( = ?auto_712765 ?auto_712766 ) ) ( not ( = ?auto_712765 ?auto_712767 ) ) ( not ( = ?auto_712765 ?auto_712768 ) ) ( not ( = ?auto_712766 ?auto_712767 ) ) ( not ( = ?auto_712766 ?auto_712768 ) ) ( not ( = ?auto_712767 ?auto_712768 ) ) ( ON ?auto_712766 ?auto_712767 ) ( ON ?auto_712765 ?auto_712766 ) ( CLEAR ?auto_712763 ) ( ON ?auto_712764 ?auto_712765 ) ( CLEAR ?auto_712764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_712755 ?auto_712756 ?auto_712757 ?auto_712758 ?auto_712759 ?auto_712760 ?auto_712761 ?auto_712762 ?auto_712763 ?auto_712764 )
      ( MAKE-13PILE ?auto_712755 ?auto_712756 ?auto_712757 ?auto_712758 ?auto_712759 ?auto_712760 ?auto_712761 ?auto_712762 ?auto_712763 ?auto_712764 ?auto_712765 ?auto_712766 ?auto_712767 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712809 - BLOCK
      ?auto_712810 - BLOCK
      ?auto_712811 - BLOCK
      ?auto_712812 - BLOCK
      ?auto_712813 - BLOCK
      ?auto_712814 - BLOCK
      ?auto_712815 - BLOCK
      ?auto_712816 - BLOCK
      ?auto_712817 - BLOCK
      ?auto_712818 - BLOCK
      ?auto_712819 - BLOCK
      ?auto_712820 - BLOCK
      ?auto_712821 - BLOCK
    )
    :vars
    (
      ?auto_712822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712821 ?auto_712822 ) ( ON-TABLE ?auto_712809 ) ( ON ?auto_712810 ?auto_712809 ) ( ON ?auto_712811 ?auto_712810 ) ( ON ?auto_712812 ?auto_712811 ) ( ON ?auto_712813 ?auto_712812 ) ( ON ?auto_712814 ?auto_712813 ) ( ON ?auto_712815 ?auto_712814 ) ( ON ?auto_712816 ?auto_712815 ) ( not ( = ?auto_712809 ?auto_712810 ) ) ( not ( = ?auto_712809 ?auto_712811 ) ) ( not ( = ?auto_712809 ?auto_712812 ) ) ( not ( = ?auto_712809 ?auto_712813 ) ) ( not ( = ?auto_712809 ?auto_712814 ) ) ( not ( = ?auto_712809 ?auto_712815 ) ) ( not ( = ?auto_712809 ?auto_712816 ) ) ( not ( = ?auto_712809 ?auto_712817 ) ) ( not ( = ?auto_712809 ?auto_712818 ) ) ( not ( = ?auto_712809 ?auto_712819 ) ) ( not ( = ?auto_712809 ?auto_712820 ) ) ( not ( = ?auto_712809 ?auto_712821 ) ) ( not ( = ?auto_712809 ?auto_712822 ) ) ( not ( = ?auto_712810 ?auto_712811 ) ) ( not ( = ?auto_712810 ?auto_712812 ) ) ( not ( = ?auto_712810 ?auto_712813 ) ) ( not ( = ?auto_712810 ?auto_712814 ) ) ( not ( = ?auto_712810 ?auto_712815 ) ) ( not ( = ?auto_712810 ?auto_712816 ) ) ( not ( = ?auto_712810 ?auto_712817 ) ) ( not ( = ?auto_712810 ?auto_712818 ) ) ( not ( = ?auto_712810 ?auto_712819 ) ) ( not ( = ?auto_712810 ?auto_712820 ) ) ( not ( = ?auto_712810 ?auto_712821 ) ) ( not ( = ?auto_712810 ?auto_712822 ) ) ( not ( = ?auto_712811 ?auto_712812 ) ) ( not ( = ?auto_712811 ?auto_712813 ) ) ( not ( = ?auto_712811 ?auto_712814 ) ) ( not ( = ?auto_712811 ?auto_712815 ) ) ( not ( = ?auto_712811 ?auto_712816 ) ) ( not ( = ?auto_712811 ?auto_712817 ) ) ( not ( = ?auto_712811 ?auto_712818 ) ) ( not ( = ?auto_712811 ?auto_712819 ) ) ( not ( = ?auto_712811 ?auto_712820 ) ) ( not ( = ?auto_712811 ?auto_712821 ) ) ( not ( = ?auto_712811 ?auto_712822 ) ) ( not ( = ?auto_712812 ?auto_712813 ) ) ( not ( = ?auto_712812 ?auto_712814 ) ) ( not ( = ?auto_712812 ?auto_712815 ) ) ( not ( = ?auto_712812 ?auto_712816 ) ) ( not ( = ?auto_712812 ?auto_712817 ) ) ( not ( = ?auto_712812 ?auto_712818 ) ) ( not ( = ?auto_712812 ?auto_712819 ) ) ( not ( = ?auto_712812 ?auto_712820 ) ) ( not ( = ?auto_712812 ?auto_712821 ) ) ( not ( = ?auto_712812 ?auto_712822 ) ) ( not ( = ?auto_712813 ?auto_712814 ) ) ( not ( = ?auto_712813 ?auto_712815 ) ) ( not ( = ?auto_712813 ?auto_712816 ) ) ( not ( = ?auto_712813 ?auto_712817 ) ) ( not ( = ?auto_712813 ?auto_712818 ) ) ( not ( = ?auto_712813 ?auto_712819 ) ) ( not ( = ?auto_712813 ?auto_712820 ) ) ( not ( = ?auto_712813 ?auto_712821 ) ) ( not ( = ?auto_712813 ?auto_712822 ) ) ( not ( = ?auto_712814 ?auto_712815 ) ) ( not ( = ?auto_712814 ?auto_712816 ) ) ( not ( = ?auto_712814 ?auto_712817 ) ) ( not ( = ?auto_712814 ?auto_712818 ) ) ( not ( = ?auto_712814 ?auto_712819 ) ) ( not ( = ?auto_712814 ?auto_712820 ) ) ( not ( = ?auto_712814 ?auto_712821 ) ) ( not ( = ?auto_712814 ?auto_712822 ) ) ( not ( = ?auto_712815 ?auto_712816 ) ) ( not ( = ?auto_712815 ?auto_712817 ) ) ( not ( = ?auto_712815 ?auto_712818 ) ) ( not ( = ?auto_712815 ?auto_712819 ) ) ( not ( = ?auto_712815 ?auto_712820 ) ) ( not ( = ?auto_712815 ?auto_712821 ) ) ( not ( = ?auto_712815 ?auto_712822 ) ) ( not ( = ?auto_712816 ?auto_712817 ) ) ( not ( = ?auto_712816 ?auto_712818 ) ) ( not ( = ?auto_712816 ?auto_712819 ) ) ( not ( = ?auto_712816 ?auto_712820 ) ) ( not ( = ?auto_712816 ?auto_712821 ) ) ( not ( = ?auto_712816 ?auto_712822 ) ) ( not ( = ?auto_712817 ?auto_712818 ) ) ( not ( = ?auto_712817 ?auto_712819 ) ) ( not ( = ?auto_712817 ?auto_712820 ) ) ( not ( = ?auto_712817 ?auto_712821 ) ) ( not ( = ?auto_712817 ?auto_712822 ) ) ( not ( = ?auto_712818 ?auto_712819 ) ) ( not ( = ?auto_712818 ?auto_712820 ) ) ( not ( = ?auto_712818 ?auto_712821 ) ) ( not ( = ?auto_712818 ?auto_712822 ) ) ( not ( = ?auto_712819 ?auto_712820 ) ) ( not ( = ?auto_712819 ?auto_712821 ) ) ( not ( = ?auto_712819 ?auto_712822 ) ) ( not ( = ?auto_712820 ?auto_712821 ) ) ( not ( = ?auto_712820 ?auto_712822 ) ) ( not ( = ?auto_712821 ?auto_712822 ) ) ( ON ?auto_712820 ?auto_712821 ) ( ON ?auto_712819 ?auto_712820 ) ( ON ?auto_712818 ?auto_712819 ) ( CLEAR ?auto_712816 ) ( ON ?auto_712817 ?auto_712818 ) ( CLEAR ?auto_712817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_712809 ?auto_712810 ?auto_712811 ?auto_712812 ?auto_712813 ?auto_712814 ?auto_712815 ?auto_712816 ?auto_712817 )
      ( MAKE-13PILE ?auto_712809 ?auto_712810 ?auto_712811 ?auto_712812 ?auto_712813 ?auto_712814 ?auto_712815 ?auto_712816 ?auto_712817 ?auto_712818 ?auto_712819 ?auto_712820 ?auto_712821 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712863 - BLOCK
      ?auto_712864 - BLOCK
      ?auto_712865 - BLOCK
      ?auto_712866 - BLOCK
      ?auto_712867 - BLOCK
      ?auto_712868 - BLOCK
      ?auto_712869 - BLOCK
      ?auto_712870 - BLOCK
      ?auto_712871 - BLOCK
      ?auto_712872 - BLOCK
      ?auto_712873 - BLOCK
      ?auto_712874 - BLOCK
      ?auto_712875 - BLOCK
    )
    :vars
    (
      ?auto_712876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712875 ?auto_712876 ) ( ON-TABLE ?auto_712863 ) ( ON ?auto_712864 ?auto_712863 ) ( ON ?auto_712865 ?auto_712864 ) ( ON ?auto_712866 ?auto_712865 ) ( ON ?auto_712867 ?auto_712866 ) ( ON ?auto_712868 ?auto_712867 ) ( ON ?auto_712869 ?auto_712868 ) ( not ( = ?auto_712863 ?auto_712864 ) ) ( not ( = ?auto_712863 ?auto_712865 ) ) ( not ( = ?auto_712863 ?auto_712866 ) ) ( not ( = ?auto_712863 ?auto_712867 ) ) ( not ( = ?auto_712863 ?auto_712868 ) ) ( not ( = ?auto_712863 ?auto_712869 ) ) ( not ( = ?auto_712863 ?auto_712870 ) ) ( not ( = ?auto_712863 ?auto_712871 ) ) ( not ( = ?auto_712863 ?auto_712872 ) ) ( not ( = ?auto_712863 ?auto_712873 ) ) ( not ( = ?auto_712863 ?auto_712874 ) ) ( not ( = ?auto_712863 ?auto_712875 ) ) ( not ( = ?auto_712863 ?auto_712876 ) ) ( not ( = ?auto_712864 ?auto_712865 ) ) ( not ( = ?auto_712864 ?auto_712866 ) ) ( not ( = ?auto_712864 ?auto_712867 ) ) ( not ( = ?auto_712864 ?auto_712868 ) ) ( not ( = ?auto_712864 ?auto_712869 ) ) ( not ( = ?auto_712864 ?auto_712870 ) ) ( not ( = ?auto_712864 ?auto_712871 ) ) ( not ( = ?auto_712864 ?auto_712872 ) ) ( not ( = ?auto_712864 ?auto_712873 ) ) ( not ( = ?auto_712864 ?auto_712874 ) ) ( not ( = ?auto_712864 ?auto_712875 ) ) ( not ( = ?auto_712864 ?auto_712876 ) ) ( not ( = ?auto_712865 ?auto_712866 ) ) ( not ( = ?auto_712865 ?auto_712867 ) ) ( not ( = ?auto_712865 ?auto_712868 ) ) ( not ( = ?auto_712865 ?auto_712869 ) ) ( not ( = ?auto_712865 ?auto_712870 ) ) ( not ( = ?auto_712865 ?auto_712871 ) ) ( not ( = ?auto_712865 ?auto_712872 ) ) ( not ( = ?auto_712865 ?auto_712873 ) ) ( not ( = ?auto_712865 ?auto_712874 ) ) ( not ( = ?auto_712865 ?auto_712875 ) ) ( not ( = ?auto_712865 ?auto_712876 ) ) ( not ( = ?auto_712866 ?auto_712867 ) ) ( not ( = ?auto_712866 ?auto_712868 ) ) ( not ( = ?auto_712866 ?auto_712869 ) ) ( not ( = ?auto_712866 ?auto_712870 ) ) ( not ( = ?auto_712866 ?auto_712871 ) ) ( not ( = ?auto_712866 ?auto_712872 ) ) ( not ( = ?auto_712866 ?auto_712873 ) ) ( not ( = ?auto_712866 ?auto_712874 ) ) ( not ( = ?auto_712866 ?auto_712875 ) ) ( not ( = ?auto_712866 ?auto_712876 ) ) ( not ( = ?auto_712867 ?auto_712868 ) ) ( not ( = ?auto_712867 ?auto_712869 ) ) ( not ( = ?auto_712867 ?auto_712870 ) ) ( not ( = ?auto_712867 ?auto_712871 ) ) ( not ( = ?auto_712867 ?auto_712872 ) ) ( not ( = ?auto_712867 ?auto_712873 ) ) ( not ( = ?auto_712867 ?auto_712874 ) ) ( not ( = ?auto_712867 ?auto_712875 ) ) ( not ( = ?auto_712867 ?auto_712876 ) ) ( not ( = ?auto_712868 ?auto_712869 ) ) ( not ( = ?auto_712868 ?auto_712870 ) ) ( not ( = ?auto_712868 ?auto_712871 ) ) ( not ( = ?auto_712868 ?auto_712872 ) ) ( not ( = ?auto_712868 ?auto_712873 ) ) ( not ( = ?auto_712868 ?auto_712874 ) ) ( not ( = ?auto_712868 ?auto_712875 ) ) ( not ( = ?auto_712868 ?auto_712876 ) ) ( not ( = ?auto_712869 ?auto_712870 ) ) ( not ( = ?auto_712869 ?auto_712871 ) ) ( not ( = ?auto_712869 ?auto_712872 ) ) ( not ( = ?auto_712869 ?auto_712873 ) ) ( not ( = ?auto_712869 ?auto_712874 ) ) ( not ( = ?auto_712869 ?auto_712875 ) ) ( not ( = ?auto_712869 ?auto_712876 ) ) ( not ( = ?auto_712870 ?auto_712871 ) ) ( not ( = ?auto_712870 ?auto_712872 ) ) ( not ( = ?auto_712870 ?auto_712873 ) ) ( not ( = ?auto_712870 ?auto_712874 ) ) ( not ( = ?auto_712870 ?auto_712875 ) ) ( not ( = ?auto_712870 ?auto_712876 ) ) ( not ( = ?auto_712871 ?auto_712872 ) ) ( not ( = ?auto_712871 ?auto_712873 ) ) ( not ( = ?auto_712871 ?auto_712874 ) ) ( not ( = ?auto_712871 ?auto_712875 ) ) ( not ( = ?auto_712871 ?auto_712876 ) ) ( not ( = ?auto_712872 ?auto_712873 ) ) ( not ( = ?auto_712872 ?auto_712874 ) ) ( not ( = ?auto_712872 ?auto_712875 ) ) ( not ( = ?auto_712872 ?auto_712876 ) ) ( not ( = ?auto_712873 ?auto_712874 ) ) ( not ( = ?auto_712873 ?auto_712875 ) ) ( not ( = ?auto_712873 ?auto_712876 ) ) ( not ( = ?auto_712874 ?auto_712875 ) ) ( not ( = ?auto_712874 ?auto_712876 ) ) ( not ( = ?auto_712875 ?auto_712876 ) ) ( ON ?auto_712874 ?auto_712875 ) ( ON ?auto_712873 ?auto_712874 ) ( ON ?auto_712872 ?auto_712873 ) ( ON ?auto_712871 ?auto_712872 ) ( CLEAR ?auto_712869 ) ( ON ?auto_712870 ?auto_712871 ) ( CLEAR ?auto_712870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_712863 ?auto_712864 ?auto_712865 ?auto_712866 ?auto_712867 ?auto_712868 ?auto_712869 ?auto_712870 )
      ( MAKE-13PILE ?auto_712863 ?auto_712864 ?auto_712865 ?auto_712866 ?auto_712867 ?auto_712868 ?auto_712869 ?auto_712870 ?auto_712871 ?auto_712872 ?auto_712873 ?auto_712874 ?auto_712875 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712917 - BLOCK
      ?auto_712918 - BLOCK
      ?auto_712919 - BLOCK
      ?auto_712920 - BLOCK
      ?auto_712921 - BLOCK
      ?auto_712922 - BLOCK
      ?auto_712923 - BLOCK
      ?auto_712924 - BLOCK
      ?auto_712925 - BLOCK
      ?auto_712926 - BLOCK
      ?auto_712927 - BLOCK
      ?auto_712928 - BLOCK
      ?auto_712929 - BLOCK
    )
    :vars
    (
      ?auto_712930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712929 ?auto_712930 ) ( ON-TABLE ?auto_712917 ) ( ON ?auto_712918 ?auto_712917 ) ( ON ?auto_712919 ?auto_712918 ) ( ON ?auto_712920 ?auto_712919 ) ( ON ?auto_712921 ?auto_712920 ) ( ON ?auto_712922 ?auto_712921 ) ( not ( = ?auto_712917 ?auto_712918 ) ) ( not ( = ?auto_712917 ?auto_712919 ) ) ( not ( = ?auto_712917 ?auto_712920 ) ) ( not ( = ?auto_712917 ?auto_712921 ) ) ( not ( = ?auto_712917 ?auto_712922 ) ) ( not ( = ?auto_712917 ?auto_712923 ) ) ( not ( = ?auto_712917 ?auto_712924 ) ) ( not ( = ?auto_712917 ?auto_712925 ) ) ( not ( = ?auto_712917 ?auto_712926 ) ) ( not ( = ?auto_712917 ?auto_712927 ) ) ( not ( = ?auto_712917 ?auto_712928 ) ) ( not ( = ?auto_712917 ?auto_712929 ) ) ( not ( = ?auto_712917 ?auto_712930 ) ) ( not ( = ?auto_712918 ?auto_712919 ) ) ( not ( = ?auto_712918 ?auto_712920 ) ) ( not ( = ?auto_712918 ?auto_712921 ) ) ( not ( = ?auto_712918 ?auto_712922 ) ) ( not ( = ?auto_712918 ?auto_712923 ) ) ( not ( = ?auto_712918 ?auto_712924 ) ) ( not ( = ?auto_712918 ?auto_712925 ) ) ( not ( = ?auto_712918 ?auto_712926 ) ) ( not ( = ?auto_712918 ?auto_712927 ) ) ( not ( = ?auto_712918 ?auto_712928 ) ) ( not ( = ?auto_712918 ?auto_712929 ) ) ( not ( = ?auto_712918 ?auto_712930 ) ) ( not ( = ?auto_712919 ?auto_712920 ) ) ( not ( = ?auto_712919 ?auto_712921 ) ) ( not ( = ?auto_712919 ?auto_712922 ) ) ( not ( = ?auto_712919 ?auto_712923 ) ) ( not ( = ?auto_712919 ?auto_712924 ) ) ( not ( = ?auto_712919 ?auto_712925 ) ) ( not ( = ?auto_712919 ?auto_712926 ) ) ( not ( = ?auto_712919 ?auto_712927 ) ) ( not ( = ?auto_712919 ?auto_712928 ) ) ( not ( = ?auto_712919 ?auto_712929 ) ) ( not ( = ?auto_712919 ?auto_712930 ) ) ( not ( = ?auto_712920 ?auto_712921 ) ) ( not ( = ?auto_712920 ?auto_712922 ) ) ( not ( = ?auto_712920 ?auto_712923 ) ) ( not ( = ?auto_712920 ?auto_712924 ) ) ( not ( = ?auto_712920 ?auto_712925 ) ) ( not ( = ?auto_712920 ?auto_712926 ) ) ( not ( = ?auto_712920 ?auto_712927 ) ) ( not ( = ?auto_712920 ?auto_712928 ) ) ( not ( = ?auto_712920 ?auto_712929 ) ) ( not ( = ?auto_712920 ?auto_712930 ) ) ( not ( = ?auto_712921 ?auto_712922 ) ) ( not ( = ?auto_712921 ?auto_712923 ) ) ( not ( = ?auto_712921 ?auto_712924 ) ) ( not ( = ?auto_712921 ?auto_712925 ) ) ( not ( = ?auto_712921 ?auto_712926 ) ) ( not ( = ?auto_712921 ?auto_712927 ) ) ( not ( = ?auto_712921 ?auto_712928 ) ) ( not ( = ?auto_712921 ?auto_712929 ) ) ( not ( = ?auto_712921 ?auto_712930 ) ) ( not ( = ?auto_712922 ?auto_712923 ) ) ( not ( = ?auto_712922 ?auto_712924 ) ) ( not ( = ?auto_712922 ?auto_712925 ) ) ( not ( = ?auto_712922 ?auto_712926 ) ) ( not ( = ?auto_712922 ?auto_712927 ) ) ( not ( = ?auto_712922 ?auto_712928 ) ) ( not ( = ?auto_712922 ?auto_712929 ) ) ( not ( = ?auto_712922 ?auto_712930 ) ) ( not ( = ?auto_712923 ?auto_712924 ) ) ( not ( = ?auto_712923 ?auto_712925 ) ) ( not ( = ?auto_712923 ?auto_712926 ) ) ( not ( = ?auto_712923 ?auto_712927 ) ) ( not ( = ?auto_712923 ?auto_712928 ) ) ( not ( = ?auto_712923 ?auto_712929 ) ) ( not ( = ?auto_712923 ?auto_712930 ) ) ( not ( = ?auto_712924 ?auto_712925 ) ) ( not ( = ?auto_712924 ?auto_712926 ) ) ( not ( = ?auto_712924 ?auto_712927 ) ) ( not ( = ?auto_712924 ?auto_712928 ) ) ( not ( = ?auto_712924 ?auto_712929 ) ) ( not ( = ?auto_712924 ?auto_712930 ) ) ( not ( = ?auto_712925 ?auto_712926 ) ) ( not ( = ?auto_712925 ?auto_712927 ) ) ( not ( = ?auto_712925 ?auto_712928 ) ) ( not ( = ?auto_712925 ?auto_712929 ) ) ( not ( = ?auto_712925 ?auto_712930 ) ) ( not ( = ?auto_712926 ?auto_712927 ) ) ( not ( = ?auto_712926 ?auto_712928 ) ) ( not ( = ?auto_712926 ?auto_712929 ) ) ( not ( = ?auto_712926 ?auto_712930 ) ) ( not ( = ?auto_712927 ?auto_712928 ) ) ( not ( = ?auto_712927 ?auto_712929 ) ) ( not ( = ?auto_712927 ?auto_712930 ) ) ( not ( = ?auto_712928 ?auto_712929 ) ) ( not ( = ?auto_712928 ?auto_712930 ) ) ( not ( = ?auto_712929 ?auto_712930 ) ) ( ON ?auto_712928 ?auto_712929 ) ( ON ?auto_712927 ?auto_712928 ) ( ON ?auto_712926 ?auto_712927 ) ( ON ?auto_712925 ?auto_712926 ) ( ON ?auto_712924 ?auto_712925 ) ( CLEAR ?auto_712922 ) ( ON ?auto_712923 ?auto_712924 ) ( CLEAR ?auto_712923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_712917 ?auto_712918 ?auto_712919 ?auto_712920 ?auto_712921 ?auto_712922 ?auto_712923 )
      ( MAKE-13PILE ?auto_712917 ?auto_712918 ?auto_712919 ?auto_712920 ?auto_712921 ?auto_712922 ?auto_712923 ?auto_712924 ?auto_712925 ?auto_712926 ?auto_712927 ?auto_712928 ?auto_712929 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_712971 - BLOCK
      ?auto_712972 - BLOCK
      ?auto_712973 - BLOCK
      ?auto_712974 - BLOCK
      ?auto_712975 - BLOCK
      ?auto_712976 - BLOCK
      ?auto_712977 - BLOCK
      ?auto_712978 - BLOCK
      ?auto_712979 - BLOCK
      ?auto_712980 - BLOCK
      ?auto_712981 - BLOCK
      ?auto_712982 - BLOCK
      ?auto_712983 - BLOCK
    )
    :vars
    (
      ?auto_712984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_712983 ?auto_712984 ) ( ON-TABLE ?auto_712971 ) ( ON ?auto_712972 ?auto_712971 ) ( ON ?auto_712973 ?auto_712972 ) ( ON ?auto_712974 ?auto_712973 ) ( ON ?auto_712975 ?auto_712974 ) ( not ( = ?auto_712971 ?auto_712972 ) ) ( not ( = ?auto_712971 ?auto_712973 ) ) ( not ( = ?auto_712971 ?auto_712974 ) ) ( not ( = ?auto_712971 ?auto_712975 ) ) ( not ( = ?auto_712971 ?auto_712976 ) ) ( not ( = ?auto_712971 ?auto_712977 ) ) ( not ( = ?auto_712971 ?auto_712978 ) ) ( not ( = ?auto_712971 ?auto_712979 ) ) ( not ( = ?auto_712971 ?auto_712980 ) ) ( not ( = ?auto_712971 ?auto_712981 ) ) ( not ( = ?auto_712971 ?auto_712982 ) ) ( not ( = ?auto_712971 ?auto_712983 ) ) ( not ( = ?auto_712971 ?auto_712984 ) ) ( not ( = ?auto_712972 ?auto_712973 ) ) ( not ( = ?auto_712972 ?auto_712974 ) ) ( not ( = ?auto_712972 ?auto_712975 ) ) ( not ( = ?auto_712972 ?auto_712976 ) ) ( not ( = ?auto_712972 ?auto_712977 ) ) ( not ( = ?auto_712972 ?auto_712978 ) ) ( not ( = ?auto_712972 ?auto_712979 ) ) ( not ( = ?auto_712972 ?auto_712980 ) ) ( not ( = ?auto_712972 ?auto_712981 ) ) ( not ( = ?auto_712972 ?auto_712982 ) ) ( not ( = ?auto_712972 ?auto_712983 ) ) ( not ( = ?auto_712972 ?auto_712984 ) ) ( not ( = ?auto_712973 ?auto_712974 ) ) ( not ( = ?auto_712973 ?auto_712975 ) ) ( not ( = ?auto_712973 ?auto_712976 ) ) ( not ( = ?auto_712973 ?auto_712977 ) ) ( not ( = ?auto_712973 ?auto_712978 ) ) ( not ( = ?auto_712973 ?auto_712979 ) ) ( not ( = ?auto_712973 ?auto_712980 ) ) ( not ( = ?auto_712973 ?auto_712981 ) ) ( not ( = ?auto_712973 ?auto_712982 ) ) ( not ( = ?auto_712973 ?auto_712983 ) ) ( not ( = ?auto_712973 ?auto_712984 ) ) ( not ( = ?auto_712974 ?auto_712975 ) ) ( not ( = ?auto_712974 ?auto_712976 ) ) ( not ( = ?auto_712974 ?auto_712977 ) ) ( not ( = ?auto_712974 ?auto_712978 ) ) ( not ( = ?auto_712974 ?auto_712979 ) ) ( not ( = ?auto_712974 ?auto_712980 ) ) ( not ( = ?auto_712974 ?auto_712981 ) ) ( not ( = ?auto_712974 ?auto_712982 ) ) ( not ( = ?auto_712974 ?auto_712983 ) ) ( not ( = ?auto_712974 ?auto_712984 ) ) ( not ( = ?auto_712975 ?auto_712976 ) ) ( not ( = ?auto_712975 ?auto_712977 ) ) ( not ( = ?auto_712975 ?auto_712978 ) ) ( not ( = ?auto_712975 ?auto_712979 ) ) ( not ( = ?auto_712975 ?auto_712980 ) ) ( not ( = ?auto_712975 ?auto_712981 ) ) ( not ( = ?auto_712975 ?auto_712982 ) ) ( not ( = ?auto_712975 ?auto_712983 ) ) ( not ( = ?auto_712975 ?auto_712984 ) ) ( not ( = ?auto_712976 ?auto_712977 ) ) ( not ( = ?auto_712976 ?auto_712978 ) ) ( not ( = ?auto_712976 ?auto_712979 ) ) ( not ( = ?auto_712976 ?auto_712980 ) ) ( not ( = ?auto_712976 ?auto_712981 ) ) ( not ( = ?auto_712976 ?auto_712982 ) ) ( not ( = ?auto_712976 ?auto_712983 ) ) ( not ( = ?auto_712976 ?auto_712984 ) ) ( not ( = ?auto_712977 ?auto_712978 ) ) ( not ( = ?auto_712977 ?auto_712979 ) ) ( not ( = ?auto_712977 ?auto_712980 ) ) ( not ( = ?auto_712977 ?auto_712981 ) ) ( not ( = ?auto_712977 ?auto_712982 ) ) ( not ( = ?auto_712977 ?auto_712983 ) ) ( not ( = ?auto_712977 ?auto_712984 ) ) ( not ( = ?auto_712978 ?auto_712979 ) ) ( not ( = ?auto_712978 ?auto_712980 ) ) ( not ( = ?auto_712978 ?auto_712981 ) ) ( not ( = ?auto_712978 ?auto_712982 ) ) ( not ( = ?auto_712978 ?auto_712983 ) ) ( not ( = ?auto_712978 ?auto_712984 ) ) ( not ( = ?auto_712979 ?auto_712980 ) ) ( not ( = ?auto_712979 ?auto_712981 ) ) ( not ( = ?auto_712979 ?auto_712982 ) ) ( not ( = ?auto_712979 ?auto_712983 ) ) ( not ( = ?auto_712979 ?auto_712984 ) ) ( not ( = ?auto_712980 ?auto_712981 ) ) ( not ( = ?auto_712980 ?auto_712982 ) ) ( not ( = ?auto_712980 ?auto_712983 ) ) ( not ( = ?auto_712980 ?auto_712984 ) ) ( not ( = ?auto_712981 ?auto_712982 ) ) ( not ( = ?auto_712981 ?auto_712983 ) ) ( not ( = ?auto_712981 ?auto_712984 ) ) ( not ( = ?auto_712982 ?auto_712983 ) ) ( not ( = ?auto_712982 ?auto_712984 ) ) ( not ( = ?auto_712983 ?auto_712984 ) ) ( ON ?auto_712982 ?auto_712983 ) ( ON ?auto_712981 ?auto_712982 ) ( ON ?auto_712980 ?auto_712981 ) ( ON ?auto_712979 ?auto_712980 ) ( ON ?auto_712978 ?auto_712979 ) ( ON ?auto_712977 ?auto_712978 ) ( CLEAR ?auto_712975 ) ( ON ?auto_712976 ?auto_712977 ) ( CLEAR ?auto_712976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_712971 ?auto_712972 ?auto_712973 ?auto_712974 ?auto_712975 ?auto_712976 )
      ( MAKE-13PILE ?auto_712971 ?auto_712972 ?auto_712973 ?auto_712974 ?auto_712975 ?auto_712976 ?auto_712977 ?auto_712978 ?auto_712979 ?auto_712980 ?auto_712981 ?auto_712982 ?auto_712983 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_713025 - BLOCK
      ?auto_713026 - BLOCK
      ?auto_713027 - BLOCK
      ?auto_713028 - BLOCK
      ?auto_713029 - BLOCK
      ?auto_713030 - BLOCK
      ?auto_713031 - BLOCK
      ?auto_713032 - BLOCK
      ?auto_713033 - BLOCK
      ?auto_713034 - BLOCK
      ?auto_713035 - BLOCK
      ?auto_713036 - BLOCK
      ?auto_713037 - BLOCK
    )
    :vars
    (
      ?auto_713038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713037 ?auto_713038 ) ( ON-TABLE ?auto_713025 ) ( ON ?auto_713026 ?auto_713025 ) ( ON ?auto_713027 ?auto_713026 ) ( ON ?auto_713028 ?auto_713027 ) ( not ( = ?auto_713025 ?auto_713026 ) ) ( not ( = ?auto_713025 ?auto_713027 ) ) ( not ( = ?auto_713025 ?auto_713028 ) ) ( not ( = ?auto_713025 ?auto_713029 ) ) ( not ( = ?auto_713025 ?auto_713030 ) ) ( not ( = ?auto_713025 ?auto_713031 ) ) ( not ( = ?auto_713025 ?auto_713032 ) ) ( not ( = ?auto_713025 ?auto_713033 ) ) ( not ( = ?auto_713025 ?auto_713034 ) ) ( not ( = ?auto_713025 ?auto_713035 ) ) ( not ( = ?auto_713025 ?auto_713036 ) ) ( not ( = ?auto_713025 ?auto_713037 ) ) ( not ( = ?auto_713025 ?auto_713038 ) ) ( not ( = ?auto_713026 ?auto_713027 ) ) ( not ( = ?auto_713026 ?auto_713028 ) ) ( not ( = ?auto_713026 ?auto_713029 ) ) ( not ( = ?auto_713026 ?auto_713030 ) ) ( not ( = ?auto_713026 ?auto_713031 ) ) ( not ( = ?auto_713026 ?auto_713032 ) ) ( not ( = ?auto_713026 ?auto_713033 ) ) ( not ( = ?auto_713026 ?auto_713034 ) ) ( not ( = ?auto_713026 ?auto_713035 ) ) ( not ( = ?auto_713026 ?auto_713036 ) ) ( not ( = ?auto_713026 ?auto_713037 ) ) ( not ( = ?auto_713026 ?auto_713038 ) ) ( not ( = ?auto_713027 ?auto_713028 ) ) ( not ( = ?auto_713027 ?auto_713029 ) ) ( not ( = ?auto_713027 ?auto_713030 ) ) ( not ( = ?auto_713027 ?auto_713031 ) ) ( not ( = ?auto_713027 ?auto_713032 ) ) ( not ( = ?auto_713027 ?auto_713033 ) ) ( not ( = ?auto_713027 ?auto_713034 ) ) ( not ( = ?auto_713027 ?auto_713035 ) ) ( not ( = ?auto_713027 ?auto_713036 ) ) ( not ( = ?auto_713027 ?auto_713037 ) ) ( not ( = ?auto_713027 ?auto_713038 ) ) ( not ( = ?auto_713028 ?auto_713029 ) ) ( not ( = ?auto_713028 ?auto_713030 ) ) ( not ( = ?auto_713028 ?auto_713031 ) ) ( not ( = ?auto_713028 ?auto_713032 ) ) ( not ( = ?auto_713028 ?auto_713033 ) ) ( not ( = ?auto_713028 ?auto_713034 ) ) ( not ( = ?auto_713028 ?auto_713035 ) ) ( not ( = ?auto_713028 ?auto_713036 ) ) ( not ( = ?auto_713028 ?auto_713037 ) ) ( not ( = ?auto_713028 ?auto_713038 ) ) ( not ( = ?auto_713029 ?auto_713030 ) ) ( not ( = ?auto_713029 ?auto_713031 ) ) ( not ( = ?auto_713029 ?auto_713032 ) ) ( not ( = ?auto_713029 ?auto_713033 ) ) ( not ( = ?auto_713029 ?auto_713034 ) ) ( not ( = ?auto_713029 ?auto_713035 ) ) ( not ( = ?auto_713029 ?auto_713036 ) ) ( not ( = ?auto_713029 ?auto_713037 ) ) ( not ( = ?auto_713029 ?auto_713038 ) ) ( not ( = ?auto_713030 ?auto_713031 ) ) ( not ( = ?auto_713030 ?auto_713032 ) ) ( not ( = ?auto_713030 ?auto_713033 ) ) ( not ( = ?auto_713030 ?auto_713034 ) ) ( not ( = ?auto_713030 ?auto_713035 ) ) ( not ( = ?auto_713030 ?auto_713036 ) ) ( not ( = ?auto_713030 ?auto_713037 ) ) ( not ( = ?auto_713030 ?auto_713038 ) ) ( not ( = ?auto_713031 ?auto_713032 ) ) ( not ( = ?auto_713031 ?auto_713033 ) ) ( not ( = ?auto_713031 ?auto_713034 ) ) ( not ( = ?auto_713031 ?auto_713035 ) ) ( not ( = ?auto_713031 ?auto_713036 ) ) ( not ( = ?auto_713031 ?auto_713037 ) ) ( not ( = ?auto_713031 ?auto_713038 ) ) ( not ( = ?auto_713032 ?auto_713033 ) ) ( not ( = ?auto_713032 ?auto_713034 ) ) ( not ( = ?auto_713032 ?auto_713035 ) ) ( not ( = ?auto_713032 ?auto_713036 ) ) ( not ( = ?auto_713032 ?auto_713037 ) ) ( not ( = ?auto_713032 ?auto_713038 ) ) ( not ( = ?auto_713033 ?auto_713034 ) ) ( not ( = ?auto_713033 ?auto_713035 ) ) ( not ( = ?auto_713033 ?auto_713036 ) ) ( not ( = ?auto_713033 ?auto_713037 ) ) ( not ( = ?auto_713033 ?auto_713038 ) ) ( not ( = ?auto_713034 ?auto_713035 ) ) ( not ( = ?auto_713034 ?auto_713036 ) ) ( not ( = ?auto_713034 ?auto_713037 ) ) ( not ( = ?auto_713034 ?auto_713038 ) ) ( not ( = ?auto_713035 ?auto_713036 ) ) ( not ( = ?auto_713035 ?auto_713037 ) ) ( not ( = ?auto_713035 ?auto_713038 ) ) ( not ( = ?auto_713036 ?auto_713037 ) ) ( not ( = ?auto_713036 ?auto_713038 ) ) ( not ( = ?auto_713037 ?auto_713038 ) ) ( ON ?auto_713036 ?auto_713037 ) ( ON ?auto_713035 ?auto_713036 ) ( ON ?auto_713034 ?auto_713035 ) ( ON ?auto_713033 ?auto_713034 ) ( ON ?auto_713032 ?auto_713033 ) ( ON ?auto_713031 ?auto_713032 ) ( ON ?auto_713030 ?auto_713031 ) ( CLEAR ?auto_713028 ) ( ON ?auto_713029 ?auto_713030 ) ( CLEAR ?auto_713029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_713025 ?auto_713026 ?auto_713027 ?auto_713028 ?auto_713029 )
      ( MAKE-13PILE ?auto_713025 ?auto_713026 ?auto_713027 ?auto_713028 ?auto_713029 ?auto_713030 ?auto_713031 ?auto_713032 ?auto_713033 ?auto_713034 ?auto_713035 ?auto_713036 ?auto_713037 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_713079 - BLOCK
      ?auto_713080 - BLOCK
      ?auto_713081 - BLOCK
      ?auto_713082 - BLOCK
      ?auto_713083 - BLOCK
      ?auto_713084 - BLOCK
      ?auto_713085 - BLOCK
      ?auto_713086 - BLOCK
      ?auto_713087 - BLOCK
      ?auto_713088 - BLOCK
      ?auto_713089 - BLOCK
      ?auto_713090 - BLOCK
      ?auto_713091 - BLOCK
    )
    :vars
    (
      ?auto_713092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713091 ?auto_713092 ) ( ON-TABLE ?auto_713079 ) ( ON ?auto_713080 ?auto_713079 ) ( ON ?auto_713081 ?auto_713080 ) ( not ( = ?auto_713079 ?auto_713080 ) ) ( not ( = ?auto_713079 ?auto_713081 ) ) ( not ( = ?auto_713079 ?auto_713082 ) ) ( not ( = ?auto_713079 ?auto_713083 ) ) ( not ( = ?auto_713079 ?auto_713084 ) ) ( not ( = ?auto_713079 ?auto_713085 ) ) ( not ( = ?auto_713079 ?auto_713086 ) ) ( not ( = ?auto_713079 ?auto_713087 ) ) ( not ( = ?auto_713079 ?auto_713088 ) ) ( not ( = ?auto_713079 ?auto_713089 ) ) ( not ( = ?auto_713079 ?auto_713090 ) ) ( not ( = ?auto_713079 ?auto_713091 ) ) ( not ( = ?auto_713079 ?auto_713092 ) ) ( not ( = ?auto_713080 ?auto_713081 ) ) ( not ( = ?auto_713080 ?auto_713082 ) ) ( not ( = ?auto_713080 ?auto_713083 ) ) ( not ( = ?auto_713080 ?auto_713084 ) ) ( not ( = ?auto_713080 ?auto_713085 ) ) ( not ( = ?auto_713080 ?auto_713086 ) ) ( not ( = ?auto_713080 ?auto_713087 ) ) ( not ( = ?auto_713080 ?auto_713088 ) ) ( not ( = ?auto_713080 ?auto_713089 ) ) ( not ( = ?auto_713080 ?auto_713090 ) ) ( not ( = ?auto_713080 ?auto_713091 ) ) ( not ( = ?auto_713080 ?auto_713092 ) ) ( not ( = ?auto_713081 ?auto_713082 ) ) ( not ( = ?auto_713081 ?auto_713083 ) ) ( not ( = ?auto_713081 ?auto_713084 ) ) ( not ( = ?auto_713081 ?auto_713085 ) ) ( not ( = ?auto_713081 ?auto_713086 ) ) ( not ( = ?auto_713081 ?auto_713087 ) ) ( not ( = ?auto_713081 ?auto_713088 ) ) ( not ( = ?auto_713081 ?auto_713089 ) ) ( not ( = ?auto_713081 ?auto_713090 ) ) ( not ( = ?auto_713081 ?auto_713091 ) ) ( not ( = ?auto_713081 ?auto_713092 ) ) ( not ( = ?auto_713082 ?auto_713083 ) ) ( not ( = ?auto_713082 ?auto_713084 ) ) ( not ( = ?auto_713082 ?auto_713085 ) ) ( not ( = ?auto_713082 ?auto_713086 ) ) ( not ( = ?auto_713082 ?auto_713087 ) ) ( not ( = ?auto_713082 ?auto_713088 ) ) ( not ( = ?auto_713082 ?auto_713089 ) ) ( not ( = ?auto_713082 ?auto_713090 ) ) ( not ( = ?auto_713082 ?auto_713091 ) ) ( not ( = ?auto_713082 ?auto_713092 ) ) ( not ( = ?auto_713083 ?auto_713084 ) ) ( not ( = ?auto_713083 ?auto_713085 ) ) ( not ( = ?auto_713083 ?auto_713086 ) ) ( not ( = ?auto_713083 ?auto_713087 ) ) ( not ( = ?auto_713083 ?auto_713088 ) ) ( not ( = ?auto_713083 ?auto_713089 ) ) ( not ( = ?auto_713083 ?auto_713090 ) ) ( not ( = ?auto_713083 ?auto_713091 ) ) ( not ( = ?auto_713083 ?auto_713092 ) ) ( not ( = ?auto_713084 ?auto_713085 ) ) ( not ( = ?auto_713084 ?auto_713086 ) ) ( not ( = ?auto_713084 ?auto_713087 ) ) ( not ( = ?auto_713084 ?auto_713088 ) ) ( not ( = ?auto_713084 ?auto_713089 ) ) ( not ( = ?auto_713084 ?auto_713090 ) ) ( not ( = ?auto_713084 ?auto_713091 ) ) ( not ( = ?auto_713084 ?auto_713092 ) ) ( not ( = ?auto_713085 ?auto_713086 ) ) ( not ( = ?auto_713085 ?auto_713087 ) ) ( not ( = ?auto_713085 ?auto_713088 ) ) ( not ( = ?auto_713085 ?auto_713089 ) ) ( not ( = ?auto_713085 ?auto_713090 ) ) ( not ( = ?auto_713085 ?auto_713091 ) ) ( not ( = ?auto_713085 ?auto_713092 ) ) ( not ( = ?auto_713086 ?auto_713087 ) ) ( not ( = ?auto_713086 ?auto_713088 ) ) ( not ( = ?auto_713086 ?auto_713089 ) ) ( not ( = ?auto_713086 ?auto_713090 ) ) ( not ( = ?auto_713086 ?auto_713091 ) ) ( not ( = ?auto_713086 ?auto_713092 ) ) ( not ( = ?auto_713087 ?auto_713088 ) ) ( not ( = ?auto_713087 ?auto_713089 ) ) ( not ( = ?auto_713087 ?auto_713090 ) ) ( not ( = ?auto_713087 ?auto_713091 ) ) ( not ( = ?auto_713087 ?auto_713092 ) ) ( not ( = ?auto_713088 ?auto_713089 ) ) ( not ( = ?auto_713088 ?auto_713090 ) ) ( not ( = ?auto_713088 ?auto_713091 ) ) ( not ( = ?auto_713088 ?auto_713092 ) ) ( not ( = ?auto_713089 ?auto_713090 ) ) ( not ( = ?auto_713089 ?auto_713091 ) ) ( not ( = ?auto_713089 ?auto_713092 ) ) ( not ( = ?auto_713090 ?auto_713091 ) ) ( not ( = ?auto_713090 ?auto_713092 ) ) ( not ( = ?auto_713091 ?auto_713092 ) ) ( ON ?auto_713090 ?auto_713091 ) ( ON ?auto_713089 ?auto_713090 ) ( ON ?auto_713088 ?auto_713089 ) ( ON ?auto_713087 ?auto_713088 ) ( ON ?auto_713086 ?auto_713087 ) ( ON ?auto_713085 ?auto_713086 ) ( ON ?auto_713084 ?auto_713085 ) ( ON ?auto_713083 ?auto_713084 ) ( CLEAR ?auto_713081 ) ( ON ?auto_713082 ?auto_713083 ) ( CLEAR ?auto_713082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_713079 ?auto_713080 ?auto_713081 ?auto_713082 )
      ( MAKE-13PILE ?auto_713079 ?auto_713080 ?auto_713081 ?auto_713082 ?auto_713083 ?auto_713084 ?auto_713085 ?auto_713086 ?auto_713087 ?auto_713088 ?auto_713089 ?auto_713090 ?auto_713091 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_713133 - BLOCK
      ?auto_713134 - BLOCK
      ?auto_713135 - BLOCK
      ?auto_713136 - BLOCK
      ?auto_713137 - BLOCK
      ?auto_713138 - BLOCK
      ?auto_713139 - BLOCK
      ?auto_713140 - BLOCK
      ?auto_713141 - BLOCK
      ?auto_713142 - BLOCK
      ?auto_713143 - BLOCK
      ?auto_713144 - BLOCK
      ?auto_713145 - BLOCK
    )
    :vars
    (
      ?auto_713146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713145 ?auto_713146 ) ( ON-TABLE ?auto_713133 ) ( ON ?auto_713134 ?auto_713133 ) ( not ( = ?auto_713133 ?auto_713134 ) ) ( not ( = ?auto_713133 ?auto_713135 ) ) ( not ( = ?auto_713133 ?auto_713136 ) ) ( not ( = ?auto_713133 ?auto_713137 ) ) ( not ( = ?auto_713133 ?auto_713138 ) ) ( not ( = ?auto_713133 ?auto_713139 ) ) ( not ( = ?auto_713133 ?auto_713140 ) ) ( not ( = ?auto_713133 ?auto_713141 ) ) ( not ( = ?auto_713133 ?auto_713142 ) ) ( not ( = ?auto_713133 ?auto_713143 ) ) ( not ( = ?auto_713133 ?auto_713144 ) ) ( not ( = ?auto_713133 ?auto_713145 ) ) ( not ( = ?auto_713133 ?auto_713146 ) ) ( not ( = ?auto_713134 ?auto_713135 ) ) ( not ( = ?auto_713134 ?auto_713136 ) ) ( not ( = ?auto_713134 ?auto_713137 ) ) ( not ( = ?auto_713134 ?auto_713138 ) ) ( not ( = ?auto_713134 ?auto_713139 ) ) ( not ( = ?auto_713134 ?auto_713140 ) ) ( not ( = ?auto_713134 ?auto_713141 ) ) ( not ( = ?auto_713134 ?auto_713142 ) ) ( not ( = ?auto_713134 ?auto_713143 ) ) ( not ( = ?auto_713134 ?auto_713144 ) ) ( not ( = ?auto_713134 ?auto_713145 ) ) ( not ( = ?auto_713134 ?auto_713146 ) ) ( not ( = ?auto_713135 ?auto_713136 ) ) ( not ( = ?auto_713135 ?auto_713137 ) ) ( not ( = ?auto_713135 ?auto_713138 ) ) ( not ( = ?auto_713135 ?auto_713139 ) ) ( not ( = ?auto_713135 ?auto_713140 ) ) ( not ( = ?auto_713135 ?auto_713141 ) ) ( not ( = ?auto_713135 ?auto_713142 ) ) ( not ( = ?auto_713135 ?auto_713143 ) ) ( not ( = ?auto_713135 ?auto_713144 ) ) ( not ( = ?auto_713135 ?auto_713145 ) ) ( not ( = ?auto_713135 ?auto_713146 ) ) ( not ( = ?auto_713136 ?auto_713137 ) ) ( not ( = ?auto_713136 ?auto_713138 ) ) ( not ( = ?auto_713136 ?auto_713139 ) ) ( not ( = ?auto_713136 ?auto_713140 ) ) ( not ( = ?auto_713136 ?auto_713141 ) ) ( not ( = ?auto_713136 ?auto_713142 ) ) ( not ( = ?auto_713136 ?auto_713143 ) ) ( not ( = ?auto_713136 ?auto_713144 ) ) ( not ( = ?auto_713136 ?auto_713145 ) ) ( not ( = ?auto_713136 ?auto_713146 ) ) ( not ( = ?auto_713137 ?auto_713138 ) ) ( not ( = ?auto_713137 ?auto_713139 ) ) ( not ( = ?auto_713137 ?auto_713140 ) ) ( not ( = ?auto_713137 ?auto_713141 ) ) ( not ( = ?auto_713137 ?auto_713142 ) ) ( not ( = ?auto_713137 ?auto_713143 ) ) ( not ( = ?auto_713137 ?auto_713144 ) ) ( not ( = ?auto_713137 ?auto_713145 ) ) ( not ( = ?auto_713137 ?auto_713146 ) ) ( not ( = ?auto_713138 ?auto_713139 ) ) ( not ( = ?auto_713138 ?auto_713140 ) ) ( not ( = ?auto_713138 ?auto_713141 ) ) ( not ( = ?auto_713138 ?auto_713142 ) ) ( not ( = ?auto_713138 ?auto_713143 ) ) ( not ( = ?auto_713138 ?auto_713144 ) ) ( not ( = ?auto_713138 ?auto_713145 ) ) ( not ( = ?auto_713138 ?auto_713146 ) ) ( not ( = ?auto_713139 ?auto_713140 ) ) ( not ( = ?auto_713139 ?auto_713141 ) ) ( not ( = ?auto_713139 ?auto_713142 ) ) ( not ( = ?auto_713139 ?auto_713143 ) ) ( not ( = ?auto_713139 ?auto_713144 ) ) ( not ( = ?auto_713139 ?auto_713145 ) ) ( not ( = ?auto_713139 ?auto_713146 ) ) ( not ( = ?auto_713140 ?auto_713141 ) ) ( not ( = ?auto_713140 ?auto_713142 ) ) ( not ( = ?auto_713140 ?auto_713143 ) ) ( not ( = ?auto_713140 ?auto_713144 ) ) ( not ( = ?auto_713140 ?auto_713145 ) ) ( not ( = ?auto_713140 ?auto_713146 ) ) ( not ( = ?auto_713141 ?auto_713142 ) ) ( not ( = ?auto_713141 ?auto_713143 ) ) ( not ( = ?auto_713141 ?auto_713144 ) ) ( not ( = ?auto_713141 ?auto_713145 ) ) ( not ( = ?auto_713141 ?auto_713146 ) ) ( not ( = ?auto_713142 ?auto_713143 ) ) ( not ( = ?auto_713142 ?auto_713144 ) ) ( not ( = ?auto_713142 ?auto_713145 ) ) ( not ( = ?auto_713142 ?auto_713146 ) ) ( not ( = ?auto_713143 ?auto_713144 ) ) ( not ( = ?auto_713143 ?auto_713145 ) ) ( not ( = ?auto_713143 ?auto_713146 ) ) ( not ( = ?auto_713144 ?auto_713145 ) ) ( not ( = ?auto_713144 ?auto_713146 ) ) ( not ( = ?auto_713145 ?auto_713146 ) ) ( ON ?auto_713144 ?auto_713145 ) ( ON ?auto_713143 ?auto_713144 ) ( ON ?auto_713142 ?auto_713143 ) ( ON ?auto_713141 ?auto_713142 ) ( ON ?auto_713140 ?auto_713141 ) ( ON ?auto_713139 ?auto_713140 ) ( ON ?auto_713138 ?auto_713139 ) ( ON ?auto_713137 ?auto_713138 ) ( ON ?auto_713136 ?auto_713137 ) ( CLEAR ?auto_713134 ) ( ON ?auto_713135 ?auto_713136 ) ( CLEAR ?auto_713135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_713133 ?auto_713134 ?auto_713135 )
      ( MAKE-13PILE ?auto_713133 ?auto_713134 ?auto_713135 ?auto_713136 ?auto_713137 ?auto_713138 ?auto_713139 ?auto_713140 ?auto_713141 ?auto_713142 ?auto_713143 ?auto_713144 ?auto_713145 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_713187 - BLOCK
      ?auto_713188 - BLOCK
      ?auto_713189 - BLOCK
      ?auto_713190 - BLOCK
      ?auto_713191 - BLOCK
      ?auto_713192 - BLOCK
      ?auto_713193 - BLOCK
      ?auto_713194 - BLOCK
      ?auto_713195 - BLOCK
      ?auto_713196 - BLOCK
      ?auto_713197 - BLOCK
      ?auto_713198 - BLOCK
      ?auto_713199 - BLOCK
    )
    :vars
    (
      ?auto_713200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713199 ?auto_713200 ) ( ON-TABLE ?auto_713187 ) ( not ( = ?auto_713187 ?auto_713188 ) ) ( not ( = ?auto_713187 ?auto_713189 ) ) ( not ( = ?auto_713187 ?auto_713190 ) ) ( not ( = ?auto_713187 ?auto_713191 ) ) ( not ( = ?auto_713187 ?auto_713192 ) ) ( not ( = ?auto_713187 ?auto_713193 ) ) ( not ( = ?auto_713187 ?auto_713194 ) ) ( not ( = ?auto_713187 ?auto_713195 ) ) ( not ( = ?auto_713187 ?auto_713196 ) ) ( not ( = ?auto_713187 ?auto_713197 ) ) ( not ( = ?auto_713187 ?auto_713198 ) ) ( not ( = ?auto_713187 ?auto_713199 ) ) ( not ( = ?auto_713187 ?auto_713200 ) ) ( not ( = ?auto_713188 ?auto_713189 ) ) ( not ( = ?auto_713188 ?auto_713190 ) ) ( not ( = ?auto_713188 ?auto_713191 ) ) ( not ( = ?auto_713188 ?auto_713192 ) ) ( not ( = ?auto_713188 ?auto_713193 ) ) ( not ( = ?auto_713188 ?auto_713194 ) ) ( not ( = ?auto_713188 ?auto_713195 ) ) ( not ( = ?auto_713188 ?auto_713196 ) ) ( not ( = ?auto_713188 ?auto_713197 ) ) ( not ( = ?auto_713188 ?auto_713198 ) ) ( not ( = ?auto_713188 ?auto_713199 ) ) ( not ( = ?auto_713188 ?auto_713200 ) ) ( not ( = ?auto_713189 ?auto_713190 ) ) ( not ( = ?auto_713189 ?auto_713191 ) ) ( not ( = ?auto_713189 ?auto_713192 ) ) ( not ( = ?auto_713189 ?auto_713193 ) ) ( not ( = ?auto_713189 ?auto_713194 ) ) ( not ( = ?auto_713189 ?auto_713195 ) ) ( not ( = ?auto_713189 ?auto_713196 ) ) ( not ( = ?auto_713189 ?auto_713197 ) ) ( not ( = ?auto_713189 ?auto_713198 ) ) ( not ( = ?auto_713189 ?auto_713199 ) ) ( not ( = ?auto_713189 ?auto_713200 ) ) ( not ( = ?auto_713190 ?auto_713191 ) ) ( not ( = ?auto_713190 ?auto_713192 ) ) ( not ( = ?auto_713190 ?auto_713193 ) ) ( not ( = ?auto_713190 ?auto_713194 ) ) ( not ( = ?auto_713190 ?auto_713195 ) ) ( not ( = ?auto_713190 ?auto_713196 ) ) ( not ( = ?auto_713190 ?auto_713197 ) ) ( not ( = ?auto_713190 ?auto_713198 ) ) ( not ( = ?auto_713190 ?auto_713199 ) ) ( not ( = ?auto_713190 ?auto_713200 ) ) ( not ( = ?auto_713191 ?auto_713192 ) ) ( not ( = ?auto_713191 ?auto_713193 ) ) ( not ( = ?auto_713191 ?auto_713194 ) ) ( not ( = ?auto_713191 ?auto_713195 ) ) ( not ( = ?auto_713191 ?auto_713196 ) ) ( not ( = ?auto_713191 ?auto_713197 ) ) ( not ( = ?auto_713191 ?auto_713198 ) ) ( not ( = ?auto_713191 ?auto_713199 ) ) ( not ( = ?auto_713191 ?auto_713200 ) ) ( not ( = ?auto_713192 ?auto_713193 ) ) ( not ( = ?auto_713192 ?auto_713194 ) ) ( not ( = ?auto_713192 ?auto_713195 ) ) ( not ( = ?auto_713192 ?auto_713196 ) ) ( not ( = ?auto_713192 ?auto_713197 ) ) ( not ( = ?auto_713192 ?auto_713198 ) ) ( not ( = ?auto_713192 ?auto_713199 ) ) ( not ( = ?auto_713192 ?auto_713200 ) ) ( not ( = ?auto_713193 ?auto_713194 ) ) ( not ( = ?auto_713193 ?auto_713195 ) ) ( not ( = ?auto_713193 ?auto_713196 ) ) ( not ( = ?auto_713193 ?auto_713197 ) ) ( not ( = ?auto_713193 ?auto_713198 ) ) ( not ( = ?auto_713193 ?auto_713199 ) ) ( not ( = ?auto_713193 ?auto_713200 ) ) ( not ( = ?auto_713194 ?auto_713195 ) ) ( not ( = ?auto_713194 ?auto_713196 ) ) ( not ( = ?auto_713194 ?auto_713197 ) ) ( not ( = ?auto_713194 ?auto_713198 ) ) ( not ( = ?auto_713194 ?auto_713199 ) ) ( not ( = ?auto_713194 ?auto_713200 ) ) ( not ( = ?auto_713195 ?auto_713196 ) ) ( not ( = ?auto_713195 ?auto_713197 ) ) ( not ( = ?auto_713195 ?auto_713198 ) ) ( not ( = ?auto_713195 ?auto_713199 ) ) ( not ( = ?auto_713195 ?auto_713200 ) ) ( not ( = ?auto_713196 ?auto_713197 ) ) ( not ( = ?auto_713196 ?auto_713198 ) ) ( not ( = ?auto_713196 ?auto_713199 ) ) ( not ( = ?auto_713196 ?auto_713200 ) ) ( not ( = ?auto_713197 ?auto_713198 ) ) ( not ( = ?auto_713197 ?auto_713199 ) ) ( not ( = ?auto_713197 ?auto_713200 ) ) ( not ( = ?auto_713198 ?auto_713199 ) ) ( not ( = ?auto_713198 ?auto_713200 ) ) ( not ( = ?auto_713199 ?auto_713200 ) ) ( ON ?auto_713198 ?auto_713199 ) ( ON ?auto_713197 ?auto_713198 ) ( ON ?auto_713196 ?auto_713197 ) ( ON ?auto_713195 ?auto_713196 ) ( ON ?auto_713194 ?auto_713195 ) ( ON ?auto_713193 ?auto_713194 ) ( ON ?auto_713192 ?auto_713193 ) ( ON ?auto_713191 ?auto_713192 ) ( ON ?auto_713190 ?auto_713191 ) ( ON ?auto_713189 ?auto_713190 ) ( CLEAR ?auto_713187 ) ( ON ?auto_713188 ?auto_713189 ) ( CLEAR ?auto_713188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_713187 ?auto_713188 )
      ( MAKE-13PILE ?auto_713187 ?auto_713188 ?auto_713189 ?auto_713190 ?auto_713191 ?auto_713192 ?auto_713193 ?auto_713194 ?auto_713195 ?auto_713196 ?auto_713197 ?auto_713198 ?auto_713199 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_713241 - BLOCK
      ?auto_713242 - BLOCK
      ?auto_713243 - BLOCK
      ?auto_713244 - BLOCK
      ?auto_713245 - BLOCK
      ?auto_713246 - BLOCK
      ?auto_713247 - BLOCK
      ?auto_713248 - BLOCK
      ?auto_713249 - BLOCK
      ?auto_713250 - BLOCK
      ?auto_713251 - BLOCK
      ?auto_713252 - BLOCK
      ?auto_713253 - BLOCK
    )
    :vars
    (
      ?auto_713254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713253 ?auto_713254 ) ( not ( = ?auto_713241 ?auto_713242 ) ) ( not ( = ?auto_713241 ?auto_713243 ) ) ( not ( = ?auto_713241 ?auto_713244 ) ) ( not ( = ?auto_713241 ?auto_713245 ) ) ( not ( = ?auto_713241 ?auto_713246 ) ) ( not ( = ?auto_713241 ?auto_713247 ) ) ( not ( = ?auto_713241 ?auto_713248 ) ) ( not ( = ?auto_713241 ?auto_713249 ) ) ( not ( = ?auto_713241 ?auto_713250 ) ) ( not ( = ?auto_713241 ?auto_713251 ) ) ( not ( = ?auto_713241 ?auto_713252 ) ) ( not ( = ?auto_713241 ?auto_713253 ) ) ( not ( = ?auto_713241 ?auto_713254 ) ) ( not ( = ?auto_713242 ?auto_713243 ) ) ( not ( = ?auto_713242 ?auto_713244 ) ) ( not ( = ?auto_713242 ?auto_713245 ) ) ( not ( = ?auto_713242 ?auto_713246 ) ) ( not ( = ?auto_713242 ?auto_713247 ) ) ( not ( = ?auto_713242 ?auto_713248 ) ) ( not ( = ?auto_713242 ?auto_713249 ) ) ( not ( = ?auto_713242 ?auto_713250 ) ) ( not ( = ?auto_713242 ?auto_713251 ) ) ( not ( = ?auto_713242 ?auto_713252 ) ) ( not ( = ?auto_713242 ?auto_713253 ) ) ( not ( = ?auto_713242 ?auto_713254 ) ) ( not ( = ?auto_713243 ?auto_713244 ) ) ( not ( = ?auto_713243 ?auto_713245 ) ) ( not ( = ?auto_713243 ?auto_713246 ) ) ( not ( = ?auto_713243 ?auto_713247 ) ) ( not ( = ?auto_713243 ?auto_713248 ) ) ( not ( = ?auto_713243 ?auto_713249 ) ) ( not ( = ?auto_713243 ?auto_713250 ) ) ( not ( = ?auto_713243 ?auto_713251 ) ) ( not ( = ?auto_713243 ?auto_713252 ) ) ( not ( = ?auto_713243 ?auto_713253 ) ) ( not ( = ?auto_713243 ?auto_713254 ) ) ( not ( = ?auto_713244 ?auto_713245 ) ) ( not ( = ?auto_713244 ?auto_713246 ) ) ( not ( = ?auto_713244 ?auto_713247 ) ) ( not ( = ?auto_713244 ?auto_713248 ) ) ( not ( = ?auto_713244 ?auto_713249 ) ) ( not ( = ?auto_713244 ?auto_713250 ) ) ( not ( = ?auto_713244 ?auto_713251 ) ) ( not ( = ?auto_713244 ?auto_713252 ) ) ( not ( = ?auto_713244 ?auto_713253 ) ) ( not ( = ?auto_713244 ?auto_713254 ) ) ( not ( = ?auto_713245 ?auto_713246 ) ) ( not ( = ?auto_713245 ?auto_713247 ) ) ( not ( = ?auto_713245 ?auto_713248 ) ) ( not ( = ?auto_713245 ?auto_713249 ) ) ( not ( = ?auto_713245 ?auto_713250 ) ) ( not ( = ?auto_713245 ?auto_713251 ) ) ( not ( = ?auto_713245 ?auto_713252 ) ) ( not ( = ?auto_713245 ?auto_713253 ) ) ( not ( = ?auto_713245 ?auto_713254 ) ) ( not ( = ?auto_713246 ?auto_713247 ) ) ( not ( = ?auto_713246 ?auto_713248 ) ) ( not ( = ?auto_713246 ?auto_713249 ) ) ( not ( = ?auto_713246 ?auto_713250 ) ) ( not ( = ?auto_713246 ?auto_713251 ) ) ( not ( = ?auto_713246 ?auto_713252 ) ) ( not ( = ?auto_713246 ?auto_713253 ) ) ( not ( = ?auto_713246 ?auto_713254 ) ) ( not ( = ?auto_713247 ?auto_713248 ) ) ( not ( = ?auto_713247 ?auto_713249 ) ) ( not ( = ?auto_713247 ?auto_713250 ) ) ( not ( = ?auto_713247 ?auto_713251 ) ) ( not ( = ?auto_713247 ?auto_713252 ) ) ( not ( = ?auto_713247 ?auto_713253 ) ) ( not ( = ?auto_713247 ?auto_713254 ) ) ( not ( = ?auto_713248 ?auto_713249 ) ) ( not ( = ?auto_713248 ?auto_713250 ) ) ( not ( = ?auto_713248 ?auto_713251 ) ) ( not ( = ?auto_713248 ?auto_713252 ) ) ( not ( = ?auto_713248 ?auto_713253 ) ) ( not ( = ?auto_713248 ?auto_713254 ) ) ( not ( = ?auto_713249 ?auto_713250 ) ) ( not ( = ?auto_713249 ?auto_713251 ) ) ( not ( = ?auto_713249 ?auto_713252 ) ) ( not ( = ?auto_713249 ?auto_713253 ) ) ( not ( = ?auto_713249 ?auto_713254 ) ) ( not ( = ?auto_713250 ?auto_713251 ) ) ( not ( = ?auto_713250 ?auto_713252 ) ) ( not ( = ?auto_713250 ?auto_713253 ) ) ( not ( = ?auto_713250 ?auto_713254 ) ) ( not ( = ?auto_713251 ?auto_713252 ) ) ( not ( = ?auto_713251 ?auto_713253 ) ) ( not ( = ?auto_713251 ?auto_713254 ) ) ( not ( = ?auto_713252 ?auto_713253 ) ) ( not ( = ?auto_713252 ?auto_713254 ) ) ( not ( = ?auto_713253 ?auto_713254 ) ) ( ON ?auto_713252 ?auto_713253 ) ( ON ?auto_713251 ?auto_713252 ) ( ON ?auto_713250 ?auto_713251 ) ( ON ?auto_713249 ?auto_713250 ) ( ON ?auto_713248 ?auto_713249 ) ( ON ?auto_713247 ?auto_713248 ) ( ON ?auto_713246 ?auto_713247 ) ( ON ?auto_713245 ?auto_713246 ) ( ON ?auto_713244 ?auto_713245 ) ( ON ?auto_713243 ?auto_713244 ) ( ON ?auto_713242 ?auto_713243 ) ( ON ?auto_713241 ?auto_713242 ) ( CLEAR ?auto_713241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_713241 )
      ( MAKE-13PILE ?auto_713241 ?auto_713242 ?auto_713243 ?auto_713244 ?auto_713245 ?auto_713246 ?auto_713247 ?auto_713248 ?auto_713249 ?auto_713250 ?auto_713251 ?auto_713252 ?auto_713253 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713296 - BLOCK
      ?auto_713297 - BLOCK
      ?auto_713298 - BLOCK
      ?auto_713299 - BLOCK
      ?auto_713300 - BLOCK
      ?auto_713301 - BLOCK
      ?auto_713302 - BLOCK
      ?auto_713303 - BLOCK
      ?auto_713304 - BLOCK
      ?auto_713305 - BLOCK
      ?auto_713306 - BLOCK
      ?auto_713307 - BLOCK
      ?auto_713308 - BLOCK
      ?auto_713309 - BLOCK
    )
    :vars
    (
      ?auto_713310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_713308 ) ( ON ?auto_713309 ?auto_713310 ) ( CLEAR ?auto_713309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_713296 ) ( ON ?auto_713297 ?auto_713296 ) ( ON ?auto_713298 ?auto_713297 ) ( ON ?auto_713299 ?auto_713298 ) ( ON ?auto_713300 ?auto_713299 ) ( ON ?auto_713301 ?auto_713300 ) ( ON ?auto_713302 ?auto_713301 ) ( ON ?auto_713303 ?auto_713302 ) ( ON ?auto_713304 ?auto_713303 ) ( ON ?auto_713305 ?auto_713304 ) ( ON ?auto_713306 ?auto_713305 ) ( ON ?auto_713307 ?auto_713306 ) ( ON ?auto_713308 ?auto_713307 ) ( not ( = ?auto_713296 ?auto_713297 ) ) ( not ( = ?auto_713296 ?auto_713298 ) ) ( not ( = ?auto_713296 ?auto_713299 ) ) ( not ( = ?auto_713296 ?auto_713300 ) ) ( not ( = ?auto_713296 ?auto_713301 ) ) ( not ( = ?auto_713296 ?auto_713302 ) ) ( not ( = ?auto_713296 ?auto_713303 ) ) ( not ( = ?auto_713296 ?auto_713304 ) ) ( not ( = ?auto_713296 ?auto_713305 ) ) ( not ( = ?auto_713296 ?auto_713306 ) ) ( not ( = ?auto_713296 ?auto_713307 ) ) ( not ( = ?auto_713296 ?auto_713308 ) ) ( not ( = ?auto_713296 ?auto_713309 ) ) ( not ( = ?auto_713296 ?auto_713310 ) ) ( not ( = ?auto_713297 ?auto_713298 ) ) ( not ( = ?auto_713297 ?auto_713299 ) ) ( not ( = ?auto_713297 ?auto_713300 ) ) ( not ( = ?auto_713297 ?auto_713301 ) ) ( not ( = ?auto_713297 ?auto_713302 ) ) ( not ( = ?auto_713297 ?auto_713303 ) ) ( not ( = ?auto_713297 ?auto_713304 ) ) ( not ( = ?auto_713297 ?auto_713305 ) ) ( not ( = ?auto_713297 ?auto_713306 ) ) ( not ( = ?auto_713297 ?auto_713307 ) ) ( not ( = ?auto_713297 ?auto_713308 ) ) ( not ( = ?auto_713297 ?auto_713309 ) ) ( not ( = ?auto_713297 ?auto_713310 ) ) ( not ( = ?auto_713298 ?auto_713299 ) ) ( not ( = ?auto_713298 ?auto_713300 ) ) ( not ( = ?auto_713298 ?auto_713301 ) ) ( not ( = ?auto_713298 ?auto_713302 ) ) ( not ( = ?auto_713298 ?auto_713303 ) ) ( not ( = ?auto_713298 ?auto_713304 ) ) ( not ( = ?auto_713298 ?auto_713305 ) ) ( not ( = ?auto_713298 ?auto_713306 ) ) ( not ( = ?auto_713298 ?auto_713307 ) ) ( not ( = ?auto_713298 ?auto_713308 ) ) ( not ( = ?auto_713298 ?auto_713309 ) ) ( not ( = ?auto_713298 ?auto_713310 ) ) ( not ( = ?auto_713299 ?auto_713300 ) ) ( not ( = ?auto_713299 ?auto_713301 ) ) ( not ( = ?auto_713299 ?auto_713302 ) ) ( not ( = ?auto_713299 ?auto_713303 ) ) ( not ( = ?auto_713299 ?auto_713304 ) ) ( not ( = ?auto_713299 ?auto_713305 ) ) ( not ( = ?auto_713299 ?auto_713306 ) ) ( not ( = ?auto_713299 ?auto_713307 ) ) ( not ( = ?auto_713299 ?auto_713308 ) ) ( not ( = ?auto_713299 ?auto_713309 ) ) ( not ( = ?auto_713299 ?auto_713310 ) ) ( not ( = ?auto_713300 ?auto_713301 ) ) ( not ( = ?auto_713300 ?auto_713302 ) ) ( not ( = ?auto_713300 ?auto_713303 ) ) ( not ( = ?auto_713300 ?auto_713304 ) ) ( not ( = ?auto_713300 ?auto_713305 ) ) ( not ( = ?auto_713300 ?auto_713306 ) ) ( not ( = ?auto_713300 ?auto_713307 ) ) ( not ( = ?auto_713300 ?auto_713308 ) ) ( not ( = ?auto_713300 ?auto_713309 ) ) ( not ( = ?auto_713300 ?auto_713310 ) ) ( not ( = ?auto_713301 ?auto_713302 ) ) ( not ( = ?auto_713301 ?auto_713303 ) ) ( not ( = ?auto_713301 ?auto_713304 ) ) ( not ( = ?auto_713301 ?auto_713305 ) ) ( not ( = ?auto_713301 ?auto_713306 ) ) ( not ( = ?auto_713301 ?auto_713307 ) ) ( not ( = ?auto_713301 ?auto_713308 ) ) ( not ( = ?auto_713301 ?auto_713309 ) ) ( not ( = ?auto_713301 ?auto_713310 ) ) ( not ( = ?auto_713302 ?auto_713303 ) ) ( not ( = ?auto_713302 ?auto_713304 ) ) ( not ( = ?auto_713302 ?auto_713305 ) ) ( not ( = ?auto_713302 ?auto_713306 ) ) ( not ( = ?auto_713302 ?auto_713307 ) ) ( not ( = ?auto_713302 ?auto_713308 ) ) ( not ( = ?auto_713302 ?auto_713309 ) ) ( not ( = ?auto_713302 ?auto_713310 ) ) ( not ( = ?auto_713303 ?auto_713304 ) ) ( not ( = ?auto_713303 ?auto_713305 ) ) ( not ( = ?auto_713303 ?auto_713306 ) ) ( not ( = ?auto_713303 ?auto_713307 ) ) ( not ( = ?auto_713303 ?auto_713308 ) ) ( not ( = ?auto_713303 ?auto_713309 ) ) ( not ( = ?auto_713303 ?auto_713310 ) ) ( not ( = ?auto_713304 ?auto_713305 ) ) ( not ( = ?auto_713304 ?auto_713306 ) ) ( not ( = ?auto_713304 ?auto_713307 ) ) ( not ( = ?auto_713304 ?auto_713308 ) ) ( not ( = ?auto_713304 ?auto_713309 ) ) ( not ( = ?auto_713304 ?auto_713310 ) ) ( not ( = ?auto_713305 ?auto_713306 ) ) ( not ( = ?auto_713305 ?auto_713307 ) ) ( not ( = ?auto_713305 ?auto_713308 ) ) ( not ( = ?auto_713305 ?auto_713309 ) ) ( not ( = ?auto_713305 ?auto_713310 ) ) ( not ( = ?auto_713306 ?auto_713307 ) ) ( not ( = ?auto_713306 ?auto_713308 ) ) ( not ( = ?auto_713306 ?auto_713309 ) ) ( not ( = ?auto_713306 ?auto_713310 ) ) ( not ( = ?auto_713307 ?auto_713308 ) ) ( not ( = ?auto_713307 ?auto_713309 ) ) ( not ( = ?auto_713307 ?auto_713310 ) ) ( not ( = ?auto_713308 ?auto_713309 ) ) ( not ( = ?auto_713308 ?auto_713310 ) ) ( not ( = ?auto_713309 ?auto_713310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_713309 ?auto_713310 )
      ( !STACK ?auto_713309 ?auto_713308 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713354 - BLOCK
      ?auto_713355 - BLOCK
      ?auto_713356 - BLOCK
      ?auto_713357 - BLOCK
      ?auto_713358 - BLOCK
      ?auto_713359 - BLOCK
      ?auto_713360 - BLOCK
      ?auto_713361 - BLOCK
      ?auto_713362 - BLOCK
      ?auto_713363 - BLOCK
      ?auto_713364 - BLOCK
      ?auto_713365 - BLOCK
      ?auto_713366 - BLOCK
      ?auto_713367 - BLOCK
    )
    :vars
    (
      ?auto_713368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713367 ?auto_713368 ) ( ON-TABLE ?auto_713354 ) ( ON ?auto_713355 ?auto_713354 ) ( ON ?auto_713356 ?auto_713355 ) ( ON ?auto_713357 ?auto_713356 ) ( ON ?auto_713358 ?auto_713357 ) ( ON ?auto_713359 ?auto_713358 ) ( ON ?auto_713360 ?auto_713359 ) ( ON ?auto_713361 ?auto_713360 ) ( ON ?auto_713362 ?auto_713361 ) ( ON ?auto_713363 ?auto_713362 ) ( ON ?auto_713364 ?auto_713363 ) ( ON ?auto_713365 ?auto_713364 ) ( not ( = ?auto_713354 ?auto_713355 ) ) ( not ( = ?auto_713354 ?auto_713356 ) ) ( not ( = ?auto_713354 ?auto_713357 ) ) ( not ( = ?auto_713354 ?auto_713358 ) ) ( not ( = ?auto_713354 ?auto_713359 ) ) ( not ( = ?auto_713354 ?auto_713360 ) ) ( not ( = ?auto_713354 ?auto_713361 ) ) ( not ( = ?auto_713354 ?auto_713362 ) ) ( not ( = ?auto_713354 ?auto_713363 ) ) ( not ( = ?auto_713354 ?auto_713364 ) ) ( not ( = ?auto_713354 ?auto_713365 ) ) ( not ( = ?auto_713354 ?auto_713366 ) ) ( not ( = ?auto_713354 ?auto_713367 ) ) ( not ( = ?auto_713354 ?auto_713368 ) ) ( not ( = ?auto_713355 ?auto_713356 ) ) ( not ( = ?auto_713355 ?auto_713357 ) ) ( not ( = ?auto_713355 ?auto_713358 ) ) ( not ( = ?auto_713355 ?auto_713359 ) ) ( not ( = ?auto_713355 ?auto_713360 ) ) ( not ( = ?auto_713355 ?auto_713361 ) ) ( not ( = ?auto_713355 ?auto_713362 ) ) ( not ( = ?auto_713355 ?auto_713363 ) ) ( not ( = ?auto_713355 ?auto_713364 ) ) ( not ( = ?auto_713355 ?auto_713365 ) ) ( not ( = ?auto_713355 ?auto_713366 ) ) ( not ( = ?auto_713355 ?auto_713367 ) ) ( not ( = ?auto_713355 ?auto_713368 ) ) ( not ( = ?auto_713356 ?auto_713357 ) ) ( not ( = ?auto_713356 ?auto_713358 ) ) ( not ( = ?auto_713356 ?auto_713359 ) ) ( not ( = ?auto_713356 ?auto_713360 ) ) ( not ( = ?auto_713356 ?auto_713361 ) ) ( not ( = ?auto_713356 ?auto_713362 ) ) ( not ( = ?auto_713356 ?auto_713363 ) ) ( not ( = ?auto_713356 ?auto_713364 ) ) ( not ( = ?auto_713356 ?auto_713365 ) ) ( not ( = ?auto_713356 ?auto_713366 ) ) ( not ( = ?auto_713356 ?auto_713367 ) ) ( not ( = ?auto_713356 ?auto_713368 ) ) ( not ( = ?auto_713357 ?auto_713358 ) ) ( not ( = ?auto_713357 ?auto_713359 ) ) ( not ( = ?auto_713357 ?auto_713360 ) ) ( not ( = ?auto_713357 ?auto_713361 ) ) ( not ( = ?auto_713357 ?auto_713362 ) ) ( not ( = ?auto_713357 ?auto_713363 ) ) ( not ( = ?auto_713357 ?auto_713364 ) ) ( not ( = ?auto_713357 ?auto_713365 ) ) ( not ( = ?auto_713357 ?auto_713366 ) ) ( not ( = ?auto_713357 ?auto_713367 ) ) ( not ( = ?auto_713357 ?auto_713368 ) ) ( not ( = ?auto_713358 ?auto_713359 ) ) ( not ( = ?auto_713358 ?auto_713360 ) ) ( not ( = ?auto_713358 ?auto_713361 ) ) ( not ( = ?auto_713358 ?auto_713362 ) ) ( not ( = ?auto_713358 ?auto_713363 ) ) ( not ( = ?auto_713358 ?auto_713364 ) ) ( not ( = ?auto_713358 ?auto_713365 ) ) ( not ( = ?auto_713358 ?auto_713366 ) ) ( not ( = ?auto_713358 ?auto_713367 ) ) ( not ( = ?auto_713358 ?auto_713368 ) ) ( not ( = ?auto_713359 ?auto_713360 ) ) ( not ( = ?auto_713359 ?auto_713361 ) ) ( not ( = ?auto_713359 ?auto_713362 ) ) ( not ( = ?auto_713359 ?auto_713363 ) ) ( not ( = ?auto_713359 ?auto_713364 ) ) ( not ( = ?auto_713359 ?auto_713365 ) ) ( not ( = ?auto_713359 ?auto_713366 ) ) ( not ( = ?auto_713359 ?auto_713367 ) ) ( not ( = ?auto_713359 ?auto_713368 ) ) ( not ( = ?auto_713360 ?auto_713361 ) ) ( not ( = ?auto_713360 ?auto_713362 ) ) ( not ( = ?auto_713360 ?auto_713363 ) ) ( not ( = ?auto_713360 ?auto_713364 ) ) ( not ( = ?auto_713360 ?auto_713365 ) ) ( not ( = ?auto_713360 ?auto_713366 ) ) ( not ( = ?auto_713360 ?auto_713367 ) ) ( not ( = ?auto_713360 ?auto_713368 ) ) ( not ( = ?auto_713361 ?auto_713362 ) ) ( not ( = ?auto_713361 ?auto_713363 ) ) ( not ( = ?auto_713361 ?auto_713364 ) ) ( not ( = ?auto_713361 ?auto_713365 ) ) ( not ( = ?auto_713361 ?auto_713366 ) ) ( not ( = ?auto_713361 ?auto_713367 ) ) ( not ( = ?auto_713361 ?auto_713368 ) ) ( not ( = ?auto_713362 ?auto_713363 ) ) ( not ( = ?auto_713362 ?auto_713364 ) ) ( not ( = ?auto_713362 ?auto_713365 ) ) ( not ( = ?auto_713362 ?auto_713366 ) ) ( not ( = ?auto_713362 ?auto_713367 ) ) ( not ( = ?auto_713362 ?auto_713368 ) ) ( not ( = ?auto_713363 ?auto_713364 ) ) ( not ( = ?auto_713363 ?auto_713365 ) ) ( not ( = ?auto_713363 ?auto_713366 ) ) ( not ( = ?auto_713363 ?auto_713367 ) ) ( not ( = ?auto_713363 ?auto_713368 ) ) ( not ( = ?auto_713364 ?auto_713365 ) ) ( not ( = ?auto_713364 ?auto_713366 ) ) ( not ( = ?auto_713364 ?auto_713367 ) ) ( not ( = ?auto_713364 ?auto_713368 ) ) ( not ( = ?auto_713365 ?auto_713366 ) ) ( not ( = ?auto_713365 ?auto_713367 ) ) ( not ( = ?auto_713365 ?auto_713368 ) ) ( not ( = ?auto_713366 ?auto_713367 ) ) ( not ( = ?auto_713366 ?auto_713368 ) ) ( not ( = ?auto_713367 ?auto_713368 ) ) ( CLEAR ?auto_713365 ) ( ON ?auto_713366 ?auto_713367 ) ( CLEAR ?auto_713366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_713354 ?auto_713355 ?auto_713356 ?auto_713357 ?auto_713358 ?auto_713359 ?auto_713360 ?auto_713361 ?auto_713362 ?auto_713363 ?auto_713364 ?auto_713365 ?auto_713366 )
      ( MAKE-14PILE ?auto_713354 ?auto_713355 ?auto_713356 ?auto_713357 ?auto_713358 ?auto_713359 ?auto_713360 ?auto_713361 ?auto_713362 ?auto_713363 ?auto_713364 ?auto_713365 ?auto_713366 ?auto_713367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713412 - BLOCK
      ?auto_713413 - BLOCK
      ?auto_713414 - BLOCK
      ?auto_713415 - BLOCK
      ?auto_713416 - BLOCK
      ?auto_713417 - BLOCK
      ?auto_713418 - BLOCK
      ?auto_713419 - BLOCK
      ?auto_713420 - BLOCK
      ?auto_713421 - BLOCK
      ?auto_713422 - BLOCK
      ?auto_713423 - BLOCK
      ?auto_713424 - BLOCK
      ?auto_713425 - BLOCK
    )
    :vars
    (
      ?auto_713426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713425 ?auto_713426 ) ( ON-TABLE ?auto_713412 ) ( ON ?auto_713413 ?auto_713412 ) ( ON ?auto_713414 ?auto_713413 ) ( ON ?auto_713415 ?auto_713414 ) ( ON ?auto_713416 ?auto_713415 ) ( ON ?auto_713417 ?auto_713416 ) ( ON ?auto_713418 ?auto_713417 ) ( ON ?auto_713419 ?auto_713418 ) ( ON ?auto_713420 ?auto_713419 ) ( ON ?auto_713421 ?auto_713420 ) ( ON ?auto_713422 ?auto_713421 ) ( not ( = ?auto_713412 ?auto_713413 ) ) ( not ( = ?auto_713412 ?auto_713414 ) ) ( not ( = ?auto_713412 ?auto_713415 ) ) ( not ( = ?auto_713412 ?auto_713416 ) ) ( not ( = ?auto_713412 ?auto_713417 ) ) ( not ( = ?auto_713412 ?auto_713418 ) ) ( not ( = ?auto_713412 ?auto_713419 ) ) ( not ( = ?auto_713412 ?auto_713420 ) ) ( not ( = ?auto_713412 ?auto_713421 ) ) ( not ( = ?auto_713412 ?auto_713422 ) ) ( not ( = ?auto_713412 ?auto_713423 ) ) ( not ( = ?auto_713412 ?auto_713424 ) ) ( not ( = ?auto_713412 ?auto_713425 ) ) ( not ( = ?auto_713412 ?auto_713426 ) ) ( not ( = ?auto_713413 ?auto_713414 ) ) ( not ( = ?auto_713413 ?auto_713415 ) ) ( not ( = ?auto_713413 ?auto_713416 ) ) ( not ( = ?auto_713413 ?auto_713417 ) ) ( not ( = ?auto_713413 ?auto_713418 ) ) ( not ( = ?auto_713413 ?auto_713419 ) ) ( not ( = ?auto_713413 ?auto_713420 ) ) ( not ( = ?auto_713413 ?auto_713421 ) ) ( not ( = ?auto_713413 ?auto_713422 ) ) ( not ( = ?auto_713413 ?auto_713423 ) ) ( not ( = ?auto_713413 ?auto_713424 ) ) ( not ( = ?auto_713413 ?auto_713425 ) ) ( not ( = ?auto_713413 ?auto_713426 ) ) ( not ( = ?auto_713414 ?auto_713415 ) ) ( not ( = ?auto_713414 ?auto_713416 ) ) ( not ( = ?auto_713414 ?auto_713417 ) ) ( not ( = ?auto_713414 ?auto_713418 ) ) ( not ( = ?auto_713414 ?auto_713419 ) ) ( not ( = ?auto_713414 ?auto_713420 ) ) ( not ( = ?auto_713414 ?auto_713421 ) ) ( not ( = ?auto_713414 ?auto_713422 ) ) ( not ( = ?auto_713414 ?auto_713423 ) ) ( not ( = ?auto_713414 ?auto_713424 ) ) ( not ( = ?auto_713414 ?auto_713425 ) ) ( not ( = ?auto_713414 ?auto_713426 ) ) ( not ( = ?auto_713415 ?auto_713416 ) ) ( not ( = ?auto_713415 ?auto_713417 ) ) ( not ( = ?auto_713415 ?auto_713418 ) ) ( not ( = ?auto_713415 ?auto_713419 ) ) ( not ( = ?auto_713415 ?auto_713420 ) ) ( not ( = ?auto_713415 ?auto_713421 ) ) ( not ( = ?auto_713415 ?auto_713422 ) ) ( not ( = ?auto_713415 ?auto_713423 ) ) ( not ( = ?auto_713415 ?auto_713424 ) ) ( not ( = ?auto_713415 ?auto_713425 ) ) ( not ( = ?auto_713415 ?auto_713426 ) ) ( not ( = ?auto_713416 ?auto_713417 ) ) ( not ( = ?auto_713416 ?auto_713418 ) ) ( not ( = ?auto_713416 ?auto_713419 ) ) ( not ( = ?auto_713416 ?auto_713420 ) ) ( not ( = ?auto_713416 ?auto_713421 ) ) ( not ( = ?auto_713416 ?auto_713422 ) ) ( not ( = ?auto_713416 ?auto_713423 ) ) ( not ( = ?auto_713416 ?auto_713424 ) ) ( not ( = ?auto_713416 ?auto_713425 ) ) ( not ( = ?auto_713416 ?auto_713426 ) ) ( not ( = ?auto_713417 ?auto_713418 ) ) ( not ( = ?auto_713417 ?auto_713419 ) ) ( not ( = ?auto_713417 ?auto_713420 ) ) ( not ( = ?auto_713417 ?auto_713421 ) ) ( not ( = ?auto_713417 ?auto_713422 ) ) ( not ( = ?auto_713417 ?auto_713423 ) ) ( not ( = ?auto_713417 ?auto_713424 ) ) ( not ( = ?auto_713417 ?auto_713425 ) ) ( not ( = ?auto_713417 ?auto_713426 ) ) ( not ( = ?auto_713418 ?auto_713419 ) ) ( not ( = ?auto_713418 ?auto_713420 ) ) ( not ( = ?auto_713418 ?auto_713421 ) ) ( not ( = ?auto_713418 ?auto_713422 ) ) ( not ( = ?auto_713418 ?auto_713423 ) ) ( not ( = ?auto_713418 ?auto_713424 ) ) ( not ( = ?auto_713418 ?auto_713425 ) ) ( not ( = ?auto_713418 ?auto_713426 ) ) ( not ( = ?auto_713419 ?auto_713420 ) ) ( not ( = ?auto_713419 ?auto_713421 ) ) ( not ( = ?auto_713419 ?auto_713422 ) ) ( not ( = ?auto_713419 ?auto_713423 ) ) ( not ( = ?auto_713419 ?auto_713424 ) ) ( not ( = ?auto_713419 ?auto_713425 ) ) ( not ( = ?auto_713419 ?auto_713426 ) ) ( not ( = ?auto_713420 ?auto_713421 ) ) ( not ( = ?auto_713420 ?auto_713422 ) ) ( not ( = ?auto_713420 ?auto_713423 ) ) ( not ( = ?auto_713420 ?auto_713424 ) ) ( not ( = ?auto_713420 ?auto_713425 ) ) ( not ( = ?auto_713420 ?auto_713426 ) ) ( not ( = ?auto_713421 ?auto_713422 ) ) ( not ( = ?auto_713421 ?auto_713423 ) ) ( not ( = ?auto_713421 ?auto_713424 ) ) ( not ( = ?auto_713421 ?auto_713425 ) ) ( not ( = ?auto_713421 ?auto_713426 ) ) ( not ( = ?auto_713422 ?auto_713423 ) ) ( not ( = ?auto_713422 ?auto_713424 ) ) ( not ( = ?auto_713422 ?auto_713425 ) ) ( not ( = ?auto_713422 ?auto_713426 ) ) ( not ( = ?auto_713423 ?auto_713424 ) ) ( not ( = ?auto_713423 ?auto_713425 ) ) ( not ( = ?auto_713423 ?auto_713426 ) ) ( not ( = ?auto_713424 ?auto_713425 ) ) ( not ( = ?auto_713424 ?auto_713426 ) ) ( not ( = ?auto_713425 ?auto_713426 ) ) ( ON ?auto_713424 ?auto_713425 ) ( CLEAR ?auto_713422 ) ( ON ?auto_713423 ?auto_713424 ) ( CLEAR ?auto_713423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_713412 ?auto_713413 ?auto_713414 ?auto_713415 ?auto_713416 ?auto_713417 ?auto_713418 ?auto_713419 ?auto_713420 ?auto_713421 ?auto_713422 ?auto_713423 )
      ( MAKE-14PILE ?auto_713412 ?auto_713413 ?auto_713414 ?auto_713415 ?auto_713416 ?auto_713417 ?auto_713418 ?auto_713419 ?auto_713420 ?auto_713421 ?auto_713422 ?auto_713423 ?auto_713424 ?auto_713425 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713470 - BLOCK
      ?auto_713471 - BLOCK
      ?auto_713472 - BLOCK
      ?auto_713473 - BLOCK
      ?auto_713474 - BLOCK
      ?auto_713475 - BLOCK
      ?auto_713476 - BLOCK
      ?auto_713477 - BLOCK
      ?auto_713478 - BLOCK
      ?auto_713479 - BLOCK
      ?auto_713480 - BLOCK
      ?auto_713481 - BLOCK
      ?auto_713482 - BLOCK
      ?auto_713483 - BLOCK
    )
    :vars
    (
      ?auto_713484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713483 ?auto_713484 ) ( ON-TABLE ?auto_713470 ) ( ON ?auto_713471 ?auto_713470 ) ( ON ?auto_713472 ?auto_713471 ) ( ON ?auto_713473 ?auto_713472 ) ( ON ?auto_713474 ?auto_713473 ) ( ON ?auto_713475 ?auto_713474 ) ( ON ?auto_713476 ?auto_713475 ) ( ON ?auto_713477 ?auto_713476 ) ( ON ?auto_713478 ?auto_713477 ) ( ON ?auto_713479 ?auto_713478 ) ( not ( = ?auto_713470 ?auto_713471 ) ) ( not ( = ?auto_713470 ?auto_713472 ) ) ( not ( = ?auto_713470 ?auto_713473 ) ) ( not ( = ?auto_713470 ?auto_713474 ) ) ( not ( = ?auto_713470 ?auto_713475 ) ) ( not ( = ?auto_713470 ?auto_713476 ) ) ( not ( = ?auto_713470 ?auto_713477 ) ) ( not ( = ?auto_713470 ?auto_713478 ) ) ( not ( = ?auto_713470 ?auto_713479 ) ) ( not ( = ?auto_713470 ?auto_713480 ) ) ( not ( = ?auto_713470 ?auto_713481 ) ) ( not ( = ?auto_713470 ?auto_713482 ) ) ( not ( = ?auto_713470 ?auto_713483 ) ) ( not ( = ?auto_713470 ?auto_713484 ) ) ( not ( = ?auto_713471 ?auto_713472 ) ) ( not ( = ?auto_713471 ?auto_713473 ) ) ( not ( = ?auto_713471 ?auto_713474 ) ) ( not ( = ?auto_713471 ?auto_713475 ) ) ( not ( = ?auto_713471 ?auto_713476 ) ) ( not ( = ?auto_713471 ?auto_713477 ) ) ( not ( = ?auto_713471 ?auto_713478 ) ) ( not ( = ?auto_713471 ?auto_713479 ) ) ( not ( = ?auto_713471 ?auto_713480 ) ) ( not ( = ?auto_713471 ?auto_713481 ) ) ( not ( = ?auto_713471 ?auto_713482 ) ) ( not ( = ?auto_713471 ?auto_713483 ) ) ( not ( = ?auto_713471 ?auto_713484 ) ) ( not ( = ?auto_713472 ?auto_713473 ) ) ( not ( = ?auto_713472 ?auto_713474 ) ) ( not ( = ?auto_713472 ?auto_713475 ) ) ( not ( = ?auto_713472 ?auto_713476 ) ) ( not ( = ?auto_713472 ?auto_713477 ) ) ( not ( = ?auto_713472 ?auto_713478 ) ) ( not ( = ?auto_713472 ?auto_713479 ) ) ( not ( = ?auto_713472 ?auto_713480 ) ) ( not ( = ?auto_713472 ?auto_713481 ) ) ( not ( = ?auto_713472 ?auto_713482 ) ) ( not ( = ?auto_713472 ?auto_713483 ) ) ( not ( = ?auto_713472 ?auto_713484 ) ) ( not ( = ?auto_713473 ?auto_713474 ) ) ( not ( = ?auto_713473 ?auto_713475 ) ) ( not ( = ?auto_713473 ?auto_713476 ) ) ( not ( = ?auto_713473 ?auto_713477 ) ) ( not ( = ?auto_713473 ?auto_713478 ) ) ( not ( = ?auto_713473 ?auto_713479 ) ) ( not ( = ?auto_713473 ?auto_713480 ) ) ( not ( = ?auto_713473 ?auto_713481 ) ) ( not ( = ?auto_713473 ?auto_713482 ) ) ( not ( = ?auto_713473 ?auto_713483 ) ) ( not ( = ?auto_713473 ?auto_713484 ) ) ( not ( = ?auto_713474 ?auto_713475 ) ) ( not ( = ?auto_713474 ?auto_713476 ) ) ( not ( = ?auto_713474 ?auto_713477 ) ) ( not ( = ?auto_713474 ?auto_713478 ) ) ( not ( = ?auto_713474 ?auto_713479 ) ) ( not ( = ?auto_713474 ?auto_713480 ) ) ( not ( = ?auto_713474 ?auto_713481 ) ) ( not ( = ?auto_713474 ?auto_713482 ) ) ( not ( = ?auto_713474 ?auto_713483 ) ) ( not ( = ?auto_713474 ?auto_713484 ) ) ( not ( = ?auto_713475 ?auto_713476 ) ) ( not ( = ?auto_713475 ?auto_713477 ) ) ( not ( = ?auto_713475 ?auto_713478 ) ) ( not ( = ?auto_713475 ?auto_713479 ) ) ( not ( = ?auto_713475 ?auto_713480 ) ) ( not ( = ?auto_713475 ?auto_713481 ) ) ( not ( = ?auto_713475 ?auto_713482 ) ) ( not ( = ?auto_713475 ?auto_713483 ) ) ( not ( = ?auto_713475 ?auto_713484 ) ) ( not ( = ?auto_713476 ?auto_713477 ) ) ( not ( = ?auto_713476 ?auto_713478 ) ) ( not ( = ?auto_713476 ?auto_713479 ) ) ( not ( = ?auto_713476 ?auto_713480 ) ) ( not ( = ?auto_713476 ?auto_713481 ) ) ( not ( = ?auto_713476 ?auto_713482 ) ) ( not ( = ?auto_713476 ?auto_713483 ) ) ( not ( = ?auto_713476 ?auto_713484 ) ) ( not ( = ?auto_713477 ?auto_713478 ) ) ( not ( = ?auto_713477 ?auto_713479 ) ) ( not ( = ?auto_713477 ?auto_713480 ) ) ( not ( = ?auto_713477 ?auto_713481 ) ) ( not ( = ?auto_713477 ?auto_713482 ) ) ( not ( = ?auto_713477 ?auto_713483 ) ) ( not ( = ?auto_713477 ?auto_713484 ) ) ( not ( = ?auto_713478 ?auto_713479 ) ) ( not ( = ?auto_713478 ?auto_713480 ) ) ( not ( = ?auto_713478 ?auto_713481 ) ) ( not ( = ?auto_713478 ?auto_713482 ) ) ( not ( = ?auto_713478 ?auto_713483 ) ) ( not ( = ?auto_713478 ?auto_713484 ) ) ( not ( = ?auto_713479 ?auto_713480 ) ) ( not ( = ?auto_713479 ?auto_713481 ) ) ( not ( = ?auto_713479 ?auto_713482 ) ) ( not ( = ?auto_713479 ?auto_713483 ) ) ( not ( = ?auto_713479 ?auto_713484 ) ) ( not ( = ?auto_713480 ?auto_713481 ) ) ( not ( = ?auto_713480 ?auto_713482 ) ) ( not ( = ?auto_713480 ?auto_713483 ) ) ( not ( = ?auto_713480 ?auto_713484 ) ) ( not ( = ?auto_713481 ?auto_713482 ) ) ( not ( = ?auto_713481 ?auto_713483 ) ) ( not ( = ?auto_713481 ?auto_713484 ) ) ( not ( = ?auto_713482 ?auto_713483 ) ) ( not ( = ?auto_713482 ?auto_713484 ) ) ( not ( = ?auto_713483 ?auto_713484 ) ) ( ON ?auto_713482 ?auto_713483 ) ( ON ?auto_713481 ?auto_713482 ) ( CLEAR ?auto_713479 ) ( ON ?auto_713480 ?auto_713481 ) ( CLEAR ?auto_713480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_713470 ?auto_713471 ?auto_713472 ?auto_713473 ?auto_713474 ?auto_713475 ?auto_713476 ?auto_713477 ?auto_713478 ?auto_713479 ?auto_713480 )
      ( MAKE-14PILE ?auto_713470 ?auto_713471 ?auto_713472 ?auto_713473 ?auto_713474 ?auto_713475 ?auto_713476 ?auto_713477 ?auto_713478 ?auto_713479 ?auto_713480 ?auto_713481 ?auto_713482 ?auto_713483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713528 - BLOCK
      ?auto_713529 - BLOCK
      ?auto_713530 - BLOCK
      ?auto_713531 - BLOCK
      ?auto_713532 - BLOCK
      ?auto_713533 - BLOCK
      ?auto_713534 - BLOCK
      ?auto_713535 - BLOCK
      ?auto_713536 - BLOCK
      ?auto_713537 - BLOCK
      ?auto_713538 - BLOCK
      ?auto_713539 - BLOCK
      ?auto_713540 - BLOCK
      ?auto_713541 - BLOCK
    )
    :vars
    (
      ?auto_713542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713541 ?auto_713542 ) ( ON-TABLE ?auto_713528 ) ( ON ?auto_713529 ?auto_713528 ) ( ON ?auto_713530 ?auto_713529 ) ( ON ?auto_713531 ?auto_713530 ) ( ON ?auto_713532 ?auto_713531 ) ( ON ?auto_713533 ?auto_713532 ) ( ON ?auto_713534 ?auto_713533 ) ( ON ?auto_713535 ?auto_713534 ) ( ON ?auto_713536 ?auto_713535 ) ( not ( = ?auto_713528 ?auto_713529 ) ) ( not ( = ?auto_713528 ?auto_713530 ) ) ( not ( = ?auto_713528 ?auto_713531 ) ) ( not ( = ?auto_713528 ?auto_713532 ) ) ( not ( = ?auto_713528 ?auto_713533 ) ) ( not ( = ?auto_713528 ?auto_713534 ) ) ( not ( = ?auto_713528 ?auto_713535 ) ) ( not ( = ?auto_713528 ?auto_713536 ) ) ( not ( = ?auto_713528 ?auto_713537 ) ) ( not ( = ?auto_713528 ?auto_713538 ) ) ( not ( = ?auto_713528 ?auto_713539 ) ) ( not ( = ?auto_713528 ?auto_713540 ) ) ( not ( = ?auto_713528 ?auto_713541 ) ) ( not ( = ?auto_713528 ?auto_713542 ) ) ( not ( = ?auto_713529 ?auto_713530 ) ) ( not ( = ?auto_713529 ?auto_713531 ) ) ( not ( = ?auto_713529 ?auto_713532 ) ) ( not ( = ?auto_713529 ?auto_713533 ) ) ( not ( = ?auto_713529 ?auto_713534 ) ) ( not ( = ?auto_713529 ?auto_713535 ) ) ( not ( = ?auto_713529 ?auto_713536 ) ) ( not ( = ?auto_713529 ?auto_713537 ) ) ( not ( = ?auto_713529 ?auto_713538 ) ) ( not ( = ?auto_713529 ?auto_713539 ) ) ( not ( = ?auto_713529 ?auto_713540 ) ) ( not ( = ?auto_713529 ?auto_713541 ) ) ( not ( = ?auto_713529 ?auto_713542 ) ) ( not ( = ?auto_713530 ?auto_713531 ) ) ( not ( = ?auto_713530 ?auto_713532 ) ) ( not ( = ?auto_713530 ?auto_713533 ) ) ( not ( = ?auto_713530 ?auto_713534 ) ) ( not ( = ?auto_713530 ?auto_713535 ) ) ( not ( = ?auto_713530 ?auto_713536 ) ) ( not ( = ?auto_713530 ?auto_713537 ) ) ( not ( = ?auto_713530 ?auto_713538 ) ) ( not ( = ?auto_713530 ?auto_713539 ) ) ( not ( = ?auto_713530 ?auto_713540 ) ) ( not ( = ?auto_713530 ?auto_713541 ) ) ( not ( = ?auto_713530 ?auto_713542 ) ) ( not ( = ?auto_713531 ?auto_713532 ) ) ( not ( = ?auto_713531 ?auto_713533 ) ) ( not ( = ?auto_713531 ?auto_713534 ) ) ( not ( = ?auto_713531 ?auto_713535 ) ) ( not ( = ?auto_713531 ?auto_713536 ) ) ( not ( = ?auto_713531 ?auto_713537 ) ) ( not ( = ?auto_713531 ?auto_713538 ) ) ( not ( = ?auto_713531 ?auto_713539 ) ) ( not ( = ?auto_713531 ?auto_713540 ) ) ( not ( = ?auto_713531 ?auto_713541 ) ) ( not ( = ?auto_713531 ?auto_713542 ) ) ( not ( = ?auto_713532 ?auto_713533 ) ) ( not ( = ?auto_713532 ?auto_713534 ) ) ( not ( = ?auto_713532 ?auto_713535 ) ) ( not ( = ?auto_713532 ?auto_713536 ) ) ( not ( = ?auto_713532 ?auto_713537 ) ) ( not ( = ?auto_713532 ?auto_713538 ) ) ( not ( = ?auto_713532 ?auto_713539 ) ) ( not ( = ?auto_713532 ?auto_713540 ) ) ( not ( = ?auto_713532 ?auto_713541 ) ) ( not ( = ?auto_713532 ?auto_713542 ) ) ( not ( = ?auto_713533 ?auto_713534 ) ) ( not ( = ?auto_713533 ?auto_713535 ) ) ( not ( = ?auto_713533 ?auto_713536 ) ) ( not ( = ?auto_713533 ?auto_713537 ) ) ( not ( = ?auto_713533 ?auto_713538 ) ) ( not ( = ?auto_713533 ?auto_713539 ) ) ( not ( = ?auto_713533 ?auto_713540 ) ) ( not ( = ?auto_713533 ?auto_713541 ) ) ( not ( = ?auto_713533 ?auto_713542 ) ) ( not ( = ?auto_713534 ?auto_713535 ) ) ( not ( = ?auto_713534 ?auto_713536 ) ) ( not ( = ?auto_713534 ?auto_713537 ) ) ( not ( = ?auto_713534 ?auto_713538 ) ) ( not ( = ?auto_713534 ?auto_713539 ) ) ( not ( = ?auto_713534 ?auto_713540 ) ) ( not ( = ?auto_713534 ?auto_713541 ) ) ( not ( = ?auto_713534 ?auto_713542 ) ) ( not ( = ?auto_713535 ?auto_713536 ) ) ( not ( = ?auto_713535 ?auto_713537 ) ) ( not ( = ?auto_713535 ?auto_713538 ) ) ( not ( = ?auto_713535 ?auto_713539 ) ) ( not ( = ?auto_713535 ?auto_713540 ) ) ( not ( = ?auto_713535 ?auto_713541 ) ) ( not ( = ?auto_713535 ?auto_713542 ) ) ( not ( = ?auto_713536 ?auto_713537 ) ) ( not ( = ?auto_713536 ?auto_713538 ) ) ( not ( = ?auto_713536 ?auto_713539 ) ) ( not ( = ?auto_713536 ?auto_713540 ) ) ( not ( = ?auto_713536 ?auto_713541 ) ) ( not ( = ?auto_713536 ?auto_713542 ) ) ( not ( = ?auto_713537 ?auto_713538 ) ) ( not ( = ?auto_713537 ?auto_713539 ) ) ( not ( = ?auto_713537 ?auto_713540 ) ) ( not ( = ?auto_713537 ?auto_713541 ) ) ( not ( = ?auto_713537 ?auto_713542 ) ) ( not ( = ?auto_713538 ?auto_713539 ) ) ( not ( = ?auto_713538 ?auto_713540 ) ) ( not ( = ?auto_713538 ?auto_713541 ) ) ( not ( = ?auto_713538 ?auto_713542 ) ) ( not ( = ?auto_713539 ?auto_713540 ) ) ( not ( = ?auto_713539 ?auto_713541 ) ) ( not ( = ?auto_713539 ?auto_713542 ) ) ( not ( = ?auto_713540 ?auto_713541 ) ) ( not ( = ?auto_713540 ?auto_713542 ) ) ( not ( = ?auto_713541 ?auto_713542 ) ) ( ON ?auto_713540 ?auto_713541 ) ( ON ?auto_713539 ?auto_713540 ) ( ON ?auto_713538 ?auto_713539 ) ( CLEAR ?auto_713536 ) ( ON ?auto_713537 ?auto_713538 ) ( CLEAR ?auto_713537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_713528 ?auto_713529 ?auto_713530 ?auto_713531 ?auto_713532 ?auto_713533 ?auto_713534 ?auto_713535 ?auto_713536 ?auto_713537 )
      ( MAKE-14PILE ?auto_713528 ?auto_713529 ?auto_713530 ?auto_713531 ?auto_713532 ?auto_713533 ?auto_713534 ?auto_713535 ?auto_713536 ?auto_713537 ?auto_713538 ?auto_713539 ?auto_713540 ?auto_713541 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713586 - BLOCK
      ?auto_713587 - BLOCK
      ?auto_713588 - BLOCK
      ?auto_713589 - BLOCK
      ?auto_713590 - BLOCK
      ?auto_713591 - BLOCK
      ?auto_713592 - BLOCK
      ?auto_713593 - BLOCK
      ?auto_713594 - BLOCK
      ?auto_713595 - BLOCK
      ?auto_713596 - BLOCK
      ?auto_713597 - BLOCK
      ?auto_713598 - BLOCK
      ?auto_713599 - BLOCK
    )
    :vars
    (
      ?auto_713600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713599 ?auto_713600 ) ( ON-TABLE ?auto_713586 ) ( ON ?auto_713587 ?auto_713586 ) ( ON ?auto_713588 ?auto_713587 ) ( ON ?auto_713589 ?auto_713588 ) ( ON ?auto_713590 ?auto_713589 ) ( ON ?auto_713591 ?auto_713590 ) ( ON ?auto_713592 ?auto_713591 ) ( ON ?auto_713593 ?auto_713592 ) ( not ( = ?auto_713586 ?auto_713587 ) ) ( not ( = ?auto_713586 ?auto_713588 ) ) ( not ( = ?auto_713586 ?auto_713589 ) ) ( not ( = ?auto_713586 ?auto_713590 ) ) ( not ( = ?auto_713586 ?auto_713591 ) ) ( not ( = ?auto_713586 ?auto_713592 ) ) ( not ( = ?auto_713586 ?auto_713593 ) ) ( not ( = ?auto_713586 ?auto_713594 ) ) ( not ( = ?auto_713586 ?auto_713595 ) ) ( not ( = ?auto_713586 ?auto_713596 ) ) ( not ( = ?auto_713586 ?auto_713597 ) ) ( not ( = ?auto_713586 ?auto_713598 ) ) ( not ( = ?auto_713586 ?auto_713599 ) ) ( not ( = ?auto_713586 ?auto_713600 ) ) ( not ( = ?auto_713587 ?auto_713588 ) ) ( not ( = ?auto_713587 ?auto_713589 ) ) ( not ( = ?auto_713587 ?auto_713590 ) ) ( not ( = ?auto_713587 ?auto_713591 ) ) ( not ( = ?auto_713587 ?auto_713592 ) ) ( not ( = ?auto_713587 ?auto_713593 ) ) ( not ( = ?auto_713587 ?auto_713594 ) ) ( not ( = ?auto_713587 ?auto_713595 ) ) ( not ( = ?auto_713587 ?auto_713596 ) ) ( not ( = ?auto_713587 ?auto_713597 ) ) ( not ( = ?auto_713587 ?auto_713598 ) ) ( not ( = ?auto_713587 ?auto_713599 ) ) ( not ( = ?auto_713587 ?auto_713600 ) ) ( not ( = ?auto_713588 ?auto_713589 ) ) ( not ( = ?auto_713588 ?auto_713590 ) ) ( not ( = ?auto_713588 ?auto_713591 ) ) ( not ( = ?auto_713588 ?auto_713592 ) ) ( not ( = ?auto_713588 ?auto_713593 ) ) ( not ( = ?auto_713588 ?auto_713594 ) ) ( not ( = ?auto_713588 ?auto_713595 ) ) ( not ( = ?auto_713588 ?auto_713596 ) ) ( not ( = ?auto_713588 ?auto_713597 ) ) ( not ( = ?auto_713588 ?auto_713598 ) ) ( not ( = ?auto_713588 ?auto_713599 ) ) ( not ( = ?auto_713588 ?auto_713600 ) ) ( not ( = ?auto_713589 ?auto_713590 ) ) ( not ( = ?auto_713589 ?auto_713591 ) ) ( not ( = ?auto_713589 ?auto_713592 ) ) ( not ( = ?auto_713589 ?auto_713593 ) ) ( not ( = ?auto_713589 ?auto_713594 ) ) ( not ( = ?auto_713589 ?auto_713595 ) ) ( not ( = ?auto_713589 ?auto_713596 ) ) ( not ( = ?auto_713589 ?auto_713597 ) ) ( not ( = ?auto_713589 ?auto_713598 ) ) ( not ( = ?auto_713589 ?auto_713599 ) ) ( not ( = ?auto_713589 ?auto_713600 ) ) ( not ( = ?auto_713590 ?auto_713591 ) ) ( not ( = ?auto_713590 ?auto_713592 ) ) ( not ( = ?auto_713590 ?auto_713593 ) ) ( not ( = ?auto_713590 ?auto_713594 ) ) ( not ( = ?auto_713590 ?auto_713595 ) ) ( not ( = ?auto_713590 ?auto_713596 ) ) ( not ( = ?auto_713590 ?auto_713597 ) ) ( not ( = ?auto_713590 ?auto_713598 ) ) ( not ( = ?auto_713590 ?auto_713599 ) ) ( not ( = ?auto_713590 ?auto_713600 ) ) ( not ( = ?auto_713591 ?auto_713592 ) ) ( not ( = ?auto_713591 ?auto_713593 ) ) ( not ( = ?auto_713591 ?auto_713594 ) ) ( not ( = ?auto_713591 ?auto_713595 ) ) ( not ( = ?auto_713591 ?auto_713596 ) ) ( not ( = ?auto_713591 ?auto_713597 ) ) ( not ( = ?auto_713591 ?auto_713598 ) ) ( not ( = ?auto_713591 ?auto_713599 ) ) ( not ( = ?auto_713591 ?auto_713600 ) ) ( not ( = ?auto_713592 ?auto_713593 ) ) ( not ( = ?auto_713592 ?auto_713594 ) ) ( not ( = ?auto_713592 ?auto_713595 ) ) ( not ( = ?auto_713592 ?auto_713596 ) ) ( not ( = ?auto_713592 ?auto_713597 ) ) ( not ( = ?auto_713592 ?auto_713598 ) ) ( not ( = ?auto_713592 ?auto_713599 ) ) ( not ( = ?auto_713592 ?auto_713600 ) ) ( not ( = ?auto_713593 ?auto_713594 ) ) ( not ( = ?auto_713593 ?auto_713595 ) ) ( not ( = ?auto_713593 ?auto_713596 ) ) ( not ( = ?auto_713593 ?auto_713597 ) ) ( not ( = ?auto_713593 ?auto_713598 ) ) ( not ( = ?auto_713593 ?auto_713599 ) ) ( not ( = ?auto_713593 ?auto_713600 ) ) ( not ( = ?auto_713594 ?auto_713595 ) ) ( not ( = ?auto_713594 ?auto_713596 ) ) ( not ( = ?auto_713594 ?auto_713597 ) ) ( not ( = ?auto_713594 ?auto_713598 ) ) ( not ( = ?auto_713594 ?auto_713599 ) ) ( not ( = ?auto_713594 ?auto_713600 ) ) ( not ( = ?auto_713595 ?auto_713596 ) ) ( not ( = ?auto_713595 ?auto_713597 ) ) ( not ( = ?auto_713595 ?auto_713598 ) ) ( not ( = ?auto_713595 ?auto_713599 ) ) ( not ( = ?auto_713595 ?auto_713600 ) ) ( not ( = ?auto_713596 ?auto_713597 ) ) ( not ( = ?auto_713596 ?auto_713598 ) ) ( not ( = ?auto_713596 ?auto_713599 ) ) ( not ( = ?auto_713596 ?auto_713600 ) ) ( not ( = ?auto_713597 ?auto_713598 ) ) ( not ( = ?auto_713597 ?auto_713599 ) ) ( not ( = ?auto_713597 ?auto_713600 ) ) ( not ( = ?auto_713598 ?auto_713599 ) ) ( not ( = ?auto_713598 ?auto_713600 ) ) ( not ( = ?auto_713599 ?auto_713600 ) ) ( ON ?auto_713598 ?auto_713599 ) ( ON ?auto_713597 ?auto_713598 ) ( ON ?auto_713596 ?auto_713597 ) ( ON ?auto_713595 ?auto_713596 ) ( CLEAR ?auto_713593 ) ( ON ?auto_713594 ?auto_713595 ) ( CLEAR ?auto_713594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_713586 ?auto_713587 ?auto_713588 ?auto_713589 ?auto_713590 ?auto_713591 ?auto_713592 ?auto_713593 ?auto_713594 )
      ( MAKE-14PILE ?auto_713586 ?auto_713587 ?auto_713588 ?auto_713589 ?auto_713590 ?auto_713591 ?auto_713592 ?auto_713593 ?auto_713594 ?auto_713595 ?auto_713596 ?auto_713597 ?auto_713598 ?auto_713599 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713644 - BLOCK
      ?auto_713645 - BLOCK
      ?auto_713646 - BLOCK
      ?auto_713647 - BLOCK
      ?auto_713648 - BLOCK
      ?auto_713649 - BLOCK
      ?auto_713650 - BLOCK
      ?auto_713651 - BLOCK
      ?auto_713652 - BLOCK
      ?auto_713653 - BLOCK
      ?auto_713654 - BLOCK
      ?auto_713655 - BLOCK
      ?auto_713656 - BLOCK
      ?auto_713657 - BLOCK
    )
    :vars
    (
      ?auto_713658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713657 ?auto_713658 ) ( ON-TABLE ?auto_713644 ) ( ON ?auto_713645 ?auto_713644 ) ( ON ?auto_713646 ?auto_713645 ) ( ON ?auto_713647 ?auto_713646 ) ( ON ?auto_713648 ?auto_713647 ) ( ON ?auto_713649 ?auto_713648 ) ( ON ?auto_713650 ?auto_713649 ) ( not ( = ?auto_713644 ?auto_713645 ) ) ( not ( = ?auto_713644 ?auto_713646 ) ) ( not ( = ?auto_713644 ?auto_713647 ) ) ( not ( = ?auto_713644 ?auto_713648 ) ) ( not ( = ?auto_713644 ?auto_713649 ) ) ( not ( = ?auto_713644 ?auto_713650 ) ) ( not ( = ?auto_713644 ?auto_713651 ) ) ( not ( = ?auto_713644 ?auto_713652 ) ) ( not ( = ?auto_713644 ?auto_713653 ) ) ( not ( = ?auto_713644 ?auto_713654 ) ) ( not ( = ?auto_713644 ?auto_713655 ) ) ( not ( = ?auto_713644 ?auto_713656 ) ) ( not ( = ?auto_713644 ?auto_713657 ) ) ( not ( = ?auto_713644 ?auto_713658 ) ) ( not ( = ?auto_713645 ?auto_713646 ) ) ( not ( = ?auto_713645 ?auto_713647 ) ) ( not ( = ?auto_713645 ?auto_713648 ) ) ( not ( = ?auto_713645 ?auto_713649 ) ) ( not ( = ?auto_713645 ?auto_713650 ) ) ( not ( = ?auto_713645 ?auto_713651 ) ) ( not ( = ?auto_713645 ?auto_713652 ) ) ( not ( = ?auto_713645 ?auto_713653 ) ) ( not ( = ?auto_713645 ?auto_713654 ) ) ( not ( = ?auto_713645 ?auto_713655 ) ) ( not ( = ?auto_713645 ?auto_713656 ) ) ( not ( = ?auto_713645 ?auto_713657 ) ) ( not ( = ?auto_713645 ?auto_713658 ) ) ( not ( = ?auto_713646 ?auto_713647 ) ) ( not ( = ?auto_713646 ?auto_713648 ) ) ( not ( = ?auto_713646 ?auto_713649 ) ) ( not ( = ?auto_713646 ?auto_713650 ) ) ( not ( = ?auto_713646 ?auto_713651 ) ) ( not ( = ?auto_713646 ?auto_713652 ) ) ( not ( = ?auto_713646 ?auto_713653 ) ) ( not ( = ?auto_713646 ?auto_713654 ) ) ( not ( = ?auto_713646 ?auto_713655 ) ) ( not ( = ?auto_713646 ?auto_713656 ) ) ( not ( = ?auto_713646 ?auto_713657 ) ) ( not ( = ?auto_713646 ?auto_713658 ) ) ( not ( = ?auto_713647 ?auto_713648 ) ) ( not ( = ?auto_713647 ?auto_713649 ) ) ( not ( = ?auto_713647 ?auto_713650 ) ) ( not ( = ?auto_713647 ?auto_713651 ) ) ( not ( = ?auto_713647 ?auto_713652 ) ) ( not ( = ?auto_713647 ?auto_713653 ) ) ( not ( = ?auto_713647 ?auto_713654 ) ) ( not ( = ?auto_713647 ?auto_713655 ) ) ( not ( = ?auto_713647 ?auto_713656 ) ) ( not ( = ?auto_713647 ?auto_713657 ) ) ( not ( = ?auto_713647 ?auto_713658 ) ) ( not ( = ?auto_713648 ?auto_713649 ) ) ( not ( = ?auto_713648 ?auto_713650 ) ) ( not ( = ?auto_713648 ?auto_713651 ) ) ( not ( = ?auto_713648 ?auto_713652 ) ) ( not ( = ?auto_713648 ?auto_713653 ) ) ( not ( = ?auto_713648 ?auto_713654 ) ) ( not ( = ?auto_713648 ?auto_713655 ) ) ( not ( = ?auto_713648 ?auto_713656 ) ) ( not ( = ?auto_713648 ?auto_713657 ) ) ( not ( = ?auto_713648 ?auto_713658 ) ) ( not ( = ?auto_713649 ?auto_713650 ) ) ( not ( = ?auto_713649 ?auto_713651 ) ) ( not ( = ?auto_713649 ?auto_713652 ) ) ( not ( = ?auto_713649 ?auto_713653 ) ) ( not ( = ?auto_713649 ?auto_713654 ) ) ( not ( = ?auto_713649 ?auto_713655 ) ) ( not ( = ?auto_713649 ?auto_713656 ) ) ( not ( = ?auto_713649 ?auto_713657 ) ) ( not ( = ?auto_713649 ?auto_713658 ) ) ( not ( = ?auto_713650 ?auto_713651 ) ) ( not ( = ?auto_713650 ?auto_713652 ) ) ( not ( = ?auto_713650 ?auto_713653 ) ) ( not ( = ?auto_713650 ?auto_713654 ) ) ( not ( = ?auto_713650 ?auto_713655 ) ) ( not ( = ?auto_713650 ?auto_713656 ) ) ( not ( = ?auto_713650 ?auto_713657 ) ) ( not ( = ?auto_713650 ?auto_713658 ) ) ( not ( = ?auto_713651 ?auto_713652 ) ) ( not ( = ?auto_713651 ?auto_713653 ) ) ( not ( = ?auto_713651 ?auto_713654 ) ) ( not ( = ?auto_713651 ?auto_713655 ) ) ( not ( = ?auto_713651 ?auto_713656 ) ) ( not ( = ?auto_713651 ?auto_713657 ) ) ( not ( = ?auto_713651 ?auto_713658 ) ) ( not ( = ?auto_713652 ?auto_713653 ) ) ( not ( = ?auto_713652 ?auto_713654 ) ) ( not ( = ?auto_713652 ?auto_713655 ) ) ( not ( = ?auto_713652 ?auto_713656 ) ) ( not ( = ?auto_713652 ?auto_713657 ) ) ( not ( = ?auto_713652 ?auto_713658 ) ) ( not ( = ?auto_713653 ?auto_713654 ) ) ( not ( = ?auto_713653 ?auto_713655 ) ) ( not ( = ?auto_713653 ?auto_713656 ) ) ( not ( = ?auto_713653 ?auto_713657 ) ) ( not ( = ?auto_713653 ?auto_713658 ) ) ( not ( = ?auto_713654 ?auto_713655 ) ) ( not ( = ?auto_713654 ?auto_713656 ) ) ( not ( = ?auto_713654 ?auto_713657 ) ) ( not ( = ?auto_713654 ?auto_713658 ) ) ( not ( = ?auto_713655 ?auto_713656 ) ) ( not ( = ?auto_713655 ?auto_713657 ) ) ( not ( = ?auto_713655 ?auto_713658 ) ) ( not ( = ?auto_713656 ?auto_713657 ) ) ( not ( = ?auto_713656 ?auto_713658 ) ) ( not ( = ?auto_713657 ?auto_713658 ) ) ( ON ?auto_713656 ?auto_713657 ) ( ON ?auto_713655 ?auto_713656 ) ( ON ?auto_713654 ?auto_713655 ) ( ON ?auto_713653 ?auto_713654 ) ( ON ?auto_713652 ?auto_713653 ) ( CLEAR ?auto_713650 ) ( ON ?auto_713651 ?auto_713652 ) ( CLEAR ?auto_713651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_713644 ?auto_713645 ?auto_713646 ?auto_713647 ?auto_713648 ?auto_713649 ?auto_713650 ?auto_713651 )
      ( MAKE-14PILE ?auto_713644 ?auto_713645 ?auto_713646 ?auto_713647 ?auto_713648 ?auto_713649 ?auto_713650 ?auto_713651 ?auto_713652 ?auto_713653 ?auto_713654 ?auto_713655 ?auto_713656 ?auto_713657 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713702 - BLOCK
      ?auto_713703 - BLOCK
      ?auto_713704 - BLOCK
      ?auto_713705 - BLOCK
      ?auto_713706 - BLOCK
      ?auto_713707 - BLOCK
      ?auto_713708 - BLOCK
      ?auto_713709 - BLOCK
      ?auto_713710 - BLOCK
      ?auto_713711 - BLOCK
      ?auto_713712 - BLOCK
      ?auto_713713 - BLOCK
      ?auto_713714 - BLOCK
      ?auto_713715 - BLOCK
    )
    :vars
    (
      ?auto_713716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713715 ?auto_713716 ) ( ON-TABLE ?auto_713702 ) ( ON ?auto_713703 ?auto_713702 ) ( ON ?auto_713704 ?auto_713703 ) ( ON ?auto_713705 ?auto_713704 ) ( ON ?auto_713706 ?auto_713705 ) ( ON ?auto_713707 ?auto_713706 ) ( not ( = ?auto_713702 ?auto_713703 ) ) ( not ( = ?auto_713702 ?auto_713704 ) ) ( not ( = ?auto_713702 ?auto_713705 ) ) ( not ( = ?auto_713702 ?auto_713706 ) ) ( not ( = ?auto_713702 ?auto_713707 ) ) ( not ( = ?auto_713702 ?auto_713708 ) ) ( not ( = ?auto_713702 ?auto_713709 ) ) ( not ( = ?auto_713702 ?auto_713710 ) ) ( not ( = ?auto_713702 ?auto_713711 ) ) ( not ( = ?auto_713702 ?auto_713712 ) ) ( not ( = ?auto_713702 ?auto_713713 ) ) ( not ( = ?auto_713702 ?auto_713714 ) ) ( not ( = ?auto_713702 ?auto_713715 ) ) ( not ( = ?auto_713702 ?auto_713716 ) ) ( not ( = ?auto_713703 ?auto_713704 ) ) ( not ( = ?auto_713703 ?auto_713705 ) ) ( not ( = ?auto_713703 ?auto_713706 ) ) ( not ( = ?auto_713703 ?auto_713707 ) ) ( not ( = ?auto_713703 ?auto_713708 ) ) ( not ( = ?auto_713703 ?auto_713709 ) ) ( not ( = ?auto_713703 ?auto_713710 ) ) ( not ( = ?auto_713703 ?auto_713711 ) ) ( not ( = ?auto_713703 ?auto_713712 ) ) ( not ( = ?auto_713703 ?auto_713713 ) ) ( not ( = ?auto_713703 ?auto_713714 ) ) ( not ( = ?auto_713703 ?auto_713715 ) ) ( not ( = ?auto_713703 ?auto_713716 ) ) ( not ( = ?auto_713704 ?auto_713705 ) ) ( not ( = ?auto_713704 ?auto_713706 ) ) ( not ( = ?auto_713704 ?auto_713707 ) ) ( not ( = ?auto_713704 ?auto_713708 ) ) ( not ( = ?auto_713704 ?auto_713709 ) ) ( not ( = ?auto_713704 ?auto_713710 ) ) ( not ( = ?auto_713704 ?auto_713711 ) ) ( not ( = ?auto_713704 ?auto_713712 ) ) ( not ( = ?auto_713704 ?auto_713713 ) ) ( not ( = ?auto_713704 ?auto_713714 ) ) ( not ( = ?auto_713704 ?auto_713715 ) ) ( not ( = ?auto_713704 ?auto_713716 ) ) ( not ( = ?auto_713705 ?auto_713706 ) ) ( not ( = ?auto_713705 ?auto_713707 ) ) ( not ( = ?auto_713705 ?auto_713708 ) ) ( not ( = ?auto_713705 ?auto_713709 ) ) ( not ( = ?auto_713705 ?auto_713710 ) ) ( not ( = ?auto_713705 ?auto_713711 ) ) ( not ( = ?auto_713705 ?auto_713712 ) ) ( not ( = ?auto_713705 ?auto_713713 ) ) ( not ( = ?auto_713705 ?auto_713714 ) ) ( not ( = ?auto_713705 ?auto_713715 ) ) ( not ( = ?auto_713705 ?auto_713716 ) ) ( not ( = ?auto_713706 ?auto_713707 ) ) ( not ( = ?auto_713706 ?auto_713708 ) ) ( not ( = ?auto_713706 ?auto_713709 ) ) ( not ( = ?auto_713706 ?auto_713710 ) ) ( not ( = ?auto_713706 ?auto_713711 ) ) ( not ( = ?auto_713706 ?auto_713712 ) ) ( not ( = ?auto_713706 ?auto_713713 ) ) ( not ( = ?auto_713706 ?auto_713714 ) ) ( not ( = ?auto_713706 ?auto_713715 ) ) ( not ( = ?auto_713706 ?auto_713716 ) ) ( not ( = ?auto_713707 ?auto_713708 ) ) ( not ( = ?auto_713707 ?auto_713709 ) ) ( not ( = ?auto_713707 ?auto_713710 ) ) ( not ( = ?auto_713707 ?auto_713711 ) ) ( not ( = ?auto_713707 ?auto_713712 ) ) ( not ( = ?auto_713707 ?auto_713713 ) ) ( not ( = ?auto_713707 ?auto_713714 ) ) ( not ( = ?auto_713707 ?auto_713715 ) ) ( not ( = ?auto_713707 ?auto_713716 ) ) ( not ( = ?auto_713708 ?auto_713709 ) ) ( not ( = ?auto_713708 ?auto_713710 ) ) ( not ( = ?auto_713708 ?auto_713711 ) ) ( not ( = ?auto_713708 ?auto_713712 ) ) ( not ( = ?auto_713708 ?auto_713713 ) ) ( not ( = ?auto_713708 ?auto_713714 ) ) ( not ( = ?auto_713708 ?auto_713715 ) ) ( not ( = ?auto_713708 ?auto_713716 ) ) ( not ( = ?auto_713709 ?auto_713710 ) ) ( not ( = ?auto_713709 ?auto_713711 ) ) ( not ( = ?auto_713709 ?auto_713712 ) ) ( not ( = ?auto_713709 ?auto_713713 ) ) ( not ( = ?auto_713709 ?auto_713714 ) ) ( not ( = ?auto_713709 ?auto_713715 ) ) ( not ( = ?auto_713709 ?auto_713716 ) ) ( not ( = ?auto_713710 ?auto_713711 ) ) ( not ( = ?auto_713710 ?auto_713712 ) ) ( not ( = ?auto_713710 ?auto_713713 ) ) ( not ( = ?auto_713710 ?auto_713714 ) ) ( not ( = ?auto_713710 ?auto_713715 ) ) ( not ( = ?auto_713710 ?auto_713716 ) ) ( not ( = ?auto_713711 ?auto_713712 ) ) ( not ( = ?auto_713711 ?auto_713713 ) ) ( not ( = ?auto_713711 ?auto_713714 ) ) ( not ( = ?auto_713711 ?auto_713715 ) ) ( not ( = ?auto_713711 ?auto_713716 ) ) ( not ( = ?auto_713712 ?auto_713713 ) ) ( not ( = ?auto_713712 ?auto_713714 ) ) ( not ( = ?auto_713712 ?auto_713715 ) ) ( not ( = ?auto_713712 ?auto_713716 ) ) ( not ( = ?auto_713713 ?auto_713714 ) ) ( not ( = ?auto_713713 ?auto_713715 ) ) ( not ( = ?auto_713713 ?auto_713716 ) ) ( not ( = ?auto_713714 ?auto_713715 ) ) ( not ( = ?auto_713714 ?auto_713716 ) ) ( not ( = ?auto_713715 ?auto_713716 ) ) ( ON ?auto_713714 ?auto_713715 ) ( ON ?auto_713713 ?auto_713714 ) ( ON ?auto_713712 ?auto_713713 ) ( ON ?auto_713711 ?auto_713712 ) ( ON ?auto_713710 ?auto_713711 ) ( ON ?auto_713709 ?auto_713710 ) ( CLEAR ?auto_713707 ) ( ON ?auto_713708 ?auto_713709 ) ( CLEAR ?auto_713708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_713702 ?auto_713703 ?auto_713704 ?auto_713705 ?auto_713706 ?auto_713707 ?auto_713708 )
      ( MAKE-14PILE ?auto_713702 ?auto_713703 ?auto_713704 ?auto_713705 ?auto_713706 ?auto_713707 ?auto_713708 ?auto_713709 ?auto_713710 ?auto_713711 ?auto_713712 ?auto_713713 ?auto_713714 ?auto_713715 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713760 - BLOCK
      ?auto_713761 - BLOCK
      ?auto_713762 - BLOCK
      ?auto_713763 - BLOCK
      ?auto_713764 - BLOCK
      ?auto_713765 - BLOCK
      ?auto_713766 - BLOCK
      ?auto_713767 - BLOCK
      ?auto_713768 - BLOCK
      ?auto_713769 - BLOCK
      ?auto_713770 - BLOCK
      ?auto_713771 - BLOCK
      ?auto_713772 - BLOCK
      ?auto_713773 - BLOCK
    )
    :vars
    (
      ?auto_713774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713773 ?auto_713774 ) ( ON-TABLE ?auto_713760 ) ( ON ?auto_713761 ?auto_713760 ) ( ON ?auto_713762 ?auto_713761 ) ( ON ?auto_713763 ?auto_713762 ) ( ON ?auto_713764 ?auto_713763 ) ( not ( = ?auto_713760 ?auto_713761 ) ) ( not ( = ?auto_713760 ?auto_713762 ) ) ( not ( = ?auto_713760 ?auto_713763 ) ) ( not ( = ?auto_713760 ?auto_713764 ) ) ( not ( = ?auto_713760 ?auto_713765 ) ) ( not ( = ?auto_713760 ?auto_713766 ) ) ( not ( = ?auto_713760 ?auto_713767 ) ) ( not ( = ?auto_713760 ?auto_713768 ) ) ( not ( = ?auto_713760 ?auto_713769 ) ) ( not ( = ?auto_713760 ?auto_713770 ) ) ( not ( = ?auto_713760 ?auto_713771 ) ) ( not ( = ?auto_713760 ?auto_713772 ) ) ( not ( = ?auto_713760 ?auto_713773 ) ) ( not ( = ?auto_713760 ?auto_713774 ) ) ( not ( = ?auto_713761 ?auto_713762 ) ) ( not ( = ?auto_713761 ?auto_713763 ) ) ( not ( = ?auto_713761 ?auto_713764 ) ) ( not ( = ?auto_713761 ?auto_713765 ) ) ( not ( = ?auto_713761 ?auto_713766 ) ) ( not ( = ?auto_713761 ?auto_713767 ) ) ( not ( = ?auto_713761 ?auto_713768 ) ) ( not ( = ?auto_713761 ?auto_713769 ) ) ( not ( = ?auto_713761 ?auto_713770 ) ) ( not ( = ?auto_713761 ?auto_713771 ) ) ( not ( = ?auto_713761 ?auto_713772 ) ) ( not ( = ?auto_713761 ?auto_713773 ) ) ( not ( = ?auto_713761 ?auto_713774 ) ) ( not ( = ?auto_713762 ?auto_713763 ) ) ( not ( = ?auto_713762 ?auto_713764 ) ) ( not ( = ?auto_713762 ?auto_713765 ) ) ( not ( = ?auto_713762 ?auto_713766 ) ) ( not ( = ?auto_713762 ?auto_713767 ) ) ( not ( = ?auto_713762 ?auto_713768 ) ) ( not ( = ?auto_713762 ?auto_713769 ) ) ( not ( = ?auto_713762 ?auto_713770 ) ) ( not ( = ?auto_713762 ?auto_713771 ) ) ( not ( = ?auto_713762 ?auto_713772 ) ) ( not ( = ?auto_713762 ?auto_713773 ) ) ( not ( = ?auto_713762 ?auto_713774 ) ) ( not ( = ?auto_713763 ?auto_713764 ) ) ( not ( = ?auto_713763 ?auto_713765 ) ) ( not ( = ?auto_713763 ?auto_713766 ) ) ( not ( = ?auto_713763 ?auto_713767 ) ) ( not ( = ?auto_713763 ?auto_713768 ) ) ( not ( = ?auto_713763 ?auto_713769 ) ) ( not ( = ?auto_713763 ?auto_713770 ) ) ( not ( = ?auto_713763 ?auto_713771 ) ) ( not ( = ?auto_713763 ?auto_713772 ) ) ( not ( = ?auto_713763 ?auto_713773 ) ) ( not ( = ?auto_713763 ?auto_713774 ) ) ( not ( = ?auto_713764 ?auto_713765 ) ) ( not ( = ?auto_713764 ?auto_713766 ) ) ( not ( = ?auto_713764 ?auto_713767 ) ) ( not ( = ?auto_713764 ?auto_713768 ) ) ( not ( = ?auto_713764 ?auto_713769 ) ) ( not ( = ?auto_713764 ?auto_713770 ) ) ( not ( = ?auto_713764 ?auto_713771 ) ) ( not ( = ?auto_713764 ?auto_713772 ) ) ( not ( = ?auto_713764 ?auto_713773 ) ) ( not ( = ?auto_713764 ?auto_713774 ) ) ( not ( = ?auto_713765 ?auto_713766 ) ) ( not ( = ?auto_713765 ?auto_713767 ) ) ( not ( = ?auto_713765 ?auto_713768 ) ) ( not ( = ?auto_713765 ?auto_713769 ) ) ( not ( = ?auto_713765 ?auto_713770 ) ) ( not ( = ?auto_713765 ?auto_713771 ) ) ( not ( = ?auto_713765 ?auto_713772 ) ) ( not ( = ?auto_713765 ?auto_713773 ) ) ( not ( = ?auto_713765 ?auto_713774 ) ) ( not ( = ?auto_713766 ?auto_713767 ) ) ( not ( = ?auto_713766 ?auto_713768 ) ) ( not ( = ?auto_713766 ?auto_713769 ) ) ( not ( = ?auto_713766 ?auto_713770 ) ) ( not ( = ?auto_713766 ?auto_713771 ) ) ( not ( = ?auto_713766 ?auto_713772 ) ) ( not ( = ?auto_713766 ?auto_713773 ) ) ( not ( = ?auto_713766 ?auto_713774 ) ) ( not ( = ?auto_713767 ?auto_713768 ) ) ( not ( = ?auto_713767 ?auto_713769 ) ) ( not ( = ?auto_713767 ?auto_713770 ) ) ( not ( = ?auto_713767 ?auto_713771 ) ) ( not ( = ?auto_713767 ?auto_713772 ) ) ( not ( = ?auto_713767 ?auto_713773 ) ) ( not ( = ?auto_713767 ?auto_713774 ) ) ( not ( = ?auto_713768 ?auto_713769 ) ) ( not ( = ?auto_713768 ?auto_713770 ) ) ( not ( = ?auto_713768 ?auto_713771 ) ) ( not ( = ?auto_713768 ?auto_713772 ) ) ( not ( = ?auto_713768 ?auto_713773 ) ) ( not ( = ?auto_713768 ?auto_713774 ) ) ( not ( = ?auto_713769 ?auto_713770 ) ) ( not ( = ?auto_713769 ?auto_713771 ) ) ( not ( = ?auto_713769 ?auto_713772 ) ) ( not ( = ?auto_713769 ?auto_713773 ) ) ( not ( = ?auto_713769 ?auto_713774 ) ) ( not ( = ?auto_713770 ?auto_713771 ) ) ( not ( = ?auto_713770 ?auto_713772 ) ) ( not ( = ?auto_713770 ?auto_713773 ) ) ( not ( = ?auto_713770 ?auto_713774 ) ) ( not ( = ?auto_713771 ?auto_713772 ) ) ( not ( = ?auto_713771 ?auto_713773 ) ) ( not ( = ?auto_713771 ?auto_713774 ) ) ( not ( = ?auto_713772 ?auto_713773 ) ) ( not ( = ?auto_713772 ?auto_713774 ) ) ( not ( = ?auto_713773 ?auto_713774 ) ) ( ON ?auto_713772 ?auto_713773 ) ( ON ?auto_713771 ?auto_713772 ) ( ON ?auto_713770 ?auto_713771 ) ( ON ?auto_713769 ?auto_713770 ) ( ON ?auto_713768 ?auto_713769 ) ( ON ?auto_713767 ?auto_713768 ) ( ON ?auto_713766 ?auto_713767 ) ( CLEAR ?auto_713764 ) ( ON ?auto_713765 ?auto_713766 ) ( CLEAR ?auto_713765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_713760 ?auto_713761 ?auto_713762 ?auto_713763 ?auto_713764 ?auto_713765 )
      ( MAKE-14PILE ?auto_713760 ?auto_713761 ?auto_713762 ?auto_713763 ?auto_713764 ?auto_713765 ?auto_713766 ?auto_713767 ?auto_713768 ?auto_713769 ?auto_713770 ?auto_713771 ?auto_713772 ?auto_713773 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713818 - BLOCK
      ?auto_713819 - BLOCK
      ?auto_713820 - BLOCK
      ?auto_713821 - BLOCK
      ?auto_713822 - BLOCK
      ?auto_713823 - BLOCK
      ?auto_713824 - BLOCK
      ?auto_713825 - BLOCK
      ?auto_713826 - BLOCK
      ?auto_713827 - BLOCK
      ?auto_713828 - BLOCK
      ?auto_713829 - BLOCK
      ?auto_713830 - BLOCK
      ?auto_713831 - BLOCK
    )
    :vars
    (
      ?auto_713832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713831 ?auto_713832 ) ( ON-TABLE ?auto_713818 ) ( ON ?auto_713819 ?auto_713818 ) ( ON ?auto_713820 ?auto_713819 ) ( ON ?auto_713821 ?auto_713820 ) ( not ( = ?auto_713818 ?auto_713819 ) ) ( not ( = ?auto_713818 ?auto_713820 ) ) ( not ( = ?auto_713818 ?auto_713821 ) ) ( not ( = ?auto_713818 ?auto_713822 ) ) ( not ( = ?auto_713818 ?auto_713823 ) ) ( not ( = ?auto_713818 ?auto_713824 ) ) ( not ( = ?auto_713818 ?auto_713825 ) ) ( not ( = ?auto_713818 ?auto_713826 ) ) ( not ( = ?auto_713818 ?auto_713827 ) ) ( not ( = ?auto_713818 ?auto_713828 ) ) ( not ( = ?auto_713818 ?auto_713829 ) ) ( not ( = ?auto_713818 ?auto_713830 ) ) ( not ( = ?auto_713818 ?auto_713831 ) ) ( not ( = ?auto_713818 ?auto_713832 ) ) ( not ( = ?auto_713819 ?auto_713820 ) ) ( not ( = ?auto_713819 ?auto_713821 ) ) ( not ( = ?auto_713819 ?auto_713822 ) ) ( not ( = ?auto_713819 ?auto_713823 ) ) ( not ( = ?auto_713819 ?auto_713824 ) ) ( not ( = ?auto_713819 ?auto_713825 ) ) ( not ( = ?auto_713819 ?auto_713826 ) ) ( not ( = ?auto_713819 ?auto_713827 ) ) ( not ( = ?auto_713819 ?auto_713828 ) ) ( not ( = ?auto_713819 ?auto_713829 ) ) ( not ( = ?auto_713819 ?auto_713830 ) ) ( not ( = ?auto_713819 ?auto_713831 ) ) ( not ( = ?auto_713819 ?auto_713832 ) ) ( not ( = ?auto_713820 ?auto_713821 ) ) ( not ( = ?auto_713820 ?auto_713822 ) ) ( not ( = ?auto_713820 ?auto_713823 ) ) ( not ( = ?auto_713820 ?auto_713824 ) ) ( not ( = ?auto_713820 ?auto_713825 ) ) ( not ( = ?auto_713820 ?auto_713826 ) ) ( not ( = ?auto_713820 ?auto_713827 ) ) ( not ( = ?auto_713820 ?auto_713828 ) ) ( not ( = ?auto_713820 ?auto_713829 ) ) ( not ( = ?auto_713820 ?auto_713830 ) ) ( not ( = ?auto_713820 ?auto_713831 ) ) ( not ( = ?auto_713820 ?auto_713832 ) ) ( not ( = ?auto_713821 ?auto_713822 ) ) ( not ( = ?auto_713821 ?auto_713823 ) ) ( not ( = ?auto_713821 ?auto_713824 ) ) ( not ( = ?auto_713821 ?auto_713825 ) ) ( not ( = ?auto_713821 ?auto_713826 ) ) ( not ( = ?auto_713821 ?auto_713827 ) ) ( not ( = ?auto_713821 ?auto_713828 ) ) ( not ( = ?auto_713821 ?auto_713829 ) ) ( not ( = ?auto_713821 ?auto_713830 ) ) ( not ( = ?auto_713821 ?auto_713831 ) ) ( not ( = ?auto_713821 ?auto_713832 ) ) ( not ( = ?auto_713822 ?auto_713823 ) ) ( not ( = ?auto_713822 ?auto_713824 ) ) ( not ( = ?auto_713822 ?auto_713825 ) ) ( not ( = ?auto_713822 ?auto_713826 ) ) ( not ( = ?auto_713822 ?auto_713827 ) ) ( not ( = ?auto_713822 ?auto_713828 ) ) ( not ( = ?auto_713822 ?auto_713829 ) ) ( not ( = ?auto_713822 ?auto_713830 ) ) ( not ( = ?auto_713822 ?auto_713831 ) ) ( not ( = ?auto_713822 ?auto_713832 ) ) ( not ( = ?auto_713823 ?auto_713824 ) ) ( not ( = ?auto_713823 ?auto_713825 ) ) ( not ( = ?auto_713823 ?auto_713826 ) ) ( not ( = ?auto_713823 ?auto_713827 ) ) ( not ( = ?auto_713823 ?auto_713828 ) ) ( not ( = ?auto_713823 ?auto_713829 ) ) ( not ( = ?auto_713823 ?auto_713830 ) ) ( not ( = ?auto_713823 ?auto_713831 ) ) ( not ( = ?auto_713823 ?auto_713832 ) ) ( not ( = ?auto_713824 ?auto_713825 ) ) ( not ( = ?auto_713824 ?auto_713826 ) ) ( not ( = ?auto_713824 ?auto_713827 ) ) ( not ( = ?auto_713824 ?auto_713828 ) ) ( not ( = ?auto_713824 ?auto_713829 ) ) ( not ( = ?auto_713824 ?auto_713830 ) ) ( not ( = ?auto_713824 ?auto_713831 ) ) ( not ( = ?auto_713824 ?auto_713832 ) ) ( not ( = ?auto_713825 ?auto_713826 ) ) ( not ( = ?auto_713825 ?auto_713827 ) ) ( not ( = ?auto_713825 ?auto_713828 ) ) ( not ( = ?auto_713825 ?auto_713829 ) ) ( not ( = ?auto_713825 ?auto_713830 ) ) ( not ( = ?auto_713825 ?auto_713831 ) ) ( not ( = ?auto_713825 ?auto_713832 ) ) ( not ( = ?auto_713826 ?auto_713827 ) ) ( not ( = ?auto_713826 ?auto_713828 ) ) ( not ( = ?auto_713826 ?auto_713829 ) ) ( not ( = ?auto_713826 ?auto_713830 ) ) ( not ( = ?auto_713826 ?auto_713831 ) ) ( not ( = ?auto_713826 ?auto_713832 ) ) ( not ( = ?auto_713827 ?auto_713828 ) ) ( not ( = ?auto_713827 ?auto_713829 ) ) ( not ( = ?auto_713827 ?auto_713830 ) ) ( not ( = ?auto_713827 ?auto_713831 ) ) ( not ( = ?auto_713827 ?auto_713832 ) ) ( not ( = ?auto_713828 ?auto_713829 ) ) ( not ( = ?auto_713828 ?auto_713830 ) ) ( not ( = ?auto_713828 ?auto_713831 ) ) ( not ( = ?auto_713828 ?auto_713832 ) ) ( not ( = ?auto_713829 ?auto_713830 ) ) ( not ( = ?auto_713829 ?auto_713831 ) ) ( not ( = ?auto_713829 ?auto_713832 ) ) ( not ( = ?auto_713830 ?auto_713831 ) ) ( not ( = ?auto_713830 ?auto_713832 ) ) ( not ( = ?auto_713831 ?auto_713832 ) ) ( ON ?auto_713830 ?auto_713831 ) ( ON ?auto_713829 ?auto_713830 ) ( ON ?auto_713828 ?auto_713829 ) ( ON ?auto_713827 ?auto_713828 ) ( ON ?auto_713826 ?auto_713827 ) ( ON ?auto_713825 ?auto_713826 ) ( ON ?auto_713824 ?auto_713825 ) ( ON ?auto_713823 ?auto_713824 ) ( CLEAR ?auto_713821 ) ( ON ?auto_713822 ?auto_713823 ) ( CLEAR ?auto_713822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_713818 ?auto_713819 ?auto_713820 ?auto_713821 ?auto_713822 )
      ( MAKE-14PILE ?auto_713818 ?auto_713819 ?auto_713820 ?auto_713821 ?auto_713822 ?auto_713823 ?auto_713824 ?auto_713825 ?auto_713826 ?auto_713827 ?auto_713828 ?auto_713829 ?auto_713830 ?auto_713831 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713876 - BLOCK
      ?auto_713877 - BLOCK
      ?auto_713878 - BLOCK
      ?auto_713879 - BLOCK
      ?auto_713880 - BLOCK
      ?auto_713881 - BLOCK
      ?auto_713882 - BLOCK
      ?auto_713883 - BLOCK
      ?auto_713884 - BLOCK
      ?auto_713885 - BLOCK
      ?auto_713886 - BLOCK
      ?auto_713887 - BLOCK
      ?auto_713888 - BLOCK
      ?auto_713889 - BLOCK
    )
    :vars
    (
      ?auto_713890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713889 ?auto_713890 ) ( ON-TABLE ?auto_713876 ) ( ON ?auto_713877 ?auto_713876 ) ( ON ?auto_713878 ?auto_713877 ) ( not ( = ?auto_713876 ?auto_713877 ) ) ( not ( = ?auto_713876 ?auto_713878 ) ) ( not ( = ?auto_713876 ?auto_713879 ) ) ( not ( = ?auto_713876 ?auto_713880 ) ) ( not ( = ?auto_713876 ?auto_713881 ) ) ( not ( = ?auto_713876 ?auto_713882 ) ) ( not ( = ?auto_713876 ?auto_713883 ) ) ( not ( = ?auto_713876 ?auto_713884 ) ) ( not ( = ?auto_713876 ?auto_713885 ) ) ( not ( = ?auto_713876 ?auto_713886 ) ) ( not ( = ?auto_713876 ?auto_713887 ) ) ( not ( = ?auto_713876 ?auto_713888 ) ) ( not ( = ?auto_713876 ?auto_713889 ) ) ( not ( = ?auto_713876 ?auto_713890 ) ) ( not ( = ?auto_713877 ?auto_713878 ) ) ( not ( = ?auto_713877 ?auto_713879 ) ) ( not ( = ?auto_713877 ?auto_713880 ) ) ( not ( = ?auto_713877 ?auto_713881 ) ) ( not ( = ?auto_713877 ?auto_713882 ) ) ( not ( = ?auto_713877 ?auto_713883 ) ) ( not ( = ?auto_713877 ?auto_713884 ) ) ( not ( = ?auto_713877 ?auto_713885 ) ) ( not ( = ?auto_713877 ?auto_713886 ) ) ( not ( = ?auto_713877 ?auto_713887 ) ) ( not ( = ?auto_713877 ?auto_713888 ) ) ( not ( = ?auto_713877 ?auto_713889 ) ) ( not ( = ?auto_713877 ?auto_713890 ) ) ( not ( = ?auto_713878 ?auto_713879 ) ) ( not ( = ?auto_713878 ?auto_713880 ) ) ( not ( = ?auto_713878 ?auto_713881 ) ) ( not ( = ?auto_713878 ?auto_713882 ) ) ( not ( = ?auto_713878 ?auto_713883 ) ) ( not ( = ?auto_713878 ?auto_713884 ) ) ( not ( = ?auto_713878 ?auto_713885 ) ) ( not ( = ?auto_713878 ?auto_713886 ) ) ( not ( = ?auto_713878 ?auto_713887 ) ) ( not ( = ?auto_713878 ?auto_713888 ) ) ( not ( = ?auto_713878 ?auto_713889 ) ) ( not ( = ?auto_713878 ?auto_713890 ) ) ( not ( = ?auto_713879 ?auto_713880 ) ) ( not ( = ?auto_713879 ?auto_713881 ) ) ( not ( = ?auto_713879 ?auto_713882 ) ) ( not ( = ?auto_713879 ?auto_713883 ) ) ( not ( = ?auto_713879 ?auto_713884 ) ) ( not ( = ?auto_713879 ?auto_713885 ) ) ( not ( = ?auto_713879 ?auto_713886 ) ) ( not ( = ?auto_713879 ?auto_713887 ) ) ( not ( = ?auto_713879 ?auto_713888 ) ) ( not ( = ?auto_713879 ?auto_713889 ) ) ( not ( = ?auto_713879 ?auto_713890 ) ) ( not ( = ?auto_713880 ?auto_713881 ) ) ( not ( = ?auto_713880 ?auto_713882 ) ) ( not ( = ?auto_713880 ?auto_713883 ) ) ( not ( = ?auto_713880 ?auto_713884 ) ) ( not ( = ?auto_713880 ?auto_713885 ) ) ( not ( = ?auto_713880 ?auto_713886 ) ) ( not ( = ?auto_713880 ?auto_713887 ) ) ( not ( = ?auto_713880 ?auto_713888 ) ) ( not ( = ?auto_713880 ?auto_713889 ) ) ( not ( = ?auto_713880 ?auto_713890 ) ) ( not ( = ?auto_713881 ?auto_713882 ) ) ( not ( = ?auto_713881 ?auto_713883 ) ) ( not ( = ?auto_713881 ?auto_713884 ) ) ( not ( = ?auto_713881 ?auto_713885 ) ) ( not ( = ?auto_713881 ?auto_713886 ) ) ( not ( = ?auto_713881 ?auto_713887 ) ) ( not ( = ?auto_713881 ?auto_713888 ) ) ( not ( = ?auto_713881 ?auto_713889 ) ) ( not ( = ?auto_713881 ?auto_713890 ) ) ( not ( = ?auto_713882 ?auto_713883 ) ) ( not ( = ?auto_713882 ?auto_713884 ) ) ( not ( = ?auto_713882 ?auto_713885 ) ) ( not ( = ?auto_713882 ?auto_713886 ) ) ( not ( = ?auto_713882 ?auto_713887 ) ) ( not ( = ?auto_713882 ?auto_713888 ) ) ( not ( = ?auto_713882 ?auto_713889 ) ) ( not ( = ?auto_713882 ?auto_713890 ) ) ( not ( = ?auto_713883 ?auto_713884 ) ) ( not ( = ?auto_713883 ?auto_713885 ) ) ( not ( = ?auto_713883 ?auto_713886 ) ) ( not ( = ?auto_713883 ?auto_713887 ) ) ( not ( = ?auto_713883 ?auto_713888 ) ) ( not ( = ?auto_713883 ?auto_713889 ) ) ( not ( = ?auto_713883 ?auto_713890 ) ) ( not ( = ?auto_713884 ?auto_713885 ) ) ( not ( = ?auto_713884 ?auto_713886 ) ) ( not ( = ?auto_713884 ?auto_713887 ) ) ( not ( = ?auto_713884 ?auto_713888 ) ) ( not ( = ?auto_713884 ?auto_713889 ) ) ( not ( = ?auto_713884 ?auto_713890 ) ) ( not ( = ?auto_713885 ?auto_713886 ) ) ( not ( = ?auto_713885 ?auto_713887 ) ) ( not ( = ?auto_713885 ?auto_713888 ) ) ( not ( = ?auto_713885 ?auto_713889 ) ) ( not ( = ?auto_713885 ?auto_713890 ) ) ( not ( = ?auto_713886 ?auto_713887 ) ) ( not ( = ?auto_713886 ?auto_713888 ) ) ( not ( = ?auto_713886 ?auto_713889 ) ) ( not ( = ?auto_713886 ?auto_713890 ) ) ( not ( = ?auto_713887 ?auto_713888 ) ) ( not ( = ?auto_713887 ?auto_713889 ) ) ( not ( = ?auto_713887 ?auto_713890 ) ) ( not ( = ?auto_713888 ?auto_713889 ) ) ( not ( = ?auto_713888 ?auto_713890 ) ) ( not ( = ?auto_713889 ?auto_713890 ) ) ( ON ?auto_713888 ?auto_713889 ) ( ON ?auto_713887 ?auto_713888 ) ( ON ?auto_713886 ?auto_713887 ) ( ON ?auto_713885 ?auto_713886 ) ( ON ?auto_713884 ?auto_713885 ) ( ON ?auto_713883 ?auto_713884 ) ( ON ?auto_713882 ?auto_713883 ) ( ON ?auto_713881 ?auto_713882 ) ( ON ?auto_713880 ?auto_713881 ) ( CLEAR ?auto_713878 ) ( ON ?auto_713879 ?auto_713880 ) ( CLEAR ?auto_713879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_713876 ?auto_713877 ?auto_713878 ?auto_713879 )
      ( MAKE-14PILE ?auto_713876 ?auto_713877 ?auto_713878 ?auto_713879 ?auto_713880 ?auto_713881 ?auto_713882 ?auto_713883 ?auto_713884 ?auto_713885 ?auto_713886 ?auto_713887 ?auto_713888 ?auto_713889 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713934 - BLOCK
      ?auto_713935 - BLOCK
      ?auto_713936 - BLOCK
      ?auto_713937 - BLOCK
      ?auto_713938 - BLOCK
      ?auto_713939 - BLOCK
      ?auto_713940 - BLOCK
      ?auto_713941 - BLOCK
      ?auto_713942 - BLOCK
      ?auto_713943 - BLOCK
      ?auto_713944 - BLOCK
      ?auto_713945 - BLOCK
      ?auto_713946 - BLOCK
      ?auto_713947 - BLOCK
    )
    :vars
    (
      ?auto_713948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_713947 ?auto_713948 ) ( ON-TABLE ?auto_713934 ) ( ON ?auto_713935 ?auto_713934 ) ( not ( = ?auto_713934 ?auto_713935 ) ) ( not ( = ?auto_713934 ?auto_713936 ) ) ( not ( = ?auto_713934 ?auto_713937 ) ) ( not ( = ?auto_713934 ?auto_713938 ) ) ( not ( = ?auto_713934 ?auto_713939 ) ) ( not ( = ?auto_713934 ?auto_713940 ) ) ( not ( = ?auto_713934 ?auto_713941 ) ) ( not ( = ?auto_713934 ?auto_713942 ) ) ( not ( = ?auto_713934 ?auto_713943 ) ) ( not ( = ?auto_713934 ?auto_713944 ) ) ( not ( = ?auto_713934 ?auto_713945 ) ) ( not ( = ?auto_713934 ?auto_713946 ) ) ( not ( = ?auto_713934 ?auto_713947 ) ) ( not ( = ?auto_713934 ?auto_713948 ) ) ( not ( = ?auto_713935 ?auto_713936 ) ) ( not ( = ?auto_713935 ?auto_713937 ) ) ( not ( = ?auto_713935 ?auto_713938 ) ) ( not ( = ?auto_713935 ?auto_713939 ) ) ( not ( = ?auto_713935 ?auto_713940 ) ) ( not ( = ?auto_713935 ?auto_713941 ) ) ( not ( = ?auto_713935 ?auto_713942 ) ) ( not ( = ?auto_713935 ?auto_713943 ) ) ( not ( = ?auto_713935 ?auto_713944 ) ) ( not ( = ?auto_713935 ?auto_713945 ) ) ( not ( = ?auto_713935 ?auto_713946 ) ) ( not ( = ?auto_713935 ?auto_713947 ) ) ( not ( = ?auto_713935 ?auto_713948 ) ) ( not ( = ?auto_713936 ?auto_713937 ) ) ( not ( = ?auto_713936 ?auto_713938 ) ) ( not ( = ?auto_713936 ?auto_713939 ) ) ( not ( = ?auto_713936 ?auto_713940 ) ) ( not ( = ?auto_713936 ?auto_713941 ) ) ( not ( = ?auto_713936 ?auto_713942 ) ) ( not ( = ?auto_713936 ?auto_713943 ) ) ( not ( = ?auto_713936 ?auto_713944 ) ) ( not ( = ?auto_713936 ?auto_713945 ) ) ( not ( = ?auto_713936 ?auto_713946 ) ) ( not ( = ?auto_713936 ?auto_713947 ) ) ( not ( = ?auto_713936 ?auto_713948 ) ) ( not ( = ?auto_713937 ?auto_713938 ) ) ( not ( = ?auto_713937 ?auto_713939 ) ) ( not ( = ?auto_713937 ?auto_713940 ) ) ( not ( = ?auto_713937 ?auto_713941 ) ) ( not ( = ?auto_713937 ?auto_713942 ) ) ( not ( = ?auto_713937 ?auto_713943 ) ) ( not ( = ?auto_713937 ?auto_713944 ) ) ( not ( = ?auto_713937 ?auto_713945 ) ) ( not ( = ?auto_713937 ?auto_713946 ) ) ( not ( = ?auto_713937 ?auto_713947 ) ) ( not ( = ?auto_713937 ?auto_713948 ) ) ( not ( = ?auto_713938 ?auto_713939 ) ) ( not ( = ?auto_713938 ?auto_713940 ) ) ( not ( = ?auto_713938 ?auto_713941 ) ) ( not ( = ?auto_713938 ?auto_713942 ) ) ( not ( = ?auto_713938 ?auto_713943 ) ) ( not ( = ?auto_713938 ?auto_713944 ) ) ( not ( = ?auto_713938 ?auto_713945 ) ) ( not ( = ?auto_713938 ?auto_713946 ) ) ( not ( = ?auto_713938 ?auto_713947 ) ) ( not ( = ?auto_713938 ?auto_713948 ) ) ( not ( = ?auto_713939 ?auto_713940 ) ) ( not ( = ?auto_713939 ?auto_713941 ) ) ( not ( = ?auto_713939 ?auto_713942 ) ) ( not ( = ?auto_713939 ?auto_713943 ) ) ( not ( = ?auto_713939 ?auto_713944 ) ) ( not ( = ?auto_713939 ?auto_713945 ) ) ( not ( = ?auto_713939 ?auto_713946 ) ) ( not ( = ?auto_713939 ?auto_713947 ) ) ( not ( = ?auto_713939 ?auto_713948 ) ) ( not ( = ?auto_713940 ?auto_713941 ) ) ( not ( = ?auto_713940 ?auto_713942 ) ) ( not ( = ?auto_713940 ?auto_713943 ) ) ( not ( = ?auto_713940 ?auto_713944 ) ) ( not ( = ?auto_713940 ?auto_713945 ) ) ( not ( = ?auto_713940 ?auto_713946 ) ) ( not ( = ?auto_713940 ?auto_713947 ) ) ( not ( = ?auto_713940 ?auto_713948 ) ) ( not ( = ?auto_713941 ?auto_713942 ) ) ( not ( = ?auto_713941 ?auto_713943 ) ) ( not ( = ?auto_713941 ?auto_713944 ) ) ( not ( = ?auto_713941 ?auto_713945 ) ) ( not ( = ?auto_713941 ?auto_713946 ) ) ( not ( = ?auto_713941 ?auto_713947 ) ) ( not ( = ?auto_713941 ?auto_713948 ) ) ( not ( = ?auto_713942 ?auto_713943 ) ) ( not ( = ?auto_713942 ?auto_713944 ) ) ( not ( = ?auto_713942 ?auto_713945 ) ) ( not ( = ?auto_713942 ?auto_713946 ) ) ( not ( = ?auto_713942 ?auto_713947 ) ) ( not ( = ?auto_713942 ?auto_713948 ) ) ( not ( = ?auto_713943 ?auto_713944 ) ) ( not ( = ?auto_713943 ?auto_713945 ) ) ( not ( = ?auto_713943 ?auto_713946 ) ) ( not ( = ?auto_713943 ?auto_713947 ) ) ( not ( = ?auto_713943 ?auto_713948 ) ) ( not ( = ?auto_713944 ?auto_713945 ) ) ( not ( = ?auto_713944 ?auto_713946 ) ) ( not ( = ?auto_713944 ?auto_713947 ) ) ( not ( = ?auto_713944 ?auto_713948 ) ) ( not ( = ?auto_713945 ?auto_713946 ) ) ( not ( = ?auto_713945 ?auto_713947 ) ) ( not ( = ?auto_713945 ?auto_713948 ) ) ( not ( = ?auto_713946 ?auto_713947 ) ) ( not ( = ?auto_713946 ?auto_713948 ) ) ( not ( = ?auto_713947 ?auto_713948 ) ) ( ON ?auto_713946 ?auto_713947 ) ( ON ?auto_713945 ?auto_713946 ) ( ON ?auto_713944 ?auto_713945 ) ( ON ?auto_713943 ?auto_713944 ) ( ON ?auto_713942 ?auto_713943 ) ( ON ?auto_713941 ?auto_713942 ) ( ON ?auto_713940 ?auto_713941 ) ( ON ?auto_713939 ?auto_713940 ) ( ON ?auto_713938 ?auto_713939 ) ( ON ?auto_713937 ?auto_713938 ) ( CLEAR ?auto_713935 ) ( ON ?auto_713936 ?auto_713937 ) ( CLEAR ?auto_713936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_713934 ?auto_713935 ?auto_713936 )
      ( MAKE-14PILE ?auto_713934 ?auto_713935 ?auto_713936 ?auto_713937 ?auto_713938 ?auto_713939 ?auto_713940 ?auto_713941 ?auto_713942 ?auto_713943 ?auto_713944 ?auto_713945 ?auto_713946 ?auto_713947 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_713992 - BLOCK
      ?auto_713993 - BLOCK
      ?auto_713994 - BLOCK
      ?auto_713995 - BLOCK
      ?auto_713996 - BLOCK
      ?auto_713997 - BLOCK
      ?auto_713998 - BLOCK
      ?auto_713999 - BLOCK
      ?auto_714000 - BLOCK
      ?auto_714001 - BLOCK
      ?auto_714002 - BLOCK
      ?auto_714003 - BLOCK
      ?auto_714004 - BLOCK
      ?auto_714005 - BLOCK
    )
    :vars
    (
      ?auto_714006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714005 ?auto_714006 ) ( ON-TABLE ?auto_713992 ) ( not ( = ?auto_713992 ?auto_713993 ) ) ( not ( = ?auto_713992 ?auto_713994 ) ) ( not ( = ?auto_713992 ?auto_713995 ) ) ( not ( = ?auto_713992 ?auto_713996 ) ) ( not ( = ?auto_713992 ?auto_713997 ) ) ( not ( = ?auto_713992 ?auto_713998 ) ) ( not ( = ?auto_713992 ?auto_713999 ) ) ( not ( = ?auto_713992 ?auto_714000 ) ) ( not ( = ?auto_713992 ?auto_714001 ) ) ( not ( = ?auto_713992 ?auto_714002 ) ) ( not ( = ?auto_713992 ?auto_714003 ) ) ( not ( = ?auto_713992 ?auto_714004 ) ) ( not ( = ?auto_713992 ?auto_714005 ) ) ( not ( = ?auto_713992 ?auto_714006 ) ) ( not ( = ?auto_713993 ?auto_713994 ) ) ( not ( = ?auto_713993 ?auto_713995 ) ) ( not ( = ?auto_713993 ?auto_713996 ) ) ( not ( = ?auto_713993 ?auto_713997 ) ) ( not ( = ?auto_713993 ?auto_713998 ) ) ( not ( = ?auto_713993 ?auto_713999 ) ) ( not ( = ?auto_713993 ?auto_714000 ) ) ( not ( = ?auto_713993 ?auto_714001 ) ) ( not ( = ?auto_713993 ?auto_714002 ) ) ( not ( = ?auto_713993 ?auto_714003 ) ) ( not ( = ?auto_713993 ?auto_714004 ) ) ( not ( = ?auto_713993 ?auto_714005 ) ) ( not ( = ?auto_713993 ?auto_714006 ) ) ( not ( = ?auto_713994 ?auto_713995 ) ) ( not ( = ?auto_713994 ?auto_713996 ) ) ( not ( = ?auto_713994 ?auto_713997 ) ) ( not ( = ?auto_713994 ?auto_713998 ) ) ( not ( = ?auto_713994 ?auto_713999 ) ) ( not ( = ?auto_713994 ?auto_714000 ) ) ( not ( = ?auto_713994 ?auto_714001 ) ) ( not ( = ?auto_713994 ?auto_714002 ) ) ( not ( = ?auto_713994 ?auto_714003 ) ) ( not ( = ?auto_713994 ?auto_714004 ) ) ( not ( = ?auto_713994 ?auto_714005 ) ) ( not ( = ?auto_713994 ?auto_714006 ) ) ( not ( = ?auto_713995 ?auto_713996 ) ) ( not ( = ?auto_713995 ?auto_713997 ) ) ( not ( = ?auto_713995 ?auto_713998 ) ) ( not ( = ?auto_713995 ?auto_713999 ) ) ( not ( = ?auto_713995 ?auto_714000 ) ) ( not ( = ?auto_713995 ?auto_714001 ) ) ( not ( = ?auto_713995 ?auto_714002 ) ) ( not ( = ?auto_713995 ?auto_714003 ) ) ( not ( = ?auto_713995 ?auto_714004 ) ) ( not ( = ?auto_713995 ?auto_714005 ) ) ( not ( = ?auto_713995 ?auto_714006 ) ) ( not ( = ?auto_713996 ?auto_713997 ) ) ( not ( = ?auto_713996 ?auto_713998 ) ) ( not ( = ?auto_713996 ?auto_713999 ) ) ( not ( = ?auto_713996 ?auto_714000 ) ) ( not ( = ?auto_713996 ?auto_714001 ) ) ( not ( = ?auto_713996 ?auto_714002 ) ) ( not ( = ?auto_713996 ?auto_714003 ) ) ( not ( = ?auto_713996 ?auto_714004 ) ) ( not ( = ?auto_713996 ?auto_714005 ) ) ( not ( = ?auto_713996 ?auto_714006 ) ) ( not ( = ?auto_713997 ?auto_713998 ) ) ( not ( = ?auto_713997 ?auto_713999 ) ) ( not ( = ?auto_713997 ?auto_714000 ) ) ( not ( = ?auto_713997 ?auto_714001 ) ) ( not ( = ?auto_713997 ?auto_714002 ) ) ( not ( = ?auto_713997 ?auto_714003 ) ) ( not ( = ?auto_713997 ?auto_714004 ) ) ( not ( = ?auto_713997 ?auto_714005 ) ) ( not ( = ?auto_713997 ?auto_714006 ) ) ( not ( = ?auto_713998 ?auto_713999 ) ) ( not ( = ?auto_713998 ?auto_714000 ) ) ( not ( = ?auto_713998 ?auto_714001 ) ) ( not ( = ?auto_713998 ?auto_714002 ) ) ( not ( = ?auto_713998 ?auto_714003 ) ) ( not ( = ?auto_713998 ?auto_714004 ) ) ( not ( = ?auto_713998 ?auto_714005 ) ) ( not ( = ?auto_713998 ?auto_714006 ) ) ( not ( = ?auto_713999 ?auto_714000 ) ) ( not ( = ?auto_713999 ?auto_714001 ) ) ( not ( = ?auto_713999 ?auto_714002 ) ) ( not ( = ?auto_713999 ?auto_714003 ) ) ( not ( = ?auto_713999 ?auto_714004 ) ) ( not ( = ?auto_713999 ?auto_714005 ) ) ( not ( = ?auto_713999 ?auto_714006 ) ) ( not ( = ?auto_714000 ?auto_714001 ) ) ( not ( = ?auto_714000 ?auto_714002 ) ) ( not ( = ?auto_714000 ?auto_714003 ) ) ( not ( = ?auto_714000 ?auto_714004 ) ) ( not ( = ?auto_714000 ?auto_714005 ) ) ( not ( = ?auto_714000 ?auto_714006 ) ) ( not ( = ?auto_714001 ?auto_714002 ) ) ( not ( = ?auto_714001 ?auto_714003 ) ) ( not ( = ?auto_714001 ?auto_714004 ) ) ( not ( = ?auto_714001 ?auto_714005 ) ) ( not ( = ?auto_714001 ?auto_714006 ) ) ( not ( = ?auto_714002 ?auto_714003 ) ) ( not ( = ?auto_714002 ?auto_714004 ) ) ( not ( = ?auto_714002 ?auto_714005 ) ) ( not ( = ?auto_714002 ?auto_714006 ) ) ( not ( = ?auto_714003 ?auto_714004 ) ) ( not ( = ?auto_714003 ?auto_714005 ) ) ( not ( = ?auto_714003 ?auto_714006 ) ) ( not ( = ?auto_714004 ?auto_714005 ) ) ( not ( = ?auto_714004 ?auto_714006 ) ) ( not ( = ?auto_714005 ?auto_714006 ) ) ( ON ?auto_714004 ?auto_714005 ) ( ON ?auto_714003 ?auto_714004 ) ( ON ?auto_714002 ?auto_714003 ) ( ON ?auto_714001 ?auto_714002 ) ( ON ?auto_714000 ?auto_714001 ) ( ON ?auto_713999 ?auto_714000 ) ( ON ?auto_713998 ?auto_713999 ) ( ON ?auto_713997 ?auto_713998 ) ( ON ?auto_713996 ?auto_713997 ) ( ON ?auto_713995 ?auto_713996 ) ( ON ?auto_713994 ?auto_713995 ) ( CLEAR ?auto_713992 ) ( ON ?auto_713993 ?auto_713994 ) ( CLEAR ?auto_713993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_713992 ?auto_713993 )
      ( MAKE-14PILE ?auto_713992 ?auto_713993 ?auto_713994 ?auto_713995 ?auto_713996 ?auto_713997 ?auto_713998 ?auto_713999 ?auto_714000 ?auto_714001 ?auto_714002 ?auto_714003 ?auto_714004 ?auto_714005 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_714050 - BLOCK
      ?auto_714051 - BLOCK
      ?auto_714052 - BLOCK
      ?auto_714053 - BLOCK
      ?auto_714054 - BLOCK
      ?auto_714055 - BLOCK
      ?auto_714056 - BLOCK
      ?auto_714057 - BLOCK
      ?auto_714058 - BLOCK
      ?auto_714059 - BLOCK
      ?auto_714060 - BLOCK
      ?auto_714061 - BLOCK
      ?auto_714062 - BLOCK
      ?auto_714063 - BLOCK
    )
    :vars
    (
      ?auto_714064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714063 ?auto_714064 ) ( not ( = ?auto_714050 ?auto_714051 ) ) ( not ( = ?auto_714050 ?auto_714052 ) ) ( not ( = ?auto_714050 ?auto_714053 ) ) ( not ( = ?auto_714050 ?auto_714054 ) ) ( not ( = ?auto_714050 ?auto_714055 ) ) ( not ( = ?auto_714050 ?auto_714056 ) ) ( not ( = ?auto_714050 ?auto_714057 ) ) ( not ( = ?auto_714050 ?auto_714058 ) ) ( not ( = ?auto_714050 ?auto_714059 ) ) ( not ( = ?auto_714050 ?auto_714060 ) ) ( not ( = ?auto_714050 ?auto_714061 ) ) ( not ( = ?auto_714050 ?auto_714062 ) ) ( not ( = ?auto_714050 ?auto_714063 ) ) ( not ( = ?auto_714050 ?auto_714064 ) ) ( not ( = ?auto_714051 ?auto_714052 ) ) ( not ( = ?auto_714051 ?auto_714053 ) ) ( not ( = ?auto_714051 ?auto_714054 ) ) ( not ( = ?auto_714051 ?auto_714055 ) ) ( not ( = ?auto_714051 ?auto_714056 ) ) ( not ( = ?auto_714051 ?auto_714057 ) ) ( not ( = ?auto_714051 ?auto_714058 ) ) ( not ( = ?auto_714051 ?auto_714059 ) ) ( not ( = ?auto_714051 ?auto_714060 ) ) ( not ( = ?auto_714051 ?auto_714061 ) ) ( not ( = ?auto_714051 ?auto_714062 ) ) ( not ( = ?auto_714051 ?auto_714063 ) ) ( not ( = ?auto_714051 ?auto_714064 ) ) ( not ( = ?auto_714052 ?auto_714053 ) ) ( not ( = ?auto_714052 ?auto_714054 ) ) ( not ( = ?auto_714052 ?auto_714055 ) ) ( not ( = ?auto_714052 ?auto_714056 ) ) ( not ( = ?auto_714052 ?auto_714057 ) ) ( not ( = ?auto_714052 ?auto_714058 ) ) ( not ( = ?auto_714052 ?auto_714059 ) ) ( not ( = ?auto_714052 ?auto_714060 ) ) ( not ( = ?auto_714052 ?auto_714061 ) ) ( not ( = ?auto_714052 ?auto_714062 ) ) ( not ( = ?auto_714052 ?auto_714063 ) ) ( not ( = ?auto_714052 ?auto_714064 ) ) ( not ( = ?auto_714053 ?auto_714054 ) ) ( not ( = ?auto_714053 ?auto_714055 ) ) ( not ( = ?auto_714053 ?auto_714056 ) ) ( not ( = ?auto_714053 ?auto_714057 ) ) ( not ( = ?auto_714053 ?auto_714058 ) ) ( not ( = ?auto_714053 ?auto_714059 ) ) ( not ( = ?auto_714053 ?auto_714060 ) ) ( not ( = ?auto_714053 ?auto_714061 ) ) ( not ( = ?auto_714053 ?auto_714062 ) ) ( not ( = ?auto_714053 ?auto_714063 ) ) ( not ( = ?auto_714053 ?auto_714064 ) ) ( not ( = ?auto_714054 ?auto_714055 ) ) ( not ( = ?auto_714054 ?auto_714056 ) ) ( not ( = ?auto_714054 ?auto_714057 ) ) ( not ( = ?auto_714054 ?auto_714058 ) ) ( not ( = ?auto_714054 ?auto_714059 ) ) ( not ( = ?auto_714054 ?auto_714060 ) ) ( not ( = ?auto_714054 ?auto_714061 ) ) ( not ( = ?auto_714054 ?auto_714062 ) ) ( not ( = ?auto_714054 ?auto_714063 ) ) ( not ( = ?auto_714054 ?auto_714064 ) ) ( not ( = ?auto_714055 ?auto_714056 ) ) ( not ( = ?auto_714055 ?auto_714057 ) ) ( not ( = ?auto_714055 ?auto_714058 ) ) ( not ( = ?auto_714055 ?auto_714059 ) ) ( not ( = ?auto_714055 ?auto_714060 ) ) ( not ( = ?auto_714055 ?auto_714061 ) ) ( not ( = ?auto_714055 ?auto_714062 ) ) ( not ( = ?auto_714055 ?auto_714063 ) ) ( not ( = ?auto_714055 ?auto_714064 ) ) ( not ( = ?auto_714056 ?auto_714057 ) ) ( not ( = ?auto_714056 ?auto_714058 ) ) ( not ( = ?auto_714056 ?auto_714059 ) ) ( not ( = ?auto_714056 ?auto_714060 ) ) ( not ( = ?auto_714056 ?auto_714061 ) ) ( not ( = ?auto_714056 ?auto_714062 ) ) ( not ( = ?auto_714056 ?auto_714063 ) ) ( not ( = ?auto_714056 ?auto_714064 ) ) ( not ( = ?auto_714057 ?auto_714058 ) ) ( not ( = ?auto_714057 ?auto_714059 ) ) ( not ( = ?auto_714057 ?auto_714060 ) ) ( not ( = ?auto_714057 ?auto_714061 ) ) ( not ( = ?auto_714057 ?auto_714062 ) ) ( not ( = ?auto_714057 ?auto_714063 ) ) ( not ( = ?auto_714057 ?auto_714064 ) ) ( not ( = ?auto_714058 ?auto_714059 ) ) ( not ( = ?auto_714058 ?auto_714060 ) ) ( not ( = ?auto_714058 ?auto_714061 ) ) ( not ( = ?auto_714058 ?auto_714062 ) ) ( not ( = ?auto_714058 ?auto_714063 ) ) ( not ( = ?auto_714058 ?auto_714064 ) ) ( not ( = ?auto_714059 ?auto_714060 ) ) ( not ( = ?auto_714059 ?auto_714061 ) ) ( not ( = ?auto_714059 ?auto_714062 ) ) ( not ( = ?auto_714059 ?auto_714063 ) ) ( not ( = ?auto_714059 ?auto_714064 ) ) ( not ( = ?auto_714060 ?auto_714061 ) ) ( not ( = ?auto_714060 ?auto_714062 ) ) ( not ( = ?auto_714060 ?auto_714063 ) ) ( not ( = ?auto_714060 ?auto_714064 ) ) ( not ( = ?auto_714061 ?auto_714062 ) ) ( not ( = ?auto_714061 ?auto_714063 ) ) ( not ( = ?auto_714061 ?auto_714064 ) ) ( not ( = ?auto_714062 ?auto_714063 ) ) ( not ( = ?auto_714062 ?auto_714064 ) ) ( not ( = ?auto_714063 ?auto_714064 ) ) ( ON ?auto_714062 ?auto_714063 ) ( ON ?auto_714061 ?auto_714062 ) ( ON ?auto_714060 ?auto_714061 ) ( ON ?auto_714059 ?auto_714060 ) ( ON ?auto_714058 ?auto_714059 ) ( ON ?auto_714057 ?auto_714058 ) ( ON ?auto_714056 ?auto_714057 ) ( ON ?auto_714055 ?auto_714056 ) ( ON ?auto_714054 ?auto_714055 ) ( ON ?auto_714053 ?auto_714054 ) ( ON ?auto_714052 ?auto_714053 ) ( ON ?auto_714051 ?auto_714052 ) ( ON ?auto_714050 ?auto_714051 ) ( CLEAR ?auto_714050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_714050 )
      ( MAKE-14PILE ?auto_714050 ?auto_714051 ?auto_714052 ?auto_714053 ?auto_714054 ?auto_714055 ?auto_714056 ?auto_714057 ?auto_714058 ?auto_714059 ?auto_714060 ?auto_714061 ?auto_714062 ?auto_714063 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714109 - BLOCK
      ?auto_714110 - BLOCK
      ?auto_714111 - BLOCK
      ?auto_714112 - BLOCK
      ?auto_714113 - BLOCK
      ?auto_714114 - BLOCK
      ?auto_714115 - BLOCK
      ?auto_714116 - BLOCK
      ?auto_714117 - BLOCK
      ?auto_714118 - BLOCK
      ?auto_714119 - BLOCK
      ?auto_714120 - BLOCK
      ?auto_714121 - BLOCK
      ?auto_714122 - BLOCK
      ?auto_714123 - BLOCK
    )
    :vars
    (
      ?auto_714124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_714122 ) ( ON ?auto_714123 ?auto_714124 ) ( CLEAR ?auto_714123 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_714109 ) ( ON ?auto_714110 ?auto_714109 ) ( ON ?auto_714111 ?auto_714110 ) ( ON ?auto_714112 ?auto_714111 ) ( ON ?auto_714113 ?auto_714112 ) ( ON ?auto_714114 ?auto_714113 ) ( ON ?auto_714115 ?auto_714114 ) ( ON ?auto_714116 ?auto_714115 ) ( ON ?auto_714117 ?auto_714116 ) ( ON ?auto_714118 ?auto_714117 ) ( ON ?auto_714119 ?auto_714118 ) ( ON ?auto_714120 ?auto_714119 ) ( ON ?auto_714121 ?auto_714120 ) ( ON ?auto_714122 ?auto_714121 ) ( not ( = ?auto_714109 ?auto_714110 ) ) ( not ( = ?auto_714109 ?auto_714111 ) ) ( not ( = ?auto_714109 ?auto_714112 ) ) ( not ( = ?auto_714109 ?auto_714113 ) ) ( not ( = ?auto_714109 ?auto_714114 ) ) ( not ( = ?auto_714109 ?auto_714115 ) ) ( not ( = ?auto_714109 ?auto_714116 ) ) ( not ( = ?auto_714109 ?auto_714117 ) ) ( not ( = ?auto_714109 ?auto_714118 ) ) ( not ( = ?auto_714109 ?auto_714119 ) ) ( not ( = ?auto_714109 ?auto_714120 ) ) ( not ( = ?auto_714109 ?auto_714121 ) ) ( not ( = ?auto_714109 ?auto_714122 ) ) ( not ( = ?auto_714109 ?auto_714123 ) ) ( not ( = ?auto_714109 ?auto_714124 ) ) ( not ( = ?auto_714110 ?auto_714111 ) ) ( not ( = ?auto_714110 ?auto_714112 ) ) ( not ( = ?auto_714110 ?auto_714113 ) ) ( not ( = ?auto_714110 ?auto_714114 ) ) ( not ( = ?auto_714110 ?auto_714115 ) ) ( not ( = ?auto_714110 ?auto_714116 ) ) ( not ( = ?auto_714110 ?auto_714117 ) ) ( not ( = ?auto_714110 ?auto_714118 ) ) ( not ( = ?auto_714110 ?auto_714119 ) ) ( not ( = ?auto_714110 ?auto_714120 ) ) ( not ( = ?auto_714110 ?auto_714121 ) ) ( not ( = ?auto_714110 ?auto_714122 ) ) ( not ( = ?auto_714110 ?auto_714123 ) ) ( not ( = ?auto_714110 ?auto_714124 ) ) ( not ( = ?auto_714111 ?auto_714112 ) ) ( not ( = ?auto_714111 ?auto_714113 ) ) ( not ( = ?auto_714111 ?auto_714114 ) ) ( not ( = ?auto_714111 ?auto_714115 ) ) ( not ( = ?auto_714111 ?auto_714116 ) ) ( not ( = ?auto_714111 ?auto_714117 ) ) ( not ( = ?auto_714111 ?auto_714118 ) ) ( not ( = ?auto_714111 ?auto_714119 ) ) ( not ( = ?auto_714111 ?auto_714120 ) ) ( not ( = ?auto_714111 ?auto_714121 ) ) ( not ( = ?auto_714111 ?auto_714122 ) ) ( not ( = ?auto_714111 ?auto_714123 ) ) ( not ( = ?auto_714111 ?auto_714124 ) ) ( not ( = ?auto_714112 ?auto_714113 ) ) ( not ( = ?auto_714112 ?auto_714114 ) ) ( not ( = ?auto_714112 ?auto_714115 ) ) ( not ( = ?auto_714112 ?auto_714116 ) ) ( not ( = ?auto_714112 ?auto_714117 ) ) ( not ( = ?auto_714112 ?auto_714118 ) ) ( not ( = ?auto_714112 ?auto_714119 ) ) ( not ( = ?auto_714112 ?auto_714120 ) ) ( not ( = ?auto_714112 ?auto_714121 ) ) ( not ( = ?auto_714112 ?auto_714122 ) ) ( not ( = ?auto_714112 ?auto_714123 ) ) ( not ( = ?auto_714112 ?auto_714124 ) ) ( not ( = ?auto_714113 ?auto_714114 ) ) ( not ( = ?auto_714113 ?auto_714115 ) ) ( not ( = ?auto_714113 ?auto_714116 ) ) ( not ( = ?auto_714113 ?auto_714117 ) ) ( not ( = ?auto_714113 ?auto_714118 ) ) ( not ( = ?auto_714113 ?auto_714119 ) ) ( not ( = ?auto_714113 ?auto_714120 ) ) ( not ( = ?auto_714113 ?auto_714121 ) ) ( not ( = ?auto_714113 ?auto_714122 ) ) ( not ( = ?auto_714113 ?auto_714123 ) ) ( not ( = ?auto_714113 ?auto_714124 ) ) ( not ( = ?auto_714114 ?auto_714115 ) ) ( not ( = ?auto_714114 ?auto_714116 ) ) ( not ( = ?auto_714114 ?auto_714117 ) ) ( not ( = ?auto_714114 ?auto_714118 ) ) ( not ( = ?auto_714114 ?auto_714119 ) ) ( not ( = ?auto_714114 ?auto_714120 ) ) ( not ( = ?auto_714114 ?auto_714121 ) ) ( not ( = ?auto_714114 ?auto_714122 ) ) ( not ( = ?auto_714114 ?auto_714123 ) ) ( not ( = ?auto_714114 ?auto_714124 ) ) ( not ( = ?auto_714115 ?auto_714116 ) ) ( not ( = ?auto_714115 ?auto_714117 ) ) ( not ( = ?auto_714115 ?auto_714118 ) ) ( not ( = ?auto_714115 ?auto_714119 ) ) ( not ( = ?auto_714115 ?auto_714120 ) ) ( not ( = ?auto_714115 ?auto_714121 ) ) ( not ( = ?auto_714115 ?auto_714122 ) ) ( not ( = ?auto_714115 ?auto_714123 ) ) ( not ( = ?auto_714115 ?auto_714124 ) ) ( not ( = ?auto_714116 ?auto_714117 ) ) ( not ( = ?auto_714116 ?auto_714118 ) ) ( not ( = ?auto_714116 ?auto_714119 ) ) ( not ( = ?auto_714116 ?auto_714120 ) ) ( not ( = ?auto_714116 ?auto_714121 ) ) ( not ( = ?auto_714116 ?auto_714122 ) ) ( not ( = ?auto_714116 ?auto_714123 ) ) ( not ( = ?auto_714116 ?auto_714124 ) ) ( not ( = ?auto_714117 ?auto_714118 ) ) ( not ( = ?auto_714117 ?auto_714119 ) ) ( not ( = ?auto_714117 ?auto_714120 ) ) ( not ( = ?auto_714117 ?auto_714121 ) ) ( not ( = ?auto_714117 ?auto_714122 ) ) ( not ( = ?auto_714117 ?auto_714123 ) ) ( not ( = ?auto_714117 ?auto_714124 ) ) ( not ( = ?auto_714118 ?auto_714119 ) ) ( not ( = ?auto_714118 ?auto_714120 ) ) ( not ( = ?auto_714118 ?auto_714121 ) ) ( not ( = ?auto_714118 ?auto_714122 ) ) ( not ( = ?auto_714118 ?auto_714123 ) ) ( not ( = ?auto_714118 ?auto_714124 ) ) ( not ( = ?auto_714119 ?auto_714120 ) ) ( not ( = ?auto_714119 ?auto_714121 ) ) ( not ( = ?auto_714119 ?auto_714122 ) ) ( not ( = ?auto_714119 ?auto_714123 ) ) ( not ( = ?auto_714119 ?auto_714124 ) ) ( not ( = ?auto_714120 ?auto_714121 ) ) ( not ( = ?auto_714120 ?auto_714122 ) ) ( not ( = ?auto_714120 ?auto_714123 ) ) ( not ( = ?auto_714120 ?auto_714124 ) ) ( not ( = ?auto_714121 ?auto_714122 ) ) ( not ( = ?auto_714121 ?auto_714123 ) ) ( not ( = ?auto_714121 ?auto_714124 ) ) ( not ( = ?auto_714122 ?auto_714123 ) ) ( not ( = ?auto_714122 ?auto_714124 ) ) ( not ( = ?auto_714123 ?auto_714124 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_714123 ?auto_714124 )
      ( !STACK ?auto_714123 ?auto_714122 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714171 - BLOCK
      ?auto_714172 - BLOCK
      ?auto_714173 - BLOCK
      ?auto_714174 - BLOCK
      ?auto_714175 - BLOCK
      ?auto_714176 - BLOCK
      ?auto_714177 - BLOCK
      ?auto_714178 - BLOCK
      ?auto_714179 - BLOCK
      ?auto_714180 - BLOCK
      ?auto_714181 - BLOCK
      ?auto_714182 - BLOCK
      ?auto_714183 - BLOCK
      ?auto_714184 - BLOCK
      ?auto_714185 - BLOCK
    )
    :vars
    (
      ?auto_714186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714185 ?auto_714186 ) ( ON-TABLE ?auto_714171 ) ( ON ?auto_714172 ?auto_714171 ) ( ON ?auto_714173 ?auto_714172 ) ( ON ?auto_714174 ?auto_714173 ) ( ON ?auto_714175 ?auto_714174 ) ( ON ?auto_714176 ?auto_714175 ) ( ON ?auto_714177 ?auto_714176 ) ( ON ?auto_714178 ?auto_714177 ) ( ON ?auto_714179 ?auto_714178 ) ( ON ?auto_714180 ?auto_714179 ) ( ON ?auto_714181 ?auto_714180 ) ( ON ?auto_714182 ?auto_714181 ) ( ON ?auto_714183 ?auto_714182 ) ( not ( = ?auto_714171 ?auto_714172 ) ) ( not ( = ?auto_714171 ?auto_714173 ) ) ( not ( = ?auto_714171 ?auto_714174 ) ) ( not ( = ?auto_714171 ?auto_714175 ) ) ( not ( = ?auto_714171 ?auto_714176 ) ) ( not ( = ?auto_714171 ?auto_714177 ) ) ( not ( = ?auto_714171 ?auto_714178 ) ) ( not ( = ?auto_714171 ?auto_714179 ) ) ( not ( = ?auto_714171 ?auto_714180 ) ) ( not ( = ?auto_714171 ?auto_714181 ) ) ( not ( = ?auto_714171 ?auto_714182 ) ) ( not ( = ?auto_714171 ?auto_714183 ) ) ( not ( = ?auto_714171 ?auto_714184 ) ) ( not ( = ?auto_714171 ?auto_714185 ) ) ( not ( = ?auto_714171 ?auto_714186 ) ) ( not ( = ?auto_714172 ?auto_714173 ) ) ( not ( = ?auto_714172 ?auto_714174 ) ) ( not ( = ?auto_714172 ?auto_714175 ) ) ( not ( = ?auto_714172 ?auto_714176 ) ) ( not ( = ?auto_714172 ?auto_714177 ) ) ( not ( = ?auto_714172 ?auto_714178 ) ) ( not ( = ?auto_714172 ?auto_714179 ) ) ( not ( = ?auto_714172 ?auto_714180 ) ) ( not ( = ?auto_714172 ?auto_714181 ) ) ( not ( = ?auto_714172 ?auto_714182 ) ) ( not ( = ?auto_714172 ?auto_714183 ) ) ( not ( = ?auto_714172 ?auto_714184 ) ) ( not ( = ?auto_714172 ?auto_714185 ) ) ( not ( = ?auto_714172 ?auto_714186 ) ) ( not ( = ?auto_714173 ?auto_714174 ) ) ( not ( = ?auto_714173 ?auto_714175 ) ) ( not ( = ?auto_714173 ?auto_714176 ) ) ( not ( = ?auto_714173 ?auto_714177 ) ) ( not ( = ?auto_714173 ?auto_714178 ) ) ( not ( = ?auto_714173 ?auto_714179 ) ) ( not ( = ?auto_714173 ?auto_714180 ) ) ( not ( = ?auto_714173 ?auto_714181 ) ) ( not ( = ?auto_714173 ?auto_714182 ) ) ( not ( = ?auto_714173 ?auto_714183 ) ) ( not ( = ?auto_714173 ?auto_714184 ) ) ( not ( = ?auto_714173 ?auto_714185 ) ) ( not ( = ?auto_714173 ?auto_714186 ) ) ( not ( = ?auto_714174 ?auto_714175 ) ) ( not ( = ?auto_714174 ?auto_714176 ) ) ( not ( = ?auto_714174 ?auto_714177 ) ) ( not ( = ?auto_714174 ?auto_714178 ) ) ( not ( = ?auto_714174 ?auto_714179 ) ) ( not ( = ?auto_714174 ?auto_714180 ) ) ( not ( = ?auto_714174 ?auto_714181 ) ) ( not ( = ?auto_714174 ?auto_714182 ) ) ( not ( = ?auto_714174 ?auto_714183 ) ) ( not ( = ?auto_714174 ?auto_714184 ) ) ( not ( = ?auto_714174 ?auto_714185 ) ) ( not ( = ?auto_714174 ?auto_714186 ) ) ( not ( = ?auto_714175 ?auto_714176 ) ) ( not ( = ?auto_714175 ?auto_714177 ) ) ( not ( = ?auto_714175 ?auto_714178 ) ) ( not ( = ?auto_714175 ?auto_714179 ) ) ( not ( = ?auto_714175 ?auto_714180 ) ) ( not ( = ?auto_714175 ?auto_714181 ) ) ( not ( = ?auto_714175 ?auto_714182 ) ) ( not ( = ?auto_714175 ?auto_714183 ) ) ( not ( = ?auto_714175 ?auto_714184 ) ) ( not ( = ?auto_714175 ?auto_714185 ) ) ( not ( = ?auto_714175 ?auto_714186 ) ) ( not ( = ?auto_714176 ?auto_714177 ) ) ( not ( = ?auto_714176 ?auto_714178 ) ) ( not ( = ?auto_714176 ?auto_714179 ) ) ( not ( = ?auto_714176 ?auto_714180 ) ) ( not ( = ?auto_714176 ?auto_714181 ) ) ( not ( = ?auto_714176 ?auto_714182 ) ) ( not ( = ?auto_714176 ?auto_714183 ) ) ( not ( = ?auto_714176 ?auto_714184 ) ) ( not ( = ?auto_714176 ?auto_714185 ) ) ( not ( = ?auto_714176 ?auto_714186 ) ) ( not ( = ?auto_714177 ?auto_714178 ) ) ( not ( = ?auto_714177 ?auto_714179 ) ) ( not ( = ?auto_714177 ?auto_714180 ) ) ( not ( = ?auto_714177 ?auto_714181 ) ) ( not ( = ?auto_714177 ?auto_714182 ) ) ( not ( = ?auto_714177 ?auto_714183 ) ) ( not ( = ?auto_714177 ?auto_714184 ) ) ( not ( = ?auto_714177 ?auto_714185 ) ) ( not ( = ?auto_714177 ?auto_714186 ) ) ( not ( = ?auto_714178 ?auto_714179 ) ) ( not ( = ?auto_714178 ?auto_714180 ) ) ( not ( = ?auto_714178 ?auto_714181 ) ) ( not ( = ?auto_714178 ?auto_714182 ) ) ( not ( = ?auto_714178 ?auto_714183 ) ) ( not ( = ?auto_714178 ?auto_714184 ) ) ( not ( = ?auto_714178 ?auto_714185 ) ) ( not ( = ?auto_714178 ?auto_714186 ) ) ( not ( = ?auto_714179 ?auto_714180 ) ) ( not ( = ?auto_714179 ?auto_714181 ) ) ( not ( = ?auto_714179 ?auto_714182 ) ) ( not ( = ?auto_714179 ?auto_714183 ) ) ( not ( = ?auto_714179 ?auto_714184 ) ) ( not ( = ?auto_714179 ?auto_714185 ) ) ( not ( = ?auto_714179 ?auto_714186 ) ) ( not ( = ?auto_714180 ?auto_714181 ) ) ( not ( = ?auto_714180 ?auto_714182 ) ) ( not ( = ?auto_714180 ?auto_714183 ) ) ( not ( = ?auto_714180 ?auto_714184 ) ) ( not ( = ?auto_714180 ?auto_714185 ) ) ( not ( = ?auto_714180 ?auto_714186 ) ) ( not ( = ?auto_714181 ?auto_714182 ) ) ( not ( = ?auto_714181 ?auto_714183 ) ) ( not ( = ?auto_714181 ?auto_714184 ) ) ( not ( = ?auto_714181 ?auto_714185 ) ) ( not ( = ?auto_714181 ?auto_714186 ) ) ( not ( = ?auto_714182 ?auto_714183 ) ) ( not ( = ?auto_714182 ?auto_714184 ) ) ( not ( = ?auto_714182 ?auto_714185 ) ) ( not ( = ?auto_714182 ?auto_714186 ) ) ( not ( = ?auto_714183 ?auto_714184 ) ) ( not ( = ?auto_714183 ?auto_714185 ) ) ( not ( = ?auto_714183 ?auto_714186 ) ) ( not ( = ?auto_714184 ?auto_714185 ) ) ( not ( = ?auto_714184 ?auto_714186 ) ) ( not ( = ?auto_714185 ?auto_714186 ) ) ( CLEAR ?auto_714183 ) ( ON ?auto_714184 ?auto_714185 ) ( CLEAR ?auto_714184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_714171 ?auto_714172 ?auto_714173 ?auto_714174 ?auto_714175 ?auto_714176 ?auto_714177 ?auto_714178 ?auto_714179 ?auto_714180 ?auto_714181 ?auto_714182 ?auto_714183 ?auto_714184 )
      ( MAKE-15PILE ?auto_714171 ?auto_714172 ?auto_714173 ?auto_714174 ?auto_714175 ?auto_714176 ?auto_714177 ?auto_714178 ?auto_714179 ?auto_714180 ?auto_714181 ?auto_714182 ?auto_714183 ?auto_714184 ?auto_714185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714233 - BLOCK
      ?auto_714234 - BLOCK
      ?auto_714235 - BLOCK
      ?auto_714236 - BLOCK
      ?auto_714237 - BLOCK
      ?auto_714238 - BLOCK
      ?auto_714239 - BLOCK
      ?auto_714240 - BLOCK
      ?auto_714241 - BLOCK
      ?auto_714242 - BLOCK
      ?auto_714243 - BLOCK
      ?auto_714244 - BLOCK
      ?auto_714245 - BLOCK
      ?auto_714246 - BLOCK
      ?auto_714247 - BLOCK
    )
    :vars
    (
      ?auto_714248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714247 ?auto_714248 ) ( ON-TABLE ?auto_714233 ) ( ON ?auto_714234 ?auto_714233 ) ( ON ?auto_714235 ?auto_714234 ) ( ON ?auto_714236 ?auto_714235 ) ( ON ?auto_714237 ?auto_714236 ) ( ON ?auto_714238 ?auto_714237 ) ( ON ?auto_714239 ?auto_714238 ) ( ON ?auto_714240 ?auto_714239 ) ( ON ?auto_714241 ?auto_714240 ) ( ON ?auto_714242 ?auto_714241 ) ( ON ?auto_714243 ?auto_714242 ) ( ON ?auto_714244 ?auto_714243 ) ( not ( = ?auto_714233 ?auto_714234 ) ) ( not ( = ?auto_714233 ?auto_714235 ) ) ( not ( = ?auto_714233 ?auto_714236 ) ) ( not ( = ?auto_714233 ?auto_714237 ) ) ( not ( = ?auto_714233 ?auto_714238 ) ) ( not ( = ?auto_714233 ?auto_714239 ) ) ( not ( = ?auto_714233 ?auto_714240 ) ) ( not ( = ?auto_714233 ?auto_714241 ) ) ( not ( = ?auto_714233 ?auto_714242 ) ) ( not ( = ?auto_714233 ?auto_714243 ) ) ( not ( = ?auto_714233 ?auto_714244 ) ) ( not ( = ?auto_714233 ?auto_714245 ) ) ( not ( = ?auto_714233 ?auto_714246 ) ) ( not ( = ?auto_714233 ?auto_714247 ) ) ( not ( = ?auto_714233 ?auto_714248 ) ) ( not ( = ?auto_714234 ?auto_714235 ) ) ( not ( = ?auto_714234 ?auto_714236 ) ) ( not ( = ?auto_714234 ?auto_714237 ) ) ( not ( = ?auto_714234 ?auto_714238 ) ) ( not ( = ?auto_714234 ?auto_714239 ) ) ( not ( = ?auto_714234 ?auto_714240 ) ) ( not ( = ?auto_714234 ?auto_714241 ) ) ( not ( = ?auto_714234 ?auto_714242 ) ) ( not ( = ?auto_714234 ?auto_714243 ) ) ( not ( = ?auto_714234 ?auto_714244 ) ) ( not ( = ?auto_714234 ?auto_714245 ) ) ( not ( = ?auto_714234 ?auto_714246 ) ) ( not ( = ?auto_714234 ?auto_714247 ) ) ( not ( = ?auto_714234 ?auto_714248 ) ) ( not ( = ?auto_714235 ?auto_714236 ) ) ( not ( = ?auto_714235 ?auto_714237 ) ) ( not ( = ?auto_714235 ?auto_714238 ) ) ( not ( = ?auto_714235 ?auto_714239 ) ) ( not ( = ?auto_714235 ?auto_714240 ) ) ( not ( = ?auto_714235 ?auto_714241 ) ) ( not ( = ?auto_714235 ?auto_714242 ) ) ( not ( = ?auto_714235 ?auto_714243 ) ) ( not ( = ?auto_714235 ?auto_714244 ) ) ( not ( = ?auto_714235 ?auto_714245 ) ) ( not ( = ?auto_714235 ?auto_714246 ) ) ( not ( = ?auto_714235 ?auto_714247 ) ) ( not ( = ?auto_714235 ?auto_714248 ) ) ( not ( = ?auto_714236 ?auto_714237 ) ) ( not ( = ?auto_714236 ?auto_714238 ) ) ( not ( = ?auto_714236 ?auto_714239 ) ) ( not ( = ?auto_714236 ?auto_714240 ) ) ( not ( = ?auto_714236 ?auto_714241 ) ) ( not ( = ?auto_714236 ?auto_714242 ) ) ( not ( = ?auto_714236 ?auto_714243 ) ) ( not ( = ?auto_714236 ?auto_714244 ) ) ( not ( = ?auto_714236 ?auto_714245 ) ) ( not ( = ?auto_714236 ?auto_714246 ) ) ( not ( = ?auto_714236 ?auto_714247 ) ) ( not ( = ?auto_714236 ?auto_714248 ) ) ( not ( = ?auto_714237 ?auto_714238 ) ) ( not ( = ?auto_714237 ?auto_714239 ) ) ( not ( = ?auto_714237 ?auto_714240 ) ) ( not ( = ?auto_714237 ?auto_714241 ) ) ( not ( = ?auto_714237 ?auto_714242 ) ) ( not ( = ?auto_714237 ?auto_714243 ) ) ( not ( = ?auto_714237 ?auto_714244 ) ) ( not ( = ?auto_714237 ?auto_714245 ) ) ( not ( = ?auto_714237 ?auto_714246 ) ) ( not ( = ?auto_714237 ?auto_714247 ) ) ( not ( = ?auto_714237 ?auto_714248 ) ) ( not ( = ?auto_714238 ?auto_714239 ) ) ( not ( = ?auto_714238 ?auto_714240 ) ) ( not ( = ?auto_714238 ?auto_714241 ) ) ( not ( = ?auto_714238 ?auto_714242 ) ) ( not ( = ?auto_714238 ?auto_714243 ) ) ( not ( = ?auto_714238 ?auto_714244 ) ) ( not ( = ?auto_714238 ?auto_714245 ) ) ( not ( = ?auto_714238 ?auto_714246 ) ) ( not ( = ?auto_714238 ?auto_714247 ) ) ( not ( = ?auto_714238 ?auto_714248 ) ) ( not ( = ?auto_714239 ?auto_714240 ) ) ( not ( = ?auto_714239 ?auto_714241 ) ) ( not ( = ?auto_714239 ?auto_714242 ) ) ( not ( = ?auto_714239 ?auto_714243 ) ) ( not ( = ?auto_714239 ?auto_714244 ) ) ( not ( = ?auto_714239 ?auto_714245 ) ) ( not ( = ?auto_714239 ?auto_714246 ) ) ( not ( = ?auto_714239 ?auto_714247 ) ) ( not ( = ?auto_714239 ?auto_714248 ) ) ( not ( = ?auto_714240 ?auto_714241 ) ) ( not ( = ?auto_714240 ?auto_714242 ) ) ( not ( = ?auto_714240 ?auto_714243 ) ) ( not ( = ?auto_714240 ?auto_714244 ) ) ( not ( = ?auto_714240 ?auto_714245 ) ) ( not ( = ?auto_714240 ?auto_714246 ) ) ( not ( = ?auto_714240 ?auto_714247 ) ) ( not ( = ?auto_714240 ?auto_714248 ) ) ( not ( = ?auto_714241 ?auto_714242 ) ) ( not ( = ?auto_714241 ?auto_714243 ) ) ( not ( = ?auto_714241 ?auto_714244 ) ) ( not ( = ?auto_714241 ?auto_714245 ) ) ( not ( = ?auto_714241 ?auto_714246 ) ) ( not ( = ?auto_714241 ?auto_714247 ) ) ( not ( = ?auto_714241 ?auto_714248 ) ) ( not ( = ?auto_714242 ?auto_714243 ) ) ( not ( = ?auto_714242 ?auto_714244 ) ) ( not ( = ?auto_714242 ?auto_714245 ) ) ( not ( = ?auto_714242 ?auto_714246 ) ) ( not ( = ?auto_714242 ?auto_714247 ) ) ( not ( = ?auto_714242 ?auto_714248 ) ) ( not ( = ?auto_714243 ?auto_714244 ) ) ( not ( = ?auto_714243 ?auto_714245 ) ) ( not ( = ?auto_714243 ?auto_714246 ) ) ( not ( = ?auto_714243 ?auto_714247 ) ) ( not ( = ?auto_714243 ?auto_714248 ) ) ( not ( = ?auto_714244 ?auto_714245 ) ) ( not ( = ?auto_714244 ?auto_714246 ) ) ( not ( = ?auto_714244 ?auto_714247 ) ) ( not ( = ?auto_714244 ?auto_714248 ) ) ( not ( = ?auto_714245 ?auto_714246 ) ) ( not ( = ?auto_714245 ?auto_714247 ) ) ( not ( = ?auto_714245 ?auto_714248 ) ) ( not ( = ?auto_714246 ?auto_714247 ) ) ( not ( = ?auto_714246 ?auto_714248 ) ) ( not ( = ?auto_714247 ?auto_714248 ) ) ( ON ?auto_714246 ?auto_714247 ) ( CLEAR ?auto_714244 ) ( ON ?auto_714245 ?auto_714246 ) ( CLEAR ?auto_714245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_714233 ?auto_714234 ?auto_714235 ?auto_714236 ?auto_714237 ?auto_714238 ?auto_714239 ?auto_714240 ?auto_714241 ?auto_714242 ?auto_714243 ?auto_714244 ?auto_714245 )
      ( MAKE-15PILE ?auto_714233 ?auto_714234 ?auto_714235 ?auto_714236 ?auto_714237 ?auto_714238 ?auto_714239 ?auto_714240 ?auto_714241 ?auto_714242 ?auto_714243 ?auto_714244 ?auto_714245 ?auto_714246 ?auto_714247 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714295 - BLOCK
      ?auto_714296 - BLOCK
      ?auto_714297 - BLOCK
      ?auto_714298 - BLOCK
      ?auto_714299 - BLOCK
      ?auto_714300 - BLOCK
      ?auto_714301 - BLOCK
      ?auto_714302 - BLOCK
      ?auto_714303 - BLOCK
      ?auto_714304 - BLOCK
      ?auto_714305 - BLOCK
      ?auto_714306 - BLOCK
      ?auto_714307 - BLOCK
      ?auto_714308 - BLOCK
      ?auto_714309 - BLOCK
    )
    :vars
    (
      ?auto_714310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714309 ?auto_714310 ) ( ON-TABLE ?auto_714295 ) ( ON ?auto_714296 ?auto_714295 ) ( ON ?auto_714297 ?auto_714296 ) ( ON ?auto_714298 ?auto_714297 ) ( ON ?auto_714299 ?auto_714298 ) ( ON ?auto_714300 ?auto_714299 ) ( ON ?auto_714301 ?auto_714300 ) ( ON ?auto_714302 ?auto_714301 ) ( ON ?auto_714303 ?auto_714302 ) ( ON ?auto_714304 ?auto_714303 ) ( ON ?auto_714305 ?auto_714304 ) ( not ( = ?auto_714295 ?auto_714296 ) ) ( not ( = ?auto_714295 ?auto_714297 ) ) ( not ( = ?auto_714295 ?auto_714298 ) ) ( not ( = ?auto_714295 ?auto_714299 ) ) ( not ( = ?auto_714295 ?auto_714300 ) ) ( not ( = ?auto_714295 ?auto_714301 ) ) ( not ( = ?auto_714295 ?auto_714302 ) ) ( not ( = ?auto_714295 ?auto_714303 ) ) ( not ( = ?auto_714295 ?auto_714304 ) ) ( not ( = ?auto_714295 ?auto_714305 ) ) ( not ( = ?auto_714295 ?auto_714306 ) ) ( not ( = ?auto_714295 ?auto_714307 ) ) ( not ( = ?auto_714295 ?auto_714308 ) ) ( not ( = ?auto_714295 ?auto_714309 ) ) ( not ( = ?auto_714295 ?auto_714310 ) ) ( not ( = ?auto_714296 ?auto_714297 ) ) ( not ( = ?auto_714296 ?auto_714298 ) ) ( not ( = ?auto_714296 ?auto_714299 ) ) ( not ( = ?auto_714296 ?auto_714300 ) ) ( not ( = ?auto_714296 ?auto_714301 ) ) ( not ( = ?auto_714296 ?auto_714302 ) ) ( not ( = ?auto_714296 ?auto_714303 ) ) ( not ( = ?auto_714296 ?auto_714304 ) ) ( not ( = ?auto_714296 ?auto_714305 ) ) ( not ( = ?auto_714296 ?auto_714306 ) ) ( not ( = ?auto_714296 ?auto_714307 ) ) ( not ( = ?auto_714296 ?auto_714308 ) ) ( not ( = ?auto_714296 ?auto_714309 ) ) ( not ( = ?auto_714296 ?auto_714310 ) ) ( not ( = ?auto_714297 ?auto_714298 ) ) ( not ( = ?auto_714297 ?auto_714299 ) ) ( not ( = ?auto_714297 ?auto_714300 ) ) ( not ( = ?auto_714297 ?auto_714301 ) ) ( not ( = ?auto_714297 ?auto_714302 ) ) ( not ( = ?auto_714297 ?auto_714303 ) ) ( not ( = ?auto_714297 ?auto_714304 ) ) ( not ( = ?auto_714297 ?auto_714305 ) ) ( not ( = ?auto_714297 ?auto_714306 ) ) ( not ( = ?auto_714297 ?auto_714307 ) ) ( not ( = ?auto_714297 ?auto_714308 ) ) ( not ( = ?auto_714297 ?auto_714309 ) ) ( not ( = ?auto_714297 ?auto_714310 ) ) ( not ( = ?auto_714298 ?auto_714299 ) ) ( not ( = ?auto_714298 ?auto_714300 ) ) ( not ( = ?auto_714298 ?auto_714301 ) ) ( not ( = ?auto_714298 ?auto_714302 ) ) ( not ( = ?auto_714298 ?auto_714303 ) ) ( not ( = ?auto_714298 ?auto_714304 ) ) ( not ( = ?auto_714298 ?auto_714305 ) ) ( not ( = ?auto_714298 ?auto_714306 ) ) ( not ( = ?auto_714298 ?auto_714307 ) ) ( not ( = ?auto_714298 ?auto_714308 ) ) ( not ( = ?auto_714298 ?auto_714309 ) ) ( not ( = ?auto_714298 ?auto_714310 ) ) ( not ( = ?auto_714299 ?auto_714300 ) ) ( not ( = ?auto_714299 ?auto_714301 ) ) ( not ( = ?auto_714299 ?auto_714302 ) ) ( not ( = ?auto_714299 ?auto_714303 ) ) ( not ( = ?auto_714299 ?auto_714304 ) ) ( not ( = ?auto_714299 ?auto_714305 ) ) ( not ( = ?auto_714299 ?auto_714306 ) ) ( not ( = ?auto_714299 ?auto_714307 ) ) ( not ( = ?auto_714299 ?auto_714308 ) ) ( not ( = ?auto_714299 ?auto_714309 ) ) ( not ( = ?auto_714299 ?auto_714310 ) ) ( not ( = ?auto_714300 ?auto_714301 ) ) ( not ( = ?auto_714300 ?auto_714302 ) ) ( not ( = ?auto_714300 ?auto_714303 ) ) ( not ( = ?auto_714300 ?auto_714304 ) ) ( not ( = ?auto_714300 ?auto_714305 ) ) ( not ( = ?auto_714300 ?auto_714306 ) ) ( not ( = ?auto_714300 ?auto_714307 ) ) ( not ( = ?auto_714300 ?auto_714308 ) ) ( not ( = ?auto_714300 ?auto_714309 ) ) ( not ( = ?auto_714300 ?auto_714310 ) ) ( not ( = ?auto_714301 ?auto_714302 ) ) ( not ( = ?auto_714301 ?auto_714303 ) ) ( not ( = ?auto_714301 ?auto_714304 ) ) ( not ( = ?auto_714301 ?auto_714305 ) ) ( not ( = ?auto_714301 ?auto_714306 ) ) ( not ( = ?auto_714301 ?auto_714307 ) ) ( not ( = ?auto_714301 ?auto_714308 ) ) ( not ( = ?auto_714301 ?auto_714309 ) ) ( not ( = ?auto_714301 ?auto_714310 ) ) ( not ( = ?auto_714302 ?auto_714303 ) ) ( not ( = ?auto_714302 ?auto_714304 ) ) ( not ( = ?auto_714302 ?auto_714305 ) ) ( not ( = ?auto_714302 ?auto_714306 ) ) ( not ( = ?auto_714302 ?auto_714307 ) ) ( not ( = ?auto_714302 ?auto_714308 ) ) ( not ( = ?auto_714302 ?auto_714309 ) ) ( not ( = ?auto_714302 ?auto_714310 ) ) ( not ( = ?auto_714303 ?auto_714304 ) ) ( not ( = ?auto_714303 ?auto_714305 ) ) ( not ( = ?auto_714303 ?auto_714306 ) ) ( not ( = ?auto_714303 ?auto_714307 ) ) ( not ( = ?auto_714303 ?auto_714308 ) ) ( not ( = ?auto_714303 ?auto_714309 ) ) ( not ( = ?auto_714303 ?auto_714310 ) ) ( not ( = ?auto_714304 ?auto_714305 ) ) ( not ( = ?auto_714304 ?auto_714306 ) ) ( not ( = ?auto_714304 ?auto_714307 ) ) ( not ( = ?auto_714304 ?auto_714308 ) ) ( not ( = ?auto_714304 ?auto_714309 ) ) ( not ( = ?auto_714304 ?auto_714310 ) ) ( not ( = ?auto_714305 ?auto_714306 ) ) ( not ( = ?auto_714305 ?auto_714307 ) ) ( not ( = ?auto_714305 ?auto_714308 ) ) ( not ( = ?auto_714305 ?auto_714309 ) ) ( not ( = ?auto_714305 ?auto_714310 ) ) ( not ( = ?auto_714306 ?auto_714307 ) ) ( not ( = ?auto_714306 ?auto_714308 ) ) ( not ( = ?auto_714306 ?auto_714309 ) ) ( not ( = ?auto_714306 ?auto_714310 ) ) ( not ( = ?auto_714307 ?auto_714308 ) ) ( not ( = ?auto_714307 ?auto_714309 ) ) ( not ( = ?auto_714307 ?auto_714310 ) ) ( not ( = ?auto_714308 ?auto_714309 ) ) ( not ( = ?auto_714308 ?auto_714310 ) ) ( not ( = ?auto_714309 ?auto_714310 ) ) ( ON ?auto_714308 ?auto_714309 ) ( ON ?auto_714307 ?auto_714308 ) ( CLEAR ?auto_714305 ) ( ON ?auto_714306 ?auto_714307 ) ( CLEAR ?auto_714306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_714295 ?auto_714296 ?auto_714297 ?auto_714298 ?auto_714299 ?auto_714300 ?auto_714301 ?auto_714302 ?auto_714303 ?auto_714304 ?auto_714305 ?auto_714306 )
      ( MAKE-15PILE ?auto_714295 ?auto_714296 ?auto_714297 ?auto_714298 ?auto_714299 ?auto_714300 ?auto_714301 ?auto_714302 ?auto_714303 ?auto_714304 ?auto_714305 ?auto_714306 ?auto_714307 ?auto_714308 ?auto_714309 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714357 - BLOCK
      ?auto_714358 - BLOCK
      ?auto_714359 - BLOCK
      ?auto_714360 - BLOCK
      ?auto_714361 - BLOCK
      ?auto_714362 - BLOCK
      ?auto_714363 - BLOCK
      ?auto_714364 - BLOCK
      ?auto_714365 - BLOCK
      ?auto_714366 - BLOCK
      ?auto_714367 - BLOCK
      ?auto_714368 - BLOCK
      ?auto_714369 - BLOCK
      ?auto_714370 - BLOCK
      ?auto_714371 - BLOCK
    )
    :vars
    (
      ?auto_714372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714371 ?auto_714372 ) ( ON-TABLE ?auto_714357 ) ( ON ?auto_714358 ?auto_714357 ) ( ON ?auto_714359 ?auto_714358 ) ( ON ?auto_714360 ?auto_714359 ) ( ON ?auto_714361 ?auto_714360 ) ( ON ?auto_714362 ?auto_714361 ) ( ON ?auto_714363 ?auto_714362 ) ( ON ?auto_714364 ?auto_714363 ) ( ON ?auto_714365 ?auto_714364 ) ( ON ?auto_714366 ?auto_714365 ) ( not ( = ?auto_714357 ?auto_714358 ) ) ( not ( = ?auto_714357 ?auto_714359 ) ) ( not ( = ?auto_714357 ?auto_714360 ) ) ( not ( = ?auto_714357 ?auto_714361 ) ) ( not ( = ?auto_714357 ?auto_714362 ) ) ( not ( = ?auto_714357 ?auto_714363 ) ) ( not ( = ?auto_714357 ?auto_714364 ) ) ( not ( = ?auto_714357 ?auto_714365 ) ) ( not ( = ?auto_714357 ?auto_714366 ) ) ( not ( = ?auto_714357 ?auto_714367 ) ) ( not ( = ?auto_714357 ?auto_714368 ) ) ( not ( = ?auto_714357 ?auto_714369 ) ) ( not ( = ?auto_714357 ?auto_714370 ) ) ( not ( = ?auto_714357 ?auto_714371 ) ) ( not ( = ?auto_714357 ?auto_714372 ) ) ( not ( = ?auto_714358 ?auto_714359 ) ) ( not ( = ?auto_714358 ?auto_714360 ) ) ( not ( = ?auto_714358 ?auto_714361 ) ) ( not ( = ?auto_714358 ?auto_714362 ) ) ( not ( = ?auto_714358 ?auto_714363 ) ) ( not ( = ?auto_714358 ?auto_714364 ) ) ( not ( = ?auto_714358 ?auto_714365 ) ) ( not ( = ?auto_714358 ?auto_714366 ) ) ( not ( = ?auto_714358 ?auto_714367 ) ) ( not ( = ?auto_714358 ?auto_714368 ) ) ( not ( = ?auto_714358 ?auto_714369 ) ) ( not ( = ?auto_714358 ?auto_714370 ) ) ( not ( = ?auto_714358 ?auto_714371 ) ) ( not ( = ?auto_714358 ?auto_714372 ) ) ( not ( = ?auto_714359 ?auto_714360 ) ) ( not ( = ?auto_714359 ?auto_714361 ) ) ( not ( = ?auto_714359 ?auto_714362 ) ) ( not ( = ?auto_714359 ?auto_714363 ) ) ( not ( = ?auto_714359 ?auto_714364 ) ) ( not ( = ?auto_714359 ?auto_714365 ) ) ( not ( = ?auto_714359 ?auto_714366 ) ) ( not ( = ?auto_714359 ?auto_714367 ) ) ( not ( = ?auto_714359 ?auto_714368 ) ) ( not ( = ?auto_714359 ?auto_714369 ) ) ( not ( = ?auto_714359 ?auto_714370 ) ) ( not ( = ?auto_714359 ?auto_714371 ) ) ( not ( = ?auto_714359 ?auto_714372 ) ) ( not ( = ?auto_714360 ?auto_714361 ) ) ( not ( = ?auto_714360 ?auto_714362 ) ) ( not ( = ?auto_714360 ?auto_714363 ) ) ( not ( = ?auto_714360 ?auto_714364 ) ) ( not ( = ?auto_714360 ?auto_714365 ) ) ( not ( = ?auto_714360 ?auto_714366 ) ) ( not ( = ?auto_714360 ?auto_714367 ) ) ( not ( = ?auto_714360 ?auto_714368 ) ) ( not ( = ?auto_714360 ?auto_714369 ) ) ( not ( = ?auto_714360 ?auto_714370 ) ) ( not ( = ?auto_714360 ?auto_714371 ) ) ( not ( = ?auto_714360 ?auto_714372 ) ) ( not ( = ?auto_714361 ?auto_714362 ) ) ( not ( = ?auto_714361 ?auto_714363 ) ) ( not ( = ?auto_714361 ?auto_714364 ) ) ( not ( = ?auto_714361 ?auto_714365 ) ) ( not ( = ?auto_714361 ?auto_714366 ) ) ( not ( = ?auto_714361 ?auto_714367 ) ) ( not ( = ?auto_714361 ?auto_714368 ) ) ( not ( = ?auto_714361 ?auto_714369 ) ) ( not ( = ?auto_714361 ?auto_714370 ) ) ( not ( = ?auto_714361 ?auto_714371 ) ) ( not ( = ?auto_714361 ?auto_714372 ) ) ( not ( = ?auto_714362 ?auto_714363 ) ) ( not ( = ?auto_714362 ?auto_714364 ) ) ( not ( = ?auto_714362 ?auto_714365 ) ) ( not ( = ?auto_714362 ?auto_714366 ) ) ( not ( = ?auto_714362 ?auto_714367 ) ) ( not ( = ?auto_714362 ?auto_714368 ) ) ( not ( = ?auto_714362 ?auto_714369 ) ) ( not ( = ?auto_714362 ?auto_714370 ) ) ( not ( = ?auto_714362 ?auto_714371 ) ) ( not ( = ?auto_714362 ?auto_714372 ) ) ( not ( = ?auto_714363 ?auto_714364 ) ) ( not ( = ?auto_714363 ?auto_714365 ) ) ( not ( = ?auto_714363 ?auto_714366 ) ) ( not ( = ?auto_714363 ?auto_714367 ) ) ( not ( = ?auto_714363 ?auto_714368 ) ) ( not ( = ?auto_714363 ?auto_714369 ) ) ( not ( = ?auto_714363 ?auto_714370 ) ) ( not ( = ?auto_714363 ?auto_714371 ) ) ( not ( = ?auto_714363 ?auto_714372 ) ) ( not ( = ?auto_714364 ?auto_714365 ) ) ( not ( = ?auto_714364 ?auto_714366 ) ) ( not ( = ?auto_714364 ?auto_714367 ) ) ( not ( = ?auto_714364 ?auto_714368 ) ) ( not ( = ?auto_714364 ?auto_714369 ) ) ( not ( = ?auto_714364 ?auto_714370 ) ) ( not ( = ?auto_714364 ?auto_714371 ) ) ( not ( = ?auto_714364 ?auto_714372 ) ) ( not ( = ?auto_714365 ?auto_714366 ) ) ( not ( = ?auto_714365 ?auto_714367 ) ) ( not ( = ?auto_714365 ?auto_714368 ) ) ( not ( = ?auto_714365 ?auto_714369 ) ) ( not ( = ?auto_714365 ?auto_714370 ) ) ( not ( = ?auto_714365 ?auto_714371 ) ) ( not ( = ?auto_714365 ?auto_714372 ) ) ( not ( = ?auto_714366 ?auto_714367 ) ) ( not ( = ?auto_714366 ?auto_714368 ) ) ( not ( = ?auto_714366 ?auto_714369 ) ) ( not ( = ?auto_714366 ?auto_714370 ) ) ( not ( = ?auto_714366 ?auto_714371 ) ) ( not ( = ?auto_714366 ?auto_714372 ) ) ( not ( = ?auto_714367 ?auto_714368 ) ) ( not ( = ?auto_714367 ?auto_714369 ) ) ( not ( = ?auto_714367 ?auto_714370 ) ) ( not ( = ?auto_714367 ?auto_714371 ) ) ( not ( = ?auto_714367 ?auto_714372 ) ) ( not ( = ?auto_714368 ?auto_714369 ) ) ( not ( = ?auto_714368 ?auto_714370 ) ) ( not ( = ?auto_714368 ?auto_714371 ) ) ( not ( = ?auto_714368 ?auto_714372 ) ) ( not ( = ?auto_714369 ?auto_714370 ) ) ( not ( = ?auto_714369 ?auto_714371 ) ) ( not ( = ?auto_714369 ?auto_714372 ) ) ( not ( = ?auto_714370 ?auto_714371 ) ) ( not ( = ?auto_714370 ?auto_714372 ) ) ( not ( = ?auto_714371 ?auto_714372 ) ) ( ON ?auto_714370 ?auto_714371 ) ( ON ?auto_714369 ?auto_714370 ) ( ON ?auto_714368 ?auto_714369 ) ( CLEAR ?auto_714366 ) ( ON ?auto_714367 ?auto_714368 ) ( CLEAR ?auto_714367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_714357 ?auto_714358 ?auto_714359 ?auto_714360 ?auto_714361 ?auto_714362 ?auto_714363 ?auto_714364 ?auto_714365 ?auto_714366 ?auto_714367 )
      ( MAKE-15PILE ?auto_714357 ?auto_714358 ?auto_714359 ?auto_714360 ?auto_714361 ?auto_714362 ?auto_714363 ?auto_714364 ?auto_714365 ?auto_714366 ?auto_714367 ?auto_714368 ?auto_714369 ?auto_714370 ?auto_714371 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714419 - BLOCK
      ?auto_714420 - BLOCK
      ?auto_714421 - BLOCK
      ?auto_714422 - BLOCK
      ?auto_714423 - BLOCK
      ?auto_714424 - BLOCK
      ?auto_714425 - BLOCK
      ?auto_714426 - BLOCK
      ?auto_714427 - BLOCK
      ?auto_714428 - BLOCK
      ?auto_714429 - BLOCK
      ?auto_714430 - BLOCK
      ?auto_714431 - BLOCK
      ?auto_714432 - BLOCK
      ?auto_714433 - BLOCK
    )
    :vars
    (
      ?auto_714434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714433 ?auto_714434 ) ( ON-TABLE ?auto_714419 ) ( ON ?auto_714420 ?auto_714419 ) ( ON ?auto_714421 ?auto_714420 ) ( ON ?auto_714422 ?auto_714421 ) ( ON ?auto_714423 ?auto_714422 ) ( ON ?auto_714424 ?auto_714423 ) ( ON ?auto_714425 ?auto_714424 ) ( ON ?auto_714426 ?auto_714425 ) ( ON ?auto_714427 ?auto_714426 ) ( not ( = ?auto_714419 ?auto_714420 ) ) ( not ( = ?auto_714419 ?auto_714421 ) ) ( not ( = ?auto_714419 ?auto_714422 ) ) ( not ( = ?auto_714419 ?auto_714423 ) ) ( not ( = ?auto_714419 ?auto_714424 ) ) ( not ( = ?auto_714419 ?auto_714425 ) ) ( not ( = ?auto_714419 ?auto_714426 ) ) ( not ( = ?auto_714419 ?auto_714427 ) ) ( not ( = ?auto_714419 ?auto_714428 ) ) ( not ( = ?auto_714419 ?auto_714429 ) ) ( not ( = ?auto_714419 ?auto_714430 ) ) ( not ( = ?auto_714419 ?auto_714431 ) ) ( not ( = ?auto_714419 ?auto_714432 ) ) ( not ( = ?auto_714419 ?auto_714433 ) ) ( not ( = ?auto_714419 ?auto_714434 ) ) ( not ( = ?auto_714420 ?auto_714421 ) ) ( not ( = ?auto_714420 ?auto_714422 ) ) ( not ( = ?auto_714420 ?auto_714423 ) ) ( not ( = ?auto_714420 ?auto_714424 ) ) ( not ( = ?auto_714420 ?auto_714425 ) ) ( not ( = ?auto_714420 ?auto_714426 ) ) ( not ( = ?auto_714420 ?auto_714427 ) ) ( not ( = ?auto_714420 ?auto_714428 ) ) ( not ( = ?auto_714420 ?auto_714429 ) ) ( not ( = ?auto_714420 ?auto_714430 ) ) ( not ( = ?auto_714420 ?auto_714431 ) ) ( not ( = ?auto_714420 ?auto_714432 ) ) ( not ( = ?auto_714420 ?auto_714433 ) ) ( not ( = ?auto_714420 ?auto_714434 ) ) ( not ( = ?auto_714421 ?auto_714422 ) ) ( not ( = ?auto_714421 ?auto_714423 ) ) ( not ( = ?auto_714421 ?auto_714424 ) ) ( not ( = ?auto_714421 ?auto_714425 ) ) ( not ( = ?auto_714421 ?auto_714426 ) ) ( not ( = ?auto_714421 ?auto_714427 ) ) ( not ( = ?auto_714421 ?auto_714428 ) ) ( not ( = ?auto_714421 ?auto_714429 ) ) ( not ( = ?auto_714421 ?auto_714430 ) ) ( not ( = ?auto_714421 ?auto_714431 ) ) ( not ( = ?auto_714421 ?auto_714432 ) ) ( not ( = ?auto_714421 ?auto_714433 ) ) ( not ( = ?auto_714421 ?auto_714434 ) ) ( not ( = ?auto_714422 ?auto_714423 ) ) ( not ( = ?auto_714422 ?auto_714424 ) ) ( not ( = ?auto_714422 ?auto_714425 ) ) ( not ( = ?auto_714422 ?auto_714426 ) ) ( not ( = ?auto_714422 ?auto_714427 ) ) ( not ( = ?auto_714422 ?auto_714428 ) ) ( not ( = ?auto_714422 ?auto_714429 ) ) ( not ( = ?auto_714422 ?auto_714430 ) ) ( not ( = ?auto_714422 ?auto_714431 ) ) ( not ( = ?auto_714422 ?auto_714432 ) ) ( not ( = ?auto_714422 ?auto_714433 ) ) ( not ( = ?auto_714422 ?auto_714434 ) ) ( not ( = ?auto_714423 ?auto_714424 ) ) ( not ( = ?auto_714423 ?auto_714425 ) ) ( not ( = ?auto_714423 ?auto_714426 ) ) ( not ( = ?auto_714423 ?auto_714427 ) ) ( not ( = ?auto_714423 ?auto_714428 ) ) ( not ( = ?auto_714423 ?auto_714429 ) ) ( not ( = ?auto_714423 ?auto_714430 ) ) ( not ( = ?auto_714423 ?auto_714431 ) ) ( not ( = ?auto_714423 ?auto_714432 ) ) ( not ( = ?auto_714423 ?auto_714433 ) ) ( not ( = ?auto_714423 ?auto_714434 ) ) ( not ( = ?auto_714424 ?auto_714425 ) ) ( not ( = ?auto_714424 ?auto_714426 ) ) ( not ( = ?auto_714424 ?auto_714427 ) ) ( not ( = ?auto_714424 ?auto_714428 ) ) ( not ( = ?auto_714424 ?auto_714429 ) ) ( not ( = ?auto_714424 ?auto_714430 ) ) ( not ( = ?auto_714424 ?auto_714431 ) ) ( not ( = ?auto_714424 ?auto_714432 ) ) ( not ( = ?auto_714424 ?auto_714433 ) ) ( not ( = ?auto_714424 ?auto_714434 ) ) ( not ( = ?auto_714425 ?auto_714426 ) ) ( not ( = ?auto_714425 ?auto_714427 ) ) ( not ( = ?auto_714425 ?auto_714428 ) ) ( not ( = ?auto_714425 ?auto_714429 ) ) ( not ( = ?auto_714425 ?auto_714430 ) ) ( not ( = ?auto_714425 ?auto_714431 ) ) ( not ( = ?auto_714425 ?auto_714432 ) ) ( not ( = ?auto_714425 ?auto_714433 ) ) ( not ( = ?auto_714425 ?auto_714434 ) ) ( not ( = ?auto_714426 ?auto_714427 ) ) ( not ( = ?auto_714426 ?auto_714428 ) ) ( not ( = ?auto_714426 ?auto_714429 ) ) ( not ( = ?auto_714426 ?auto_714430 ) ) ( not ( = ?auto_714426 ?auto_714431 ) ) ( not ( = ?auto_714426 ?auto_714432 ) ) ( not ( = ?auto_714426 ?auto_714433 ) ) ( not ( = ?auto_714426 ?auto_714434 ) ) ( not ( = ?auto_714427 ?auto_714428 ) ) ( not ( = ?auto_714427 ?auto_714429 ) ) ( not ( = ?auto_714427 ?auto_714430 ) ) ( not ( = ?auto_714427 ?auto_714431 ) ) ( not ( = ?auto_714427 ?auto_714432 ) ) ( not ( = ?auto_714427 ?auto_714433 ) ) ( not ( = ?auto_714427 ?auto_714434 ) ) ( not ( = ?auto_714428 ?auto_714429 ) ) ( not ( = ?auto_714428 ?auto_714430 ) ) ( not ( = ?auto_714428 ?auto_714431 ) ) ( not ( = ?auto_714428 ?auto_714432 ) ) ( not ( = ?auto_714428 ?auto_714433 ) ) ( not ( = ?auto_714428 ?auto_714434 ) ) ( not ( = ?auto_714429 ?auto_714430 ) ) ( not ( = ?auto_714429 ?auto_714431 ) ) ( not ( = ?auto_714429 ?auto_714432 ) ) ( not ( = ?auto_714429 ?auto_714433 ) ) ( not ( = ?auto_714429 ?auto_714434 ) ) ( not ( = ?auto_714430 ?auto_714431 ) ) ( not ( = ?auto_714430 ?auto_714432 ) ) ( not ( = ?auto_714430 ?auto_714433 ) ) ( not ( = ?auto_714430 ?auto_714434 ) ) ( not ( = ?auto_714431 ?auto_714432 ) ) ( not ( = ?auto_714431 ?auto_714433 ) ) ( not ( = ?auto_714431 ?auto_714434 ) ) ( not ( = ?auto_714432 ?auto_714433 ) ) ( not ( = ?auto_714432 ?auto_714434 ) ) ( not ( = ?auto_714433 ?auto_714434 ) ) ( ON ?auto_714432 ?auto_714433 ) ( ON ?auto_714431 ?auto_714432 ) ( ON ?auto_714430 ?auto_714431 ) ( ON ?auto_714429 ?auto_714430 ) ( CLEAR ?auto_714427 ) ( ON ?auto_714428 ?auto_714429 ) ( CLEAR ?auto_714428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_714419 ?auto_714420 ?auto_714421 ?auto_714422 ?auto_714423 ?auto_714424 ?auto_714425 ?auto_714426 ?auto_714427 ?auto_714428 )
      ( MAKE-15PILE ?auto_714419 ?auto_714420 ?auto_714421 ?auto_714422 ?auto_714423 ?auto_714424 ?auto_714425 ?auto_714426 ?auto_714427 ?auto_714428 ?auto_714429 ?auto_714430 ?auto_714431 ?auto_714432 ?auto_714433 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714481 - BLOCK
      ?auto_714482 - BLOCK
      ?auto_714483 - BLOCK
      ?auto_714484 - BLOCK
      ?auto_714485 - BLOCK
      ?auto_714486 - BLOCK
      ?auto_714487 - BLOCK
      ?auto_714488 - BLOCK
      ?auto_714489 - BLOCK
      ?auto_714490 - BLOCK
      ?auto_714491 - BLOCK
      ?auto_714492 - BLOCK
      ?auto_714493 - BLOCK
      ?auto_714494 - BLOCK
      ?auto_714495 - BLOCK
    )
    :vars
    (
      ?auto_714496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714495 ?auto_714496 ) ( ON-TABLE ?auto_714481 ) ( ON ?auto_714482 ?auto_714481 ) ( ON ?auto_714483 ?auto_714482 ) ( ON ?auto_714484 ?auto_714483 ) ( ON ?auto_714485 ?auto_714484 ) ( ON ?auto_714486 ?auto_714485 ) ( ON ?auto_714487 ?auto_714486 ) ( ON ?auto_714488 ?auto_714487 ) ( not ( = ?auto_714481 ?auto_714482 ) ) ( not ( = ?auto_714481 ?auto_714483 ) ) ( not ( = ?auto_714481 ?auto_714484 ) ) ( not ( = ?auto_714481 ?auto_714485 ) ) ( not ( = ?auto_714481 ?auto_714486 ) ) ( not ( = ?auto_714481 ?auto_714487 ) ) ( not ( = ?auto_714481 ?auto_714488 ) ) ( not ( = ?auto_714481 ?auto_714489 ) ) ( not ( = ?auto_714481 ?auto_714490 ) ) ( not ( = ?auto_714481 ?auto_714491 ) ) ( not ( = ?auto_714481 ?auto_714492 ) ) ( not ( = ?auto_714481 ?auto_714493 ) ) ( not ( = ?auto_714481 ?auto_714494 ) ) ( not ( = ?auto_714481 ?auto_714495 ) ) ( not ( = ?auto_714481 ?auto_714496 ) ) ( not ( = ?auto_714482 ?auto_714483 ) ) ( not ( = ?auto_714482 ?auto_714484 ) ) ( not ( = ?auto_714482 ?auto_714485 ) ) ( not ( = ?auto_714482 ?auto_714486 ) ) ( not ( = ?auto_714482 ?auto_714487 ) ) ( not ( = ?auto_714482 ?auto_714488 ) ) ( not ( = ?auto_714482 ?auto_714489 ) ) ( not ( = ?auto_714482 ?auto_714490 ) ) ( not ( = ?auto_714482 ?auto_714491 ) ) ( not ( = ?auto_714482 ?auto_714492 ) ) ( not ( = ?auto_714482 ?auto_714493 ) ) ( not ( = ?auto_714482 ?auto_714494 ) ) ( not ( = ?auto_714482 ?auto_714495 ) ) ( not ( = ?auto_714482 ?auto_714496 ) ) ( not ( = ?auto_714483 ?auto_714484 ) ) ( not ( = ?auto_714483 ?auto_714485 ) ) ( not ( = ?auto_714483 ?auto_714486 ) ) ( not ( = ?auto_714483 ?auto_714487 ) ) ( not ( = ?auto_714483 ?auto_714488 ) ) ( not ( = ?auto_714483 ?auto_714489 ) ) ( not ( = ?auto_714483 ?auto_714490 ) ) ( not ( = ?auto_714483 ?auto_714491 ) ) ( not ( = ?auto_714483 ?auto_714492 ) ) ( not ( = ?auto_714483 ?auto_714493 ) ) ( not ( = ?auto_714483 ?auto_714494 ) ) ( not ( = ?auto_714483 ?auto_714495 ) ) ( not ( = ?auto_714483 ?auto_714496 ) ) ( not ( = ?auto_714484 ?auto_714485 ) ) ( not ( = ?auto_714484 ?auto_714486 ) ) ( not ( = ?auto_714484 ?auto_714487 ) ) ( not ( = ?auto_714484 ?auto_714488 ) ) ( not ( = ?auto_714484 ?auto_714489 ) ) ( not ( = ?auto_714484 ?auto_714490 ) ) ( not ( = ?auto_714484 ?auto_714491 ) ) ( not ( = ?auto_714484 ?auto_714492 ) ) ( not ( = ?auto_714484 ?auto_714493 ) ) ( not ( = ?auto_714484 ?auto_714494 ) ) ( not ( = ?auto_714484 ?auto_714495 ) ) ( not ( = ?auto_714484 ?auto_714496 ) ) ( not ( = ?auto_714485 ?auto_714486 ) ) ( not ( = ?auto_714485 ?auto_714487 ) ) ( not ( = ?auto_714485 ?auto_714488 ) ) ( not ( = ?auto_714485 ?auto_714489 ) ) ( not ( = ?auto_714485 ?auto_714490 ) ) ( not ( = ?auto_714485 ?auto_714491 ) ) ( not ( = ?auto_714485 ?auto_714492 ) ) ( not ( = ?auto_714485 ?auto_714493 ) ) ( not ( = ?auto_714485 ?auto_714494 ) ) ( not ( = ?auto_714485 ?auto_714495 ) ) ( not ( = ?auto_714485 ?auto_714496 ) ) ( not ( = ?auto_714486 ?auto_714487 ) ) ( not ( = ?auto_714486 ?auto_714488 ) ) ( not ( = ?auto_714486 ?auto_714489 ) ) ( not ( = ?auto_714486 ?auto_714490 ) ) ( not ( = ?auto_714486 ?auto_714491 ) ) ( not ( = ?auto_714486 ?auto_714492 ) ) ( not ( = ?auto_714486 ?auto_714493 ) ) ( not ( = ?auto_714486 ?auto_714494 ) ) ( not ( = ?auto_714486 ?auto_714495 ) ) ( not ( = ?auto_714486 ?auto_714496 ) ) ( not ( = ?auto_714487 ?auto_714488 ) ) ( not ( = ?auto_714487 ?auto_714489 ) ) ( not ( = ?auto_714487 ?auto_714490 ) ) ( not ( = ?auto_714487 ?auto_714491 ) ) ( not ( = ?auto_714487 ?auto_714492 ) ) ( not ( = ?auto_714487 ?auto_714493 ) ) ( not ( = ?auto_714487 ?auto_714494 ) ) ( not ( = ?auto_714487 ?auto_714495 ) ) ( not ( = ?auto_714487 ?auto_714496 ) ) ( not ( = ?auto_714488 ?auto_714489 ) ) ( not ( = ?auto_714488 ?auto_714490 ) ) ( not ( = ?auto_714488 ?auto_714491 ) ) ( not ( = ?auto_714488 ?auto_714492 ) ) ( not ( = ?auto_714488 ?auto_714493 ) ) ( not ( = ?auto_714488 ?auto_714494 ) ) ( not ( = ?auto_714488 ?auto_714495 ) ) ( not ( = ?auto_714488 ?auto_714496 ) ) ( not ( = ?auto_714489 ?auto_714490 ) ) ( not ( = ?auto_714489 ?auto_714491 ) ) ( not ( = ?auto_714489 ?auto_714492 ) ) ( not ( = ?auto_714489 ?auto_714493 ) ) ( not ( = ?auto_714489 ?auto_714494 ) ) ( not ( = ?auto_714489 ?auto_714495 ) ) ( not ( = ?auto_714489 ?auto_714496 ) ) ( not ( = ?auto_714490 ?auto_714491 ) ) ( not ( = ?auto_714490 ?auto_714492 ) ) ( not ( = ?auto_714490 ?auto_714493 ) ) ( not ( = ?auto_714490 ?auto_714494 ) ) ( not ( = ?auto_714490 ?auto_714495 ) ) ( not ( = ?auto_714490 ?auto_714496 ) ) ( not ( = ?auto_714491 ?auto_714492 ) ) ( not ( = ?auto_714491 ?auto_714493 ) ) ( not ( = ?auto_714491 ?auto_714494 ) ) ( not ( = ?auto_714491 ?auto_714495 ) ) ( not ( = ?auto_714491 ?auto_714496 ) ) ( not ( = ?auto_714492 ?auto_714493 ) ) ( not ( = ?auto_714492 ?auto_714494 ) ) ( not ( = ?auto_714492 ?auto_714495 ) ) ( not ( = ?auto_714492 ?auto_714496 ) ) ( not ( = ?auto_714493 ?auto_714494 ) ) ( not ( = ?auto_714493 ?auto_714495 ) ) ( not ( = ?auto_714493 ?auto_714496 ) ) ( not ( = ?auto_714494 ?auto_714495 ) ) ( not ( = ?auto_714494 ?auto_714496 ) ) ( not ( = ?auto_714495 ?auto_714496 ) ) ( ON ?auto_714494 ?auto_714495 ) ( ON ?auto_714493 ?auto_714494 ) ( ON ?auto_714492 ?auto_714493 ) ( ON ?auto_714491 ?auto_714492 ) ( ON ?auto_714490 ?auto_714491 ) ( CLEAR ?auto_714488 ) ( ON ?auto_714489 ?auto_714490 ) ( CLEAR ?auto_714489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_714481 ?auto_714482 ?auto_714483 ?auto_714484 ?auto_714485 ?auto_714486 ?auto_714487 ?auto_714488 ?auto_714489 )
      ( MAKE-15PILE ?auto_714481 ?auto_714482 ?auto_714483 ?auto_714484 ?auto_714485 ?auto_714486 ?auto_714487 ?auto_714488 ?auto_714489 ?auto_714490 ?auto_714491 ?auto_714492 ?auto_714493 ?auto_714494 ?auto_714495 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714543 - BLOCK
      ?auto_714544 - BLOCK
      ?auto_714545 - BLOCK
      ?auto_714546 - BLOCK
      ?auto_714547 - BLOCK
      ?auto_714548 - BLOCK
      ?auto_714549 - BLOCK
      ?auto_714550 - BLOCK
      ?auto_714551 - BLOCK
      ?auto_714552 - BLOCK
      ?auto_714553 - BLOCK
      ?auto_714554 - BLOCK
      ?auto_714555 - BLOCK
      ?auto_714556 - BLOCK
      ?auto_714557 - BLOCK
    )
    :vars
    (
      ?auto_714558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714557 ?auto_714558 ) ( ON-TABLE ?auto_714543 ) ( ON ?auto_714544 ?auto_714543 ) ( ON ?auto_714545 ?auto_714544 ) ( ON ?auto_714546 ?auto_714545 ) ( ON ?auto_714547 ?auto_714546 ) ( ON ?auto_714548 ?auto_714547 ) ( ON ?auto_714549 ?auto_714548 ) ( not ( = ?auto_714543 ?auto_714544 ) ) ( not ( = ?auto_714543 ?auto_714545 ) ) ( not ( = ?auto_714543 ?auto_714546 ) ) ( not ( = ?auto_714543 ?auto_714547 ) ) ( not ( = ?auto_714543 ?auto_714548 ) ) ( not ( = ?auto_714543 ?auto_714549 ) ) ( not ( = ?auto_714543 ?auto_714550 ) ) ( not ( = ?auto_714543 ?auto_714551 ) ) ( not ( = ?auto_714543 ?auto_714552 ) ) ( not ( = ?auto_714543 ?auto_714553 ) ) ( not ( = ?auto_714543 ?auto_714554 ) ) ( not ( = ?auto_714543 ?auto_714555 ) ) ( not ( = ?auto_714543 ?auto_714556 ) ) ( not ( = ?auto_714543 ?auto_714557 ) ) ( not ( = ?auto_714543 ?auto_714558 ) ) ( not ( = ?auto_714544 ?auto_714545 ) ) ( not ( = ?auto_714544 ?auto_714546 ) ) ( not ( = ?auto_714544 ?auto_714547 ) ) ( not ( = ?auto_714544 ?auto_714548 ) ) ( not ( = ?auto_714544 ?auto_714549 ) ) ( not ( = ?auto_714544 ?auto_714550 ) ) ( not ( = ?auto_714544 ?auto_714551 ) ) ( not ( = ?auto_714544 ?auto_714552 ) ) ( not ( = ?auto_714544 ?auto_714553 ) ) ( not ( = ?auto_714544 ?auto_714554 ) ) ( not ( = ?auto_714544 ?auto_714555 ) ) ( not ( = ?auto_714544 ?auto_714556 ) ) ( not ( = ?auto_714544 ?auto_714557 ) ) ( not ( = ?auto_714544 ?auto_714558 ) ) ( not ( = ?auto_714545 ?auto_714546 ) ) ( not ( = ?auto_714545 ?auto_714547 ) ) ( not ( = ?auto_714545 ?auto_714548 ) ) ( not ( = ?auto_714545 ?auto_714549 ) ) ( not ( = ?auto_714545 ?auto_714550 ) ) ( not ( = ?auto_714545 ?auto_714551 ) ) ( not ( = ?auto_714545 ?auto_714552 ) ) ( not ( = ?auto_714545 ?auto_714553 ) ) ( not ( = ?auto_714545 ?auto_714554 ) ) ( not ( = ?auto_714545 ?auto_714555 ) ) ( not ( = ?auto_714545 ?auto_714556 ) ) ( not ( = ?auto_714545 ?auto_714557 ) ) ( not ( = ?auto_714545 ?auto_714558 ) ) ( not ( = ?auto_714546 ?auto_714547 ) ) ( not ( = ?auto_714546 ?auto_714548 ) ) ( not ( = ?auto_714546 ?auto_714549 ) ) ( not ( = ?auto_714546 ?auto_714550 ) ) ( not ( = ?auto_714546 ?auto_714551 ) ) ( not ( = ?auto_714546 ?auto_714552 ) ) ( not ( = ?auto_714546 ?auto_714553 ) ) ( not ( = ?auto_714546 ?auto_714554 ) ) ( not ( = ?auto_714546 ?auto_714555 ) ) ( not ( = ?auto_714546 ?auto_714556 ) ) ( not ( = ?auto_714546 ?auto_714557 ) ) ( not ( = ?auto_714546 ?auto_714558 ) ) ( not ( = ?auto_714547 ?auto_714548 ) ) ( not ( = ?auto_714547 ?auto_714549 ) ) ( not ( = ?auto_714547 ?auto_714550 ) ) ( not ( = ?auto_714547 ?auto_714551 ) ) ( not ( = ?auto_714547 ?auto_714552 ) ) ( not ( = ?auto_714547 ?auto_714553 ) ) ( not ( = ?auto_714547 ?auto_714554 ) ) ( not ( = ?auto_714547 ?auto_714555 ) ) ( not ( = ?auto_714547 ?auto_714556 ) ) ( not ( = ?auto_714547 ?auto_714557 ) ) ( not ( = ?auto_714547 ?auto_714558 ) ) ( not ( = ?auto_714548 ?auto_714549 ) ) ( not ( = ?auto_714548 ?auto_714550 ) ) ( not ( = ?auto_714548 ?auto_714551 ) ) ( not ( = ?auto_714548 ?auto_714552 ) ) ( not ( = ?auto_714548 ?auto_714553 ) ) ( not ( = ?auto_714548 ?auto_714554 ) ) ( not ( = ?auto_714548 ?auto_714555 ) ) ( not ( = ?auto_714548 ?auto_714556 ) ) ( not ( = ?auto_714548 ?auto_714557 ) ) ( not ( = ?auto_714548 ?auto_714558 ) ) ( not ( = ?auto_714549 ?auto_714550 ) ) ( not ( = ?auto_714549 ?auto_714551 ) ) ( not ( = ?auto_714549 ?auto_714552 ) ) ( not ( = ?auto_714549 ?auto_714553 ) ) ( not ( = ?auto_714549 ?auto_714554 ) ) ( not ( = ?auto_714549 ?auto_714555 ) ) ( not ( = ?auto_714549 ?auto_714556 ) ) ( not ( = ?auto_714549 ?auto_714557 ) ) ( not ( = ?auto_714549 ?auto_714558 ) ) ( not ( = ?auto_714550 ?auto_714551 ) ) ( not ( = ?auto_714550 ?auto_714552 ) ) ( not ( = ?auto_714550 ?auto_714553 ) ) ( not ( = ?auto_714550 ?auto_714554 ) ) ( not ( = ?auto_714550 ?auto_714555 ) ) ( not ( = ?auto_714550 ?auto_714556 ) ) ( not ( = ?auto_714550 ?auto_714557 ) ) ( not ( = ?auto_714550 ?auto_714558 ) ) ( not ( = ?auto_714551 ?auto_714552 ) ) ( not ( = ?auto_714551 ?auto_714553 ) ) ( not ( = ?auto_714551 ?auto_714554 ) ) ( not ( = ?auto_714551 ?auto_714555 ) ) ( not ( = ?auto_714551 ?auto_714556 ) ) ( not ( = ?auto_714551 ?auto_714557 ) ) ( not ( = ?auto_714551 ?auto_714558 ) ) ( not ( = ?auto_714552 ?auto_714553 ) ) ( not ( = ?auto_714552 ?auto_714554 ) ) ( not ( = ?auto_714552 ?auto_714555 ) ) ( not ( = ?auto_714552 ?auto_714556 ) ) ( not ( = ?auto_714552 ?auto_714557 ) ) ( not ( = ?auto_714552 ?auto_714558 ) ) ( not ( = ?auto_714553 ?auto_714554 ) ) ( not ( = ?auto_714553 ?auto_714555 ) ) ( not ( = ?auto_714553 ?auto_714556 ) ) ( not ( = ?auto_714553 ?auto_714557 ) ) ( not ( = ?auto_714553 ?auto_714558 ) ) ( not ( = ?auto_714554 ?auto_714555 ) ) ( not ( = ?auto_714554 ?auto_714556 ) ) ( not ( = ?auto_714554 ?auto_714557 ) ) ( not ( = ?auto_714554 ?auto_714558 ) ) ( not ( = ?auto_714555 ?auto_714556 ) ) ( not ( = ?auto_714555 ?auto_714557 ) ) ( not ( = ?auto_714555 ?auto_714558 ) ) ( not ( = ?auto_714556 ?auto_714557 ) ) ( not ( = ?auto_714556 ?auto_714558 ) ) ( not ( = ?auto_714557 ?auto_714558 ) ) ( ON ?auto_714556 ?auto_714557 ) ( ON ?auto_714555 ?auto_714556 ) ( ON ?auto_714554 ?auto_714555 ) ( ON ?auto_714553 ?auto_714554 ) ( ON ?auto_714552 ?auto_714553 ) ( ON ?auto_714551 ?auto_714552 ) ( CLEAR ?auto_714549 ) ( ON ?auto_714550 ?auto_714551 ) ( CLEAR ?auto_714550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_714543 ?auto_714544 ?auto_714545 ?auto_714546 ?auto_714547 ?auto_714548 ?auto_714549 ?auto_714550 )
      ( MAKE-15PILE ?auto_714543 ?auto_714544 ?auto_714545 ?auto_714546 ?auto_714547 ?auto_714548 ?auto_714549 ?auto_714550 ?auto_714551 ?auto_714552 ?auto_714553 ?auto_714554 ?auto_714555 ?auto_714556 ?auto_714557 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714605 - BLOCK
      ?auto_714606 - BLOCK
      ?auto_714607 - BLOCK
      ?auto_714608 - BLOCK
      ?auto_714609 - BLOCK
      ?auto_714610 - BLOCK
      ?auto_714611 - BLOCK
      ?auto_714612 - BLOCK
      ?auto_714613 - BLOCK
      ?auto_714614 - BLOCK
      ?auto_714615 - BLOCK
      ?auto_714616 - BLOCK
      ?auto_714617 - BLOCK
      ?auto_714618 - BLOCK
      ?auto_714619 - BLOCK
    )
    :vars
    (
      ?auto_714620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714619 ?auto_714620 ) ( ON-TABLE ?auto_714605 ) ( ON ?auto_714606 ?auto_714605 ) ( ON ?auto_714607 ?auto_714606 ) ( ON ?auto_714608 ?auto_714607 ) ( ON ?auto_714609 ?auto_714608 ) ( ON ?auto_714610 ?auto_714609 ) ( not ( = ?auto_714605 ?auto_714606 ) ) ( not ( = ?auto_714605 ?auto_714607 ) ) ( not ( = ?auto_714605 ?auto_714608 ) ) ( not ( = ?auto_714605 ?auto_714609 ) ) ( not ( = ?auto_714605 ?auto_714610 ) ) ( not ( = ?auto_714605 ?auto_714611 ) ) ( not ( = ?auto_714605 ?auto_714612 ) ) ( not ( = ?auto_714605 ?auto_714613 ) ) ( not ( = ?auto_714605 ?auto_714614 ) ) ( not ( = ?auto_714605 ?auto_714615 ) ) ( not ( = ?auto_714605 ?auto_714616 ) ) ( not ( = ?auto_714605 ?auto_714617 ) ) ( not ( = ?auto_714605 ?auto_714618 ) ) ( not ( = ?auto_714605 ?auto_714619 ) ) ( not ( = ?auto_714605 ?auto_714620 ) ) ( not ( = ?auto_714606 ?auto_714607 ) ) ( not ( = ?auto_714606 ?auto_714608 ) ) ( not ( = ?auto_714606 ?auto_714609 ) ) ( not ( = ?auto_714606 ?auto_714610 ) ) ( not ( = ?auto_714606 ?auto_714611 ) ) ( not ( = ?auto_714606 ?auto_714612 ) ) ( not ( = ?auto_714606 ?auto_714613 ) ) ( not ( = ?auto_714606 ?auto_714614 ) ) ( not ( = ?auto_714606 ?auto_714615 ) ) ( not ( = ?auto_714606 ?auto_714616 ) ) ( not ( = ?auto_714606 ?auto_714617 ) ) ( not ( = ?auto_714606 ?auto_714618 ) ) ( not ( = ?auto_714606 ?auto_714619 ) ) ( not ( = ?auto_714606 ?auto_714620 ) ) ( not ( = ?auto_714607 ?auto_714608 ) ) ( not ( = ?auto_714607 ?auto_714609 ) ) ( not ( = ?auto_714607 ?auto_714610 ) ) ( not ( = ?auto_714607 ?auto_714611 ) ) ( not ( = ?auto_714607 ?auto_714612 ) ) ( not ( = ?auto_714607 ?auto_714613 ) ) ( not ( = ?auto_714607 ?auto_714614 ) ) ( not ( = ?auto_714607 ?auto_714615 ) ) ( not ( = ?auto_714607 ?auto_714616 ) ) ( not ( = ?auto_714607 ?auto_714617 ) ) ( not ( = ?auto_714607 ?auto_714618 ) ) ( not ( = ?auto_714607 ?auto_714619 ) ) ( not ( = ?auto_714607 ?auto_714620 ) ) ( not ( = ?auto_714608 ?auto_714609 ) ) ( not ( = ?auto_714608 ?auto_714610 ) ) ( not ( = ?auto_714608 ?auto_714611 ) ) ( not ( = ?auto_714608 ?auto_714612 ) ) ( not ( = ?auto_714608 ?auto_714613 ) ) ( not ( = ?auto_714608 ?auto_714614 ) ) ( not ( = ?auto_714608 ?auto_714615 ) ) ( not ( = ?auto_714608 ?auto_714616 ) ) ( not ( = ?auto_714608 ?auto_714617 ) ) ( not ( = ?auto_714608 ?auto_714618 ) ) ( not ( = ?auto_714608 ?auto_714619 ) ) ( not ( = ?auto_714608 ?auto_714620 ) ) ( not ( = ?auto_714609 ?auto_714610 ) ) ( not ( = ?auto_714609 ?auto_714611 ) ) ( not ( = ?auto_714609 ?auto_714612 ) ) ( not ( = ?auto_714609 ?auto_714613 ) ) ( not ( = ?auto_714609 ?auto_714614 ) ) ( not ( = ?auto_714609 ?auto_714615 ) ) ( not ( = ?auto_714609 ?auto_714616 ) ) ( not ( = ?auto_714609 ?auto_714617 ) ) ( not ( = ?auto_714609 ?auto_714618 ) ) ( not ( = ?auto_714609 ?auto_714619 ) ) ( not ( = ?auto_714609 ?auto_714620 ) ) ( not ( = ?auto_714610 ?auto_714611 ) ) ( not ( = ?auto_714610 ?auto_714612 ) ) ( not ( = ?auto_714610 ?auto_714613 ) ) ( not ( = ?auto_714610 ?auto_714614 ) ) ( not ( = ?auto_714610 ?auto_714615 ) ) ( not ( = ?auto_714610 ?auto_714616 ) ) ( not ( = ?auto_714610 ?auto_714617 ) ) ( not ( = ?auto_714610 ?auto_714618 ) ) ( not ( = ?auto_714610 ?auto_714619 ) ) ( not ( = ?auto_714610 ?auto_714620 ) ) ( not ( = ?auto_714611 ?auto_714612 ) ) ( not ( = ?auto_714611 ?auto_714613 ) ) ( not ( = ?auto_714611 ?auto_714614 ) ) ( not ( = ?auto_714611 ?auto_714615 ) ) ( not ( = ?auto_714611 ?auto_714616 ) ) ( not ( = ?auto_714611 ?auto_714617 ) ) ( not ( = ?auto_714611 ?auto_714618 ) ) ( not ( = ?auto_714611 ?auto_714619 ) ) ( not ( = ?auto_714611 ?auto_714620 ) ) ( not ( = ?auto_714612 ?auto_714613 ) ) ( not ( = ?auto_714612 ?auto_714614 ) ) ( not ( = ?auto_714612 ?auto_714615 ) ) ( not ( = ?auto_714612 ?auto_714616 ) ) ( not ( = ?auto_714612 ?auto_714617 ) ) ( not ( = ?auto_714612 ?auto_714618 ) ) ( not ( = ?auto_714612 ?auto_714619 ) ) ( not ( = ?auto_714612 ?auto_714620 ) ) ( not ( = ?auto_714613 ?auto_714614 ) ) ( not ( = ?auto_714613 ?auto_714615 ) ) ( not ( = ?auto_714613 ?auto_714616 ) ) ( not ( = ?auto_714613 ?auto_714617 ) ) ( not ( = ?auto_714613 ?auto_714618 ) ) ( not ( = ?auto_714613 ?auto_714619 ) ) ( not ( = ?auto_714613 ?auto_714620 ) ) ( not ( = ?auto_714614 ?auto_714615 ) ) ( not ( = ?auto_714614 ?auto_714616 ) ) ( not ( = ?auto_714614 ?auto_714617 ) ) ( not ( = ?auto_714614 ?auto_714618 ) ) ( not ( = ?auto_714614 ?auto_714619 ) ) ( not ( = ?auto_714614 ?auto_714620 ) ) ( not ( = ?auto_714615 ?auto_714616 ) ) ( not ( = ?auto_714615 ?auto_714617 ) ) ( not ( = ?auto_714615 ?auto_714618 ) ) ( not ( = ?auto_714615 ?auto_714619 ) ) ( not ( = ?auto_714615 ?auto_714620 ) ) ( not ( = ?auto_714616 ?auto_714617 ) ) ( not ( = ?auto_714616 ?auto_714618 ) ) ( not ( = ?auto_714616 ?auto_714619 ) ) ( not ( = ?auto_714616 ?auto_714620 ) ) ( not ( = ?auto_714617 ?auto_714618 ) ) ( not ( = ?auto_714617 ?auto_714619 ) ) ( not ( = ?auto_714617 ?auto_714620 ) ) ( not ( = ?auto_714618 ?auto_714619 ) ) ( not ( = ?auto_714618 ?auto_714620 ) ) ( not ( = ?auto_714619 ?auto_714620 ) ) ( ON ?auto_714618 ?auto_714619 ) ( ON ?auto_714617 ?auto_714618 ) ( ON ?auto_714616 ?auto_714617 ) ( ON ?auto_714615 ?auto_714616 ) ( ON ?auto_714614 ?auto_714615 ) ( ON ?auto_714613 ?auto_714614 ) ( ON ?auto_714612 ?auto_714613 ) ( CLEAR ?auto_714610 ) ( ON ?auto_714611 ?auto_714612 ) ( CLEAR ?auto_714611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_714605 ?auto_714606 ?auto_714607 ?auto_714608 ?auto_714609 ?auto_714610 ?auto_714611 )
      ( MAKE-15PILE ?auto_714605 ?auto_714606 ?auto_714607 ?auto_714608 ?auto_714609 ?auto_714610 ?auto_714611 ?auto_714612 ?auto_714613 ?auto_714614 ?auto_714615 ?auto_714616 ?auto_714617 ?auto_714618 ?auto_714619 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714667 - BLOCK
      ?auto_714668 - BLOCK
      ?auto_714669 - BLOCK
      ?auto_714670 - BLOCK
      ?auto_714671 - BLOCK
      ?auto_714672 - BLOCK
      ?auto_714673 - BLOCK
      ?auto_714674 - BLOCK
      ?auto_714675 - BLOCK
      ?auto_714676 - BLOCK
      ?auto_714677 - BLOCK
      ?auto_714678 - BLOCK
      ?auto_714679 - BLOCK
      ?auto_714680 - BLOCK
      ?auto_714681 - BLOCK
    )
    :vars
    (
      ?auto_714682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714681 ?auto_714682 ) ( ON-TABLE ?auto_714667 ) ( ON ?auto_714668 ?auto_714667 ) ( ON ?auto_714669 ?auto_714668 ) ( ON ?auto_714670 ?auto_714669 ) ( ON ?auto_714671 ?auto_714670 ) ( not ( = ?auto_714667 ?auto_714668 ) ) ( not ( = ?auto_714667 ?auto_714669 ) ) ( not ( = ?auto_714667 ?auto_714670 ) ) ( not ( = ?auto_714667 ?auto_714671 ) ) ( not ( = ?auto_714667 ?auto_714672 ) ) ( not ( = ?auto_714667 ?auto_714673 ) ) ( not ( = ?auto_714667 ?auto_714674 ) ) ( not ( = ?auto_714667 ?auto_714675 ) ) ( not ( = ?auto_714667 ?auto_714676 ) ) ( not ( = ?auto_714667 ?auto_714677 ) ) ( not ( = ?auto_714667 ?auto_714678 ) ) ( not ( = ?auto_714667 ?auto_714679 ) ) ( not ( = ?auto_714667 ?auto_714680 ) ) ( not ( = ?auto_714667 ?auto_714681 ) ) ( not ( = ?auto_714667 ?auto_714682 ) ) ( not ( = ?auto_714668 ?auto_714669 ) ) ( not ( = ?auto_714668 ?auto_714670 ) ) ( not ( = ?auto_714668 ?auto_714671 ) ) ( not ( = ?auto_714668 ?auto_714672 ) ) ( not ( = ?auto_714668 ?auto_714673 ) ) ( not ( = ?auto_714668 ?auto_714674 ) ) ( not ( = ?auto_714668 ?auto_714675 ) ) ( not ( = ?auto_714668 ?auto_714676 ) ) ( not ( = ?auto_714668 ?auto_714677 ) ) ( not ( = ?auto_714668 ?auto_714678 ) ) ( not ( = ?auto_714668 ?auto_714679 ) ) ( not ( = ?auto_714668 ?auto_714680 ) ) ( not ( = ?auto_714668 ?auto_714681 ) ) ( not ( = ?auto_714668 ?auto_714682 ) ) ( not ( = ?auto_714669 ?auto_714670 ) ) ( not ( = ?auto_714669 ?auto_714671 ) ) ( not ( = ?auto_714669 ?auto_714672 ) ) ( not ( = ?auto_714669 ?auto_714673 ) ) ( not ( = ?auto_714669 ?auto_714674 ) ) ( not ( = ?auto_714669 ?auto_714675 ) ) ( not ( = ?auto_714669 ?auto_714676 ) ) ( not ( = ?auto_714669 ?auto_714677 ) ) ( not ( = ?auto_714669 ?auto_714678 ) ) ( not ( = ?auto_714669 ?auto_714679 ) ) ( not ( = ?auto_714669 ?auto_714680 ) ) ( not ( = ?auto_714669 ?auto_714681 ) ) ( not ( = ?auto_714669 ?auto_714682 ) ) ( not ( = ?auto_714670 ?auto_714671 ) ) ( not ( = ?auto_714670 ?auto_714672 ) ) ( not ( = ?auto_714670 ?auto_714673 ) ) ( not ( = ?auto_714670 ?auto_714674 ) ) ( not ( = ?auto_714670 ?auto_714675 ) ) ( not ( = ?auto_714670 ?auto_714676 ) ) ( not ( = ?auto_714670 ?auto_714677 ) ) ( not ( = ?auto_714670 ?auto_714678 ) ) ( not ( = ?auto_714670 ?auto_714679 ) ) ( not ( = ?auto_714670 ?auto_714680 ) ) ( not ( = ?auto_714670 ?auto_714681 ) ) ( not ( = ?auto_714670 ?auto_714682 ) ) ( not ( = ?auto_714671 ?auto_714672 ) ) ( not ( = ?auto_714671 ?auto_714673 ) ) ( not ( = ?auto_714671 ?auto_714674 ) ) ( not ( = ?auto_714671 ?auto_714675 ) ) ( not ( = ?auto_714671 ?auto_714676 ) ) ( not ( = ?auto_714671 ?auto_714677 ) ) ( not ( = ?auto_714671 ?auto_714678 ) ) ( not ( = ?auto_714671 ?auto_714679 ) ) ( not ( = ?auto_714671 ?auto_714680 ) ) ( not ( = ?auto_714671 ?auto_714681 ) ) ( not ( = ?auto_714671 ?auto_714682 ) ) ( not ( = ?auto_714672 ?auto_714673 ) ) ( not ( = ?auto_714672 ?auto_714674 ) ) ( not ( = ?auto_714672 ?auto_714675 ) ) ( not ( = ?auto_714672 ?auto_714676 ) ) ( not ( = ?auto_714672 ?auto_714677 ) ) ( not ( = ?auto_714672 ?auto_714678 ) ) ( not ( = ?auto_714672 ?auto_714679 ) ) ( not ( = ?auto_714672 ?auto_714680 ) ) ( not ( = ?auto_714672 ?auto_714681 ) ) ( not ( = ?auto_714672 ?auto_714682 ) ) ( not ( = ?auto_714673 ?auto_714674 ) ) ( not ( = ?auto_714673 ?auto_714675 ) ) ( not ( = ?auto_714673 ?auto_714676 ) ) ( not ( = ?auto_714673 ?auto_714677 ) ) ( not ( = ?auto_714673 ?auto_714678 ) ) ( not ( = ?auto_714673 ?auto_714679 ) ) ( not ( = ?auto_714673 ?auto_714680 ) ) ( not ( = ?auto_714673 ?auto_714681 ) ) ( not ( = ?auto_714673 ?auto_714682 ) ) ( not ( = ?auto_714674 ?auto_714675 ) ) ( not ( = ?auto_714674 ?auto_714676 ) ) ( not ( = ?auto_714674 ?auto_714677 ) ) ( not ( = ?auto_714674 ?auto_714678 ) ) ( not ( = ?auto_714674 ?auto_714679 ) ) ( not ( = ?auto_714674 ?auto_714680 ) ) ( not ( = ?auto_714674 ?auto_714681 ) ) ( not ( = ?auto_714674 ?auto_714682 ) ) ( not ( = ?auto_714675 ?auto_714676 ) ) ( not ( = ?auto_714675 ?auto_714677 ) ) ( not ( = ?auto_714675 ?auto_714678 ) ) ( not ( = ?auto_714675 ?auto_714679 ) ) ( not ( = ?auto_714675 ?auto_714680 ) ) ( not ( = ?auto_714675 ?auto_714681 ) ) ( not ( = ?auto_714675 ?auto_714682 ) ) ( not ( = ?auto_714676 ?auto_714677 ) ) ( not ( = ?auto_714676 ?auto_714678 ) ) ( not ( = ?auto_714676 ?auto_714679 ) ) ( not ( = ?auto_714676 ?auto_714680 ) ) ( not ( = ?auto_714676 ?auto_714681 ) ) ( not ( = ?auto_714676 ?auto_714682 ) ) ( not ( = ?auto_714677 ?auto_714678 ) ) ( not ( = ?auto_714677 ?auto_714679 ) ) ( not ( = ?auto_714677 ?auto_714680 ) ) ( not ( = ?auto_714677 ?auto_714681 ) ) ( not ( = ?auto_714677 ?auto_714682 ) ) ( not ( = ?auto_714678 ?auto_714679 ) ) ( not ( = ?auto_714678 ?auto_714680 ) ) ( not ( = ?auto_714678 ?auto_714681 ) ) ( not ( = ?auto_714678 ?auto_714682 ) ) ( not ( = ?auto_714679 ?auto_714680 ) ) ( not ( = ?auto_714679 ?auto_714681 ) ) ( not ( = ?auto_714679 ?auto_714682 ) ) ( not ( = ?auto_714680 ?auto_714681 ) ) ( not ( = ?auto_714680 ?auto_714682 ) ) ( not ( = ?auto_714681 ?auto_714682 ) ) ( ON ?auto_714680 ?auto_714681 ) ( ON ?auto_714679 ?auto_714680 ) ( ON ?auto_714678 ?auto_714679 ) ( ON ?auto_714677 ?auto_714678 ) ( ON ?auto_714676 ?auto_714677 ) ( ON ?auto_714675 ?auto_714676 ) ( ON ?auto_714674 ?auto_714675 ) ( ON ?auto_714673 ?auto_714674 ) ( CLEAR ?auto_714671 ) ( ON ?auto_714672 ?auto_714673 ) ( CLEAR ?auto_714672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_714667 ?auto_714668 ?auto_714669 ?auto_714670 ?auto_714671 ?auto_714672 )
      ( MAKE-15PILE ?auto_714667 ?auto_714668 ?auto_714669 ?auto_714670 ?auto_714671 ?auto_714672 ?auto_714673 ?auto_714674 ?auto_714675 ?auto_714676 ?auto_714677 ?auto_714678 ?auto_714679 ?auto_714680 ?auto_714681 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714729 - BLOCK
      ?auto_714730 - BLOCK
      ?auto_714731 - BLOCK
      ?auto_714732 - BLOCK
      ?auto_714733 - BLOCK
      ?auto_714734 - BLOCK
      ?auto_714735 - BLOCK
      ?auto_714736 - BLOCK
      ?auto_714737 - BLOCK
      ?auto_714738 - BLOCK
      ?auto_714739 - BLOCK
      ?auto_714740 - BLOCK
      ?auto_714741 - BLOCK
      ?auto_714742 - BLOCK
      ?auto_714743 - BLOCK
    )
    :vars
    (
      ?auto_714744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714743 ?auto_714744 ) ( ON-TABLE ?auto_714729 ) ( ON ?auto_714730 ?auto_714729 ) ( ON ?auto_714731 ?auto_714730 ) ( ON ?auto_714732 ?auto_714731 ) ( not ( = ?auto_714729 ?auto_714730 ) ) ( not ( = ?auto_714729 ?auto_714731 ) ) ( not ( = ?auto_714729 ?auto_714732 ) ) ( not ( = ?auto_714729 ?auto_714733 ) ) ( not ( = ?auto_714729 ?auto_714734 ) ) ( not ( = ?auto_714729 ?auto_714735 ) ) ( not ( = ?auto_714729 ?auto_714736 ) ) ( not ( = ?auto_714729 ?auto_714737 ) ) ( not ( = ?auto_714729 ?auto_714738 ) ) ( not ( = ?auto_714729 ?auto_714739 ) ) ( not ( = ?auto_714729 ?auto_714740 ) ) ( not ( = ?auto_714729 ?auto_714741 ) ) ( not ( = ?auto_714729 ?auto_714742 ) ) ( not ( = ?auto_714729 ?auto_714743 ) ) ( not ( = ?auto_714729 ?auto_714744 ) ) ( not ( = ?auto_714730 ?auto_714731 ) ) ( not ( = ?auto_714730 ?auto_714732 ) ) ( not ( = ?auto_714730 ?auto_714733 ) ) ( not ( = ?auto_714730 ?auto_714734 ) ) ( not ( = ?auto_714730 ?auto_714735 ) ) ( not ( = ?auto_714730 ?auto_714736 ) ) ( not ( = ?auto_714730 ?auto_714737 ) ) ( not ( = ?auto_714730 ?auto_714738 ) ) ( not ( = ?auto_714730 ?auto_714739 ) ) ( not ( = ?auto_714730 ?auto_714740 ) ) ( not ( = ?auto_714730 ?auto_714741 ) ) ( not ( = ?auto_714730 ?auto_714742 ) ) ( not ( = ?auto_714730 ?auto_714743 ) ) ( not ( = ?auto_714730 ?auto_714744 ) ) ( not ( = ?auto_714731 ?auto_714732 ) ) ( not ( = ?auto_714731 ?auto_714733 ) ) ( not ( = ?auto_714731 ?auto_714734 ) ) ( not ( = ?auto_714731 ?auto_714735 ) ) ( not ( = ?auto_714731 ?auto_714736 ) ) ( not ( = ?auto_714731 ?auto_714737 ) ) ( not ( = ?auto_714731 ?auto_714738 ) ) ( not ( = ?auto_714731 ?auto_714739 ) ) ( not ( = ?auto_714731 ?auto_714740 ) ) ( not ( = ?auto_714731 ?auto_714741 ) ) ( not ( = ?auto_714731 ?auto_714742 ) ) ( not ( = ?auto_714731 ?auto_714743 ) ) ( not ( = ?auto_714731 ?auto_714744 ) ) ( not ( = ?auto_714732 ?auto_714733 ) ) ( not ( = ?auto_714732 ?auto_714734 ) ) ( not ( = ?auto_714732 ?auto_714735 ) ) ( not ( = ?auto_714732 ?auto_714736 ) ) ( not ( = ?auto_714732 ?auto_714737 ) ) ( not ( = ?auto_714732 ?auto_714738 ) ) ( not ( = ?auto_714732 ?auto_714739 ) ) ( not ( = ?auto_714732 ?auto_714740 ) ) ( not ( = ?auto_714732 ?auto_714741 ) ) ( not ( = ?auto_714732 ?auto_714742 ) ) ( not ( = ?auto_714732 ?auto_714743 ) ) ( not ( = ?auto_714732 ?auto_714744 ) ) ( not ( = ?auto_714733 ?auto_714734 ) ) ( not ( = ?auto_714733 ?auto_714735 ) ) ( not ( = ?auto_714733 ?auto_714736 ) ) ( not ( = ?auto_714733 ?auto_714737 ) ) ( not ( = ?auto_714733 ?auto_714738 ) ) ( not ( = ?auto_714733 ?auto_714739 ) ) ( not ( = ?auto_714733 ?auto_714740 ) ) ( not ( = ?auto_714733 ?auto_714741 ) ) ( not ( = ?auto_714733 ?auto_714742 ) ) ( not ( = ?auto_714733 ?auto_714743 ) ) ( not ( = ?auto_714733 ?auto_714744 ) ) ( not ( = ?auto_714734 ?auto_714735 ) ) ( not ( = ?auto_714734 ?auto_714736 ) ) ( not ( = ?auto_714734 ?auto_714737 ) ) ( not ( = ?auto_714734 ?auto_714738 ) ) ( not ( = ?auto_714734 ?auto_714739 ) ) ( not ( = ?auto_714734 ?auto_714740 ) ) ( not ( = ?auto_714734 ?auto_714741 ) ) ( not ( = ?auto_714734 ?auto_714742 ) ) ( not ( = ?auto_714734 ?auto_714743 ) ) ( not ( = ?auto_714734 ?auto_714744 ) ) ( not ( = ?auto_714735 ?auto_714736 ) ) ( not ( = ?auto_714735 ?auto_714737 ) ) ( not ( = ?auto_714735 ?auto_714738 ) ) ( not ( = ?auto_714735 ?auto_714739 ) ) ( not ( = ?auto_714735 ?auto_714740 ) ) ( not ( = ?auto_714735 ?auto_714741 ) ) ( not ( = ?auto_714735 ?auto_714742 ) ) ( not ( = ?auto_714735 ?auto_714743 ) ) ( not ( = ?auto_714735 ?auto_714744 ) ) ( not ( = ?auto_714736 ?auto_714737 ) ) ( not ( = ?auto_714736 ?auto_714738 ) ) ( not ( = ?auto_714736 ?auto_714739 ) ) ( not ( = ?auto_714736 ?auto_714740 ) ) ( not ( = ?auto_714736 ?auto_714741 ) ) ( not ( = ?auto_714736 ?auto_714742 ) ) ( not ( = ?auto_714736 ?auto_714743 ) ) ( not ( = ?auto_714736 ?auto_714744 ) ) ( not ( = ?auto_714737 ?auto_714738 ) ) ( not ( = ?auto_714737 ?auto_714739 ) ) ( not ( = ?auto_714737 ?auto_714740 ) ) ( not ( = ?auto_714737 ?auto_714741 ) ) ( not ( = ?auto_714737 ?auto_714742 ) ) ( not ( = ?auto_714737 ?auto_714743 ) ) ( not ( = ?auto_714737 ?auto_714744 ) ) ( not ( = ?auto_714738 ?auto_714739 ) ) ( not ( = ?auto_714738 ?auto_714740 ) ) ( not ( = ?auto_714738 ?auto_714741 ) ) ( not ( = ?auto_714738 ?auto_714742 ) ) ( not ( = ?auto_714738 ?auto_714743 ) ) ( not ( = ?auto_714738 ?auto_714744 ) ) ( not ( = ?auto_714739 ?auto_714740 ) ) ( not ( = ?auto_714739 ?auto_714741 ) ) ( not ( = ?auto_714739 ?auto_714742 ) ) ( not ( = ?auto_714739 ?auto_714743 ) ) ( not ( = ?auto_714739 ?auto_714744 ) ) ( not ( = ?auto_714740 ?auto_714741 ) ) ( not ( = ?auto_714740 ?auto_714742 ) ) ( not ( = ?auto_714740 ?auto_714743 ) ) ( not ( = ?auto_714740 ?auto_714744 ) ) ( not ( = ?auto_714741 ?auto_714742 ) ) ( not ( = ?auto_714741 ?auto_714743 ) ) ( not ( = ?auto_714741 ?auto_714744 ) ) ( not ( = ?auto_714742 ?auto_714743 ) ) ( not ( = ?auto_714742 ?auto_714744 ) ) ( not ( = ?auto_714743 ?auto_714744 ) ) ( ON ?auto_714742 ?auto_714743 ) ( ON ?auto_714741 ?auto_714742 ) ( ON ?auto_714740 ?auto_714741 ) ( ON ?auto_714739 ?auto_714740 ) ( ON ?auto_714738 ?auto_714739 ) ( ON ?auto_714737 ?auto_714738 ) ( ON ?auto_714736 ?auto_714737 ) ( ON ?auto_714735 ?auto_714736 ) ( ON ?auto_714734 ?auto_714735 ) ( CLEAR ?auto_714732 ) ( ON ?auto_714733 ?auto_714734 ) ( CLEAR ?auto_714733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_714729 ?auto_714730 ?auto_714731 ?auto_714732 ?auto_714733 )
      ( MAKE-15PILE ?auto_714729 ?auto_714730 ?auto_714731 ?auto_714732 ?auto_714733 ?auto_714734 ?auto_714735 ?auto_714736 ?auto_714737 ?auto_714738 ?auto_714739 ?auto_714740 ?auto_714741 ?auto_714742 ?auto_714743 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714791 - BLOCK
      ?auto_714792 - BLOCK
      ?auto_714793 - BLOCK
      ?auto_714794 - BLOCK
      ?auto_714795 - BLOCK
      ?auto_714796 - BLOCK
      ?auto_714797 - BLOCK
      ?auto_714798 - BLOCK
      ?auto_714799 - BLOCK
      ?auto_714800 - BLOCK
      ?auto_714801 - BLOCK
      ?auto_714802 - BLOCK
      ?auto_714803 - BLOCK
      ?auto_714804 - BLOCK
      ?auto_714805 - BLOCK
    )
    :vars
    (
      ?auto_714806 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714805 ?auto_714806 ) ( ON-TABLE ?auto_714791 ) ( ON ?auto_714792 ?auto_714791 ) ( ON ?auto_714793 ?auto_714792 ) ( not ( = ?auto_714791 ?auto_714792 ) ) ( not ( = ?auto_714791 ?auto_714793 ) ) ( not ( = ?auto_714791 ?auto_714794 ) ) ( not ( = ?auto_714791 ?auto_714795 ) ) ( not ( = ?auto_714791 ?auto_714796 ) ) ( not ( = ?auto_714791 ?auto_714797 ) ) ( not ( = ?auto_714791 ?auto_714798 ) ) ( not ( = ?auto_714791 ?auto_714799 ) ) ( not ( = ?auto_714791 ?auto_714800 ) ) ( not ( = ?auto_714791 ?auto_714801 ) ) ( not ( = ?auto_714791 ?auto_714802 ) ) ( not ( = ?auto_714791 ?auto_714803 ) ) ( not ( = ?auto_714791 ?auto_714804 ) ) ( not ( = ?auto_714791 ?auto_714805 ) ) ( not ( = ?auto_714791 ?auto_714806 ) ) ( not ( = ?auto_714792 ?auto_714793 ) ) ( not ( = ?auto_714792 ?auto_714794 ) ) ( not ( = ?auto_714792 ?auto_714795 ) ) ( not ( = ?auto_714792 ?auto_714796 ) ) ( not ( = ?auto_714792 ?auto_714797 ) ) ( not ( = ?auto_714792 ?auto_714798 ) ) ( not ( = ?auto_714792 ?auto_714799 ) ) ( not ( = ?auto_714792 ?auto_714800 ) ) ( not ( = ?auto_714792 ?auto_714801 ) ) ( not ( = ?auto_714792 ?auto_714802 ) ) ( not ( = ?auto_714792 ?auto_714803 ) ) ( not ( = ?auto_714792 ?auto_714804 ) ) ( not ( = ?auto_714792 ?auto_714805 ) ) ( not ( = ?auto_714792 ?auto_714806 ) ) ( not ( = ?auto_714793 ?auto_714794 ) ) ( not ( = ?auto_714793 ?auto_714795 ) ) ( not ( = ?auto_714793 ?auto_714796 ) ) ( not ( = ?auto_714793 ?auto_714797 ) ) ( not ( = ?auto_714793 ?auto_714798 ) ) ( not ( = ?auto_714793 ?auto_714799 ) ) ( not ( = ?auto_714793 ?auto_714800 ) ) ( not ( = ?auto_714793 ?auto_714801 ) ) ( not ( = ?auto_714793 ?auto_714802 ) ) ( not ( = ?auto_714793 ?auto_714803 ) ) ( not ( = ?auto_714793 ?auto_714804 ) ) ( not ( = ?auto_714793 ?auto_714805 ) ) ( not ( = ?auto_714793 ?auto_714806 ) ) ( not ( = ?auto_714794 ?auto_714795 ) ) ( not ( = ?auto_714794 ?auto_714796 ) ) ( not ( = ?auto_714794 ?auto_714797 ) ) ( not ( = ?auto_714794 ?auto_714798 ) ) ( not ( = ?auto_714794 ?auto_714799 ) ) ( not ( = ?auto_714794 ?auto_714800 ) ) ( not ( = ?auto_714794 ?auto_714801 ) ) ( not ( = ?auto_714794 ?auto_714802 ) ) ( not ( = ?auto_714794 ?auto_714803 ) ) ( not ( = ?auto_714794 ?auto_714804 ) ) ( not ( = ?auto_714794 ?auto_714805 ) ) ( not ( = ?auto_714794 ?auto_714806 ) ) ( not ( = ?auto_714795 ?auto_714796 ) ) ( not ( = ?auto_714795 ?auto_714797 ) ) ( not ( = ?auto_714795 ?auto_714798 ) ) ( not ( = ?auto_714795 ?auto_714799 ) ) ( not ( = ?auto_714795 ?auto_714800 ) ) ( not ( = ?auto_714795 ?auto_714801 ) ) ( not ( = ?auto_714795 ?auto_714802 ) ) ( not ( = ?auto_714795 ?auto_714803 ) ) ( not ( = ?auto_714795 ?auto_714804 ) ) ( not ( = ?auto_714795 ?auto_714805 ) ) ( not ( = ?auto_714795 ?auto_714806 ) ) ( not ( = ?auto_714796 ?auto_714797 ) ) ( not ( = ?auto_714796 ?auto_714798 ) ) ( not ( = ?auto_714796 ?auto_714799 ) ) ( not ( = ?auto_714796 ?auto_714800 ) ) ( not ( = ?auto_714796 ?auto_714801 ) ) ( not ( = ?auto_714796 ?auto_714802 ) ) ( not ( = ?auto_714796 ?auto_714803 ) ) ( not ( = ?auto_714796 ?auto_714804 ) ) ( not ( = ?auto_714796 ?auto_714805 ) ) ( not ( = ?auto_714796 ?auto_714806 ) ) ( not ( = ?auto_714797 ?auto_714798 ) ) ( not ( = ?auto_714797 ?auto_714799 ) ) ( not ( = ?auto_714797 ?auto_714800 ) ) ( not ( = ?auto_714797 ?auto_714801 ) ) ( not ( = ?auto_714797 ?auto_714802 ) ) ( not ( = ?auto_714797 ?auto_714803 ) ) ( not ( = ?auto_714797 ?auto_714804 ) ) ( not ( = ?auto_714797 ?auto_714805 ) ) ( not ( = ?auto_714797 ?auto_714806 ) ) ( not ( = ?auto_714798 ?auto_714799 ) ) ( not ( = ?auto_714798 ?auto_714800 ) ) ( not ( = ?auto_714798 ?auto_714801 ) ) ( not ( = ?auto_714798 ?auto_714802 ) ) ( not ( = ?auto_714798 ?auto_714803 ) ) ( not ( = ?auto_714798 ?auto_714804 ) ) ( not ( = ?auto_714798 ?auto_714805 ) ) ( not ( = ?auto_714798 ?auto_714806 ) ) ( not ( = ?auto_714799 ?auto_714800 ) ) ( not ( = ?auto_714799 ?auto_714801 ) ) ( not ( = ?auto_714799 ?auto_714802 ) ) ( not ( = ?auto_714799 ?auto_714803 ) ) ( not ( = ?auto_714799 ?auto_714804 ) ) ( not ( = ?auto_714799 ?auto_714805 ) ) ( not ( = ?auto_714799 ?auto_714806 ) ) ( not ( = ?auto_714800 ?auto_714801 ) ) ( not ( = ?auto_714800 ?auto_714802 ) ) ( not ( = ?auto_714800 ?auto_714803 ) ) ( not ( = ?auto_714800 ?auto_714804 ) ) ( not ( = ?auto_714800 ?auto_714805 ) ) ( not ( = ?auto_714800 ?auto_714806 ) ) ( not ( = ?auto_714801 ?auto_714802 ) ) ( not ( = ?auto_714801 ?auto_714803 ) ) ( not ( = ?auto_714801 ?auto_714804 ) ) ( not ( = ?auto_714801 ?auto_714805 ) ) ( not ( = ?auto_714801 ?auto_714806 ) ) ( not ( = ?auto_714802 ?auto_714803 ) ) ( not ( = ?auto_714802 ?auto_714804 ) ) ( not ( = ?auto_714802 ?auto_714805 ) ) ( not ( = ?auto_714802 ?auto_714806 ) ) ( not ( = ?auto_714803 ?auto_714804 ) ) ( not ( = ?auto_714803 ?auto_714805 ) ) ( not ( = ?auto_714803 ?auto_714806 ) ) ( not ( = ?auto_714804 ?auto_714805 ) ) ( not ( = ?auto_714804 ?auto_714806 ) ) ( not ( = ?auto_714805 ?auto_714806 ) ) ( ON ?auto_714804 ?auto_714805 ) ( ON ?auto_714803 ?auto_714804 ) ( ON ?auto_714802 ?auto_714803 ) ( ON ?auto_714801 ?auto_714802 ) ( ON ?auto_714800 ?auto_714801 ) ( ON ?auto_714799 ?auto_714800 ) ( ON ?auto_714798 ?auto_714799 ) ( ON ?auto_714797 ?auto_714798 ) ( ON ?auto_714796 ?auto_714797 ) ( ON ?auto_714795 ?auto_714796 ) ( CLEAR ?auto_714793 ) ( ON ?auto_714794 ?auto_714795 ) ( CLEAR ?auto_714794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_714791 ?auto_714792 ?auto_714793 ?auto_714794 )
      ( MAKE-15PILE ?auto_714791 ?auto_714792 ?auto_714793 ?auto_714794 ?auto_714795 ?auto_714796 ?auto_714797 ?auto_714798 ?auto_714799 ?auto_714800 ?auto_714801 ?auto_714802 ?auto_714803 ?auto_714804 ?auto_714805 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714853 - BLOCK
      ?auto_714854 - BLOCK
      ?auto_714855 - BLOCK
      ?auto_714856 - BLOCK
      ?auto_714857 - BLOCK
      ?auto_714858 - BLOCK
      ?auto_714859 - BLOCK
      ?auto_714860 - BLOCK
      ?auto_714861 - BLOCK
      ?auto_714862 - BLOCK
      ?auto_714863 - BLOCK
      ?auto_714864 - BLOCK
      ?auto_714865 - BLOCK
      ?auto_714866 - BLOCK
      ?auto_714867 - BLOCK
    )
    :vars
    (
      ?auto_714868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714867 ?auto_714868 ) ( ON-TABLE ?auto_714853 ) ( ON ?auto_714854 ?auto_714853 ) ( not ( = ?auto_714853 ?auto_714854 ) ) ( not ( = ?auto_714853 ?auto_714855 ) ) ( not ( = ?auto_714853 ?auto_714856 ) ) ( not ( = ?auto_714853 ?auto_714857 ) ) ( not ( = ?auto_714853 ?auto_714858 ) ) ( not ( = ?auto_714853 ?auto_714859 ) ) ( not ( = ?auto_714853 ?auto_714860 ) ) ( not ( = ?auto_714853 ?auto_714861 ) ) ( not ( = ?auto_714853 ?auto_714862 ) ) ( not ( = ?auto_714853 ?auto_714863 ) ) ( not ( = ?auto_714853 ?auto_714864 ) ) ( not ( = ?auto_714853 ?auto_714865 ) ) ( not ( = ?auto_714853 ?auto_714866 ) ) ( not ( = ?auto_714853 ?auto_714867 ) ) ( not ( = ?auto_714853 ?auto_714868 ) ) ( not ( = ?auto_714854 ?auto_714855 ) ) ( not ( = ?auto_714854 ?auto_714856 ) ) ( not ( = ?auto_714854 ?auto_714857 ) ) ( not ( = ?auto_714854 ?auto_714858 ) ) ( not ( = ?auto_714854 ?auto_714859 ) ) ( not ( = ?auto_714854 ?auto_714860 ) ) ( not ( = ?auto_714854 ?auto_714861 ) ) ( not ( = ?auto_714854 ?auto_714862 ) ) ( not ( = ?auto_714854 ?auto_714863 ) ) ( not ( = ?auto_714854 ?auto_714864 ) ) ( not ( = ?auto_714854 ?auto_714865 ) ) ( not ( = ?auto_714854 ?auto_714866 ) ) ( not ( = ?auto_714854 ?auto_714867 ) ) ( not ( = ?auto_714854 ?auto_714868 ) ) ( not ( = ?auto_714855 ?auto_714856 ) ) ( not ( = ?auto_714855 ?auto_714857 ) ) ( not ( = ?auto_714855 ?auto_714858 ) ) ( not ( = ?auto_714855 ?auto_714859 ) ) ( not ( = ?auto_714855 ?auto_714860 ) ) ( not ( = ?auto_714855 ?auto_714861 ) ) ( not ( = ?auto_714855 ?auto_714862 ) ) ( not ( = ?auto_714855 ?auto_714863 ) ) ( not ( = ?auto_714855 ?auto_714864 ) ) ( not ( = ?auto_714855 ?auto_714865 ) ) ( not ( = ?auto_714855 ?auto_714866 ) ) ( not ( = ?auto_714855 ?auto_714867 ) ) ( not ( = ?auto_714855 ?auto_714868 ) ) ( not ( = ?auto_714856 ?auto_714857 ) ) ( not ( = ?auto_714856 ?auto_714858 ) ) ( not ( = ?auto_714856 ?auto_714859 ) ) ( not ( = ?auto_714856 ?auto_714860 ) ) ( not ( = ?auto_714856 ?auto_714861 ) ) ( not ( = ?auto_714856 ?auto_714862 ) ) ( not ( = ?auto_714856 ?auto_714863 ) ) ( not ( = ?auto_714856 ?auto_714864 ) ) ( not ( = ?auto_714856 ?auto_714865 ) ) ( not ( = ?auto_714856 ?auto_714866 ) ) ( not ( = ?auto_714856 ?auto_714867 ) ) ( not ( = ?auto_714856 ?auto_714868 ) ) ( not ( = ?auto_714857 ?auto_714858 ) ) ( not ( = ?auto_714857 ?auto_714859 ) ) ( not ( = ?auto_714857 ?auto_714860 ) ) ( not ( = ?auto_714857 ?auto_714861 ) ) ( not ( = ?auto_714857 ?auto_714862 ) ) ( not ( = ?auto_714857 ?auto_714863 ) ) ( not ( = ?auto_714857 ?auto_714864 ) ) ( not ( = ?auto_714857 ?auto_714865 ) ) ( not ( = ?auto_714857 ?auto_714866 ) ) ( not ( = ?auto_714857 ?auto_714867 ) ) ( not ( = ?auto_714857 ?auto_714868 ) ) ( not ( = ?auto_714858 ?auto_714859 ) ) ( not ( = ?auto_714858 ?auto_714860 ) ) ( not ( = ?auto_714858 ?auto_714861 ) ) ( not ( = ?auto_714858 ?auto_714862 ) ) ( not ( = ?auto_714858 ?auto_714863 ) ) ( not ( = ?auto_714858 ?auto_714864 ) ) ( not ( = ?auto_714858 ?auto_714865 ) ) ( not ( = ?auto_714858 ?auto_714866 ) ) ( not ( = ?auto_714858 ?auto_714867 ) ) ( not ( = ?auto_714858 ?auto_714868 ) ) ( not ( = ?auto_714859 ?auto_714860 ) ) ( not ( = ?auto_714859 ?auto_714861 ) ) ( not ( = ?auto_714859 ?auto_714862 ) ) ( not ( = ?auto_714859 ?auto_714863 ) ) ( not ( = ?auto_714859 ?auto_714864 ) ) ( not ( = ?auto_714859 ?auto_714865 ) ) ( not ( = ?auto_714859 ?auto_714866 ) ) ( not ( = ?auto_714859 ?auto_714867 ) ) ( not ( = ?auto_714859 ?auto_714868 ) ) ( not ( = ?auto_714860 ?auto_714861 ) ) ( not ( = ?auto_714860 ?auto_714862 ) ) ( not ( = ?auto_714860 ?auto_714863 ) ) ( not ( = ?auto_714860 ?auto_714864 ) ) ( not ( = ?auto_714860 ?auto_714865 ) ) ( not ( = ?auto_714860 ?auto_714866 ) ) ( not ( = ?auto_714860 ?auto_714867 ) ) ( not ( = ?auto_714860 ?auto_714868 ) ) ( not ( = ?auto_714861 ?auto_714862 ) ) ( not ( = ?auto_714861 ?auto_714863 ) ) ( not ( = ?auto_714861 ?auto_714864 ) ) ( not ( = ?auto_714861 ?auto_714865 ) ) ( not ( = ?auto_714861 ?auto_714866 ) ) ( not ( = ?auto_714861 ?auto_714867 ) ) ( not ( = ?auto_714861 ?auto_714868 ) ) ( not ( = ?auto_714862 ?auto_714863 ) ) ( not ( = ?auto_714862 ?auto_714864 ) ) ( not ( = ?auto_714862 ?auto_714865 ) ) ( not ( = ?auto_714862 ?auto_714866 ) ) ( not ( = ?auto_714862 ?auto_714867 ) ) ( not ( = ?auto_714862 ?auto_714868 ) ) ( not ( = ?auto_714863 ?auto_714864 ) ) ( not ( = ?auto_714863 ?auto_714865 ) ) ( not ( = ?auto_714863 ?auto_714866 ) ) ( not ( = ?auto_714863 ?auto_714867 ) ) ( not ( = ?auto_714863 ?auto_714868 ) ) ( not ( = ?auto_714864 ?auto_714865 ) ) ( not ( = ?auto_714864 ?auto_714866 ) ) ( not ( = ?auto_714864 ?auto_714867 ) ) ( not ( = ?auto_714864 ?auto_714868 ) ) ( not ( = ?auto_714865 ?auto_714866 ) ) ( not ( = ?auto_714865 ?auto_714867 ) ) ( not ( = ?auto_714865 ?auto_714868 ) ) ( not ( = ?auto_714866 ?auto_714867 ) ) ( not ( = ?auto_714866 ?auto_714868 ) ) ( not ( = ?auto_714867 ?auto_714868 ) ) ( ON ?auto_714866 ?auto_714867 ) ( ON ?auto_714865 ?auto_714866 ) ( ON ?auto_714864 ?auto_714865 ) ( ON ?auto_714863 ?auto_714864 ) ( ON ?auto_714862 ?auto_714863 ) ( ON ?auto_714861 ?auto_714862 ) ( ON ?auto_714860 ?auto_714861 ) ( ON ?auto_714859 ?auto_714860 ) ( ON ?auto_714858 ?auto_714859 ) ( ON ?auto_714857 ?auto_714858 ) ( ON ?auto_714856 ?auto_714857 ) ( CLEAR ?auto_714854 ) ( ON ?auto_714855 ?auto_714856 ) ( CLEAR ?auto_714855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_714853 ?auto_714854 ?auto_714855 )
      ( MAKE-15PILE ?auto_714853 ?auto_714854 ?auto_714855 ?auto_714856 ?auto_714857 ?auto_714858 ?auto_714859 ?auto_714860 ?auto_714861 ?auto_714862 ?auto_714863 ?auto_714864 ?auto_714865 ?auto_714866 ?auto_714867 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714915 - BLOCK
      ?auto_714916 - BLOCK
      ?auto_714917 - BLOCK
      ?auto_714918 - BLOCK
      ?auto_714919 - BLOCK
      ?auto_714920 - BLOCK
      ?auto_714921 - BLOCK
      ?auto_714922 - BLOCK
      ?auto_714923 - BLOCK
      ?auto_714924 - BLOCK
      ?auto_714925 - BLOCK
      ?auto_714926 - BLOCK
      ?auto_714927 - BLOCK
      ?auto_714928 - BLOCK
      ?auto_714929 - BLOCK
    )
    :vars
    (
      ?auto_714930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714929 ?auto_714930 ) ( ON-TABLE ?auto_714915 ) ( not ( = ?auto_714915 ?auto_714916 ) ) ( not ( = ?auto_714915 ?auto_714917 ) ) ( not ( = ?auto_714915 ?auto_714918 ) ) ( not ( = ?auto_714915 ?auto_714919 ) ) ( not ( = ?auto_714915 ?auto_714920 ) ) ( not ( = ?auto_714915 ?auto_714921 ) ) ( not ( = ?auto_714915 ?auto_714922 ) ) ( not ( = ?auto_714915 ?auto_714923 ) ) ( not ( = ?auto_714915 ?auto_714924 ) ) ( not ( = ?auto_714915 ?auto_714925 ) ) ( not ( = ?auto_714915 ?auto_714926 ) ) ( not ( = ?auto_714915 ?auto_714927 ) ) ( not ( = ?auto_714915 ?auto_714928 ) ) ( not ( = ?auto_714915 ?auto_714929 ) ) ( not ( = ?auto_714915 ?auto_714930 ) ) ( not ( = ?auto_714916 ?auto_714917 ) ) ( not ( = ?auto_714916 ?auto_714918 ) ) ( not ( = ?auto_714916 ?auto_714919 ) ) ( not ( = ?auto_714916 ?auto_714920 ) ) ( not ( = ?auto_714916 ?auto_714921 ) ) ( not ( = ?auto_714916 ?auto_714922 ) ) ( not ( = ?auto_714916 ?auto_714923 ) ) ( not ( = ?auto_714916 ?auto_714924 ) ) ( not ( = ?auto_714916 ?auto_714925 ) ) ( not ( = ?auto_714916 ?auto_714926 ) ) ( not ( = ?auto_714916 ?auto_714927 ) ) ( not ( = ?auto_714916 ?auto_714928 ) ) ( not ( = ?auto_714916 ?auto_714929 ) ) ( not ( = ?auto_714916 ?auto_714930 ) ) ( not ( = ?auto_714917 ?auto_714918 ) ) ( not ( = ?auto_714917 ?auto_714919 ) ) ( not ( = ?auto_714917 ?auto_714920 ) ) ( not ( = ?auto_714917 ?auto_714921 ) ) ( not ( = ?auto_714917 ?auto_714922 ) ) ( not ( = ?auto_714917 ?auto_714923 ) ) ( not ( = ?auto_714917 ?auto_714924 ) ) ( not ( = ?auto_714917 ?auto_714925 ) ) ( not ( = ?auto_714917 ?auto_714926 ) ) ( not ( = ?auto_714917 ?auto_714927 ) ) ( not ( = ?auto_714917 ?auto_714928 ) ) ( not ( = ?auto_714917 ?auto_714929 ) ) ( not ( = ?auto_714917 ?auto_714930 ) ) ( not ( = ?auto_714918 ?auto_714919 ) ) ( not ( = ?auto_714918 ?auto_714920 ) ) ( not ( = ?auto_714918 ?auto_714921 ) ) ( not ( = ?auto_714918 ?auto_714922 ) ) ( not ( = ?auto_714918 ?auto_714923 ) ) ( not ( = ?auto_714918 ?auto_714924 ) ) ( not ( = ?auto_714918 ?auto_714925 ) ) ( not ( = ?auto_714918 ?auto_714926 ) ) ( not ( = ?auto_714918 ?auto_714927 ) ) ( not ( = ?auto_714918 ?auto_714928 ) ) ( not ( = ?auto_714918 ?auto_714929 ) ) ( not ( = ?auto_714918 ?auto_714930 ) ) ( not ( = ?auto_714919 ?auto_714920 ) ) ( not ( = ?auto_714919 ?auto_714921 ) ) ( not ( = ?auto_714919 ?auto_714922 ) ) ( not ( = ?auto_714919 ?auto_714923 ) ) ( not ( = ?auto_714919 ?auto_714924 ) ) ( not ( = ?auto_714919 ?auto_714925 ) ) ( not ( = ?auto_714919 ?auto_714926 ) ) ( not ( = ?auto_714919 ?auto_714927 ) ) ( not ( = ?auto_714919 ?auto_714928 ) ) ( not ( = ?auto_714919 ?auto_714929 ) ) ( not ( = ?auto_714919 ?auto_714930 ) ) ( not ( = ?auto_714920 ?auto_714921 ) ) ( not ( = ?auto_714920 ?auto_714922 ) ) ( not ( = ?auto_714920 ?auto_714923 ) ) ( not ( = ?auto_714920 ?auto_714924 ) ) ( not ( = ?auto_714920 ?auto_714925 ) ) ( not ( = ?auto_714920 ?auto_714926 ) ) ( not ( = ?auto_714920 ?auto_714927 ) ) ( not ( = ?auto_714920 ?auto_714928 ) ) ( not ( = ?auto_714920 ?auto_714929 ) ) ( not ( = ?auto_714920 ?auto_714930 ) ) ( not ( = ?auto_714921 ?auto_714922 ) ) ( not ( = ?auto_714921 ?auto_714923 ) ) ( not ( = ?auto_714921 ?auto_714924 ) ) ( not ( = ?auto_714921 ?auto_714925 ) ) ( not ( = ?auto_714921 ?auto_714926 ) ) ( not ( = ?auto_714921 ?auto_714927 ) ) ( not ( = ?auto_714921 ?auto_714928 ) ) ( not ( = ?auto_714921 ?auto_714929 ) ) ( not ( = ?auto_714921 ?auto_714930 ) ) ( not ( = ?auto_714922 ?auto_714923 ) ) ( not ( = ?auto_714922 ?auto_714924 ) ) ( not ( = ?auto_714922 ?auto_714925 ) ) ( not ( = ?auto_714922 ?auto_714926 ) ) ( not ( = ?auto_714922 ?auto_714927 ) ) ( not ( = ?auto_714922 ?auto_714928 ) ) ( not ( = ?auto_714922 ?auto_714929 ) ) ( not ( = ?auto_714922 ?auto_714930 ) ) ( not ( = ?auto_714923 ?auto_714924 ) ) ( not ( = ?auto_714923 ?auto_714925 ) ) ( not ( = ?auto_714923 ?auto_714926 ) ) ( not ( = ?auto_714923 ?auto_714927 ) ) ( not ( = ?auto_714923 ?auto_714928 ) ) ( not ( = ?auto_714923 ?auto_714929 ) ) ( not ( = ?auto_714923 ?auto_714930 ) ) ( not ( = ?auto_714924 ?auto_714925 ) ) ( not ( = ?auto_714924 ?auto_714926 ) ) ( not ( = ?auto_714924 ?auto_714927 ) ) ( not ( = ?auto_714924 ?auto_714928 ) ) ( not ( = ?auto_714924 ?auto_714929 ) ) ( not ( = ?auto_714924 ?auto_714930 ) ) ( not ( = ?auto_714925 ?auto_714926 ) ) ( not ( = ?auto_714925 ?auto_714927 ) ) ( not ( = ?auto_714925 ?auto_714928 ) ) ( not ( = ?auto_714925 ?auto_714929 ) ) ( not ( = ?auto_714925 ?auto_714930 ) ) ( not ( = ?auto_714926 ?auto_714927 ) ) ( not ( = ?auto_714926 ?auto_714928 ) ) ( not ( = ?auto_714926 ?auto_714929 ) ) ( not ( = ?auto_714926 ?auto_714930 ) ) ( not ( = ?auto_714927 ?auto_714928 ) ) ( not ( = ?auto_714927 ?auto_714929 ) ) ( not ( = ?auto_714927 ?auto_714930 ) ) ( not ( = ?auto_714928 ?auto_714929 ) ) ( not ( = ?auto_714928 ?auto_714930 ) ) ( not ( = ?auto_714929 ?auto_714930 ) ) ( ON ?auto_714928 ?auto_714929 ) ( ON ?auto_714927 ?auto_714928 ) ( ON ?auto_714926 ?auto_714927 ) ( ON ?auto_714925 ?auto_714926 ) ( ON ?auto_714924 ?auto_714925 ) ( ON ?auto_714923 ?auto_714924 ) ( ON ?auto_714922 ?auto_714923 ) ( ON ?auto_714921 ?auto_714922 ) ( ON ?auto_714920 ?auto_714921 ) ( ON ?auto_714919 ?auto_714920 ) ( ON ?auto_714918 ?auto_714919 ) ( ON ?auto_714917 ?auto_714918 ) ( CLEAR ?auto_714915 ) ( ON ?auto_714916 ?auto_714917 ) ( CLEAR ?auto_714916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_714915 ?auto_714916 )
      ( MAKE-15PILE ?auto_714915 ?auto_714916 ?auto_714917 ?auto_714918 ?auto_714919 ?auto_714920 ?auto_714921 ?auto_714922 ?auto_714923 ?auto_714924 ?auto_714925 ?auto_714926 ?auto_714927 ?auto_714928 ?auto_714929 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_714977 - BLOCK
      ?auto_714978 - BLOCK
      ?auto_714979 - BLOCK
      ?auto_714980 - BLOCK
      ?auto_714981 - BLOCK
      ?auto_714982 - BLOCK
      ?auto_714983 - BLOCK
      ?auto_714984 - BLOCK
      ?auto_714985 - BLOCK
      ?auto_714986 - BLOCK
      ?auto_714987 - BLOCK
      ?auto_714988 - BLOCK
      ?auto_714989 - BLOCK
      ?auto_714990 - BLOCK
      ?auto_714991 - BLOCK
    )
    :vars
    (
      ?auto_714992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_714991 ?auto_714992 ) ( not ( = ?auto_714977 ?auto_714978 ) ) ( not ( = ?auto_714977 ?auto_714979 ) ) ( not ( = ?auto_714977 ?auto_714980 ) ) ( not ( = ?auto_714977 ?auto_714981 ) ) ( not ( = ?auto_714977 ?auto_714982 ) ) ( not ( = ?auto_714977 ?auto_714983 ) ) ( not ( = ?auto_714977 ?auto_714984 ) ) ( not ( = ?auto_714977 ?auto_714985 ) ) ( not ( = ?auto_714977 ?auto_714986 ) ) ( not ( = ?auto_714977 ?auto_714987 ) ) ( not ( = ?auto_714977 ?auto_714988 ) ) ( not ( = ?auto_714977 ?auto_714989 ) ) ( not ( = ?auto_714977 ?auto_714990 ) ) ( not ( = ?auto_714977 ?auto_714991 ) ) ( not ( = ?auto_714977 ?auto_714992 ) ) ( not ( = ?auto_714978 ?auto_714979 ) ) ( not ( = ?auto_714978 ?auto_714980 ) ) ( not ( = ?auto_714978 ?auto_714981 ) ) ( not ( = ?auto_714978 ?auto_714982 ) ) ( not ( = ?auto_714978 ?auto_714983 ) ) ( not ( = ?auto_714978 ?auto_714984 ) ) ( not ( = ?auto_714978 ?auto_714985 ) ) ( not ( = ?auto_714978 ?auto_714986 ) ) ( not ( = ?auto_714978 ?auto_714987 ) ) ( not ( = ?auto_714978 ?auto_714988 ) ) ( not ( = ?auto_714978 ?auto_714989 ) ) ( not ( = ?auto_714978 ?auto_714990 ) ) ( not ( = ?auto_714978 ?auto_714991 ) ) ( not ( = ?auto_714978 ?auto_714992 ) ) ( not ( = ?auto_714979 ?auto_714980 ) ) ( not ( = ?auto_714979 ?auto_714981 ) ) ( not ( = ?auto_714979 ?auto_714982 ) ) ( not ( = ?auto_714979 ?auto_714983 ) ) ( not ( = ?auto_714979 ?auto_714984 ) ) ( not ( = ?auto_714979 ?auto_714985 ) ) ( not ( = ?auto_714979 ?auto_714986 ) ) ( not ( = ?auto_714979 ?auto_714987 ) ) ( not ( = ?auto_714979 ?auto_714988 ) ) ( not ( = ?auto_714979 ?auto_714989 ) ) ( not ( = ?auto_714979 ?auto_714990 ) ) ( not ( = ?auto_714979 ?auto_714991 ) ) ( not ( = ?auto_714979 ?auto_714992 ) ) ( not ( = ?auto_714980 ?auto_714981 ) ) ( not ( = ?auto_714980 ?auto_714982 ) ) ( not ( = ?auto_714980 ?auto_714983 ) ) ( not ( = ?auto_714980 ?auto_714984 ) ) ( not ( = ?auto_714980 ?auto_714985 ) ) ( not ( = ?auto_714980 ?auto_714986 ) ) ( not ( = ?auto_714980 ?auto_714987 ) ) ( not ( = ?auto_714980 ?auto_714988 ) ) ( not ( = ?auto_714980 ?auto_714989 ) ) ( not ( = ?auto_714980 ?auto_714990 ) ) ( not ( = ?auto_714980 ?auto_714991 ) ) ( not ( = ?auto_714980 ?auto_714992 ) ) ( not ( = ?auto_714981 ?auto_714982 ) ) ( not ( = ?auto_714981 ?auto_714983 ) ) ( not ( = ?auto_714981 ?auto_714984 ) ) ( not ( = ?auto_714981 ?auto_714985 ) ) ( not ( = ?auto_714981 ?auto_714986 ) ) ( not ( = ?auto_714981 ?auto_714987 ) ) ( not ( = ?auto_714981 ?auto_714988 ) ) ( not ( = ?auto_714981 ?auto_714989 ) ) ( not ( = ?auto_714981 ?auto_714990 ) ) ( not ( = ?auto_714981 ?auto_714991 ) ) ( not ( = ?auto_714981 ?auto_714992 ) ) ( not ( = ?auto_714982 ?auto_714983 ) ) ( not ( = ?auto_714982 ?auto_714984 ) ) ( not ( = ?auto_714982 ?auto_714985 ) ) ( not ( = ?auto_714982 ?auto_714986 ) ) ( not ( = ?auto_714982 ?auto_714987 ) ) ( not ( = ?auto_714982 ?auto_714988 ) ) ( not ( = ?auto_714982 ?auto_714989 ) ) ( not ( = ?auto_714982 ?auto_714990 ) ) ( not ( = ?auto_714982 ?auto_714991 ) ) ( not ( = ?auto_714982 ?auto_714992 ) ) ( not ( = ?auto_714983 ?auto_714984 ) ) ( not ( = ?auto_714983 ?auto_714985 ) ) ( not ( = ?auto_714983 ?auto_714986 ) ) ( not ( = ?auto_714983 ?auto_714987 ) ) ( not ( = ?auto_714983 ?auto_714988 ) ) ( not ( = ?auto_714983 ?auto_714989 ) ) ( not ( = ?auto_714983 ?auto_714990 ) ) ( not ( = ?auto_714983 ?auto_714991 ) ) ( not ( = ?auto_714983 ?auto_714992 ) ) ( not ( = ?auto_714984 ?auto_714985 ) ) ( not ( = ?auto_714984 ?auto_714986 ) ) ( not ( = ?auto_714984 ?auto_714987 ) ) ( not ( = ?auto_714984 ?auto_714988 ) ) ( not ( = ?auto_714984 ?auto_714989 ) ) ( not ( = ?auto_714984 ?auto_714990 ) ) ( not ( = ?auto_714984 ?auto_714991 ) ) ( not ( = ?auto_714984 ?auto_714992 ) ) ( not ( = ?auto_714985 ?auto_714986 ) ) ( not ( = ?auto_714985 ?auto_714987 ) ) ( not ( = ?auto_714985 ?auto_714988 ) ) ( not ( = ?auto_714985 ?auto_714989 ) ) ( not ( = ?auto_714985 ?auto_714990 ) ) ( not ( = ?auto_714985 ?auto_714991 ) ) ( not ( = ?auto_714985 ?auto_714992 ) ) ( not ( = ?auto_714986 ?auto_714987 ) ) ( not ( = ?auto_714986 ?auto_714988 ) ) ( not ( = ?auto_714986 ?auto_714989 ) ) ( not ( = ?auto_714986 ?auto_714990 ) ) ( not ( = ?auto_714986 ?auto_714991 ) ) ( not ( = ?auto_714986 ?auto_714992 ) ) ( not ( = ?auto_714987 ?auto_714988 ) ) ( not ( = ?auto_714987 ?auto_714989 ) ) ( not ( = ?auto_714987 ?auto_714990 ) ) ( not ( = ?auto_714987 ?auto_714991 ) ) ( not ( = ?auto_714987 ?auto_714992 ) ) ( not ( = ?auto_714988 ?auto_714989 ) ) ( not ( = ?auto_714988 ?auto_714990 ) ) ( not ( = ?auto_714988 ?auto_714991 ) ) ( not ( = ?auto_714988 ?auto_714992 ) ) ( not ( = ?auto_714989 ?auto_714990 ) ) ( not ( = ?auto_714989 ?auto_714991 ) ) ( not ( = ?auto_714989 ?auto_714992 ) ) ( not ( = ?auto_714990 ?auto_714991 ) ) ( not ( = ?auto_714990 ?auto_714992 ) ) ( not ( = ?auto_714991 ?auto_714992 ) ) ( ON ?auto_714990 ?auto_714991 ) ( ON ?auto_714989 ?auto_714990 ) ( ON ?auto_714988 ?auto_714989 ) ( ON ?auto_714987 ?auto_714988 ) ( ON ?auto_714986 ?auto_714987 ) ( ON ?auto_714985 ?auto_714986 ) ( ON ?auto_714984 ?auto_714985 ) ( ON ?auto_714983 ?auto_714984 ) ( ON ?auto_714982 ?auto_714983 ) ( ON ?auto_714981 ?auto_714982 ) ( ON ?auto_714980 ?auto_714981 ) ( ON ?auto_714979 ?auto_714980 ) ( ON ?auto_714978 ?auto_714979 ) ( ON ?auto_714977 ?auto_714978 ) ( CLEAR ?auto_714977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_714977 )
      ( MAKE-15PILE ?auto_714977 ?auto_714978 ?auto_714979 ?auto_714980 ?auto_714981 ?auto_714982 ?auto_714983 ?auto_714984 ?auto_714985 ?auto_714986 ?auto_714987 ?auto_714988 ?auto_714989 ?auto_714990 ?auto_714991 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715040 - BLOCK
      ?auto_715041 - BLOCK
      ?auto_715042 - BLOCK
      ?auto_715043 - BLOCK
      ?auto_715044 - BLOCK
      ?auto_715045 - BLOCK
      ?auto_715046 - BLOCK
      ?auto_715047 - BLOCK
      ?auto_715048 - BLOCK
      ?auto_715049 - BLOCK
      ?auto_715050 - BLOCK
      ?auto_715051 - BLOCK
      ?auto_715052 - BLOCK
      ?auto_715053 - BLOCK
      ?auto_715054 - BLOCK
      ?auto_715055 - BLOCK
    )
    :vars
    (
      ?auto_715056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_715054 ) ( ON ?auto_715055 ?auto_715056 ) ( CLEAR ?auto_715055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_715040 ) ( ON ?auto_715041 ?auto_715040 ) ( ON ?auto_715042 ?auto_715041 ) ( ON ?auto_715043 ?auto_715042 ) ( ON ?auto_715044 ?auto_715043 ) ( ON ?auto_715045 ?auto_715044 ) ( ON ?auto_715046 ?auto_715045 ) ( ON ?auto_715047 ?auto_715046 ) ( ON ?auto_715048 ?auto_715047 ) ( ON ?auto_715049 ?auto_715048 ) ( ON ?auto_715050 ?auto_715049 ) ( ON ?auto_715051 ?auto_715050 ) ( ON ?auto_715052 ?auto_715051 ) ( ON ?auto_715053 ?auto_715052 ) ( ON ?auto_715054 ?auto_715053 ) ( not ( = ?auto_715040 ?auto_715041 ) ) ( not ( = ?auto_715040 ?auto_715042 ) ) ( not ( = ?auto_715040 ?auto_715043 ) ) ( not ( = ?auto_715040 ?auto_715044 ) ) ( not ( = ?auto_715040 ?auto_715045 ) ) ( not ( = ?auto_715040 ?auto_715046 ) ) ( not ( = ?auto_715040 ?auto_715047 ) ) ( not ( = ?auto_715040 ?auto_715048 ) ) ( not ( = ?auto_715040 ?auto_715049 ) ) ( not ( = ?auto_715040 ?auto_715050 ) ) ( not ( = ?auto_715040 ?auto_715051 ) ) ( not ( = ?auto_715040 ?auto_715052 ) ) ( not ( = ?auto_715040 ?auto_715053 ) ) ( not ( = ?auto_715040 ?auto_715054 ) ) ( not ( = ?auto_715040 ?auto_715055 ) ) ( not ( = ?auto_715040 ?auto_715056 ) ) ( not ( = ?auto_715041 ?auto_715042 ) ) ( not ( = ?auto_715041 ?auto_715043 ) ) ( not ( = ?auto_715041 ?auto_715044 ) ) ( not ( = ?auto_715041 ?auto_715045 ) ) ( not ( = ?auto_715041 ?auto_715046 ) ) ( not ( = ?auto_715041 ?auto_715047 ) ) ( not ( = ?auto_715041 ?auto_715048 ) ) ( not ( = ?auto_715041 ?auto_715049 ) ) ( not ( = ?auto_715041 ?auto_715050 ) ) ( not ( = ?auto_715041 ?auto_715051 ) ) ( not ( = ?auto_715041 ?auto_715052 ) ) ( not ( = ?auto_715041 ?auto_715053 ) ) ( not ( = ?auto_715041 ?auto_715054 ) ) ( not ( = ?auto_715041 ?auto_715055 ) ) ( not ( = ?auto_715041 ?auto_715056 ) ) ( not ( = ?auto_715042 ?auto_715043 ) ) ( not ( = ?auto_715042 ?auto_715044 ) ) ( not ( = ?auto_715042 ?auto_715045 ) ) ( not ( = ?auto_715042 ?auto_715046 ) ) ( not ( = ?auto_715042 ?auto_715047 ) ) ( not ( = ?auto_715042 ?auto_715048 ) ) ( not ( = ?auto_715042 ?auto_715049 ) ) ( not ( = ?auto_715042 ?auto_715050 ) ) ( not ( = ?auto_715042 ?auto_715051 ) ) ( not ( = ?auto_715042 ?auto_715052 ) ) ( not ( = ?auto_715042 ?auto_715053 ) ) ( not ( = ?auto_715042 ?auto_715054 ) ) ( not ( = ?auto_715042 ?auto_715055 ) ) ( not ( = ?auto_715042 ?auto_715056 ) ) ( not ( = ?auto_715043 ?auto_715044 ) ) ( not ( = ?auto_715043 ?auto_715045 ) ) ( not ( = ?auto_715043 ?auto_715046 ) ) ( not ( = ?auto_715043 ?auto_715047 ) ) ( not ( = ?auto_715043 ?auto_715048 ) ) ( not ( = ?auto_715043 ?auto_715049 ) ) ( not ( = ?auto_715043 ?auto_715050 ) ) ( not ( = ?auto_715043 ?auto_715051 ) ) ( not ( = ?auto_715043 ?auto_715052 ) ) ( not ( = ?auto_715043 ?auto_715053 ) ) ( not ( = ?auto_715043 ?auto_715054 ) ) ( not ( = ?auto_715043 ?auto_715055 ) ) ( not ( = ?auto_715043 ?auto_715056 ) ) ( not ( = ?auto_715044 ?auto_715045 ) ) ( not ( = ?auto_715044 ?auto_715046 ) ) ( not ( = ?auto_715044 ?auto_715047 ) ) ( not ( = ?auto_715044 ?auto_715048 ) ) ( not ( = ?auto_715044 ?auto_715049 ) ) ( not ( = ?auto_715044 ?auto_715050 ) ) ( not ( = ?auto_715044 ?auto_715051 ) ) ( not ( = ?auto_715044 ?auto_715052 ) ) ( not ( = ?auto_715044 ?auto_715053 ) ) ( not ( = ?auto_715044 ?auto_715054 ) ) ( not ( = ?auto_715044 ?auto_715055 ) ) ( not ( = ?auto_715044 ?auto_715056 ) ) ( not ( = ?auto_715045 ?auto_715046 ) ) ( not ( = ?auto_715045 ?auto_715047 ) ) ( not ( = ?auto_715045 ?auto_715048 ) ) ( not ( = ?auto_715045 ?auto_715049 ) ) ( not ( = ?auto_715045 ?auto_715050 ) ) ( not ( = ?auto_715045 ?auto_715051 ) ) ( not ( = ?auto_715045 ?auto_715052 ) ) ( not ( = ?auto_715045 ?auto_715053 ) ) ( not ( = ?auto_715045 ?auto_715054 ) ) ( not ( = ?auto_715045 ?auto_715055 ) ) ( not ( = ?auto_715045 ?auto_715056 ) ) ( not ( = ?auto_715046 ?auto_715047 ) ) ( not ( = ?auto_715046 ?auto_715048 ) ) ( not ( = ?auto_715046 ?auto_715049 ) ) ( not ( = ?auto_715046 ?auto_715050 ) ) ( not ( = ?auto_715046 ?auto_715051 ) ) ( not ( = ?auto_715046 ?auto_715052 ) ) ( not ( = ?auto_715046 ?auto_715053 ) ) ( not ( = ?auto_715046 ?auto_715054 ) ) ( not ( = ?auto_715046 ?auto_715055 ) ) ( not ( = ?auto_715046 ?auto_715056 ) ) ( not ( = ?auto_715047 ?auto_715048 ) ) ( not ( = ?auto_715047 ?auto_715049 ) ) ( not ( = ?auto_715047 ?auto_715050 ) ) ( not ( = ?auto_715047 ?auto_715051 ) ) ( not ( = ?auto_715047 ?auto_715052 ) ) ( not ( = ?auto_715047 ?auto_715053 ) ) ( not ( = ?auto_715047 ?auto_715054 ) ) ( not ( = ?auto_715047 ?auto_715055 ) ) ( not ( = ?auto_715047 ?auto_715056 ) ) ( not ( = ?auto_715048 ?auto_715049 ) ) ( not ( = ?auto_715048 ?auto_715050 ) ) ( not ( = ?auto_715048 ?auto_715051 ) ) ( not ( = ?auto_715048 ?auto_715052 ) ) ( not ( = ?auto_715048 ?auto_715053 ) ) ( not ( = ?auto_715048 ?auto_715054 ) ) ( not ( = ?auto_715048 ?auto_715055 ) ) ( not ( = ?auto_715048 ?auto_715056 ) ) ( not ( = ?auto_715049 ?auto_715050 ) ) ( not ( = ?auto_715049 ?auto_715051 ) ) ( not ( = ?auto_715049 ?auto_715052 ) ) ( not ( = ?auto_715049 ?auto_715053 ) ) ( not ( = ?auto_715049 ?auto_715054 ) ) ( not ( = ?auto_715049 ?auto_715055 ) ) ( not ( = ?auto_715049 ?auto_715056 ) ) ( not ( = ?auto_715050 ?auto_715051 ) ) ( not ( = ?auto_715050 ?auto_715052 ) ) ( not ( = ?auto_715050 ?auto_715053 ) ) ( not ( = ?auto_715050 ?auto_715054 ) ) ( not ( = ?auto_715050 ?auto_715055 ) ) ( not ( = ?auto_715050 ?auto_715056 ) ) ( not ( = ?auto_715051 ?auto_715052 ) ) ( not ( = ?auto_715051 ?auto_715053 ) ) ( not ( = ?auto_715051 ?auto_715054 ) ) ( not ( = ?auto_715051 ?auto_715055 ) ) ( not ( = ?auto_715051 ?auto_715056 ) ) ( not ( = ?auto_715052 ?auto_715053 ) ) ( not ( = ?auto_715052 ?auto_715054 ) ) ( not ( = ?auto_715052 ?auto_715055 ) ) ( not ( = ?auto_715052 ?auto_715056 ) ) ( not ( = ?auto_715053 ?auto_715054 ) ) ( not ( = ?auto_715053 ?auto_715055 ) ) ( not ( = ?auto_715053 ?auto_715056 ) ) ( not ( = ?auto_715054 ?auto_715055 ) ) ( not ( = ?auto_715054 ?auto_715056 ) ) ( not ( = ?auto_715055 ?auto_715056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_715055 ?auto_715056 )
      ( !STACK ?auto_715055 ?auto_715054 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715106 - BLOCK
      ?auto_715107 - BLOCK
      ?auto_715108 - BLOCK
      ?auto_715109 - BLOCK
      ?auto_715110 - BLOCK
      ?auto_715111 - BLOCK
      ?auto_715112 - BLOCK
      ?auto_715113 - BLOCK
      ?auto_715114 - BLOCK
      ?auto_715115 - BLOCK
      ?auto_715116 - BLOCK
      ?auto_715117 - BLOCK
      ?auto_715118 - BLOCK
      ?auto_715119 - BLOCK
      ?auto_715120 - BLOCK
      ?auto_715121 - BLOCK
    )
    :vars
    (
      ?auto_715122 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715121 ?auto_715122 ) ( ON-TABLE ?auto_715106 ) ( ON ?auto_715107 ?auto_715106 ) ( ON ?auto_715108 ?auto_715107 ) ( ON ?auto_715109 ?auto_715108 ) ( ON ?auto_715110 ?auto_715109 ) ( ON ?auto_715111 ?auto_715110 ) ( ON ?auto_715112 ?auto_715111 ) ( ON ?auto_715113 ?auto_715112 ) ( ON ?auto_715114 ?auto_715113 ) ( ON ?auto_715115 ?auto_715114 ) ( ON ?auto_715116 ?auto_715115 ) ( ON ?auto_715117 ?auto_715116 ) ( ON ?auto_715118 ?auto_715117 ) ( ON ?auto_715119 ?auto_715118 ) ( not ( = ?auto_715106 ?auto_715107 ) ) ( not ( = ?auto_715106 ?auto_715108 ) ) ( not ( = ?auto_715106 ?auto_715109 ) ) ( not ( = ?auto_715106 ?auto_715110 ) ) ( not ( = ?auto_715106 ?auto_715111 ) ) ( not ( = ?auto_715106 ?auto_715112 ) ) ( not ( = ?auto_715106 ?auto_715113 ) ) ( not ( = ?auto_715106 ?auto_715114 ) ) ( not ( = ?auto_715106 ?auto_715115 ) ) ( not ( = ?auto_715106 ?auto_715116 ) ) ( not ( = ?auto_715106 ?auto_715117 ) ) ( not ( = ?auto_715106 ?auto_715118 ) ) ( not ( = ?auto_715106 ?auto_715119 ) ) ( not ( = ?auto_715106 ?auto_715120 ) ) ( not ( = ?auto_715106 ?auto_715121 ) ) ( not ( = ?auto_715106 ?auto_715122 ) ) ( not ( = ?auto_715107 ?auto_715108 ) ) ( not ( = ?auto_715107 ?auto_715109 ) ) ( not ( = ?auto_715107 ?auto_715110 ) ) ( not ( = ?auto_715107 ?auto_715111 ) ) ( not ( = ?auto_715107 ?auto_715112 ) ) ( not ( = ?auto_715107 ?auto_715113 ) ) ( not ( = ?auto_715107 ?auto_715114 ) ) ( not ( = ?auto_715107 ?auto_715115 ) ) ( not ( = ?auto_715107 ?auto_715116 ) ) ( not ( = ?auto_715107 ?auto_715117 ) ) ( not ( = ?auto_715107 ?auto_715118 ) ) ( not ( = ?auto_715107 ?auto_715119 ) ) ( not ( = ?auto_715107 ?auto_715120 ) ) ( not ( = ?auto_715107 ?auto_715121 ) ) ( not ( = ?auto_715107 ?auto_715122 ) ) ( not ( = ?auto_715108 ?auto_715109 ) ) ( not ( = ?auto_715108 ?auto_715110 ) ) ( not ( = ?auto_715108 ?auto_715111 ) ) ( not ( = ?auto_715108 ?auto_715112 ) ) ( not ( = ?auto_715108 ?auto_715113 ) ) ( not ( = ?auto_715108 ?auto_715114 ) ) ( not ( = ?auto_715108 ?auto_715115 ) ) ( not ( = ?auto_715108 ?auto_715116 ) ) ( not ( = ?auto_715108 ?auto_715117 ) ) ( not ( = ?auto_715108 ?auto_715118 ) ) ( not ( = ?auto_715108 ?auto_715119 ) ) ( not ( = ?auto_715108 ?auto_715120 ) ) ( not ( = ?auto_715108 ?auto_715121 ) ) ( not ( = ?auto_715108 ?auto_715122 ) ) ( not ( = ?auto_715109 ?auto_715110 ) ) ( not ( = ?auto_715109 ?auto_715111 ) ) ( not ( = ?auto_715109 ?auto_715112 ) ) ( not ( = ?auto_715109 ?auto_715113 ) ) ( not ( = ?auto_715109 ?auto_715114 ) ) ( not ( = ?auto_715109 ?auto_715115 ) ) ( not ( = ?auto_715109 ?auto_715116 ) ) ( not ( = ?auto_715109 ?auto_715117 ) ) ( not ( = ?auto_715109 ?auto_715118 ) ) ( not ( = ?auto_715109 ?auto_715119 ) ) ( not ( = ?auto_715109 ?auto_715120 ) ) ( not ( = ?auto_715109 ?auto_715121 ) ) ( not ( = ?auto_715109 ?auto_715122 ) ) ( not ( = ?auto_715110 ?auto_715111 ) ) ( not ( = ?auto_715110 ?auto_715112 ) ) ( not ( = ?auto_715110 ?auto_715113 ) ) ( not ( = ?auto_715110 ?auto_715114 ) ) ( not ( = ?auto_715110 ?auto_715115 ) ) ( not ( = ?auto_715110 ?auto_715116 ) ) ( not ( = ?auto_715110 ?auto_715117 ) ) ( not ( = ?auto_715110 ?auto_715118 ) ) ( not ( = ?auto_715110 ?auto_715119 ) ) ( not ( = ?auto_715110 ?auto_715120 ) ) ( not ( = ?auto_715110 ?auto_715121 ) ) ( not ( = ?auto_715110 ?auto_715122 ) ) ( not ( = ?auto_715111 ?auto_715112 ) ) ( not ( = ?auto_715111 ?auto_715113 ) ) ( not ( = ?auto_715111 ?auto_715114 ) ) ( not ( = ?auto_715111 ?auto_715115 ) ) ( not ( = ?auto_715111 ?auto_715116 ) ) ( not ( = ?auto_715111 ?auto_715117 ) ) ( not ( = ?auto_715111 ?auto_715118 ) ) ( not ( = ?auto_715111 ?auto_715119 ) ) ( not ( = ?auto_715111 ?auto_715120 ) ) ( not ( = ?auto_715111 ?auto_715121 ) ) ( not ( = ?auto_715111 ?auto_715122 ) ) ( not ( = ?auto_715112 ?auto_715113 ) ) ( not ( = ?auto_715112 ?auto_715114 ) ) ( not ( = ?auto_715112 ?auto_715115 ) ) ( not ( = ?auto_715112 ?auto_715116 ) ) ( not ( = ?auto_715112 ?auto_715117 ) ) ( not ( = ?auto_715112 ?auto_715118 ) ) ( not ( = ?auto_715112 ?auto_715119 ) ) ( not ( = ?auto_715112 ?auto_715120 ) ) ( not ( = ?auto_715112 ?auto_715121 ) ) ( not ( = ?auto_715112 ?auto_715122 ) ) ( not ( = ?auto_715113 ?auto_715114 ) ) ( not ( = ?auto_715113 ?auto_715115 ) ) ( not ( = ?auto_715113 ?auto_715116 ) ) ( not ( = ?auto_715113 ?auto_715117 ) ) ( not ( = ?auto_715113 ?auto_715118 ) ) ( not ( = ?auto_715113 ?auto_715119 ) ) ( not ( = ?auto_715113 ?auto_715120 ) ) ( not ( = ?auto_715113 ?auto_715121 ) ) ( not ( = ?auto_715113 ?auto_715122 ) ) ( not ( = ?auto_715114 ?auto_715115 ) ) ( not ( = ?auto_715114 ?auto_715116 ) ) ( not ( = ?auto_715114 ?auto_715117 ) ) ( not ( = ?auto_715114 ?auto_715118 ) ) ( not ( = ?auto_715114 ?auto_715119 ) ) ( not ( = ?auto_715114 ?auto_715120 ) ) ( not ( = ?auto_715114 ?auto_715121 ) ) ( not ( = ?auto_715114 ?auto_715122 ) ) ( not ( = ?auto_715115 ?auto_715116 ) ) ( not ( = ?auto_715115 ?auto_715117 ) ) ( not ( = ?auto_715115 ?auto_715118 ) ) ( not ( = ?auto_715115 ?auto_715119 ) ) ( not ( = ?auto_715115 ?auto_715120 ) ) ( not ( = ?auto_715115 ?auto_715121 ) ) ( not ( = ?auto_715115 ?auto_715122 ) ) ( not ( = ?auto_715116 ?auto_715117 ) ) ( not ( = ?auto_715116 ?auto_715118 ) ) ( not ( = ?auto_715116 ?auto_715119 ) ) ( not ( = ?auto_715116 ?auto_715120 ) ) ( not ( = ?auto_715116 ?auto_715121 ) ) ( not ( = ?auto_715116 ?auto_715122 ) ) ( not ( = ?auto_715117 ?auto_715118 ) ) ( not ( = ?auto_715117 ?auto_715119 ) ) ( not ( = ?auto_715117 ?auto_715120 ) ) ( not ( = ?auto_715117 ?auto_715121 ) ) ( not ( = ?auto_715117 ?auto_715122 ) ) ( not ( = ?auto_715118 ?auto_715119 ) ) ( not ( = ?auto_715118 ?auto_715120 ) ) ( not ( = ?auto_715118 ?auto_715121 ) ) ( not ( = ?auto_715118 ?auto_715122 ) ) ( not ( = ?auto_715119 ?auto_715120 ) ) ( not ( = ?auto_715119 ?auto_715121 ) ) ( not ( = ?auto_715119 ?auto_715122 ) ) ( not ( = ?auto_715120 ?auto_715121 ) ) ( not ( = ?auto_715120 ?auto_715122 ) ) ( not ( = ?auto_715121 ?auto_715122 ) ) ( CLEAR ?auto_715119 ) ( ON ?auto_715120 ?auto_715121 ) ( CLEAR ?auto_715120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_715106 ?auto_715107 ?auto_715108 ?auto_715109 ?auto_715110 ?auto_715111 ?auto_715112 ?auto_715113 ?auto_715114 ?auto_715115 ?auto_715116 ?auto_715117 ?auto_715118 ?auto_715119 ?auto_715120 )
      ( MAKE-16PILE ?auto_715106 ?auto_715107 ?auto_715108 ?auto_715109 ?auto_715110 ?auto_715111 ?auto_715112 ?auto_715113 ?auto_715114 ?auto_715115 ?auto_715116 ?auto_715117 ?auto_715118 ?auto_715119 ?auto_715120 ?auto_715121 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715172 - BLOCK
      ?auto_715173 - BLOCK
      ?auto_715174 - BLOCK
      ?auto_715175 - BLOCK
      ?auto_715176 - BLOCK
      ?auto_715177 - BLOCK
      ?auto_715178 - BLOCK
      ?auto_715179 - BLOCK
      ?auto_715180 - BLOCK
      ?auto_715181 - BLOCK
      ?auto_715182 - BLOCK
      ?auto_715183 - BLOCK
      ?auto_715184 - BLOCK
      ?auto_715185 - BLOCK
      ?auto_715186 - BLOCK
      ?auto_715187 - BLOCK
    )
    :vars
    (
      ?auto_715188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715187 ?auto_715188 ) ( ON-TABLE ?auto_715172 ) ( ON ?auto_715173 ?auto_715172 ) ( ON ?auto_715174 ?auto_715173 ) ( ON ?auto_715175 ?auto_715174 ) ( ON ?auto_715176 ?auto_715175 ) ( ON ?auto_715177 ?auto_715176 ) ( ON ?auto_715178 ?auto_715177 ) ( ON ?auto_715179 ?auto_715178 ) ( ON ?auto_715180 ?auto_715179 ) ( ON ?auto_715181 ?auto_715180 ) ( ON ?auto_715182 ?auto_715181 ) ( ON ?auto_715183 ?auto_715182 ) ( ON ?auto_715184 ?auto_715183 ) ( not ( = ?auto_715172 ?auto_715173 ) ) ( not ( = ?auto_715172 ?auto_715174 ) ) ( not ( = ?auto_715172 ?auto_715175 ) ) ( not ( = ?auto_715172 ?auto_715176 ) ) ( not ( = ?auto_715172 ?auto_715177 ) ) ( not ( = ?auto_715172 ?auto_715178 ) ) ( not ( = ?auto_715172 ?auto_715179 ) ) ( not ( = ?auto_715172 ?auto_715180 ) ) ( not ( = ?auto_715172 ?auto_715181 ) ) ( not ( = ?auto_715172 ?auto_715182 ) ) ( not ( = ?auto_715172 ?auto_715183 ) ) ( not ( = ?auto_715172 ?auto_715184 ) ) ( not ( = ?auto_715172 ?auto_715185 ) ) ( not ( = ?auto_715172 ?auto_715186 ) ) ( not ( = ?auto_715172 ?auto_715187 ) ) ( not ( = ?auto_715172 ?auto_715188 ) ) ( not ( = ?auto_715173 ?auto_715174 ) ) ( not ( = ?auto_715173 ?auto_715175 ) ) ( not ( = ?auto_715173 ?auto_715176 ) ) ( not ( = ?auto_715173 ?auto_715177 ) ) ( not ( = ?auto_715173 ?auto_715178 ) ) ( not ( = ?auto_715173 ?auto_715179 ) ) ( not ( = ?auto_715173 ?auto_715180 ) ) ( not ( = ?auto_715173 ?auto_715181 ) ) ( not ( = ?auto_715173 ?auto_715182 ) ) ( not ( = ?auto_715173 ?auto_715183 ) ) ( not ( = ?auto_715173 ?auto_715184 ) ) ( not ( = ?auto_715173 ?auto_715185 ) ) ( not ( = ?auto_715173 ?auto_715186 ) ) ( not ( = ?auto_715173 ?auto_715187 ) ) ( not ( = ?auto_715173 ?auto_715188 ) ) ( not ( = ?auto_715174 ?auto_715175 ) ) ( not ( = ?auto_715174 ?auto_715176 ) ) ( not ( = ?auto_715174 ?auto_715177 ) ) ( not ( = ?auto_715174 ?auto_715178 ) ) ( not ( = ?auto_715174 ?auto_715179 ) ) ( not ( = ?auto_715174 ?auto_715180 ) ) ( not ( = ?auto_715174 ?auto_715181 ) ) ( not ( = ?auto_715174 ?auto_715182 ) ) ( not ( = ?auto_715174 ?auto_715183 ) ) ( not ( = ?auto_715174 ?auto_715184 ) ) ( not ( = ?auto_715174 ?auto_715185 ) ) ( not ( = ?auto_715174 ?auto_715186 ) ) ( not ( = ?auto_715174 ?auto_715187 ) ) ( not ( = ?auto_715174 ?auto_715188 ) ) ( not ( = ?auto_715175 ?auto_715176 ) ) ( not ( = ?auto_715175 ?auto_715177 ) ) ( not ( = ?auto_715175 ?auto_715178 ) ) ( not ( = ?auto_715175 ?auto_715179 ) ) ( not ( = ?auto_715175 ?auto_715180 ) ) ( not ( = ?auto_715175 ?auto_715181 ) ) ( not ( = ?auto_715175 ?auto_715182 ) ) ( not ( = ?auto_715175 ?auto_715183 ) ) ( not ( = ?auto_715175 ?auto_715184 ) ) ( not ( = ?auto_715175 ?auto_715185 ) ) ( not ( = ?auto_715175 ?auto_715186 ) ) ( not ( = ?auto_715175 ?auto_715187 ) ) ( not ( = ?auto_715175 ?auto_715188 ) ) ( not ( = ?auto_715176 ?auto_715177 ) ) ( not ( = ?auto_715176 ?auto_715178 ) ) ( not ( = ?auto_715176 ?auto_715179 ) ) ( not ( = ?auto_715176 ?auto_715180 ) ) ( not ( = ?auto_715176 ?auto_715181 ) ) ( not ( = ?auto_715176 ?auto_715182 ) ) ( not ( = ?auto_715176 ?auto_715183 ) ) ( not ( = ?auto_715176 ?auto_715184 ) ) ( not ( = ?auto_715176 ?auto_715185 ) ) ( not ( = ?auto_715176 ?auto_715186 ) ) ( not ( = ?auto_715176 ?auto_715187 ) ) ( not ( = ?auto_715176 ?auto_715188 ) ) ( not ( = ?auto_715177 ?auto_715178 ) ) ( not ( = ?auto_715177 ?auto_715179 ) ) ( not ( = ?auto_715177 ?auto_715180 ) ) ( not ( = ?auto_715177 ?auto_715181 ) ) ( not ( = ?auto_715177 ?auto_715182 ) ) ( not ( = ?auto_715177 ?auto_715183 ) ) ( not ( = ?auto_715177 ?auto_715184 ) ) ( not ( = ?auto_715177 ?auto_715185 ) ) ( not ( = ?auto_715177 ?auto_715186 ) ) ( not ( = ?auto_715177 ?auto_715187 ) ) ( not ( = ?auto_715177 ?auto_715188 ) ) ( not ( = ?auto_715178 ?auto_715179 ) ) ( not ( = ?auto_715178 ?auto_715180 ) ) ( not ( = ?auto_715178 ?auto_715181 ) ) ( not ( = ?auto_715178 ?auto_715182 ) ) ( not ( = ?auto_715178 ?auto_715183 ) ) ( not ( = ?auto_715178 ?auto_715184 ) ) ( not ( = ?auto_715178 ?auto_715185 ) ) ( not ( = ?auto_715178 ?auto_715186 ) ) ( not ( = ?auto_715178 ?auto_715187 ) ) ( not ( = ?auto_715178 ?auto_715188 ) ) ( not ( = ?auto_715179 ?auto_715180 ) ) ( not ( = ?auto_715179 ?auto_715181 ) ) ( not ( = ?auto_715179 ?auto_715182 ) ) ( not ( = ?auto_715179 ?auto_715183 ) ) ( not ( = ?auto_715179 ?auto_715184 ) ) ( not ( = ?auto_715179 ?auto_715185 ) ) ( not ( = ?auto_715179 ?auto_715186 ) ) ( not ( = ?auto_715179 ?auto_715187 ) ) ( not ( = ?auto_715179 ?auto_715188 ) ) ( not ( = ?auto_715180 ?auto_715181 ) ) ( not ( = ?auto_715180 ?auto_715182 ) ) ( not ( = ?auto_715180 ?auto_715183 ) ) ( not ( = ?auto_715180 ?auto_715184 ) ) ( not ( = ?auto_715180 ?auto_715185 ) ) ( not ( = ?auto_715180 ?auto_715186 ) ) ( not ( = ?auto_715180 ?auto_715187 ) ) ( not ( = ?auto_715180 ?auto_715188 ) ) ( not ( = ?auto_715181 ?auto_715182 ) ) ( not ( = ?auto_715181 ?auto_715183 ) ) ( not ( = ?auto_715181 ?auto_715184 ) ) ( not ( = ?auto_715181 ?auto_715185 ) ) ( not ( = ?auto_715181 ?auto_715186 ) ) ( not ( = ?auto_715181 ?auto_715187 ) ) ( not ( = ?auto_715181 ?auto_715188 ) ) ( not ( = ?auto_715182 ?auto_715183 ) ) ( not ( = ?auto_715182 ?auto_715184 ) ) ( not ( = ?auto_715182 ?auto_715185 ) ) ( not ( = ?auto_715182 ?auto_715186 ) ) ( not ( = ?auto_715182 ?auto_715187 ) ) ( not ( = ?auto_715182 ?auto_715188 ) ) ( not ( = ?auto_715183 ?auto_715184 ) ) ( not ( = ?auto_715183 ?auto_715185 ) ) ( not ( = ?auto_715183 ?auto_715186 ) ) ( not ( = ?auto_715183 ?auto_715187 ) ) ( not ( = ?auto_715183 ?auto_715188 ) ) ( not ( = ?auto_715184 ?auto_715185 ) ) ( not ( = ?auto_715184 ?auto_715186 ) ) ( not ( = ?auto_715184 ?auto_715187 ) ) ( not ( = ?auto_715184 ?auto_715188 ) ) ( not ( = ?auto_715185 ?auto_715186 ) ) ( not ( = ?auto_715185 ?auto_715187 ) ) ( not ( = ?auto_715185 ?auto_715188 ) ) ( not ( = ?auto_715186 ?auto_715187 ) ) ( not ( = ?auto_715186 ?auto_715188 ) ) ( not ( = ?auto_715187 ?auto_715188 ) ) ( ON ?auto_715186 ?auto_715187 ) ( CLEAR ?auto_715184 ) ( ON ?auto_715185 ?auto_715186 ) ( CLEAR ?auto_715185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_715172 ?auto_715173 ?auto_715174 ?auto_715175 ?auto_715176 ?auto_715177 ?auto_715178 ?auto_715179 ?auto_715180 ?auto_715181 ?auto_715182 ?auto_715183 ?auto_715184 ?auto_715185 )
      ( MAKE-16PILE ?auto_715172 ?auto_715173 ?auto_715174 ?auto_715175 ?auto_715176 ?auto_715177 ?auto_715178 ?auto_715179 ?auto_715180 ?auto_715181 ?auto_715182 ?auto_715183 ?auto_715184 ?auto_715185 ?auto_715186 ?auto_715187 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715238 - BLOCK
      ?auto_715239 - BLOCK
      ?auto_715240 - BLOCK
      ?auto_715241 - BLOCK
      ?auto_715242 - BLOCK
      ?auto_715243 - BLOCK
      ?auto_715244 - BLOCK
      ?auto_715245 - BLOCK
      ?auto_715246 - BLOCK
      ?auto_715247 - BLOCK
      ?auto_715248 - BLOCK
      ?auto_715249 - BLOCK
      ?auto_715250 - BLOCK
      ?auto_715251 - BLOCK
      ?auto_715252 - BLOCK
      ?auto_715253 - BLOCK
    )
    :vars
    (
      ?auto_715254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715253 ?auto_715254 ) ( ON-TABLE ?auto_715238 ) ( ON ?auto_715239 ?auto_715238 ) ( ON ?auto_715240 ?auto_715239 ) ( ON ?auto_715241 ?auto_715240 ) ( ON ?auto_715242 ?auto_715241 ) ( ON ?auto_715243 ?auto_715242 ) ( ON ?auto_715244 ?auto_715243 ) ( ON ?auto_715245 ?auto_715244 ) ( ON ?auto_715246 ?auto_715245 ) ( ON ?auto_715247 ?auto_715246 ) ( ON ?auto_715248 ?auto_715247 ) ( ON ?auto_715249 ?auto_715248 ) ( not ( = ?auto_715238 ?auto_715239 ) ) ( not ( = ?auto_715238 ?auto_715240 ) ) ( not ( = ?auto_715238 ?auto_715241 ) ) ( not ( = ?auto_715238 ?auto_715242 ) ) ( not ( = ?auto_715238 ?auto_715243 ) ) ( not ( = ?auto_715238 ?auto_715244 ) ) ( not ( = ?auto_715238 ?auto_715245 ) ) ( not ( = ?auto_715238 ?auto_715246 ) ) ( not ( = ?auto_715238 ?auto_715247 ) ) ( not ( = ?auto_715238 ?auto_715248 ) ) ( not ( = ?auto_715238 ?auto_715249 ) ) ( not ( = ?auto_715238 ?auto_715250 ) ) ( not ( = ?auto_715238 ?auto_715251 ) ) ( not ( = ?auto_715238 ?auto_715252 ) ) ( not ( = ?auto_715238 ?auto_715253 ) ) ( not ( = ?auto_715238 ?auto_715254 ) ) ( not ( = ?auto_715239 ?auto_715240 ) ) ( not ( = ?auto_715239 ?auto_715241 ) ) ( not ( = ?auto_715239 ?auto_715242 ) ) ( not ( = ?auto_715239 ?auto_715243 ) ) ( not ( = ?auto_715239 ?auto_715244 ) ) ( not ( = ?auto_715239 ?auto_715245 ) ) ( not ( = ?auto_715239 ?auto_715246 ) ) ( not ( = ?auto_715239 ?auto_715247 ) ) ( not ( = ?auto_715239 ?auto_715248 ) ) ( not ( = ?auto_715239 ?auto_715249 ) ) ( not ( = ?auto_715239 ?auto_715250 ) ) ( not ( = ?auto_715239 ?auto_715251 ) ) ( not ( = ?auto_715239 ?auto_715252 ) ) ( not ( = ?auto_715239 ?auto_715253 ) ) ( not ( = ?auto_715239 ?auto_715254 ) ) ( not ( = ?auto_715240 ?auto_715241 ) ) ( not ( = ?auto_715240 ?auto_715242 ) ) ( not ( = ?auto_715240 ?auto_715243 ) ) ( not ( = ?auto_715240 ?auto_715244 ) ) ( not ( = ?auto_715240 ?auto_715245 ) ) ( not ( = ?auto_715240 ?auto_715246 ) ) ( not ( = ?auto_715240 ?auto_715247 ) ) ( not ( = ?auto_715240 ?auto_715248 ) ) ( not ( = ?auto_715240 ?auto_715249 ) ) ( not ( = ?auto_715240 ?auto_715250 ) ) ( not ( = ?auto_715240 ?auto_715251 ) ) ( not ( = ?auto_715240 ?auto_715252 ) ) ( not ( = ?auto_715240 ?auto_715253 ) ) ( not ( = ?auto_715240 ?auto_715254 ) ) ( not ( = ?auto_715241 ?auto_715242 ) ) ( not ( = ?auto_715241 ?auto_715243 ) ) ( not ( = ?auto_715241 ?auto_715244 ) ) ( not ( = ?auto_715241 ?auto_715245 ) ) ( not ( = ?auto_715241 ?auto_715246 ) ) ( not ( = ?auto_715241 ?auto_715247 ) ) ( not ( = ?auto_715241 ?auto_715248 ) ) ( not ( = ?auto_715241 ?auto_715249 ) ) ( not ( = ?auto_715241 ?auto_715250 ) ) ( not ( = ?auto_715241 ?auto_715251 ) ) ( not ( = ?auto_715241 ?auto_715252 ) ) ( not ( = ?auto_715241 ?auto_715253 ) ) ( not ( = ?auto_715241 ?auto_715254 ) ) ( not ( = ?auto_715242 ?auto_715243 ) ) ( not ( = ?auto_715242 ?auto_715244 ) ) ( not ( = ?auto_715242 ?auto_715245 ) ) ( not ( = ?auto_715242 ?auto_715246 ) ) ( not ( = ?auto_715242 ?auto_715247 ) ) ( not ( = ?auto_715242 ?auto_715248 ) ) ( not ( = ?auto_715242 ?auto_715249 ) ) ( not ( = ?auto_715242 ?auto_715250 ) ) ( not ( = ?auto_715242 ?auto_715251 ) ) ( not ( = ?auto_715242 ?auto_715252 ) ) ( not ( = ?auto_715242 ?auto_715253 ) ) ( not ( = ?auto_715242 ?auto_715254 ) ) ( not ( = ?auto_715243 ?auto_715244 ) ) ( not ( = ?auto_715243 ?auto_715245 ) ) ( not ( = ?auto_715243 ?auto_715246 ) ) ( not ( = ?auto_715243 ?auto_715247 ) ) ( not ( = ?auto_715243 ?auto_715248 ) ) ( not ( = ?auto_715243 ?auto_715249 ) ) ( not ( = ?auto_715243 ?auto_715250 ) ) ( not ( = ?auto_715243 ?auto_715251 ) ) ( not ( = ?auto_715243 ?auto_715252 ) ) ( not ( = ?auto_715243 ?auto_715253 ) ) ( not ( = ?auto_715243 ?auto_715254 ) ) ( not ( = ?auto_715244 ?auto_715245 ) ) ( not ( = ?auto_715244 ?auto_715246 ) ) ( not ( = ?auto_715244 ?auto_715247 ) ) ( not ( = ?auto_715244 ?auto_715248 ) ) ( not ( = ?auto_715244 ?auto_715249 ) ) ( not ( = ?auto_715244 ?auto_715250 ) ) ( not ( = ?auto_715244 ?auto_715251 ) ) ( not ( = ?auto_715244 ?auto_715252 ) ) ( not ( = ?auto_715244 ?auto_715253 ) ) ( not ( = ?auto_715244 ?auto_715254 ) ) ( not ( = ?auto_715245 ?auto_715246 ) ) ( not ( = ?auto_715245 ?auto_715247 ) ) ( not ( = ?auto_715245 ?auto_715248 ) ) ( not ( = ?auto_715245 ?auto_715249 ) ) ( not ( = ?auto_715245 ?auto_715250 ) ) ( not ( = ?auto_715245 ?auto_715251 ) ) ( not ( = ?auto_715245 ?auto_715252 ) ) ( not ( = ?auto_715245 ?auto_715253 ) ) ( not ( = ?auto_715245 ?auto_715254 ) ) ( not ( = ?auto_715246 ?auto_715247 ) ) ( not ( = ?auto_715246 ?auto_715248 ) ) ( not ( = ?auto_715246 ?auto_715249 ) ) ( not ( = ?auto_715246 ?auto_715250 ) ) ( not ( = ?auto_715246 ?auto_715251 ) ) ( not ( = ?auto_715246 ?auto_715252 ) ) ( not ( = ?auto_715246 ?auto_715253 ) ) ( not ( = ?auto_715246 ?auto_715254 ) ) ( not ( = ?auto_715247 ?auto_715248 ) ) ( not ( = ?auto_715247 ?auto_715249 ) ) ( not ( = ?auto_715247 ?auto_715250 ) ) ( not ( = ?auto_715247 ?auto_715251 ) ) ( not ( = ?auto_715247 ?auto_715252 ) ) ( not ( = ?auto_715247 ?auto_715253 ) ) ( not ( = ?auto_715247 ?auto_715254 ) ) ( not ( = ?auto_715248 ?auto_715249 ) ) ( not ( = ?auto_715248 ?auto_715250 ) ) ( not ( = ?auto_715248 ?auto_715251 ) ) ( not ( = ?auto_715248 ?auto_715252 ) ) ( not ( = ?auto_715248 ?auto_715253 ) ) ( not ( = ?auto_715248 ?auto_715254 ) ) ( not ( = ?auto_715249 ?auto_715250 ) ) ( not ( = ?auto_715249 ?auto_715251 ) ) ( not ( = ?auto_715249 ?auto_715252 ) ) ( not ( = ?auto_715249 ?auto_715253 ) ) ( not ( = ?auto_715249 ?auto_715254 ) ) ( not ( = ?auto_715250 ?auto_715251 ) ) ( not ( = ?auto_715250 ?auto_715252 ) ) ( not ( = ?auto_715250 ?auto_715253 ) ) ( not ( = ?auto_715250 ?auto_715254 ) ) ( not ( = ?auto_715251 ?auto_715252 ) ) ( not ( = ?auto_715251 ?auto_715253 ) ) ( not ( = ?auto_715251 ?auto_715254 ) ) ( not ( = ?auto_715252 ?auto_715253 ) ) ( not ( = ?auto_715252 ?auto_715254 ) ) ( not ( = ?auto_715253 ?auto_715254 ) ) ( ON ?auto_715252 ?auto_715253 ) ( ON ?auto_715251 ?auto_715252 ) ( CLEAR ?auto_715249 ) ( ON ?auto_715250 ?auto_715251 ) ( CLEAR ?auto_715250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_715238 ?auto_715239 ?auto_715240 ?auto_715241 ?auto_715242 ?auto_715243 ?auto_715244 ?auto_715245 ?auto_715246 ?auto_715247 ?auto_715248 ?auto_715249 ?auto_715250 )
      ( MAKE-16PILE ?auto_715238 ?auto_715239 ?auto_715240 ?auto_715241 ?auto_715242 ?auto_715243 ?auto_715244 ?auto_715245 ?auto_715246 ?auto_715247 ?auto_715248 ?auto_715249 ?auto_715250 ?auto_715251 ?auto_715252 ?auto_715253 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715304 - BLOCK
      ?auto_715305 - BLOCK
      ?auto_715306 - BLOCK
      ?auto_715307 - BLOCK
      ?auto_715308 - BLOCK
      ?auto_715309 - BLOCK
      ?auto_715310 - BLOCK
      ?auto_715311 - BLOCK
      ?auto_715312 - BLOCK
      ?auto_715313 - BLOCK
      ?auto_715314 - BLOCK
      ?auto_715315 - BLOCK
      ?auto_715316 - BLOCK
      ?auto_715317 - BLOCK
      ?auto_715318 - BLOCK
      ?auto_715319 - BLOCK
    )
    :vars
    (
      ?auto_715320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715319 ?auto_715320 ) ( ON-TABLE ?auto_715304 ) ( ON ?auto_715305 ?auto_715304 ) ( ON ?auto_715306 ?auto_715305 ) ( ON ?auto_715307 ?auto_715306 ) ( ON ?auto_715308 ?auto_715307 ) ( ON ?auto_715309 ?auto_715308 ) ( ON ?auto_715310 ?auto_715309 ) ( ON ?auto_715311 ?auto_715310 ) ( ON ?auto_715312 ?auto_715311 ) ( ON ?auto_715313 ?auto_715312 ) ( ON ?auto_715314 ?auto_715313 ) ( not ( = ?auto_715304 ?auto_715305 ) ) ( not ( = ?auto_715304 ?auto_715306 ) ) ( not ( = ?auto_715304 ?auto_715307 ) ) ( not ( = ?auto_715304 ?auto_715308 ) ) ( not ( = ?auto_715304 ?auto_715309 ) ) ( not ( = ?auto_715304 ?auto_715310 ) ) ( not ( = ?auto_715304 ?auto_715311 ) ) ( not ( = ?auto_715304 ?auto_715312 ) ) ( not ( = ?auto_715304 ?auto_715313 ) ) ( not ( = ?auto_715304 ?auto_715314 ) ) ( not ( = ?auto_715304 ?auto_715315 ) ) ( not ( = ?auto_715304 ?auto_715316 ) ) ( not ( = ?auto_715304 ?auto_715317 ) ) ( not ( = ?auto_715304 ?auto_715318 ) ) ( not ( = ?auto_715304 ?auto_715319 ) ) ( not ( = ?auto_715304 ?auto_715320 ) ) ( not ( = ?auto_715305 ?auto_715306 ) ) ( not ( = ?auto_715305 ?auto_715307 ) ) ( not ( = ?auto_715305 ?auto_715308 ) ) ( not ( = ?auto_715305 ?auto_715309 ) ) ( not ( = ?auto_715305 ?auto_715310 ) ) ( not ( = ?auto_715305 ?auto_715311 ) ) ( not ( = ?auto_715305 ?auto_715312 ) ) ( not ( = ?auto_715305 ?auto_715313 ) ) ( not ( = ?auto_715305 ?auto_715314 ) ) ( not ( = ?auto_715305 ?auto_715315 ) ) ( not ( = ?auto_715305 ?auto_715316 ) ) ( not ( = ?auto_715305 ?auto_715317 ) ) ( not ( = ?auto_715305 ?auto_715318 ) ) ( not ( = ?auto_715305 ?auto_715319 ) ) ( not ( = ?auto_715305 ?auto_715320 ) ) ( not ( = ?auto_715306 ?auto_715307 ) ) ( not ( = ?auto_715306 ?auto_715308 ) ) ( not ( = ?auto_715306 ?auto_715309 ) ) ( not ( = ?auto_715306 ?auto_715310 ) ) ( not ( = ?auto_715306 ?auto_715311 ) ) ( not ( = ?auto_715306 ?auto_715312 ) ) ( not ( = ?auto_715306 ?auto_715313 ) ) ( not ( = ?auto_715306 ?auto_715314 ) ) ( not ( = ?auto_715306 ?auto_715315 ) ) ( not ( = ?auto_715306 ?auto_715316 ) ) ( not ( = ?auto_715306 ?auto_715317 ) ) ( not ( = ?auto_715306 ?auto_715318 ) ) ( not ( = ?auto_715306 ?auto_715319 ) ) ( not ( = ?auto_715306 ?auto_715320 ) ) ( not ( = ?auto_715307 ?auto_715308 ) ) ( not ( = ?auto_715307 ?auto_715309 ) ) ( not ( = ?auto_715307 ?auto_715310 ) ) ( not ( = ?auto_715307 ?auto_715311 ) ) ( not ( = ?auto_715307 ?auto_715312 ) ) ( not ( = ?auto_715307 ?auto_715313 ) ) ( not ( = ?auto_715307 ?auto_715314 ) ) ( not ( = ?auto_715307 ?auto_715315 ) ) ( not ( = ?auto_715307 ?auto_715316 ) ) ( not ( = ?auto_715307 ?auto_715317 ) ) ( not ( = ?auto_715307 ?auto_715318 ) ) ( not ( = ?auto_715307 ?auto_715319 ) ) ( not ( = ?auto_715307 ?auto_715320 ) ) ( not ( = ?auto_715308 ?auto_715309 ) ) ( not ( = ?auto_715308 ?auto_715310 ) ) ( not ( = ?auto_715308 ?auto_715311 ) ) ( not ( = ?auto_715308 ?auto_715312 ) ) ( not ( = ?auto_715308 ?auto_715313 ) ) ( not ( = ?auto_715308 ?auto_715314 ) ) ( not ( = ?auto_715308 ?auto_715315 ) ) ( not ( = ?auto_715308 ?auto_715316 ) ) ( not ( = ?auto_715308 ?auto_715317 ) ) ( not ( = ?auto_715308 ?auto_715318 ) ) ( not ( = ?auto_715308 ?auto_715319 ) ) ( not ( = ?auto_715308 ?auto_715320 ) ) ( not ( = ?auto_715309 ?auto_715310 ) ) ( not ( = ?auto_715309 ?auto_715311 ) ) ( not ( = ?auto_715309 ?auto_715312 ) ) ( not ( = ?auto_715309 ?auto_715313 ) ) ( not ( = ?auto_715309 ?auto_715314 ) ) ( not ( = ?auto_715309 ?auto_715315 ) ) ( not ( = ?auto_715309 ?auto_715316 ) ) ( not ( = ?auto_715309 ?auto_715317 ) ) ( not ( = ?auto_715309 ?auto_715318 ) ) ( not ( = ?auto_715309 ?auto_715319 ) ) ( not ( = ?auto_715309 ?auto_715320 ) ) ( not ( = ?auto_715310 ?auto_715311 ) ) ( not ( = ?auto_715310 ?auto_715312 ) ) ( not ( = ?auto_715310 ?auto_715313 ) ) ( not ( = ?auto_715310 ?auto_715314 ) ) ( not ( = ?auto_715310 ?auto_715315 ) ) ( not ( = ?auto_715310 ?auto_715316 ) ) ( not ( = ?auto_715310 ?auto_715317 ) ) ( not ( = ?auto_715310 ?auto_715318 ) ) ( not ( = ?auto_715310 ?auto_715319 ) ) ( not ( = ?auto_715310 ?auto_715320 ) ) ( not ( = ?auto_715311 ?auto_715312 ) ) ( not ( = ?auto_715311 ?auto_715313 ) ) ( not ( = ?auto_715311 ?auto_715314 ) ) ( not ( = ?auto_715311 ?auto_715315 ) ) ( not ( = ?auto_715311 ?auto_715316 ) ) ( not ( = ?auto_715311 ?auto_715317 ) ) ( not ( = ?auto_715311 ?auto_715318 ) ) ( not ( = ?auto_715311 ?auto_715319 ) ) ( not ( = ?auto_715311 ?auto_715320 ) ) ( not ( = ?auto_715312 ?auto_715313 ) ) ( not ( = ?auto_715312 ?auto_715314 ) ) ( not ( = ?auto_715312 ?auto_715315 ) ) ( not ( = ?auto_715312 ?auto_715316 ) ) ( not ( = ?auto_715312 ?auto_715317 ) ) ( not ( = ?auto_715312 ?auto_715318 ) ) ( not ( = ?auto_715312 ?auto_715319 ) ) ( not ( = ?auto_715312 ?auto_715320 ) ) ( not ( = ?auto_715313 ?auto_715314 ) ) ( not ( = ?auto_715313 ?auto_715315 ) ) ( not ( = ?auto_715313 ?auto_715316 ) ) ( not ( = ?auto_715313 ?auto_715317 ) ) ( not ( = ?auto_715313 ?auto_715318 ) ) ( not ( = ?auto_715313 ?auto_715319 ) ) ( not ( = ?auto_715313 ?auto_715320 ) ) ( not ( = ?auto_715314 ?auto_715315 ) ) ( not ( = ?auto_715314 ?auto_715316 ) ) ( not ( = ?auto_715314 ?auto_715317 ) ) ( not ( = ?auto_715314 ?auto_715318 ) ) ( not ( = ?auto_715314 ?auto_715319 ) ) ( not ( = ?auto_715314 ?auto_715320 ) ) ( not ( = ?auto_715315 ?auto_715316 ) ) ( not ( = ?auto_715315 ?auto_715317 ) ) ( not ( = ?auto_715315 ?auto_715318 ) ) ( not ( = ?auto_715315 ?auto_715319 ) ) ( not ( = ?auto_715315 ?auto_715320 ) ) ( not ( = ?auto_715316 ?auto_715317 ) ) ( not ( = ?auto_715316 ?auto_715318 ) ) ( not ( = ?auto_715316 ?auto_715319 ) ) ( not ( = ?auto_715316 ?auto_715320 ) ) ( not ( = ?auto_715317 ?auto_715318 ) ) ( not ( = ?auto_715317 ?auto_715319 ) ) ( not ( = ?auto_715317 ?auto_715320 ) ) ( not ( = ?auto_715318 ?auto_715319 ) ) ( not ( = ?auto_715318 ?auto_715320 ) ) ( not ( = ?auto_715319 ?auto_715320 ) ) ( ON ?auto_715318 ?auto_715319 ) ( ON ?auto_715317 ?auto_715318 ) ( ON ?auto_715316 ?auto_715317 ) ( CLEAR ?auto_715314 ) ( ON ?auto_715315 ?auto_715316 ) ( CLEAR ?auto_715315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_715304 ?auto_715305 ?auto_715306 ?auto_715307 ?auto_715308 ?auto_715309 ?auto_715310 ?auto_715311 ?auto_715312 ?auto_715313 ?auto_715314 ?auto_715315 )
      ( MAKE-16PILE ?auto_715304 ?auto_715305 ?auto_715306 ?auto_715307 ?auto_715308 ?auto_715309 ?auto_715310 ?auto_715311 ?auto_715312 ?auto_715313 ?auto_715314 ?auto_715315 ?auto_715316 ?auto_715317 ?auto_715318 ?auto_715319 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715370 - BLOCK
      ?auto_715371 - BLOCK
      ?auto_715372 - BLOCK
      ?auto_715373 - BLOCK
      ?auto_715374 - BLOCK
      ?auto_715375 - BLOCK
      ?auto_715376 - BLOCK
      ?auto_715377 - BLOCK
      ?auto_715378 - BLOCK
      ?auto_715379 - BLOCK
      ?auto_715380 - BLOCK
      ?auto_715381 - BLOCK
      ?auto_715382 - BLOCK
      ?auto_715383 - BLOCK
      ?auto_715384 - BLOCK
      ?auto_715385 - BLOCK
    )
    :vars
    (
      ?auto_715386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715385 ?auto_715386 ) ( ON-TABLE ?auto_715370 ) ( ON ?auto_715371 ?auto_715370 ) ( ON ?auto_715372 ?auto_715371 ) ( ON ?auto_715373 ?auto_715372 ) ( ON ?auto_715374 ?auto_715373 ) ( ON ?auto_715375 ?auto_715374 ) ( ON ?auto_715376 ?auto_715375 ) ( ON ?auto_715377 ?auto_715376 ) ( ON ?auto_715378 ?auto_715377 ) ( ON ?auto_715379 ?auto_715378 ) ( not ( = ?auto_715370 ?auto_715371 ) ) ( not ( = ?auto_715370 ?auto_715372 ) ) ( not ( = ?auto_715370 ?auto_715373 ) ) ( not ( = ?auto_715370 ?auto_715374 ) ) ( not ( = ?auto_715370 ?auto_715375 ) ) ( not ( = ?auto_715370 ?auto_715376 ) ) ( not ( = ?auto_715370 ?auto_715377 ) ) ( not ( = ?auto_715370 ?auto_715378 ) ) ( not ( = ?auto_715370 ?auto_715379 ) ) ( not ( = ?auto_715370 ?auto_715380 ) ) ( not ( = ?auto_715370 ?auto_715381 ) ) ( not ( = ?auto_715370 ?auto_715382 ) ) ( not ( = ?auto_715370 ?auto_715383 ) ) ( not ( = ?auto_715370 ?auto_715384 ) ) ( not ( = ?auto_715370 ?auto_715385 ) ) ( not ( = ?auto_715370 ?auto_715386 ) ) ( not ( = ?auto_715371 ?auto_715372 ) ) ( not ( = ?auto_715371 ?auto_715373 ) ) ( not ( = ?auto_715371 ?auto_715374 ) ) ( not ( = ?auto_715371 ?auto_715375 ) ) ( not ( = ?auto_715371 ?auto_715376 ) ) ( not ( = ?auto_715371 ?auto_715377 ) ) ( not ( = ?auto_715371 ?auto_715378 ) ) ( not ( = ?auto_715371 ?auto_715379 ) ) ( not ( = ?auto_715371 ?auto_715380 ) ) ( not ( = ?auto_715371 ?auto_715381 ) ) ( not ( = ?auto_715371 ?auto_715382 ) ) ( not ( = ?auto_715371 ?auto_715383 ) ) ( not ( = ?auto_715371 ?auto_715384 ) ) ( not ( = ?auto_715371 ?auto_715385 ) ) ( not ( = ?auto_715371 ?auto_715386 ) ) ( not ( = ?auto_715372 ?auto_715373 ) ) ( not ( = ?auto_715372 ?auto_715374 ) ) ( not ( = ?auto_715372 ?auto_715375 ) ) ( not ( = ?auto_715372 ?auto_715376 ) ) ( not ( = ?auto_715372 ?auto_715377 ) ) ( not ( = ?auto_715372 ?auto_715378 ) ) ( not ( = ?auto_715372 ?auto_715379 ) ) ( not ( = ?auto_715372 ?auto_715380 ) ) ( not ( = ?auto_715372 ?auto_715381 ) ) ( not ( = ?auto_715372 ?auto_715382 ) ) ( not ( = ?auto_715372 ?auto_715383 ) ) ( not ( = ?auto_715372 ?auto_715384 ) ) ( not ( = ?auto_715372 ?auto_715385 ) ) ( not ( = ?auto_715372 ?auto_715386 ) ) ( not ( = ?auto_715373 ?auto_715374 ) ) ( not ( = ?auto_715373 ?auto_715375 ) ) ( not ( = ?auto_715373 ?auto_715376 ) ) ( not ( = ?auto_715373 ?auto_715377 ) ) ( not ( = ?auto_715373 ?auto_715378 ) ) ( not ( = ?auto_715373 ?auto_715379 ) ) ( not ( = ?auto_715373 ?auto_715380 ) ) ( not ( = ?auto_715373 ?auto_715381 ) ) ( not ( = ?auto_715373 ?auto_715382 ) ) ( not ( = ?auto_715373 ?auto_715383 ) ) ( not ( = ?auto_715373 ?auto_715384 ) ) ( not ( = ?auto_715373 ?auto_715385 ) ) ( not ( = ?auto_715373 ?auto_715386 ) ) ( not ( = ?auto_715374 ?auto_715375 ) ) ( not ( = ?auto_715374 ?auto_715376 ) ) ( not ( = ?auto_715374 ?auto_715377 ) ) ( not ( = ?auto_715374 ?auto_715378 ) ) ( not ( = ?auto_715374 ?auto_715379 ) ) ( not ( = ?auto_715374 ?auto_715380 ) ) ( not ( = ?auto_715374 ?auto_715381 ) ) ( not ( = ?auto_715374 ?auto_715382 ) ) ( not ( = ?auto_715374 ?auto_715383 ) ) ( not ( = ?auto_715374 ?auto_715384 ) ) ( not ( = ?auto_715374 ?auto_715385 ) ) ( not ( = ?auto_715374 ?auto_715386 ) ) ( not ( = ?auto_715375 ?auto_715376 ) ) ( not ( = ?auto_715375 ?auto_715377 ) ) ( not ( = ?auto_715375 ?auto_715378 ) ) ( not ( = ?auto_715375 ?auto_715379 ) ) ( not ( = ?auto_715375 ?auto_715380 ) ) ( not ( = ?auto_715375 ?auto_715381 ) ) ( not ( = ?auto_715375 ?auto_715382 ) ) ( not ( = ?auto_715375 ?auto_715383 ) ) ( not ( = ?auto_715375 ?auto_715384 ) ) ( not ( = ?auto_715375 ?auto_715385 ) ) ( not ( = ?auto_715375 ?auto_715386 ) ) ( not ( = ?auto_715376 ?auto_715377 ) ) ( not ( = ?auto_715376 ?auto_715378 ) ) ( not ( = ?auto_715376 ?auto_715379 ) ) ( not ( = ?auto_715376 ?auto_715380 ) ) ( not ( = ?auto_715376 ?auto_715381 ) ) ( not ( = ?auto_715376 ?auto_715382 ) ) ( not ( = ?auto_715376 ?auto_715383 ) ) ( not ( = ?auto_715376 ?auto_715384 ) ) ( not ( = ?auto_715376 ?auto_715385 ) ) ( not ( = ?auto_715376 ?auto_715386 ) ) ( not ( = ?auto_715377 ?auto_715378 ) ) ( not ( = ?auto_715377 ?auto_715379 ) ) ( not ( = ?auto_715377 ?auto_715380 ) ) ( not ( = ?auto_715377 ?auto_715381 ) ) ( not ( = ?auto_715377 ?auto_715382 ) ) ( not ( = ?auto_715377 ?auto_715383 ) ) ( not ( = ?auto_715377 ?auto_715384 ) ) ( not ( = ?auto_715377 ?auto_715385 ) ) ( not ( = ?auto_715377 ?auto_715386 ) ) ( not ( = ?auto_715378 ?auto_715379 ) ) ( not ( = ?auto_715378 ?auto_715380 ) ) ( not ( = ?auto_715378 ?auto_715381 ) ) ( not ( = ?auto_715378 ?auto_715382 ) ) ( not ( = ?auto_715378 ?auto_715383 ) ) ( not ( = ?auto_715378 ?auto_715384 ) ) ( not ( = ?auto_715378 ?auto_715385 ) ) ( not ( = ?auto_715378 ?auto_715386 ) ) ( not ( = ?auto_715379 ?auto_715380 ) ) ( not ( = ?auto_715379 ?auto_715381 ) ) ( not ( = ?auto_715379 ?auto_715382 ) ) ( not ( = ?auto_715379 ?auto_715383 ) ) ( not ( = ?auto_715379 ?auto_715384 ) ) ( not ( = ?auto_715379 ?auto_715385 ) ) ( not ( = ?auto_715379 ?auto_715386 ) ) ( not ( = ?auto_715380 ?auto_715381 ) ) ( not ( = ?auto_715380 ?auto_715382 ) ) ( not ( = ?auto_715380 ?auto_715383 ) ) ( not ( = ?auto_715380 ?auto_715384 ) ) ( not ( = ?auto_715380 ?auto_715385 ) ) ( not ( = ?auto_715380 ?auto_715386 ) ) ( not ( = ?auto_715381 ?auto_715382 ) ) ( not ( = ?auto_715381 ?auto_715383 ) ) ( not ( = ?auto_715381 ?auto_715384 ) ) ( not ( = ?auto_715381 ?auto_715385 ) ) ( not ( = ?auto_715381 ?auto_715386 ) ) ( not ( = ?auto_715382 ?auto_715383 ) ) ( not ( = ?auto_715382 ?auto_715384 ) ) ( not ( = ?auto_715382 ?auto_715385 ) ) ( not ( = ?auto_715382 ?auto_715386 ) ) ( not ( = ?auto_715383 ?auto_715384 ) ) ( not ( = ?auto_715383 ?auto_715385 ) ) ( not ( = ?auto_715383 ?auto_715386 ) ) ( not ( = ?auto_715384 ?auto_715385 ) ) ( not ( = ?auto_715384 ?auto_715386 ) ) ( not ( = ?auto_715385 ?auto_715386 ) ) ( ON ?auto_715384 ?auto_715385 ) ( ON ?auto_715383 ?auto_715384 ) ( ON ?auto_715382 ?auto_715383 ) ( ON ?auto_715381 ?auto_715382 ) ( CLEAR ?auto_715379 ) ( ON ?auto_715380 ?auto_715381 ) ( CLEAR ?auto_715380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_715370 ?auto_715371 ?auto_715372 ?auto_715373 ?auto_715374 ?auto_715375 ?auto_715376 ?auto_715377 ?auto_715378 ?auto_715379 ?auto_715380 )
      ( MAKE-16PILE ?auto_715370 ?auto_715371 ?auto_715372 ?auto_715373 ?auto_715374 ?auto_715375 ?auto_715376 ?auto_715377 ?auto_715378 ?auto_715379 ?auto_715380 ?auto_715381 ?auto_715382 ?auto_715383 ?auto_715384 ?auto_715385 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715436 - BLOCK
      ?auto_715437 - BLOCK
      ?auto_715438 - BLOCK
      ?auto_715439 - BLOCK
      ?auto_715440 - BLOCK
      ?auto_715441 - BLOCK
      ?auto_715442 - BLOCK
      ?auto_715443 - BLOCK
      ?auto_715444 - BLOCK
      ?auto_715445 - BLOCK
      ?auto_715446 - BLOCK
      ?auto_715447 - BLOCK
      ?auto_715448 - BLOCK
      ?auto_715449 - BLOCK
      ?auto_715450 - BLOCK
      ?auto_715451 - BLOCK
    )
    :vars
    (
      ?auto_715452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715451 ?auto_715452 ) ( ON-TABLE ?auto_715436 ) ( ON ?auto_715437 ?auto_715436 ) ( ON ?auto_715438 ?auto_715437 ) ( ON ?auto_715439 ?auto_715438 ) ( ON ?auto_715440 ?auto_715439 ) ( ON ?auto_715441 ?auto_715440 ) ( ON ?auto_715442 ?auto_715441 ) ( ON ?auto_715443 ?auto_715442 ) ( ON ?auto_715444 ?auto_715443 ) ( not ( = ?auto_715436 ?auto_715437 ) ) ( not ( = ?auto_715436 ?auto_715438 ) ) ( not ( = ?auto_715436 ?auto_715439 ) ) ( not ( = ?auto_715436 ?auto_715440 ) ) ( not ( = ?auto_715436 ?auto_715441 ) ) ( not ( = ?auto_715436 ?auto_715442 ) ) ( not ( = ?auto_715436 ?auto_715443 ) ) ( not ( = ?auto_715436 ?auto_715444 ) ) ( not ( = ?auto_715436 ?auto_715445 ) ) ( not ( = ?auto_715436 ?auto_715446 ) ) ( not ( = ?auto_715436 ?auto_715447 ) ) ( not ( = ?auto_715436 ?auto_715448 ) ) ( not ( = ?auto_715436 ?auto_715449 ) ) ( not ( = ?auto_715436 ?auto_715450 ) ) ( not ( = ?auto_715436 ?auto_715451 ) ) ( not ( = ?auto_715436 ?auto_715452 ) ) ( not ( = ?auto_715437 ?auto_715438 ) ) ( not ( = ?auto_715437 ?auto_715439 ) ) ( not ( = ?auto_715437 ?auto_715440 ) ) ( not ( = ?auto_715437 ?auto_715441 ) ) ( not ( = ?auto_715437 ?auto_715442 ) ) ( not ( = ?auto_715437 ?auto_715443 ) ) ( not ( = ?auto_715437 ?auto_715444 ) ) ( not ( = ?auto_715437 ?auto_715445 ) ) ( not ( = ?auto_715437 ?auto_715446 ) ) ( not ( = ?auto_715437 ?auto_715447 ) ) ( not ( = ?auto_715437 ?auto_715448 ) ) ( not ( = ?auto_715437 ?auto_715449 ) ) ( not ( = ?auto_715437 ?auto_715450 ) ) ( not ( = ?auto_715437 ?auto_715451 ) ) ( not ( = ?auto_715437 ?auto_715452 ) ) ( not ( = ?auto_715438 ?auto_715439 ) ) ( not ( = ?auto_715438 ?auto_715440 ) ) ( not ( = ?auto_715438 ?auto_715441 ) ) ( not ( = ?auto_715438 ?auto_715442 ) ) ( not ( = ?auto_715438 ?auto_715443 ) ) ( not ( = ?auto_715438 ?auto_715444 ) ) ( not ( = ?auto_715438 ?auto_715445 ) ) ( not ( = ?auto_715438 ?auto_715446 ) ) ( not ( = ?auto_715438 ?auto_715447 ) ) ( not ( = ?auto_715438 ?auto_715448 ) ) ( not ( = ?auto_715438 ?auto_715449 ) ) ( not ( = ?auto_715438 ?auto_715450 ) ) ( not ( = ?auto_715438 ?auto_715451 ) ) ( not ( = ?auto_715438 ?auto_715452 ) ) ( not ( = ?auto_715439 ?auto_715440 ) ) ( not ( = ?auto_715439 ?auto_715441 ) ) ( not ( = ?auto_715439 ?auto_715442 ) ) ( not ( = ?auto_715439 ?auto_715443 ) ) ( not ( = ?auto_715439 ?auto_715444 ) ) ( not ( = ?auto_715439 ?auto_715445 ) ) ( not ( = ?auto_715439 ?auto_715446 ) ) ( not ( = ?auto_715439 ?auto_715447 ) ) ( not ( = ?auto_715439 ?auto_715448 ) ) ( not ( = ?auto_715439 ?auto_715449 ) ) ( not ( = ?auto_715439 ?auto_715450 ) ) ( not ( = ?auto_715439 ?auto_715451 ) ) ( not ( = ?auto_715439 ?auto_715452 ) ) ( not ( = ?auto_715440 ?auto_715441 ) ) ( not ( = ?auto_715440 ?auto_715442 ) ) ( not ( = ?auto_715440 ?auto_715443 ) ) ( not ( = ?auto_715440 ?auto_715444 ) ) ( not ( = ?auto_715440 ?auto_715445 ) ) ( not ( = ?auto_715440 ?auto_715446 ) ) ( not ( = ?auto_715440 ?auto_715447 ) ) ( not ( = ?auto_715440 ?auto_715448 ) ) ( not ( = ?auto_715440 ?auto_715449 ) ) ( not ( = ?auto_715440 ?auto_715450 ) ) ( not ( = ?auto_715440 ?auto_715451 ) ) ( not ( = ?auto_715440 ?auto_715452 ) ) ( not ( = ?auto_715441 ?auto_715442 ) ) ( not ( = ?auto_715441 ?auto_715443 ) ) ( not ( = ?auto_715441 ?auto_715444 ) ) ( not ( = ?auto_715441 ?auto_715445 ) ) ( not ( = ?auto_715441 ?auto_715446 ) ) ( not ( = ?auto_715441 ?auto_715447 ) ) ( not ( = ?auto_715441 ?auto_715448 ) ) ( not ( = ?auto_715441 ?auto_715449 ) ) ( not ( = ?auto_715441 ?auto_715450 ) ) ( not ( = ?auto_715441 ?auto_715451 ) ) ( not ( = ?auto_715441 ?auto_715452 ) ) ( not ( = ?auto_715442 ?auto_715443 ) ) ( not ( = ?auto_715442 ?auto_715444 ) ) ( not ( = ?auto_715442 ?auto_715445 ) ) ( not ( = ?auto_715442 ?auto_715446 ) ) ( not ( = ?auto_715442 ?auto_715447 ) ) ( not ( = ?auto_715442 ?auto_715448 ) ) ( not ( = ?auto_715442 ?auto_715449 ) ) ( not ( = ?auto_715442 ?auto_715450 ) ) ( not ( = ?auto_715442 ?auto_715451 ) ) ( not ( = ?auto_715442 ?auto_715452 ) ) ( not ( = ?auto_715443 ?auto_715444 ) ) ( not ( = ?auto_715443 ?auto_715445 ) ) ( not ( = ?auto_715443 ?auto_715446 ) ) ( not ( = ?auto_715443 ?auto_715447 ) ) ( not ( = ?auto_715443 ?auto_715448 ) ) ( not ( = ?auto_715443 ?auto_715449 ) ) ( not ( = ?auto_715443 ?auto_715450 ) ) ( not ( = ?auto_715443 ?auto_715451 ) ) ( not ( = ?auto_715443 ?auto_715452 ) ) ( not ( = ?auto_715444 ?auto_715445 ) ) ( not ( = ?auto_715444 ?auto_715446 ) ) ( not ( = ?auto_715444 ?auto_715447 ) ) ( not ( = ?auto_715444 ?auto_715448 ) ) ( not ( = ?auto_715444 ?auto_715449 ) ) ( not ( = ?auto_715444 ?auto_715450 ) ) ( not ( = ?auto_715444 ?auto_715451 ) ) ( not ( = ?auto_715444 ?auto_715452 ) ) ( not ( = ?auto_715445 ?auto_715446 ) ) ( not ( = ?auto_715445 ?auto_715447 ) ) ( not ( = ?auto_715445 ?auto_715448 ) ) ( not ( = ?auto_715445 ?auto_715449 ) ) ( not ( = ?auto_715445 ?auto_715450 ) ) ( not ( = ?auto_715445 ?auto_715451 ) ) ( not ( = ?auto_715445 ?auto_715452 ) ) ( not ( = ?auto_715446 ?auto_715447 ) ) ( not ( = ?auto_715446 ?auto_715448 ) ) ( not ( = ?auto_715446 ?auto_715449 ) ) ( not ( = ?auto_715446 ?auto_715450 ) ) ( not ( = ?auto_715446 ?auto_715451 ) ) ( not ( = ?auto_715446 ?auto_715452 ) ) ( not ( = ?auto_715447 ?auto_715448 ) ) ( not ( = ?auto_715447 ?auto_715449 ) ) ( not ( = ?auto_715447 ?auto_715450 ) ) ( not ( = ?auto_715447 ?auto_715451 ) ) ( not ( = ?auto_715447 ?auto_715452 ) ) ( not ( = ?auto_715448 ?auto_715449 ) ) ( not ( = ?auto_715448 ?auto_715450 ) ) ( not ( = ?auto_715448 ?auto_715451 ) ) ( not ( = ?auto_715448 ?auto_715452 ) ) ( not ( = ?auto_715449 ?auto_715450 ) ) ( not ( = ?auto_715449 ?auto_715451 ) ) ( not ( = ?auto_715449 ?auto_715452 ) ) ( not ( = ?auto_715450 ?auto_715451 ) ) ( not ( = ?auto_715450 ?auto_715452 ) ) ( not ( = ?auto_715451 ?auto_715452 ) ) ( ON ?auto_715450 ?auto_715451 ) ( ON ?auto_715449 ?auto_715450 ) ( ON ?auto_715448 ?auto_715449 ) ( ON ?auto_715447 ?auto_715448 ) ( ON ?auto_715446 ?auto_715447 ) ( CLEAR ?auto_715444 ) ( ON ?auto_715445 ?auto_715446 ) ( CLEAR ?auto_715445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_715436 ?auto_715437 ?auto_715438 ?auto_715439 ?auto_715440 ?auto_715441 ?auto_715442 ?auto_715443 ?auto_715444 ?auto_715445 )
      ( MAKE-16PILE ?auto_715436 ?auto_715437 ?auto_715438 ?auto_715439 ?auto_715440 ?auto_715441 ?auto_715442 ?auto_715443 ?auto_715444 ?auto_715445 ?auto_715446 ?auto_715447 ?auto_715448 ?auto_715449 ?auto_715450 ?auto_715451 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715502 - BLOCK
      ?auto_715503 - BLOCK
      ?auto_715504 - BLOCK
      ?auto_715505 - BLOCK
      ?auto_715506 - BLOCK
      ?auto_715507 - BLOCK
      ?auto_715508 - BLOCK
      ?auto_715509 - BLOCK
      ?auto_715510 - BLOCK
      ?auto_715511 - BLOCK
      ?auto_715512 - BLOCK
      ?auto_715513 - BLOCK
      ?auto_715514 - BLOCK
      ?auto_715515 - BLOCK
      ?auto_715516 - BLOCK
      ?auto_715517 - BLOCK
    )
    :vars
    (
      ?auto_715518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715517 ?auto_715518 ) ( ON-TABLE ?auto_715502 ) ( ON ?auto_715503 ?auto_715502 ) ( ON ?auto_715504 ?auto_715503 ) ( ON ?auto_715505 ?auto_715504 ) ( ON ?auto_715506 ?auto_715505 ) ( ON ?auto_715507 ?auto_715506 ) ( ON ?auto_715508 ?auto_715507 ) ( ON ?auto_715509 ?auto_715508 ) ( not ( = ?auto_715502 ?auto_715503 ) ) ( not ( = ?auto_715502 ?auto_715504 ) ) ( not ( = ?auto_715502 ?auto_715505 ) ) ( not ( = ?auto_715502 ?auto_715506 ) ) ( not ( = ?auto_715502 ?auto_715507 ) ) ( not ( = ?auto_715502 ?auto_715508 ) ) ( not ( = ?auto_715502 ?auto_715509 ) ) ( not ( = ?auto_715502 ?auto_715510 ) ) ( not ( = ?auto_715502 ?auto_715511 ) ) ( not ( = ?auto_715502 ?auto_715512 ) ) ( not ( = ?auto_715502 ?auto_715513 ) ) ( not ( = ?auto_715502 ?auto_715514 ) ) ( not ( = ?auto_715502 ?auto_715515 ) ) ( not ( = ?auto_715502 ?auto_715516 ) ) ( not ( = ?auto_715502 ?auto_715517 ) ) ( not ( = ?auto_715502 ?auto_715518 ) ) ( not ( = ?auto_715503 ?auto_715504 ) ) ( not ( = ?auto_715503 ?auto_715505 ) ) ( not ( = ?auto_715503 ?auto_715506 ) ) ( not ( = ?auto_715503 ?auto_715507 ) ) ( not ( = ?auto_715503 ?auto_715508 ) ) ( not ( = ?auto_715503 ?auto_715509 ) ) ( not ( = ?auto_715503 ?auto_715510 ) ) ( not ( = ?auto_715503 ?auto_715511 ) ) ( not ( = ?auto_715503 ?auto_715512 ) ) ( not ( = ?auto_715503 ?auto_715513 ) ) ( not ( = ?auto_715503 ?auto_715514 ) ) ( not ( = ?auto_715503 ?auto_715515 ) ) ( not ( = ?auto_715503 ?auto_715516 ) ) ( not ( = ?auto_715503 ?auto_715517 ) ) ( not ( = ?auto_715503 ?auto_715518 ) ) ( not ( = ?auto_715504 ?auto_715505 ) ) ( not ( = ?auto_715504 ?auto_715506 ) ) ( not ( = ?auto_715504 ?auto_715507 ) ) ( not ( = ?auto_715504 ?auto_715508 ) ) ( not ( = ?auto_715504 ?auto_715509 ) ) ( not ( = ?auto_715504 ?auto_715510 ) ) ( not ( = ?auto_715504 ?auto_715511 ) ) ( not ( = ?auto_715504 ?auto_715512 ) ) ( not ( = ?auto_715504 ?auto_715513 ) ) ( not ( = ?auto_715504 ?auto_715514 ) ) ( not ( = ?auto_715504 ?auto_715515 ) ) ( not ( = ?auto_715504 ?auto_715516 ) ) ( not ( = ?auto_715504 ?auto_715517 ) ) ( not ( = ?auto_715504 ?auto_715518 ) ) ( not ( = ?auto_715505 ?auto_715506 ) ) ( not ( = ?auto_715505 ?auto_715507 ) ) ( not ( = ?auto_715505 ?auto_715508 ) ) ( not ( = ?auto_715505 ?auto_715509 ) ) ( not ( = ?auto_715505 ?auto_715510 ) ) ( not ( = ?auto_715505 ?auto_715511 ) ) ( not ( = ?auto_715505 ?auto_715512 ) ) ( not ( = ?auto_715505 ?auto_715513 ) ) ( not ( = ?auto_715505 ?auto_715514 ) ) ( not ( = ?auto_715505 ?auto_715515 ) ) ( not ( = ?auto_715505 ?auto_715516 ) ) ( not ( = ?auto_715505 ?auto_715517 ) ) ( not ( = ?auto_715505 ?auto_715518 ) ) ( not ( = ?auto_715506 ?auto_715507 ) ) ( not ( = ?auto_715506 ?auto_715508 ) ) ( not ( = ?auto_715506 ?auto_715509 ) ) ( not ( = ?auto_715506 ?auto_715510 ) ) ( not ( = ?auto_715506 ?auto_715511 ) ) ( not ( = ?auto_715506 ?auto_715512 ) ) ( not ( = ?auto_715506 ?auto_715513 ) ) ( not ( = ?auto_715506 ?auto_715514 ) ) ( not ( = ?auto_715506 ?auto_715515 ) ) ( not ( = ?auto_715506 ?auto_715516 ) ) ( not ( = ?auto_715506 ?auto_715517 ) ) ( not ( = ?auto_715506 ?auto_715518 ) ) ( not ( = ?auto_715507 ?auto_715508 ) ) ( not ( = ?auto_715507 ?auto_715509 ) ) ( not ( = ?auto_715507 ?auto_715510 ) ) ( not ( = ?auto_715507 ?auto_715511 ) ) ( not ( = ?auto_715507 ?auto_715512 ) ) ( not ( = ?auto_715507 ?auto_715513 ) ) ( not ( = ?auto_715507 ?auto_715514 ) ) ( not ( = ?auto_715507 ?auto_715515 ) ) ( not ( = ?auto_715507 ?auto_715516 ) ) ( not ( = ?auto_715507 ?auto_715517 ) ) ( not ( = ?auto_715507 ?auto_715518 ) ) ( not ( = ?auto_715508 ?auto_715509 ) ) ( not ( = ?auto_715508 ?auto_715510 ) ) ( not ( = ?auto_715508 ?auto_715511 ) ) ( not ( = ?auto_715508 ?auto_715512 ) ) ( not ( = ?auto_715508 ?auto_715513 ) ) ( not ( = ?auto_715508 ?auto_715514 ) ) ( not ( = ?auto_715508 ?auto_715515 ) ) ( not ( = ?auto_715508 ?auto_715516 ) ) ( not ( = ?auto_715508 ?auto_715517 ) ) ( not ( = ?auto_715508 ?auto_715518 ) ) ( not ( = ?auto_715509 ?auto_715510 ) ) ( not ( = ?auto_715509 ?auto_715511 ) ) ( not ( = ?auto_715509 ?auto_715512 ) ) ( not ( = ?auto_715509 ?auto_715513 ) ) ( not ( = ?auto_715509 ?auto_715514 ) ) ( not ( = ?auto_715509 ?auto_715515 ) ) ( not ( = ?auto_715509 ?auto_715516 ) ) ( not ( = ?auto_715509 ?auto_715517 ) ) ( not ( = ?auto_715509 ?auto_715518 ) ) ( not ( = ?auto_715510 ?auto_715511 ) ) ( not ( = ?auto_715510 ?auto_715512 ) ) ( not ( = ?auto_715510 ?auto_715513 ) ) ( not ( = ?auto_715510 ?auto_715514 ) ) ( not ( = ?auto_715510 ?auto_715515 ) ) ( not ( = ?auto_715510 ?auto_715516 ) ) ( not ( = ?auto_715510 ?auto_715517 ) ) ( not ( = ?auto_715510 ?auto_715518 ) ) ( not ( = ?auto_715511 ?auto_715512 ) ) ( not ( = ?auto_715511 ?auto_715513 ) ) ( not ( = ?auto_715511 ?auto_715514 ) ) ( not ( = ?auto_715511 ?auto_715515 ) ) ( not ( = ?auto_715511 ?auto_715516 ) ) ( not ( = ?auto_715511 ?auto_715517 ) ) ( not ( = ?auto_715511 ?auto_715518 ) ) ( not ( = ?auto_715512 ?auto_715513 ) ) ( not ( = ?auto_715512 ?auto_715514 ) ) ( not ( = ?auto_715512 ?auto_715515 ) ) ( not ( = ?auto_715512 ?auto_715516 ) ) ( not ( = ?auto_715512 ?auto_715517 ) ) ( not ( = ?auto_715512 ?auto_715518 ) ) ( not ( = ?auto_715513 ?auto_715514 ) ) ( not ( = ?auto_715513 ?auto_715515 ) ) ( not ( = ?auto_715513 ?auto_715516 ) ) ( not ( = ?auto_715513 ?auto_715517 ) ) ( not ( = ?auto_715513 ?auto_715518 ) ) ( not ( = ?auto_715514 ?auto_715515 ) ) ( not ( = ?auto_715514 ?auto_715516 ) ) ( not ( = ?auto_715514 ?auto_715517 ) ) ( not ( = ?auto_715514 ?auto_715518 ) ) ( not ( = ?auto_715515 ?auto_715516 ) ) ( not ( = ?auto_715515 ?auto_715517 ) ) ( not ( = ?auto_715515 ?auto_715518 ) ) ( not ( = ?auto_715516 ?auto_715517 ) ) ( not ( = ?auto_715516 ?auto_715518 ) ) ( not ( = ?auto_715517 ?auto_715518 ) ) ( ON ?auto_715516 ?auto_715517 ) ( ON ?auto_715515 ?auto_715516 ) ( ON ?auto_715514 ?auto_715515 ) ( ON ?auto_715513 ?auto_715514 ) ( ON ?auto_715512 ?auto_715513 ) ( ON ?auto_715511 ?auto_715512 ) ( CLEAR ?auto_715509 ) ( ON ?auto_715510 ?auto_715511 ) ( CLEAR ?auto_715510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_715502 ?auto_715503 ?auto_715504 ?auto_715505 ?auto_715506 ?auto_715507 ?auto_715508 ?auto_715509 ?auto_715510 )
      ( MAKE-16PILE ?auto_715502 ?auto_715503 ?auto_715504 ?auto_715505 ?auto_715506 ?auto_715507 ?auto_715508 ?auto_715509 ?auto_715510 ?auto_715511 ?auto_715512 ?auto_715513 ?auto_715514 ?auto_715515 ?auto_715516 ?auto_715517 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715568 - BLOCK
      ?auto_715569 - BLOCK
      ?auto_715570 - BLOCK
      ?auto_715571 - BLOCK
      ?auto_715572 - BLOCK
      ?auto_715573 - BLOCK
      ?auto_715574 - BLOCK
      ?auto_715575 - BLOCK
      ?auto_715576 - BLOCK
      ?auto_715577 - BLOCK
      ?auto_715578 - BLOCK
      ?auto_715579 - BLOCK
      ?auto_715580 - BLOCK
      ?auto_715581 - BLOCK
      ?auto_715582 - BLOCK
      ?auto_715583 - BLOCK
    )
    :vars
    (
      ?auto_715584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715583 ?auto_715584 ) ( ON-TABLE ?auto_715568 ) ( ON ?auto_715569 ?auto_715568 ) ( ON ?auto_715570 ?auto_715569 ) ( ON ?auto_715571 ?auto_715570 ) ( ON ?auto_715572 ?auto_715571 ) ( ON ?auto_715573 ?auto_715572 ) ( ON ?auto_715574 ?auto_715573 ) ( not ( = ?auto_715568 ?auto_715569 ) ) ( not ( = ?auto_715568 ?auto_715570 ) ) ( not ( = ?auto_715568 ?auto_715571 ) ) ( not ( = ?auto_715568 ?auto_715572 ) ) ( not ( = ?auto_715568 ?auto_715573 ) ) ( not ( = ?auto_715568 ?auto_715574 ) ) ( not ( = ?auto_715568 ?auto_715575 ) ) ( not ( = ?auto_715568 ?auto_715576 ) ) ( not ( = ?auto_715568 ?auto_715577 ) ) ( not ( = ?auto_715568 ?auto_715578 ) ) ( not ( = ?auto_715568 ?auto_715579 ) ) ( not ( = ?auto_715568 ?auto_715580 ) ) ( not ( = ?auto_715568 ?auto_715581 ) ) ( not ( = ?auto_715568 ?auto_715582 ) ) ( not ( = ?auto_715568 ?auto_715583 ) ) ( not ( = ?auto_715568 ?auto_715584 ) ) ( not ( = ?auto_715569 ?auto_715570 ) ) ( not ( = ?auto_715569 ?auto_715571 ) ) ( not ( = ?auto_715569 ?auto_715572 ) ) ( not ( = ?auto_715569 ?auto_715573 ) ) ( not ( = ?auto_715569 ?auto_715574 ) ) ( not ( = ?auto_715569 ?auto_715575 ) ) ( not ( = ?auto_715569 ?auto_715576 ) ) ( not ( = ?auto_715569 ?auto_715577 ) ) ( not ( = ?auto_715569 ?auto_715578 ) ) ( not ( = ?auto_715569 ?auto_715579 ) ) ( not ( = ?auto_715569 ?auto_715580 ) ) ( not ( = ?auto_715569 ?auto_715581 ) ) ( not ( = ?auto_715569 ?auto_715582 ) ) ( not ( = ?auto_715569 ?auto_715583 ) ) ( not ( = ?auto_715569 ?auto_715584 ) ) ( not ( = ?auto_715570 ?auto_715571 ) ) ( not ( = ?auto_715570 ?auto_715572 ) ) ( not ( = ?auto_715570 ?auto_715573 ) ) ( not ( = ?auto_715570 ?auto_715574 ) ) ( not ( = ?auto_715570 ?auto_715575 ) ) ( not ( = ?auto_715570 ?auto_715576 ) ) ( not ( = ?auto_715570 ?auto_715577 ) ) ( not ( = ?auto_715570 ?auto_715578 ) ) ( not ( = ?auto_715570 ?auto_715579 ) ) ( not ( = ?auto_715570 ?auto_715580 ) ) ( not ( = ?auto_715570 ?auto_715581 ) ) ( not ( = ?auto_715570 ?auto_715582 ) ) ( not ( = ?auto_715570 ?auto_715583 ) ) ( not ( = ?auto_715570 ?auto_715584 ) ) ( not ( = ?auto_715571 ?auto_715572 ) ) ( not ( = ?auto_715571 ?auto_715573 ) ) ( not ( = ?auto_715571 ?auto_715574 ) ) ( not ( = ?auto_715571 ?auto_715575 ) ) ( not ( = ?auto_715571 ?auto_715576 ) ) ( not ( = ?auto_715571 ?auto_715577 ) ) ( not ( = ?auto_715571 ?auto_715578 ) ) ( not ( = ?auto_715571 ?auto_715579 ) ) ( not ( = ?auto_715571 ?auto_715580 ) ) ( not ( = ?auto_715571 ?auto_715581 ) ) ( not ( = ?auto_715571 ?auto_715582 ) ) ( not ( = ?auto_715571 ?auto_715583 ) ) ( not ( = ?auto_715571 ?auto_715584 ) ) ( not ( = ?auto_715572 ?auto_715573 ) ) ( not ( = ?auto_715572 ?auto_715574 ) ) ( not ( = ?auto_715572 ?auto_715575 ) ) ( not ( = ?auto_715572 ?auto_715576 ) ) ( not ( = ?auto_715572 ?auto_715577 ) ) ( not ( = ?auto_715572 ?auto_715578 ) ) ( not ( = ?auto_715572 ?auto_715579 ) ) ( not ( = ?auto_715572 ?auto_715580 ) ) ( not ( = ?auto_715572 ?auto_715581 ) ) ( not ( = ?auto_715572 ?auto_715582 ) ) ( not ( = ?auto_715572 ?auto_715583 ) ) ( not ( = ?auto_715572 ?auto_715584 ) ) ( not ( = ?auto_715573 ?auto_715574 ) ) ( not ( = ?auto_715573 ?auto_715575 ) ) ( not ( = ?auto_715573 ?auto_715576 ) ) ( not ( = ?auto_715573 ?auto_715577 ) ) ( not ( = ?auto_715573 ?auto_715578 ) ) ( not ( = ?auto_715573 ?auto_715579 ) ) ( not ( = ?auto_715573 ?auto_715580 ) ) ( not ( = ?auto_715573 ?auto_715581 ) ) ( not ( = ?auto_715573 ?auto_715582 ) ) ( not ( = ?auto_715573 ?auto_715583 ) ) ( not ( = ?auto_715573 ?auto_715584 ) ) ( not ( = ?auto_715574 ?auto_715575 ) ) ( not ( = ?auto_715574 ?auto_715576 ) ) ( not ( = ?auto_715574 ?auto_715577 ) ) ( not ( = ?auto_715574 ?auto_715578 ) ) ( not ( = ?auto_715574 ?auto_715579 ) ) ( not ( = ?auto_715574 ?auto_715580 ) ) ( not ( = ?auto_715574 ?auto_715581 ) ) ( not ( = ?auto_715574 ?auto_715582 ) ) ( not ( = ?auto_715574 ?auto_715583 ) ) ( not ( = ?auto_715574 ?auto_715584 ) ) ( not ( = ?auto_715575 ?auto_715576 ) ) ( not ( = ?auto_715575 ?auto_715577 ) ) ( not ( = ?auto_715575 ?auto_715578 ) ) ( not ( = ?auto_715575 ?auto_715579 ) ) ( not ( = ?auto_715575 ?auto_715580 ) ) ( not ( = ?auto_715575 ?auto_715581 ) ) ( not ( = ?auto_715575 ?auto_715582 ) ) ( not ( = ?auto_715575 ?auto_715583 ) ) ( not ( = ?auto_715575 ?auto_715584 ) ) ( not ( = ?auto_715576 ?auto_715577 ) ) ( not ( = ?auto_715576 ?auto_715578 ) ) ( not ( = ?auto_715576 ?auto_715579 ) ) ( not ( = ?auto_715576 ?auto_715580 ) ) ( not ( = ?auto_715576 ?auto_715581 ) ) ( not ( = ?auto_715576 ?auto_715582 ) ) ( not ( = ?auto_715576 ?auto_715583 ) ) ( not ( = ?auto_715576 ?auto_715584 ) ) ( not ( = ?auto_715577 ?auto_715578 ) ) ( not ( = ?auto_715577 ?auto_715579 ) ) ( not ( = ?auto_715577 ?auto_715580 ) ) ( not ( = ?auto_715577 ?auto_715581 ) ) ( not ( = ?auto_715577 ?auto_715582 ) ) ( not ( = ?auto_715577 ?auto_715583 ) ) ( not ( = ?auto_715577 ?auto_715584 ) ) ( not ( = ?auto_715578 ?auto_715579 ) ) ( not ( = ?auto_715578 ?auto_715580 ) ) ( not ( = ?auto_715578 ?auto_715581 ) ) ( not ( = ?auto_715578 ?auto_715582 ) ) ( not ( = ?auto_715578 ?auto_715583 ) ) ( not ( = ?auto_715578 ?auto_715584 ) ) ( not ( = ?auto_715579 ?auto_715580 ) ) ( not ( = ?auto_715579 ?auto_715581 ) ) ( not ( = ?auto_715579 ?auto_715582 ) ) ( not ( = ?auto_715579 ?auto_715583 ) ) ( not ( = ?auto_715579 ?auto_715584 ) ) ( not ( = ?auto_715580 ?auto_715581 ) ) ( not ( = ?auto_715580 ?auto_715582 ) ) ( not ( = ?auto_715580 ?auto_715583 ) ) ( not ( = ?auto_715580 ?auto_715584 ) ) ( not ( = ?auto_715581 ?auto_715582 ) ) ( not ( = ?auto_715581 ?auto_715583 ) ) ( not ( = ?auto_715581 ?auto_715584 ) ) ( not ( = ?auto_715582 ?auto_715583 ) ) ( not ( = ?auto_715582 ?auto_715584 ) ) ( not ( = ?auto_715583 ?auto_715584 ) ) ( ON ?auto_715582 ?auto_715583 ) ( ON ?auto_715581 ?auto_715582 ) ( ON ?auto_715580 ?auto_715581 ) ( ON ?auto_715579 ?auto_715580 ) ( ON ?auto_715578 ?auto_715579 ) ( ON ?auto_715577 ?auto_715578 ) ( ON ?auto_715576 ?auto_715577 ) ( CLEAR ?auto_715574 ) ( ON ?auto_715575 ?auto_715576 ) ( CLEAR ?auto_715575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_715568 ?auto_715569 ?auto_715570 ?auto_715571 ?auto_715572 ?auto_715573 ?auto_715574 ?auto_715575 )
      ( MAKE-16PILE ?auto_715568 ?auto_715569 ?auto_715570 ?auto_715571 ?auto_715572 ?auto_715573 ?auto_715574 ?auto_715575 ?auto_715576 ?auto_715577 ?auto_715578 ?auto_715579 ?auto_715580 ?auto_715581 ?auto_715582 ?auto_715583 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715634 - BLOCK
      ?auto_715635 - BLOCK
      ?auto_715636 - BLOCK
      ?auto_715637 - BLOCK
      ?auto_715638 - BLOCK
      ?auto_715639 - BLOCK
      ?auto_715640 - BLOCK
      ?auto_715641 - BLOCK
      ?auto_715642 - BLOCK
      ?auto_715643 - BLOCK
      ?auto_715644 - BLOCK
      ?auto_715645 - BLOCK
      ?auto_715646 - BLOCK
      ?auto_715647 - BLOCK
      ?auto_715648 - BLOCK
      ?auto_715649 - BLOCK
    )
    :vars
    (
      ?auto_715650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715649 ?auto_715650 ) ( ON-TABLE ?auto_715634 ) ( ON ?auto_715635 ?auto_715634 ) ( ON ?auto_715636 ?auto_715635 ) ( ON ?auto_715637 ?auto_715636 ) ( ON ?auto_715638 ?auto_715637 ) ( ON ?auto_715639 ?auto_715638 ) ( not ( = ?auto_715634 ?auto_715635 ) ) ( not ( = ?auto_715634 ?auto_715636 ) ) ( not ( = ?auto_715634 ?auto_715637 ) ) ( not ( = ?auto_715634 ?auto_715638 ) ) ( not ( = ?auto_715634 ?auto_715639 ) ) ( not ( = ?auto_715634 ?auto_715640 ) ) ( not ( = ?auto_715634 ?auto_715641 ) ) ( not ( = ?auto_715634 ?auto_715642 ) ) ( not ( = ?auto_715634 ?auto_715643 ) ) ( not ( = ?auto_715634 ?auto_715644 ) ) ( not ( = ?auto_715634 ?auto_715645 ) ) ( not ( = ?auto_715634 ?auto_715646 ) ) ( not ( = ?auto_715634 ?auto_715647 ) ) ( not ( = ?auto_715634 ?auto_715648 ) ) ( not ( = ?auto_715634 ?auto_715649 ) ) ( not ( = ?auto_715634 ?auto_715650 ) ) ( not ( = ?auto_715635 ?auto_715636 ) ) ( not ( = ?auto_715635 ?auto_715637 ) ) ( not ( = ?auto_715635 ?auto_715638 ) ) ( not ( = ?auto_715635 ?auto_715639 ) ) ( not ( = ?auto_715635 ?auto_715640 ) ) ( not ( = ?auto_715635 ?auto_715641 ) ) ( not ( = ?auto_715635 ?auto_715642 ) ) ( not ( = ?auto_715635 ?auto_715643 ) ) ( not ( = ?auto_715635 ?auto_715644 ) ) ( not ( = ?auto_715635 ?auto_715645 ) ) ( not ( = ?auto_715635 ?auto_715646 ) ) ( not ( = ?auto_715635 ?auto_715647 ) ) ( not ( = ?auto_715635 ?auto_715648 ) ) ( not ( = ?auto_715635 ?auto_715649 ) ) ( not ( = ?auto_715635 ?auto_715650 ) ) ( not ( = ?auto_715636 ?auto_715637 ) ) ( not ( = ?auto_715636 ?auto_715638 ) ) ( not ( = ?auto_715636 ?auto_715639 ) ) ( not ( = ?auto_715636 ?auto_715640 ) ) ( not ( = ?auto_715636 ?auto_715641 ) ) ( not ( = ?auto_715636 ?auto_715642 ) ) ( not ( = ?auto_715636 ?auto_715643 ) ) ( not ( = ?auto_715636 ?auto_715644 ) ) ( not ( = ?auto_715636 ?auto_715645 ) ) ( not ( = ?auto_715636 ?auto_715646 ) ) ( not ( = ?auto_715636 ?auto_715647 ) ) ( not ( = ?auto_715636 ?auto_715648 ) ) ( not ( = ?auto_715636 ?auto_715649 ) ) ( not ( = ?auto_715636 ?auto_715650 ) ) ( not ( = ?auto_715637 ?auto_715638 ) ) ( not ( = ?auto_715637 ?auto_715639 ) ) ( not ( = ?auto_715637 ?auto_715640 ) ) ( not ( = ?auto_715637 ?auto_715641 ) ) ( not ( = ?auto_715637 ?auto_715642 ) ) ( not ( = ?auto_715637 ?auto_715643 ) ) ( not ( = ?auto_715637 ?auto_715644 ) ) ( not ( = ?auto_715637 ?auto_715645 ) ) ( not ( = ?auto_715637 ?auto_715646 ) ) ( not ( = ?auto_715637 ?auto_715647 ) ) ( not ( = ?auto_715637 ?auto_715648 ) ) ( not ( = ?auto_715637 ?auto_715649 ) ) ( not ( = ?auto_715637 ?auto_715650 ) ) ( not ( = ?auto_715638 ?auto_715639 ) ) ( not ( = ?auto_715638 ?auto_715640 ) ) ( not ( = ?auto_715638 ?auto_715641 ) ) ( not ( = ?auto_715638 ?auto_715642 ) ) ( not ( = ?auto_715638 ?auto_715643 ) ) ( not ( = ?auto_715638 ?auto_715644 ) ) ( not ( = ?auto_715638 ?auto_715645 ) ) ( not ( = ?auto_715638 ?auto_715646 ) ) ( not ( = ?auto_715638 ?auto_715647 ) ) ( not ( = ?auto_715638 ?auto_715648 ) ) ( not ( = ?auto_715638 ?auto_715649 ) ) ( not ( = ?auto_715638 ?auto_715650 ) ) ( not ( = ?auto_715639 ?auto_715640 ) ) ( not ( = ?auto_715639 ?auto_715641 ) ) ( not ( = ?auto_715639 ?auto_715642 ) ) ( not ( = ?auto_715639 ?auto_715643 ) ) ( not ( = ?auto_715639 ?auto_715644 ) ) ( not ( = ?auto_715639 ?auto_715645 ) ) ( not ( = ?auto_715639 ?auto_715646 ) ) ( not ( = ?auto_715639 ?auto_715647 ) ) ( not ( = ?auto_715639 ?auto_715648 ) ) ( not ( = ?auto_715639 ?auto_715649 ) ) ( not ( = ?auto_715639 ?auto_715650 ) ) ( not ( = ?auto_715640 ?auto_715641 ) ) ( not ( = ?auto_715640 ?auto_715642 ) ) ( not ( = ?auto_715640 ?auto_715643 ) ) ( not ( = ?auto_715640 ?auto_715644 ) ) ( not ( = ?auto_715640 ?auto_715645 ) ) ( not ( = ?auto_715640 ?auto_715646 ) ) ( not ( = ?auto_715640 ?auto_715647 ) ) ( not ( = ?auto_715640 ?auto_715648 ) ) ( not ( = ?auto_715640 ?auto_715649 ) ) ( not ( = ?auto_715640 ?auto_715650 ) ) ( not ( = ?auto_715641 ?auto_715642 ) ) ( not ( = ?auto_715641 ?auto_715643 ) ) ( not ( = ?auto_715641 ?auto_715644 ) ) ( not ( = ?auto_715641 ?auto_715645 ) ) ( not ( = ?auto_715641 ?auto_715646 ) ) ( not ( = ?auto_715641 ?auto_715647 ) ) ( not ( = ?auto_715641 ?auto_715648 ) ) ( not ( = ?auto_715641 ?auto_715649 ) ) ( not ( = ?auto_715641 ?auto_715650 ) ) ( not ( = ?auto_715642 ?auto_715643 ) ) ( not ( = ?auto_715642 ?auto_715644 ) ) ( not ( = ?auto_715642 ?auto_715645 ) ) ( not ( = ?auto_715642 ?auto_715646 ) ) ( not ( = ?auto_715642 ?auto_715647 ) ) ( not ( = ?auto_715642 ?auto_715648 ) ) ( not ( = ?auto_715642 ?auto_715649 ) ) ( not ( = ?auto_715642 ?auto_715650 ) ) ( not ( = ?auto_715643 ?auto_715644 ) ) ( not ( = ?auto_715643 ?auto_715645 ) ) ( not ( = ?auto_715643 ?auto_715646 ) ) ( not ( = ?auto_715643 ?auto_715647 ) ) ( not ( = ?auto_715643 ?auto_715648 ) ) ( not ( = ?auto_715643 ?auto_715649 ) ) ( not ( = ?auto_715643 ?auto_715650 ) ) ( not ( = ?auto_715644 ?auto_715645 ) ) ( not ( = ?auto_715644 ?auto_715646 ) ) ( not ( = ?auto_715644 ?auto_715647 ) ) ( not ( = ?auto_715644 ?auto_715648 ) ) ( not ( = ?auto_715644 ?auto_715649 ) ) ( not ( = ?auto_715644 ?auto_715650 ) ) ( not ( = ?auto_715645 ?auto_715646 ) ) ( not ( = ?auto_715645 ?auto_715647 ) ) ( not ( = ?auto_715645 ?auto_715648 ) ) ( not ( = ?auto_715645 ?auto_715649 ) ) ( not ( = ?auto_715645 ?auto_715650 ) ) ( not ( = ?auto_715646 ?auto_715647 ) ) ( not ( = ?auto_715646 ?auto_715648 ) ) ( not ( = ?auto_715646 ?auto_715649 ) ) ( not ( = ?auto_715646 ?auto_715650 ) ) ( not ( = ?auto_715647 ?auto_715648 ) ) ( not ( = ?auto_715647 ?auto_715649 ) ) ( not ( = ?auto_715647 ?auto_715650 ) ) ( not ( = ?auto_715648 ?auto_715649 ) ) ( not ( = ?auto_715648 ?auto_715650 ) ) ( not ( = ?auto_715649 ?auto_715650 ) ) ( ON ?auto_715648 ?auto_715649 ) ( ON ?auto_715647 ?auto_715648 ) ( ON ?auto_715646 ?auto_715647 ) ( ON ?auto_715645 ?auto_715646 ) ( ON ?auto_715644 ?auto_715645 ) ( ON ?auto_715643 ?auto_715644 ) ( ON ?auto_715642 ?auto_715643 ) ( ON ?auto_715641 ?auto_715642 ) ( CLEAR ?auto_715639 ) ( ON ?auto_715640 ?auto_715641 ) ( CLEAR ?auto_715640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_715634 ?auto_715635 ?auto_715636 ?auto_715637 ?auto_715638 ?auto_715639 ?auto_715640 )
      ( MAKE-16PILE ?auto_715634 ?auto_715635 ?auto_715636 ?auto_715637 ?auto_715638 ?auto_715639 ?auto_715640 ?auto_715641 ?auto_715642 ?auto_715643 ?auto_715644 ?auto_715645 ?auto_715646 ?auto_715647 ?auto_715648 ?auto_715649 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715700 - BLOCK
      ?auto_715701 - BLOCK
      ?auto_715702 - BLOCK
      ?auto_715703 - BLOCK
      ?auto_715704 - BLOCK
      ?auto_715705 - BLOCK
      ?auto_715706 - BLOCK
      ?auto_715707 - BLOCK
      ?auto_715708 - BLOCK
      ?auto_715709 - BLOCK
      ?auto_715710 - BLOCK
      ?auto_715711 - BLOCK
      ?auto_715712 - BLOCK
      ?auto_715713 - BLOCK
      ?auto_715714 - BLOCK
      ?auto_715715 - BLOCK
    )
    :vars
    (
      ?auto_715716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715715 ?auto_715716 ) ( ON-TABLE ?auto_715700 ) ( ON ?auto_715701 ?auto_715700 ) ( ON ?auto_715702 ?auto_715701 ) ( ON ?auto_715703 ?auto_715702 ) ( ON ?auto_715704 ?auto_715703 ) ( not ( = ?auto_715700 ?auto_715701 ) ) ( not ( = ?auto_715700 ?auto_715702 ) ) ( not ( = ?auto_715700 ?auto_715703 ) ) ( not ( = ?auto_715700 ?auto_715704 ) ) ( not ( = ?auto_715700 ?auto_715705 ) ) ( not ( = ?auto_715700 ?auto_715706 ) ) ( not ( = ?auto_715700 ?auto_715707 ) ) ( not ( = ?auto_715700 ?auto_715708 ) ) ( not ( = ?auto_715700 ?auto_715709 ) ) ( not ( = ?auto_715700 ?auto_715710 ) ) ( not ( = ?auto_715700 ?auto_715711 ) ) ( not ( = ?auto_715700 ?auto_715712 ) ) ( not ( = ?auto_715700 ?auto_715713 ) ) ( not ( = ?auto_715700 ?auto_715714 ) ) ( not ( = ?auto_715700 ?auto_715715 ) ) ( not ( = ?auto_715700 ?auto_715716 ) ) ( not ( = ?auto_715701 ?auto_715702 ) ) ( not ( = ?auto_715701 ?auto_715703 ) ) ( not ( = ?auto_715701 ?auto_715704 ) ) ( not ( = ?auto_715701 ?auto_715705 ) ) ( not ( = ?auto_715701 ?auto_715706 ) ) ( not ( = ?auto_715701 ?auto_715707 ) ) ( not ( = ?auto_715701 ?auto_715708 ) ) ( not ( = ?auto_715701 ?auto_715709 ) ) ( not ( = ?auto_715701 ?auto_715710 ) ) ( not ( = ?auto_715701 ?auto_715711 ) ) ( not ( = ?auto_715701 ?auto_715712 ) ) ( not ( = ?auto_715701 ?auto_715713 ) ) ( not ( = ?auto_715701 ?auto_715714 ) ) ( not ( = ?auto_715701 ?auto_715715 ) ) ( not ( = ?auto_715701 ?auto_715716 ) ) ( not ( = ?auto_715702 ?auto_715703 ) ) ( not ( = ?auto_715702 ?auto_715704 ) ) ( not ( = ?auto_715702 ?auto_715705 ) ) ( not ( = ?auto_715702 ?auto_715706 ) ) ( not ( = ?auto_715702 ?auto_715707 ) ) ( not ( = ?auto_715702 ?auto_715708 ) ) ( not ( = ?auto_715702 ?auto_715709 ) ) ( not ( = ?auto_715702 ?auto_715710 ) ) ( not ( = ?auto_715702 ?auto_715711 ) ) ( not ( = ?auto_715702 ?auto_715712 ) ) ( not ( = ?auto_715702 ?auto_715713 ) ) ( not ( = ?auto_715702 ?auto_715714 ) ) ( not ( = ?auto_715702 ?auto_715715 ) ) ( not ( = ?auto_715702 ?auto_715716 ) ) ( not ( = ?auto_715703 ?auto_715704 ) ) ( not ( = ?auto_715703 ?auto_715705 ) ) ( not ( = ?auto_715703 ?auto_715706 ) ) ( not ( = ?auto_715703 ?auto_715707 ) ) ( not ( = ?auto_715703 ?auto_715708 ) ) ( not ( = ?auto_715703 ?auto_715709 ) ) ( not ( = ?auto_715703 ?auto_715710 ) ) ( not ( = ?auto_715703 ?auto_715711 ) ) ( not ( = ?auto_715703 ?auto_715712 ) ) ( not ( = ?auto_715703 ?auto_715713 ) ) ( not ( = ?auto_715703 ?auto_715714 ) ) ( not ( = ?auto_715703 ?auto_715715 ) ) ( not ( = ?auto_715703 ?auto_715716 ) ) ( not ( = ?auto_715704 ?auto_715705 ) ) ( not ( = ?auto_715704 ?auto_715706 ) ) ( not ( = ?auto_715704 ?auto_715707 ) ) ( not ( = ?auto_715704 ?auto_715708 ) ) ( not ( = ?auto_715704 ?auto_715709 ) ) ( not ( = ?auto_715704 ?auto_715710 ) ) ( not ( = ?auto_715704 ?auto_715711 ) ) ( not ( = ?auto_715704 ?auto_715712 ) ) ( not ( = ?auto_715704 ?auto_715713 ) ) ( not ( = ?auto_715704 ?auto_715714 ) ) ( not ( = ?auto_715704 ?auto_715715 ) ) ( not ( = ?auto_715704 ?auto_715716 ) ) ( not ( = ?auto_715705 ?auto_715706 ) ) ( not ( = ?auto_715705 ?auto_715707 ) ) ( not ( = ?auto_715705 ?auto_715708 ) ) ( not ( = ?auto_715705 ?auto_715709 ) ) ( not ( = ?auto_715705 ?auto_715710 ) ) ( not ( = ?auto_715705 ?auto_715711 ) ) ( not ( = ?auto_715705 ?auto_715712 ) ) ( not ( = ?auto_715705 ?auto_715713 ) ) ( not ( = ?auto_715705 ?auto_715714 ) ) ( not ( = ?auto_715705 ?auto_715715 ) ) ( not ( = ?auto_715705 ?auto_715716 ) ) ( not ( = ?auto_715706 ?auto_715707 ) ) ( not ( = ?auto_715706 ?auto_715708 ) ) ( not ( = ?auto_715706 ?auto_715709 ) ) ( not ( = ?auto_715706 ?auto_715710 ) ) ( not ( = ?auto_715706 ?auto_715711 ) ) ( not ( = ?auto_715706 ?auto_715712 ) ) ( not ( = ?auto_715706 ?auto_715713 ) ) ( not ( = ?auto_715706 ?auto_715714 ) ) ( not ( = ?auto_715706 ?auto_715715 ) ) ( not ( = ?auto_715706 ?auto_715716 ) ) ( not ( = ?auto_715707 ?auto_715708 ) ) ( not ( = ?auto_715707 ?auto_715709 ) ) ( not ( = ?auto_715707 ?auto_715710 ) ) ( not ( = ?auto_715707 ?auto_715711 ) ) ( not ( = ?auto_715707 ?auto_715712 ) ) ( not ( = ?auto_715707 ?auto_715713 ) ) ( not ( = ?auto_715707 ?auto_715714 ) ) ( not ( = ?auto_715707 ?auto_715715 ) ) ( not ( = ?auto_715707 ?auto_715716 ) ) ( not ( = ?auto_715708 ?auto_715709 ) ) ( not ( = ?auto_715708 ?auto_715710 ) ) ( not ( = ?auto_715708 ?auto_715711 ) ) ( not ( = ?auto_715708 ?auto_715712 ) ) ( not ( = ?auto_715708 ?auto_715713 ) ) ( not ( = ?auto_715708 ?auto_715714 ) ) ( not ( = ?auto_715708 ?auto_715715 ) ) ( not ( = ?auto_715708 ?auto_715716 ) ) ( not ( = ?auto_715709 ?auto_715710 ) ) ( not ( = ?auto_715709 ?auto_715711 ) ) ( not ( = ?auto_715709 ?auto_715712 ) ) ( not ( = ?auto_715709 ?auto_715713 ) ) ( not ( = ?auto_715709 ?auto_715714 ) ) ( not ( = ?auto_715709 ?auto_715715 ) ) ( not ( = ?auto_715709 ?auto_715716 ) ) ( not ( = ?auto_715710 ?auto_715711 ) ) ( not ( = ?auto_715710 ?auto_715712 ) ) ( not ( = ?auto_715710 ?auto_715713 ) ) ( not ( = ?auto_715710 ?auto_715714 ) ) ( not ( = ?auto_715710 ?auto_715715 ) ) ( not ( = ?auto_715710 ?auto_715716 ) ) ( not ( = ?auto_715711 ?auto_715712 ) ) ( not ( = ?auto_715711 ?auto_715713 ) ) ( not ( = ?auto_715711 ?auto_715714 ) ) ( not ( = ?auto_715711 ?auto_715715 ) ) ( not ( = ?auto_715711 ?auto_715716 ) ) ( not ( = ?auto_715712 ?auto_715713 ) ) ( not ( = ?auto_715712 ?auto_715714 ) ) ( not ( = ?auto_715712 ?auto_715715 ) ) ( not ( = ?auto_715712 ?auto_715716 ) ) ( not ( = ?auto_715713 ?auto_715714 ) ) ( not ( = ?auto_715713 ?auto_715715 ) ) ( not ( = ?auto_715713 ?auto_715716 ) ) ( not ( = ?auto_715714 ?auto_715715 ) ) ( not ( = ?auto_715714 ?auto_715716 ) ) ( not ( = ?auto_715715 ?auto_715716 ) ) ( ON ?auto_715714 ?auto_715715 ) ( ON ?auto_715713 ?auto_715714 ) ( ON ?auto_715712 ?auto_715713 ) ( ON ?auto_715711 ?auto_715712 ) ( ON ?auto_715710 ?auto_715711 ) ( ON ?auto_715709 ?auto_715710 ) ( ON ?auto_715708 ?auto_715709 ) ( ON ?auto_715707 ?auto_715708 ) ( ON ?auto_715706 ?auto_715707 ) ( CLEAR ?auto_715704 ) ( ON ?auto_715705 ?auto_715706 ) ( CLEAR ?auto_715705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_715700 ?auto_715701 ?auto_715702 ?auto_715703 ?auto_715704 ?auto_715705 )
      ( MAKE-16PILE ?auto_715700 ?auto_715701 ?auto_715702 ?auto_715703 ?auto_715704 ?auto_715705 ?auto_715706 ?auto_715707 ?auto_715708 ?auto_715709 ?auto_715710 ?auto_715711 ?auto_715712 ?auto_715713 ?auto_715714 ?auto_715715 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715766 - BLOCK
      ?auto_715767 - BLOCK
      ?auto_715768 - BLOCK
      ?auto_715769 - BLOCK
      ?auto_715770 - BLOCK
      ?auto_715771 - BLOCK
      ?auto_715772 - BLOCK
      ?auto_715773 - BLOCK
      ?auto_715774 - BLOCK
      ?auto_715775 - BLOCK
      ?auto_715776 - BLOCK
      ?auto_715777 - BLOCK
      ?auto_715778 - BLOCK
      ?auto_715779 - BLOCK
      ?auto_715780 - BLOCK
      ?auto_715781 - BLOCK
    )
    :vars
    (
      ?auto_715782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715781 ?auto_715782 ) ( ON-TABLE ?auto_715766 ) ( ON ?auto_715767 ?auto_715766 ) ( ON ?auto_715768 ?auto_715767 ) ( ON ?auto_715769 ?auto_715768 ) ( not ( = ?auto_715766 ?auto_715767 ) ) ( not ( = ?auto_715766 ?auto_715768 ) ) ( not ( = ?auto_715766 ?auto_715769 ) ) ( not ( = ?auto_715766 ?auto_715770 ) ) ( not ( = ?auto_715766 ?auto_715771 ) ) ( not ( = ?auto_715766 ?auto_715772 ) ) ( not ( = ?auto_715766 ?auto_715773 ) ) ( not ( = ?auto_715766 ?auto_715774 ) ) ( not ( = ?auto_715766 ?auto_715775 ) ) ( not ( = ?auto_715766 ?auto_715776 ) ) ( not ( = ?auto_715766 ?auto_715777 ) ) ( not ( = ?auto_715766 ?auto_715778 ) ) ( not ( = ?auto_715766 ?auto_715779 ) ) ( not ( = ?auto_715766 ?auto_715780 ) ) ( not ( = ?auto_715766 ?auto_715781 ) ) ( not ( = ?auto_715766 ?auto_715782 ) ) ( not ( = ?auto_715767 ?auto_715768 ) ) ( not ( = ?auto_715767 ?auto_715769 ) ) ( not ( = ?auto_715767 ?auto_715770 ) ) ( not ( = ?auto_715767 ?auto_715771 ) ) ( not ( = ?auto_715767 ?auto_715772 ) ) ( not ( = ?auto_715767 ?auto_715773 ) ) ( not ( = ?auto_715767 ?auto_715774 ) ) ( not ( = ?auto_715767 ?auto_715775 ) ) ( not ( = ?auto_715767 ?auto_715776 ) ) ( not ( = ?auto_715767 ?auto_715777 ) ) ( not ( = ?auto_715767 ?auto_715778 ) ) ( not ( = ?auto_715767 ?auto_715779 ) ) ( not ( = ?auto_715767 ?auto_715780 ) ) ( not ( = ?auto_715767 ?auto_715781 ) ) ( not ( = ?auto_715767 ?auto_715782 ) ) ( not ( = ?auto_715768 ?auto_715769 ) ) ( not ( = ?auto_715768 ?auto_715770 ) ) ( not ( = ?auto_715768 ?auto_715771 ) ) ( not ( = ?auto_715768 ?auto_715772 ) ) ( not ( = ?auto_715768 ?auto_715773 ) ) ( not ( = ?auto_715768 ?auto_715774 ) ) ( not ( = ?auto_715768 ?auto_715775 ) ) ( not ( = ?auto_715768 ?auto_715776 ) ) ( not ( = ?auto_715768 ?auto_715777 ) ) ( not ( = ?auto_715768 ?auto_715778 ) ) ( not ( = ?auto_715768 ?auto_715779 ) ) ( not ( = ?auto_715768 ?auto_715780 ) ) ( not ( = ?auto_715768 ?auto_715781 ) ) ( not ( = ?auto_715768 ?auto_715782 ) ) ( not ( = ?auto_715769 ?auto_715770 ) ) ( not ( = ?auto_715769 ?auto_715771 ) ) ( not ( = ?auto_715769 ?auto_715772 ) ) ( not ( = ?auto_715769 ?auto_715773 ) ) ( not ( = ?auto_715769 ?auto_715774 ) ) ( not ( = ?auto_715769 ?auto_715775 ) ) ( not ( = ?auto_715769 ?auto_715776 ) ) ( not ( = ?auto_715769 ?auto_715777 ) ) ( not ( = ?auto_715769 ?auto_715778 ) ) ( not ( = ?auto_715769 ?auto_715779 ) ) ( not ( = ?auto_715769 ?auto_715780 ) ) ( not ( = ?auto_715769 ?auto_715781 ) ) ( not ( = ?auto_715769 ?auto_715782 ) ) ( not ( = ?auto_715770 ?auto_715771 ) ) ( not ( = ?auto_715770 ?auto_715772 ) ) ( not ( = ?auto_715770 ?auto_715773 ) ) ( not ( = ?auto_715770 ?auto_715774 ) ) ( not ( = ?auto_715770 ?auto_715775 ) ) ( not ( = ?auto_715770 ?auto_715776 ) ) ( not ( = ?auto_715770 ?auto_715777 ) ) ( not ( = ?auto_715770 ?auto_715778 ) ) ( not ( = ?auto_715770 ?auto_715779 ) ) ( not ( = ?auto_715770 ?auto_715780 ) ) ( not ( = ?auto_715770 ?auto_715781 ) ) ( not ( = ?auto_715770 ?auto_715782 ) ) ( not ( = ?auto_715771 ?auto_715772 ) ) ( not ( = ?auto_715771 ?auto_715773 ) ) ( not ( = ?auto_715771 ?auto_715774 ) ) ( not ( = ?auto_715771 ?auto_715775 ) ) ( not ( = ?auto_715771 ?auto_715776 ) ) ( not ( = ?auto_715771 ?auto_715777 ) ) ( not ( = ?auto_715771 ?auto_715778 ) ) ( not ( = ?auto_715771 ?auto_715779 ) ) ( not ( = ?auto_715771 ?auto_715780 ) ) ( not ( = ?auto_715771 ?auto_715781 ) ) ( not ( = ?auto_715771 ?auto_715782 ) ) ( not ( = ?auto_715772 ?auto_715773 ) ) ( not ( = ?auto_715772 ?auto_715774 ) ) ( not ( = ?auto_715772 ?auto_715775 ) ) ( not ( = ?auto_715772 ?auto_715776 ) ) ( not ( = ?auto_715772 ?auto_715777 ) ) ( not ( = ?auto_715772 ?auto_715778 ) ) ( not ( = ?auto_715772 ?auto_715779 ) ) ( not ( = ?auto_715772 ?auto_715780 ) ) ( not ( = ?auto_715772 ?auto_715781 ) ) ( not ( = ?auto_715772 ?auto_715782 ) ) ( not ( = ?auto_715773 ?auto_715774 ) ) ( not ( = ?auto_715773 ?auto_715775 ) ) ( not ( = ?auto_715773 ?auto_715776 ) ) ( not ( = ?auto_715773 ?auto_715777 ) ) ( not ( = ?auto_715773 ?auto_715778 ) ) ( not ( = ?auto_715773 ?auto_715779 ) ) ( not ( = ?auto_715773 ?auto_715780 ) ) ( not ( = ?auto_715773 ?auto_715781 ) ) ( not ( = ?auto_715773 ?auto_715782 ) ) ( not ( = ?auto_715774 ?auto_715775 ) ) ( not ( = ?auto_715774 ?auto_715776 ) ) ( not ( = ?auto_715774 ?auto_715777 ) ) ( not ( = ?auto_715774 ?auto_715778 ) ) ( not ( = ?auto_715774 ?auto_715779 ) ) ( not ( = ?auto_715774 ?auto_715780 ) ) ( not ( = ?auto_715774 ?auto_715781 ) ) ( not ( = ?auto_715774 ?auto_715782 ) ) ( not ( = ?auto_715775 ?auto_715776 ) ) ( not ( = ?auto_715775 ?auto_715777 ) ) ( not ( = ?auto_715775 ?auto_715778 ) ) ( not ( = ?auto_715775 ?auto_715779 ) ) ( not ( = ?auto_715775 ?auto_715780 ) ) ( not ( = ?auto_715775 ?auto_715781 ) ) ( not ( = ?auto_715775 ?auto_715782 ) ) ( not ( = ?auto_715776 ?auto_715777 ) ) ( not ( = ?auto_715776 ?auto_715778 ) ) ( not ( = ?auto_715776 ?auto_715779 ) ) ( not ( = ?auto_715776 ?auto_715780 ) ) ( not ( = ?auto_715776 ?auto_715781 ) ) ( not ( = ?auto_715776 ?auto_715782 ) ) ( not ( = ?auto_715777 ?auto_715778 ) ) ( not ( = ?auto_715777 ?auto_715779 ) ) ( not ( = ?auto_715777 ?auto_715780 ) ) ( not ( = ?auto_715777 ?auto_715781 ) ) ( not ( = ?auto_715777 ?auto_715782 ) ) ( not ( = ?auto_715778 ?auto_715779 ) ) ( not ( = ?auto_715778 ?auto_715780 ) ) ( not ( = ?auto_715778 ?auto_715781 ) ) ( not ( = ?auto_715778 ?auto_715782 ) ) ( not ( = ?auto_715779 ?auto_715780 ) ) ( not ( = ?auto_715779 ?auto_715781 ) ) ( not ( = ?auto_715779 ?auto_715782 ) ) ( not ( = ?auto_715780 ?auto_715781 ) ) ( not ( = ?auto_715780 ?auto_715782 ) ) ( not ( = ?auto_715781 ?auto_715782 ) ) ( ON ?auto_715780 ?auto_715781 ) ( ON ?auto_715779 ?auto_715780 ) ( ON ?auto_715778 ?auto_715779 ) ( ON ?auto_715777 ?auto_715778 ) ( ON ?auto_715776 ?auto_715777 ) ( ON ?auto_715775 ?auto_715776 ) ( ON ?auto_715774 ?auto_715775 ) ( ON ?auto_715773 ?auto_715774 ) ( ON ?auto_715772 ?auto_715773 ) ( ON ?auto_715771 ?auto_715772 ) ( CLEAR ?auto_715769 ) ( ON ?auto_715770 ?auto_715771 ) ( CLEAR ?auto_715770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_715766 ?auto_715767 ?auto_715768 ?auto_715769 ?auto_715770 )
      ( MAKE-16PILE ?auto_715766 ?auto_715767 ?auto_715768 ?auto_715769 ?auto_715770 ?auto_715771 ?auto_715772 ?auto_715773 ?auto_715774 ?auto_715775 ?auto_715776 ?auto_715777 ?auto_715778 ?auto_715779 ?auto_715780 ?auto_715781 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715832 - BLOCK
      ?auto_715833 - BLOCK
      ?auto_715834 - BLOCK
      ?auto_715835 - BLOCK
      ?auto_715836 - BLOCK
      ?auto_715837 - BLOCK
      ?auto_715838 - BLOCK
      ?auto_715839 - BLOCK
      ?auto_715840 - BLOCK
      ?auto_715841 - BLOCK
      ?auto_715842 - BLOCK
      ?auto_715843 - BLOCK
      ?auto_715844 - BLOCK
      ?auto_715845 - BLOCK
      ?auto_715846 - BLOCK
      ?auto_715847 - BLOCK
    )
    :vars
    (
      ?auto_715848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715847 ?auto_715848 ) ( ON-TABLE ?auto_715832 ) ( ON ?auto_715833 ?auto_715832 ) ( ON ?auto_715834 ?auto_715833 ) ( not ( = ?auto_715832 ?auto_715833 ) ) ( not ( = ?auto_715832 ?auto_715834 ) ) ( not ( = ?auto_715832 ?auto_715835 ) ) ( not ( = ?auto_715832 ?auto_715836 ) ) ( not ( = ?auto_715832 ?auto_715837 ) ) ( not ( = ?auto_715832 ?auto_715838 ) ) ( not ( = ?auto_715832 ?auto_715839 ) ) ( not ( = ?auto_715832 ?auto_715840 ) ) ( not ( = ?auto_715832 ?auto_715841 ) ) ( not ( = ?auto_715832 ?auto_715842 ) ) ( not ( = ?auto_715832 ?auto_715843 ) ) ( not ( = ?auto_715832 ?auto_715844 ) ) ( not ( = ?auto_715832 ?auto_715845 ) ) ( not ( = ?auto_715832 ?auto_715846 ) ) ( not ( = ?auto_715832 ?auto_715847 ) ) ( not ( = ?auto_715832 ?auto_715848 ) ) ( not ( = ?auto_715833 ?auto_715834 ) ) ( not ( = ?auto_715833 ?auto_715835 ) ) ( not ( = ?auto_715833 ?auto_715836 ) ) ( not ( = ?auto_715833 ?auto_715837 ) ) ( not ( = ?auto_715833 ?auto_715838 ) ) ( not ( = ?auto_715833 ?auto_715839 ) ) ( not ( = ?auto_715833 ?auto_715840 ) ) ( not ( = ?auto_715833 ?auto_715841 ) ) ( not ( = ?auto_715833 ?auto_715842 ) ) ( not ( = ?auto_715833 ?auto_715843 ) ) ( not ( = ?auto_715833 ?auto_715844 ) ) ( not ( = ?auto_715833 ?auto_715845 ) ) ( not ( = ?auto_715833 ?auto_715846 ) ) ( not ( = ?auto_715833 ?auto_715847 ) ) ( not ( = ?auto_715833 ?auto_715848 ) ) ( not ( = ?auto_715834 ?auto_715835 ) ) ( not ( = ?auto_715834 ?auto_715836 ) ) ( not ( = ?auto_715834 ?auto_715837 ) ) ( not ( = ?auto_715834 ?auto_715838 ) ) ( not ( = ?auto_715834 ?auto_715839 ) ) ( not ( = ?auto_715834 ?auto_715840 ) ) ( not ( = ?auto_715834 ?auto_715841 ) ) ( not ( = ?auto_715834 ?auto_715842 ) ) ( not ( = ?auto_715834 ?auto_715843 ) ) ( not ( = ?auto_715834 ?auto_715844 ) ) ( not ( = ?auto_715834 ?auto_715845 ) ) ( not ( = ?auto_715834 ?auto_715846 ) ) ( not ( = ?auto_715834 ?auto_715847 ) ) ( not ( = ?auto_715834 ?auto_715848 ) ) ( not ( = ?auto_715835 ?auto_715836 ) ) ( not ( = ?auto_715835 ?auto_715837 ) ) ( not ( = ?auto_715835 ?auto_715838 ) ) ( not ( = ?auto_715835 ?auto_715839 ) ) ( not ( = ?auto_715835 ?auto_715840 ) ) ( not ( = ?auto_715835 ?auto_715841 ) ) ( not ( = ?auto_715835 ?auto_715842 ) ) ( not ( = ?auto_715835 ?auto_715843 ) ) ( not ( = ?auto_715835 ?auto_715844 ) ) ( not ( = ?auto_715835 ?auto_715845 ) ) ( not ( = ?auto_715835 ?auto_715846 ) ) ( not ( = ?auto_715835 ?auto_715847 ) ) ( not ( = ?auto_715835 ?auto_715848 ) ) ( not ( = ?auto_715836 ?auto_715837 ) ) ( not ( = ?auto_715836 ?auto_715838 ) ) ( not ( = ?auto_715836 ?auto_715839 ) ) ( not ( = ?auto_715836 ?auto_715840 ) ) ( not ( = ?auto_715836 ?auto_715841 ) ) ( not ( = ?auto_715836 ?auto_715842 ) ) ( not ( = ?auto_715836 ?auto_715843 ) ) ( not ( = ?auto_715836 ?auto_715844 ) ) ( not ( = ?auto_715836 ?auto_715845 ) ) ( not ( = ?auto_715836 ?auto_715846 ) ) ( not ( = ?auto_715836 ?auto_715847 ) ) ( not ( = ?auto_715836 ?auto_715848 ) ) ( not ( = ?auto_715837 ?auto_715838 ) ) ( not ( = ?auto_715837 ?auto_715839 ) ) ( not ( = ?auto_715837 ?auto_715840 ) ) ( not ( = ?auto_715837 ?auto_715841 ) ) ( not ( = ?auto_715837 ?auto_715842 ) ) ( not ( = ?auto_715837 ?auto_715843 ) ) ( not ( = ?auto_715837 ?auto_715844 ) ) ( not ( = ?auto_715837 ?auto_715845 ) ) ( not ( = ?auto_715837 ?auto_715846 ) ) ( not ( = ?auto_715837 ?auto_715847 ) ) ( not ( = ?auto_715837 ?auto_715848 ) ) ( not ( = ?auto_715838 ?auto_715839 ) ) ( not ( = ?auto_715838 ?auto_715840 ) ) ( not ( = ?auto_715838 ?auto_715841 ) ) ( not ( = ?auto_715838 ?auto_715842 ) ) ( not ( = ?auto_715838 ?auto_715843 ) ) ( not ( = ?auto_715838 ?auto_715844 ) ) ( not ( = ?auto_715838 ?auto_715845 ) ) ( not ( = ?auto_715838 ?auto_715846 ) ) ( not ( = ?auto_715838 ?auto_715847 ) ) ( not ( = ?auto_715838 ?auto_715848 ) ) ( not ( = ?auto_715839 ?auto_715840 ) ) ( not ( = ?auto_715839 ?auto_715841 ) ) ( not ( = ?auto_715839 ?auto_715842 ) ) ( not ( = ?auto_715839 ?auto_715843 ) ) ( not ( = ?auto_715839 ?auto_715844 ) ) ( not ( = ?auto_715839 ?auto_715845 ) ) ( not ( = ?auto_715839 ?auto_715846 ) ) ( not ( = ?auto_715839 ?auto_715847 ) ) ( not ( = ?auto_715839 ?auto_715848 ) ) ( not ( = ?auto_715840 ?auto_715841 ) ) ( not ( = ?auto_715840 ?auto_715842 ) ) ( not ( = ?auto_715840 ?auto_715843 ) ) ( not ( = ?auto_715840 ?auto_715844 ) ) ( not ( = ?auto_715840 ?auto_715845 ) ) ( not ( = ?auto_715840 ?auto_715846 ) ) ( not ( = ?auto_715840 ?auto_715847 ) ) ( not ( = ?auto_715840 ?auto_715848 ) ) ( not ( = ?auto_715841 ?auto_715842 ) ) ( not ( = ?auto_715841 ?auto_715843 ) ) ( not ( = ?auto_715841 ?auto_715844 ) ) ( not ( = ?auto_715841 ?auto_715845 ) ) ( not ( = ?auto_715841 ?auto_715846 ) ) ( not ( = ?auto_715841 ?auto_715847 ) ) ( not ( = ?auto_715841 ?auto_715848 ) ) ( not ( = ?auto_715842 ?auto_715843 ) ) ( not ( = ?auto_715842 ?auto_715844 ) ) ( not ( = ?auto_715842 ?auto_715845 ) ) ( not ( = ?auto_715842 ?auto_715846 ) ) ( not ( = ?auto_715842 ?auto_715847 ) ) ( not ( = ?auto_715842 ?auto_715848 ) ) ( not ( = ?auto_715843 ?auto_715844 ) ) ( not ( = ?auto_715843 ?auto_715845 ) ) ( not ( = ?auto_715843 ?auto_715846 ) ) ( not ( = ?auto_715843 ?auto_715847 ) ) ( not ( = ?auto_715843 ?auto_715848 ) ) ( not ( = ?auto_715844 ?auto_715845 ) ) ( not ( = ?auto_715844 ?auto_715846 ) ) ( not ( = ?auto_715844 ?auto_715847 ) ) ( not ( = ?auto_715844 ?auto_715848 ) ) ( not ( = ?auto_715845 ?auto_715846 ) ) ( not ( = ?auto_715845 ?auto_715847 ) ) ( not ( = ?auto_715845 ?auto_715848 ) ) ( not ( = ?auto_715846 ?auto_715847 ) ) ( not ( = ?auto_715846 ?auto_715848 ) ) ( not ( = ?auto_715847 ?auto_715848 ) ) ( ON ?auto_715846 ?auto_715847 ) ( ON ?auto_715845 ?auto_715846 ) ( ON ?auto_715844 ?auto_715845 ) ( ON ?auto_715843 ?auto_715844 ) ( ON ?auto_715842 ?auto_715843 ) ( ON ?auto_715841 ?auto_715842 ) ( ON ?auto_715840 ?auto_715841 ) ( ON ?auto_715839 ?auto_715840 ) ( ON ?auto_715838 ?auto_715839 ) ( ON ?auto_715837 ?auto_715838 ) ( ON ?auto_715836 ?auto_715837 ) ( CLEAR ?auto_715834 ) ( ON ?auto_715835 ?auto_715836 ) ( CLEAR ?auto_715835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_715832 ?auto_715833 ?auto_715834 ?auto_715835 )
      ( MAKE-16PILE ?auto_715832 ?auto_715833 ?auto_715834 ?auto_715835 ?auto_715836 ?auto_715837 ?auto_715838 ?auto_715839 ?auto_715840 ?auto_715841 ?auto_715842 ?auto_715843 ?auto_715844 ?auto_715845 ?auto_715846 ?auto_715847 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715898 - BLOCK
      ?auto_715899 - BLOCK
      ?auto_715900 - BLOCK
      ?auto_715901 - BLOCK
      ?auto_715902 - BLOCK
      ?auto_715903 - BLOCK
      ?auto_715904 - BLOCK
      ?auto_715905 - BLOCK
      ?auto_715906 - BLOCK
      ?auto_715907 - BLOCK
      ?auto_715908 - BLOCK
      ?auto_715909 - BLOCK
      ?auto_715910 - BLOCK
      ?auto_715911 - BLOCK
      ?auto_715912 - BLOCK
      ?auto_715913 - BLOCK
    )
    :vars
    (
      ?auto_715914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715913 ?auto_715914 ) ( ON-TABLE ?auto_715898 ) ( ON ?auto_715899 ?auto_715898 ) ( not ( = ?auto_715898 ?auto_715899 ) ) ( not ( = ?auto_715898 ?auto_715900 ) ) ( not ( = ?auto_715898 ?auto_715901 ) ) ( not ( = ?auto_715898 ?auto_715902 ) ) ( not ( = ?auto_715898 ?auto_715903 ) ) ( not ( = ?auto_715898 ?auto_715904 ) ) ( not ( = ?auto_715898 ?auto_715905 ) ) ( not ( = ?auto_715898 ?auto_715906 ) ) ( not ( = ?auto_715898 ?auto_715907 ) ) ( not ( = ?auto_715898 ?auto_715908 ) ) ( not ( = ?auto_715898 ?auto_715909 ) ) ( not ( = ?auto_715898 ?auto_715910 ) ) ( not ( = ?auto_715898 ?auto_715911 ) ) ( not ( = ?auto_715898 ?auto_715912 ) ) ( not ( = ?auto_715898 ?auto_715913 ) ) ( not ( = ?auto_715898 ?auto_715914 ) ) ( not ( = ?auto_715899 ?auto_715900 ) ) ( not ( = ?auto_715899 ?auto_715901 ) ) ( not ( = ?auto_715899 ?auto_715902 ) ) ( not ( = ?auto_715899 ?auto_715903 ) ) ( not ( = ?auto_715899 ?auto_715904 ) ) ( not ( = ?auto_715899 ?auto_715905 ) ) ( not ( = ?auto_715899 ?auto_715906 ) ) ( not ( = ?auto_715899 ?auto_715907 ) ) ( not ( = ?auto_715899 ?auto_715908 ) ) ( not ( = ?auto_715899 ?auto_715909 ) ) ( not ( = ?auto_715899 ?auto_715910 ) ) ( not ( = ?auto_715899 ?auto_715911 ) ) ( not ( = ?auto_715899 ?auto_715912 ) ) ( not ( = ?auto_715899 ?auto_715913 ) ) ( not ( = ?auto_715899 ?auto_715914 ) ) ( not ( = ?auto_715900 ?auto_715901 ) ) ( not ( = ?auto_715900 ?auto_715902 ) ) ( not ( = ?auto_715900 ?auto_715903 ) ) ( not ( = ?auto_715900 ?auto_715904 ) ) ( not ( = ?auto_715900 ?auto_715905 ) ) ( not ( = ?auto_715900 ?auto_715906 ) ) ( not ( = ?auto_715900 ?auto_715907 ) ) ( not ( = ?auto_715900 ?auto_715908 ) ) ( not ( = ?auto_715900 ?auto_715909 ) ) ( not ( = ?auto_715900 ?auto_715910 ) ) ( not ( = ?auto_715900 ?auto_715911 ) ) ( not ( = ?auto_715900 ?auto_715912 ) ) ( not ( = ?auto_715900 ?auto_715913 ) ) ( not ( = ?auto_715900 ?auto_715914 ) ) ( not ( = ?auto_715901 ?auto_715902 ) ) ( not ( = ?auto_715901 ?auto_715903 ) ) ( not ( = ?auto_715901 ?auto_715904 ) ) ( not ( = ?auto_715901 ?auto_715905 ) ) ( not ( = ?auto_715901 ?auto_715906 ) ) ( not ( = ?auto_715901 ?auto_715907 ) ) ( not ( = ?auto_715901 ?auto_715908 ) ) ( not ( = ?auto_715901 ?auto_715909 ) ) ( not ( = ?auto_715901 ?auto_715910 ) ) ( not ( = ?auto_715901 ?auto_715911 ) ) ( not ( = ?auto_715901 ?auto_715912 ) ) ( not ( = ?auto_715901 ?auto_715913 ) ) ( not ( = ?auto_715901 ?auto_715914 ) ) ( not ( = ?auto_715902 ?auto_715903 ) ) ( not ( = ?auto_715902 ?auto_715904 ) ) ( not ( = ?auto_715902 ?auto_715905 ) ) ( not ( = ?auto_715902 ?auto_715906 ) ) ( not ( = ?auto_715902 ?auto_715907 ) ) ( not ( = ?auto_715902 ?auto_715908 ) ) ( not ( = ?auto_715902 ?auto_715909 ) ) ( not ( = ?auto_715902 ?auto_715910 ) ) ( not ( = ?auto_715902 ?auto_715911 ) ) ( not ( = ?auto_715902 ?auto_715912 ) ) ( not ( = ?auto_715902 ?auto_715913 ) ) ( not ( = ?auto_715902 ?auto_715914 ) ) ( not ( = ?auto_715903 ?auto_715904 ) ) ( not ( = ?auto_715903 ?auto_715905 ) ) ( not ( = ?auto_715903 ?auto_715906 ) ) ( not ( = ?auto_715903 ?auto_715907 ) ) ( not ( = ?auto_715903 ?auto_715908 ) ) ( not ( = ?auto_715903 ?auto_715909 ) ) ( not ( = ?auto_715903 ?auto_715910 ) ) ( not ( = ?auto_715903 ?auto_715911 ) ) ( not ( = ?auto_715903 ?auto_715912 ) ) ( not ( = ?auto_715903 ?auto_715913 ) ) ( not ( = ?auto_715903 ?auto_715914 ) ) ( not ( = ?auto_715904 ?auto_715905 ) ) ( not ( = ?auto_715904 ?auto_715906 ) ) ( not ( = ?auto_715904 ?auto_715907 ) ) ( not ( = ?auto_715904 ?auto_715908 ) ) ( not ( = ?auto_715904 ?auto_715909 ) ) ( not ( = ?auto_715904 ?auto_715910 ) ) ( not ( = ?auto_715904 ?auto_715911 ) ) ( not ( = ?auto_715904 ?auto_715912 ) ) ( not ( = ?auto_715904 ?auto_715913 ) ) ( not ( = ?auto_715904 ?auto_715914 ) ) ( not ( = ?auto_715905 ?auto_715906 ) ) ( not ( = ?auto_715905 ?auto_715907 ) ) ( not ( = ?auto_715905 ?auto_715908 ) ) ( not ( = ?auto_715905 ?auto_715909 ) ) ( not ( = ?auto_715905 ?auto_715910 ) ) ( not ( = ?auto_715905 ?auto_715911 ) ) ( not ( = ?auto_715905 ?auto_715912 ) ) ( not ( = ?auto_715905 ?auto_715913 ) ) ( not ( = ?auto_715905 ?auto_715914 ) ) ( not ( = ?auto_715906 ?auto_715907 ) ) ( not ( = ?auto_715906 ?auto_715908 ) ) ( not ( = ?auto_715906 ?auto_715909 ) ) ( not ( = ?auto_715906 ?auto_715910 ) ) ( not ( = ?auto_715906 ?auto_715911 ) ) ( not ( = ?auto_715906 ?auto_715912 ) ) ( not ( = ?auto_715906 ?auto_715913 ) ) ( not ( = ?auto_715906 ?auto_715914 ) ) ( not ( = ?auto_715907 ?auto_715908 ) ) ( not ( = ?auto_715907 ?auto_715909 ) ) ( not ( = ?auto_715907 ?auto_715910 ) ) ( not ( = ?auto_715907 ?auto_715911 ) ) ( not ( = ?auto_715907 ?auto_715912 ) ) ( not ( = ?auto_715907 ?auto_715913 ) ) ( not ( = ?auto_715907 ?auto_715914 ) ) ( not ( = ?auto_715908 ?auto_715909 ) ) ( not ( = ?auto_715908 ?auto_715910 ) ) ( not ( = ?auto_715908 ?auto_715911 ) ) ( not ( = ?auto_715908 ?auto_715912 ) ) ( not ( = ?auto_715908 ?auto_715913 ) ) ( not ( = ?auto_715908 ?auto_715914 ) ) ( not ( = ?auto_715909 ?auto_715910 ) ) ( not ( = ?auto_715909 ?auto_715911 ) ) ( not ( = ?auto_715909 ?auto_715912 ) ) ( not ( = ?auto_715909 ?auto_715913 ) ) ( not ( = ?auto_715909 ?auto_715914 ) ) ( not ( = ?auto_715910 ?auto_715911 ) ) ( not ( = ?auto_715910 ?auto_715912 ) ) ( not ( = ?auto_715910 ?auto_715913 ) ) ( not ( = ?auto_715910 ?auto_715914 ) ) ( not ( = ?auto_715911 ?auto_715912 ) ) ( not ( = ?auto_715911 ?auto_715913 ) ) ( not ( = ?auto_715911 ?auto_715914 ) ) ( not ( = ?auto_715912 ?auto_715913 ) ) ( not ( = ?auto_715912 ?auto_715914 ) ) ( not ( = ?auto_715913 ?auto_715914 ) ) ( ON ?auto_715912 ?auto_715913 ) ( ON ?auto_715911 ?auto_715912 ) ( ON ?auto_715910 ?auto_715911 ) ( ON ?auto_715909 ?auto_715910 ) ( ON ?auto_715908 ?auto_715909 ) ( ON ?auto_715907 ?auto_715908 ) ( ON ?auto_715906 ?auto_715907 ) ( ON ?auto_715905 ?auto_715906 ) ( ON ?auto_715904 ?auto_715905 ) ( ON ?auto_715903 ?auto_715904 ) ( ON ?auto_715902 ?auto_715903 ) ( ON ?auto_715901 ?auto_715902 ) ( CLEAR ?auto_715899 ) ( ON ?auto_715900 ?auto_715901 ) ( CLEAR ?auto_715900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_715898 ?auto_715899 ?auto_715900 )
      ( MAKE-16PILE ?auto_715898 ?auto_715899 ?auto_715900 ?auto_715901 ?auto_715902 ?auto_715903 ?auto_715904 ?auto_715905 ?auto_715906 ?auto_715907 ?auto_715908 ?auto_715909 ?auto_715910 ?auto_715911 ?auto_715912 ?auto_715913 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_715964 - BLOCK
      ?auto_715965 - BLOCK
      ?auto_715966 - BLOCK
      ?auto_715967 - BLOCK
      ?auto_715968 - BLOCK
      ?auto_715969 - BLOCK
      ?auto_715970 - BLOCK
      ?auto_715971 - BLOCK
      ?auto_715972 - BLOCK
      ?auto_715973 - BLOCK
      ?auto_715974 - BLOCK
      ?auto_715975 - BLOCK
      ?auto_715976 - BLOCK
      ?auto_715977 - BLOCK
      ?auto_715978 - BLOCK
      ?auto_715979 - BLOCK
    )
    :vars
    (
      ?auto_715980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_715979 ?auto_715980 ) ( ON-TABLE ?auto_715964 ) ( not ( = ?auto_715964 ?auto_715965 ) ) ( not ( = ?auto_715964 ?auto_715966 ) ) ( not ( = ?auto_715964 ?auto_715967 ) ) ( not ( = ?auto_715964 ?auto_715968 ) ) ( not ( = ?auto_715964 ?auto_715969 ) ) ( not ( = ?auto_715964 ?auto_715970 ) ) ( not ( = ?auto_715964 ?auto_715971 ) ) ( not ( = ?auto_715964 ?auto_715972 ) ) ( not ( = ?auto_715964 ?auto_715973 ) ) ( not ( = ?auto_715964 ?auto_715974 ) ) ( not ( = ?auto_715964 ?auto_715975 ) ) ( not ( = ?auto_715964 ?auto_715976 ) ) ( not ( = ?auto_715964 ?auto_715977 ) ) ( not ( = ?auto_715964 ?auto_715978 ) ) ( not ( = ?auto_715964 ?auto_715979 ) ) ( not ( = ?auto_715964 ?auto_715980 ) ) ( not ( = ?auto_715965 ?auto_715966 ) ) ( not ( = ?auto_715965 ?auto_715967 ) ) ( not ( = ?auto_715965 ?auto_715968 ) ) ( not ( = ?auto_715965 ?auto_715969 ) ) ( not ( = ?auto_715965 ?auto_715970 ) ) ( not ( = ?auto_715965 ?auto_715971 ) ) ( not ( = ?auto_715965 ?auto_715972 ) ) ( not ( = ?auto_715965 ?auto_715973 ) ) ( not ( = ?auto_715965 ?auto_715974 ) ) ( not ( = ?auto_715965 ?auto_715975 ) ) ( not ( = ?auto_715965 ?auto_715976 ) ) ( not ( = ?auto_715965 ?auto_715977 ) ) ( not ( = ?auto_715965 ?auto_715978 ) ) ( not ( = ?auto_715965 ?auto_715979 ) ) ( not ( = ?auto_715965 ?auto_715980 ) ) ( not ( = ?auto_715966 ?auto_715967 ) ) ( not ( = ?auto_715966 ?auto_715968 ) ) ( not ( = ?auto_715966 ?auto_715969 ) ) ( not ( = ?auto_715966 ?auto_715970 ) ) ( not ( = ?auto_715966 ?auto_715971 ) ) ( not ( = ?auto_715966 ?auto_715972 ) ) ( not ( = ?auto_715966 ?auto_715973 ) ) ( not ( = ?auto_715966 ?auto_715974 ) ) ( not ( = ?auto_715966 ?auto_715975 ) ) ( not ( = ?auto_715966 ?auto_715976 ) ) ( not ( = ?auto_715966 ?auto_715977 ) ) ( not ( = ?auto_715966 ?auto_715978 ) ) ( not ( = ?auto_715966 ?auto_715979 ) ) ( not ( = ?auto_715966 ?auto_715980 ) ) ( not ( = ?auto_715967 ?auto_715968 ) ) ( not ( = ?auto_715967 ?auto_715969 ) ) ( not ( = ?auto_715967 ?auto_715970 ) ) ( not ( = ?auto_715967 ?auto_715971 ) ) ( not ( = ?auto_715967 ?auto_715972 ) ) ( not ( = ?auto_715967 ?auto_715973 ) ) ( not ( = ?auto_715967 ?auto_715974 ) ) ( not ( = ?auto_715967 ?auto_715975 ) ) ( not ( = ?auto_715967 ?auto_715976 ) ) ( not ( = ?auto_715967 ?auto_715977 ) ) ( not ( = ?auto_715967 ?auto_715978 ) ) ( not ( = ?auto_715967 ?auto_715979 ) ) ( not ( = ?auto_715967 ?auto_715980 ) ) ( not ( = ?auto_715968 ?auto_715969 ) ) ( not ( = ?auto_715968 ?auto_715970 ) ) ( not ( = ?auto_715968 ?auto_715971 ) ) ( not ( = ?auto_715968 ?auto_715972 ) ) ( not ( = ?auto_715968 ?auto_715973 ) ) ( not ( = ?auto_715968 ?auto_715974 ) ) ( not ( = ?auto_715968 ?auto_715975 ) ) ( not ( = ?auto_715968 ?auto_715976 ) ) ( not ( = ?auto_715968 ?auto_715977 ) ) ( not ( = ?auto_715968 ?auto_715978 ) ) ( not ( = ?auto_715968 ?auto_715979 ) ) ( not ( = ?auto_715968 ?auto_715980 ) ) ( not ( = ?auto_715969 ?auto_715970 ) ) ( not ( = ?auto_715969 ?auto_715971 ) ) ( not ( = ?auto_715969 ?auto_715972 ) ) ( not ( = ?auto_715969 ?auto_715973 ) ) ( not ( = ?auto_715969 ?auto_715974 ) ) ( not ( = ?auto_715969 ?auto_715975 ) ) ( not ( = ?auto_715969 ?auto_715976 ) ) ( not ( = ?auto_715969 ?auto_715977 ) ) ( not ( = ?auto_715969 ?auto_715978 ) ) ( not ( = ?auto_715969 ?auto_715979 ) ) ( not ( = ?auto_715969 ?auto_715980 ) ) ( not ( = ?auto_715970 ?auto_715971 ) ) ( not ( = ?auto_715970 ?auto_715972 ) ) ( not ( = ?auto_715970 ?auto_715973 ) ) ( not ( = ?auto_715970 ?auto_715974 ) ) ( not ( = ?auto_715970 ?auto_715975 ) ) ( not ( = ?auto_715970 ?auto_715976 ) ) ( not ( = ?auto_715970 ?auto_715977 ) ) ( not ( = ?auto_715970 ?auto_715978 ) ) ( not ( = ?auto_715970 ?auto_715979 ) ) ( not ( = ?auto_715970 ?auto_715980 ) ) ( not ( = ?auto_715971 ?auto_715972 ) ) ( not ( = ?auto_715971 ?auto_715973 ) ) ( not ( = ?auto_715971 ?auto_715974 ) ) ( not ( = ?auto_715971 ?auto_715975 ) ) ( not ( = ?auto_715971 ?auto_715976 ) ) ( not ( = ?auto_715971 ?auto_715977 ) ) ( not ( = ?auto_715971 ?auto_715978 ) ) ( not ( = ?auto_715971 ?auto_715979 ) ) ( not ( = ?auto_715971 ?auto_715980 ) ) ( not ( = ?auto_715972 ?auto_715973 ) ) ( not ( = ?auto_715972 ?auto_715974 ) ) ( not ( = ?auto_715972 ?auto_715975 ) ) ( not ( = ?auto_715972 ?auto_715976 ) ) ( not ( = ?auto_715972 ?auto_715977 ) ) ( not ( = ?auto_715972 ?auto_715978 ) ) ( not ( = ?auto_715972 ?auto_715979 ) ) ( not ( = ?auto_715972 ?auto_715980 ) ) ( not ( = ?auto_715973 ?auto_715974 ) ) ( not ( = ?auto_715973 ?auto_715975 ) ) ( not ( = ?auto_715973 ?auto_715976 ) ) ( not ( = ?auto_715973 ?auto_715977 ) ) ( not ( = ?auto_715973 ?auto_715978 ) ) ( not ( = ?auto_715973 ?auto_715979 ) ) ( not ( = ?auto_715973 ?auto_715980 ) ) ( not ( = ?auto_715974 ?auto_715975 ) ) ( not ( = ?auto_715974 ?auto_715976 ) ) ( not ( = ?auto_715974 ?auto_715977 ) ) ( not ( = ?auto_715974 ?auto_715978 ) ) ( not ( = ?auto_715974 ?auto_715979 ) ) ( not ( = ?auto_715974 ?auto_715980 ) ) ( not ( = ?auto_715975 ?auto_715976 ) ) ( not ( = ?auto_715975 ?auto_715977 ) ) ( not ( = ?auto_715975 ?auto_715978 ) ) ( not ( = ?auto_715975 ?auto_715979 ) ) ( not ( = ?auto_715975 ?auto_715980 ) ) ( not ( = ?auto_715976 ?auto_715977 ) ) ( not ( = ?auto_715976 ?auto_715978 ) ) ( not ( = ?auto_715976 ?auto_715979 ) ) ( not ( = ?auto_715976 ?auto_715980 ) ) ( not ( = ?auto_715977 ?auto_715978 ) ) ( not ( = ?auto_715977 ?auto_715979 ) ) ( not ( = ?auto_715977 ?auto_715980 ) ) ( not ( = ?auto_715978 ?auto_715979 ) ) ( not ( = ?auto_715978 ?auto_715980 ) ) ( not ( = ?auto_715979 ?auto_715980 ) ) ( ON ?auto_715978 ?auto_715979 ) ( ON ?auto_715977 ?auto_715978 ) ( ON ?auto_715976 ?auto_715977 ) ( ON ?auto_715975 ?auto_715976 ) ( ON ?auto_715974 ?auto_715975 ) ( ON ?auto_715973 ?auto_715974 ) ( ON ?auto_715972 ?auto_715973 ) ( ON ?auto_715971 ?auto_715972 ) ( ON ?auto_715970 ?auto_715971 ) ( ON ?auto_715969 ?auto_715970 ) ( ON ?auto_715968 ?auto_715969 ) ( ON ?auto_715967 ?auto_715968 ) ( ON ?auto_715966 ?auto_715967 ) ( CLEAR ?auto_715964 ) ( ON ?auto_715965 ?auto_715966 ) ( CLEAR ?auto_715965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_715964 ?auto_715965 )
      ( MAKE-16PILE ?auto_715964 ?auto_715965 ?auto_715966 ?auto_715967 ?auto_715968 ?auto_715969 ?auto_715970 ?auto_715971 ?auto_715972 ?auto_715973 ?auto_715974 ?auto_715975 ?auto_715976 ?auto_715977 ?auto_715978 ?auto_715979 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_716030 - BLOCK
      ?auto_716031 - BLOCK
      ?auto_716032 - BLOCK
      ?auto_716033 - BLOCK
      ?auto_716034 - BLOCK
      ?auto_716035 - BLOCK
      ?auto_716036 - BLOCK
      ?auto_716037 - BLOCK
      ?auto_716038 - BLOCK
      ?auto_716039 - BLOCK
      ?auto_716040 - BLOCK
      ?auto_716041 - BLOCK
      ?auto_716042 - BLOCK
      ?auto_716043 - BLOCK
      ?auto_716044 - BLOCK
      ?auto_716045 - BLOCK
    )
    :vars
    (
      ?auto_716046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716045 ?auto_716046 ) ( not ( = ?auto_716030 ?auto_716031 ) ) ( not ( = ?auto_716030 ?auto_716032 ) ) ( not ( = ?auto_716030 ?auto_716033 ) ) ( not ( = ?auto_716030 ?auto_716034 ) ) ( not ( = ?auto_716030 ?auto_716035 ) ) ( not ( = ?auto_716030 ?auto_716036 ) ) ( not ( = ?auto_716030 ?auto_716037 ) ) ( not ( = ?auto_716030 ?auto_716038 ) ) ( not ( = ?auto_716030 ?auto_716039 ) ) ( not ( = ?auto_716030 ?auto_716040 ) ) ( not ( = ?auto_716030 ?auto_716041 ) ) ( not ( = ?auto_716030 ?auto_716042 ) ) ( not ( = ?auto_716030 ?auto_716043 ) ) ( not ( = ?auto_716030 ?auto_716044 ) ) ( not ( = ?auto_716030 ?auto_716045 ) ) ( not ( = ?auto_716030 ?auto_716046 ) ) ( not ( = ?auto_716031 ?auto_716032 ) ) ( not ( = ?auto_716031 ?auto_716033 ) ) ( not ( = ?auto_716031 ?auto_716034 ) ) ( not ( = ?auto_716031 ?auto_716035 ) ) ( not ( = ?auto_716031 ?auto_716036 ) ) ( not ( = ?auto_716031 ?auto_716037 ) ) ( not ( = ?auto_716031 ?auto_716038 ) ) ( not ( = ?auto_716031 ?auto_716039 ) ) ( not ( = ?auto_716031 ?auto_716040 ) ) ( not ( = ?auto_716031 ?auto_716041 ) ) ( not ( = ?auto_716031 ?auto_716042 ) ) ( not ( = ?auto_716031 ?auto_716043 ) ) ( not ( = ?auto_716031 ?auto_716044 ) ) ( not ( = ?auto_716031 ?auto_716045 ) ) ( not ( = ?auto_716031 ?auto_716046 ) ) ( not ( = ?auto_716032 ?auto_716033 ) ) ( not ( = ?auto_716032 ?auto_716034 ) ) ( not ( = ?auto_716032 ?auto_716035 ) ) ( not ( = ?auto_716032 ?auto_716036 ) ) ( not ( = ?auto_716032 ?auto_716037 ) ) ( not ( = ?auto_716032 ?auto_716038 ) ) ( not ( = ?auto_716032 ?auto_716039 ) ) ( not ( = ?auto_716032 ?auto_716040 ) ) ( not ( = ?auto_716032 ?auto_716041 ) ) ( not ( = ?auto_716032 ?auto_716042 ) ) ( not ( = ?auto_716032 ?auto_716043 ) ) ( not ( = ?auto_716032 ?auto_716044 ) ) ( not ( = ?auto_716032 ?auto_716045 ) ) ( not ( = ?auto_716032 ?auto_716046 ) ) ( not ( = ?auto_716033 ?auto_716034 ) ) ( not ( = ?auto_716033 ?auto_716035 ) ) ( not ( = ?auto_716033 ?auto_716036 ) ) ( not ( = ?auto_716033 ?auto_716037 ) ) ( not ( = ?auto_716033 ?auto_716038 ) ) ( not ( = ?auto_716033 ?auto_716039 ) ) ( not ( = ?auto_716033 ?auto_716040 ) ) ( not ( = ?auto_716033 ?auto_716041 ) ) ( not ( = ?auto_716033 ?auto_716042 ) ) ( not ( = ?auto_716033 ?auto_716043 ) ) ( not ( = ?auto_716033 ?auto_716044 ) ) ( not ( = ?auto_716033 ?auto_716045 ) ) ( not ( = ?auto_716033 ?auto_716046 ) ) ( not ( = ?auto_716034 ?auto_716035 ) ) ( not ( = ?auto_716034 ?auto_716036 ) ) ( not ( = ?auto_716034 ?auto_716037 ) ) ( not ( = ?auto_716034 ?auto_716038 ) ) ( not ( = ?auto_716034 ?auto_716039 ) ) ( not ( = ?auto_716034 ?auto_716040 ) ) ( not ( = ?auto_716034 ?auto_716041 ) ) ( not ( = ?auto_716034 ?auto_716042 ) ) ( not ( = ?auto_716034 ?auto_716043 ) ) ( not ( = ?auto_716034 ?auto_716044 ) ) ( not ( = ?auto_716034 ?auto_716045 ) ) ( not ( = ?auto_716034 ?auto_716046 ) ) ( not ( = ?auto_716035 ?auto_716036 ) ) ( not ( = ?auto_716035 ?auto_716037 ) ) ( not ( = ?auto_716035 ?auto_716038 ) ) ( not ( = ?auto_716035 ?auto_716039 ) ) ( not ( = ?auto_716035 ?auto_716040 ) ) ( not ( = ?auto_716035 ?auto_716041 ) ) ( not ( = ?auto_716035 ?auto_716042 ) ) ( not ( = ?auto_716035 ?auto_716043 ) ) ( not ( = ?auto_716035 ?auto_716044 ) ) ( not ( = ?auto_716035 ?auto_716045 ) ) ( not ( = ?auto_716035 ?auto_716046 ) ) ( not ( = ?auto_716036 ?auto_716037 ) ) ( not ( = ?auto_716036 ?auto_716038 ) ) ( not ( = ?auto_716036 ?auto_716039 ) ) ( not ( = ?auto_716036 ?auto_716040 ) ) ( not ( = ?auto_716036 ?auto_716041 ) ) ( not ( = ?auto_716036 ?auto_716042 ) ) ( not ( = ?auto_716036 ?auto_716043 ) ) ( not ( = ?auto_716036 ?auto_716044 ) ) ( not ( = ?auto_716036 ?auto_716045 ) ) ( not ( = ?auto_716036 ?auto_716046 ) ) ( not ( = ?auto_716037 ?auto_716038 ) ) ( not ( = ?auto_716037 ?auto_716039 ) ) ( not ( = ?auto_716037 ?auto_716040 ) ) ( not ( = ?auto_716037 ?auto_716041 ) ) ( not ( = ?auto_716037 ?auto_716042 ) ) ( not ( = ?auto_716037 ?auto_716043 ) ) ( not ( = ?auto_716037 ?auto_716044 ) ) ( not ( = ?auto_716037 ?auto_716045 ) ) ( not ( = ?auto_716037 ?auto_716046 ) ) ( not ( = ?auto_716038 ?auto_716039 ) ) ( not ( = ?auto_716038 ?auto_716040 ) ) ( not ( = ?auto_716038 ?auto_716041 ) ) ( not ( = ?auto_716038 ?auto_716042 ) ) ( not ( = ?auto_716038 ?auto_716043 ) ) ( not ( = ?auto_716038 ?auto_716044 ) ) ( not ( = ?auto_716038 ?auto_716045 ) ) ( not ( = ?auto_716038 ?auto_716046 ) ) ( not ( = ?auto_716039 ?auto_716040 ) ) ( not ( = ?auto_716039 ?auto_716041 ) ) ( not ( = ?auto_716039 ?auto_716042 ) ) ( not ( = ?auto_716039 ?auto_716043 ) ) ( not ( = ?auto_716039 ?auto_716044 ) ) ( not ( = ?auto_716039 ?auto_716045 ) ) ( not ( = ?auto_716039 ?auto_716046 ) ) ( not ( = ?auto_716040 ?auto_716041 ) ) ( not ( = ?auto_716040 ?auto_716042 ) ) ( not ( = ?auto_716040 ?auto_716043 ) ) ( not ( = ?auto_716040 ?auto_716044 ) ) ( not ( = ?auto_716040 ?auto_716045 ) ) ( not ( = ?auto_716040 ?auto_716046 ) ) ( not ( = ?auto_716041 ?auto_716042 ) ) ( not ( = ?auto_716041 ?auto_716043 ) ) ( not ( = ?auto_716041 ?auto_716044 ) ) ( not ( = ?auto_716041 ?auto_716045 ) ) ( not ( = ?auto_716041 ?auto_716046 ) ) ( not ( = ?auto_716042 ?auto_716043 ) ) ( not ( = ?auto_716042 ?auto_716044 ) ) ( not ( = ?auto_716042 ?auto_716045 ) ) ( not ( = ?auto_716042 ?auto_716046 ) ) ( not ( = ?auto_716043 ?auto_716044 ) ) ( not ( = ?auto_716043 ?auto_716045 ) ) ( not ( = ?auto_716043 ?auto_716046 ) ) ( not ( = ?auto_716044 ?auto_716045 ) ) ( not ( = ?auto_716044 ?auto_716046 ) ) ( not ( = ?auto_716045 ?auto_716046 ) ) ( ON ?auto_716044 ?auto_716045 ) ( ON ?auto_716043 ?auto_716044 ) ( ON ?auto_716042 ?auto_716043 ) ( ON ?auto_716041 ?auto_716042 ) ( ON ?auto_716040 ?auto_716041 ) ( ON ?auto_716039 ?auto_716040 ) ( ON ?auto_716038 ?auto_716039 ) ( ON ?auto_716037 ?auto_716038 ) ( ON ?auto_716036 ?auto_716037 ) ( ON ?auto_716035 ?auto_716036 ) ( ON ?auto_716034 ?auto_716035 ) ( ON ?auto_716033 ?auto_716034 ) ( ON ?auto_716032 ?auto_716033 ) ( ON ?auto_716031 ?auto_716032 ) ( ON ?auto_716030 ?auto_716031 ) ( CLEAR ?auto_716030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_716030 )
      ( MAKE-16PILE ?auto_716030 ?auto_716031 ?auto_716032 ?auto_716033 ?auto_716034 ?auto_716035 ?auto_716036 ?auto_716037 ?auto_716038 ?auto_716039 ?auto_716040 ?auto_716041 ?auto_716042 ?auto_716043 ?auto_716044 ?auto_716045 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716097 - BLOCK
      ?auto_716098 - BLOCK
      ?auto_716099 - BLOCK
      ?auto_716100 - BLOCK
      ?auto_716101 - BLOCK
      ?auto_716102 - BLOCK
      ?auto_716103 - BLOCK
      ?auto_716104 - BLOCK
      ?auto_716105 - BLOCK
      ?auto_716106 - BLOCK
      ?auto_716107 - BLOCK
      ?auto_716108 - BLOCK
      ?auto_716109 - BLOCK
      ?auto_716110 - BLOCK
      ?auto_716111 - BLOCK
      ?auto_716112 - BLOCK
      ?auto_716113 - BLOCK
    )
    :vars
    (
      ?auto_716114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_716112 ) ( ON ?auto_716113 ?auto_716114 ) ( CLEAR ?auto_716113 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_716097 ) ( ON ?auto_716098 ?auto_716097 ) ( ON ?auto_716099 ?auto_716098 ) ( ON ?auto_716100 ?auto_716099 ) ( ON ?auto_716101 ?auto_716100 ) ( ON ?auto_716102 ?auto_716101 ) ( ON ?auto_716103 ?auto_716102 ) ( ON ?auto_716104 ?auto_716103 ) ( ON ?auto_716105 ?auto_716104 ) ( ON ?auto_716106 ?auto_716105 ) ( ON ?auto_716107 ?auto_716106 ) ( ON ?auto_716108 ?auto_716107 ) ( ON ?auto_716109 ?auto_716108 ) ( ON ?auto_716110 ?auto_716109 ) ( ON ?auto_716111 ?auto_716110 ) ( ON ?auto_716112 ?auto_716111 ) ( not ( = ?auto_716097 ?auto_716098 ) ) ( not ( = ?auto_716097 ?auto_716099 ) ) ( not ( = ?auto_716097 ?auto_716100 ) ) ( not ( = ?auto_716097 ?auto_716101 ) ) ( not ( = ?auto_716097 ?auto_716102 ) ) ( not ( = ?auto_716097 ?auto_716103 ) ) ( not ( = ?auto_716097 ?auto_716104 ) ) ( not ( = ?auto_716097 ?auto_716105 ) ) ( not ( = ?auto_716097 ?auto_716106 ) ) ( not ( = ?auto_716097 ?auto_716107 ) ) ( not ( = ?auto_716097 ?auto_716108 ) ) ( not ( = ?auto_716097 ?auto_716109 ) ) ( not ( = ?auto_716097 ?auto_716110 ) ) ( not ( = ?auto_716097 ?auto_716111 ) ) ( not ( = ?auto_716097 ?auto_716112 ) ) ( not ( = ?auto_716097 ?auto_716113 ) ) ( not ( = ?auto_716097 ?auto_716114 ) ) ( not ( = ?auto_716098 ?auto_716099 ) ) ( not ( = ?auto_716098 ?auto_716100 ) ) ( not ( = ?auto_716098 ?auto_716101 ) ) ( not ( = ?auto_716098 ?auto_716102 ) ) ( not ( = ?auto_716098 ?auto_716103 ) ) ( not ( = ?auto_716098 ?auto_716104 ) ) ( not ( = ?auto_716098 ?auto_716105 ) ) ( not ( = ?auto_716098 ?auto_716106 ) ) ( not ( = ?auto_716098 ?auto_716107 ) ) ( not ( = ?auto_716098 ?auto_716108 ) ) ( not ( = ?auto_716098 ?auto_716109 ) ) ( not ( = ?auto_716098 ?auto_716110 ) ) ( not ( = ?auto_716098 ?auto_716111 ) ) ( not ( = ?auto_716098 ?auto_716112 ) ) ( not ( = ?auto_716098 ?auto_716113 ) ) ( not ( = ?auto_716098 ?auto_716114 ) ) ( not ( = ?auto_716099 ?auto_716100 ) ) ( not ( = ?auto_716099 ?auto_716101 ) ) ( not ( = ?auto_716099 ?auto_716102 ) ) ( not ( = ?auto_716099 ?auto_716103 ) ) ( not ( = ?auto_716099 ?auto_716104 ) ) ( not ( = ?auto_716099 ?auto_716105 ) ) ( not ( = ?auto_716099 ?auto_716106 ) ) ( not ( = ?auto_716099 ?auto_716107 ) ) ( not ( = ?auto_716099 ?auto_716108 ) ) ( not ( = ?auto_716099 ?auto_716109 ) ) ( not ( = ?auto_716099 ?auto_716110 ) ) ( not ( = ?auto_716099 ?auto_716111 ) ) ( not ( = ?auto_716099 ?auto_716112 ) ) ( not ( = ?auto_716099 ?auto_716113 ) ) ( not ( = ?auto_716099 ?auto_716114 ) ) ( not ( = ?auto_716100 ?auto_716101 ) ) ( not ( = ?auto_716100 ?auto_716102 ) ) ( not ( = ?auto_716100 ?auto_716103 ) ) ( not ( = ?auto_716100 ?auto_716104 ) ) ( not ( = ?auto_716100 ?auto_716105 ) ) ( not ( = ?auto_716100 ?auto_716106 ) ) ( not ( = ?auto_716100 ?auto_716107 ) ) ( not ( = ?auto_716100 ?auto_716108 ) ) ( not ( = ?auto_716100 ?auto_716109 ) ) ( not ( = ?auto_716100 ?auto_716110 ) ) ( not ( = ?auto_716100 ?auto_716111 ) ) ( not ( = ?auto_716100 ?auto_716112 ) ) ( not ( = ?auto_716100 ?auto_716113 ) ) ( not ( = ?auto_716100 ?auto_716114 ) ) ( not ( = ?auto_716101 ?auto_716102 ) ) ( not ( = ?auto_716101 ?auto_716103 ) ) ( not ( = ?auto_716101 ?auto_716104 ) ) ( not ( = ?auto_716101 ?auto_716105 ) ) ( not ( = ?auto_716101 ?auto_716106 ) ) ( not ( = ?auto_716101 ?auto_716107 ) ) ( not ( = ?auto_716101 ?auto_716108 ) ) ( not ( = ?auto_716101 ?auto_716109 ) ) ( not ( = ?auto_716101 ?auto_716110 ) ) ( not ( = ?auto_716101 ?auto_716111 ) ) ( not ( = ?auto_716101 ?auto_716112 ) ) ( not ( = ?auto_716101 ?auto_716113 ) ) ( not ( = ?auto_716101 ?auto_716114 ) ) ( not ( = ?auto_716102 ?auto_716103 ) ) ( not ( = ?auto_716102 ?auto_716104 ) ) ( not ( = ?auto_716102 ?auto_716105 ) ) ( not ( = ?auto_716102 ?auto_716106 ) ) ( not ( = ?auto_716102 ?auto_716107 ) ) ( not ( = ?auto_716102 ?auto_716108 ) ) ( not ( = ?auto_716102 ?auto_716109 ) ) ( not ( = ?auto_716102 ?auto_716110 ) ) ( not ( = ?auto_716102 ?auto_716111 ) ) ( not ( = ?auto_716102 ?auto_716112 ) ) ( not ( = ?auto_716102 ?auto_716113 ) ) ( not ( = ?auto_716102 ?auto_716114 ) ) ( not ( = ?auto_716103 ?auto_716104 ) ) ( not ( = ?auto_716103 ?auto_716105 ) ) ( not ( = ?auto_716103 ?auto_716106 ) ) ( not ( = ?auto_716103 ?auto_716107 ) ) ( not ( = ?auto_716103 ?auto_716108 ) ) ( not ( = ?auto_716103 ?auto_716109 ) ) ( not ( = ?auto_716103 ?auto_716110 ) ) ( not ( = ?auto_716103 ?auto_716111 ) ) ( not ( = ?auto_716103 ?auto_716112 ) ) ( not ( = ?auto_716103 ?auto_716113 ) ) ( not ( = ?auto_716103 ?auto_716114 ) ) ( not ( = ?auto_716104 ?auto_716105 ) ) ( not ( = ?auto_716104 ?auto_716106 ) ) ( not ( = ?auto_716104 ?auto_716107 ) ) ( not ( = ?auto_716104 ?auto_716108 ) ) ( not ( = ?auto_716104 ?auto_716109 ) ) ( not ( = ?auto_716104 ?auto_716110 ) ) ( not ( = ?auto_716104 ?auto_716111 ) ) ( not ( = ?auto_716104 ?auto_716112 ) ) ( not ( = ?auto_716104 ?auto_716113 ) ) ( not ( = ?auto_716104 ?auto_716114 ) ) ( not ( = ?auto_716105 ?auto_716106 ) ) ( not ( = ?auto_716105 ?auto_716107 ) ) ( not ( = ?auto_716105 ?auto_716108 ) ) ( not ( = ?auto_716105 ?auto_716109 ) ) ( not ( = ?auto_716105 ?auto_716110 ) ) ( not ( = ?auto_716105 ?auto_716111 ) ) ( not ( = ?auto_716105 ?auto_716112 ) ) ( not ( = ?auto_716105 ?auto_716113 ) ) ( not ( = ?auto_716105 ?auto_716114 ) ) ( not ( = ?auto_716106 ?auto_716107 ) ) ( not ( = ?auto_716106 ?auto_716108 ) ) ( not ( = ?auto_716106 ?auto_716109 ) ) ( not ( = ?auto_716106 ?auto_716110 ) ) ( not ( = ?auto_716106 ?auto_716111 ) ) ( not ( = ?auto_716106 ?auto_716112 ) ) ( not ( = ?auto_716106 ?auto_716113 ) ) ( not ( = ?auto_716106 ?auto_716114 ) ) ( not ( = ?auto_716107 ?auto_716108 ) ) ( not ( = ?auto_716107 ?auto_716109 ) ) ( not ( = ?auto_716107 ?auto_716110 ) ) ( not ( = ?auto_716107 ?auto_716111 ) ) ( not ( = ?auto_716107 ?auto_716112 ) ) ( not ( = ?auto_716107 ?auto_716113 ) ) ( not ( = ?auto_716107 ?auto_716114 ) ) ( not ( = ?auto_716108 ?auto_716109 ) ) ( not ( = ?auto_716108 ?auto_716110 ) ) ( not ( = ?auto_716108 ?auto_716111 ) ) ( not ( = ?auto_716108 ?auto_716112 ) ) ( not ( = ?auto_716108 ?auto_716113 ) ) ( not ( = ?auto_716108 ?auto_716114 ) ) ( not ( = ?auto_716109 ?auto_716110 ) ) ( not ( = ?auto_716109 ?auto_716111 ) ) ( not ( = ?auto_716109 ?auto_716112 ) ) ( not ( = ?auto_716109 ?auto_716113 ) ) ( not ( = ?auto_716109 ?auto_716114 ) ) ( not ( = ?auto_716110 ?auto_716111 ) ) ( not ( = ?auto_716110 ?auto_716112 ) ) ( not ( = ?auto_716110 ?auto_716113 ) ) ( not ( = ?auto_716110 ?auto_716114 ) ) ( not ( = ?auto_716111 ?auto_716112 ) ) ( not ( = ?auto_716111 ?auto_716113 ) ) ( not ( = ?auto_716111 ?auto_716114 ) ) ( not ( = ?auto_716112 ?auto_716113 ) ) ( not ( = ?auto_716112 ?auto_716114 ) ) ( not ( = ?auto_716113 ?auto_716114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_716113 ?auto_716114 )
      ( !STACK ?auto_716113 ?auto_716112 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716132 - BLOCK
      ?auto_716133 - BLOCK
      ?auto_716134 - BLOCK
      ?auto_716135 - BLOCK
      ?auto_716136 - BLOCK
      ?auto_716137 - BLOCK
      ?auto_716138 - BLOCK
      ?auto_716139 - BLOCK
      ?auto_716140 - BLOCK
      ?auto_716141 - BLOCK
      ?auto_716142 - BLOCK
      ?auto_716143 - BLOCK
      ?auto_716144 - BLOCK
      ?auto_716145 - BLOCK
      ?auto_716146 - BLOCK
      ?auto_716147 - BLOCK
      ?auto_716148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_716147 ) ( ON-TABLE ?auto_716148 ) ( CLEAR ?auto_716148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_716132 ) ( ON ?auto_716133 ?auto_716132 ) ( ON ?auto_716134 ?auto_716133 ) ( ON ?auto_716135 ?auto_716134 ) ( ON ?auto_716136 ?auto_716135 ) ( ON ?auto_716137 ?auto_716136 ) ( ON ?auto_716138 ?auto_716137 ) ( ON ?auto_716139 ?auto_716138 ) ( ON ?auto_716140 ?auto_716139 ) ( ON ?auto_716141 ?auto_716140 ) ( ON ?auto_716142 ?auto_716141 ) ( ON ?auto_716143 ?auto_716142 ) ( ON ?auto_716144 ?auto_716143 ) ( ON ?auto_716145 ?auto_716144 ) ( ON ?auto_716146 ?auto_716145 ) ( ON ?auto_716147 ?auto_716146 ) ( not ( = ?auto_716132 ?auto_716133 ) ) ( not ( = ?auto_716132 ?auto_716134 ) ) ( not ( = ?auto_716132 ?auto_716135 ) ) ( not ( = ?auto_716132 ?auto_716136 ) ) ( not ( = ?auto_716132 ?auto_716137 ) ) ( not ( = ?auto_716132 ?auto_716138 ) ) ( not ( = ?auto_716132 ?auto_716139 ) ) ( not ( = ?auto_716132 ?auto_716140 ) ) ( not ( = ?auto_716132 ?auto_716141 ) ) ( not ( = ?auto_716132 ?auto_716142 ) ) ( not ( = ?auto_716132 ?auto_716143 ) ) ( not ( = ?auto_716132 ?auto_716144 ) ) ( not ( = ?auto_716132 ?auto_716145 ) ) ( not ( = ?auto_716132 ?auto_716146 ) ) ( not ( = ?auto_716132 ?auto_716147 ) ) ( not ( = ?auto_716132 ?auto_716148 ) ) ( not ( = ?auto_716133 ?auto_716134 ) ) ( not ( = ?auto_716133 ?auto_716135 ) ) ( not ( = ?auto_716133 ?auto_716136 ) ) ( not ( = ?auto_716133 ?auto_716137 ) ) ( not ( = ?auto_716133 ?auto_716138 ) ) ( not ( = ?auto_716133 ?auto_716139 ) ) ( not ( = ?auto_716133 ?auto_716140 ) ) ( not ( = ?auto_716133 ?auto_716141 ) ) ( not ( = ?auto_716133 ?auto_716142 ) ) ( not ( = ?auto_716133 ?auto_716143 ) ) ( not ( = ?auto_716133 ?auto_716144 ) ) ( not ( = ?auto_716133 ?auto_716145 ) ) ( not ( = ?auto_716133 ?auto_716146 ) ) ( not ( = ?auto_716133 ?auto_716147 ) ) ( not ( = ?auto_716133 ?auto_716148 ) ) ( not ( = ?auto_716134 ?auto_716135 ) ) ( not ( = ?auto_716134 ?auto_716136 ) ) ( not ( = ?auto_716134 ?auto_716137 ) ) ( not ( = ?auto_716134 ?auto_716138 ) ) ( not ( = ?auto_716134 ?auto_716139 ) ) ( not ( = ?auto_716134 ?auto_716140 ) ) ( not ( = ?auto_716134 ?auto_716141 ) ) ( not ( = ?auto_716134 ?auto_716142 ) ) ( not ( = ?auto_716134 ?auto_716143 ) ) ( not ( = ?auto_716134 ?auto_716144 ) ) ( not ( = ?auto_716134 ?auto_716145 ) ) ( not ( = ?auto_716134 ?auto_716146 ) ) ( not ( = ?auto_716134 ?auto_716147 ) ) ( not ( = ?auto_716134 ?auto_716148 ) ) ( not ( = ?auto_716135 ?auto_716136 ) ) ( not ( = ?auto_716135 ?auto_716137 ) ) ( not ( = ?auto_716135 ?auto_716138 ) ) ( not ( = ?auto_716135 ?auto_716139 ) ) ( not ( = ?auto_716135 ?auto_716140 ) ) ( not ( = ?auto_716135 ?auto_716141 ) ) ( not ( = ?auto_716135 ?auto_716142 ) ) ( not ( = ?auto_716135 ?auto_716143 ) ) ( not ( = ?auto_716135 ?auto_716144 ) ) ( not ( = ?auto_716135 ?auto_716145 ) ) ( not ( = ?auto_716135 ?auto_716146 ) ) ( not ( = ?auto_716135 ?auto_716147 ) ) ( not ( = ?auto_716135 ?auto_716148 ) ) ( not ( = ?auto_716136 ?auto_716137 ) ) ( not ( = ?auto_716136 ?auto_716138 ) ) ( not ( = ?auto_716136 ?auto_716139 ) ) ( not ( = ?auto_716136 ?auto_716140 ) ) ( not ( = ?auto_716136 ?auto_716141 ) ) ( not ( = ?auto_716136 ?auto_716142 ) ) ( not ( = ?auto_716136 ?auto_716143 ) ) ( not ( = ?auto_716136 ?auto_716144 ) ) ( not ( = ?auto_716136 ?auto_716145 ) ) ( not ( = ?auto_716136 ?auto_716146 ) ) ( not ( = ?auto_716136 ?auto_716147 ) ) ( not ( = ?auto_716136 ?auto_716148 ) ) ( not ( = ?auto_716137 ?auto_716138 ) ) ( not ( = ?auto_716137 ?auto_716139 ) ) ( not ( = ?auto_716137 ?auto_716140 ) ) ( not ( = ?auto_716137 ?auto_716141 ) ) ( not ( = ?auto_716137 ?auto_716142 ) ) ( not ( = ?auto_716137 ?auto_716143 ) ) ( not ( = ?auto_716137 ?auto_716144 ) ) ( not ( = ?auto_716137 ?auto_716145 ) ) ( not ( = ?auto_716137 ?auto_716146 ) ) ( not ( = ?auto_716137 ?auto_716147 ) ) ( not ( = ?auto_716137 ?auto_716148 ) ) ( not ( = ?auto_716138 ?auto_716139 ) ) ( not ( = ?auto_716138 ?auto_716140 ) ) ( not ( = ?auto_716138 ?auto_716141 ) ) ( not ( = ?auto_716138 ?auto_716142 ) ) ( not ( = ?auto_716138 ?auto_716143 ) ) ( not ( = ?auto_716138 ?auto_716144 ) ) ( not ( = ?auto_716138 ?auto_716145 ) ) ( not ( = ?auto_716138 ?auto_716146 ) ) ( not ( = ?auto_716138 ?auto_716147 ) ) ( not ( = ?auto_716138 ?auto_716148 ) ) ( not ( = ?auto_716139 ?auto_716140 ) ) ( not ( = ?auto_716139 ?auto_716141 ) ) ( not ( = ?auto_716139 ?auto_716142 ) ) ( not ( = ?auto_716139 ?auto_716143 ) ) ( not ( = ?auto_716139 ?auto_716144 ) ) ( not ( = ?auto_716139 ?auto_716145 ) ) ( not ( = ?auto_716139 ?auto_716146 ) ) ( not ( = ?auto_716139 ?auto_716147 ) ) ( not ( = ?auto_716139 ?auto_716148 ) ) ( not ( = ?auto_716140 ?auto_716141 ) ) ( not ( = ?auto_716140 ?auto_716142 ) ) ( not ( = ?auto_716140 ?auto_716143 ) ) ( not ( = ?auto_716140 ?auto_716144 ) ) ( not ( = ?auto_716140 ?auto_716145 ) ) ( not ( = ?auto_716140 ?auto_716146 ) ) ( not ( = ?auto_716140 ?auto_716147 ) ) ( not ( = ?auto_716140 ?auto_716148 ) ) ( not ( = ?auto_716141 ?auto_716142 ) ) ( not ( = ?auto_716141 ?auto_716143 ) ) ( not ( = ?auto_716141 ?auto_716144 ) ) ( not ( = ?auto_716141 ?auto_716145 ) ) ( not ( = ?auto_716141 ?auto_716146 ) ) ( not ( = ?auto_716141 ?auto_716147 ) ) ( not ( = ?auto_716141 ?auto_716148 ) ) ( not ( = ?auto_716142 ?auto_716143 ) ) ( not ( = ?auto_716142 ?auto_716144 ) ) ( not ( = ?auto_716142 ?auto_716145 ) ) ( not ( = ?auto_716142 ?auto_716146 ) ) ( not ( = ?auto_716142 ?auto_716147 ) ) ( not ( = ?auto_716142 ?auto_716148 ) ) ( not ( = ?auto_716143 ?auto_716144 ) ) ( not ( = ?auto_716143 ?auto_716145 ) ) ( not ( = ?auto_716143 ?auto_716146 ) ) ( not ( = ?auto_716143 ?auto_716147 ) ) ( not ( = ?auto_716143 ?auto_716148 ) ) ( not ( = ?auto_716144 ?auto_716145 ) ) ( not ( = ?auto_716144 ?auto_716146 ) ) ( not ( = ?auto_716144 ?auto_716147 ) ) ( not ( = ?auto_716144 ?auto_716148 ) ) ( not ( = ?auto_716145 ?auto_716146 ) ) ( not ( = ?auto_716145 ?auto_716147 ) ) ( not ( = ?auto_716145 ?auto_716148 ) ) ( not ( = ?auto_716146 ?auto_716147 ) ) ( not ( = ?auto_716146 ?auto_716148 ) ) ( not ( = ?auto_716147 ?auto_716148 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_716148 )
      ( !STACK ?auto_716148 ?auto_716147 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716166 - BLOCK
      ?auto_716167 - BLOCK
      ?auto_716168 - BLOCK
      ?auto_716169 - BLOCK
      ?auto_716170 - BLOCK
      ?auto_716171 - BLOCK
      ?auto_716172 - BLOCK
      ?auto_716173 - BLOCK
      ?auto_716174 - BLOCK
      ?auto_716175 - BLOCK
      ?auto_716176 - BLOCK
      ?auto_716177 - BLOCK
      ?auto_716178 - BLOCK
      ?auto_716179 - BLOCK
      ?auto_716180 - BLOCK
      ?auto_716181 - BLOCK
      ?auto_716182 - BLOCK
    )
    :vars
    (
      ?auto_716183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716182 ?auto_716183 ) ( ON-TABLE ?auto_716166 ) ( ON ?auto_716167 ?auto_716166 ) ( ON ?auto_716168 ?auto_716167 ) ( ON ?auto_716169 ?auto_716168 ) ( ON ?auto_716170 ?auto_716169 ) ( ON ?auto_716171 ?auto_716170 ) ( ON ?auto_716172 ?auto_716171 ) ( ON ?auto_716173 ?auto_716172 ) ( ON ?auto_716174 ?auto_716173 ) ( ON ?auto_716175 ?auto_716174 ) ( ON ?auto_716176 ?auto_716175 ) ( ON ?auto_716177 ?auto_716176 ) ( ON ?auto_716178 ?auto_716177 ) ( ON ?auto_716179 ?auto_716178 ) ( ON ?auto_716180 ?auto_716179 ) ( not ( = ?auto_716166 ?auto_716167 ) ) ( not ( = ?auto_716166 ?auto_716168 ) ) ( not ( = ?auto_716166 ?auto_716169 ) ) ( not ( = ?auto_716166 ?auto_716170 ) ) ( not ( = ?auto_716166 ?auto_716171 ) ) ( not ( = ?auto_716166 ?auto_716172 ) ) ( not ( = ?auto_716166 ?auto_716173 ) ) ( not ( = ?auto_716166 ?auto_716174 ) ) ( not ( = ?auto_716166 ?auto_716175 ) ) ( not ( = ?auto_716166 ?auto_716176 ) ) ( not ( = ?auto_716166 ?auto_716177 ) ) ( not ( = ?auto_716166 ?auto_716178 ) ) ( not ( = ?auto_716166 ?auto_716179 ) ) ( not ( = ?auto_716166 ?auto_716180 ) ) ( not ( = ?auto_716166 ?auto_716181 ) ) ( not ( = ?auto_716166 ?auto_716182 ) ) ( not ( = ?auto_716166 ?auto_716183 ) ) ( not ( = ?auto_716167 ?auto_716168 ) ) ( not ( = ?auto_716167 ?auto_716169 ) ) ( not ( = ?auto_716167 ?auto_716170 ) ) ( not ( = ?auto_716167 ?auto_716171 ) ) ( not ( = ?auto_716167 ?auto_716172 ) ) ( not ( = ?auto_716167 ?auto_716173 ) ) ( not ( = ?auto_716167 ?auto_716174 ) ) ( not ( = ?auto_716167 ?auto_716175 ) ) ( not ( = ?auto_716167 ?auto_716176 ) ) ( not ( = ?auto_716167 ?auto_716177 ) ) ( not ( = ?auto_716167 ?auto_716178 ) ) ( not ( = ?auto_716167 ?auto_716179 ) ) ( not ( = ?auto_716167 ?auto_716180 ) ) ( not ( = ?auto_716167 ?auto_716181 ) ) ( not ( = ?auto_716167 ?auto_716182 ) ) ( not ( = ?auto_716167 ?auto_716183 ) ) ( not ( = ?auto_716168 ?auto_716169 ) ) ( not ( = ?auto_716168 ?auto_716170 ) ) ( not ( = ?auto_716168 ?auto_716171 ) ) ( not ( = ?auto_716168 ?auto_716172 ) ) ( not ( = ?auto_716168 ?auto_716173 ) ) ( not ( = ?auto_716168 ?auto_716174 ) ) ( not ( = ?auto_716168 ?auto_716175 ) ) ( not ( = ?auto_716168 ?auto_716176 ) ) ( not ( = ?auto_716168 ?auto_716177 ) ) ( not ( = ?auto_716168 ?auto_716178 ) ) ( not ( = ?auto_716168 ?auto_716179 ) ) ( not ( = ?auto_716168 ?auto_716180 ) ) ( not ( = ?auto_716168 ?auto_716181 ) ) ( not ( = ?auto_716168 ?auto_716182 ) ) ( not ( = ?auto_716168 ?auto_716183 ) ) ( not ( = ?auto_716169 ?auto_716170 ) ) ( not ( = ?auto_716169 ?auto_716171 ) ) ( not ( = ?auto_716169 ?auto_716172 ) ) ( not ( = ?auto_716169 ?auto_716173 ) ) ( not ( = ?auto_716169 ?auto_716174 ) ) ( not ( = ?auto_716169 ?auto_716175 ) ) ( not ( = ?auto_716169 ?auto_716176 ) ) ( not ( = ?auto_716169 ?auto_716177 ) ) ( not ( = ?auto_716169 ?auto_716178 ) ) ( not ( = ?auto_716169 ?auto_716179 ) ) ( not ( = ?auto_716169 ?auto_716180 ) ) ( not ( = ?auto_716169 ?auto_716181 ) ) ( not ( = ?auto_716169 ?auto_716182 ) ) ( not ( = ?auto_716169 ?auto_716183 ) ) ( not ( = ?auto_716170 ?auto_716171 ) ) ( not ( = ?auto_716170 ?auto_716172 ) ) ( not ( = ?auto_716170 ?auto_716173 ) ) ( not ( = ?auto_716170 ?auto_716174 ) ) ( not ( = ?auto_716170 ?auto_716175 ) ) ( not ( = ?auto_716170 ?auto_716176 ) ) ( not ( = ?auto_716170 ?auto_716177 ) ) ( not ( = ?auto_716170 ?auto_716178 ) ) ( not ( = ?auto_716170 ?auto_716179 ) ) ( not ( = ?auto_716170 ?auto_716180 ) ) ( not ( = ?auto_716170 ?auto_716181 ) ) ( not ( = ?auto_716170 ?auto_716182 ) ) ( not ( = ?auto_716170 ?auto_716183 ) ) ( not ( = ?auto_716171 ?auto_716172 ) ) ( not ( = ?auto_716171 ?auto_716173 ) ) ( not ( = ?auto_716171 ?auto_716174 ) ) ( not ( = ?auto_716171 ?auto_716175 ) ) ( not ( = ?auto_716171 ?auto_716176 ) ) ( not ( = ?auto_716171 ?auto_716177 ) ) ( not ( = ?auto_716171 ?auto_716178 ) ) ( not ( = ?auto_716171 ?auto_716179 ) ) ( not ( = ?auto_716171 ?auto_716180 ) ) ( not ( = ?auto_716171 ?auto_716181 ) ) ( not ( = ?auto_716171 ?auto_716182 ) ) ( not ( = ?auto_716171 ?auto_716183 ) ) ( not ( = ?auto_716172 ?auto_716173 ) ) ( not ( = ?auto_716172 ?auto_716174 ) ) ( not ( = ?auto_716172 ?auto_716175 ) ) ( not ( = ?auto_716172 ?auto_716176 ) ) ( not ( = ?auto_716172 ?auto_716177 ) ) ( not ( = ?auto_716172 ?auto_716178 ) ) ( not ( = ?auto_716172 ?auto_716179 ) ) ( not ( = ?auto_716172 ?auto_716180 ) ) ( not ( = ?auto_716172 ?auto_716181 ) ) ( not ( = ?auto_716172 ?auto_716182 ) ) ( not ( = ?auto_716172 ?auto_716183 ) ) ( not ( = ?auto_716173 ?auto_716174 ) ) ( not ( = ?auto_716173 ?auto_716175 ) ) ( not ( = ?auto_716173 ?auto_716176 ) ) ( not ( = ?auto_716173 ?auto_716177 ) ) ( not ( = ?auto_716173 ?auto_716178 ) ) ( not ( = ?auto_716173 ?auto_716179 ) ) ( not ( = ?auto_716173 ?auto_716180 ) ) ( not ( = ?auto_716173 ?auto_716181 ) ) ( not ( = ?auto_716173 ?auto_716182 ) ) ( not ( = ?auto_716173 ?auto_716183 ) ) ( not ( = ?auto_716174 ?auto_716175 ) ) ( not ( = ?auto_716174 ?auto_716176 ) ) ( not ( = ?auto_716174 ?auto_716177 ) ) ( not ( = ?auto_716174 ?auto_716178 ) ) ( not ( = ?auto_716174 ?auto_716179 ) ) ( not ( = ?auto_716174 ?auto_716180 ) ) ( not ( = ?auto_716174 ?auto_716181 ) ) ( not ( = ?auto_716174 ?auto_716182 ) ) ( not ( = ?auto_716174 ?auto_716183 ) ) ( not ( = ?auto_716175 ?auto_716176 ) ) ( not ( = ?auto_716175 ?auto_716177 ) ) ( not ( = ?auto_716175 ?auto_716178 ) ) ( not ( = ?auto_716175 ?auto_716179 ) ) ( not ( = ?auto_716175 ?auto_716180 ) ) ( not ( = ?auto_716175 ?auto_716181 ) ) ( not ( = ?auto_716175 ?auto_716182 ) ) ( not ( = ?auto_716175 ?auto_716183 ) ) ( not ( = ?auto_716176 ?auto_716177 ) ) ( not ( = ?auto_716176 ?auto_716178 ) ) ( not ( = ?auto_716176 ?auto_716179 ) ) ( not ( = ?auto_716176 ?auto_716180 ) ) ( not ( = ?auto_716176 ?auto_716181 ) ) ( not ( = ?auto_716176 ?auto_716182 ) ) ( not ( = ?auto_716176 ?auto_716183 ) ) ( not ( = ?auto_716177 ?auto_716178 ) ) ( not ( = ?auto_716177 ?auto_716179 ) ) ( not ( = ?auto_716177 ?auto_716180 ) ) ( not ( = ?auto_716177 ?auto_716181 ) ) ( not ( = ?auto_716177 ?auto_716182 ) ) ( not ( = ?auto_716177 ?auto_716183 ) ) ( not ( = ?auto_716178 ?auto_716179 ) ) ( not ( = ?auto_716178 ?auto_716180 ) ) ( not ( = ?auto_716178 ?auto_716181 ) ) ( not ( = ?auto_716178 ?auto_716182 ) ) ( not ( = ?auto_716178 ?auto_716183 ) ) ( not ( = ?auto_716179 ?auto_716180 ) ) ( not ( = ?auto_716179 ?auto_716181 ) ) ( not ( = ?auto_716179 ?auto_716182 ) ) ( not ( = ?auto_716179 ?auto_716183 ) ) ( not ( = ?auto_716180 ?auto_716181 ) ) ( not ( = ?auto_716180 ?auto_716182 ) ) ( not ( = ?auto_716180 ?auto_716183 ) ) ( not ( = ?auto_716181 ?auto_716182 ) ) ( not ( = ?auto_716181 ?auto_716183 ) ) ( not ( = ?auto_716182 ?auto_716183 ) ) ( CLEAR ?auto_716180 ) ( ON ?auto_716181 ?auto_716182 ) ( CLEAR ?auto_716181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_716166 ?auto_716167 ?auto_716168 ?auto_716169 ?auto_716170 ?auto_716171 ?auto_716172 ?auto_716173 ?auto_716174 ?auto_716175 ?auto_716176 ?auto_716177 ?auto_716178 ?auto_716179 ?auto_716180 ?auto_716181 )
      ( MAKE-17PILE ?auto_716166 ?auto_716167 ?auto_716168 ?auto_716169 ?auto_716170 ?auto_716171 ?auto_716172 ?auto_716173 ?auto_716174 ?auto_716175 ?auto_716176 ?auto_716177 ?auto_716178 ?auto_716179 ?auto_716180 ?auto_716181 ?auto_716182 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716201 - BLOCK
      ?auto_716202 - BLOCK
      ?auto_716203 - BLOCK
      ?auto_716204 - BLOCK
      ?auto_716205 - BLOCK
      ?auto_716206 - BLOCK
      ?auto_716207 - BLOCK
      ?auto_716208 - BLOCK
      ?auto_716209 - BLOCK
      ?auto_716210 - BLOCK
      ?auto_716211 - BLOCK
      ?auto_716212 - BLOCK
      ?auto_716213 - BLOCK
      ?auto_716214 - BLOCK
      ?auto_716215 - BLOCK
      ?auto_716216 - BLOCK
      ?auto_716217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716217 ) ( ON-TABLE ?auto_716201 ) ( ON ?auto_716202 ?auto_716201 ) ( ON ?auto_716203 ?auto_716202 ) ( ON ?auto_716204 ?auto_716203 ) ( ON ?auto_716205 ?auto_716204 ) ( ON ?auto_716206 ?auto_716205 ) ( ON ?auto_716207 ?auto_716206 ) ( ON ?auto_716208 ?auto_716207 ) ( ON ?auto_716209 ?auto_716208 ) ( ON ?auto_716210 ?auto_716209 ) ( ON ?auto_716211 ?auto_716210 ) ( ON ?auto_716212 ?auto_716211 ) ( ON ?auto_716213 ?auto_716212 ) ( ON ?auto_716214 ?auto_716213 ) ( ON ?auto_716215 ?auto_716214 ) ( not ( = ?auto_716201 ?auto_716202 ) ) ( not ( = ?auto_716201 ?auto_716203 ) ) ( not ( = ?auto_716201 ?auto_716204 ) ) ( not ( = ?auto_716201 ?auto_716205 ) ) ( not ( = ?auto_716201 ?auto_716206 ) ) ( not ( = ?auto_716201 ?auto_716207 ) ) ( not ( = ?auto_716201 ?auto_716208 ) ) ( not ( = ?auto_716201 ?auto_716209 ) ) ( not ( = ?auto_716201 ?auto_716210 ) ) ( not ( = ?auto_716201 ?auto_716211 ) ) ( not ( = ?auto_716201 ?auto_716212 ) ) ( not ( = ?auto_716201 ?auto_716213 ) ) ( not ( = ?auto_716201 ?auto_716214 ) ) ( not ( = ?auto_716201 ?auto_716215 ) ) ( not ( = ?auto_716201 ?auto_716216 ) ) ( not ( = ?auto_716201 ?auto_716217 ) ) ( not ( = ?auto_716202 ?auto_716203 ) ) ( not ( = ?auto_716202 ?auto_716204 ) ) ( not ( = ?auto_716202 ?auto_716205 ) ) ( not ( = ?auto_716202 ?auto_716206 ) ) ( not ( = ?auto_716202 ?auto_716207 ) ) ( not ( = ?auto_716202 ?auto_716208 ) ) ( not ( = ?auto_716202 ?auto_716209 ) ) ( not ( = ?auto_716202 ?auto_716210 ) ) ( not ( = ?auto_716202 ?auto_716211 ) ) ( not ( = ?auto_716202 ?auto_716212 ) ) ( not ( = ?auto_716202 ?auto_716213 ) ) ( not ( = ?auto_716202 ?auto_716214 ) ) ( not ( = ?auto_716202 ?auto_716215 ) ) ( not ( = ?auto_716202 ?auto_716216 ) ) ( not ( = ?auto_716202 ?auto_716217 ) ) ( not ( = ?auto_716203 ?auto_716204 ) ) ( not ( = ?auto_716203 ?auto_716205 ) ) ( not ( = ?auto_716203 ?auto_716206 ) ) ( not ( = ?auto_716203 ?auto_716207 ) ) ( not ( = ?auto_716203 ?auto_716208 ) ) ( not ( = ?auto_716203 ?auto_716209 ) ) ( not ( = ?auto_716203 ?auto_716210 ) ) ( not ( = ?auto_716203 ?auto_716211 ) ) ( not ( = ?auto_716203 ?auto_716212 ) ) ( not ( = ?auto_716203 ?auto_716213 ) ) ( not ( = ?auto_716203 ?auto_716214 ) ) ( not ( = ?auto_716203 ?auto_716215 ) ) ( not ( = ?auto_716203 ?auto_716216 ) ) ( not ( = ?auto_716203 ?auto_716217 ) ) ( not ( = ?auto_716204 ?auto_716205 ) ) ( not ( = ?auto_716204 ?auto_716206 ) ) ( not ( = ?auto_716204 ?auto_716207 ) ) ( not ( = ?auto_716204 ?auto_716208 ) ) ( not ( = ?auto_716204 ?auto_716209 ) ) ( not ( = ?auto_716204 ?auto_716210 ) ) ( not ( = ?auto_716204 ?auto_716211 ) ) ( not ( = ?auto_716204 ?auto_716212 ) ) ( not ( = ?auto_716204 ?auto_716213 ) ) ( not ( = ?auto_716204 ?auto_716214 ) ) ( not ( = ?auto_716204 ?auto_716215 ) ) ( not ( = ?auto_716204 ?auto_716216 ) ) ( not ( = ?auto_716204 ?auto_716217 ) ) ( not ( = ?auto_716205 ?auto_716206 ) ) ( not ( = ?auto_716205 ?auto_716207 ) ) ( not ( = ?auto_716205 ?auto_716208 ) ) ( not ( = ?auto_716205 ?auto_716209 ) ) ( not ( = ?auto_716205 ?auto_716210 ) ) ( not ( = ?auto_716205 ?auto_716211 ) ) ( not ( = ?auto_716205 ?auto_716212 ) ) ( not ( = ?auto_716205 ?auto_716213 ) ) ( not ( = ?auto_716205 ?auto_716214 ) ) ( not ( = ?auto_716205 ?auto_716215 ) ) ( not ( = ?auto_716205 ?auto_716216 ) ) ( not ( = ?auto_716205 ?auto_716217 ) ) ( not ( = ?auto_716206 ?auto_716207 ) ) ( not ( = ?auto_716206 ?auto_716208 ) ) ( not ( = ?auto_716206 ?auto_716209 ) ) ( not ( = ?auto_716206 ?auto_716210 ) ) ( not ( = ?auto_716206 ?auto_716211 ) ) ( not ( = ?auto_716206 ?auto_716212 ) ) ( not ( = ?auto_716206 ?auto_716213 ) ) ( not ( = ?auto_716206 ?auto_716214 ) ) ( not ( = ?auto_716206 ?auto_716215 ) ) ( not ( = ?auto_716206 ?auto_716216 ) ) ( not ( = ?auto_716206 ?auto_716217 ) ) ( not ( = ?auto_716207 ?auto_716208 ) ) ( not ( = ?auto_716207 ?auto_716209 ) ) ( not ( = ?auto_716207 ?auto_716210 ) ) ( not ( = ?auto_716207 ?auto_716211 ) ) ( not ( = ?auto_716207 ?auto_716212 ) ) ( not ( = ?auto_716207 ?auto_716213 ) ) ( not ( = ?auto_716207 ?auto_716214 ) ) ( not ( = ?auto_716207 ?auto_716215 ) ) ( not ( = ?auto_716207 ?auto_716216 ) ) ( not ( = ?auto_716207 ?auto_716217 ) ) ( not ( = ?auto_716208 ?auto_716209 ) ) ( not ( = ?auto_716208 ?auto_716210 ) ) ( not ( = ?auto_716208 ?auto_716211 ) ) ( not ( = ?auto_716208 ?auto_716212 ) ) ( not ( = ?auto_716208 ?auto_716213 ) ) ( not ( = ?auto_716208 ?auto_716214 ) ) ( not ( = ?auto_716208 ?auto_716215 ) ) ( not ( = ?auto_716208 ?auto_716216 ) ) ( not ( = ?auto_716208 ?auto_716217 ) ) ( not ( = ?auto_716209 ?auto_716210 ) ) ( not ( = ?auto_716209 ?auto_716211 ) ) ( not ( = ?auto_716209 ?auto_716212 ) ) ( not ( = ?auto_716209 ?auto_716213 ) ) ( not ( = ?auto_716209 ?auto_716214 ) ) ( not ( = ?auto_716209 ?auto_716215 ) ) ( not ( = ?auto_716209 ?auto_716216 ) ) ( not ( = ?auto_716209 ?auto_716217 ) ) ( not ( = ?auto_716210 ?auto_716211 ) ) ( not ( = ?auto_716210 ?auto_716212 ) ) ( not ( = ?auto_716210 ?auto_716213 ) ) ( not ( = ?auto_716210 ?auto_716214 ) ) ( not ( = ?auto_716210 ?auto_716215 ) ) ( not ( = ?auto_716210 ?auto_716216 ) ) ( not ( = ?auto_716210 ?auto_716217 ) ) ( not ( = ?auto_716211 ?auto_716212 ) ) ( not ( = ?auto_716211 ?auto_716213 ) ) ( not ( = ?auto_716211 ?auto_716214 ) ) ( not ( = ?auto_716211 ?auto_716215 ) ) ( not ( = ?auto_716211 ?auto_716216 ) ) ( not ( = ?auto_716211 ?auto_716217 ) ) ( not ( = ?auto_716212 ?auto_716213 ) ) ( not ( = ?auto_716212 ?auto_716214 ) ) ( not ( = ?auto_716212 ?auto_716215 ) ) ( not ( = ?auto_716212 ?auto_716216 ) ) ( not ( = ?auto_716212 ?auto_716217 ) ) ( not ( = ?auto_716213 ?auto_716214 ) ) ( not ( = ?auto_716213 ?auto_716215 ) ) ( not ( = ?auto_716213 ?auto_716216 ) ) ( not ( = ?auto_716213 ?auto_716217 ) ) ( not ( = ?auto_716214 ?auto_716215 ) ) ( not ( = ?auto_716214 ?auto_716216 ) ) ( not ( = ?auto_716214 ?auto_716217 ) ) ( not ( = ?auto_716215 ?auto_716216 ) ) ( not ( = ?auto_716215 ?auto_716217 ) ) ( not ( = ?auto_716216 ?auto_716217 ) ) ( CLEAR ?auto_716215 ) ( ON ?auto_716216 ?auto_716217 ) ( CLEAR ?auto_716216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_716201 ?auto_716202 ?auto_716203 ?auto_716204 ?auto_716205 ?auto_716206 ?auto_716207 ?auto_716208 ?auto_716209 ?auto_716210 ?auto_716211 ?auto_716212 ?auto_716213 ?auto_716214 ?auto_716215 ?auto_716216 )
      ( MAKE-17PILE ?auto_716201 ?auto_716202 ?auto_716203 ?auto_716204 ?auto_716205 ?auto_716206 ?auto_716207 ?auto_716208 ?auto_716209 ?auto_716210 ?auto_716211 ?auto_716212 ?auto_716213 ?auto_716214 ?auto_716215 ?auto_716216 ?auto_716217 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716235 - BLOCK
      ?auto_716236 - BLOCK
      ?auto_716237 - BLOCK
      ?auto_716238 - BLOCK
      ?auto_716239 - BLOCK
      ?auto_716240 - BLOCK
      ?auto_716241 - BLOCK
      ?auto_716242 - BLOCK
      ?auto_716243 - BLOCK
      ?auto_716244 - BLOCK
      ?auto_716245 - BLOCK
      ?auto_716246 - BLOCK
      ?auto_716247 - BLOCK
      ?auto_716248 - BLOCK
      ?auto_716249 - BLOCK
      ?auto_716250 - BLOCK
      ?auto_716251 - BLOCK
    )
    :vars
    (
      ?auto_716252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716251 ?auto_716252 ) ( ON-TABLE ?auto_716235 ) ( ON ?auto_716236 ?auto_716235 ) ( ON ?auto_716237 ?auto_716236 ) ( ON ?auto_716238 ?auto_716237 ) ( ON ?auto_716239 ?auto_716238 ) ( ON ?auto_716240 ?auto_716239 ) ( ON ?auto_716241 ?auto_716240 ) ( ON ?auto_716242 ?auto_716241 ) ( ON ?auto_716243 ?auto_716242 ) ( ON ?auto_716244 ?auto_716243 ) ( ON ?auto_716245 ?auto_716244 ) ( ON ?auto_716246 ?auto_716245 ) ( ON ?auto_716247 ?auto_716246 ) ( ON ?auto_716248 ?auto_716247 ) ( not ( = ?auto_716235 ?auto_716236 ) ) ( not ( = ?auto_716235 ?auto_716237 ) ) ( not ( = ?auto_716235 ?auto_716238 ) ) ( not ( = ?auto_716235 ?auto_716239 ) ) ( not ( = ?auto_716235 ?auto_716240 ) ) ( not ( = ?auto_716235 ?auto_716241 ) ) ( not ( = ?auto_716235 ?auto_716242 ) ) ( not ( = ?auto_716235 ?auto_716243 ) ) ( not ( = ?auto_716235 ?auto_716244 ) ) ( not ( = ?auto_716235 ?auto_716245 ) ) ( not ( = ?auto_716235 ?auto_716246 ) ) ( not ( = ?auto_716235 ?auto_716247 ) ) ( not ( = ?auto_716235 ?auto_716248 ) ) ( not ( = ?auto_716235 ?auto_716249 ) ) ( not ( = ?auto_716235 ?auto_716250 ) ) ( not ( = ?auto_716235 ?auto_716251 ) ) ( not ( = ?auto_716235 ?auto_716252 ) ) ( not ( = ?auto_716236 ?auto_716237 ) ) ( not ( = ?auto_716236 ?auto_716238 ) ) ( not ( = ?auto_716236 ?auto_716239 ) ) ( not ( = ?auto_716236 ?auto_716240 ) ) ( not ( = ?auto_716236 ?auto_716241 ) ) ( not ( = ?auto_716236 ?auto_716242 ) ) ( not ( = ?auto_716236 ?auto_716243 ) ) ( not ( = ?auto_716236 ?auto_716244 ) ) ( not ( = ?auto_716236 ?auto_716245 ) ) ( not ( = ?auto_716236 ?auto_716246 ) ) ( not ( = ?auto_716236 ?auto_716247 ) ) ( not ( = ?auto_716236 ?auto_716248 ) ) ( not ( = ?auto_716236 ?auto_716249 ) ) ( not ( = ?auto_716236 ?auto_716250 ) ) ( not ( = ?auto_716236 ?auto_716251 ) ) ( not ( = ?auto_716236 ?auto_716252 ) ) ( not ( = ?auto_716237 ?auto_716238 ) ) ( not ( = ?auto_716237 ?auto_716239 ) ) ( not ( = ?auto_716237 ?auto_716240 ) ) ( not ( = ?auto_716237 ?auto_716241 ) ) ( not ( = ?auto_716237 ?auto_716242 ) ) ( not ( = ?auto_716237 ?auto_716243 ) ) ( not ( = ?auto_716237 ?auto_716244 ) ) ( not ( = ?auto_716237 ?auto_716245 ) ) ( not ( = ?auto_716237 ?auto_716246 ) ) ( not ( = ?auto_716237 ?auto_716247 ) ) ( not ( = ?auto_716237 ?auto_716248 ) ) ( not ( = ?auto_716237 ?auto_716249 ) ) ( not ( = ?auto_716237 ?auto_716250 ) ) ( not ( = ?auto_716237 ?auto_716251 ) ) ( not ( = ?auto_716237 ?auto_716252 ) ) ( not ( = ?auto_716238 ?auto_716239 ) ) ( not ( = ?auto_716238 ?auto_716240 ) ) ( not ( = ?auto_716238 ?auto_716241 ) ) ( not ( = ?auto_716238 ?auto_716242 ) ) ( not ( = ?auto_716238 ?auto_716243 ) ) ( not ( = ?auto_716238 ?auto_716244 ) ) ( not ( = ?auto_716238 ?auto_716245 ) ) ( not ( = ?auto_716238 ?auto_716246 ) ) ( not ( = ?auto_716238 ?auto_716247 ) ) ( not ( = ?auto_716238 ?auto_716248 ) ) ( not ( = ?auto_716238 ?auto_716249 ) ) ( not ( = ?auto_716238 ?auto_716250 ) ) ( not ( = ?auto_716238 ?auto_716251 ) ) ( not ( = ?auto_716238 ?auto_716252 ) ) ( not ( = ?auto_716239 ?auto_716240 ) ) ( not ( = ?auto_716239 ?auto_716241 ) ) ( not ( = ?auto_716239 ?auto_716242 ) ) ( not ( = ?auto_716239 ?auto_716243 ) ) ( not ( = ?auto_716239 ?auto_716244 ) ) ( not ( = ?auto_716239 ?auto_716245 ) ) ( not ( = ?auto_716239 ?auto_716246 ) ) ( not ( = ?auto_716239 ?auto_716247 ) ) ( not ( = ?auto_716239 ?auto_716248 ) ) ( not ( = ?auto_716239 ?auto_716249 ) ) ( not ( = ?auto_716239 ?auto_716250 ) ) ( not ( = ?auto_716239 ?auto_716251 ) ) ( not ( = ?auto_716239 ?auto_716252 ) ) ( not ( = ?auto_716240 ?auto_716241 ) ) ( not ( = ?auto_716240 ?auto_716242 ) ) ( not ( = ?auto_716240 ?auto_716243 ) ) ( not ( = ?auto_716240 ?auto_716244 ) ) ( not ( = ?auto_716240 ?auto_716245 ) ) ( not ( = ?auto_716240 ?auto_716246 ) ) ( not ( = ?auto_716240 ?auto_716247 ) ) ( not ( = ?auto_716240 ?auto_716248 ) ) ( not ( = ?auto_716240 ?auto_716249 ) ) ( not ( = ?auto_716240 ?auto_716250 ) ) ( not ( = ?auto_716240 ?auto_716251 ) ) ( not ( = ?auto_716240 ?auto_716252 ) ) ( not ( = ?auto_716241 ?auto_716242 ) ) ( not ( = ?auto_716241 ?auto_716243 ) ) ( not ( = ?auto_716241 ?auto_716244 ) ) ( not ( = ?auto_716241 ?auto_716245 ) ) ( not ( = ?auto_716241 ?auto_716246 ) ) ( not ( = ?auto_716241 ?auto_716247 ) ) ( not ( = ?auto_716241 ?auto_716248 ) ) ( not ( = ?auto_716241 ?auto_716249 ) ) ( not ( = ?auto_716241 ?auto_716250 ) ) ( not ( = ?auto_716241 ?auto_716251 ) ) ( not ( = ?auto_716241 ?auto_716252 ) ) ( not ( = ?auto_716242 ?auto_716243 ) ) ( not ( = ?auto_716242 ?auto_716244 ) ) ( not ( = ?auto_716242 ?auto_716245 ) ) ( not ( = ?auto_716242 ?auto_716246 ) ) ( not ( = ?auto_716242 ?auto_716247 ) ) ( not ( = ?auto_716242 ?auto_716248 ) ) ( not ( = ?auto_716242 ?auto_716249 ) ) ( not ( = ?auto_716242 ?auto_716250 ) ) ( not ( = ?auto_716242 ?auto_716251 ) ) ( not ( = ?auto_716242 ?auto_716252 ) ) ( not ( = ?auto_716243 ?auto_716244 ) ) ( not ( = ?auto_716243 ?auto_716245 ) ) ( not ( = ?auto_716243 ?auto_716246 ) ) ( not ( = ?auto_716243 ?auto_716247 ) ) ( not ( = ?auto_716243 ?auto_716248 ) ) ( not ( = ?auto_716243 ?auto_716249 ) ) ( not ( = ?auto_716243 ?auto_716250 ) ) ( not ( = ?auto_716243 ?auto_716251 ) ) ( not ( = ?auto_716243 ?auto_716252 ) ) ( not ( = ?auto_716244 ?auto_716245 ) ) ( not ( = ?auto_716244 ?auto_716246 ) ) ( not ( = ?auto_716244 ?auto_716247 ) ) ( not ( = ?auto_716244 ?auto_716248 ) ) ( not ( = ?auto_716244 ?auto_716249 ) ) ( not ( = ?auto_716244 ?auto_716250 ) ) ( not ( = ?auto_716244 ?auto_716251 ) ) ( not ( = ?auto_716244 ?auto_716252 ) ) ( not ( = ?auto_716245 ?auto_716246 ) ) ( not ( = ?auto_716245 ?auto_716247 ) ) ( not ( = ?auto_716245 ?auto_716248 ) ) ( not ( = ?auto_716245 ?auto_716249 ) ) ( not ( = ?auto_716245 ?auto_716250 ) ) ( not ( = ?auto_716245 ?auto_716251 ) ) ( not ( = ?auto_716245 ?auto_716252 ) ) ( not ( = ?auto_716246 ?auto_716247 ) ) ( not ( = ?auto_716246 ?auto_716248 ) ) ( not ( = ?auto_716246 ?auto_716249 ) ) ( not ( = ?auto_716246 ?auto_716250 ) ) ( not ( = ?auto_716246 ?auto_716251 ) ) ( not ( = ?auto_716246 ?auto_716252 ) ) ( not ( = ?auto_716247 ?auto_716248 ) ) ( not ( = ?auto_716247 ?auto_716249 ) ) ( not ( = ?auto_716247 ?auto_716250 ) ) ( not ( = ?auto_716247 ?auto_716251 ) ) ( not ( = ?auto_716247 ?auto_716252 ) ) ( not ( = ?auto_716248 ?auto_716249 ) ) ( not ( = ?auto_716248 ?auto_716250 ) ) ( not ( = ?auto_716248 ?auto_716251 ) ) ( not ( = ?auto_716248 ?auto_716252 ) ) ( not ( = ?auto_716249 ?auto_716250 ) ) ( not ( = ?auto_716249 ?auto_716251 ) ) ( not ( = ?auto_716249 ?auto_716252 ) ) ( not ( = ?auto_716250 ?auto_716251 ) ) ( not ( = ?auto_716250 ?auto_716252 ) ) ( not ( = ?auto_716251 ?auto_716252 ) ) ( ON ?auto_716250 ?auto_716251 ) ( CLEAR ?auto_716248 ) ( ON ?auto_716249 ?auto_716250 ) ( CLEAR ?auto_716249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_716235 ?auto_716236 ?auto_716237 ?auto_716238 ?auto_716239 ?auto_716240 ?auto_716241 ?auto_716242 ?auto_716243 ?auto_716244 ?auto_716245 ?auto_716246 ?auto_716247 ?auto_716248 ?auto_716249 )
      ( MAKE-17PILE ?auto_716235 ?auto_716236 ?auto_716237 ?auto_716238 ?auto_716239 ?auto_716240 ?auto_716241 ?auto_716242 ?auto_716243 ?auto_716244 ?auto_716245 ?auto_716246 ?auto_716247 ?auto_716248 ?auto_716249 ?auto_716250 ?auto_716251 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716270 - BLOCK
      ?auto_716271 - BLOCK
      ?auto_716272 - BLOCK
      ?auto_716273 - BLOCK
      ?auto_716274 - BLOCK
      ?auto_716275 - BLOCK
      ?auto_716276 - BLOCK
      ?auto_716277 - BLOCK
      ?auto_716278 - BLOCK
      ?auto_716279 - BLOCK
      ?auto_716280 - BLOCK
      ?auto_716281 - BLOCK
      ?auto_716282 - BLOCK
      ?auto_716283 - BLOCK
      ?auto_716284 - BLOCK
      ?auto_716285 - BLOCK
      ?auto_716286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716286 ) ( ON-TABLE ?auto_716270 ) ( ON ?auto_716271 ?auto_716270 ) ( ON ?auto_716272 ?auto_716271 ) ( ON ?auto_716273 ?auto_716272 ) ( ON ?auto_716274 ?auto_716273 ) ( ON ?auto_716275 ?auto_716274 ) ( ON ?auto_716276 ?auto_716275 ) ( ON ?auto_716277 ?auto_716276 ) ( ON ?auto_716278 ?auto_716277 ) ( ON ?auto_716279 ?auto_716278 ) ( ON ?auto_716280 ?auto_716279 ) ( ON ?auto_716281 ?auto_716280 ) ( ON ?auto_716282 ?auto_716281 ) ( ON ?auto_716283 ?auto_716282 ) ( not ( = ?auto_716270 ?auto_716271 ) ) ( not ( = ?auto_716270 ?auto_716272 ) ) ( not ( = ?auto_716270 ?auto_716273 ) ) ( not ( = ?auto_716270 ?auto_716274 ) ) ( not ( = ?auto_716270 ?auto_716275 ) ) ( not ( = ?auto_716270 ?auto_716276 ) ) ( not ( = ?auto_716270 ?auto_716277 ) ) ( not ( = ?auto_716270 ?auto_716278 ) ) ( not ( = ?auto_716270 ?auto_716279 ) ) ( not ( = ?auto_716270 ?auto_716280 ) ) ( not ( = ?auto_716270 ?auto_716281 ) ) ( not ( = ?auto_716270 ?auto_716282 ) ) ( not ( = ?auto_716270 ?auto_716283 ) ) ( not ( = ?auto_716270 ?auto_716284 ) ) ( not ( = ?auto_716270 ?auto_716285 ) ) ( not ( = ?auto_716270 ?auto_716286 ) ) ( not ( = ?auto_716271 ?auto_716272 ) ) ( not ( = ?auto_716271 ?auto_716273 ) ) ( not ( = ?auto_716271 ?auto_716274 ) ) ( not ( = ?auto_716271 ?auto_716275 ) ) ( not ( = ?auto_716271 ?auto_716276 ) ) ( not ( = ?auto_716271 ?auto_716277 ) ) ( not ( = ?auto_716271 ?auto_716278 ) ) ( not ( = ?auto_716271 ?auto_716279 ) ) ( not ( = ?auto_716271 ?auto_716280 ) ) ( not ( = ?auto_716271 ?auto_716281 ) ) ( not ( = ?auto_716271 ?auto_716282 ) ) ( not ( = ?auto_716271 ?auto_716283 ) ) ( not ( = ?auto_716271 ?auto_716284 ) ) ( not ( = ?auto_716271 ?auto_716285 ) ) ( not ( = ?auto_716271 ?auto_716286 ) ) ( not ( = ?auto_716272 ?auto_716273 ) ) ( not ( = ?auto_716272 ?auto_716274 ) ) ( not ( = ?auto_716272 ?auto_716275 ) ) ( not ( = ?auto_716272 ?auto_716276 ) ) ( not ( = ?auto_716272 ?auto_716277 ) ) ( not ( = ?auto_716272 ?auto_716278 ) ) ( not ( = ?auto_716272 ?auto_716279 ) ) ( not ( = ?auto_716272 ?auto_716280 ) ) ( not ( = ?auto_716272 ?auto_716281 ) ) ( not ( = ?auto_716272 ?auto_716282 ) ) ( not ( = ?auto_716272 ?auto_716283 ) ) ( not ( = ?auto_716272 ?auto_716284 ) ) ( not ( = ?auto_716272 ?auto_716285 ) ) ( not ( = ?auto_716272 ?auto_716286 ) ) ( not ( = ?auto_716273 ?auto_716274 ) ) ( not ( = ?auto_716273 ?auto_716275 ) ) ( not ( = ?auto_716273 ?auto_716276 ) ) ( not ( = ?auto_716273 ?auto_716277 ) ) ( not ( = ?auto_716273 ?auto_716278 ) ) ( not ( = ?auto_716273 ?auto_716279 ) ) ( not ( = ?auto_716273 ?auto_716280 ) ) ( not ( = ?auto_716273 ?auto_716281 ) ) ( not ( = ?auto_716273 ?auto_716282 ) ) ( not ( = ?auto_716273 ?auto_716283 ) ) ( not ( = ?auto_716273 ?auto_716284 ) ) ( not ( = ?auto_716273 ?auto_716285 ) ) ( not ( = ?auto_716273 ?auto_716286 ) ) ( not ( = ?auto_716274 ?auto_716275 ) ) ( not ( = ?auto_716274 ?auto_716276 ) ) ( not ( = ?auto_716274 ?auto_716277 ) ) ( not ( = ?auto_716274 ?auto_716278 ) ) ( not ( = ?auto_716274 ?auto_716279 ) ) ( not ( = ?auto_716274 ?auto_716280 ) ) ( not ( = ?auto_716274 ?auto_716281 ) ) ( not ( = ?auto_716274 ?auto_716282 ) ) ( not ( = ?auto_716274 ?auto_716283 ) ) ( not ( = ?auto_716274 ?auto_716284 ) ) ( not ( = ?auto_716274 ?auto_716285 ) ) ( not ( = ?auto_716274 ?auto_716286 ) ) ( not ( = ?auto_716275 ?auto_716276 ) ) ( not ( = ?auto_716275 ?auto_716277 ) ) ( not ( = ?auto_716275 ?auto_716278 ) ) ( not ( = ?auto_716275 ?auto_716279 ) ) ( not ( = ?auto_716275 ?auto_716280 ) ) ( not ( = ?auto_716275 ?auto_716281 ) ) ( not ( = ?auto_716275 ?auto_716282 ) ) ( not ( = ?auto_716275 ?auto_716283 ) ) ( not ( = ?auto_716275 ?auto_716284 ) ) ( not ( = ?auto_716275 ?auto_716285 ) ) ( not ( = ?auto_716275 ?auto_716286 ) ) ( not ( = ?auto_716276 ?auto_716277 ) ) ( not ( = ?auto_716276 ?auto_716278 ) ) ( not ( = ?auto_716276 ?auto_716279 ) ) ( not ( = ?auto_716276 ?auto_716280 ) ) ( not ( = ?auto_716276 ?auto_716281 ) ) ( not ( = ?auto_716276 ?auto_716282 ) ) ( not ( = ?auto_716276 ?auto_716283 ) ) ( not ( = ?auto_716276 ?auto_716284 ) ) ( not ( = ?auto_716276 ?auto_716285 ) ) ( not ( = ?auto_716276 ?auto_716286 ) ) ( not ( = ?auto_716277 ?auto_716278 ) ) ( not ( = ?auto_716277 ?auto_716279 ) ) ( not ( = ?auto_716277 ?auto_716280 ) ) ( not ( = ?auto_716277 ?auto_716281 ) ) ( not ( = ?auto_716277 ?auto_716282 ) ) ( not ( = ?auto_716277 ?auto_716283 ) ) ( not ( = ?auto_716277 ?auto_716284 ) ) ( not ( = ?auto_716277 ?auto_716285 ) ) ( not ( = ?auto_716277 ?auto_716286 ) ) ( not ( = ?auto_716278 ?auto_716279 ) ) ( not ( = ?auto_716278 ?auto_716280 ) ) ( not ( = ?auto_716278 ?auto_716281 ) ) ( not ( = ?auto_716278 ?auto_716282 ) ) ( not ( = ?auto_716278 ?auto_716283 ) ) ( not ( = ?auto_716278 ?auto_716284 ) ) ( not ( = ?auto_716278 ?auto_716285 ) ) ( not ( = ?auto_716278 ?auto_716286 ) ) ( not ( = ?auto_716279 ?auto_716280 ) ) ( not ( = ?auto_716279 ?auto_716281 ) ) ( not ( = ?auto_716279 ?auto_716282 ) ) ( not ( = ?auto_716279 ?auto_716283 ) ) ( not ( = ?auto_716279 ?auto_716284 ) ) ( not ( = ?auto_716279 ?auto_716285 ) ) ( not ( = ?auto_716279 ?auto_716286 ) ) ( not ( = ?auto_716280 ?auto_716281 ) ) ( not ( = ?auto_716280 ?auto_716282 ) ) ( not ( = ?auto_716280 ?auto_716283 ) ) ( not ( = ?auto_716280 ?auto_716284 ) ) ( not ( = ?auto_716280 ?auto_716285 ) ) ( not ( = ?auto_716280 ?auto_716286 ) ) ( not ( = ?auto_716281 ?auto_716282 ) ) ( not ( = ?auto_716281 ?auto_716283 ) ) ( not ( = ?auto_716281 ?auto_716284 ) ) ( not ( = ?auto_716281 ?auto_716285 ) ) ( not ( = ?auto_716281 ?auto_716286 ) ) ( not ( = ?auto_716282 ?auto_716283 ) ) ( not ( = ?auto_716282 ?auto_716284 ) ) ( not ( = ?auto_716282 ?auto_716285 ) ) ( not ( = ?auto_716282 ?auto_716286 ) ) ( not ( = ?auto_716283 ?auto_716284 ) ) ( not ( = ?auto_716283 ?auto_716285 ) ) ( not ( = ?auto_716283 ?auto_716286 ) ) ( not ( = ?auto_716284 ?auto_716285 ) ) ( not ( = ?auto_716284 ?auto_716286 ) ) ( not ( = ?auto_716285 ?auto_716286 ) ) ( ON ?auto_716285 ?auto_716286 ) ( CLEAR ?auto_716283 ) ( ON ?auto_716284 ?auto_716285 ) ( CLEAR ?auto_716284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_716270 ?auto_716271 ?auto_716272 ?auto_716273 ?auto_716274 ?auto_716275 ?auto_716276 ?auto_716277 ?auto_716278 ?auto_716279 ?auto_716280 ?auto_716281 ?auto_716282 ?auto_716283 ?auto_716284 )
      ( MAKE-17PILE ?auto_716270 ?auto_716271 ?auto_716272 ?auto_716273 ?auto_716274 ?auto_716275 ?auto_716276 ?auto_716277 ?auto_716278 ?auto_716279 ?auto_716280 ?auto_716281 ?auto_716282 ?auto_716283 ?auto_716284 ?auto_716285 ?auto_716286 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716304 - BLOCK
      ?auto_716305 - BLOCK
      ?auto_716306 - BLOCK
      ?auto_716307 - BLOCK
      ?auto_716308 - BLOCK
      ?auto_716309 - BLOCK
      ?auto_716310 - BLOCK
      ?auto_716311 - BLOCK
      ?auto_716312 - BLOCK
      ?auto_716313 - BLOCK
      ?auto_716314 - BLOCK
      ?auto_716315 - BLOCK
      ?auto_716316 - BLOCK
      ?auto_716317 - BLOCK
      ?auto_716318 - BLOCK
      ?auto_716319 - BLOCK
      ?auto_716320 - BLOCK
    )
    :vars
    (
      ?auto_716321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716320 ?auto_716321 ) ( ON-TABLE ?auto_716304 ) ( ON ?auto_716305 ?auto_716304 ) ( ON ?auto_716306 ?auto_716305 ) ( ON ?auto_716307 ?auto_716306 ) ( ON ?auto_716308 ?auto_716307 ) ( ON ?auto_716309 ?auto_716308 ) ( ON ?auto_716310 ?auto_716309 ) ( ON ?auto_716311 ?auto_716310 ) ( ON ?auto_716312 ?auto_716311 ) ( ON ?auto_716313 ?auto_716312 ) ( ON ?auto_716314 ?auto_716313 ) ( ON ?auto_716315 ?auto_716314 ) ( ON ?auto_716316 ?auto_716315 ) ( not ( = ?auto_716304 ?auto_716305 ) ) ( not ( = ?auto_716304 ?auto_716306 ) ) ( not ( = ?auto_716304 ?auto_716307 ) ) ( not ( = ?auto_716304 ?auto_716308 ) ) ( not ( = ?auto_716304 ?auto_716309 ) ) ( not ( = ?auto_716304 ?auto_716310 ) ) ( not ( = ?auto_716304 ?auto_716311 ) ) ( not ( = ?auto_716304 ?auto_716312 ) ) ( not ( = ?auto_716304 ?auto_716313 ) ) ( not ( = ?auto_716304 ?auto_716314 ) ) ( not ( = ?auto_716304 ?auto_716315 ) ) ( not ( = ?auto_716304 ?auto_716316 ) ) ( not ( = ?auto_716304 ?auto_716317 ) ) ( not ( = ?auto_716304 ?auto_716318 ) ) ( not ( = ?auto_716304 ?auto_716319 ) ) ( not ( = ?auto_716304 ?auto_716320 ) ) ( not ( = ?auto_716304 ?auto_716321 ) ) ( not ( = ?auto_716305 ?auto_716306 ) ) ( not ( = ?auto_716305 ?auto_716307 ) ) ( not ( = ?auto_716305 ?auto_716308 ) ) ( not ( = ?auto_716305 ?auto_716309 ) ) ( not ( = ?auto_716305 ?auto_716310 ) ) ( not ( = ?auto_716305 ?auto_716311 ) ) ( not ( = ?auto_716305 ?auto_716312 ) ) ( not ( = ?auto_716305 ?auto_716313 ) ) ( not ( = ?auto_716305 ?auto_716314 ) ) ( not ( = ?auto_716305 ?auto_716315 ) ) ( not ( = ?auto_716305 ?auto_716316 ) ) ( not ( = ?auto_716305 ?auto_716317 ) ) ( not ( = ?auto_716305 ?auto_716318 ) ) ( not ( = ?auto_716305 ?auto_716319 ) ) ( not ( = ?auto_716305 ?auto_716320 ) ) ( not ( = ?auto_716305 ?auto_716321 ) ) ( not ( = ?auto_716306 ?auto_716307 ) ) ( not ( = ?auto_716306 ?auto_716308 ) ) ( not ( = ?auto_716306 ?auto_716309 ) ) ( not ( = ?auto_716306 ?auto_716310 ) ) ( not ( = ?auto_716306 ?auto_716311 ) ) ( not ( = ?auto_716306 ?auto_716312 ) ) ( not ( = ?auto_716306 ?auto_716313 ) ) ( not ( = ?auto_716306 ?auto_716314 ) ) ( not ( = ?auto_716306 ?auto_716315 ) ) ( not ( = ?auto_716306 ?auto_716316 ) ) ( not ( = ?auto_716306 ?auto_716317 ) ) ( not ( = ?auto_716306 ?auto_716318 ) ) ( not ( = ?auto_716306 ?auto_716319 ) ) ( not ( = ?auto_716306 ?auto_716320 ) ) ( not ( = ?auto_716306 ?auto_716321 ) ) ( not ( = ?auto_716307 ?auto_716308 ) ) ( not ( = ?auto_716307 ?auto_716309 ) ) ( not ( = ?auto_716307 ?auto_716310 ) ) ( not ( = ?auto_716307 ?auto_716311 ) ) ( not ( = ?auto_716307 ?auto_716312 ) ) ( not ( = ?auto_716307 ?auto_716313 ) ) ( not ( = ?auto_716307 ?auto_716314 ) ) ( not ( = ?auto_716307 ?auto_716315 ) ) ( not ( = ?auto_716307 ?auto_716316 ) ) ( not ( = ?auto_716307 ?auto_716317 ) ) ( not ( = ?auto_716307 ?auto_716318 ) ) ( not ( = ?auto_716307 ?auto_716319 ) ) ( not ( = ?auto_716307 ?auto_716320 ) ) ( not ( = ?auto_716307 ?auto_716321 ) ) ( not ( = ?auto_716308 ?auto_716309 ) ) ( not ( = ?auto_716308 ?auto_716310 ) ) ( not ( = ?auto_716308 ?auto_716311 ) ) ( not ( = ?auto_716308 ?auto_716312 ) ) ( not ( = ?auto_716308 ?auto_716313 ) ) ( not ( = ?auto_716308 ?auto_716314 ) ) ( not ( = ?auto_716308 ?auto_716315 ) ) ( not ( = ?auto_716308 ?auto_716316 ) ) ( not ( = ?auto_716308 ?auto_716317 ) ) ( not ( = ?auto_716308 ?auto_716318 ) ) ( not ( = ?auto_716308 ?auto_716319 ) ) ( not ( = ?auto_716308 ?auto_716320 ) ) ( not ( = ?auto_716308 ?auto_716321 ) ) ( not ( = ?auto_716309 ?auto_716310 ) ) ( not ( = ?auto_716309 ?auto_716311 ) ) ( not ( = ?auto_716309 ?auto_716312 ) ) ( not ( = ?auto_716309 ?auto_716313 ) ) ( not ( = ?auto_716309 ?auto_716314 ) ) ( not ( = ?auto_716309 ?auto_716315 ) ) ( not ( = ?auto_716309 ?auto_716316 ) ) ( not ( = ?auto_716309 ?auto_716317 ) ) ( not ( = ?auto_716309 ?auto_716318 ) ) ( not ( = ?auto_716309 ?auto_716319 ) ) ( not ( = ?auto_716309 ?auto_716320 ) ) ( not ( = ?auto_716309 ?auto_716321 ) ) ( not ( = ?auto_716310 ?auto_716311 ) ) ( not ( = ?auto_716310 ?auto_716312 ) ) ( not ( = ?auto_716310 ?auto_716313 ) ) ( not ( = ?auto_716310 ?auto_716314 ) ) ( not ( = ?auto_716310 ?auto_716315 ) ) ( not ( = ?auto_716310 ?auto_716316 ) ) ( not ( = ?auto_716310 ?auto_716317 ) ) ( not ( = ?auto_716310 ?auto_716318 ) ) ( not ( = ?auto_716310 ?auto_716319 ) ) ( not ( = ?auto_716310 ?auto_716320 ) ) ( not ( = ?auto_716310 ?auto_716321 ) ) ( not ( = ?auto_716311 ?auto_716312 ) ) ( not ( = ?auto_716311 ?auto_716313 ) ) ( not ( = ?auto_716311 ?auto_716314 ) ) ( not ( = ?auto_716311 ?auto_716315 ) ) ( not ( = ?auto_716311 ?auto_716316 ) ) ( not ( = ?auto_716311 ?auto_716317 ) ) ( not ( = ?auto_716311 ?auto_716318 ) ) ( not ( = ?auto_716311 ?auto_716319 ) ) ( not ( = ?auto_716311 ?auto_716320 ) ) ( not ( = ?auto_716311 ?auto_716321 ) ) ( not ( = ?auto_716312 ?auto_716313 ) ) ( not ( = ?auto_716312 ?auto_716314 ) ) ( not ( = ?auto_716312 ?auto_716315 ) ) ( not ( = ?auto_716312 ?auto_716316 ) ) ( not ( = ?auto_716312 ?auto_716317 ) ) ( not ( = ?auto_716312 ?auto_716318 ) ) ( not ( = ?auto_716312 ?auto_716319 ) ) ( not ( = ?auto_716312 ?auto_716320 ) ) ( not ( = ?auto_716312 ?auto_716321 ) ) ( not ( = ?auto_716313 ?auto_716314 ) ) ( not ( = ?auto_716313 ?auto_716315 ) ) ( not ( = ?auto_716313 ?auto_716316 ) ) ( not ( = ?auto_716313 ?auto_716317 ) ) ( not ( = ?auto_716313 ?auto_716318 ) ) ( not ( = ?auto_716313 ?auto_716319 ) ) ( not ( = ?auto_716313 ?auto_716320 ) ) ( not ( = ?auto_716313 ?auto_716321 ) ) ( not ( = ?auto_716314 ?auto_716315 ) ) ( not ( = ?auto_716314 ?auto_716316 ) ) ( not ( = ?auto_716314 ?auto_716317 ) ) ( not ( = ?auto_716314 ?auto_716318 ) ) ( not ( = ?auto_716314 ?auto_716319 ) ) ( not ( = ?auto_716314 ?auto_716320 ) ) ( not ( = ?auto_716314 ?auto_716321 ) ) ( not ( = ?auto_716315 ?auto_716316 ) ) ( not ( = ?auto_716315 ?auto_716317 ) ) ( not ( = ?auto_716315 ?auto_716318 ) ) ( not ( = ?auto_716315 ?auto_716319 ) ) ( not ( = ?auto_716315 ?auto_716320 ) ) ( not ( = ?auto_716315 ?auto_716321 ) ) ( not ( = ?auto_716316 ?auto_716317 ) ) ( not ( = ?auto_716316 ?auto_716318 ) ) ( not ( = ?auto_716316 ?auto_716319 ) ) ( not ( = ?auto_716316 ?auto_716320 ) ) ( not ( = ?auto_716316 ?auto_716321 ) ) ( not ( = ?auto_716317 ?auto_716318 ) ) ( not ( = ?auto_716317 ?auto_716319 ) ) ( not ( = ?auto_716317 ?auto_716320 ) ) ( not ( = ?auto_716317 ?auto_716321 ) ) ( not ( = ?auto_716318 ?auto_716319 ) ) ( not ( = ?auto_716318 ?auto_716320 ) ) ( not ( = ?auto_716318 ?auto_716321 ) ) ( not ( = ?auto_716319 ?auto_716320 ) ) ( not ( = ?auto_716319 ?auto_716321 ) ) ( not ( = ?auto_716320 ?auto_716321 ) ) ( ON ?auto_716319 ?auto_716320 ) ( ON ?auto_716318 ?auto_716319 ) ( CLEAR ?auto_716316 ) ( ON ?auto_716317 ?auto_716318 ) ( CLEAR ?auto_716317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_716304 ?auto_716305 ?auto_716306 ?auto_716307 ?auto_716308 ?auto_716309 ?auto_716310 ?auto_716311 ?auto_716312 ?auto_716313 ?auto_716314 ?auto_716315 ?auto_716316 ?auto_716317 )
      ( MAKE-17PILE ?auto_716304 ?auto_716305 ?auto_716306 ?auto_716307 ?auto_716308 ?auto_716309 ?auto_716310 ?auto_716311 ?auto_716312 ?auto_716313 ?auto_716314 ?auto_716315 ?auto_716316 ?auto_716317 ?auto_716318 ?auto_716319 ?auto_716320 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716339 - BLOCK
      ?auto_716340 - BLOCK
      ?auto_716341 - BLOCK
      ?auto_716342 - BLOCK
      ?auto_716343 - BLOCK
      ?auto_716344 - BLOCK
      ?auto_716345 - BLOCK
      ?auto_716346 - BLOCK
      ?auto_716347 - BLOCK
      ?auto_716348 - BLOCK
      ?auto_716349 - BLOCK
      ?auto_716350 - BLOCK
      ?auto_716351 - BLOCK
      ?auto_716352 - BLOCK
      ?auto_716353 - BLOCK
      ?auto_716354 - BLOCK
      ?auto_716355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716355 ) ( ON-TABLE ?auto_716339 ) ( ON ?auto_716340 ?auto_716339 ) ( ON ?auto_716341 ?auto_716340 ) ( ON ?auto_716342 ?auto_716341 ) ( ON ?auto_716343 ?auto_716342 ) ( ON ?auto_716344 ?auto_716343 ) ( ON ?auto_716345 ?auto_716344 ) ( ON ?auto_716346 ?auto_716345 ) ( ON ?auto_716347 ?auto_716346 ) ( ON ?auto_716348 ?auto_716347 ) ( ON ?auto_716349 ?auto_716348 ) ( ON ?auto_716350 ?auto_716349 ) ( ON ?auto_716351 ?auto_716350 ) ( not ( = ?auto_716339 ?auto_716340 ) ) ( not ( = ?auto_716339 ?auto_716341 ) ) ( not ( = ?auto_716339 ?auto_716342 ) ) ( not ( = ?auto_716339 ?auto_716343 ) ) ( not ( = ?auto_716339 ?auto_716344 ) ) ( not ( = ?auto_716339 ?auto_716345 ) ) ( not ( = ?auto_716339 ?auto_716346 ) ) ( not ( = ?auto_716339 ?auto_716347 ) ) ( not ( = ?auto_716339 ?auto_716348 ) ) ( not ( = ?auto_716339 ?auto_716349 ) ) ( not ( = ?auto_716339 ?auto_716350 ) ) ( not ( = ?auto_716339 ?auto_716351 ) ) ( not ( = ?auto_716339 ?auto_716352 ) ) ( not ( = ?auto_716339 ?auto_716353 ) ) ( not ( = ?auto_716339 ?auto_716354 ) ) ( not ( = ?auto_716339 ?auto_716355 ) ) ( not ( = ?auto_716340 ?auto_716341 ) ) ( not ( = ?auto_716340 ?auto_716342 ) ) ( not ( = ?auto_716340 ?auto_716343 ) ) ( not ( = ?auto_716340 ?auto_716344 ) ) ( not ( = ?auto_716340 ?auto_716345 ) ) ( not ( = ?auto_716340 ?auto_716346 ) ) ( not ( = ?auto_716340 ?auto_716347 ) ) ( not ( = ?auto_716340 ?auto_716348 ) ) ( not ( = ?auto_716340 ?auto_716349 ) ) ( not ( = ?auto_716340 ?auto_716350 ) ) ( not ( = ?auto_716340 ?auto_716351 ) ) ( not ( = ?auto_716340 ?auto_716352 ) ) ( not ( = ?auto_716340 ?auto_716353 ) ) ( not ( = ?auto_716340 ?auto_716354 ) ) ( not ( = ?auto_716340 ?auto_716355 ) ) ( not ( = ?auto_716341 ?auto_716342 ) ) ( not ( = ?auto_716341 ?auto_716343 ) ) ( not ( = ?auto_716341 ?auto_716344 ) ) ( not ( = ?auto_716341 ?auto_716345 ) ) ( not ( = ?auto_716341 ?auto_716346 ) ) ( not ( = ?auto_716341 ?auto_716347 ) ) ( not ( = ?auto_716341 ?auto_716348 ) ) ( not ( = ?auto_716341 ?auto_716349 ) ) ( not ( = ?auto_716341 ?auto_716350 ) ) ( not ( = ?auto_716341 ?auto_716351 ) ) ( not ( = ?auto_716341 ?auto_716352 ) ) ( not ( = ?auto_716341 ?auto_716353 ) ) ( not ( = ?auto_716341 ?auto_716354 ) ) ( not ( = ?auto_716341 ?auto_716355 ) ) ( not ( = ?auto_716342 ?auto_716343 ) ) ( not ( = ?auto_716342 ?auto_716344 ) ) ( not ( = ?auto_716342 ?auto_716345 ) ) ( not ( = ?auto_716342 ?auto_716346 ) ) ( not ( = ?auto_716342 ?auto_716347 ) ) ( not ( = ?auto_716342 ?auto_716348 ) ) ( not ( = ?auto_716342 ?auto_716349 ) ) ( not ( = ?auto_716342 ?auto_716350 ) ) ( not ( = ?auto_716342 ?auto_716351 ) ) ( not ( = ?auto_716342 ?auto_716352 ) ) ( not ( = ?auto_716342 ?auto_716353 ) ) ( not ( = ?auto_716342 ?auto_716354 ) ) ( not ( = ?auto_716342 ?auto_716355 ) ) ( not ( = ?auto_716343 ?auto_716344 ) ) ( not ( = ?auto_716343 ?auto_716345 ) ) ( not ( = ?auto_716343 ?auto_716346 ) ) ( not ( = ?auto_716343 ?auto_716347 ) ) ( not ( = ?auto_716343 ?auto_716348 ) ) ( not ( = ?auto_716343 ?auto_716349 ) ) ( not ( = ?auto_716343 ?auto_716350 ) ) ( not ( = ?auto_716343 ?auto_716351 ) ) ( not ( = ?auto_716343 ?auto_716352 ) ) ( not ( = ?auto_716343 ?auto_716353 ) ) ( not ( = ?auto_716343 ?auto_716354 ) ) ( not ( = ?auto_716343 ?auto_716355 ) ) ( not ( = ?auto_716344 ?auto_716345 ) ) ( not ( = ?auto_716344 ?auto_716346 ) ) ( not ( = ?auto_716344 ?auto_716347 ) ) ( not ( = ?auto_716344 ?auto_716348 ) ) ( not ( = ?auto_716344 ?auto_716349 ) ) ( not ( = ?auto_716344 ?auto_716350 ) ) ( not ( = ?auto_716344 ?auto_716351 ) ) ( not ( = ?auto_716344 ?auto_716352 ) ) ( not ( = ?auto_716344 ?auto_716353 ) ) ( not ( = ?auto_716344 ?auto_716354 ) ) ( not ( = ?auto_716344 ?auto_716355 ) ) ( not ( = ?auto_716345 ?auto_716346 ) ) ( not ( = ?auto_716345 ?auto_716347 ) ) ( not ( = ?auto_716345 ?auto_716348 ) ) ( not ( = ?auto_716345 ?auto_716349 ) ) ( not ( = ?auto_716345 ?auto_716350 ) ) ( not ( = ?auto_716345 ?auto_716351 ) ) ( not ( = ?auto_716345 ?auto_716352 ) ) ( not ( = ?auto_716345 ?auto_716353 ) ) ( not ( = ?auto_716345 ?auto_716354 ) ) ( not ( = ?auto_716345 ?auto_716355 ) ) ( not ( = ?auto_716346 ?auto_716347 ) ) ( not ( = ?auto_716346 ?auto_716348 ) ) ( not ( = ?auto_716346 ?auto_716349 ) ) ( not ( = ?auto_716346 ?auto_716350 ) ) ( not ( = ?auto_716346 ?auto_716351 ) ) ( not ( = ?auto_716346 ?auto_716352 ) ) ( not ( = ?auto_716346 ?auto_716353 ) ) ( not ( = ?auto_716346 ?auto_716354 ) ) ( not ( = ?auto_716346 ?auto_716355 ) ) ( not ( = ?auto_716347 ?auto_716348 ) ) ( not ( = ?auto_716347 ?auto_716349 ) ) ( not ( = ?auto_716347 ?auto_716350 ) ) ( not ( = ?auto_716347 ?auto_716351 ) ) ( not ( = ?auto_716347 ?auto_716352 ) ) ( not ( = ?auto_716347 ?auto_716353 ) ) ( not ( = ?auto_716347 ?auto_716354 ) ) ( not ( = ?auto_716347 ?auto_716355 ) ) ( not ( = ?auto_716348 ?auto_716349 ) ) ( not ( = ?auto_716348 ?auto_716350 ) ) ( not ( = ?auto_716348 ?auto_716351 ) ) ( not ( = ?auto_716348 ?auto_716352 ) ) ( not ( = ?auto_716348 ?auto_716353 ) ) ( not ( = ?auto_716348 ?auto_716354 ) ) ( not ( = ?auto_716348 ?auto_716355 ) ) ( not ( = ?auto_716349 ?auto_716350 ) ) ( not ( = ?auto_716349 ?auto_716351 ) ) ( not ( = ?auto_716349 ?auto_716352 ) ) ( not ( = ?auto_716349 ?auto_716353 ) ) ( not ( = ?auto_716349 ?auto_716354 ) ) ( not ( = ?auto_716349 ?auto_716355 ) ) ( not ( = ?auto_716350 ?auto_716351 ) ) ( not ( = ?auto_716350 ?auto_716352 ) ) ( not ( = ?auto_716350 ?auto_716353 ) ) ( not ( = ?auto_716350 ?auto_716354 ) ) ( not ( = ?auto_716350 ?auto_716355 ) ) ( not ( = ?auto_716351 ?auto_716352 ) ) ( not ( = ?auto_716351 ?auto_716353 ) ) ( not ( = ?auto_716351 ?auto_716354 ) ) ( not ( = ?auto_716351 ?auto_716355 ) ) ( not ( = ?auto_716352 ?auto_716353 ) ) ( not ( = ?auto_716352 ?auto_716354 ) ) ( not ( = ?auto_716352 ?auto_716355 ) ) ( not ( = ?auto_716353 ?auto_716354 ) ) ( not ( = ?auto_716353 ?auto_716355 ) ) ( not ( = ?auto_716354 ?auto_716355 ) ) ( ON ?auto_716354 ?auto_716355 ) ( ON ?auto_716353 ?auto_716354 ) ( CLEAR ?auto_716351 ) ( ON ?auto_716352 ?auto_716353 ) ( CLEAR ?auto_716352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_716339 ?auto_716340 ?auto_716341 ?auto_716342 ?auto_716343 ?auto_716344 ?auto_716345 ?auto_716346 ?auto_716347 ?auto_716348 ?auto_716349 ?auto_716350 ?auto_716351 ?auto_716352 )
      ( MAKE-17PILE ?auto_716339 ?auto_716340 ?auto_716341 ?auto_716342 ?auto_716343 ?auto_716344 ?auto_716345 ?auto_716346 ?auto_716347 ?auto_716348 ?auto_716349 ?auto_716350 ?auto_716351 ?auto_716352 ?auto_716353 ?auto_716354 ?auto_716355 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716373 - BLOCK
      ?auto_716374 - BLOCK
      ?auto_716375 - BLOCK
      ?auto_716376 - BLOCK
      ?auto_716377 - BLOCK
      ?auto_716378 - BLOCK
      ?auto_716379 - BLOCK
      ?auto_716380 - BLOCK
      ?auto_716381 - BLOCK
      ?auto_716382 - BLOCK
      ?auto_716383 - BLOCK
      ?auto_716384 - BLOCK
      ?auto_716385 - BLOCK
      ?auto_716386 - BLOCK
      ?auto_716387 - BLOCK
      ?auto_716388 - BLOCK
      ?auto_716389 - BLOCK
    )
    :vars
    (
      ?auto_716390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716389 ?auto_716390 ) ( ON-TABLE ?auto_716373 ) ( ON ?auto_716374 ?auto_716373 ) ( ON ?auto_716375 ?auto_716374 ) ( ON ?auto_716376 ?auto_716375 ) ( ON ?auto_716377 ?auto_716376 ) ( ON ?auto_716378 ?auto_716377 ) ( ON ?auto_716379 ?auto_716378 ) ( ON ?auto_716380 ?auto_716379 ) ( ON ?auto_716381 ?auto_716380 ) ( ON ?auto_716382 ?auto_716381 ) ( ON ?auto_716383 ?auto_716382 ) ( ON ?auto_716384 ?auto_716383 ) ( not ( = ?auto_716373 ?auto_716374 ) ) ( not ( = ?auto_716373 ?auto_716375 ) ) ( not ( = ?auto_716373 ?auto_716376 ) ) ( not ( = ?auto_716373 ?auto_716377 ) ) ( not ( = ?auto_716373 ?auto_716378 ) ) ( not ( = ?auto_716373 ?auto_716379 ) ) ( not ( = ?auto_716373 ?auto_716380 ) ) ( not ( = ?auto_716373 ?auto_716381 ) ) ( not ( = ?auto_716373 ?auto_716382 ) ) ( not ( = ?auto_716373 ?auto_716383 ) ) ( not ( = ?auto_716373 ?auto_716384 ) ) ( not ( = ?auto_716373 ?auto_716385 ) ) ( not ( = ?auto_716373 ?auto_716386 ) ) ( not ( = ?auto_716373 ?auto_716387 ) ) ( not ( = ?auto_716373 ?auto_716388 ) ) ( not ( = ?auto_716373 ?auto_716389 ) ) ( not ( = ?auto_716373 ?auto_716390 ) ) ( not ( = ?auto_716374 ?auto_716375 ) ) ( not ( = ?auto_716374 ?auto_716376 ) ) ( not ( = ?auto_716374 ?auto_716377 ) ) ( not ( = ?auto_716374 ?auto_716378 ) ) ( not ( = ?auto_716374 ?auto_716379 ) ) ( not ( = ?auto_716374 ?auto_716380 ) ) ( not ( = ?auto_716374 ?auto_716381 ) ) ( not ( = ?auto_716374 ?auto_716382 ) ) ( not ( = ?auto_716374 ?auto_716383 ) ) ( not ( = ?auto_716374 ?auto_716384 ) ) ( not ( = ?auto_716374 ?auto_716385 ) ) ( not ( = ?auto_716374 ?auto_716386 ) ) ( not ( = ?auto_716374 ?auto_716387 ) ) ( not ( = ?auto_716374 ?auto_716388 ) ) ( not ( = ?auto_716374 ?auto_716389 ) ) ( not ( = ?auto_716374 ?auto_716390 ) ) ( not ( = ?auto_716375 ?auto_716376 ) ) ( not ( = ?auto_716375 ?auto_716377 ) ) ( not ( = ?auto_716375 ?auto_716378 ) ) ( not ( = ?auto_716375 ?auto_716379 ) ) ( not ( = ?auto_716375 ?auto_716380 ) ) ( not ( = ?auto_716375 ?auto_716381 ) ) ( not ( = ?auto_716375 ?auto_716382 ) ) ( not ( = ?auto_716375 ?auto_716383 ) ) ( not ( = ?auto_716375 ?auto_716384 ) ) ( not ( = ?auto_716375 ?auto_716385 ) ) ( not ( = ?auto_716375 ?auto_716386 ) ) ( not ( = ?auto_716375 ?auto_716387 ) ) ( not ( = ?auto_716375 ?auto_716388 ) ) ( not ( = ?auto_716375 ?auto_716389 ) ) ( not ( = ?auto_716375 ?auto_716390 ) ) ( not ( = ?auto_716376 ?auto_716377 ) ) ( not ( = ?auto_716376 ?auto_716378 ) ) ( not ( = ?auto_716376 ?auto_716379 ) ) ( not ( = ?auto_716376 ?auto_716380 ) ) ( not ( = ?auto_716376 ?auto_716381 ) ) ( not ( = ?auto_716376 ?auto_716382 ) ) ( not ( = ?auto_716376 ?auto_716383 ) ) ( not ( = ?auto_716376 ?auto_716384 ) ) ( not ( = ?auto_716376 ?auto_716385 ) ) ( not ( = ?auto_716376 ?auto_716386 ) ) ( not ( = ?auto_716376 ?auto_716387 ) ) ( not ( = ?auto_716376 ?auto_716388 ) ) ( not ( = ?auto_716376 ?auto_716389 ) ) ( not ( = ?auto_716376 ?auto_716390 ) ) ( not ( = ?auto_716377 ?auto_716378 ) ) ( not ( = ?auto_716377 ?auto_716379 ) ) ( not ( = ?auto_716377 ?auto_716380 ) ) ( not ( = ?auto_716377 ?auto_716381 ) ) ( not ( = ?auto_716377 ?auto_716382 ) ) ( not ( = ?auto_716377 ?auto_716383 ) ) ( not ( = ?auto_716377 ?auto_716384 ) ) ( not ( = ?auto_716377 ?auto_716385 ) ) ( not ( = ?auto_716377 ?auto_716386 ) ) ( not ( = ?auto_716377 ?auto_716387 ) ) ( not ( = ?auto_716377 ?auto_716388 ) ) ( not ( = ?auto_716377 ?auto_716389 ) ) ( not ( = ?auto_716377 ?auto_716390 ) ) ( not ( = ?auto_716378 ?auto_716379 ) ) ( not ( = ?auto_716378 ?auto_716380 ) ) ( not ( = ?auto_716378 ?auto_716381 ) ) ( not ( = ?auto_716378 ?auto_716382 ) ) ( not ( = ?auto_716378 ?auto_716383 ) ) ( not ( = ?auto_716378 ?auto_716384 ) ) ( not ( = ?auto_716378 ?auto_716385 ) ) ( not ( = ?auto_716378 ?auto_716386 ) ) ( not ( = ?auto_716378 ?auto_716387 ) ) ( not ( = ?auto_716378 ?auto_716388 ) ) ( not ( = ?auto_716378 ?auto_716389 ) ) ( not ( = ?auto_716378 ?auto_716390 ) ) ( not ( = ?auto_716379 ?auto_716380 ) ) ( not ( = ?auto_716379 ?auto_716381 ) ) ( not ( = ?auto_716379 ?auto_716382 ) ) ( not ( = ?auto_716379 ?auto_716383 ) ) ( not ( = ?auto_716379 ?auto_716384 ) ) ( not ( = ?auto_716379 ?auto_716385 ) ) ( not ( = ?auto_716379 ?auto_716386 ) ) ( not ( = ?auto_716379 ?auto_716387 ) ) ( not ( = ?auto_716379 ?auto_716388 ) ) ( not ( = ?auto_716379 ?auto_716389 ) ) ( not ( = ?auto_716379 ?auto_716390 ) ) ( not ( = ?auto_716380 ?auto_716381 ) ) ( not ( = ?auto_716380 ?auto_716382 ) ) ( not ( = ?auto_716380 ?auto_716383 ) ) ( not ( = ?auto_716380 ?auto_716384 ) ) ( not ( = ?auto_716380 ?auto_716385 ) ) ( not ( = ?auto_716380 ?auto_716386 ) ) ( not ( = ?auto_716380 ?auto_716387 ) ) ( not ( = ?auto_716380 ?auto_716388 ) ) ( not ( = ?auto_716380 ?auto_716389 ) ) ( not ( = ?auto_716380 ?auto_716390 ) ) ( not ( = ?auto_716381 ?auto_716382 ) ) ( not ( = ?auto_716381 ?auto_716383 ) ) ( not ( = ?auto_716381 ?auto_716384 ) ) ( not ( = ?auto_716381 ?auto_716385 ) ) ( not ( = ?auto_716381 ?auto_716386 ) ) ( not ( = ?auto_716381 ?auto_716387 ) ) ( not ( = ?auto_716381 ?auto_716388 ) ) ( not ( = ?auto_716381 ?auto_716389 ) ) ( not ( = ?auto_716381 ?auto_716390 ) ) ( not ( = ?auto_716382 ?auto_716383 ) ) ( not ( = ?auto_716382 ?auto_716384 ) ) ( not ( = ?auto_716382 ?auto_716385 ) ) ( not ( = ?auto_716382 ?auto_716386 ) ) ( not ( = ?auto_716382 ?auto_716387 ) ) ( not ( = ?auto_716382 ?auto_716388 ) ) ( not ( = ?auto_716382 ?auto_716389 ) ) ( not ( = ?auto_716382 ?auto_716390 ) ) ( not ( = ?auto_716383 ?auto_716384 ) ) ( not ( = ?auto_716383 ?auto_716385 ) ) ( not ( = ?auto_716383 ?auto_716386 ) ) ( not ( = ?auto_716383 ?auto_716387 ) ) ( not ( = ?auto_716383 ?auto_716388 ) ) ( not ( = ?auto_716383 ?auto_716389 ) ) ( not ( = ?auto_716383 ?auto_716390 ) ) ( not ( = ?auto_716384 ?auto_716385 ) ) ( not ( = ?auto_716384 ?auto_716386 ) ) ( not ( = ?auto_716384 ?auto_716387 ) ) ( not ( = ?auto_716384 ?auto_716388 ) ) ( not ( = ?auto_716384 ?auto_716389 ) ) ( not ( = ?auto_716384 ?auto_716390 ) ) ( not ( = ?auto_716385 ?auto_716386 ) ) ( not ( = ?auto_716385 ?auto_716387 ) ) ( not ( = ?auto_716385 ?auto_716388 ) ) ( not ( = ?auto_716385 ?auto_716389 ) ) ( not ( = ?auto_716385 ?auto_716390 ) ) ( not ( = ?auto_716386 ?auto_716387 ) ) ( not ( = ?auto_716386 ?auto_716388 ) ) ( not ( = ?auto_716386 ?auto_716389 ) ) ( not ( = ?auto_716386 ?auto_716390 ) ) ( not ( = ?auto_716387 ?auto_716388 ) ) ( not ( = ?auto_716387 ?auto_716389 ) ) ( not ( = ?auto_716387 ?auto_716390 ) ) ( not ( = ?auto_716388 ?auto_716389 ) ) ( not ( = ?auto_716388 ?auto_716390 ) ) ( not ( = ?auto_716389 ?auto_716390 ) ) ( ON ?auto_716388 ?auto_716389 ) ( ON ?auto_716387 ?auto_716388 ) ( ON ?auto_716386 ?auto_716387 ) ( CLEAR ?auto_716384 ) ( ON ?auto_716385 ?auto_716386 ) ( CLEAR ?auto_716385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_716373 ?auto_716374 ?auto_716375 ?auto_716376 ?auto_716377 ?auto_716378 ?auto_716379 ?auto_716380 ?auto_716381 ?auto_716382 ?auto_716383 ?auto_716384 ?auto_716385 )
      ( MAKE-17PILE ?auto_716373 ?auto_716374 ?auto_716375 ?auto_716376 ?auto_716377 ?auto_716378 ?auto_716379 ?auto_716380 ?auto_716381 ?auto_716382 ?auto_716383 ?auto_716384 ?auto_716385 ?auto_716386 ?auto_716387 ?auto_716388 ?auto_716389 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716408 - BLOCK
      ?auto_716409 - BLOCK
      ?auto_716410 - BLOCK
      ?auto_716411 - BLOCK
      ?auto_716412 - BLOCK
      ?auto_716413 - BLOCK
      ?auto_716414 - BLOCK
      ?auto_716415 - BLOCK
      ?auto_716416 - BLOCK
      ?auto_716417 - BLOCK
      ?auto_716418 - BLOCK
      ?auto_716419 - BLOCK
      ?auto_716420 - BLOCK
      ?auto_716421 - BLOCK
      ?auto_716422 - BLOCK
      ?auto_716423 - BLOCK
      ?auto_716424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716424 ) ( ON-TABLE ?auto_716408 ) ( ON ?auto_716409 ?auto_716408 ) ( ON ?auto_716410 ?auto_716409 ) ( ON ?auto_716411 ?auto_716410 ) ( ON ?auto_716412 ?auto_716411 ) ( ON ?auto_716413 ?auto_716412 ) ( ON ?auto_716414 ?auto_716413 ) ( ON ?auto_716415 ?auto_716414 ) ( ON ?auto_716416 ?auto_716415 ) ( ON ?auto_716417 ?auto_716416 ) ( ON ?auto_716418 ?auto_716417 ) ( ON ?auto_716419 ?auto_716418 ) ( not ( = ?auto_716408 ?auto_716409 ) ) ( not ( = ?auto_716408 ?auto_716410 ) ) ( not ( = ?auto_716408 ?auto_716411 ) ) ( not ( = ?auto_716408 ?auto_716412 ) ) ( not ( = ?auto_716408 ?auto_716413 ) ) ( not ( = ?auto_716408 ?auto_716414 ) ) ( not ( = ?auto_716408 ?auto_716415 ) ) ( not ( = ?auto_716408 ?auto_716416 ) ) ( not ( = ?auto_716408 ?auto_716417 ) ) ( not ( = ?auto_716408 ?auto_716418 ) ) ( not ( = ?auto_716408 ?auto_716419 ) ) ( not ( = ?auto_716408 ?auto_716420 ) ) ( not ( = ?auto_716408 ?auto_716421 ) ) ( not ( = ?auto_716408 ?auto_716422 ) ) ( not ( = ?auto_716408 ?auto_716423 ) ) ( not ( = ?auto_716408 ?auto_716424 ) ) ( not ( = ?auto_716409 ?auto_716410 ) ) ( not ( = ?auto_716409 ?auto_716411 ) ) ( not ( = ?auto_716409 ?auto_716412 ) ) ( not ( = ?auto_716409 ?auto_716413 ) ) ( not ( = ?auto_716409 ?auto_716414 ) ) ( not ( = ?auto_716409 ?auto_716415 ) ) ( not ( = ?auto_716409 ?auto_716416 ) ) ( not ( = ?auto_716409 ?auto_716417 ) ) ( not ( = ?auto_716409 ?auto_716418 ) ) ( not ( = ?auto_716409 ?auto_716419 ) ) ( not ( = ?auto_716409 ?auto_716420 ) ) ( not ( = ?auto_716409 ?auto_716421 ) ) ( not ( = ?auto_716409 ?auto_716422 ) ) ( not ( = ?auto_716409 ?auto_716423 ) ) ( not ( = ?auto_716409 ?auto_716424 ) ) ( not ( = ?auto_716410 ?auto_716411 ) ) ( not ( = ?auto_716410 ?auto_716412 ) ) ( not ( = ?auto_716410 ?auto_716413 ) ) ( not ( = ?auto_716410 ?auto_716414 ) ) ( not ( = ?auto_716410 ?auto_716415 ) ) ( not ( = ?auto_716410 ?auto_716416 ) ) ( not ( = ?auto_716410 ?auto_716417 ) ) ( not ( = ?auto_716410 ?auto_716418 ) ) ( not ( = ?auto_716410 ?auto_716419 ) ) ( not ( = ?auto_716410 ?auto_716420 ) ) ( not ( = ?auto_716410 ?auto_716421 ) ) ( not ( = ?auto_716410 ?auto_716422 ) ) ( not ( = ?auto_716410 ?auto_716423 ) ) ( not ( = ?auto_716410 ?auto_716424 ) ) ( not ( = ?auto_716411 ?auto_716412 ) ) ( not ( = ?auto_716411 ?auto_716413 ) ) ( not ( = ?auto_716411 ?auto_716414 ) ) ( not ( = ?auto_716411 ?auto_716415 ) ) ( not ( = ?auto_716411 ?auto_716416 ) ) ( not ( = ?auto_716411 ?auto_716417 ) ) ( not ( = ?auto_716411 ?auto_716418 ) ) ( not ( = ?auto_716411 ?auto_716419 ) ) ( not ( = ?auto_716411 ?auto_716420 ) ) ( not ( = ?auto_716411 ?auto_716421 ) ) ( not ( = ?auto_716411 ?auto_716422 ) ) ( not ( = ?auto_716411 ?auto_716423 ) ) ( not ( = ?auto_716411 ?auto_716424 ) ) ( not ( = ?auto_716412 ?auto_716413 ) ) ( not ( = ?auto_716412 ?auto_716414 ) ) ( not ( = ?auto_716412 ?auto_716415 ) ) ( not ( = ?auto_716412 ?auto_716416 ) ) ( not ( = ?auto_716412 ?auto_716417 ) ) ( not ( = ?auto_716412 ?auto_716418 ) ) ( not ( = ?auto_716412 ?auto_716419 ) ) ( not ( = ?auto_716412 ?auto_716420 ) ) ( not ( = ?auto_716412 ?auto_716421 ) ) ( not ( = ?auto_716412 ?auto_716422 ) ) ( not ( = ?auto_716412 ?auto_716423 ) ) ( not ( = ?auto_716412 ?auto_716424 ) ) ( not ( = ?auto_716413 ?auto_716414 ) ) ( not ( = ?auto_716413 ?auto_716415 ) ) ( not ( = ?auto_716413 ?auto_716416 ) ) ( not ( = ?auto_716413 ?auto_716417 ) ) ( not ( = ?auto_716413 ?auto_716418 ) ) ( not ( = ?auto_716413 ?auto_716419 ) ) ( not ( = ?auto_716413 ?auto_716420 ) ) ( not ( = ?auto_716413 ?auto_716421 ) ) ( not ( = ?auto_716413 ?auto_716422 ) ) ( not ( = ?auto_716413 ?auto_716423 ) ) ( not ( = ?auto_716413 ?auto_716424 ) ) ( not ( = ?auto_716414 ?auto_716415 ) ) ( not ( = ?auto_716414 ?auto_716416 ) ) ( not ( = ?auto_716414 ?auto_716417 ) ) ( not ( = ?auto_716414 ?auto_716418 ) ) ( not ( = ?auto_716414 ?auto_716419 ) ) ( not ( = ?auto_716414 ?auto_716420 ) ) ( not ( = ?auto_716414 ?auto_716421 ) ) ( not ( = ?auto_716414 ?auto_716422 ) ) ( not ( = ?auto_716414 ?auto_716423 ) ) ( not ( = ?auto_716414 ?auto_716424 ) ) ( not ( = ?auto_716415 ?auto_716416 ) ) ( not ( = ?auto_716415 ?auto_716417 ) ) ( not ( = ?auto_716415 ?auto_716418 ) ) ( not ( = ?auto_716415 ?auto_716419 ) ) ( not ( = ?auto_716415 ?auto_716420 ) ) ( not ( = ?auto_716415 ?auto_716421 ) ) ( not ( = ?auto_716415 ?auto_716422 ) ) ( not ( = ?auto_716415 ?auto_716423 ) ) ( not ( = ?auto_716415 ?auto_716424 ) ) ( not ( = ?auto_716416 ?auto_716417 ) ) ( not ( = ?auto_716416 ?auto_716418 ) ) ( not ( = ?auto_716416 ?auto_716419 ) ) ( not ( = ?auto_716416 ?auto_716420 ) ) ( not ( = ?auto_716416 ?auto_716421 ) ) ( not ( = ?auto_716416 ?auto_716422 ) ) ( not ( = ?auto_716416 ?auto_716423 ) ) ( not ( = ?auto_716416 ?auto_716424 ) ) ( not ( = ?auto_716417 ?auto_716418 ) ) ( not ( = ?auto_716417 ?auto_716419 ) ) ( not ( = ?auto_716417 ?auto_716420 ) ) ( not ( = ?auto_716417 ?auto_716421 ) ) ( not ( = ?auto_716417 ?auto_716422 ) ) ( not ( = ?auto_716417 ?auto_716423 ) ) ( not ( = ?auto_716417 ?auto_716424 ) ) ( not ( = ?auto_716418 ?auto_716419 ) ) ( not ( = ?auto_716418 ?auto_716420 ) ) ( not ( = ?auto_716418 ?auto_716421 ) ) ( not ( = ?auto_716418 ?auto_716422 ) ) ( not ( = ?auto_716418 ?auto_716423 ) ) ( not ( = ?auto_716418 ?auto_716424 ) ) ( not ( = ?auto_716419 ?auto_716420 ) ) ( not ( = ?auto_716419 ?auto_716421 ) ) ( not ( = ?auto_716419 ?auto_716422 ) ) ( not ( = ?auto_716419 ?auto_716423 ) ) ( not ( = ?auto_716419 ?auto_716424 ) ) ( not ( = ?auto_716420 ?auto_716421 ) ) ( not ( = ?auto_716420 ?auto_716422 ) ) ( not ( = ?auto_716420 ?auto_716423 ) ) ( not ( = ?auto_716420 ?auto_716424 ) ) ( not ( = ?auto_716421 ?auto_716422 ) ) ( not ( = ?auto_716421 ?auto_716423 ) ) ( not ( = ?auto_716421 ?auto_716424 ) ) ( not ( = ?auto_716422 ?auto_716423 ) ) ( not ( = ?auto_716422 ?auto_716424 ) ) ( not ( = ?auto_716423 ?auto_716424 ) ) ( ON ?auto_716423 ?auto_716424 ) ( ON ?auto_716422 ?auto_716423 ) ( ON ?auto_716421 ?auto_716422 ) ( CLEAR ?auto_716419 ) ( ON ?auto_716420 ?auto_716421 ) ( CLEAR ?auto_716420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_716408 ?auto_716409 ?auto_716410 ?auto_716411 ?auto_716412 ?auto_716413 ?auto_716414 ?auto_716415 ?auto_716416 ?auto_716417 ?auto_716418 ?auto_716419 ?auto_716420 )
      ( MAKE-17PILE ?auto_716408 ?auto_716409 ?auto_716410 ?auto_716411 ?auto_716412 ?auto_716413 ?auto_716414 ?auto_716415 ?auto_716416 ?auto_716417 ?auto_716418 ?auto_716419 ?auto_716420 ?auto_716421 ?auto_716422 ?auto_716423 ?auto_716424 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716442 - BLOCK
      ?auto_716443 - BLOCK
      ?auto_716444 - BLOCK
      ?auto_716445 - BLOCK
      ?auto_716446 - BLOCK
      ?auto_716447 - BLOCK
      ?auto_716448 - BLOCK
      ?auto_716449 - BLOCK
      ?auto_716450 - BLOCK
      ?auto_716451 - BLOCK
      ?auto_716452 - BLOCK
      ?auto_716453 - BLOCK
      ?auto_716454 - BLOCK
      ?auto_716455 - BLOCK
      ?auto_716456 - BLOCK
      ?auto_716457 - BLOCK
      ?auto_716458 - BLOCK
    )
    :vars
    (
      ?auto_716459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716458 ?auto_716459 ) ( ON-TABLE ?auto_716442 ) ( ON ?auto_716443 ?auto_716442 ) ( ON ?auto_716444 ?auto_716443 ) ( ON ?auto_716445 ?auto_716444 ) ( ON ?auto_716446 ?auto_716445 ) ( ON ?auto_716447 ?auto_716446 ) ( ON ?auto_716448 ?auto_716447 ) ( ON ?auto_716449 ?auto_716448 ) ( ON ?auto_716450 ?auto_716449 ) ( ON ?auto_716451 ?auto_716450 ) ( ON ?auto_716452 ?auto_716451 ) ( not ( = ?auto_716442 ?auto_716443 ) ) ( not ( = ?auto_716442 ?auto_716444 ) ) ( not ( = ?auto_716442 ?auto_716445 ) ) ( not ( = ?auto_716442 ?auto_716446 ) ) ( not ( = ?auto_716442 ?auto_716447 ) ) ( not ( = ?auto_716442 ?auto_716448 ) ) ( not ( = ?auto_716442 ?auto_716449 ) ) ( not ( = ?auto_716442 ?auto_716450 ) ) ( not ( = ?auto_716442 ?auto_716451 ) ) ( not ( = ?auto_716442 ?auto_716452 ) ) ( not ( = ?auto_716442 ?auto_716453 ) ) ( not ( = ?auto_716442 ?auto_716454 ) ) ( not ( = ?auto_716442 ?auto_716455 ) ) ( not ( = ?auto_716442 ?auto_716456 ) ) ( not ( = ?auto_716442 ?auto_716457 ) ) ( not ( = ?auto_716442 ?auto_716458 ) ) ( not ( = ?auto_716442 ?auto_716459 ) ) ( not ( = ?auto_716443 ?auto_716444 ) ) ( not ( = ?auto_716443 ?auto_716445 ) ) ( not ( = ?auto_716443 ?auto_716446 ) ) ( not ( = ?auto_716443 ?auto_716447 ) ) ( not ( = ?auto_716443 ?auto_716448 ) ) ( not ( = ?auto_716443 ?auto_716449 ) ) ( not ( = ?auto_716443 ?auto_716450 ) ) ( not ( = ?auto_716443 ?auto_716451 ) ) ( not ( = ?auto_716443 ?auto_716452 ) ) ( not ( = ?auto_716443 ?auto_716453 ) ) ( not ( = ?auto_716443 ?auto_716454 ) ) ( not ( = ?auto_716443 ?auto_716455 ) ) ( not ( = ?auto_716443 ?auto_716456 ) ) ( not ( = ?auto_716443 ?auto_716457 ) ) ( not ( = ?auto_716443 ?auto_716458 ) ) ( not ( = ?auto_716443 ?auto_716459 ) ) ( not ( = ?auto_716444 ?auto_716445 ) ) ( not ( = ?auto_716444 ?auto_716446 ) ) ( not ( = ?auto_716444 ?auto_716447 ) ) ( not ( = ?auto_716444 ?auto_716448 ) ) ( not ( = ?auto_716444 ?auto_716449 ) ) ( not ( = ?auto_716444 ?auto_716450 ) ) ( not ( = ?auto_716444 ?auto_716451 ) ) ( not ( = ?auto_716444 ?auto_716452 ) ) ( not ( = ?auto_716444 ?auto_716453 ) ) ( not ( = ?auto_716444 ?auto_716454 ) ) ( not ( = ?auto_716444 ?auto_716455 ) ) ( not ( = ?auto_716444 ?auto_716456 ) ) ( not ( = ?auto_716444 ?auto_716457 ) ) ( not ( = ?auto_716444 ?auto_716458 ) ) ( not ( = ?auto_716444 ?auto_716459 ) ) ( not ( = ?auto_716445 ?auto_716446 ) ) ( not ( = ?auto_716445 ?auto_716447 ) ) ( not ( = ?auto_716445 ?auto_716448 ) ) ( not ( = ?auto_716445 ?auto_716449 ) ) ( not ( = ?auto_716445 ?auto_716450 ) ) ( not ( = ?auto_716445 ?auto_716451 ) ) ( not ( = ?auto_716445 ?auto_716452 ) ) ( not ( = ?auto_716445 ?auto_716453 ) ) ( not ( = ?auto_716445 ?auto_716454 ) ) ( not ( = ?auto_716445 ?auto_716455 ) ) ( not ( = ?auto_716445 ?auto_716456 ) ) ( not ( = ?auto_716445 ?auto_716457 ) ) ( not ( = ?auto_716445 ?auto_716458 ) ) ( not ( = ?auto_716445 ?auto_716459 ) ) ( not ( = ?auto_716446 ?auto_716447 ) ) ( not ( = ?auto_716446 ?auto_716448 ) ) ( not ( = ?auto_716446 ?auto_716449 ) ) ( not ( = ?auto_716446 ?auto_716450 ) ) ( not ( = ?auto_716446 ?auto_716451 ) ) ( not ( = ?auto_716446 ?auto_716452 ) ) ( not ( = ?auto_716446 ?auto_716453 ) ) ( not ( = ?auto_716446 ?auto_716454 ) ) ( not ( = ?auto_716446 ?auto_716455 ) ) ( not ( = ?auto_716446 ?auto_716456 ) ) ( not ( = ?auto_716446 ?auto_716457 ) ) ( not ( = ?auto_716446 ?auto_716458 ) ) ( not ( = ?auto_716446 ?auto_716459 ) ) ( not ( = ?auto_716447 ?auto_716448 ) ) ( not ( = ?auto_716447 ?auto_716449 ) ) ( not ( = ?auto_716447 ?auto_716450 ) ) ( not ( = ?auto_716447 ?auto_716451 ) ) ( not ( = ?auto_716447 ?auto_716452 ) ) ( not ( = ?auto_716447 ?auto_716453 ) ) ( not ( = ?auto_716447 ?auto_716454 ) ) ( not ( = ?auto_716447 ?auto_716455 ) ) ( not ( = ?auto_716447 ?auto_716456 ) ) ( not ( = ?auto_716447 ?auto_716457 ) ) ( not ( = ?auto_716447 ?auto_716458 ) ) ( not ( = ?auto_716447 ?auto_716459 ) ) ( not ( = ?auto_716448 ?auto_716449 ) ) ( not ( = ?auto_716448 ?auto_716450 ) ) ( not ( = ?auto_716448 ?auto_716451 ) ) ( not ( = ?auto_716448 ?auto_716452 ) ) ( not ( = ?auto_716448 ?auto_716453 ) ) ( not ( = ?auto_716448 ?auto_716454 ) ) ( not ( = ?auto_716448 ?auto_716455 ) ) ( not ( = ?auto_716448 ?auto_716456 ) ) ( not ( = ?auto_716448 ?auto_716457 ) ) ( not ( = ?auto_716448 ?auto_716458 ) ) ( not ( = ?auto_716448 ?auto_716459 ) ) ( not ( = ?auto_716449 ?auto_716450 ) ) ( not ( = ?auto_716449 ?auto_716451 ) ) ( not ( = ?auto_716449 ?auto_716452 ) ) ( not ( = ?auto_716449 ?auto_716453 ) ) ( not ( = ?auto_716449 ?auto_716454 ) ) ( not ( = ?auto_716449 ?auto_716455 ) ) ( not ( = ?auto_716449 ?auto_716456 ) ) ( not ( = ?auto_716449 ?auto_716457 ) ) ( not ( = ?auto_716449 ?auto_716458 ) ) ( not ( = ?auto_716449 ?auto_716459 ) ) ( not ( = ?auto_716450 ?auto_716451 ) ) ( not ( = ?auto_716450 ?auto_716452 ) ) ( not ( = ?auto_716450 ?auto_716453 ) ) ( not ( = ?auto_716450 ?auto_716454 ) ) ( not ( = ?auto_716450 ?auto_716455 ) ) ( not ( = ?auto_716450 ?auto_716456 ) ) ( not ( = ?auto_716450 ?auto_716457 ) ) ( not ( = ?auto_716450 ?auto_716458 ) ) ( not ( = ?auto_716450 ?auto_716459 ) ) ( not ( = ?auto_716451 ?auto_716452 ) ) ( not ( = ?auto_716451 ?auto_716453 ) ) ( not ( = ?auto_716451 ?auto_716454 ) ) ( not ( = ?auto_716451 ?auto_716455 ) ) ( not ( = ?auto_716451 ?auto_716456 ) ) ( not ( = ?auto_716451 ?auto_716457 ) ) ( not ( = ?auto_716451 ?auto_716458 ) ) ( not ( = ?auto_716451 ?auto_716459 ) ) ( not ( = ?auto_716452 ?auto_716453 ) ) ( not ( = ?auto_716452 ?auto_716454 ) ) ( not ( = ?auto_716452 ?auto_716455 ) ) ( not ( = ?auto_716452 ?auto_716456 ) ) ( not ( = ?auto_716452 ?auto_716457 ) ) ( not ( = ?auto_716452 ?auto_716458 ) ) ( not ( = ?auto_716452 ?auto_716459 ) ) ( not ( = ?auto_716453 ?auto_716454 ) ) ( not ( = ?auto_716453 ?auto_716455 ) ) ( not ( = ?auto_716453 ?auto_716456 ) ) ( not ( = ?auto_716453 ?auto_716457 ) ) ( not ( = ?auto_716453 ?auto_716458 ) ) ( not ( = ?auto_716453 ?auto_716459 ) ) ( not ( = ?auto_716454 ?auto_716455 ) ) ( not ( = ?auto_716454 ?auto_716456 ) ) ( not ( = ?auto_716454 ?auto_716457 ) ) ( not ( = ?auto_716454 ?auto_716458 ) ) ( not ( = ?auto_716454 ?auto_716459 ) ) ( not ( = ?auto_716455 ?auto_716456 ) ) ( not ( = ?auto_716455 ?auto_716457 ) ) ( not ( = ?auto_716455 ?auto_716458 ) ) ( not ( = ?auto_716455 ?auto_716459 ) ) ( not ( = ?auto_716456 ?auto_716457 ) ) ( not ( = ?auto_716456 ?auto_716458 ) ) ( not ( = ?auto_716456 ?auto_716459 ) ) ( not ( = ?auto_716457 ?auto_716458 ) ) ( not ( = ?auto_716457 ?auto_716459 ) ) ( not ( = ?auto_716458 ?auto_716459 ) ) ( ON ?auto_716457 ?auto_716458 ) ( ON ?auto_716456 ?auto_716457 ) ( ON ?auto_716455 ?auto_716456 ) ( ON ?auto_716454 ?auto_716455 ) ( CLEAR ?auto_716452 ) ( ON ?auto_716453 ?auto_716454 ) ( CLEAR ?auto_716453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_716442 ?auto_716443 ?auto_716444 ?auto_716445 ?auto_716446 ?auto_716447 ?auto_716448 ?auto_716449 ?auto_716450 ?auto_716451 ?auto_716452 ?auto_716453 )
      ( MAKE-17PILE ?auto_716442 ?auto_716443 ?auto_716444 ?auto_716445 ?auto_716446 ?auto_716447 ?auto_716448 ?auto_716449 ?auto_716450 ?auto_716451 ?auto_716452 ?auto_716453 ?auto_716454 ?auto_716455 ?auto_716456 ?auto_716457 ?auto_716458 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716477 - BLOCK
      ?auto_716478 - BLOCK
      ?auto_716479 - BLOCK
      ?auto_716480 - BLOCK
      ?auto_716481 - BLOCK
      ?auto_716482 - BLOCK
      ?auto_716483 - BLOCK
      ?auto_716484 - BLOCK
      ?auto_716485 - BLOCK
      ?auto_716486 - BLOCK
      ?auto_716487 - BLOCK
      ?auto_716488 - BLOCK
      ?auto_716489 - BLOCK
      ?auto_716490 - BLOCK
      ?auto_716491 - BLOCK
      ?auto_716492 - BLOCK
      ?auto_716493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716493 ) ( ON-TABLE ?auto_716477 ) ( ON ?auto_716478 ?auto_716477 ) ( ON ?auto_716479 ?auto_716478 ) ( ON ?auto_716480 ?auto_716479 ) ( ON ?auto_716481 ?auto_716480 ) ( ON ?auto_716482 ?auto_716481 ) ( ON ?auto_716483 ?auto_716482 ) ( ON ?auto_716484 ?auto_716483 ) ( ON ?auto_716485 ?auto_716484 ) ( ON ?auto_716486 ?auto_716485 ) ( ON ?auto_716487 ?auto_716486 ) ( not ( = ?auto_716477 ?auto_716478 ) ) ( not ( = ?auto_716477 ?auto_716479 ) ) ( not ( = ?auto_716477 ?auto_716480 ) ) ( not ( = ?auto_716477 ?auto_716481 ) ) ( not ( = ?auto_716477 ?auto_716482 ) ) ( not ( = ?auto_716477 ?auto_716483 ) ) ( not ( = ?auto_716477 ?auto_716484 ) ) ( not ( = ?auto_716477 ?auto_716485 ) ) ( not ( = ?auto_716477 ?auto_716486 ) ) ( not ( = ?auto_716477 ?auto_716487 ) ) ( not ( = ?auto_716477 ?auto_716488 ) ) ( not ( = ?auto_716477 ?auto_716489 ) ) ( not ( = ?auto_716477 ?auto_716490 ) ) ( not ( = ?auto_716477 ?auto_716491 ) ) ( not ( = ?auto_716477 ?auto_716492 ) ) ( not ( = ?auto_716477 ?auto_716493 ) ) ( not ( = ?auto_716478 ?auto_716479 ) ) ( not ( = ?auto_716478 ?auto_716480 ) ) ( not ( = ?auto_716478 ?auto_716481 ) ) ( not ( = ?auto_716478 ?auto_716482 ) ) ( not ( = ?auto_716478 ?auto_716483 ) ) ( not ( = ?auto_716478 ?auto_716484 ) ) ( not ( = ?auto_716478 ?auto_716485 ) ) ( not ( = ?auto_716478 ?auto_716486 ) ) ( not ( = ?auto_716478 ?auto_716487 ) ) ( not ( = ?auto_716478 ?auto_716488 ) ) ( not ( = ?auto_716478 ?auto_716489 ) ) ( not ( = ?auto_716478 ?auto_716490 ) ) ( not ( = ?auto_716478 ?auto_716491 ) ) ( not ( = ?auto_716478 ?auto_716492 ) ) ( not ( = ?auto_716478 ?auto_716493 ) ) ( not ( = ?auto_716479 ?auto_716480 ) ) ( not ( = ?auto_716479 ?auto_716481 ) ) ( not ( = ?auto_716479 ?auto_716482 ) ) ( not ( = ?auto_716479 ?auto_716483 ) ) ( not ( = ?auto_716479 ?auto_716484 ) ) ( not ( = ?auto_716479 ?auto_716485 ) ) ( not ( = ?auto_716479 ?auto_716486 ) ) ( not ( = ?auto_716479 ?auto_716487 ) ) ( not ( = ?auto_716479 ?auto_716488 ) ) ( not ( = ?auto_716479 ?auto_716489 ) ) ( not ( = ?auto_716479 ?auto_716490 ) ) ( not ( = ?auto_716479 ?auto_716491 ) ) ( not ( = ?auto_716479 ?auto_716492 ) ) ( not ( = ?auto_716479 ?auto_716493 ) ) ( not ( = ?auto_716480 ?auto_716481 ) ) ( not ( = ?auto_716480 ?auto_716482 ) ) ( not ( = ?auto_716480 ?auto_716483 ) ) ( not ( = ?auto_716480 ?auto_716484 ) ) ( not ( = ?auto_716480 ?auto_716485 ) ) ( not ( = ?auto_716480 ?auto_716486 ) ) ( not ( = ?auto_716480 ?auto_716487 ) ) ( not ( = ?auto_716480 ?auto_716488 ) ) ( not ( = ?auto_716480 ?auto_716489 ) ) ( not ( = ?auto_716480 ?auto_716490 ) ) ( not ( = ?auto_716480 ?auto_716491 ) ) ( not ( = ?auto_716480 ?auto_716492 ) ) ( not ( = ?auto_716480 ?auto_716493 ) ) ( not ( = ?auto_716481 ?auto_716482 ) ) ( not ( = ?auto_716481 ?auto_716483 ) ) ( not ( = ?auto_716481 ?auto_716484 ) ) ( not ( = ?auto_716481 ?auto_716485 ) ) ( not ( = ?auto_716481 ?auto_716486 ) ) ( not ( = ?auto_716481 ?auto_716487 ) ) ( not ( = ?auto_716481 ?auto_716488 ) ) ( not ( = ?auto_716481 ?auto_716489 ) ) ( not ( = ?auto_716481 ?auto_716490 ) ) ( not ( = ?auto_716481 ?auto_716491 ) ) ( not ( = ?auto_716481 ?auto_716492 ) ) ( not ( = ?auto_716481 ?auto_716493 ) ) ( not ( = ?auto_716482 ?auto_716483 ) ) ( not ( = ?auto_716482 ?auto_716484 ) ) ( not ( = ?auto_716482 ?auto_716485 ) ) ( not ( = ?auto_716482 ?auto_716486 ) ) ( not ( = ?auto_716482 ?auto_716487 ) ) ( not ( = ?auto_716482 ?auto_716488 ) ) ( not ( = ?auto_716482 ?auto_716489 ) ) ( not ( = ?auto_716482 ?auto_716490 ) ) ( not ( = ?auto_716482 ?auto_716491 ) ) ( not ( = ?auto_716482 ?auto_716492 ) ) ( not ( = ?auto_716482 ?auto_716493 ) ) ( not ( = ?auto_716483 ?auto_716484 ) ) ( not ( = ?auto_716483 ?auto_716485 ) ) ( not ( = ?auto_716483 ?auto_716486 ) ) ( not ( = ?auto_716483 ?auto_716487 ) ) ( not ( = ?auto_716483 ?auto_716488 ) ) ( not ( = ?auto_716483 ?auto_716489 ) ) ( not ( = ?auto_716483 ?auto_716490 ) ) ( not ( = ?auto_716483 ?auto_716491 ) ) ( not ( = ?auto_716483 ?auto_716492 ) ) ( not ( = ?auto_716483 ?auto_716493 ) ) ( not ( = ?auto_716484 ?auto_716485 ) ) ( not ( = ?auto_716484 ?auto_716486 ) ) ( not ( = ?auto_716484 ?auto_716487 ) ) ( not ( = ?auto_716484 ?auto_716488 ) ) ( not ( = ?auto_716484 ?auto_716489 ) ) ( not ( = ?auto_716484 ?auto_716490 ) ) ( not ( = ?auto_716484 ?auto_716491 ) ) ( not ( = ?auto_716484 ?auto_716492 ) ) ( not ( = ?auto_716484 ?auto_716493 ) ) ( not ( = ?auto_716485 ?auto_716486 ) ) ( not ( = ?auto_716485 ?auto_716487 ) ) ( not ( = ?auto_716485 ?auto_716488 ) ) ( not ( = ?auto_716485 ?auto_716489 ) ) ( not ( = ?auto_716485 ?auto_716490 ) ) ( not ( = ?auto_716485 ?auto_716491 ) ) ( not ( = ?auto_716485 ?auto_716492 ) ) ( not ( = ?auto_716485 ?auto_716493 ) ) ( not ( = ?auto_716486 ?auto_716487 ) ) ( not ( = ?auto_716486 ?auto_716488 ) ) ( not ( = ?auto_716486 ?auto_716489 ) ) ( not ( = ?auto_716486 ?auto_716490 ) ) ( not ( = ?auto_716486 ?auto_716491 ) ) ( not ( = ?auto_716486 ?auto_716492 ) ) ( not ( = ?auto_716486 ?auto_716493 ) ) ( not ( = ?auto_716487 ?auto_716488 ) ) ( not ( = ?auto_716487 ?auto_716489 ) ) ( not ( = ?auto_716487 ?auto_716490 ) ) ( not ( = ?auto_716487 ?auto_716491 ) ) ( not ( = ?auto_716487 ?auto_716492 ) ) ( not ( = ?auto_716487 ?auto_716493 ) ) ( not ( = ?auto_716488 ?auto_716489 ) ) ( not ( = ?auto_716488 ?auto_716490 ) ) ( not ( = ?auto_716488 ?auto_716491 ) ) ( not ( = ?auto_716488 ?auto_716492 ) ) ( not ( = ?auto_716488 ?auto_716493 ) ) ( not ( = ?auto_716489 ?auto_716490 ) ) ( not ( = ?auto_716489 ?auto_716491 ) ) ( not ( = ?auto_716489 ?auto_716492 ) ) ( not ( = ?auto_716489 ?auto_716493 ) ) ( not ( = ?auto_716490 ?auto_716491 ) ) ( not ( = ?auto_716490 ?auto_716492 ) ) ( not ( = ?auto_716490 ?auto_716493 ) ) ( not ( = ?auto_716491 ?auto_716492 ) ) ( not ( = ?auto_716491 ?auto_716493 ) ) ( not ( = ?auto_716492 ?auto_716493 ) ) ( ON ?auto_716492 ?auto_716493 ) ( ON ?auto_716491 ?auto_716492 ) ( ON ?auto_716490 ?auto_716491 ) ( ON ?auto_716489 ?auto_716490 ) ( CLEAR ?auto_716487 ) ( ON ?auto_716488 ?auto_716489 ) ( CLEAR ?auto_716488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_716477 ?auto_716478 ?auto_716479 ?auto_716480 ?auto_716481 ?auto_716482 ?auto_716483 ?auto_716484 ?auto_716485 ?auto_716486 ?auto_716487 ?auto_716488 )
      ( MAKE-17PILE ?auto_716477 ?auto_716478 ?auto_716479 ?auto_716480 ?auto_716481 ?auto_716482 ?auto_716483 ?auto_716484 ?auto_716485 ?auto_716486 ?auto_716487 ?auto_716488 ?auto_716489 ?auto_716490 ?auto_716491 ?auto_716492 ?auto_716493 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716511 - BLOCK
      ?auto_716512 - BLOCK
      ?auto_716513 - BLOCK
      ?auto_716514 - BLOCK
      ?auto_716515 - BLOCK
      ?auto_716516 - BLOCK
      ?auto_716517 - BLOCK
      ?auto_716518 - BLOCK
      ?auto_716519 - BLOCK
      ?auto_716520 - BLOCK
      ?auto_716521 - BLOCK
      ?auto_716522 - BLOCK
      ?auto_716523 - BLOCK
      ?auto_716524 - BLOCK
      ?auto_716525 - BLOCK
      ?auto_716526 - BLOCK
      ?auto_716527 - BLOCK
    )
    :vars
    (
      ?auto_716528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716527 ?auto_716528 ) ( ON-TABLE ?auto_716511 ) ( ON ?auto_716512 ?auto_716511 ) ( ON ?auto_716513 ?auto_716512 ) ( ON ?auto_716514 ?auto_716513 ) ( ON ?auto_716515 ?auto_716514 ) ( ON ?auto_716516 ?auto_716515 ) ( ON ?auto_716517 ?auto_716516 ) ( ON ?auto_716518 ?auto_716517 ) ( ON ?auto_716519 ?auto_716518 ) ( ON ?auto_716520 ?auto_716519 ) ( not ( = ?auto_716511 ?auto_716512 ) ) ( not ( = ?auto_716511 ?auto_716513 ) ) ( not ( = ?auto_716511 ?auto_716514 ) ) ( not ( = ?auto_716511 ?auto_716515 ) ) ( not ( = ?auto_716511 ?auto_716516 ) ) ( not ( = ?auto_716511 ?auto_716517 ) ) ( not ( = ?auto_716511 ?auto_716518 ) ) ( not ( = ?auto_716511 ?auto_716519 ) ) ( not ( = ?auto_716511 ?auto_716520 ) ) ( not ( = ?auto_716511 ?auto_716521 ) ) ( not ( = ?auto_716511 ?auto_716522 ) ) ( not ( = ?auto_716511 ?auto_716523 ) ) ( not ( = ?auto_716511 ?auto_716524 ) ) ( not ( = ?auto_716511 ?auto_716525 ) ) ( not ( = ?auto_716511 ?auto_716526 ) ) ( not ( = ?auto_716511 ?auto_716527 ) ) ( not ( = ?auto_716511 ?auto_716528 ) ) ( not ( = ?auto_716512 ?auto_716513 ) ) ( not ( = ?auto_716512 ?auto_716514 ) ) ( not ( = ?auto_716512 ?auto_716515 ) ) ( not ( = ?auto_716512 ?auto_716516 ) ) ( not ( = ?auto_716512 ?auto_716517 ) ) ( not ( = ?auto_716512 ?auto_716518 ) ) ( not ( = ?auto_716512 ?auto_716519 ) ) ( not ( = ?auto_716512 ?auto_716520 ) ) ( not ( = ?auto_716512 ?auto_716521 ) ) ( not ( = ?auto_716512 ?auto_716522 ) ) ( not ( = ?auto_716512 ?auto_716523 ) ) ( not ( = ?auto_716512 ?auto_716524 ) ) ( not ( = ?auto_716512 ?auto_716525 ) ) ( not ( = ?auto_716512 ?auto_716526 ) ) ( not ( = ?auto_716512 ?auto_716527 ) ) ( not ( = ?auto_716512 ?auto_716528 ) ) ( not ( = ?auto_716513 ?auto_716514 ) ) ( not ( = ?auto_716513 ?auto_716515 ) ) ( not ( = ?auto_716513 ?auto_716516 ) ) ( not ( = ?auto_716513 ?auto_716517 ) ) ( not ( = ?auto_716513 ?auto_716518 ) ) ( not ( = ?auto_716513 ?auto_716519 ) ) ( not ( = ?auto_716513 ?auto_716520 ) ) ( not ( = ?auto_716513 ?auto_716521 ) ) ( not ( = ?auto_716513 ?auto_716522 ) ) ( not ( = ?auto_716513 ?auto_716523 ) ) ( not ( = ?auto_716513 ?auto_716524 ) ) ( not ( = ?auto_716513 ?auto_716525 ) ) ( not ( = ?auto_716513 ?auto_716526 ) ) ( not ( = ?auto_716513 ?auto_716527 ) ) ( not ( = ?auto_716513 ?auto_716528 ) ) ( not ( = ?auto_716514 ?auto_716515 ) ) ( not ( = ?auto_716514 ?auto_716516 ) ) ( not ( = ?auto_716514 ?auto_716517 ) ) ( not ( = ?auto_716514 ?auto_716518 ) ) ( not ( = ?auto_716514 ?auto_716519 ) ) ( not ( = ?auto_716514 ?auto_716520 ) ) ( not ( = ?auto_716514 ?auto_716521 ) ) ( not ( = ?auto_716514 ?auto_716522 ) ) ( not ( = ?auto_716514 ?auto_716523 ) ) ( not ( = ?auto_716514 ?auto_716524 ) ) ( not ( = ?auto_716514 ?auto_716525 ) ) ( not ( = ?auto_716514 ?auto_716526 ) ) ( not ( = ?auto_716514 ?auto_716527 ) ) ( not ( = ?auto_716514 ?auto_716528 ) ) ( not ( = ?auto_716515 ?auto_716516 ) ) ( not ( = ?auto_716515 ?auto_716517 ) ) ( not ( = ?auto_716515 ?auto_716518 ) ) ( not ( = ?auto_716515 ?auto_716519 ) ) ( not ( = ?auto_716515 ?auto_716520 ) ) ( not ( = ?auto_716515 ?auto_716521 ) ) ( not ( = ?auto_716515 ?auto_716522 ) ) ( not ( = ?auto_716515 ?auto_716523 ) ) ( not ( = ?auto_716515 ?auto_716524 ) ) ( not ( = ?auto_716515 ?auto_716525 ) ) ( not ( = ?auto_716515 ?auto_716526 ) ) ( not ( = ?auto_716515 ?auto_716527 ) ) ( not ( = ?auto_716515 ?auto_716528 ) ) ( not ( = ?auto_716516 ?auto_716517 ) ) ( not ( = ?auto_716516 ?auto_716518 ) ) ( not ( = ?auto_716516 ?auto_716519 ) ) ( not ( = ?auto_716516 ?auto_716520 ) ) ( not ( = ?auto_716516 ?auto_716521 ) ) ( not ( = ?auto_716516 ?auto_716522 ) ) ( not ( = ?auto_716516 ?auto_716523 ) ) ( not ( = ?auto_716516 ?auto_716524 ) ) ( not ( = ?auto_716516 ?auto_716525 ) ) ( not ( = ?auto_716516 ?auto_716526 ) ) ( not ( = ?auto_716516 ?auto_716527 ) ) ( not ( = ?auto_716516 ?auto_716528 ) ) ( not ( = ?auto_716517 ?auto_716518 ) ) ( not ( = ?auto_716517 ?auto_716519 ) ) ( not ( = ?auto_716517 ?auto_716520 ) ) ( not ( = ?auto_716517 ?auto_716521 ) ) ( not ( = ?auto_716517 ?auto_716522 ) ) ( not ( = ?auto_716517 ?auto_716523 ) ) ( not ( = ?auto_716517 ?auto_716524 ) ) ( not ( = ?auto_716517 ?auto_716525 ) ) ( not ( = ?auto_716517 ?auto_716526 ) ) ( not ( = ?auto_716517 ?auto_716527 ) ) ( not ( = ?auto_716517 ?auto_716528 ) ) ( not ( = ?auto_716518 ?auto_716519 ) ) ( not ( = ?auto_716518 ?auto_716520 ) ) ( not ( = ?auto_716518 ?auto_716521 ) ) ( not ( = ?auto_716518 ?auto_716522 ) ) ( not ( = ?auto_716518 ?auto_716523 ) ) ( not ( = ?auto_716518 ?auto_716524 ) ) ( not ( = ?auto_716518 ?auto_716525 ) ) ( not ( = ?auto_716518 ?auto_716526 ) ) ( not ( = ?auto_716518 ?auto_716527 ) ) ( not ( = ?auto_716518 ?auto_716528 ) ) ( not ( = ?auto_716519 ?auto_716520 ) ) ( not ( = ?auto_716519 ?auto_716521 ) ) ( not ( = ?auto_716519 ?auto_716522 ) ) ( not ( = ?auto_716519 ?auto_716523 ) ) ( not ( = ?auto_716519 ?auto_716524 ) ) ( not ( = ?auto_716519 ?auto_716525 ) ) ( not ( = ?auto_716519 ?auto_716526 ) ) ( not ( = ?auto_716519 ?auto_716527 ) ) ( not ( = ?auto_716519 ?auto_716528 ) ) ( not ( = ?auto_716520 ?auto_716521 ) ) ( not ( = ?auto_716520 ?auto_716522 ) ) ( not ( = ?auto_716520 ?auto_716523 ) ) ( not ( = ?auto_716520 ?auto_716524 ) ) ( not ( = ?auto_716520 ?auto_716525 ) ) ( not ( = ?auto_716520 ?auto_716526 ) ) ( not ( = ?auto_716520 ?auto_716527 ) ) ( not ( = ?auto_716520 ?auto_716528 ) ) ( not ( = ?auto_716521 ?auto_716522 ) ) ( not ( = ?auto_716521 ?auto_716523 ) ) ( not ( = ?auto_716521 ?auto_716524 ) ) ( not ( = ?auto_716521 ?auto_716525 ) ) ( not ( = ?auto_716521 ?auto_716526 ) ) ( not ( = ?auto_716521 ?auto_716527 ) ) ( not ( = ?auto_716521 ?auto_716528 ) ) ( not ( = ?auto_716522 ?auto_716523 ) ) ( not ( = ?auto_716522 ?auto_716524 ) ) ( not ( = ?auto_716522 ?auto_716525 ) ) ( not ( = ?auto_716522 ?auto_716526 ) ) ( not ( = ?auto_716522 ?auto_716527 ) ) ( not ( = ?auto_716522 ?auto_716528 ) ) ( not ( = ?auto_716523 ?auto_716524 ) ) ( not ( = ?auto_716523 ?auto_716525 ) ) ( not ( = ?auto_716523 ?auto_716526 ) ) ( not ( = ?auto_716523 ?auto_716527 ) ) ( not ( = ?auto_716523 ?auto_716528 ) ) ( not ( = ?auto_716524 ?auto_716525 ) ) ( not ( = ?auto_716524 ?auto_716526 ) ) ( not ( = ?auto_716524 ?auto_716527 ) ) ( not ( = ?auto_716524 ?auto_716528 ) ) ( not ( = ?auto_716525 ?auto_716526 ) ) ( not ( = ?auto_716525 ?auto_716527 ) ) ( not ( = ?auto_716525 ?auto_716528 ) ) ( not ( = ?auto_716526 ?auto_716527 ) ) ( not ( = ?auto_716526 ?auto_716528 ) ) ( not ( = ?auto_716527 ?auto_716528 ) ) ( ON ?auto_716526 ?auto_716527 ) ( ON ?auto_716525 ?auto_716526 ) ( ON ?auto_716524 ?auto_716525 ) ( ON ?auto_716523 ?auto_716524 ) ( ON ?auto_716522 ?auto_716523 ) ( CLEAR ?auto_716520 ) ( ON ?auto_716521 ?auto_716522 ) ( CLEAR ?auto_716521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_716511 ?auto_716512 ?auto_716513 ?auto_716514 ?auto_716515 ?auto_716516 ?auto_716517 ?auto_716518 ?auto_716519 ?auto_716520 ?auto_716521 )
      ( MAKE-17PILE ?auto_716511 ?auto_716512 ?auto_716513 ?auto_716514 ?auto_716515 ?auto_716516 ?auto_716517 ?auto_716518 ?auto_716519 ?auto_716520 ?auto_716521 ?auto_716522 ?auto_716523 ?auto_716524 ?auto_716525 ?auto_716526 ?auto_716527 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716546 - BLOCK
      ?auto_716547 - BLOCK
      ?auto_716548 - BLOCK
      ?auto_716549 - BLOCK
      ?auto_716550 - BLOCK
      ?auto_716551 - BLOCK
      ?auto_716552 - BLOCK
      ?auto_716553 - BLOCK
      ?auto_716554 - BLOCK
      ?auto_716555 - BLOCK
      ?auto_716556 - BLOCK
      ?auto_716557 - BLOCK
      ?auto_716558 - BLOCK
      ?auto_716559 - BLOCK
      ?auto_716560 - BLOCK
      ?auto_716561 - BLOCK
      ?auto_716562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716562 ) ( ON-TABLE ?auto_716546 ) ( ON ?auto_716547 ?auto_716546 ) ( ON ?auto_716548 ?auto_716547 ) ( ON ?auto_716549 ?auto_716548 ) ( ON ?auto_716550 ?auto_716549 ) ( ON ?auto_716551 ?auto_716550 ) ( ON ?auto_716552 ?auto_716551 ) ( ON ?auto_716553 ?auto_716552 ) ( ON ?auto_716554 ?auto_716553 ) ( ON ?auto_716555 ?auto_716554 ) ( not ( = ?auto_716546 ?auto_716547 ) ) ( not ( = ?auto_716546 ?auto_716548 ) ) ( not ( = ?auto_716546 ?auto_716549 ) ) ( not ( = ?auto_716546 ?auto_716550 ) ) ( not ( = ?auto_716546 ?auto_716551 ) ) ( not ( = ?auto_716546 ?auto_716552 ) ) ( not ( = ?auto_716546 ?auto_716553 ) ) ( not ( = ?auto_716546 ?auto_716554 ) ) ( not ( = ?auto_716546 ?auto_716555 ) ) ( not ( = ?auto_716546 ?auto_716556 ) ) ( not ( = ?auto_716546 ?auto_716557 ) ) ( not ( = ?auto_716546 ?auto_716558 ) ) ( not ( = ?auto_716546 ?auto_716559 ) ) ( not ( = ?auto_716546 ?auto_716560 ) ) ( not ( = ?auto_716546 ?auto_716561 ) ) ( not ( = ?auto_716546 ?auto_716562 ) ) ( not ( = ?auto_716547 ?auto_716548 ) ) ( not ( = ?auto_716547 ?auto_716549 ) ) ( not ( = ?auto_716547 ?auto_716550 ) ) ( not ( = ?auto_716547 ?auto_716551 ) ) ( not ( = ?auto_716547 ?auto_716552 ) ) ( not ( = ?auto_716547 ?auto_716553 ) ) ( not ( = ?auto_716547 ?auto_716554 ) ) ( not ( = ?auto_716547 ?auto_716555 ) ) ( not ( = ?auto_716547 ?auto_716556 ) ) ( not ( = ?auto_716547 ?auto_716557 ) ) ( not ( = ?auto_716547 ?auto_716558 ) ) ( not ( = ?auto_716547 ?auto_716559 ) ) ( not ( = ?auto_716547 ?auto_716560 ) ) ( not ( = ?auto_716547 ?auto_716561 ) ) ( not ( = ?auto_716547 ?auto_716562 ) ) ( not ( = ?auto_716548 ?auto_716549 ) ) ( not ( = ?auto_716548 ?auto_716550 ) ) ( not ( = ?auto_716548 ?auto_716551 ) ) ( not ( = ?auto_716548 ?auto_716552 ) ) ( not ( = ?auto_716548 ?auto_716553 ) ) ( not ( = ?auto_716548 ?auto_716554 ) ) ( not ( = ?auto_716548 ?auto_716555 ) ) ( not ( = ?auto_716548 ?auto_716556 ) ) ( not ( = ?auto_716548 ?auto_716557 ) ) ( not ( = ?auto_716548 ?auto_716558 ) ) ( not ( = ?auto_716548 ?auto_716559 ) ) ( not ( = ?auto_716548 ?auto_716560 ) ) ( not ( = ?auto_716548 ?auto_716561 ) ) ( not ( = ?auto_716548 ?auto_716562 ) ) ( not ( = ?auto_716549 ?auto_716550 ) ) ( not ( = ?auto_716549 ?auto_716551 ) ) ( not ( = ?auto_716549 ?auto_716552 ) ) ( not ( = ?auto_716549 ?auto_716553 ) ) ( not ( = ?auto_716549 ?auto_716554 ) ) ( not ( = ?auto_716549 ?auto_716555 ) ) ( not ( = ?auto_716549 ?auto_716556 ) ) ( not ( = ?auto_716549 ?auto_716557 ) ) ( not ( = ?auto_716549 ?auto_716558 ) ) ( not ( = ?auto_716549 ?auto_716559 ) ) ( not ( = ?auto_716549 ?auto_716560 ) ) ( not ( = ?auto_716549 ?auto_716561 ) ) ( not ( = ?auto_716549 ?auto_716562 ) ) ( not ( = ?auto_716550 ?auto_716551 ) ) ( not ( = ?auto_716550 ?auto_716552 ) ) ( not ( = ?auto_716550 ?auto_716553 ) ) ( not ( = ?auto_716550 ?auto_716554 ) ) ( not ( = ?auto_716550 ?auto_716555 ) ) ( not ( = ?auto_716550 ?auto_716556 ) ) ( not ( = ?auto_716550 ?auto_716557 ) ) ( not ( = ?auto_716550 ?auto_716558 ) ) ( not ( = ?auto_716550 ?auto_716559 ) ) ( not ( = ?auto_716550 ?auto_716560 ) ) ( not ( = ?auto_716550 ?auto_716561 ) ) ( not ( = ?auto_716550 ?auto_716562 ) ) ( not ( = ?auto_716551 ?auto_716552 ) ) ( not ( = ?auto_716551 ?auto_716553 ) ) ( not ( = ?auto_716551 ?auto_716554 ) ) ( not ( = ?auto_716551 ?auto_716555 ) ) ( not ( = ?auto_716551 ?auto_716556 ) ) ( not ( = ?auto_716551 ?auto_716557 ) ) ( not ( = ?auto_716551 ?auto_716558 ) ) ( not ( = ?auto_716551 ?auto_716559 ) ) ( not ( = ?auto_716551 ?auto_716560 ) ) ( not ( = ?auto_716551 ?auto_716561 ) ) ( not ( = ?auto_716551 ?auto_716562 ) ) ( not ( = ?auto_716552 ?auto_716553 ) ) ( not ( = ?auto_716552 ?auto_716554 ) ) ( not ( = ?auto_716552 ?auto_716555 ) ) ( not ( = ?auto_716552 ?auto_716556 ) ) ( not ( = ?auto_716552 ?auto_716557 ) ) ( not ( = ?auto_716552 ?auto_716558 ) ) ( not ( = ?auto_716552 ?auto_716559 ) ) ( not ( = ?auto_716552 ?auto_716560 ) ) ( not ( = ?auto_716552 ?auto_716561 ) ) ( not ( = ?auto_716552 ?auto_716562 ) ) ( not ( = ?auto_716553 ?auto_716554 ) ) ( not ( = ?auto_716553 ?auto_716555 ) ) ( not ( = ?auto_716553 ?auto_716556 ) ) ( not ( = ?auto_716553 ?auto_716557 ) ) ( not ( = ?auto_716553 ?auto_716558 ) ) ( not ( = ?auto_716553 ?auto_716559 ) ) ( not ( = ?auto_716553 ?auto_716560 ) ) ( not ( = ?auto_716553 ?auto_716561 ) ) ( not ( = ?auto_716553 ?auto_716562 ) ) ( not ( = ?auto_716554 ?auto_716555 ) ) ( not ( = ?auto_716554 ?auto_716556 ) ) ( not ( = ?auto_716554 ?auto_716557 ) ) ( not ( = ?auto_716554 ?auto_716558 ) ) ( not ( = ?auto_716554 ?auto_716559 ) ) ( not ( = ?auto_716554 ?auto_716560 ) ) ( not ( = ?auto_716554 ?auto_716561 ) ) ( not ( = ?auto_716554 ?auto_716562 ) ) ( not ( = ?auto_716555 ?auto_716556 ) ) ( not ( = ?auto_716555 ?auto_716557 ) ) ( not ( = ?auto_716555 ?auto_716558 ) ) ( not ( = ?auto_716555 ?auto_716559 ) ) ( not ( = ?auto_716555 ?auto_716560 ) ) ( not ( = ?auto_716555 ?auto_716561 ) ) ( not ( = ?auto_716555 ?auto_716562 ) ) ( not ( = ?auto_716556 ?auto_716557 ) ) ( not ( = ?auto_716556 ?auto_716558 ) ) ( not ( = ?auto_716556 ?auto_716559 ) ) ( not ( = ?auto_716556 ?auto_716560 ) ) ( not ( = ?auto_716556 ?auto_716561 ) ) ( not ( = ?auto_716556 ?auto_716562 ) ) ( not ( = ?auto_716557 ?auto_716558 ) ) ( not ( = ?auto_716557 ?auto_716559 ) ) ( not ( = ?auto_716557 ?auto_716560 ) ) ( not ( = ?auto_716557 ?auto_716561 ) ) ( not ( = ?auto_716557 ?auto_716562 ) ) ( not ( = ?auto_716558 ?auto_716559 ) ) ( not ( = ?auto_716558 ?auto_716560 ) ) ( not ( = ?auto_716558 ?auto_716561 ) ) ( not ( = ?auto_716558 ?auto_716562 ) ) ( not ( = ?auto_716559 ?auto_716560 ) ) ( not ( = ?auto_716559 ?auto_716561 ) ) ( not ( = ?auto_716559 ?auto_716562 ) ) ( not ( = ?auto_716560 ?auto_716561 ) ) ( not ( = ?auto_716560 ?auto_716562 ) ) ( not ( = ?auto_716561 ?auto_716562 ) ) ( ON ?auto_716561 ?auto_716562 ) ( ON ?auto_716560 ?auto_716561 ) ( ON ?auto_716559 ?auto_716560 ) ( ON ?auto_716558 ?auto_716559 ) ( ON ?auto_716557 ?auto_716558 ) ( CLEAR ?auto_716555 ) ( ON ?auto_716556 ?auto_716557 ) ( CLEAR ?auto_716556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_716546 ?auto_716547 ?auto_716548 ?auto_716549 ?auto_716550 ?auto_716551 ?auto_716552 ?auto_716553 ?auto_716554 ?auto_716555 ?auto_716556 )
      ( MAKE-17PILE ?auto_716546 ?auto_716547 ?auto_716548 ?auto_716549 ?auto_716550 ?auto_716551 ?auto_716552 ?auto_716553 ?auto_716554 ?auto_716555 ?auto_716556 ?auto_716557 ?auto_716558 ?auto_716559 ?auto_716560 ?auto_716561 ?auto_716562 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716580 - BLOCK
      ?auto_716581 - BLOCK
      ?auto_716582 - BLOCK
      ?auto_716583 - BLOCK
      ?auto_716584 - BLOCK
      ?auto_716585 - BLOCK
      ?auto_716586 - BLOCK
      ?auto_716587 - BLOCK
      ?auto_716588 - BLOCK
      ?auto_716589 - BLOCK
      ?auto_716590 - BLOCK
      ?auto_716591 - BLOCK
      ?auto_716592 - BLOCK
      ?auto_716593 - BLOCK
      ?auto_716594 - BLOCK
      ?auto_716595 - BLOCK
      ?auto_716596 - BLOCK
    )
    :vars
    (
      ?auto_716597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716596 ?auto_716597 ) ( ON-TABLE ?auto_716580 ) ( ON ?auto_716581 ?auto_716580 ) ( ON ?auto_716582 ?auto_716581 ) ( ON ?auto_716583 ?auto_716582 ) ( ON ?auto_716584 ?auto_716583 ) ( ON ?auto_716585 ?auto_716584 ) ( ON ?auto_716586 ?auto_716585 ) ( ON ?auto_716587 ?auto_716586 ) ( ON ?auto_716588 ?auto_716587 ) ( not ( = ?auto_716580 ?auto_716581 ) ) ( not ( = ?auto_716580 ?auto_716582 ) ) ( not ( = ?auto_716580 ?auto_716583 ) ) ( not ( = ?auto_716580 ?auto_716584 ) ) ( not ( = ?auto_716580 ?auto_716585 ) ) ( not ( = ?auto_716580 ?auto_716586 ) ) ( not ( = ?auto_716580 ?auto_716587 ) ) ( not ( = ?auto_716580 ?auto_716588 ) ) ( not ( = ?auto_716580 ?auto_716589 ) ) ( not ( = ?auto_716580 ?auto_716590 ) ) ( not ( = ?auto_716580 ?auto_716591 ) ) ( not ( = ?auto_716580 ?auto_716592 ) ) ( not ( = ?auto_716580 ?auto_716593 ) ) ( not ( = ?auto_716580 ?auto_716594 ) ) ( not ( = ?auto_716580 ?auto_716595 ) ) ( not ( = ?auto_716580 ?auto_716596 ) ) ( not ( = ?auto_716580 ?auto_716597 ) ) ( not ( = ?auto_716581 ?auto_716582 ) ) ( not ( = ?auto_716581 ?auto_716583 ) ) ( not ( = ?auto_716581 ?auto_716584 ) ) ( not ( = ?auto_716581 ?auto_716585 ) ) ( not ( = ?auto_716581 ?auto_716586 ) ) ( not ( = ?auto_716581 ?auto_716587 ) ) ( not ( = ?auto_716581 ?auto_716588 ) ) ( not ( = ?auto_716581 ?auto_716589 ) ) ( not ( = ?auto_716581 ?auto_716590 ) ) ( not ( = ?auto_716581 ?auto_716591 ) ) ( not ( = ?auto_716581 ?auto_716592 ) ) ( not ( = ?auto_716581 ?auto_716593 ) ) ( not ( = ?auto_716581 ?auto_716594 ) ) ( not ( = ?auto_716581 ?auto_716595 ) ) ( not ( = ?auto_716581 ?auto_716596 ) ) ( not ( = ?auto_716581 ?auto_716597 ) ) ( not ( = ?auto_716582 ?auto_716583 ) ) ( not ( = ?auto_716582 ?auto_716584 ) ) ( not ( = ?auto_716582 ?auto_716585 ) ) ( not ( = ?auto_716582 ?auto_716586 ) ) ( not ( = ?auto_716582 ?auto_716587 ) ) ( not ( = ?auto_716582 ?auto_716588 ) ) ( not ( = ?auto_716582 ?auto_716589 ) ) ( not ( = ?auto_716582 ?auto_716590 ) ) ( not ( = ?auto_716582 ?auto_716591 ) ) ( not ( = ?auto_716582 ?auto_716592 ) ) ( not ( = ?auto_716582 ?auto_716593 ) ) ( not ( = ?auto_716582 ?auto_716594 ) ) ( not ( = ?auto_716582 ?auto_716595 ) ) ( not ( = ?auto_716582 ?auto_716596 ) ) ( not ( = ?auto_716582 ?auto_716597 ) ) ( not ( = ?auto_716583 ?auto_716584 ) ) ( not ( = ?auto_716583 ?auto_716585 ) ) ( not ( = ?auto_716583 ?auto_716586 ) ) ( not ( = ?auto_716583 ?auto_716587 ) ) ( not ( = ?auto_716583 ?auto_716588 ) ) ( not ( = ?auto_716583 ?auto_716589 ) ) ( not ( = ?auto_716583 ?auto_716590 ) ) ( not ( = ?auto_716583 ?auto_716591 ) ) ( not ( = ?auto_716583 ?auto_716592 ) ) ( not ( = ?auto_716583 ?auto_716593 ) ) ( not ( = ?auto_716583 ?auto_716594 ) ) ( not ( = ?auto_716583 ?auto_716595 ) ) ( not ( = ?auto_716583 ?auto_716596 ) ) ( not ( = ?auto_716583 ?auto_716597 ) ) ( not ( = ?auto_716584 ?auto_716585 ) ) ( not ( = ?auto_716584 ?auto_716586 ) ) ( not ( = ?auto_716584 ?auto_716587 ) ) ( not ( = ?auto_716584 ?auto_716588 ) ) ( not ( = ?auto_716584 ?auto_716589 ) ) ( not ( = ?auto_716584 ?auto_716590 ) ) ( not ( = ?auto_716584 ?auto_716591 ) ) ( not ( = ?auto_716584 ?auto_716592 ) ) ( not ( = ?auto_716584 ?auto_716593 ) ) ( not ( = ?auto_716584 ?auto_716594 ) ) ( not ( = ?auto_716584 ?auto_716595 ) ) ( not ( = ?auto_716584 ?auto_716596 ) ) ( not ( = ?auto_716584 ?auto_716597 ) ) ( not ( = ?auto_716585 ?auto_716586 ) ) ( not ( = ?auto_716585 ?auto_716587 ) ) ( not ( = ?auto_716585 ?auto_716588 ) ) ( not ( = ?auto_716585 ?auto_716589 ) ) ( not ( = ?auto_716585 ?auto_716590 ) ) ( not ( = ?auto_716585 ?auto_716591 ) ) ( not ( = ?auto_716585 ?auto_716592 ) ) ( not ( = ?auto_716585 ?auto_716593 ) ) ( not ( = ?auto_716585 ?auto_716594 ) ) ( not ( = ?auto_716585 ?auto_716595 ) ) ( not ( = ?auto_716585 ?auto_716596 ) ) ( not ( = ?auto_716585 ?auto_716597 ) ) ( not ( = ?auto_716586 ?auto_716587 ) ) ( not ( = ?auto_716586 ?auto_716588 ) ) ( not ( = ?auto_716586 ?auto_716589 ) ) ( not ( = ?auto_716586 ?auto_716590 ) ) ( not ( = ?auto_716586 ?auto_716591 ) ) ( not ( = ?auto_716586 ?auto_716592 ) ) ( not ( = ?auto_716586 ?auto_716593 ) ) ( not ( = ?auto_716586 ?auto_716594 ) ) ( not ( = ?auto_716586 ?auto_716595 ) ) ( not ( = ?auto_716586 ?auto_716596 ) ) ( not ( = ?auto_716586 ?auto_716597 ) ) ( not ( = ?auto_716587 ?auto_716588 ) ) ( not ( = ?auto_716587 ?auto_716589 ) ) ( not ( = ?auto_716587 ?auto_716590 ) ) ( not ( = ?auto_716587 ?auto_716591 ) ) ( not ( = ?auto_716587 ?auto_716592 ) ) ( not ( = ?auto_716587 ?auto_716593 ) ) ( not ( = ?auto_716587 ?auto_716594 ) ) ( not ( = ?auto_716587 ?auto_716595 ) ) ( not ( = ?auto_716587 ?auto_716596 ) ) ( not ( = ?auto_716587 ?auto_716597 ) ) ( not ( = ?auto_716588 ?auto_716589 ) ) ( not ( = ?auto_716588 ?auto_716590 ) ) ( not ( = ?auto_716588 ?auto_716591 ) ) ( not ( = ?auto_716588 ?auto_716592 ) ) ( not ( = ?auto_716588 ?auto_716593 ) ) ( not ( = ?auto_716588 ?auto_716594 ) ) ( not ( = ?auto_716588 ?auto_716595 ) ) ( not ( = ?auto_716588 ?auto_716596 ) ) ( not ( = ?auto_716588 ?auto_716597 ) ) ( not ( = ?auto_716589 ?auto_716590 ) ) ( not ( = ?auto_716589 ?auto_716591 ) ) ( not ( = ?auto_716589 ?auto_716592 ) ) ( not ( = ?auto_716589 ?auto_716593 ) ) ( not ( = ?auto_716589 ?auto_716594 ) ) ( not ( = ?auto_716589 ?auto_716595 ) ) ( not ( = ?auto_716589 ?auto_716596 ) ) ( not ( = ?auto_716589 ?auto_716597 ) ) ( not ( = ?auto_716590 ?auto_716591 ) ) ( not ( = ?auto_716590 ?auto_716592 ) ) ( not ( = ?auto_716590 ?auto_716593 ) ) ( not ( = ?auto_716590 ?auto_716594 ) ) ( not ( = ?auto_716590 ?auto_716595 ) ) ( not ( = ?auto_716590 ?auto_716596 ) ) ( not ( = ?auto_716590 ?auto_716597 ) ) ( not ( = ?auto_716591 ?auto_716592 ) ) ( not ( = ?auto_716591 ?auto_716593 ) ) ( not ( = ?auto_716591 ?auto_716594 ) ) ( not ( = ?auto_716591 ?auto_716595 ) ) ( not ( = ?auto_716591 ?auto_716596 ) ) ( not ( = ?auto_716591 ?auto_716597 ) ) ( not ( = ?auto_716592 ?auto_716593 ) ) ( not ( = ?auto_716592 ?auto_716594 ) ) ( not ( = ?auto_716592 ?auto_716595 ) ) ( not ( = ?auto_716592 ?auto_716596 ) ) ( not ( = ?auto_716592 ?auto_716597 ) ) ( not ( = ?auto_716593 ?auto_716594 ) ) ( not ( = ?auto_716593 ?auto_716595 ) ) ( not ( = ?auto_716593 ?auto_716596 ) ) ( not ( = ?auto_716593 ?auto_716597 ) ) ( not ( = ?auto_716594 ?auto_716595 ) ) ( not ( = ?auto_716594 ?auto_716596 ) ) ( not ( = ?auto_716594 ?auto_716597 ) ) ( not ( = ?auto_716595 ?auto_716596 ) ) ( not ( = ?auto_716595 ?auto_716597 ) ) ( not ( = ?auto_716596 ?auto_716597 ) ) ( ON ?auto_716595 ?auto_716596 ) ( ON ?auto_716594 ?auto_716595 ) ( ON ?auto_716593 ?auto_716594 ) ( ON ?auto_716592 ?auto_716593 ) ( ON ?auto_716591 ?auto_716592 ) ( ON ?auto_716590 ?auto_716591 ) ( CLEAR ?auto_716588 ) ( ON ?auto_716589 ?auto_716590 ) ( CLEAR ?auto_716589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_716580 ?auto_716581 ?auto_716582 ?auto_716583 ?auto_716584 ?auto_716585 ?auto_716586 ?auto_716587 ?auto_716588 ?auto_716589 )
      ( MAKE-17PILE ?auto_716580 ?auto_716581 ?auto_716582 ?auto_716583 ?auto_716584 ?auto_716585 ?auto_716586 ?auto_716587 ?auto_716588 ?auto_716589 ?auto_716590 ?auto_716591 ?auto_716592 ?auto_716593 ?auto_716594 ?auto_716595 ?auto_716596 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716615 - BLOCK
      ?auto_716616 - BLOCK
      ?auto_716617 - BLOCK
      ?auto_716618 - BLOCK
      ?auto_716619 - BLOCK
      ?auto_716620 - BLOCK
      ?auto_716621 - BLOCK
      ?auto_716622 - BLOCK
      ?auto_716623 - BLOCK
      ?auto_716624 - BLOCK
      ?auto_716625 - BLOCK
      ?auto_716626 - BLOCK
      ?auto_716627 - BLOCK
      ?auto_716628 - BLOCK
      ?auto_716629 - BLOCK
      ?auto_716630 - BLOCK
      ?auto_716631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716631 ) ( ON-TABLE ?auto_716615 ) ( ON ?auto_716616 ?auto_716615 ) ( ON ?auto_716617 ?auto_716616 ) ( ON ?auto_716618 ?auto_716617 ) ( ON ?auto_716619 ?auto_716618 ) ( ON ?auto_716620 ?auto_716619 ) ( ON ?auto_716621 ?auto_716620 ) ( ON ?auto_716622 ?auto_716621 ) ( ON ?auto_716623 ?auto_716622 ) ( not ( = ?auto_716615 ?auto_716616 ) ) ( not ( = ?auto_716615 ?auto_716617 ) ) ( not ( = ?auto_716615 ?auto_716618 ) ) ( not ( = ?auto_716615 ?auto_716619 ) ) ( not ( = ?auto_716615 ?auto_716620 ) ) ( not ( = ?auto_716615 ?auto_716621 ) ) ( not ( = ?auto_716615 ?auto_716622 ) ) ( not ( = ?auto_716615 ?auto_716623 ) ) ( not ( = ?auto_716615 ?auto_716624 ) ) ( not ( = ?auto_716615 ?auto_716625 ) ) ( not ( = ?auto_716615 ?auto_716626 ) ) ( not ( = ?auto_716615 ?auto_716627 ) ) ( not ( = ?auto_716615 ?auto_716628 ) ) ( not ( = ?auto_716615 ?auto_716629 ) ) ( not ( = ?auto_716615 ?auto_716630 ) ) ( not ( = ?auto_716615 ?auto_716631 ) ) ( not ( = ?auto_716616 ?auto_716617 ) ) ( not ( = ?auto_716616 ?auto_716618 ) ) ( not ( = ?auto_716616 ?auto_716619 ) ) ( not ( = ?auto_716616 ?auto_716620 ) ) ( not ( = ?auto_716616 ?auto_716621 ) ) ( not ( = ?auto_716616 ?auto_716622 ) ) ( not ( = ?auto_716616 ?auto_716623 ) ) ( not ( = ?auto_716616 ?auto_716624 ) ) ( not ( = ?auto_716616 ?auto_716625 ) ) ( not ( = ?auto_716616 ?auto_716626 ) ) ( not ( = ?auto_716616 ?auto_716627 ) ) ( not ( = ?auto_716616 ?auto_716628 ) ) ( not ( = ?auto_716616 ?auto_716629 ) ) ( not ( = ?auto_716616 ?auto_716630 ) ) ( not ( = ?auto_716616 ?auto_716631 ) ) ( not ( = ?auto_716617 ?auto_716618 ) ) ( not ( = ?auto_716617 ?auto_716619 ) ) ( not ( = ?auto_716617 ?auto_716620 ) ) ( not ( = ?auto_716617 ?auto_716621 ) ) ( not ( = ?auto_716617 ?auto_716622 ) ) ( not ( = ?auto_716617 ?auto_716623 ) ) ( not ( = ?auto_716617 ?auto_716624 ) ) ( not ( = ?auto_716617 ?auto_716625 ) ) ( not ( = ?auto_716617 ?auto_716626 ) ) ( not ( = ?auto_716617 ?auto_716627 ) ) ( not ( = ?auto_716617 ?auto_716628 ) ) ( not ( = ?auto_716617 ?auto_716629 ) ) ( not ( = ?auto_716617 ?auto_716630 ) ) ( not ( = ?auto_716617 ?auto_716631 ) ) ( not ( = ?auto_716618 ?auto_716619 ) ) ( not ( = ?auto_716618 ?auto_716620 ) ) ( not ( = ?auto_716618 ?auto_716621 ) ) ( not ( = ?auto_716618 ?auto_716622 ) ) ( not ( = ?auto_716618 ?auto_716623 ) ) ( not ( = ?auto_716618 ?auto_716624 ) ) ( not ( = ?auto_716618 ?auto_716625 ) ) ( not ( = ?auto_716618 ?auto_716626 ) ) ( not ( = ?auto_716618 ?auto_716627 ) ) ( not ( = ?auto_716618 ?auto_716628 ) ) ( not ( = ?auto_716618 ?auto_716629 ) ) ( not ( = ?auto_716618 ?auto_716630 ) ) ( not ( = ?auto_716618 ?auto_716631 ) ) ( not ( = ?auto_716619 ?auto_716620 ) ) ( not ( = ?auto_716619 ?auto_716621 ) ) ( not ( = ?auto_716619 ?auto_716622 ) ) ( not ( = ?auto_716619 ?auto_716623 ) ) ( not ( = ?auto_716619 ?auto_716624 ) ) ( not ( = ?auto_716619 ?auto_716625 ) ) ( not ( = ?auto_716619 ?auto_716626 ) ) ( not ( = ?auto_716619 ?auto_716627 ) ) ( not ( = ?auto_716619 ?auto_716628 ) ) ( not ( = ?auto_716619 ?auto_716629 ) ) ( not ( = ?auto_716619 ?auto_716630 ) ) ( not ( = ?auto_716619 ?auto_716631 ) ) ( not ( = ?auto_716620 ?auto_716621 ) ) ( not ( = ?auto_716620 ?auto_716622 ) ) ( not ( = ?auto_716620 ?auto_716623 ) ) ( not ( = ?auto_716620 ?auto_716624 ) ) ( not ( = ?auto_716620 ?auto_716625 ) ) ( not ( = ?auto_716620 ?auto_716626 ) ) ( not ( = ?auto_716620 ?auto_716627 ) ) ( not ( = ?auto_716620 ?auto_716628 ) ) ( not ( = ?auto_716620 ?auto_716629 ) ) ( not ( = ?auto_716620 ?auto_716630 ) ) ( not ( = ?auto_716620 ?auto_716631 ) ) ( not ( = ?auto_716621 ?auto_716622 ) ) ( not ( = ?auto_716621 ?auto_716623 ) ) ( not ( = ?auto_716621 ?auto_716624 ) ) ( not ( = ?auto_716621 ?auto_716625 ) ) ( not ( = ?auto_716621 ?auto_716626 ) ) ( not ( = ?auto_716621 ?auto_716627 ) ) ( not ( = ?auto_716621 ?auto_716628 ) ) ( not ( = ?auto_716621 ?auto_716629 ) ) ( not ( = ?auto_716621 ?auto_716630 ) ) ( not ( = ?auto_716621 ?auto_716631 ) ) ( not ( = ?auto_716622 ?auto_716623 ) ) ( not ( = ?auto_716622 ?auto_716624 ) ) ( not ( = ?auto_716622 ?auto_716625 ) ) ( not ( = ?auto_716622 ?auto_716626 ) ) ( not ( = ?auto_716622 ?auto_716627 ) ) ( not ( = ?auto_716622 ?auto_716628 ) ) ( not ( = ?auto_716622 ?auto_716629 ) ) ( not ( = ?auto_716622 ?auto_716630 ) ) ( not ( = ?auto_716622 ?auto_716631 ) ) ( not ( = ?auto_716623 ?auto_716624 ) ) ( not ( = ?auto_716623 ?auto_716625 ) ) ( not ( = ?auto_716623 ?auto_716626 ) ) ( not ( = ?auto_716623 ?auto_716627 ) ) ( not ( = ?auto_716623 ?auto_716628 ) ) ( not ( = ?auto_716623 ?auto_716629 ) ) ( not ( = ?auto_716623 ?auto_716630 ) ) ( not ( = ?auto_716623 ?auto_716631 ) ) ( not ( = ?auto_716624 ?auto_716625 ) ) ( not ( = ?auto_716624 ?auto_716626 ) ) ( not ( = ?auto_716624 ?auto_716627 ) ) ( not ( = ?auto_716624 ?auto_716628 ) ) ( not ( = ?auto_716624 ?auto_716629 ) ) ( not ( = ?auto_716624 ?auto_716630 ) ) ( not ( = ?auto_716624 ?auto_716631 ) ) ( not ( = ?auto_716625 ?auto_716626 ) ) ( not ( = ?auto_716625 ?auto_716627 ) ) ( not ( = ?auto_716625 ?auto_716628 ) ) ( not ( = ?auto_716625 ?auto_716629 ) ) ( not ( = ?auto_716625 ?auto_716630 ) ) ( not ( = ?auto_716625 ?auto_716631 ) ) ( not ( = ?auto_716626 ?auto_716627 ) ) ( not ( = ?auto_716626 ?auto_716628 ) ) ( not ( = ?auto_716626 ?auto_716629 ) ) ( not ( = ?auto_716626 ?auto_716630 ) ) ( not ( = ?auto_716626 ?auto_716631 ) ) ( not ( = ?auto_716627 ?auto_716628 ) ) ( not ( = ?auto_716627 ?auto_716629 ) ) ( not ( = ?auto_716627 ?auto_716630 ) ) ( not ( = ?auto_716627 ?auto_716631 ) ) ( not ( = ?auto_716628 ?auto_716629 ) ) ( not ( = ?auto_716628 ?auto_716630 ) ) ( not ( = ?auto_716628 ?auto_716631 ) ) ( not ( = ?auto_716629 ?auto_716630 ) ) ( not ( = ?auto_716629 ?auto_716631 ) ) ( not ( = ?auto_716630 ?auto_716631 ) ) ( ON ?auto_716630 ?auto_716631 ) ( ON ?auto_716629 ?auto_716630 ) ( ON ?auto_716628 ?auto_716629 ) ( ON ?auto_716627 ?auto_716628 ) ( ON ?auto_716626 ?auto_716627 ) ( ON ?auto_716625 ?auto_716626 ) ( CLEAR ?auto_716623 ) ( ON ?auto_716624 ?auto_716625 ) ( CLEAR ?auto_716624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_716615 ?auto_716616 ?auto_716617 ?auto_716618 ?auto_716619 ?auto_716620 ?auto_716621 ?auto_716622 ?auto_716623 ?auto_716624 )
      ( MAKE-17PILE ?auto_716615 ?auto_716616 ?auto_716617 ?auto_716618 ?auto_716619 ?auto_716620 ?auto_716621 ?auto_716622 ?auto_716623 ?auto_716624 ?auto_716625 ?auto_716626 ?auto_716627 ?auto_716628 ?auto_716629 ?auto_716630 ?auto_716631 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716649 - BLOCK
      ?auto_716650 - BLOCK
      ?auto_716651 - BLOCK
      ?auto_716652 - BLOCK
      ?auto_716653 - BLOCK
      ?auto_716654 - BLOCK
      ?auto_716655 - BLOCK
      ?auto_716656 - BLOCK
      ?auto_716657 - BLOCK
      ?auto_716658 - BLOCK
      ?auto_716659 - BLOCK
      ?auto_716660 - BLOCK
      ?auto_716661 - BLOCK
      ?auto_716662 - BLOCK
      ?auto_716663 - BLOCK
      ?auto_716664 - BLOCK
      ?auto_716665 - BLOCK
    )
    :vars
    (
      ?auto_716666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716665 ?auto_716666 ) ( ON-TABLE ?auto_716649 ) ( ON ?auto_716650 ?auto_716649 ) ( ON ?auto_716651 ?auto_716650 ) ( ON ?auto_716652 ?auto_716651 ) ( ON ?auto_716653 ?auto_716652 ) ( ON ?auto_716654 ?auto_716653 ) ( ON ?auto_716655 ?auto_716654 ) ( ON ?auto_716656 ?auto_716655 ) ( not ( = ?auto_716649 ?auto_716650 ) ) ( not ( = ?auto_716649 ?auto_716651 ) ) ( not ( = ?auto_716649 ?auto_716652 ) ) ( not ( = ?auto_716649 ?auto_716653 ) ) ( not ( = ?auto_716649 ?auto_716654 ) ) ( not ( = ?auto_716649 ?auto_716655 ) ) ( not ( = ?auto_716649 ?auto_716656 ) ) ( not ( = ?auto_716649 ?auto_716657 ) ) ( not ( = ?auto_716649 ?auto_716658 ) ) ( not ( = ?auto_716649 ?auto_716659 ) ) ( not ( = ?auto_716649 ?auto_716660 ) ) ( not ( = ?auto_716649 ?auto_716661 ) ) ( not ( = ?auto_716649 ?auto_716662 ) ) ( not ( = ?auto_716649 ?auto_716663 ) ) ( not ( = ?auto_716649 ?auto_716664 ) ) ( not ( = ?auto_716649 ?auto_716665 ) ) ( not ( = ?auto_716649 ?auto_716666 ) ) ( not ( = ?auto_716650 ?auto_716651 ) ) ( not ( = ?auto_716650 ?auto_716652 ) ) ( not ( = ?auto_716650 ?auto_716653 ) ) ( not ( = ?auto_716650 ?auto_716654 ) ) ( not ( = ?auto_716650 ?auto_716655 ) ) ( not ( = ?auto_716650 ?auto_716656 ) ) ( not ( = ?auto_716650 ?auto_716657 ) ) ( not ( = ?auto_716650 ?auto_716658 ) ) ( not ( = ?auto_716650 ?auto_716659 ) ) ( not ( = ?auto_716650 ?auto_716660 ) ) ( not ( = ?auto_716650 ?auto_716661 ) ) ( not ( = ?auto_716650 ?auto_716662 ) ) ( not ( = ?auto_716650 ?auto_716663 ) ) ( not ( = ?auto_716650 ?auto_716664 ) ) ( not ( = ?auto_716650 ?auto_716665 ) ) ( not ( = ?auto_716650 ?auto_716666 ) ) ( not ( = ?auto_716651 ?auto_716652 ) ) ( not ( = ?auto_716651 ?auto_716653 ) ) ( not ( = ?auto_716651 ?auto_716654 ) ) ( not ( = ?auto_716651 ?auto_716655 ) ) ( not ( = ?auto_716651 ?auto_716656 ) ) ( not ( = ?auto_716651 ?auto_716657 ) ) ( not ( = ?auto_716651 ?auto_716658 ) ) ( not ( = ?auto_716651 ?auto_716659 ) ) ( not ( = ?auto_716651 ?auto_716660 ) ) ( not ( = ?auto_716651 ?auto_716661 ) ) ( not ( = ?auto_716651 ?auto_716662 ) ) ( not ( = ?auto_716651 ?auto_716663 ) ) ( not ( = ?auto_716651 ?auto_716664 ) ) ( not ( = ?auto_716651 ?auto_716665 ) ) ( not ( = ?auto_716651 ?auto_716666 ) ) ( not ( = ?auto_716652 ?auto_716653 ) ) ( not ( = ?auto_716652 ?auto_716654 ) ) ( not ( = ?auto_716652 ?auto_716655 ) ) ( not ( = ?auto_716652 ?auto_716656 ) ) ( not ( = ?auto_716652 ?auto_716657 ) ) ( not ( = ?auto_716652 ?auto_716658 ) ) ( not ( = ?auto_716652 ?auto_716659 ) ) ( not ( = ?auto_716652 ?auto_716660 ) ) ( not ( = ?auto_716652 ?auto_716661 ) ) ( not ( = ?auto_716652 ?auto_716662 ) ) ( not ( = ?auto_716652 ?auto_716663 ) ) ( not ( = ?auto_716652 ?auto_716664 ) ) ( not ( = ?auto_716652 ?auto_716665 ) ) ( not ( = ?auto_716652 ?auto_716666 ) ) ( not ( = ?auto_716653 ?auto_716654 ) ) ( not ( = ?auto_716653 ?auto_716655 ) ) ( not ( = ?auto_716653 ?auto_716656 ) ) ( not ( = ?auto_716653 ?auto_716657 ) ) ( not ( = ?auto_716653 ?auto_716658 ) ) ( not ( = ?auto_716653 ?auto_716659 ) ) ( not ( = ?auto_716653 ?auto_716660 ) ) ( not ( = ?auto_716653 ?auto_716661 ) ) ( not ( = ?auto_716653 ?auto_716662 ) ) ( not ( = ?auto_716653 ?auto_716663 ) ) ( not ( = ?auto_716653 ?auto_716664 ) ) ( not ( = ?auto_716653 ?auto_716665 ) ) ( not ( = ?auto_716653 ?auto_716666 ) ) ( not ( = ?auto_716654 ?auto_716655 ) ) ( not ( = ?auto_716654 ?auto_716656 ) ) ( not ( = ?auto_716654 ?auto_716657 ) ) ( not ( = ?auto_716654 ?auto_716658 ) ) ( not ( = ?auto_716654 ?auto_716659 ) ) ( not ( = ?auto_716654 ?auto_716660 ) ) ( not ( = ?auto_716654 ?auto_716661 ) ) ( not ( = ?auto_716654 ?auto_716662 ) ) ( not ( = ?auto_716654 ?auto_716663 ) ) ( not ( = ?auto_716654 ?auto_716664 ) ) ( not ( = ?auto_716654 ?auto_716665 ) ) ( not ( = ?auto_716654 ?auto_716666 ) ) ( not ( = ?auto_716655 ?auto_716656 ) ) ( not ( = ?auto_716655 ?auto_716657 ) ) ( not ( = ?auto_716655 ?auto_716658 ) ) ( not ( = ?auto_716655 ?auto_716659 ) ) ( not ( = ?auto_716655 ?auto_716660 ) ) ( not ( = ?auto_716655 ?auto_716661 ) ) ( not ( = ?auto_716655 ?auto_716662 ) ) ( not ( = ?auto_716655 ?auto_716663 ) ) ( not ( = ?auto_716655 ?auto_716664 ) ) ( not ( = ?auto_716655 ?auto_716665 ) ) ( not ( = ?auto_716655 ?auto_716666 ) ) ( not ( = ?auto_716656 ?auto_716657 ) ) ( not ( = ?auto_716656 ?auto_716658 ) ) ( not ( = ?auto_716656 ?auto_716659 ) ) ( not ( = ?auto_716656 ?auto_716660 ) ) ( not ( = ?auto_716656 ?auto_716661 ) ) ( not ( = ?auto_716656 ?auto_716662 ) ) ( not ( = ?auto_716656 ?auto_716663 ) ) ( not ( = ?auto_716656 ?auto_716664 ) ) ( not ( = ?auto_716656 ?auto_716665 ) ) ( not ( = ?auto_716656 ?auto_716666 ) ) ( not ( = ?auto_716657 ?auto_716658 ) ) ( not ( = ?auto_716657 ?auto_716659 ) ) ( not ( = ?auto_716657 ?auto_716660 ) ) ( not ( = ?auto_716657 ?auto_716661 ) ) ( not ( = ?auto_716657 ?auto_716662 ) ) ( not ( = ?auto_716657 ?auto_716663 ) ) ( not ( = ?auto_716657 ?auto_716664 ) ) ( not ( = ?auto_716657 ?auto_716665 ) ) ( not ( = ?auto_716657 ?auto_716666 ) ) ( not ( = ?auto_716658 ?auto_716659 ) ) ( not ( = ?auto_716658 ?auto_716660 ) ) ( not ( = ?auto_716658 ?auto_716661 ) ) ( not ( = ?auto_716658 ?auto_716662 ) ) ( not ( = ?auto_716658 ?auto_716663 ) ) ( not ( = ?auto_716658 ?auto_716664 ) ) ( not ( = ?auto_716658 ?auto_716665 ) ) ( not ( = ?auto_716658 ?auto_716666 ) ) ( not ( = ?auto_716659 ?auto_716660 ) ) ( not ( = ?auto_716659 ?auto_716661 ) ) ( not ( = ?auto_716659 ?auto_716662 ) ) ( not ( = ?auto_716659 ?auto_716663 ) ) ( not ( = ?auto_716659 ?auto_716664 ) ) ( not ( = ?auto_716659 ?auto_716665 ) ) ( not ( = ?auto_716659 ?auto_716666 ) ) ( not ( = ?auto_716660 ?auto_716661 ) ) ( not ( = ?auto_716660 ?auto_716662 ) ) ( not ( = ?auto_716660 ?auto_716663 ) ) ( not ( = ?auto_716660 ?auto_716664 ) ) ( not ( = ?auto_716660 ?auto_716665 ) ) ( not ( = ?auto_716660 ?auto_716666 ) ) ( not ( = ?auto_716661 ?auto_716662 ) ) ( not ( = ?auto_716661 ?auto_716663 ) ) ( not ( = ?auto_716661 ?auto_716664 ) ) ( not ( = ?auto_716661 ?auto_716665 ) ) ( not ( = ?auto_716661 ?auto_716666 ) ) ( not ( = ?auto_716662 ?auto_716663 ) ) ( not ( = ?auto_716662 ?auto_716664 ) ) ( not ( = ?auto_716662 ?auto_716665 ) ) ( not ( = ?auto_716662 ?auto_716666 ) ) ( not ( = ?auto_716663 ?auto_716664 ) ) ( not ( = ?auto_716663 ?auto_716665 ) ) ( not ( = ?auto_716663 ?auto_716666 ) ) ( not ( = ?auto_716664 ?auto_716665 ) ) ( not ( = ?auto_716664 ?auto_716666 ) ) ( not ( = ?auto_716665 ?auto_716666 ) ) ( ON ?auto_716664 ?auto_716665 ) ( ON ?auto_716663 ?auto_716664 ) ( ON ?auto_716662 ?auto_716663 ) ( ON ?auto_716661 ?auto_716662 ) ( ON ?auto_716660 ?auto_716661 ) ( ON ?auto_716659 ?auto_716660 ) ( ON ?auto_716658 ?auto_716659 ) ( CLEAR ?auto_716656 ) ( ON ?auto_716657 ?auto_716658 ) ( CLEAR ?auto_716657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_716649 ?auto_716650 ?auto_716651 ?auto_716652 ?auto_716653 ?auto_716654 ?auto_716655 ?auto_716656 ?auto_716657 )
      ( MAKE-17PILE ?auto_716649 ?auto_716650 ?auto_716651 ?auto_716652 ?auto_716653 ?auto_716654 ?auto_716655 ?auto_716656 ?auto_716657 ?auto_716658 ?auto_716659 ?auto_716660 ?auto_716661 ?auto_716662 ?auto_716663 ?auto_716664 ?auto_716665 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716684 - BLOCK
      ?auto_716685 - BLOCK
      ?auto_716686 - BLOCK
      ?auto_716687 - BLOCK
      ?auto_716688 - BLOCK
      ?auto_716689 - BLOCK
      ?auto_716690 - BLOCK
      ?auto_716691 - BLOCK
      ?auto_716692 - BLOCK
      ?auto_716693 - BLOCK
      ?auto_716694 - BLOCK
      ?auto_716695 - BLOCK
      ?auto_716696 - BLOCK
      ?auto_716697 - BLOCK
      ?auto_716698 - BLOCK
      ?auto_716699 - BLOCK
      ?auto_716700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716700 ) ( ON-TABLE ?auto_716684 ) ( ON ?auto_716685 ?auto_716684 ) ( ON ?auto_716686 ?auto_716685 ) ( ON ?auto_716687 ?auto_716686 ) ( ON ?auto_716688 ?auto_716687 ) ( ON ?auto_716689 ?auto_716688 ) ( ON ?auto_716690 ?auto_716689 ) ( ON ?auto_716691 ?auto_716690 ) ( not ( = ?auto_716684 ?auto_716685 ) ) ( not ( = ?auto_716684 ?auto_716686 ) ) ( not ( = ?auto_716684 ?auto_716687 ) ) ( not ( = ?auto_716684 ?auto_716688 ) ) ( not ( = ?auto_716684 ?auto_716689 ) ) ( not ( = ?auto_716684 ?auto_716690 ) ) ( not ( = ?auto_716684 ?auto_716691 ) ) ( not ( = ?auto_716684 ?auto_716692 ) ) ( not ( = ?auto_716684 ?auto_716693 ) ) ( not ( = ?auto_716684 ?auto_716694 ) ) ( not ( = ?auto_716684 ?auto_716695 ) ) ( not ( = ?auto_716684 ?auto_716696 ) ) ( not ( = ?auto_716684 ?auto_716697 ) ) ( not ( = ?auto_716684 ?auto_716698 ) ) ( not ( = ?auto_716684 ?auto_716699 ) ) ( not ( = ?auto_716684 ?auto_716700 ) ) ( not ( = ?auto_716685 ?auto_716686 ) ) ( not ( = ?auto_716685 ?auto_716687 ) ) ( not ( = ?auto_716685 ?auto_716688 ) ) ( not ( = ?auto_716685 ?auto_716689 ) ) ( not ( = ?auto_716685 ?auto_716690 ) ) ( not ( = ?auto_716685 ?auto_716691 ) ) ( not ( = ?auto_716685 ?auto_716692 ) ) ( not ( = ?auto_716685 ?auto_716693 ) ) ( not ( = ?auto_716685 ?auto_716694 ) ) ( not ( = ?auto_716685 ?auto_716695 ) ) ( not ( = ?auto_716685 ?auto_716696 ) ) ( not ( = ?auto_716685 ?auto_716697 ) ) ( not ( = ?auto_716685 ?auto_716698 ) ) ( not ( = ?auto_716685 ?auto_716699 ) ) ( not ( = ?auto_716685 ?auto_716700 ) ) ( not ( = ?auto_716686 ?auto_716687 ) ) ( not ( = ?auto_716686 ?auto_716688 ) ) ( not ( = ?auto_716686 ?auto_716689 ) ) ( not ( = ?auto_716686 ?auto_716690 ) ) ( not ( = ?auto_716686 ?auto_716691 ) ) ( not ( = ?auto_716686 ?auto_716692 ) ) ( not ( = ?auto_716686 ?auto_716693 ) ) ( not ( = ?auto_716686 ?auto_716694 ) ) ( not ( = ?auto_716686 ?auto_716695 ) ) ( not ( = ?auto_716686 ?auto_716696 ) ) ( not ( = ?auto_716686 ?auto_716697 ) ) ( not ( = ?auto_716686 ?auto_716698 ) ) ( not ( = ?auto_716686 ?auto_716699 ) ) ( not ( = ?auto_716686 ?auto_716700 ) ) ( not ( = ?auto_716687 ?auto_716688 ) ) ( not ( = ?auto_716687 ?auto_716689 ) ) ( not ( = ?auto_716687 ?auto_716690 ) ) ( not ( = ?auto_716687 ?auto_716691 ) ) ( not ( = ?auto_716687 ?auto_716692 ) ) ( not ( = ?auto_716687 ?auto_716693 ) ) ( not ( = ?auto_716687 ?auto_716694 ) ) ( not ( = ?auto_716687 ?auto_716695 ) ) ( not ( = ?auto_716687 ?auto_716696 ) ) ( not ( = ?auto_716687 ?auto_716697 ) ) ( not ( = ?auto_716687 ?auto_716698 ) ) ( not ( = ?auto_716687 ?auto_716699 ) ) ( not ( = ?auto_716687 ?auto_716700 ) ) ( not ( = ?auto_716688 ?auto_716689 ) ) ( not ( = ?auto_716688 ?auto_716690 ) ) ( not ( = ?auto_716688 ?auto_716691 ) ) ( not ( = ?auto_716688 ?auto_716692 ) ) ( not ( = ?auto_716688 ?auto_716693 ) ) ( not ( = ?auto_716688 ?auto_716694 ) ) ( not ( = ?auto_716688 ?auto_716695 ) ) ( not ( = ?auto_716688 ?auto_716696 ) ) ( not ( = ?auto_716688 ?auto_716697 ) ) ( not ( = ?auto_716688 ?auto_716698 ) ) ( not ( = ?auto_716688 ?auto_716699 ) ) ( not ( = ?auto_716688 ?auto_716700 ) ) ( not ( = ?auto_716689 ?auto_716690 ) ) ( not ( = ?auto_716689 ?auto_716691 ) ) ( not ( = ?auto_716689 ?auto_716692 ) ) ( not ( = ?auto_716689 ?auto_716693 ) ) ( not ( = ?auto_716689 ?auto_716694 ) ) ( not ( = ?auto_716689 ?auto_716695 ) ) ( not ( = ?auto_716689 ?auto_716696 ) ) ( not ( = ?auto_716689 ?auto_716697 ) ) ( not ( = ?auto_716689 ?auto_716698 ) ) ( not ( = ?auto_716689 ?auto_716699 ) ) ( not ( = ?auto_716689 ?auto_716700 ) ) ( not ( = ?auto_716690 ?auto_716691 ) ) ( not ( = ?auto_716690 ?auto_716692 ) ) ( not ( = ?auto_716690 ?auto_716693 ) ) ( not ( = ?auto_716690 ?auto_716694 ) ) ( not ( = ?auto_716690 ?auto_716695 ) ) ( not ( = ?auto_716690 ?auto_716696 ) ) ( not ( = ?auto_716690 ?auto_716697 ) ) ( not ( = ?auto_716690 ?auto_716698 ) ) ( not ( = ?auto_716690 ?auto_716699 ) ) ( not ( = ?auto_716690 ?auto_716700 ) ) ( not ( = ?auto_716691 ?auto_716692 ) ) ( not ( = ?auto_716691 ?auto_716693 ) ) ( not ( = ?auto_716691 ?auto_716694 ) ) ( not ( = ?auto_716691 ?auto_716695 ) ) ( not ( = ?auto_716691 ?auto_716696 ) ) ( not ( = ?auto_716691 ?auto_716697 ) ) ( not ( = ?auto_716691 ?auto_716698 ) ) ( not ( = ?auto_716691 ?auto_716699 ) ) ( not ( = ?auto_716691 ?auto_716700 ) ) ( not ( = ?auto_716692 ?auto_716693 ) ) ( not ( = ?auto_716692 ?auto_716694 ) ) ( not ( = ?auto_716692 ?auto_716695 ) ) ( not ( = ?auto_716692 ?auto_716696 ) ) ( not ( = ?auto_716692 ?auto_716697 ) ) ( not ( = ?auto_716692 ?auto_716698 ) ) ( not ( = ?auto_716692 ?auto_716699 ) ) ( not ( = ?auto_716692 ?auto_716700 ) ) ( not ( = ?auto_716693 ?auto_716694 ) ) ( not ( = ?auto_716693 ?auto_716695 ) ) ( not ( = ?auto_716693 ?auto_716696 ) ) ( not ( = ?auto_716693 ?auto_716697 ) ) ( not ( = ?auto_716693 ?auto_716698 ) ) ( not ( = ?auto_716693 ?auto_716699 ) ) ( not ( = ?auto_716693 ?auto_716700 ) ) ( not ( = ?auto_716694 ?auto_716695 ) ) ( not ( = ?auto_716694 ?auto_716696 ) ) ( not ( = ?auto_716694 ?auto_716697 ) ) ( not ( = ?auto_716694 ?auto_716698 ) ) ( not ( = ?auto_716694 ?auto_716699 ) ) ( not ( = ?auto_716694 ?auto_716700 ) ) ( not ( = ?auto_716695 ?auto_716696 ) ) ( not ( = ?auto_716695 ?auto_716697 ) ) ( not ( = ?auto_716695 ?auto_716698 ) ) ( not ( = ?auto_716695 ?auto_716699 ) ) ( not ( = ?auto_716695 ?auto_716700 ) ) ( not ( = ?auto_716696 ?auto_716697 ) ) ( not ( = ?auto_716696 ?auto_716698 ) ) ( not ( = ?auto_716696 ?auto_716699 ) ) ( not ( = ?auto_716696 ?auto_716700 ) ) ( not ( = ?auto_716697 ?auto_716698 ) ) ( not ( = ?auto_716697 ?auto_716699 ) ) ( not ( = ?auto_716697 ?auto_716700 ) ) ( not ( = ?auto_716698 ?auto_716699 ) ) ( not ( = ?auto_716698 ?auto_716700 ) ) ( not ( = ?auto_716699 ?auto_716700 ) ) ( ON ?auto_716699 ?auto_716700 ) ( ON ?auto_716698 ?auto_716699 ) ( ON ?auto_716697 ?auto_716698 ) ( ON ?auto_716696 ?auto_716697 ) ( ON ?auto_716695 ?auto_716696 ) ( ON ?auto_716694 ?auto_716695 ) ( ON ?auto_716693 ?auto_716694 ) ( CLEAR ?auto_716691 ) ( ON ?auto_716692 ?auto_716693 ) ( CLEAR ?auto_716692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_716684 ?auto_716685 ?auto_716686 ?auto_716687 ?auto_716688 ?auto_716689 ?auto_716690 ?auto_716691 ?auto_716692 )
      ( MAKE-17PILE ?auto_716684 ?auto_716685 ?auto_716686 ?auto_716687 ?auto_716688 ?auto_716689 ?auto_716690 ?auto_716691 ?auto_716692 ?auto_716693 ?auto_716694 ?auto_716695 ?auto_716696 ?auto_716697 ?auto_716698 ?auto_716699 ?auto_716700 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716718 - BLOCK
      ?auto_716719 - BLOCK
      ?auto_716720 - BLOCK
      ?auto_716721 - BLOCK
      ?auto_716722 - BLOCK
      ?auto_716723 - BLOCK
      ?auto_716724 - BLOCK
      ?auto_716725 - BLOCK
      ?auto_716726 - BLOCK
      ?auto_716727 - BLOCK
      ?auto_716728 - BLOCK
      ?auto_716729 - BLOCK
      ?auto_716730 - BLOCK
      ?auto_716731 - BLOCK
      ?auto_716732 - BLOCK
      ?auto_716733 - BLOCK
      ?auto_716734 - BLOCK
    )
    :vars
    (
      ?auto_716735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716734 ?auto_716735 ) ( ON-TABLE ?auto_716718 ) ( ON ?auto_716719 ?auto_716718 ) ( ON ?auto_716720 ?auto_716719 ) ( ON ?auto_716721 ?auto_716720 ) ( ON ?auto_716722 ?auto_716721 ) ( ON ?auto_716723 ?auto_716722 ) ( ON ?auto_716724 ?auto_716723 ) ( not ( = ?auto_716718 ?auto_716719 ) ) ( not ( = ?auto_716718 ?auto_716720 ) ) ( not ( = ?auto_716718 ?auto_716721 ) ) ( not ( = ?auto_716718 ?auto_716722 ) ) ( not ( = ?auto_716718 ?auto_716723 ) ) ( not ( = ?auto_716718 ?auto_716724 ) ) ( not ( = ?auto_716718 ?auto_716725 ) ) ( not ( = ?auto_716718 ?auto_716726 ) ) ( not ( = ?auto_716718 ?auto_716727 ) ) ( not ( = ?auto_716718 ?auto_716728 ) ) ( not ( = ?auto_716718 ?auto_716729 ) ) ( not ( = ?auto_716718 ?auto_716730 ) ) ( not ( = ?auto_716718 ?auto_716731 ) ) ( not ( = ?auto_716718 ?auto_716732 ) ) ( not ( = ?auto_716718 ?auto_716733 ) ) ( not ( = ?auto_716718 ?auto_716734 ) ) ( not ( = ?auto_716718 ?auto_716735 ) ) ( not ( = ?auto_716719 ?auto_716720 ) ) ( not ( = ?auto_716719 ?auto_716721 ) ) ( not ( = ?auto_716719 ?auto_716722 ) ) ( not ( = ?auto_716719 ?auto_716723 ) ) ( not ( = ?auto_716719 ?auto_716724 ) ) ( not ( = ?auto_716719 ?auto_716725 ) ) ( not ( = ?auto_716719 ?auto_716726 ) ) ( not ( = ?auto_716719 ?auto_716727 ) ) ( not ( = ?auto_716719 ?auto_716728 ) ) ( not ( = ?auto_716719 ?auto_716729 ) ) ( not ( = ?auto_716719 ?auto_716730 ) ) ( not ( = ?auto_716719 ?auto_716731 ) ) ( not ( = ?auto_716719 ?auto_716732 ) ) ( not ( = ?auto_716719 ?auto_716733 ) ) ( not ( = ?auto_716719 ?auto_716734 ) ) ( not ( = ?auto_716719 ?auto_716735 ) ) ( not ( = ?auto_716720 ?auto_716721 ) ) ( not ( = ?auto_716720 ?auto_716722 ) ) ( not ( = ?auto_716720 ?auto_716723 ) ) ( not ( = ?auto_716720 ?auto_716724 ) ) ( not ( = ?auto_716720 ?auto_716725 ) ) ( not ( = ?auto_716720 ?auto_716726 ) ) ( not ( = ?auto_716720 ?auto_716727 ) ) ( not ( = ?auto_716720 ?auto_716728 ) ) ( not ( = ?auto_716720 ?auto_716729 ) ) ( not ( = ?auto_716720 ?auto_716730 ) ) ( not ( = ?auto_716720 ?auto_716731 ) ) ( not ( = ?auto_716720 ?auto_716732 ) ) ( not ( = ?auto_716720 ?auto_716733 ) ) ( not ( = ?auto_716720 ?auto_716734 ) ) ( not ( = ?auto_716720 ?auto_716735 ) ) ( not ( = ?auto_716721 ?auto_716722 ) ) ( not ( = ?auto_716721 ?auto_716723 ) ) ( not ( = ?auto_716721 ?auto_716724 ) ) ( not ( = ?auto_716721 ?auto_716725 ) ) ( not ( = ?auto_716721 ?auto_716726 ) ) ( not ( = ?auto_716721 ?auto_716727 ) ) ( not ( = ?auto_716721 ?auto_716728 ) ) ( not ( = ?auto_716721 ?auto_716729 ) ) ( not ( = ?auto_716721 ?auto_716730 ) ) ( not ( = ?auto_716721 ?auto_716731 ) ) ( not ( = ?auto_716721 ?auto_716732 ) ) ( not ( = ?auto_716721 ?auto_716733 ) ) ( not ( = ?auto_716721 ?auto_716734 ) ) ( not ( = ?auto_716721 ?auto_716735 ) ) ( not ( = ?auto_716722 ?auto_716723 ) ) ( not ( = ?auto_716722 ?auto_716724 ) ) ( not ( = ?auto_716722 ?auto_716725 ) ) ( not ( = ?auto_716722 ?auto_716726 ) ) ( not ( = ?auto_716722 ?auto_716727 ) ) ( not ( = ?auto_716722 ?auto_716728 ) ) ( not ( = ?auto_716722 ?auto_716729 ) ) ( not ( = ?auto_716722 ?auto_716730 ) ) ( not ( = ?auto_716722 ?auto_716731 ) ) ( not ( = ?auto_716722 ?auto_716732 ) ) ( not ( = ?auto_716722 ?auto_716733 ) ) ( not ( = ?auto_716722 ?auto_716734 ) ) ( not ( = ?auto_716722 ?auto_716735 ) ) ( not ( = ?auto_716723 ?auto_716724 ) ) ( not ( = ?auto_716723 ?auto_716725 ) ) ( not ( = ?auto_716723 ?auto_716726 ) ) ( not ( = ?auto_716723 ?auto_716727 ) ) ( not ( = ?auto_716723 ?auto_716728 ) ) ( not ( = ?auto_716723 ?auto_716729 ) ) ( not ( = ?auto_716723 ?auto_716730 ) ) ( not ( = ?auto_716723 ?auto_716731 ) ) ( not ( = ?auto_716723 ?auto_716732 ) ) ( not ( = ?auto_716723 ?auto_716733 ) ) ( not ( = ?auto_716723 ?auto_716734 ) ) ( not ( = ?auto_716723 ?auto_716735 ) ) ( not ( = ?auto_716724 ?auto_716725 ) ) ( not ( = ?auto_716724 ?auto_716726 ) ) ( not ( = ?auto_716724 ?auto_716727 ) ) ( not ( = ?auto_716724 ?auto_716728 ) ) ( not ( = ?auto_716724 ?auto_716729 ) ) ( not ( = ?auto_716724 ?auto_716730 ) ) ( not ( = ?auto_716724 ?auto_716731 ) ) ( not ( = ?auto_716724 ?auto_716732 ) ) ( not ( = ?auto_716724 ?auto_716733 ) ) ( not ( = ?auto_716724 ?auto_716734 ) ) ( not ( = ?auto_716724 ?auto_716735 ) ) ( not ( = ?auto_716725 ?auto_716726 ) ) ( not ( = ?auto_716725 ?auto_716727 ) ) ( not ( = ?auto_716725 ?auto_716728 ) ) ( not ( = ?auto_716725 ?auto_716729 ) ) ( not ( = ?auto_716725 ?auto_716730 ) ) ( not ( = ?auto_716725 ?auto_716731 ) ) ( not ( = ?auto_716725 ?auto_716732 ) ) ( not ( = ?auto_716725 ?auto_716733 ) ) ( not ( = ?auto_716725 ?auto_716734 ) ) ( not ( = ?auto_716725 ?auto_716735 ) ) ( not ( = ?auto_716726 ?auto_716727 ) ) ( not ( = ?auto_716726 ?auto_716728 ) ) ( not ( = ?auto_716726 ?auto_716729 ) ) ( not ( = ?auto_716726 ?auto_716730 ) ) ( not ( = ?auto_716726 ?auto_716731 ) ) ( not ( = ?auto_716726 ?auto_716732 ) ) ( not ( = ?auto_716726 ?auto_716733 ) ) ( not ( = ?auto_716726 ?auto_716734 ) ) ( not ( = ?auto_716726 ?auto_716735 ) ) ( not ( = ?auto_716727 ?auto_716728 ) ) ( not ( = ?auto_716727 ?auto_716729 ) ) ( not ( = ?auto_716727 ?auto_716730 ) ) ( not ( = ?auto_716727 ?auto_716731 ) ) ( not ( = ?auto_716727 ?auto_716732 ) ) ( not ( = ?auto_716727 ?auto_716733 ) ) ( not ( = ?auto_716727 ?auto_716734 ) ) ( not ( = ?auto_716727 ?auto_716735 ) ) ( not ( = ?auto_716728 ?auto_716729 ) ) ( not ( = ?auto_716728 ?auto_716730 ) ) ( not ( = ?auto_716728 ?auto_716731 ) ) ( not ( = ?auto_716728 ?auto_716732 ) ) ( not ( = ?auto_716728 ?auto_716733 ) ) ( not ( = ?auto_716728 ?auto_716734 ) ) ( not ( = ?auto_716728 ?auto_716735 ) ) ( not ( = ?auto_716729 ?auto_716730 ) ) ( not ( = ?auto_716729 ?auto_716731 ) ) ( not ( = ?auto_716729 ?auto_716732 ) ) ( not ( = ?auto_716729 ?auto_716733 ) ) ( not ( = ?auto_716729 ?auto_716734 ) ) ( not ( = ?auto_716729 ?auto_716735 ) ) ( not ( = ?auto_716730 ?auto_716731 ) ) ( not ( = ?auto_716730 ?auto_716732 ) ) ( not ( = ?auto_716730 ?auto_716733 ) ) ( not ( = ?auto_716730 ?auto_716734 ) ) ( not ( = ?auto_716730 ?auto_716735 ) ) ( not ( = ?auto_716731 ?auto_716732 ) ) ( not ( = ?auto_716731 ?auto_716733 ) ) ( not ( = ?auto_716731 ?auto_716734 ) ) ( not ( = ?auto_716731 ?auto_716735 ) ) ( not ( = ?auto_716732 ?auto_716733 ) ) ( not ( = ?auto_716732 ?auto_716734 ) ) ( not ( = ?auto_716732 ?auto_716735 ) ) ( not ( = ?auto_716733 ?auto_716734 ) ) ( not ( = ?auto_716733 ?auto_716735 ) ) ( not ( = ?auto_716734 ?auto_716735 ) ) ( ON ?auto_716733 ?auto_716734 ) ( ON ?auto_716732 ?auto_716733 ) ( ON ?auto_716731 ?auto_716732 ) ( ON ?auto_716730 ?auto_716731 ) ( ON ?auto_716729 ?auto_716730 ) ( ON ?auto_716728 ?auto_716729 ) ( ON ?auto_716727 ?auto_716728 ) ( ON ?auto_716726 ?auto_716727 ) ( CLEAR ?auto_716724 ) ( ON ?auto_716725 ?auto_716726 ) ( CLEAR ?auto_716725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_716718 ?auto_716719 ?auto_716720 ?auto_716721 ?auto_716722 ?auto_716723 ?auto_716724 ?auto_716725 )
      ( MAKE-17PILE ?auto_716718 ?auto_716719 ?auto_716720 ?auto_716721 ?auto_716722 ?auto_716723 ?auto_716724 ?auto_716725 ?auto_716726 ?auto_716727 ?auto_716728 ?auto_716729 ?auto_716730 ?auto_716731 ?auto_716732 ?auto_716733 ?auto_716734 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716753 - BLOCK
      ?auto_716754 - BLOCK
      ?auto_716755 - BLOCK
      ?auto_716756 - BLOCK
      ?auto_716757 - BLOCK
      ?auto_716758 - BLOCK
      ?auto_716759 - BLOCK
      ?auto_716760 - BLOCK
      ?auto_716761 - BLOCK
      ?auto_716762 - BLOCK
      ?auto_716763 - BLOCK
      ?auto_716764 - BLOCK
      ?auto_716765 - BLOCK
      ?auto_716766 - BLOCK
      ?auto_716767 - BLOCK
      ?auto_716768 - BLOCK
      ?auto_716769 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716769 ) ( ON-TABLE ?auto_716753 ) ( ON ?auto_716754 ?auto_716753 ) ( ON ?auto_716755 ?auto_716754 ) ( ON ?auto_716756 ?auto_716755 ) ( ON ?auto_716757 ?auto_716756 ) ( ON ?auto_716758 ?auto_716757 ) ( ON ?auto_716759 ?auto_716758 ) ( not ( = ?auto_716753 ?auto_716754 ) ) ( not ( = ?auto_716753 ?auto_716755 ) ) ( not ( = ?auto_716753 ?auto_716756 ) ) ( not ( = ?auto_716753 ?auto_716757 ) ) ( not ( = ?auto_716753 ?auto_716758 ) ) ( not ( = ?auto_716753 ?auto_716759 ) ) ( not ( = ?auto_716753 ?auto_716760 ) ) ( not ( = ?auto_716753 ?auto_716761 ) ) ( not ( = ?auto_716753 ?auto_716762 ) ) ( not ( = ?auto_716753 ?auto_716763 ) ) ( not ( = ?auto_716753 ?auto_716764 ) ) ( not ( = ?auto_716753 ?auto_716765 ) ) ( not ( = ?auto_716753 ?auto_716766 ) ) ( not ( = ?auto_716753 ?auto_716767 ) ) ( not ( = ?auto_716753 ?auto_716768 ) ) ( not ( = ?auto_716753 ?auto_716769 ) ) ( not ( = ?auto_716754 ?auto_716755 ) ) ( not ( = ?auto_716754 ?auto_716756 ) ) ( not ( = ?auto_716754 ?auto_716757 ) ) ( not ( = ?auto_716754 ?auto_716758 ) ) ( not ( = ?auto_716754 ?auto_716759 ) ) ( not ( = ?auto_716754 ?auto_716760 ) ) ( not ( = ?auto_716754 ?auto_716761 ) ) ( not ( = ?auto_716754 ?auto_716762 ) ) ( not ( = ?auto_716754 ?auto_716763 ) ) ( not ( = ?auto_716754 ?auto_716764 ) ) ( not ( = ?auto_716754 ?auto_716765 ) ) ( not ( = ?auto_716754 ?auto_716766 ) ) ( not ( = ?auto_716754 ?auto_716767 ) ) ( not ( = ?auto_716754 ?auto_716768 ) ) ( not ( = ?auto_716754 ?auto_716769 ) ) ( not ( = ?auto_716755 ?auto_716756 ) ) ( not ( = ?auto_716755 ?auto_716757 ) ) ( not ( = ?auto_716755 ?auto_716758 ) ) ( not ( = ?auto_716755 ?auto_716759 ) ) ( not ( = ?auto_716755 ?auto_716760 ) ) ( not ( = ?auto_716755 ?auto_716761 ) ) ( not ( = ?auto_716755 ?auto_716762 ) ) ( not ( = ?auto_716755 ?auto_716763 ) ) ( not ( = ?auto_716755 ?auto_716764 ) ) ( not ( = ?auto_716755 ?auto_716765 ) ) ( not ( = ?auto_716755 ?auto_716766 ) ) ( not ( = ?auto_716755 ?auto_716767 ) ) ( not ( = ?auto_716755 ?auto_716768 ) ) ( not ( = ?auto_716755 ?auto_716769 ) ) ( not ( = ?auto_716756 ?auto_716757 ) ) ( not ( = ?auto_716756 ?auto_716758 ) ) ( not ( = ?auto_716756 ?auto_716759 ) ) ( not ( = ?auto_716756 ?auto_716760 ) ) ( not ( = ?auto_716756 ?auto_716761 ) ) ( not ( = ?auto_716756 ?auto_716762 ) ) ( not ( = ?auto_716756 ?auto_716763 ) ) ( not ( = ?auto_716756 ?auto_716764 ) ) ( not ( = ?auto_716756 ?auto_716765 ) ) ( not ( = ?auto_716756 ?auto_716766 ) ) ( not ( = ?auto_716756 ?auto_716767 ) ) ( not ( = ?auto_716756 ?auto_716768 ) ) ( not ( = ?auto_716756 ?auto_716769 ) ) ( not ( = ?auto_716757 ?auto_716758 ) ) ( not ( = ?auto_716757 ?auto_716759 ) ) ( not ( = ?auto_716757 ?auto_716760 ) ) ( not ( = ?auto_716757 ?auto_716761 ) ) ( not ( = ?auto_716757 ?auto_716762 ) ) ( not ( = ?auto_716757 ?auto_716763 ) ) ( not ( = ?auto_716757 ?auto_716764 ) ) ( not ( = ?auto_716757 ?auto_716765 ) ) ( not ( = ?auto_716757 ?auto_716766 ) ) ( not ( = ?auto_716757 ?auto_716767 ) ) ( not ( = ?auto_716757 ?auto_716768 ) ) ( not ( = ?auto_716757 ?auto_716769 ) ) ( not ( = ?auto_716758 ?auto_716759 ) ) ( not ( = ?auto_716758 ?auto_716760 ) ) ( not ( = ?auto_716758 ?auto_716761 ) ) ( not ( = ?auto_716758 ?auto_716762 ) ) ( not ( = ?auto_716758 ?auto_716763 ) ) ( not ( = ?auto_716758 ?auto_716764 ) ) ( not ( = ?auto_716758 ?auto_716765 ) ) ( not ( = ?auto_716758 ?auto_716766 ) ) ( not ( = ?auto_716758 ?auto_716767 ) ) ( not ( = ?auto_716758 ?auto_716768 ) ) ( not ( = ?auto_716758 ?auto_716769 ) ) ( not ( = ?auto_716759 ?auto_716760 ) ) ( not ( = ?auto_716759 ?auto_716761 ) ) ( not ( = ?auto_716759 ?auto_716762 ) ) ( not ( = ?auto_716759 ?auto_716763 ) ) ( not ( = ?auto_716759 ?auto_716764 ) ) ( not ( = ?auto_716759 ?auto_716765 ) ) ( not ( = ?auto_716759 ?auto_716766 ) ) ( not ( = ?auto_716759 ?auto_716767 ) ) ( not ( = ?auto_716759 ?auto_716768 ) ) ( not ( = ?auto_716759 ?auto_716769 ) ) ( not ( = ?auto_716760 ?auto_716761 ) ) ( not ( = ?auto_716760 ?auto_716762 ) ) ( not ( = ?auto_716760 ?auto_716763 ) ) ( not ( = ?auto_716760 ?auto_716764 ) ) ( not ( = ?auto_716760 ?auto_716765 ) ) ( not ( = ?auto_716760 ?auto_716766 ) ) ( not ( = ?auto_716760 ?auto_716767 ) ) ( not ( = ?auto_716760 ?auto_716768 ) ) ( not ( = ?auto_716760 ?auto_716769 ) ) ( not ( = ?auto_716761 ?auto_716762 ) ) ( not ( = ?auto_716761 ?auto_716763 ) ) ( not ( = ?auto_716761 ?auto_716764 ) ) ( not ( = ?auto_716761 ?auto_716765 ) ) ( not ( = ?auto_716761 ?auto_716766 ) ) ( not ( = ?auto_716761 ?auto_716767 ) ) ( not ( = ?auto_716761 ?auto_716768 ) ) ( not ( = ?auto_716761 ?auto_716769 ) ) ( not ( = ?auto_716762 ?auto_716763 ) ) ( not ( = ?auto_716762 ?auto_716764 ) ) ( not ( = ?auto_716762 ?auto_716765 ) ) ( not ( = ?auto_716762 ?auto_716766 ) ) ( not ( = ?auto_716762 ?auto_716767 ) ) ( not ( = ?auto_716762 ?auto_716768 ) ) ( not ( = ?auto_716762 ?auto_716769 ) ) ( not ( = ?auto_716763 ?auto_716764 ) ) ( not ( = ?auto_716763 ?auto_716765 ) ) ( not ( = ?auto_716763 ?auto_716766 ) ) ( not ( = ?auto_716763 ?auto_716767 ) ) ( not ( = ?auto_716763 ?auto_716768 ) ) ( not ( = ?auto_716763 ?auto_716769 ) ) ( not ( = ?auto_716764 ?auto_716765 ) ) ( not ( = ?auto_716764 ?auto_716766 ) ) ( not ( = ?auto_716764 ?auto_716767 ) ) ( not ( = ?auto_716764 ?auto_716768 ) ) ( not ( = ?auto_716764 ?auto_716769 ) ) ( not ( = ?auto_716765 ?auto_716766 ) ) ( not ( = ?auto_716765 ?auto_716767 ) ) ( not ( = ?auto_716765 ?auto_716768 ) ) ( not ( = ?auto_716765 ?auto_716769 ) ) ( not ( = ?auto_716766 ?auto_716767 ) ) ( not ( = ?auto_716766 ?auto_716768 ) ) ( not ( = ?auto_716766 ?auto_716769 ) ) ( not ( = ?auto_716767 ?auto_716768 ) ) ( not ( = ?auto_716767 ?auto_716769 ) ) ( not ( = ?auto_716768 ?auto_716769 ) ) ( ON ?auto_716768 ?auto_716769 ) ( ON ?auto_716767 ?auto_716768 ) ( ON ?auto_716766 ?auto_716767 ) ( ON ?auto_716765 ?auto_716766 ) ( ON ?auto_716764 ?auto_716765 ) ( ON ?auto_716763 ?auto_716764 ) ( ON ?auto_716762 ?auto_716763 ) ( ON ?auto_716761 ?auto_716762 ) ( CLEAR ?auto_716759 ) ( ON ?auto_716760 ?auto_716761 ) ( CLEAR ?auto_716760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_716753 ?auto_716754 ?auto_716755 ?auto_716756 ?auto_716757 ?auto_716758 ?auto_716759 ?auto_716760 )
      ( MAKE-17PILE ?auto_716753 ?auto_716754 ?auto_716755 ?auto_716756 ?auto_716757 ?auto_716758 ?auto_716759 ?auto_716760 ?auto_716761 ?auto_716762 ?auto_716763 ?auto_716764 ?auto_716765 ?auto_716766 ?auto_716767 ?auto_716768 ?auto_716769 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716787 - BLOCK
      ?auto_716788 - BLOCK
      ?auto_716789 - BLOCK
      ?auto_716790 - BLOCK
      ?auto_716791 - BLOCK
      ?auto_716792 - BLOCK
      ?auto_716793 - BLOCK
      ?auto_716794 - BLOCK
      ?auto_716795 - BLOCK
      ?auto_716796 - BLOCK
      ?auto_716797 - BLOCK
      ?auto_716798 - BLOCK
      ?auto_716799 - BLOCK
      ?auto_716800 - BLOCK
      ?auto_716801 - BLOCK
      ?auto_716802 - BLOCK
      ?auto_716803 - BLOCK
    )
    :vars
    (
      ?auto_716804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716803 ?auto_716804 ) ( ON-TABLE ?auto_716787 ) ( ON ?auto_716788 ?auto_716787 ) ( ON ?auto_716789 ?auto_716788 ) ( ON ?auto_716790 ?auto_716789 ) ( ON ?auto_716791 ?auto_716790 ) ( ON ?auto_716792 ?auto_716791 ) ( not ( = ?auto_716787 ?auto_716788 ) ) ( not ( = ?auto_716787 ?auto_716789 ) ) ( not ( = ?auto_716787 ?auto_716790 ) ) ( not ( = ?auto_716787 ?auto_716791 ) ) ( not ( = ?auto_716787 ?auto_716792 ) ) ( not ( = ?auto_716787 ?auto_716793 ) ) ( not ( = ?auto_716787 ?auto_716794 ) ) ( not ( = ?auto_716787 ?auto_716795 ) ) ( not ( = ?auto_716787 ?auto_716796 ) ) ( not ( = ?auto_716787 ?auto_716797 ) ) ( not ( = ?auto_716787 ?auto_716798 ) ) ( not ( = ?auto_716787 ?auto_716799 ) ) ( not ( = ?auto_716787 ?auto_716800 ) ) ( not ( = ?auto_716787 ?auto_716801 ) ) ( not ( = ?auto_716787 ?auto_716802 ) ) ( not ( = ?auto_716787 ?auto_716803 ) ) ( not ( = ?auto_716787 ?auto_716804 ) ) ( not ( = ?auto_716788 ?auto_716789 ) ) ( not ( = ?auto_716788 ?auto_716790 ) ) ( not ( = ?auto_716788 ?auto_716791 ) ) ( not ( = ?auto_716788 ?auto_716792 ) ) ( not ( = ?auto_716788 ?auto_716793 ) ) ( not ( = ?auto_716788 ?auto_716794 ) ) ( not ( = ?auto_716788 ?auto_716795 ) ) ( not ( = ?auto_716788 ?auto_716796 ) ) ( not ( = ?auto_716788 ?auto_716797 ) ) ( not ( = ?auto_716788 ?auto_716798 ) ) ( not ( = ?auto_716788 ?auto_716799 ) ) ( not ( = ?auto_716788 ?auto_716800 ) ) ( not ( = ?auto_716788 ?auto_716801 ) ) ( not ( = ?auto_716788 ?auto_716802 ) ) ( not ( = ?auto_716788 ?auto_716803 ) ) ( not ( = ?auto_716788 ?auto_716804 ) ) ( not ( = ?auto_716789 ?auto_716790 ) ) ( not ( = ?auto_716789 ?auto_716791 ) ) ( not ( = ?auto_716789 ?auto_716792 ) ) ( not ( = ?auto_716789 ?auto_716793 ) ) ( not ( = ?auto_716789 ?auto_716794 ) ) ( not ( = ?auto_716789 ?auto_716795 ) ) ( not ( = ?auto_716789 ?auto_716796 ) ) ( not ( = ?auto_716789 ?auto_716797 ) ) ( not ( = ?auto_716789 ?auto_716798 ) ) ( not ( = ?auto_716789 ?auto_716799 ) ) ( not ( = ?auto_716789 ?auto_716800 ) ) ( not ( = ?auto_716789 ?auto_716801 ) ) ( not ( = ?auto_716789 ?auto_716802 ) ) ( not ( = ?auto_716789 ?auto_716803 ) ) ( not ( = ?auto_716789 ?auto_716804 ) ) ( not ( = ?auto_716790 ?auto_716791 ) ) ( not ( = ?auto_716790 ?auto_716792 ) ) ( not ( = ?auto_716790 ?auto_716793 ) ) ( not ( = ?auto_716790 ?auto_716794 ) ) ( not ( = ?auto_716790 ?auto_716795 ) ) ( not ( = ?auto_716790 ?auto_716796 ) ) ( not ( = ?auto_716790 ?auto_716797 ) ) ( not ( = ?auto_716790 ?auto_716798 ) ) ( not ( = ?auto_716790 ?auto_716799 ) ) ( not ( = ?auto_716790 ?auto_716800 ) ) ( not ( = ?auto_716790 ?auto_716801 ) ) ( not ( = ?auto_716790 ?auto_716802 ) ) ( not ( = ?auto_716790 ?auto_716803 ) ) ( not ( = ?auto_716790 ?auto_716804 ) ) ( not ( = ?auto_716791 ?auto_716792 ) ) ( not ( = ?auto_716791 ?auto_716793 ) ) ( not ( = ?auto_716791 ?auto_716794 ) ) ( not ( = ?auto_716791 ?auto_716795 ) ) ( not ( = ?auto_716791 ?auto_716796 ) ) ( not ( = ?auto_716791 ?auto_716797 ) ) ( not ( = ?auto_716791 ?auto_716798 ) ) ( not ( = ?auto_716791 ?auto_716799 ) ) ( not ( = ?auto_716791 ?auto_716800 ) ) ( not ( = ?auto_716791 ?auto_716801 ) ) ( not ( = ?auto_716791 ?auto_716802 ) ) ( not ( = ?auto_716791 ?auto_716803 ) ) ( not ( = ?auto_716791 ?auto_716804 ) ) ( not ( = ?auto_716792 ?auto_716793 ) ) ( not ( = ?auto_716792 ?auto_716794 ) ) ( not ( = ?auto_716792 ?auto_716795 ) ) ( not ( = ?auto_716792 ?auto_716796 ) ) ( not ( = ?auto_716792 ?auto_716797 ) ) ( not ( = ?auto_716792 ?auto_716798 ) ) ( not ( = ?auto_716792 ?auto_716799 ) ) ( not ( = ?auto_716792 ?auto_716800 ) ) ( not ( = ?auto_716792 ?auto_716801 ) ) ( not ( = ?auto_716792 ?auto_716802 ) ) ( not ( = ?auto_716792 ?auto_716803 ) ) ( not ( = ?auto_716792 ?auto_716804 ) ) ( not ( = ?auto_716793 ?auto_716794 ) ) ( not ( = ?auto_716793 ?auto_716795 ) ) ( not ( = ?auto_716793 ?auto_716796 ) ) ( not ( = ?auto_716793 ?auto_716797 ) ) ( not ( = ?auto_716793 ?auto_716798 ) ) ( not ( = ?auto_716793 ?auto_716799 ) ) ( not ( = ?auto_716793 ?auto_716800 ) ) ( not ( = ?auto_716793 ?auto_716801 ) ) ( not ( = ?auto_716793 ?auto_716802 ) ) ( not ( = ?auto_716793 ?auto_716803 ) ) ( not ( = ?auto_716793 ?auto_716804 ) ) ( not ( = ?auto_716794 ?auto_716795 ) ) ( not ( = ?auto_716794 ?auto_716796 ) ) ( not ( = ?auto_716794 ?auto_716797 ) ) ( not ( = ?auto_716794 ?auto_716798 ) ) ( not ( = ?auto_716794 ?auto_716799 ) ) ( not ( = ?auto_716794 ?auto_716800 ) ) ( not ( = ?auto_716794 ?auto_716801 ) ) ( not ( = ?auto_716794 ?auto_716802 ) ) ( not ( = ?auto_716794 ?auto_716803 ) ) ( not ( = ?auto_716794 ?auto_716804 ) ) ( not ( = ?auto_716795 ?auto_716796 ) ) ( not ( = ?auto_716795 ?auto_716797 ) ) ( not ( = ?auto_716795 ?auto_716798 ) ) ( not ( = ?auto_716795 ?auto_716799 ) ) ( not ( = ?auto_716795 ?auto_716800 ) ) ( not ( = ?auto_716795 ?auto_716801 ) ) ( not ( = ?auto_716795 ?auto_716802 ) ) ( not ( = ?auto_716795 ?auto_716803 ) ) ( not ( = ?auto_716795 ?auto_716804 ) ) ( not ( = ?auto_716796 ?auto_716797 ) ) ( not ( = ?auto_716796 ?auto_716798 ) ) ( not ( = ?auto_716796 ?auto_716799 ) ) ( not ( = ?auto_716796 ?auto_716800 ) ) ( not ( = ?auto_716796 ?auto_716801 ) ) ( not ( = ?auto_716796 ?auto_716802 ) ) ( not ( = ?auto_716796 ?auto_716803 ) ) ( not ( = ?auto_716796 ?auto_716804 ) ) ( not ( = ?auto_716797 ?auto_716798 ) ) ( not ( = ?auto_716797 ?auto_716799 ) ) ( not ( = ?auto_716797 ?auto_716800 ) ) ( not ( = ?auto_716797 ?auto_716801 ) ) ( not ( = ?auto_716797 ?auto_716802 ) ) ( not ( = ?auto_716797 ?auto_716803 ) ) ( not ( = ?auto_716797 ?auto_716804 ) ) ( not ( = ?auto_716798 ?auto_716799 ) ) ( not ( = ?auto_716798 ?auto_716800 ) ) ( not ( = ?auto_716798 ?auto_716801 ) ) ( not ( = ?auto_716798 ?auto_716802 ) ) ( not ( = ?auto_716798 ?auto_716803 ) ) ( not ( = ?auto_716798 ?auto_716804 ) ) ( not ( = ?auto_716799 ?auto_716800 ) ) ( not ( = ?auto_716799 ?auto_716801 ) ) ( not ( = ?auto_716799 ?auto_716802 ) ) ( not ( = ?auto_716799 ?auto_716803 ) ) ( not ( = ?auto_716799 ?auto_716804 ) ) ( not ( = ?auto_716800 ?auto_716801 ) ) ( not ( = ?auto_716800 ?auto_716802 ) ) ( not ( = ?auto_716800 ?auto_716803 ) ) ( not ( = ?auto_716800 ?auto_716804 ) ) ( not ( = ?auto_716801 ?auto_716802 ) ) ( not ( = ?auto_716801 ?auto_716803 ) ) ( not ( = ?auto_716801 ?auto_716804 ) ) ( not ( = ?auto_716802 ?auto_716803 ) ) ( not ( = ?auto_716802 ?auto_716804 ) ) ( not ( = ?auto_716803 ?auto_716804 ) ) ( ON ?auto_716802 ?auto_716803 ) ( ON ?auto_716801 ?auto_716802 ) ( ON ?auto_716800 ?auto_716801 ) ( ON ?auto_716799 ?auto_716800 ) ( ON ?auto_716798 ?auto_716799 ) ( ON ?auto_716797 ?auto_716798 ) ( ON ?auto_716796 ?auto_716797 ) ( ON ?auto_716795 ?auto_716796 ) ( ON ?auto_716794 ?auto_716795 ) ( CLEAR ?auto_716792 ) ( ON ?auto_716793 ?auto_716794 ) ( CLEAR ?auto_716793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_716787 ?auto_716788 ?auto_716789 ?auto_716790 ?auto_716791 ?auto_716792 ?auto_716793 )
      ( MAKE-17PILE ?auto_716787 ?auto_716788 ?auto_716789 ?auto_716790 ?auto_716791 ?auto_716792 ?auto_716793 ?auto_716794 ?auto_716795 ?auto_716796 ?auto_716797 ?auto_716798 ?auto_716799 ?auto_716800 ?auto_716801 ?auto_716802 ?auto_716803 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716822 - BLOCK
      ?auto_716823 - BLOCK
      ?auto_716824 - BLOCK
      ?auto_716825 - BLOCK
      ?auto_716826 - BLOCK
      ?auto_716827 - BLOCK
      ?auto_716828 - BLOCK
      ?auto_716829 - BLOCK
      ?auto_716830 - BLOCK
      ?auto_716831 - BLOCK
      ?auto_716832 - BLOCK
      ?auto_716833 - BLOCK
      ?auto_716834 - BLOCK
      ?auto_716835 - BLOCK
      ?auto_716836 - BLOCK
      ?auto_716837 - BLOCK
      ?auto_716838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716838 ) ( ON-TABLE ?auto_716822 ) ( ON ?auto_716823 ?auto_716822 ) ( ON ?auto_716824 ?auto_716823 ) ( ON ?auto_716825 ?auto_716824 ) ( ON ?auto_716826 ?auto_716825 ) ( ON ?auto_716827 ?auto_716826 ) ( not ( = ?auto_716822 ?auto_716823 ) ) ( not ( = ?auto_716822 ?auto_716824 ) ) ( not ( = ?auto_716822 ?auto_716825 ) ) ( not ( = ?auto_716822 ?auto_716826 ) ) ( not ( = ?auto_716822 ?auto_716827 ) ) ( not ( = ?auto_716822 ?auto_716828 ) ) ( not ( = ?auto_716822 ?auto_716829 ) ) ( not ( = ?auto_716822 ?auto_716830 ) ) ( not ( = ?auto_716822 ?auto_716831 ) ) ( not ( = ?auto_716822 ?auto_716832 ) ) ( not ( = ?auto_716822 ?auto_716833 ) ) ( not ( = ?auto_716822 ?auto_716834 ) ) ( not ( = ?auto_716822 ?auto_716835 ) ) ( not ( = ?auto_716822 ?auto_716836 ) ) ( not ( = ?auto_716822 ?auto_716837 ) ) ( not ( = ?auto_716822 ?auto_716838 ) ) ( not ( = ?auto_716823 ?auto_716824 ) ) ( not ( = ?auto_716823 ?auto_716825 ) ) ( not ( = ?auto_716823 ?auto_716826 ) ) ( not ( = ?auto_716823 ?auto_716827 ) ) ( not ( = ?auto_716823 ?auto_716828 ) ) ( not ( = ?auto_716823 ?auto_716829 ) ) ( not ( = ?auto_716823 ?auto_716830 ) ) ( not ( = ?auto_716823 ?auto_716831 ) ) ( not ( = ?auto_716823 ?auto_716832 ) ) ( not ( = ?auto_716823 ?auto_716833 ) ) ( not ( = ?auto_716823 ?auto_716834 ) ) ( not ( = ?auto_716823 ?auto_716835 ) ) ( not ( = ?auto_716823 ?auto_716836 ) ) ( not ( = ?auto_716823 ?auto_716837 ) ) ( not ( = ?auto_716823 ?auto_716838 ) ) ( not ( = ?auto_716824 ?auto_716825 ) ) ( not ( = ?auto_716824 ?auto_716826 ) ) ( not ( = ?auto_716824 ?auto_716827 ) ) ( not ( = ?auto_716824 ?auto_716828 ) ) ( not ( = ?auto_716824 ?auto_716829 ) ) ( not ( = ?auto_716824 ?auto_716830 ) ) ( not ( = ?auto_716824 ?auto_716831 ) ) ( not ( = ?auto_716824 ?auto_716832 ) ) ( not ( = ?auto_716824 ?auto_716833 ) ) ( not ( = ?auto_716824 ?auto_716834 ) ) ( not ( = ?auto_716824 ?auto_716835 ) ) ( not ( = ?auto_716824 ?auto_716836 ) ) ( not ( = ?auto_716824 ?auto_716837 ) ) ( not ( = ?auto_716824 ?auto_716838 ) ) ( not ( = ?auto_716825 ?auto_716826 ) ) ( not ( = ?auto_716825 ?auto_716827 ) ) ( not ( = ?auto_716825 ?auto_716828 ) ) ( not ( = ?auto_716825 ?auto_716829 ) ) ( not ( = ?auto_716825 ?auto_716830 ) ) ( not ( = ?auto_716825 ?auto_716831 ) ) ( not ( = ?auto_716825 ?auto_716832 ) ) ( not ( = ?auto_716825 ?auto_716833 ) ) ( not ( = ?auto_716825 ?auto_716834 ) ) ( not ( = ?auto_716825 ?auto_716835 ) ) ( not ( = ?auto_716825 ?auto_716836 ) ) ( not ( = ?auto_716825 ?auto_716837 ) ) ( not ( = ?auto_716825 ?auto_716838 ) ) ( not ( = ?auto_716826 ?auto_716827 ) ) ( not ( = ?auto_716826 ?auto_716828 ) ) ( not ( = ?auto_716826 ?auto_716829 ) ) ( not ( = ?auto_716826 ?auto_716830 ) ) ( not ( = ?auto_716826 ?auto_716831 ) ) ( not ( = ?auto_716826 ?auto_716832 ) ) ( not ( = ?auto_716826 ?auto_716833 ) ) ( not ( = ?auto_716826 ?auto_716834 ) ) ( not ( = ?auto_716826 ?auto_716835 ) ) ( not ( = ?auto_716826 ?auto_716836 ) ) ( not ( = ?auto_716826 ?auto_716837 ) ) ( not ( = ?auto_716826 ?auto_716838 ) ) ( not ( = ?auto_716827 ?auto_716828 ) ) ( not ( = ?auto_716827 ?auto_716829 ) ) ( not ( = ?auto_716827 ?auto_716830 ) ) ( not ( = ?auto_716827 ?auto_716831 ) ) ( not ( = ?auto_716827 ?auto_716832 ) ) ( not ( = ?auto_716827 ?auto_716833 ) ) ( not ( = ?auto_716827 ?auto_716834 ) ) ( not ( = ?auto_716827 ?auto_716835 ) ) ( not ( = ?auto_716827 ?auto_716836 ) ) ( not ( = ?auto_716827 ?auto_716837 ) ) ( not ( = ?auto_716827 ?auto_716838 ) ) ( not ( = ?auto_716828 ?auto_716829 ) ) ( not ( = ?auto_716828 ?auto_716830 ) ) ( not ( = ?auto_716828 ?auto_716831 ) ) ( not ( = ?auto_716828 ?auto_716832 ) ) ( not ( = ?auto_716828 ?auto_716833 ) ) ( not ( = ?auto_716828 ?auto_716834 ) ) ( not ( = ?auto_716828 ?auto_716835 ) ) ( not ( = ?auto_716828 ?auto_716836 ) ) ( not ( = ?auto_716828 ?auto_716837 ) ) ( not ( = ?auto_716828 ?auto_716838 ) ) ( not ( = ?auto_716829 ?auto_716830 ) ) ( not ( = ?auto_716829 ?auto_716831 ) ) ( not ( = ?auto_716829 ?auto_716832 ) ) ( not ( = ?auto_716829 ?auto_716833 ) ) ( not ( = ?auto_716829 ?auto_716834 ) ) ( not ( = ?auto_716829 ?auto_716835 ) ) ( not ( = ?auto_716829 ?auto_716836 ) ) ( not ( = ?auto_716829 ?auto_716837 ) ) ( not ( = ?auto_716829 ?auto_716838 ) ) ( not ( = ?auto_716830 ?auto_716831 ) ) ( not ( = ?auto_716830 ?auto_716832 ) ) ( not ( = ?auto_716830 ?auto_716833 ) ) ( not ( = ?auto_716830 ?auto_716834 ) ) ( not ( = ?auto_716830 ?auto_716835 ) ) ( not ( = ?auto_716830 ?auto_716836 ) ) ( not ( = ?auto_716830 ?auto_716837 ) ) ( not ( = ?auto_716830 ?auto_716838 ) ) ( not ( = ?auto_716831 ?auto_716832 ) ) ( not ( = ?auto_716831 ?auto_716833 ) ) ( not ( = ?auto_716831 ?auto_716834 ) ) ( not ( = ?auto_716831 ?auto_716835 ) ) ( not ( = ?auto_716831 ?auto_716836 ) ) ( not ( = ?auto_716831 ?auto_716837 ) ) ( not ( = ?auto_716831 ?auto_716838 ) ) ( not ( = ?auto_716832 ?auto_716833 ) ) ( not ( = ?auto_716832 ?auto_716834 ) ) ( not ( = ?auto_716832 ?auto_716835 ) ) ( not ( = ?auto_716832 ?auto_716836 ) ) ( not ( = ?auto_716832 ?auto_716837 ) ) ( not ( = ?auto_716832 ?auto_716838 ) ) ( not ( = ?auto_716833 ?auto_716834 ) ) ( not ( = ?auto_716833 ?auto_716835 ) ) ( not ( = ?auto_716833 ?auto_716836 ) ) ( not ( = ?auto_716833 ?auto_716837 ) ) ( not ( = ?auto_716833 ?auto_716838 ) ) ( not ( = ?auto_716834 ?auto_716835 ) ) ( not ( = ?auto_716834 ?auto_716836 ) ) ( not ( = ?auto_716834 ?auto_716837 ) ) ( not ( = ?auto_716834 ?auto_716838 ) ) ( not ( = ?auto_716835 ?auto_716836 ) ) ( not ( = ?auto_716835 ?auto_716837 ) ) ( not ( = ?auto_716835 ?auto_716838 ) ) ( not ( = ?auto_716836 ?auto_716837 ) ) ( not ( = ?auto_716836 ?auto_716838 ) ) ( not ( = ?auto_716837 ?auto_716838 ) ) ( ON ?auto_716837 ?auto_716838 ) ( ON ?auto_716836 ?auto_716837 ) ( ON ?auto_716835 ?auto_716836 ) ( ON ?auto_716834 ?auto_716835 ) ( ON ?auto_716833 ?auto_716834 ) ( ON ?auto_716832 ?auto_716833 ) ( ON ?auto_716831 ?auto_716832 ) ( ON ?auto_716830 ?auto_716831 ) ( ON ?auto_716829 ?auto_716830 ) ( CLEAR ?auto_716827 ) ( ON ?auto_716828 ?auto_716829 ) ( CLEAR ?auto_716828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_716822 ?auto_716823 ?auto_716824 ?auto_716825 ?auto_716826 ?auto_716827 ?auto_716828 )
      ( MAKE-17PILE ?auto_716822 ?auto_716823 ?auto_716824 ?auto_716825 ?auto_716826 ?auto_716827 ?auto_716828 ?auto_716829 ?auto_716830 ?auto_716831 ?auto_716832 ?auto_716833 ?auto_716834 ?auto_716835 ?auto_716836 ?auto_716837 ?auto_716838 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716856 - BLOCK
      ?auto_716857 - BLOCK
      ?auto_716858 - BLOCK
      ?auto_716859 - BLOCK
      ?auto_716860 - BLOCK
      ?auto_716861 - BLOCK
      ?auto_716862 - BLOCK
      ?auto_716863 - BLOCK
      ?auto_716864 - BLOCK
      ?auto_716865 - BLOCK
      ?auto_716866 - BLOCK
      ?auto_716867 - BLOCK
      ?auto_716868 - BLOCK
      ?auto_716869 - BLOCK
      ?auto_716870 - BLOCK
      ?auto_716871 - BLOCK
      ?auto_716872 - BLOCK
    )
    :vars
    (
      ?auto_716873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716872 ?auto_716873 ) ( ON-TABLE ?auto_716856 ) ( ON ?auto_716857 ?auto_716856 ) ( ON ?auto_716858 ?auto_716857 ) ( ON ?auto_716859 ?auto_716858 ) ( ON ?auto_716860 ?auto_716859 ) ( not ( = ?auto_716856 ?auto_716857 ) ) ( not ( = ?auto_716856 ?auto_716858 ) ) ( not ( = ?auto_716856 ?auto_716859 ) ) ( not ( = ?auto_716856 ?auto_716860 ) ) ( not ( = ?auto_716856 ?auto_716861 ) ) ( not ( = ?auto_716856 ?auto_716862 ) ) ( not ( = ?auto_716856 ?auto_716863 ) ) ( not ( = ?auto_716856 ?auto_716864 ) ) ( not ( = ?auto_716856 ?auto_716865 ) ) ( not ( = ?auto_716856 ?auto_716866 ) ) ( not ( = ?auto_716856 ?auto_716867 ) ) ( not ( = ?auto_716856 ?auto_716868 ) ) ( not ( = ?auto_716856 ?auto_716869 ) ) ( not ( = ?auto_716856 ?auto_716870 ) ) ( not ( = ?auto_716856 ?auto_716871 ) ) ( not ( = ?auto_716856 ?auto_716872 ) ) ( not ( = ?auto_716856 ?auto_716873 ) ) ( not ( = ?auto_716857 ?auto_716858 ) ) ( not ( = ?auto_716857 ?auto_716859 ) ) ( not ( = ?auto_716857 ?auto_716860 ) ) ( not ( = ?auto_716857 ?auto_716861 ) ) ( not ( = ?auto_716857 ?auto_716862 ) ) ( not ( = ?auto_716857 ?auto_716863 ) ) ( not ( = ?auto_716857 ?auto_716864 ) ) ( not ( = ?auto_716857 ?auto_716865 ) ) ( not ( = ?auto_716857 ?auto_716866 ) ) ( not ( = ?auto_716857 ?auto_716867 ) ) ( not ( = ?auto_716857 ?auto_716868 ) ) ( not ( = ?auto_716857 ?auto_716869 ) ) ( not ( = ?auto_716857 ?auto_716870 ) ) ( not ( = ?auto_716857 ?auto_716871 ) ) ( not ( = ?auto_716857 ?auto_716872 ) ) ( not ( = ?auto_716857 ?auto_716873 ) ) ( not ( = ?auto_716858 ?auto_716859 ) ) ( not ( = ?auto_716858 ?auto_716860 ) ) ( not ( = ?auto_716858 ?auto_716861 ) ) ( not ( = ?auto_716858 ?auto_716862 ) ) ( not ( = ?auto_716858 ?auto_716863 ) ) ( not ( = ?auto_716858 ?auto_716864 ) ) ( not ( = ?auto_716858 ?auto_716865 ) ) ( not ( = ?auto_716858 ?auto_716866 ) ) ( not ( = ?auto_716858 ?auto_716867 ) ) ( not ( = ?auto_716858 ?auto_716868 ) ) ( not ( = ?auto_716858 ?auto_716869 ) ) ( not ( = ?auto_716858 ?auto_716870 ) ) ( not ( = ?auto_716858 ?auto_716871 ) ) ( not ( = ?auto_716858 ?auto_716872 ) ) ( not ( = ?auto_716858 ?auto_716873 ) ) ( not ( = ?auto_716859 ?auto_716860 ) ) ( not ( = ?auto_716859 ?auto_716861 ) ) ( not ( = ?auto_716859 ?auto_716862 ) ) ( not ( = ?auto_716859 ?auto_716863 ) ) ( not ( = ?auto_716859 ?auto_716864 ) ) ( not ( = ?auto_716859 ?auto_716865 ) ) ( not ( = ?auto_716859 ?auto_716866 ) ) ( not ( = ?auto_716859 ?auto_716867 ) ) ( not ( = ?auto_716859 ?auto_716868 ) ) ( not ( = ?auto_716859 ?auto_716869 ) ) ( not ( = ?auto_716859 ?auto_716870 ) ) ( not ( = ?auto_716859 ?auto_716871 ) ) ( not ( = ?auto_716859 ?auto_716872 ) ) ( not ( = ?auto_716859 ?auto_716873 ) ) ( not ( = ?auto_716860 ?auto_716861 ) ) ( not ( = ?auto_716860 ?auto_716862 ) ) ( not ( = ?auto_716860 ?auto_716863 ) ) ( not ( = ?auto_716860 ?auto_716864 ) ) ( not ( = ?auto_716860 ?auto_716865 ) ) ( not ( = ?auto_716860 ?auto_716866 ) ) ( not ( = ?auto_716860 ?auto_716867 ) ) ( not ( = ?auto_716860 ?auto_716868 ) ) ( not ( = ?auto_716860 ?auto_716869 ) ) ( not ( = ?auto_716860 ?auto_716870 ) ) ( not ( = ?auto_716860 ?auto_716871 ) ) ( not ( = ?auto_716860 ?auto_716872 ) ) ( not ( = ?auto_716860 ?auto_716873 ) ) ( not ( = ?auto_716861 ?auto_716862 ) ) ( not ( = ?auto_716861 ?auto_716863 ) ) ( not ( = ?auto_716861 ?auto_716864 ) ) ( not ( = ?auto_716861 ?auto_716865 ) ) ( not ( = ?auto_716861 ?auto_716866 ) ) ( not ( = ?auto_716861 ?auto_716867 ) ) ( not ( = ?auto_716861 ?auto_716868 ) ) ( not ( = ?auto_716861 ?auto_716869 ) ) ( not ( = ?auto_716861 ?auto_716870 ) ) ( not ( = ?auto_716861 ?auto_716871 ) ) ( not ( = ?auto_716861 ?auto_716872 ) ) ( not ( = ?auto_716861 ?auto_716873 ) ) ( not ( = ?auto_716862 ?auto_716863 ) ) ( not ( = ?auto_716862 ?auto_716864 ) ) ( not ( = ?auto_716862 ?auto_716865 ) ) ( not ( = ?auto_716862 ?auto_716866 ) ) ( not ( = ?auto_716862 ?auto_716867 ) ) ( not ( = ?auto_716862 ?auto_716868 ) ) ( not ( = ?auto_716862 ?auto_716869 ) ) ( not ( = ?auto_716862 ?auto_716870 ) ) ( not ( = ?auto_716862 ?auto_716871 ) ) ( not ( = ?auto_716862 ?auto_716872 ) ) ( not ( = ?auto_716862 ?auto_716873 ) ) ( not ( = ?auto_716863 ?auto_716864 ) ) ( not ( = ?auto_716863 ?auto_716865 ) ) ( not ( = ?auto_716863 ?auto_716866 ) ) ( not ( = ?auto_716863 ?auto_716867 ) ) ( not ( = ?auto_716863 ?auto_716868 ) ) ( not ( = ?auto_716863 ?auto_716869 ) ) ( not ( = ?auto_716863 ?auto_716870 ) ) ( not ( = ?auto_716863 ?auto_716871 ) ) ( not ( = ?auto_716863 ?auto_716872 ) ) ( not ( = ?auto_716863 ?auto_716873 ) ) ( not ( = ?auto_716864 ?auto_716865 ) ) ( not ( = ?auto_716864 ?auto_716866 ) ) ( not ( = ?auto_716864 ?auto_716867 ) ) ( not ( = ?auto_716864 ?auto_716868 ) ) ( not ( = ?auto_716864 ?auto_716869 ) ) ( not ( = ?auto_716864 ?auto_716870 ) ) ( not ( = ?auto_716864 ?auto_716871 ) ) ( not ( = ?auto_716864 ?auto_716872 ) ) ( not ( = ?auto_716864 ?auto_716873 ) ) ( not ( = ?auto_716865 ?auto_716866 ) ) ( not ( = ?auto_716865 ?auto_716867 ) ) ( not ( = ?auto_716865 ?auto_716868 ) ) ( not ( = ?auto_716865 ?auto_716869 ) ) ( not ( = ?auto_716865 ?auto_716870 ) ) ( not ( = ?auto_716865 ?auto_716871 ) ) ( not ( = ?auto_716865 ?auto_716872 ) ) ( not ( = ?auto_716865 ?auto_716873 ) ) ( not ( = ?auto_716866 ?auto_716867 ) ) ( not ( = ?auto_716866 ?auto_716868 ) ) ( not ( = ?auto_716866 ?auto_716869 ) ) ( not ( = ?auto_716866 ?auto_716870 ) ) ( not ( = ?auto_716866 ?auto_716871 ) ) ( not ( = ?auto_716866 ?auto_716872 ) ) ( not ( = ?auto_716866 ?auto_716873 ) ) ( not ( = ?auto_716867 ?auto_716868 ) ) ( not ( = ?auto_716867 ?auto_716869 ) ) ( not ( = ?auto_716867 ?auto_716870 ) ) ( not ( = ?auto_716867 ?auto_716871 ) ) ( not ( = ?auto_716867 ?auto_716872 ) ) ( not ( = ?auto_716867 ?auto_716873 ) ) ( not ( = ?auto_716868 ?auto_716869 ) ) ( not ( = ?auto_716868 ?auto_716870 ) ) ( not ( = ?auto_716868 ?auto_716871 ) ) ( not ( = ?auto_716868 ?auto_716872 ) ) ( not ( = ?auto_716868 ?auto_716873 ) ) ( not ( = ?auto_716869 ?auto_716870 ) ) ( not ( = ?auto_716869 ?auto_716871 ) ) ( not ( = ?auto_716869 ?auto_716872 ) ) ( not ( = ?auto_716869 ?auto_716873 ) ) ( not ( = ?auto_716870 ?auto_716871 ) ) ( not ( = ?auto_716870 ?auto_716872 ) ) ( not ( = ?auto_716870 ?auto_716873 ) ) ( not ( = ?auto_716871 ?auto_716872 ) ) ( not ( = ?auto_716871 ?auto_716873 ) ) ( not ( = ?auto_716872 ?auto_716873 ) ) ( ON ?auto_716871 ?auto_716872 ) ( ON ?auto_716870 ?auto_716871 ) ( ON ?auto_716869 ?auto_716870 ) ( ON ?auto_716868 ?auto_716869 ) ( ON ?auto_716867 ?auto_716868 ) ( ON ?auto_716866 ?auto_716867 ) ( ON ?auto_716865 ?auto_716866 ) ( ON ?auto_716864 ?auto_716865 ) ( ON ?auto_716863 ?auto_716864 ) ( ON ?auto_716862 ?auto_716863 ) ( CLEAR ?auto_716860 ) ( ON ?auto_716861 ?auto_716862 ) ( CLEAR ?auto_716861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_716856 ?auto_716857 ?auto_716858 ?auto_716859 ?auto_716860 ?auto_716861 )
      ( MAKE-17PILE ?auto_716856 ?auto_716857 ?auto_716858 ?auto_716859 ?auto_716860 ?auto_716861 ?auto_716862 ?auto_716863 ?auto_716864 ?auto_716865 ?auto_716866 ?auto_716867 ?auto_716868 ?auto_716869 ?auto_716870 ?auto_716871 ?auto_716872 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716891 - BLOCK
      ?auto_716892 - BLOCK
      ?auto_716893 - BLOCK
      ?auto_716894 - BLOCK
      ?auto_716895 - BLOCK
      ?auto_716896 - BLOCK
      ?auto_716897 - BLOCK
      ?auto_716898 - BLOCK
      ?auto_716899 - BLOCK
      ?auto_716900 - BLOCK
      ?auto_716901 - BLOCK
      ?auto_716902 - BLOCK
      ?auto_716903 - BLOCK
      ?auto_716904 - BLOCK
      ?auto_716905 - BLOCK
      ?auto_716906 - BLOCK
      ?auto_716907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716907 ) ( ON-TABLE ?auto_716891 ) ( ON ?auto_716892 ?auto_716891 ) ( ON ?auto_716893 ?auto_716892 ) ( ON ?auto_716894 ?auto_716893 ) ( ON ?auto_716895 ?auto_716894 ) ( not ( = ?auto_716891 ?auto_716892 ) ) ( not ( = ?auto_716891 ?auto_716893 ) ) ( not ( = ?auto_716891 ?auto_716894 ) ) ( not ( = ?auto_716891 ?auto_716895 ) ) ( not ( = ?auto_716891 ?auto_716896 ) ) ( not ( = ?auto_716891 ?auto_716897 ) ) ( not ( = ?auto_716891 ?auto_716898 ) ) ( not ( = ?auto_716891 ?auto_716899 ) ) ( not ( = ?auto_716891 ?auto_716900 ) ) ( not ( = ?auto_716891 ?auto_716901 ) ) ( not ( = ?auto_716891 ?auto_716902 ) ) ( not ( = ?auto_716891 ?auto_716903 ) ) ( not ( = ?auto_716891 ?auto_716904 ) ) ( not ( = ?auto_716891 ?auto_716905 ) ) ( not ( = ?auto_716891 ?auto_716906 ) ) ( not ( = ?auto_716891 ?auto_716907 ) ) ( not ( = ?auto_716892 ?auto_716893 ) ) ( not ( = ?auto_716892 ?auto_716894 ) ) ( not ( = ?auto_716892 ?auto_716895 ) ) ( not ( = ?auto_716892 ?auto_716896 ) ) ( not ( = ?auto_716892 ?auto_716897 ) ) ( not ( = ?auto_716892 ?auto_716898 ) ) ( not ( = ?auto_716892 ?auto_716899 ) ) ( not ( = ?auto_716892 ?auto_716900 ) ) ( not ( = ?auto_716892 ?auto_716901 ) ) ( not ( = ?auto_716892 ?auto_716902 ) ) ( not ( = ?auto_716892 ?auto_716903 ) ) ( not ( = ?auto_716892 ?auto_716904 ) ) ( not ( = ?auto_716892 ?auto_716905 ) ) ( not ( = ?auto_716892 ?auto_716906 ) ) ( not ( = ?auto_716892 ?auto_716907 ) ) ( not ( = ?auto_716893 ?auto_716894 ) ) ( not ( = ?auto_716893 ?auto_716895 ) ) ( not ( = ?auto_716893 ?auto_716896 ) ) ( not ( = ?auto_716893 ?auto_716897 ) ) ( not ( = ?auto_716893 ?auto_716898 ) ) ( not ( = ?auto_716893 ?auto_716899 ) ) ( not ( = ?auto_716893 ?auto_716900 ) ) ( not ( = ?auto_716893 ?auto_716901 ) ) ( not ( = ?auto_716893 ?auto_716902 ) ) ( not ( = ?auto_716893 ?auto_716903 ) ) ( not ( = ?auto_716893 ?auto_716904 ) ) ( not ( = ?auto_716893 ?auto_716905 ) ) ( not ( = ?auto_716893 ?auto_716906 ) ) ( not ( = ?auto_716893 ?auto_716907 ) ) ( not ( = ?auto_716894 ?auto_716895 ) ) ( not ( = ?auto_716894 ?auto_716896 ) ) ( not ( = ?auto_716894 ?auto_716897 ) ) ( not ( = ?auto_716894 ?auto_716898 ) ) ( not ( = ?auto_716894 ?auto_716899 ) ) ( not ( = ?auto_716894 ?auto_716900 ) ) ( not ( = ?auto_716894 ?auto_716901 ) ) ( not ( = ?auto_716894 ?auto_716902 ) ) ( not ( = ?auto_716894 ?auto_716903 ) ) ( not ( = ?auto_716894 ?auto_716904 ) ) ( not ( = ?auto_716894 ?auto_716905 ) ) ( not ( = ?auto_716894 ?auto_716906 ) ) ( not ( = ?auto_716894 ?auto_716907 ) ) ( not ( = ?auto_716895 ?auto_716896 ) ) ( not ( = ?auto_716895 ?auto_716897 ) ) ( not ( = ?auto_716895 ?auto_716898 ) ) ( not ( = ?auto_716895 ?auto_716899 ) ) ( not ( = ?auto_716895 ?auto_716900 ) ) ( not ( = ?auto_716895 ?auto_716901 ) ) ( not ( = ?auto_716895 ?auto_716902 ) ) ( not ( = ?auto_716895 ?auto_716903 ) ) ( not ( = ?auto_716895 ?auto_716904 ) ) ( not ( = ?auto_716895 ?auto_716905 ) ) ( not ( = ?auto_716895 ?auto_716906 ) ) ( not ( = ?auto_716895 ?auto_716907 ) ) ( not ( = ?auto_716896 ?auto_716897 ) ) ( not ( = ?auto_716896 ?auto_716898 ) ) ( not ( = ?auto_716896 ?auto_716899 ) ) ( not ( = ?auto_716896 ?auto_716900 ) ) ( not ( = ?auto_716896 ?auto_716901 ) ) ( not ( = ?auto_716896 ?auto_716902 ) ) ( not ( = ?auto_716896 ?auto_716903 ) ) ( not ( = ?auto_716896 ?auto_716904 ) ) ( not ( = ?auto_716896 ?auto_716905 ) ) ( not ( = ?auto_716896 ?auto_716906 ) ) ( not ( = ?auto_716896 ?auto_716907 ) ) ( not ( = ?auto_716897 ?auto_716898 ) ) ( not ( = ?auto_716897 ?auto_716899 ) ) ( not ( = ?auto_716897 ?auto_716900 ) ) ( not ( = ?auto_716897 ?auto_716901 ) ) ( not ( = ?auto_716897 ?auto_716902 ) ) ( not ( = ?auto_716897 ?auto_716903 ) ) ( not ( = ?auto_716897 ?auto_716904 ) ) ( not ( = ?auto_716897 ?auto_716905 ) ) ( not ( = ?auto_716897 ?auto_716906 ) ) ( not ( = ?auto_716897 ?auto_716907 ) ) ( not ( = ?auto_716898 ?auto_716899 ) ) ( not ( = ?auto_716898 ?auto_716900 ) ) ( not ( = ?auto_716898 ?auto_716901 ) ) ( not ( = ?auto_716898 ?auto_716902 ) ) ( not ( = ?auto_716898 ?auto_716903 ) ) ( not ( = ?auto_716898 ?auto_716904 ) ) ( not ( = ?auto_716898 ?auto_716905 ) ) ( not ( = ?auto_716898 ?auto_716906 ) ) ( not ( = ?auto_716898 ?auto_716907 ) ) ( not ( = ?auto_716899 ?auto_716900 ) ) ( not ( = ?auto_716899 ?auto_716901 ) ) ( not ( = ?auto_716899 ?auto_716902 ) ) ( not ( = ?auto_716899 ?auto_716903 ) ) ( not ( = ?auto_716899 ?auto_716904 ) ) ( not ( = ?auto_716899 ?auto_716905 ) ) ( not ( = ?auto_716899 ?auto_716906 ) ) ( not ( = ?auto_716899 ?auto_716907 ) ) ( not ( = ?auto_716900 ?auto_716901 ) ) ( not ( = ?auto_716900 ?auto_716902 ) ) ( not ( = ?auto_716900 ?auto_716903 ) ) ( not ( = ?auto_716900 ?auto_716904 ) ) ( not ( = ?auto_716900 ?auto_716905 ) ) ( not ( = ?auto_716900 ?auto_716906 ) ) ( not ( = ?auto_716900 ?auto_716907 ) ) ( not ( = ?auto_716901 ?auto_716902 ) ) ( not ( = ?auto_716901 ?auto_716903 ) ) ( not ( = ?auto_716901 ?auto_716904 ) ) ( not ( = ?auto_716901 ?auto_716905 ) ) ( not ( = ?auto_716901 ?auto_716906 ) ) ( not ( = ?auto_716901 ?auto_716907 ) ) ( not ( = ?auto_716902 ?auto_716903 ) ) ( not ( = ?auto_716902 ?auto_716904 ) ) ( not ( = ?auto_716902 ?auto_716905 ) ) ( not ( = ?auto_716902 ?auto_716906 ) ) ( not ( = ?auto_716902 ?auto_716907 ) ) ( not ( = ?auto_716903 ?auto_716904 ) ) ( not ( = ?auto_716903 ?auto_716905 ) ) ( not ( = ?auto_716903 ?auto_716906 ) ) ( not ( = ?auto_716903 ?auto_716907 ) ) ( not ( = ?auto_716904 ?auto_716905 ) ) ( not ( = ?auto_716904 ?auto_716906 ) ) ( not ( = ?auto_716904 ?auto_716907 ) ) ( not ( = ?auto_716905 ?auto_716906 ) ) ( not ( = ?auto_716905 ?auto_716907 ) ) ( not ( = ?auto_716906 ?auto_716907 ) ) ( ON ?auto_716906 ?auto_716907 ) ( ON ?auto_716905 ?auto_716906 ) ( ON ?auto_716904 ?auto_716905 ) ( ON ?auto_716903 ?auto_716904 ) ( ON ?auto_716902 ?auto_716903 ) ( ON ?auto_716901 ?auto_716902 ) ( ON ?auto_716900 ?auto_716901 ) ( ON ?auto_716899 ?auto_716900 ) ( ON ?auto_716898 ?auto_716899 ) ( ON ?auto_716897 ?auto_716898 ) ( CLEAR ?auto_716895 ) ( ON ?auto_716896 ?auto_716897 ) ( CLEAR ?auto_716896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_716891 ?auto_716892 ?auto_716893 ?auto_716894 ?auto_716895 ?auto_716896 )
      ( MAKE-17PILE ?auto_716891 ?auto_716892 ?auto_716893 ?auto_716894 ?auto_716895 ?auto_716896 ?auto_716897 ?auto_716898 ?auto_716899 ?auto_716900 ?auto_716901 ?auto_716902 ?auto_716903 ?auto_716904 ?auto_716905 ?auto_716906 ?auto_716907 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716925 - BLOCK
      ?auto_716926 - BLOCK
      ?auto_716927 - BLOCK
      ?auto_716928 - BLOCK
      ?auto_716929 - BLOCK
      ?auto_716930 - BLOCK
      ?auto_716931 - BLOCK
      ?auto_716932 - BLOCK
      ?auto_716933 - BLOCK
      ?auto_716934 - BLOCK
      ?auto_716935 - BLOCK
      ?auto_716936 - BLOCK
      ?auto_716937 - BLOCK
      ?auto_716938 - BLOCK
      ?auto_716939 - BLOCK
      ?auto_716940 - BLOCK
      ?auto_716941 - BLOCK
    )
    :vars
    (
      ?auto_716942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_716941 ?auto_716942 ) ( ON-TABLE ?auto_716925 ) ( ON ?auto_716926 ?auto_716925 ) ( ON ?auto_716927 ?auto_716926 ) ( ON ?auto_716928 ?auto_716927 ) ( not ( = ?auto_716925 ?auto_716926 ) ) ( not ( = ?auto_716925 ?auto_716927 ) ) ( not ( = ?auto_716925 ?auto_716928 ) ) ( not ( = ?auto_716925 ?auto_716929 ) ) ( not ( = ?auto_716925 ?auto_716930 ) ) ( not ( = ?auto_716925 ?auto_716931 ) ) ( not ( = ?auto_716925 ?auto_716932 ) ) ( not ( = ?auto_716925 ?auto_716933 ) ) ( not ( = ?auto_716925 ?auto_716934 ) ) ( not ( = ?auto_716925 ?auto_716935 ) ) ( not ( = ?auto_716925 ?auto_716936 ) ) ( not ( = ?auto_716925 ?auto_716937 ) ) ( not ( = ?auto_716925 ?auto_716938 ) ) ( not ( = ?auto_716925 ?auto_716939 ) ) ( not ( = ?auto_716925 ?auto_716940 ) ) ( not ( = ?auto_716925 ?auto_716941 ) ) ( not ( = ?auto_716925 ?auto_716942 ) ) ( not ( = ?auto_716926 ?auto_716927 ) ) ( not ( = ?auto_716926 ?auto_716928 ) ) ( not ( = ?auto_716926 ?auto_716929 ) ) ( not ( = ?auto_716926 ?auto_716930 ) ) ( not ( = ?auto_716926 ?auto_716931 ) ) ( not ( = ?auto_716926 ?auto_716932 ) ) ( not ( = ?auto_716926 ?auto_716933 ) ) ( not ( = ?auto_716926 ?auto_716934 ) ) ( not ( = ?auto_716926 ?auto_716935 ) ) ( not ( = ?auto_716926 ?auto_716936 ) ) ( not ( = ?auto_716926 ?auto_716937 ) ) ( not ( = ?auto_716926 ?auto_716938 ) ) ( not ( = ?auto_716926 ?auto_716939 ) ) ( not ( = ?auto_716926 ?auto_716940 ) ) ( not ( = ?auto_716926 ?auto_716941 ) ) ( not ( = ?auto_716926 ?auto_716942 ) ) ( not ( = ?auto_716927 ?auto_716928 ) ) ( not ( = ?auto_716927 ?auto_716929 ) ) ( not ( = ?auto_716927 ?auto_716930 ) ) ( not ( = ?auto_716927 ?auto_716931 ) ) ( not ( = ?auto_716927 ?auto_716932 ) ) ( not ( = ?auto_716927 ?auto_716933 ) ) ( not ( = ?auto_716927 ?auto_716934 ) ) ( not ( = ?auto_716927 ?auto_716935 ) ) ( not ( = ?auto_716927 ?auto_716936 ) ) ( not ( = ?auto_716927 ?auto_716937 ) ) ( not ( = ?auto_716927 ?auto_716938 ) ) ( not ( = ?auto_716927 ?auto_716939 ) ) ( not ( = ?auto_716927 ?auto_716940 ) ) ( not ( = ?auto_716927 ?auto_716941 ) ) ( not ( = ?auto_716927 ?auto_716942 ) ) ( not ( = ?auto_716928 ?auto_716929 ) ) ( not ( = ?auto_716928 ?auto_716930 ) ) ( not ( = ?auto_716928 ?auto_716931 ) ) ( not ( = ?auto_716928 ?auto_716932 ) ) ( not ( = ?auto_716928 ?auto_716933 ) ) ( not ( = ?auto_716928 ?auto_716934 ) ) ( not ( = ?auto_716928 ?auto_716935 ) ) ( not ( = ?auto_716928 ?auto_716936 ) ) ( not ( = ?auto_716928 ?auto_716937 ) ) ( not ( = ?auto_716928 ?auto_716938 ) ) ( not ( = ?auto_716928 ?auto_716939 ) ) ( not ( = ?auto_716928 ?auto_716940 ) ) ( not ( = ?auto_716928 ?auto_716941 ) ) ( not ( = ?auto_716928 ?auto_716942 ) ) ( not ( = ?auto_716929 ?auto_716930 ) ) ( not ( = ?auto_716929 ?auto_716931 ) ) ( not ( = ?auto_716929 ?auto_716932 ) ) ( not ( = ?auto_716929 ?auto_716933 ) ) ( not ( = ?auto_716929 ?auto_716934 ) ) ( not ( = ?auto_716929 ?auto_716935 ) ) ( not ( = ?auto_716929 ?auto_716936 ) ) ( not ( = ?auto_716929 ?auto_716937 ) ) ( not ( = ?auto_716929 ?auto_716938 ) ) ( not ( = ?auto_716929 ?auto_716939 ) ) ( not ( = ?auto_716929 ?auto_716940 ) ) ( not ( = ?auto_716929 ?auto_716941 ) ) ( not ( = ?auto_716929 ?auto_716942 ) ) ( not ( = ?auto_716930 ?auto_716931 ) ) ( not ( = ?auto_716930 ?auto_716932 ) ) ( not ( = ?auto_716930 ?auto_716933 ) ) ( not ( = ?auto_716930 ?auto_716934 ) ) ( not ( = ?auto_716930 ?auto_716935 ) ) ( not ( = ?auto_716930 ?auto_716936 ) ) ( not ( = ?auto_716930 ?auto_716937 ) ) ( not ( = ?auto_716930 ?auto_716938 ) ) ( not ( = ?auto_716930 ?auto_716939 ) ) ( not ( = ?auto_716930 ?auto_716940 ) ) ( not ( = ?auto_716930 ?auto_716941 ) ) ( not ( = ?auto_716930 ?auto_716942 ) ) ( not ( = ?auto_716931 ?auto_716932 ) ) ( not ( = ?auto_716931 ?auto_716933 ) ) ( not ( = ?auto_716931 ?auto_716934 ) ) ( not ( = ?auto_716931 ?auto_716935 ) ) ( not ( = ?auto_716931 ?auto_716936 ) ) ( not ( = ?auto_716931 ?auto_716937 ) ) ( not ( = ?auto_716931 ?auto_716938 ) ) ( not ( = ?auto_716931 ?auto_716939 ) ) ( not ( = ?auto_716931 ?auto_716940 ) ) ( not ( = ?auto_716931 ?auto_716941 ) ) ( not ( = ?auto_716931 ?auto_716942 ) ) ( not ( = ?auto_716932 ?auto_716933 ) ) ( not ( = ?auto_716932 ?auto_716934 ) ) ( not ( = ?auto_716932 ?auto_716935 ) ) ( not ( = ?auto_716932 ?auto_716936 ) ) ( not ( = ?auto_716932 ?auto_716937 ) ) ( not ( = ?auto_716932 ?auto_716938 ) ) ( not ( = ?auto_716932 ?auto_716939 ) ) ( not ( = ?auto_716932 ?auto_716940 ) ) ( not ( = ?auto_716932 ?auto_716941 ) ) ( not ( = ?auto_716932 ?auto_716942 ) ) ( not ( = ?auto_716933 ?auto_716934 ) ) ( not ( = ?auto_716933 ?auto_716935 ) ) ( not ( = ?auto_716933 ?auto_716936 ) ) ( not ( = ?auto_716933 ?auto_716937 ) ) ( not ( = ?auto_716933 ?auto_716938 ) ) ( not ( = ?auto_716933 ?auto_716939 ) ) ( not ( = ?auto_716933 ?auto_716940 ) ) ( not ( = ?auto_716933 ?auto_716941 ) ) ( not ( = ?auto_716933 ?auto_716942 ) ) ( not ( = ?auto_716934 ?auto_716935 ) ) ( not ( = ?auto_716934 ?auto_716936 ) ) ( not ( = ?auto_716934 ?auto_716937 ) ) ( not ( = ?auto_716934 ?auto_716938 ) ) ( not ( = ?auto_716934 ?auto_716939 ) ) ( not ( = ?auto_716934 ?auto_716940 ) ) ( not ( = ?auto_716934 ?auto_716941 ) ) ( not ( = ?auto_716934 ?auto_716942 ) ) ( not ( = ?auto_716935 ?auto_716936 ) ) ( not ( = ?auto_716935 ?auto_716937 ) ) ( not ( = ?auto_716935 ?auto_716938 ) ) ( not ( = ?auto_716935 ?auto_716939 ) ) ( not ( = ?auto_716935 ?auto_716940 ) ) ( not ( = ?auto_716935 ?auto_716941 ) ) ( not ( = ?auto_716935 ?auto_716942 ) ) ( not ( = ?auto_716936 ?auto_716937 ) ) ( not ( = ?auto_716936 ?auto_716938 ) ) ( not ( = ?auto_716936 ?auto_716939 ) ) ( not ( = ?auto_716936 ?auto_716940 ) ) ( not ( = ?auto_716936 ?auto_716941 ) ) ( not ( = ?auto_716936 ?auto_716942 ) ) ( not ( = ?auto_716937 ?auto_716938 ) ) ( not ( = ?auto_716937 ?auto_716939 ) ) ( not ( = ?auto_716937 ?auto_716940 ) ) ( not ( = ?auto_716937 ?auto_716941 ) ) ( not ( = ?auto_716937 ?auto_716942 ) ) ( not ( = ?auto_716938 ?auto_716939 ) ) ( not ( = ?auto_716938 ?auto_716940 ) ) ( not ( = ?auto_716938 ?auto_716941 ) ) ( not ( = ?auto_716938 ?auto_716942 ) ) ( not ( = ?auto_716939 ?auto_716940 ) ) ( not ( = ?auto_716939 ?auto_716941 ) ) ( not ( = ?auto_716939 ?auto_716942 ) ) ( not ( = ?auto_716940 ?auto_716941 ) ) ( not ( = ?auto_716940 ?auto_716942 ) ) ( not ( = ?auto_716941 ?auto_716942 ) ) ( ON ?auto_716940 ?auto_716941 ) ( ON ?auto_716939 ?auto_716940 ) ( ON ?auto_716938 ?auto_716939 ) ( ON ?auto_716937 ?auto_716938 ) ( ON ?auto_716936 ?auto_716937 ) ( ON ?auto_716935 ?auto_716936 ) ( ON ?auto_716934 ?auto_716935 ) ( ON ?auto_716933 ?auto_716934 ) ( ON ?auto_716932 ?auto_716933 ) ( ON ?auto_716931 ?auto_716932 ) ( ON ?auto_716930 ?auto_716931 ) ( CLEAR ?auto_716928 ) ( ON ?auto_716929 ?auto_716930 ) ( CLEAR ?auto_716929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_716925 ?auto_716926 ?auto_716927 ?auto_716928 ?auto_716929 )
      ( MAKE-17PILE ?auto_716925 ?auto_716926 ?auto_716927 ?auto_716928 ?auto_716929 ?auto_716930 ?auto_716931 ?auto_716932 ?auto_716933 ?auto_716934 ?auto_716935 ?auto_716936 ?auto_716937 ?auto_716938 ?auto_716939 ?auto_716940 ?auto_716941 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716960 - BLOCK
      ?auto_716961 - BLOCK
      ?auto_716962 - BLOCK
      ?auto_716963 - BLOCK
      ?auto_716964 - BLOCK
      ?auto_716965 - BLOCK
      ?auto_716966 - BLOCK
      ?auto_716967 - BLOCK
      ?auto_716968 - BLOCK
      ?auto_716969 - BLOCK
      ?auto_716970 - BLOCK
      ?auto_716971 - BLOCK
      ?auto_716972 - BLOCK
      ?auto_716973 - BLOCK
      ?auto_716974 - BLOCK
      ?auto_716975 - BLOCK
      ?auto_716976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_716976 ) ( ON-TABLE ?auto_716960 ) ( ON ?auto_716961 ?auto_716960 ) ( ON ?auto_716962 ?auto_716961 ) ( ON ?auto_716963 ?auto_716962 ) ( not ( = ?auto_716960 ?auto_716961 ) ) ( not ( = ?auto_716960 ?auto_716962 ) ) ( not ( = ?auto_716960 ?auto_716963 ) ) ( not ( = ?auto_716960 ?auto_716964 ) ) ( not ( = ?auto_716960 ?auto_716965 ) ) ( not ( = ?auto_716960 ?auto_716966 ) ) ( not ( = ?auto_716960 ?auto_716967 ) ) ( not ( = ?auto_716960 ?auto_716968 ) ) ( not ( = ?auto_716960 ?auto_716969 ) ) ( not ( = ?auto_716960 ?auto_716970 ) ) ( not ( = ?auto_716960 ?auto_716971 ) ) ( not ( = ?auto_716960 ?auto_716972 ) ) ( not ( = ?auto_716960 ?auto_716973 ) ) ( not ( = ?auto_716960 ?auto_716974 ) ) ( not ( = ?auto_716960 ?auto_716975 ) ) ( not ( = ?auto_716960 ?auto_716976 ) ) ( not ( = ?auto_716961 ?auto_716962 ) ) ( not ( = ?auto_716961 ?auto_716963 ) ) ( not ( = ?auto_716961 ?auto_716964 ) ) ( not ( = ?auto_716961 ?auto_716965 ) ) ( not ( = ?auto_716961 ?auto_716966 ) ) ( not ( = ?auto_716961 ?auto_716967 ) ) ( not ( = ?auto_716961 ?auto_716968 ) ) ( not ( = ?auto_716961 ?auto_716969 ) ) ( not ( = ?auto_716961 ?auto_716970 ) ) ( not ( = ?auto_716961 ?auto_716971 ) ) ( not ( = ?auto_716961 ?auto_716972 ) ) ( not ( = ?auto_716961 ?auto_716973 ) ) ( not ( = ?auto_716961 ?auto_716974 ) ) ( not ( = ?auto_716961 ?auto_716975 ) ) ( not ( = ?auto_716961 ?auto_716976 ) ) ( not ( = ?auto_716962 ?auto_716963 ) ) ( not ( = ?auto_716962 ?auto_716964 ) ) ( not ( = ?auto_716962 ?auto_716965 ) ) ( not ( = ?auto_716962 ?auto_716966 ) ) ( not ( = ?auto_716962 ?auto_716967 ) ) ( not ( = ?auto_716962 ?auto_716968 ) ) ( not ( = ?auto_716962 ?auto_716969 ) ) ( not ( = ?auto_716962 ?auto_716970 ) ) ( not ( = ?auto_716962 ?auto_716971 ) ) ( not ( = ?auto_716962 ?auto_716972 ) ) ( not ( = ?auto_716962 ?auto_716973 ) ) ( not ( = ?auto_716962 ?auto_716974 ) ) ( not ( = ?auto_716962 ?auto_716975 ) ) ( not ( = ?auto_716962 ?auto_716976 ) ) ( not ( = ?auto_716963 ?auto_716964 ) ) ( not ( = ?auto_716963 ?auto_716965 ) ) ( not ( = ?auto_716963 ?auto_716966 ) ) ( not ( = ?auto_716963 ?auto_716967 ) ) ( not ( = ?auto_716963 ?auto_716968 ) ) ( not ( = ?auto_716963 ?auto_716969 ) ) ( not ( = ?auto_716963 ?auto_716970 ) ) ( not ( = ?auto_716963 ?auto_716971 ) ) ( not ( = ?auto_716963 ?auto_716972 ) ) ( not ( = ?auto_716963 ?auto_716973 ) ) ( not ( = ?auto_716963 ?auto_716974 ) ) ( not ( = ?auto_716963 ?auto_716975 ) ) ( not ( = ?auto_716963 ?auto_716976 ) ) ( not ( = ?auto_716964 ?auto_716965 ) ) ( not ( = ?auto_716964 ?auto_716966 ) ) ( not ( = ?auto_716964 ?auto_716967 ) ) ( not ( = ?auto_716964 ?auto_716968 ) ) ( not ( = ?auto_716964 ?auto_716969 ) ) ( not ( = ?auto_716964 ?auto_716970 ) ) ( not ( = ?auto_716964 ?auto_716971 ) ) ( not ( = ?auto_716964 ?auto_716972 ) ) ( not ( = ?auto_716964 ?auto_716973 ) ) ( not ( = ?auto_716964 ?auto_716974 ) ) ( not ( = ?auto_716964 ?auto_716975 ) ) ( not ( = ?auto_716964 ?auto_716976 ) ) ( not ( = ?auto_716965 ?auto_716966 ) ) ( not ( = ?auto_716965 ?auto_716967 ) ) ( not ( = ?auto_716965 ?auto_716968 ) ) ( not ( = ?auto_716965 ?auto_716969 ) ) ( not ( = ?auto_716965 ?auto_716970 ) ) ( not ( = ?auto_716965 ?auto_716971 ) ) ( not ( = ?auto_716965 ?auto_716972 ) ) ( not ( = ?auto_716965 ?auto_716973 ) ) ( not ( = ?auto_716965 ?auto_716974 ) ) ( not ( = ?auto_716965 ?auto_716975 ) ) ( not ( = ?auto_716965 ?auto_716976 ) ) ( not ( = ?auto_716966 ?auto_716967 ) ) ( not ( = ?auto_716966 ?auto_716968 ) ) ( not ( = ?auto_716966 ?auto_716969 ) ) ( not ( = ?auto_716966 ?auto_716970 ) ) ( not ( = ?auto_716966 ?auto_716971 ) ) ( not ( = ?auto_716966 ?auto_716972 ) ) ( not ( = ?auto_716966 ?auto_716973 ) ) ( not ( = ?auto_716966 ?auto_716974 ) ) ( not ( = ?auto_716966 ?auto_716975 ) ) ( not ( = ?auto_716966 ?auto_716976 ) ) ( not ( = ?auto_716967 ?auto_716968 ) ) ( not ( = ?auto_716967 ?auto_716969 ) ) ( not ( = ?auto_716967 ?auto_716970 ) ) ( not ( = ?auto_716967 ?auto_716971 ) ) ( not ( = ?auto_716967 ?auto_716972 ) ) ( not ( = ?auto_716967 ?auto_716973 ) ) ( not ( = ?auto_716967 ?auto_716974 ) ) ( not ( = ?auto_716967 ?auto_716975 ) ) ( not ( = ?auto_716967 ?auto_716976 ) ) ( not ( = ?auto_716968 ?auto_716969 ) ) ( not ( = ?auto_716968 ?auto_716970 ) ) ( not ( = ?auto_716968 ?auto_716971 ) ) ( not ( = ?auto_716968 ?auto_716972 ) ) ( not ( = ?auto_716968 ?auto_716973 ) ) ( not ( = ?auto_716968 ?auto_716974 ) ) ( not ( = ?auto_716968 ?auto_716975 ) ) ( not ( = ?auto_716968 ?auto_716976 ) ) ( not ( = ?auto_716969 ?auto_716970 ) ) ( not ( = ?auto_716969 ?auto_716971 ) ) ( not ( = ?auto_716969 ?auto_716972 ) ) ( not ( = ?auto_716969 ?auto_716973 ) ) ( not ( = ?auto_716969 ?auto_716974 ) ) ( not ( = ?auto_716969 ?auto_716975 ) ) ( not ( = ?auto_716969 ?auto_716976 ) ) ( not ( = ?auto_716970 ?auto_716971 ) ) ( not ( = ?auto_716970 ?auto_716972 ) ) ( not ( = ?auto_716970 ?auto_716973 ) ) ( not ( = ?auto_716970 ?auto_716974 ) ) ( not ( = ?auto_716970 ?auto_716975 ) ) ( not ( = ?auto_716970 ?auto_716976 ) ) ( not ( = ?auto_716971 ?auto_716972 ) ) ( not ( = ?auto_716971 ?auto_716973 ) ) ( not ( = ?auto_716971 ?auto_716974 ) ) ( not ( = ?auto_716971 ?auto_716975 ) ) ( not ( = ?auto_716971 ?auto_716976 ) ) ( not ( = ?auto_716972 ?auto_716973 ) ) ( not ( = ?auto_716972 ?auto_716974 ) ) ( not ( = ?auto_716972 ?auto_716975 ) ) ( not ( = ?auto_716972 ?auto_716976 ) ) ( not ( = ?auto_716973 ?auto_716974 ) ) ( not ( = ?auto_716973 ?auto_716975 ) ) ( not ( = ?auto_716973 ?auto_716976 ) ) ( not ( = ?auto_716974 ?auto_716975 ) ) ( not ( = ?auto_716974 ?auto_716976 ) ) ( not ( = ?auto_716975 ?auto_716976 ) ) ( ON ?auto_716975 ?auto_716976 ) ( ON ?auto_716974 ?auto_716975 ) ( ON ?auto_716973 ?auto_716974 ) ( ON ?auto_716972 ?auto_716973 ) ( ON ?auto_716971 ?auto_716972 ) ( ON ?auto_716970 ?auto_716971 ) ( ON ?auto_716969 ?auto_716970 ) ( ON ?auto_716968 ?auto_716969 ) ( ON ?auto_716967 ?auto_716968 ) ( ON ?auto_716966 ?auto_716967 ) ( ON ?auto_716965 ?auto_716966 ) ( CLEAR ?auto_716963 ) ( ON ?auto_716964 ?auto_716965 ) ( CLEAR ?auto_716964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_716960 ?auto_716961 ?auto_716962 ?auto_716963 ?auto_716964 )
      ( MAKE-17PILE ?auto_716960 ?auto_716961 ?auto_716962 ?auto_716963 ?auto_716964 ?auto_716965 ?auto_716966 ?auto_716967 ?auto_716968 ?auto_716969 ?auto_716970 ?auto_716971 ?auto_716972 ?auto_716973 ?auto_716974 ?auto_716975 ?auto_716976 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_716994 - BLOCK
      ?auto_716995 - BLOCK
      ?auto_716996 - BLOCK
      ?auto_716997 - BLOCK
      ?auto_716998 - BLOCK
      ?auto_716999 - BLOCK
      ?auto_717000 - BLOCK
      ?auto_717001 - BLOCK
      ?auto_717002 - BLOCK
      ?auto_717003 - BLOCK
      ?auto_717004 - BLOCK
      ?auto_717005 - BLOCK
      ?auto_717006 - BLOCK
      ?auto_717007 - BLOCK
      ?auto_717008 - BLOCK
      ?auto_717009 - BLOCK
      ?auto_717010 - BLOCK
    )
    :vars
    (
      ?auto_717011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717010 ?auto_717011 ) ( ON-TABLE ?auto_716994 ) ( ON ?auto_716995 ?auto_716994 ) ( ON ?auto_716996 ?auto_716995 ) ( not ( = ?auto_716994 ?auto_716995 ) ) ( not ( = ?auto_716994 ?auto_716996 ) ) ( not ( = ?auto_716994 ?auto_716997 ) ) ( not ( = ?auto_716994 ?auto_716998 ) ) ( not ( = ?auto_716994 ?auto_716999 ) ) ( not ( = ?auto_716994 ?auto_717000 ) ) ( not ( = ?auto_716994 ?auto_717001 ) ) ( not ( = ?auto_716994 ?auto_717002 ) ) ( not ( = ?auto_716994 ?auto_717003 ) ) ( not ( = ?auto_716994 ?auto_717004 ) ) ( not ( = ?auto_716994 ?auto_717005 ) ) ( not ( = ?auto_716994 ?auto_717006 ) ) ( not ( = ?auto_716994 ?auto_717007 ) ) ( not ( = ?auto_716994 ?auto_717008 ) ) ( not ( = ?auto_716994 ?auto_717009 ) ) ( not ( = ?auto_716994 ?auto_717010 ) ) ( not ( = ?auto_716994 ?auto_717011 ) ) ( not ( = ?auto_716995 ?auto_716996 ) ) ( not ( = ?auto_716995 ?auto_716997 ) ) ( not ( = ?auto_716995 ?auto_716998 ) ) ( not ( = ?auto_716995 ?auto_716999 ) ) ( not ( = ?auto_716995 ?auto_717000 ) ) ( not ( = ?auto_716995 ?auto_717001 ) ) ( not ( = ?auto_716995 ?auto_717002 ) ) ( not ( = ?auto_716995 ?auto_717003 ) ) ( not ( = ?auto_716995 ?auto_717004 ) ) ( not ( = ?auto_716995 ?auto_717005 ) ) ( not ( = ?auto_716995 ?auto_717006 ) ) ( not ( = ?auto_716995 ?auto_717007 ) ) ( not ( = ?auto_716995 ?auto_717008 ) ) ( not ( = ?auto_716995 ?auto_717009 ) ) ( not ( = ?auto_716995 ?auto_717010 ) ) ( not ( = ?auto_716995 ?auto_717011 ) ) ( not ( = ?auto_716996 ?auto_716997 ) ) ( not ( = ?auto_716996 ?auto_716998 ) ) ( not ( = ?auto_716996 ?auto_716999 ) ) ( not ( = ?auto_716996 ?auto_717000 ) ) ( not ( = ?auto_716996 ?auto_717001 ) ) ( not ( = ?auto_716996 ?auto_717002 ) ) ( not ( = ?auto_716996 ?auto_717003 ) ) ( not ( = ?auto_716996 ?auto_717004 ) ) ( not ( = ?auto_716996 ?auto_717005 ) ) ( not ( = ?auto_716996 ?auto_717006 ) ) ( not ( = ?auto_716996 ?auto_717007 ) ) ( not ( = ?auto_716996 ?auto_717008 ) ) ( not ( = ?auto_716996 ?auto_717009 ) ) ( not ( = ?auto_716996 ?auto_717010 ) ) ( not ( = ?auto_716996 ?auto_717011 ) ) ( not ( = ?auto_716997 ?auto_716998 ) ) ( not ( = ?auto_716997 ?auto_716999 ) ) ( not ( = ?auto_716997 ?auto_717000 ) ) ( not ( = ?auto_716997 ?auto_717001 ) ) ( not ( = ?auto_716997 ?auto_717002 ) ) ( not ( = ?auto_716997 ?auto_717003 ) ) ( not ( = ?auto_716997 ?auto_717004 ) ) ( not ( = ?auto_716997 ?auto_717005 ) ) ( not ( = ?auto_716997 ?auto_717006 ) ) ( not ( = ?auto_716997 ?auto_717007 ) ) ( not ( = ?auto_716997 ?auto_717008 ) ) ( not ( = ?auto_716997 ?auto_717009 ) ) ( not ( = ?auto_716997 ?auto_717010 ) ) ( not ( = ?auto_716997 ?auto_717011 ) ) ( not ( = ?auto_716998 ?auto_716999 ) ) ( not ( = ?auto_716998 ?auto_717000 ) ) ( not ( = ?auto_716998 ?auto_717001 ) ) ( not ( = ?auto_716998 ?auto_717002 ) ) ( not ( = ?auto_716998 ?auto_717003 ) ) ( not ( = ?auto_716998 ?auto_717004 ) ) ( not ( = ?auto_716998 ?auto_717005 ) ) ( not ( = ?auto_716998 ?auto_717006 ) ) ( not ( = ?auto_716998 ?auto_717007 ) ) ( not ( = ?auto_716998 ?auto_717008 ) ) ( not ( = ?auto_716998 ?auto_717009 ) ) ( not ( = ?auto_716998 ?auto_717010 ) ) ( not ( = ?auto_716998 ?auto_717011 ) ) ( not ( = ?auto_716999 ?auto_717000 ) ) ( not ( = ?auto_716999 ?auto_717001 ) ) ( not ( = ?auto_716999 ?auto_717002 ) ) ( not ( = ?auto_716999 ?auto_717003 ) ) ( not ( = ?auto_716999 ?auto_717004 ) ) ( not ( = ?auto_716999 ?auto_717005 ) ) ( not ( = ?auto_716999 ?auto_717006 ) ) ( not ( = ?auto_716999 ?auto_717007 ) ) ( not ( = ?auto_716999 ?auto_717008 ) ) ( not ( = ?auto_716999 ?auto_717009 ) ) ( not ( = ?auto_716999 ?auto_717010 ) ) ( not ( = ?auto_716999 ?auto_717011 ) ) ( not ( = ?auto_717000 ?auto_717001 ) ) ( not ( = ?auto_717000 ?auto_717002 ) ) ( not ( = ?auto_717000 ?auto_717003 ) ) ( not ( = ?auto_717000 ?auto_717004 ) ) ( not ( = ?auto_717000 ?auto_717005 ) ) ( not ( = ?auto_717000 ?auto_717006 ) ) ( not ( = ?auto_717000 ?auto_717007 ) ) ( not ( = ?auto_717000 ?auto_717008 ) ) ( not ( = ?auto_717000 ?auto_717009 ) ) ( not ( = ?auto_717000 ?auto_717010 ) ) ( not ( = ?auto_717000 ?auto_717011 ) ) ( not ( = ?auto_717001 ?auto_717002 ) ) ( not ( = ?auto_717001 ?auto_717003 ) ) ( not ( = ?auto_717001 ?auto_717004 ) ) ( not ( = ?auto_717001 ?auto_717005 ) ) ( not ( = ?auto_717001 ?auto_717006 ) ) ( not ( = ?auto_717001 ?auto_717007 ) ) ( not ( = ?auto_717001 ?auto_717008 ) ) ( not ( = ?auto_717001 ?auto_717009 ) ) ( not ( = ?auto_717001 ?auto_717010 ) ) ( not ( = ?auto_717001 ?auto_717011 ) ) ( not ( = ?auto_717002 ?auto_717003 ) ) ( not ( = ?auto_717002 ?auto_717004 ) ) ( not ( = ?auto_717002 ?auto_717005 ) ) ( not ( = ?auto_717002 ?auto_717006 ) ) ( not ( = ?auto_717002 ?auto_717007 ) ) ( not ( = ?auto_717002 ?auto_717008 ) ) ( not ( = ?auto_717002 ?auto_717009 ) ) ( not ( = ?auto_717002 ?auto_717010 ) ) ( not ( = ?auto_717002 ?auto_717011 ) ) ( not ( = ?auto_717003 ?auto_717004 ) ) ( not ( = ?auto_717003 ?auto_717005 ) ) ( not ( = ?auto_717003 ?auto_717006 ) ) ( not ( = ?auto_717003 ?auto_717007 ) ) ( not ( = ?auto_717003 ?auto_717008 ) ) ( not ( = ?auto_717003 ?auto_717009 ) ) ( not ( = ?auto_717003 ?auto_717010 ) ) ( not ( = ?auto_717003 ?auto_717011 ) ) ( not ( = ?auto_717004 ?auto_717005 ) ) ( not ( = ?auto_717004 ?auto_717006 ) ) ( not ( = ?auto_717004 ?auto_717007 ) ) ( not ( = ?auto_717004 ?auto_717008 ) ) ( not ( = ?auto_717004 ?auto_717009 ) ) ( not ( = ?auto_717004 ?auto_717010 ) ) ( not ( = ?auto_717004 ?auto_717011 ) ) ( not ( = ?auto_717005 ?auto_717006 ) ) ( not ( = ?auto_717005 ?auto_717007 ) ) ( not ( = ?auto_717005 ?auto_717008 ) ) ( not ( = ?auto_717005 ?auto_717009 ) ) ( not ( = ?auto_717005 ?auto_717010 ) ) ( not ( = ?auto_717005 ?auto_717011 ) ) ( not ( = ?auto_717006 ?auto_717007 ) ) ( not ( = ?auto_717006 ?auto_717008 ) ) ( not ( = ?auto_717006 ?auto_717009 ) ) ( not ( = ?auto_717006 ?auto_717010 ) ) ( not ( = ?auto_717006 ?auto_717011 ) ) ( not ( = ?auto_717007 ?auto_717008 ) ) ( not ( = ?auto_717007 ?auto_717009 ) ) ( not ( = ?auto_717007 ?auto_717010 ) ) ( not ( = ?auto_717007 ?auto_717011 ) ) ( not ( = ?auto_717008 ?auto_717009 ) ) ( not ( = ?auto_717008 ?auto_717010 ) ) ( not ( = ?auto_717008 ?auto_717011 ) ) ( not ( = ?auto_717009 ?auto_717010 ) ) ( not ( = ?auto_717009 ?auto_717011 ) ) ( not ( = ?auto_717010 ?auto_717011 ) ) ( ON ?auto_717009 ?auto_717010 ) ( ON ?auto_717008 ?auto_717009 ) ( ON ?auto_717007 ?auto_717008 ) ( ON ?auto_717006 ?auto_717007 ) ( ON ?auto_717005 ?auto_717006 ) ( ON ?auto_717004 ?auto_717005 ) ( ON ?auto_717003 ?auto_717004 ) ( ON ?auto_717002 ?auto_717003 ) ( ON ?auto_717001 ?auto_717002 ) ( ON ?auto_717000 ?auto_717001 ) ( ON ?auto_716999 ?auto_717000 ) ( ON ?auto_716998 ?auto_716999 ) ( CLEAR ?auto_716996 ) ( ON ?auto_716997 ?auto_716998 ) ( CLEAR ?auto_716997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_716994 ?auto_716995 ?auto_716996 ?auto_716997 )
      ( MAKE-17PILE ?auto_716994 ?auto_716995 ?auto_716996 ?auto_716997 ?auto_716998 ?auto_716999 ?auto_717000 ?auto_717001 ?auto_717002 ?auto_717003 ?auto_717004 ?auto_717005 ?auto_717006 ?auto_717007 ?auto_717008 ?auto_717009 ?auto_717010 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717029 - BLOCK
      ?auto_717030 - BLOCK
      ?auto_717031 - BLOCK
      ?auto_717032 - BLOCK
      ?auto_717033 - BLOCK
      ?auto_717034 - BLOCK
      ?auto_717035 - BLOCK
      ?auto_717036 - BLOCK
      ?auto_717037 - BLOCK
      ?auto_717038 - BLOCK
      ?auto_717039 - BLOCK
      ?auto_717040 - BLOCK
      ?auto_717041 - BLOCK
      ?auto_717042 - BLOCK
      ?auto_717043 - BLOCK
      ?auto_717044 - BLOCK
      ?auto_717045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_717045 ) ( ON-TABLE ?auto_717029 ) ( ON ?auto_717030 ?auto_717029 ) ( ON ?auto_717031 ?auto_717030 ) ( not ( = ?auto_717029 ?auto_717030 ) ) ( not ( = ?auto_717029 ?auto_717031 ) ) ( not ( = ?auto_717029 ?auto_717032 ) ) ( not ( = ?auto_717029 ?auto_717033 ) ) ( not ( = ?auto_717029 ?auto_717034 ) ) ( not ( = ?auto_717029 ?auto_717035 ) ) ( not ( = ?auto_717029 ?auto_717036 ) ) ( not ( = ?auto_717029 ?auto_717037 ) ) ( not ( = ?auto_717029 ?auto_717038 ) ) ( not ( = ?auto_717029 ?auto_717039 ) ) ( not ( = ?auto_717029 ?auto_717040 ) ) ( not ( = ?auto_717029 ?auto_717041 ) ) ( not ( = ?auto_717029 ?auto_717042 ) ) ( not ( = ?auto_717029 ?auto_717043 ) ) ( not ( = ?auto_717029 ?auto_717044 ) ) ( not ( = ?auto_717029 ?auto_717045 ) ) ( not ( = ?auto_717030 ?auto_717031 ) ) ( not ( = ?auto_717030 ?auto_717032 ) ) ( not ( = ?auto_717030 ?auto_717033 ) ) ( not ( = ?auto_717030 ?auto_717034 ) ) ( not ( = ?auto_717030 ?auto_717035 ) ) ( not ( = ?auto_717030 ?auto_717036 ) ) ( not ( = ?auto_717030 ?auto_717037 ) ) ( not ( = ?auto_717030 ?auto_717038 ) ) ( not ( = ?auto_717030 ?auto_717039 ) ) ( not ( = ?auto_717030 ?auto_717040 ) ) ( not ( = ?auto_717030 ?auto_717041 ) ) ( not ( = ?auto_717030 ?auto_717042 ) ) ( not ( = ?auto_717030 ?auto_717043 ) ) ( not ( = ?auto_717030 ?auto_717044 ) ) ( not ( = ?auto_717030 ?auto_717045 ) ) ( not ( = ?auto_717031 ?auto_717032 ) ) ( not ( = ?auto_717031 ?auto_717033 ) ) ( not ( = ?auto_717031 ?auto_717034 ) ) ( not ( = ?auto_717031 ?auto_717035 ) ) ( not ( = ?auto_717031 ?auto_717036 ) ) ( not ( = ?auto_717031 ?auto_717037 ) ) ( not ( = ?auto_717031 ?auto_717038 ) ) ( not ( = ?auto_717031 ?auto_717039 ) ) ( not ( = ?auto_717031 ?auto_717040 ) ) ( not ( = ?auto_717031 ?auto_717041 ) ) ( not ( = ?auto_717031 ?auto_717042 ) ) ( not ( = ?auto_717031 ?auto_717043 ) ) ( not ( = ?auto_717031 ?auto_717044 ) ) ( not ( = ?auto_717031 ?auto_717045 ) ) ( not ( = ?auto_717032 ?auto_717033 ) ) ( not ( = ?auto_717032 ?auto_717034 ) ) ( not ( = ?auto_717032 ?auto_717035 ) ) ( not ( = ?auto_717032 ?auto_717036 ) ) ( not ( = ?auto_717032 ?auto_717037 ) ) ( not ( = ?auto_717032 ?auto_717038 ) ) ( not ( = ?auto_717032 ?auto_717039 ) ) ( not ( = ?auto_717032 ?auto_717040 ) ) ( not ( = ?auto_717032 ?auto_717041 ) ) ( not ( = ?auto_717032 ?auto_717042 ) ) ( not ( = ?auto_717032 ?auto_717043 ) ) ( not ( = ?auto_717032 ?auto_717044 ) ) ( not ( = ?auto_717032 ?auto_717045 ) ) ( not ( = ?auto_717033 ?auto_717034 ) ) ( not ( = ?auto_717033 ?auto_717035 ) ) ( not ( = ?auto_717033 ?auto_717036 ) ) ( not ( = ?auto_717033 ?auto_717037 ) ) ( not ( = ?auto_717033 ?auto_717038 ) ) ( not ( = ?auto_717033 ?auto_717039 ) ) ( not ( = ?auto_717033 ?auto_717040 ) ) ( not ( = ?auto_717033 ?auto_717041 ) ) ( not ( = ?auto_717033 ?auto_717042 ) ) ( not ( = ?auto_717033 ?auto_717043 ) ) ( not ( = ?auto_717033 ?auto_717044 ) ) ( not ( = ?auto_717033 ?auto_717045 ) ) ( not ( = ?auto_717034 ?auto_717035 ) ) ( not ( = ?auto_717034 ?auto_717036 ) ) ( not ( = ?auto_717034 ?auto_717037 ) ) ( not ( = ?auto_717034 ?auto_717038 ) ) ( not ( = ?auto_717034 ?auto_717039 ) ) ( not ( = ?auto_717034 ?auto_717040 ) ) ( not ( = ?auto_717034 ?auto_717041 ) ) ( not ( = ?auto_717034 ?auto_717042 ) ) ( not ( = ?auto_717034 ?auto_717043 ) ) ( not ( = ?auto_717034 ?auto_717044 ) ) ( not ( = ?auto_717034 ?auto_717045 ) ) ( not ( = ?auto_717035 ?auto_717036 ) ) ( not ( = ?auto_717035 ?auto_717037 ) ) ( not ( = ?auto_717035 ?auto_717038 ) ) ( not ( = ?auto_717035 ?auto_717039 ) ) ( not ( = ?auto_717035 ?auto_717040 ) ) ( not ( = ?auto_717035 ?auto_717041 ) ) ( not ( = ?auto_717035 ?auto_717042 ) ) ( not ( = ?auto_717035 ?auto_717043 ) ) ( not ( = ?auto_717035 ?auto_717044 ) ) ( not ( = ?auto_717035 ?auto_717045 ) ) ( not ( = ?auto_717036 ?auto_717037 ) ) ( not ( = ?auto_717036 ?auto_717038 ) ) ( not ( = ?auto_717036 ?auto_717039 ) ) ( not ( = ?auto_717036 ?auto_717040 ) ) ( not ( = ?auto_717036 ?auto_717041 ) ) ( not ( = ?auto_717036 ?auto_717042 ) ) ( not ( = ?auto_717036 ?auto_717043 ) ) ( not ( = ?auto_717036 ?auto_717044 ) ) ( not ( = ?auto_717036 ?auto_717045 ) ) ( not ( = ?auto_717037 ?auto_717038 ) ) ( not ( = ?auto_717037 ?auto_717039 ) ) ( not ( = ?auto_717037 ?auto_717040 ) ) ( not ( = ?auto_717037 ?auto_717041 ) ) ( not ( = ?auto_717037 ?auto_717042 ) ) ( not ( = ?auto_717037 ?auto_717043 ) ) ( not ( = ?auto_717037 ?auto_717044 ) ) ( not ( = ?auto_717037 ?auto_717045 ) ) ( not ( = ?auto_717038 ?auto_717039 ) ) ( not ( = ?auto_717038 ?auto_717040 ) ) ( not ( = ?auto_717038 ?auto_717041 ) ) ( not ( = ?auto_717038 ?auto_717042 ) ) ( not ( = ?auto_717038 ?auto_717043 ) ) ( not ( = ?auto_717038 ?auto_717044 ) ) ( not ( = ?auto_717038 ?auto_717045 ) ) ( not ( = ?auto_717039 ?auto_717040 ) ) ( not ( = ?auto_717039 ?auto_717041 ) ) ( not ( = ?auto_717039 ?auto_717042 ) ) ( not ( = ?auto_717039 ?auto_717043 ) ) ( not ( = ?auto_717039 ?auto_717044 ) ) ( not ( = ?auto_717039 ?auto_717045 ) ) ( not ( = ?auto_717040 ?auto_717041 ) ) ( not ( = ?auto_717040 ?auto_717042 ) ) ( not ( = ?auto_717040 ?auto_717043 ) ) ( not ( = ?auto_717040 ?auto_717044 ) ) ( not ( = ?auto_717040 ?auto_717045 ) ) ( not ( = ?auto_717041 ?auto_717042 ) ) ( not ( = ?auto_717041 ?auto_717043 ) ) ( not ( = ?auto_717041 ?auto_717044 ) ) ( not ( = ?auto_717041 ?auto_717045 ) ) ( not ( = ?auto_717042 ?auto_717043 ) ) ( not ( = ?auto_717042 ?auto_717044 ) ) ( not ( = ?auto_717042 ?auto_717045 ) ) ( not ( = ?auto_717043 ?auto_717044 ) ) ( not ( = ?auto_717043 ?auto_717045 ) ) ( not ( = ?auto_717044 ?auto_717045 ) ) ( ON ?auto_717044 ?auto_717045 ) ( ON ?auto_717043 ?auto_717044 ) ( ON ?auto_717042 ?auto_717043 ) ( ON ?auto_717041 ?auto_717042 ) ( ON ?auto_717040 ?auto_717041 ) ( ON ?auto_717039 ?auto_717040 ) ( ON ?auto_717038 ?auto_717039 ) ( ON ?auto_717037 ?auto_717038 ) ( ON ?auto_717036 ?auto_717037 ) ( ON ?auto_717035 ?auto_717036 ) ( ON ?auto_717034 ?auto_717035 ) ( ON ?auto_717033 ?auto_717034 ) ( CLEAR ?auto_717031 ) ( ON ?auto_717032 ?auto_717033 ) ( CLEAR ?auto_717032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_717029 ?auto_717030 ?auto_717031 ?auto_717032 )
      ( MAKE-17PILE ?auto_717029 ?auto_717030 ?auto_717031 ?auto_717032 ?auto_717033 ?auto_717034 ?auto_717035 ?auto_717036 ?auto_717037 ?auto_717038 ?auto_717039 ?auto_717040 ?auto_717041 ?auto_717042 ?auto_717043 ?auto_717044 ?auto_717045 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717063 - BLOCK
      ?auto_717064 - BLOCK
      ?auto_717065 - BLOCK
      ?auto_717066 - BLOCK
      ?auto_717067 - BLOCK
      ?auto_717068 - BLOCK
      ?auto_717069 - BLOCK
      ?auto_717070 - BLOCK
      ?auto_717071 - BLOCK
      ?auto_717072 - BLOCK
      ?auto_717073 - BLOCK
      ?auto_717074 - BLOCK
      ?auto_717075 - BLOCK
      ?auto_717076 - BLOCK
      ?auto_717077 - BLOCK
      ?auto_717078 - BLOCK
      ?auto_717079 - BLOCK
    )
    :vars
    (
      ?auto_717080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717079 ?auto_717080 ) ( ON-TABLE ?auto_717063 ) ( ON ?auto_717064 ?auto_717063 ) ( not ( = ?auto_717063 ?auto_717064 ) ) ( not ( = ?auto_717063 ?auto_717065 ) ) ( not ( = ?auto_717063 ?auto_717066 ) ) ( not ( = ?auto_717063 ?auto_717067 ) ) ( not ( = ?auto_717063 ?auto_717068 ) ) ( not ( = ?auto_717063 ?auto_717069 ) ) ( not ( = ?auto_717063 ?auto_717070 ) ) ( not ( = ?auto_717063 ?auto_717071 ) ) ( not ( = ?auto_717063 ?auto_717072 ) ) ( not ( = ?auto_717063 ?auto_717073 ) ) ( not ( = ?auto_717063 ?auto_717074 ) ) ( not ( = ?auto_717063 ?auto_717075 ) ) ( not ( = ?auto_717063 ?auto_717076 ) ) ( not ( = ?auto_717063 ?auto_717077 ) ) ( not ( = ?auto_717063 ?auto_717078 ) ) ( not ( = ?auto_717063 ?auto_717079 ) ) ( not ( = ?auto_717063 ?auto_717080 ) ) ( not ( = ?auto_717064 ?auto_717065 ) ) ( not ( = ?auto_717064 ?auto_717066 ) ) ( not ( = ?auto_717064 ?auto_717067 ) ) ( not ( = ?auto_717064 ?auto_717068 ) ) ( not ( = ?auto_717064 ?auto_717069 ) ) ( not ( = ?auto_717064 ?auto_717070 ) ) ( not ( = ?auto_717064 ?auto_717071 ) ) ( not ( = ?auto_717064 ?auto_717072 ) ) ( not ( = ?auto_717064 ?auto_717073 ) ) ( not ( = ?auto_717064 ?auto_717074 ) ) ( not ( = ?auto_717064 ?auto_717075 ) ) ( not ( = ?auto_717064 ?auto_717076 ) ) ( not ( = ?auto_717064 ?auto_717077 ) ) ( not ( = ?auto_717064 ?auto_717078 ) ) ( not ( = ?auto_717064 ?auto_717079 ) ) ( not ( = ?auto_717064 ?auto_717080 ) ) ( not ( = ?auto_717065 ?auto_717066 ) ) ( not ( = ?auto_717065 ?auto_717067 ) ) ( not ( = ?auto_717065 ?auto_717068 ) ) ( not ( = ?auto_717065 ?auto_717069 ) ) ( not ( = ?auto_717065 ?auto_717070 ) ) ( not ( = ?auto_717065 ?auto_717071 ) ) ( not ( = ?auto_717065 ?auto_717072 ) ) ( not ( = ?auto_717065 ?auto_717073 ) ) ( not ( = ?auto_717065 ?auto_717074 ) ) ( not ( = ?auto_717065 ?auto_717075 ) ) ( not ( = ?auto_717065 ?auto_717076 ) ) ( not ( = ?auto_717065 ?auto_717077 ) ) ( not ( = ?auto_717065 ?auto_717078 ) ) ( not ( = ?auto_717065 ?auto_717079 ) ) ( not ( = ?auto_717065 ?auto_717080 ) ) ( not ( = ?auto_717066 ?auto_717067 ) ) ( not ( = ?auto_717066 ?auto_717068 ) ) ( not ( = ?auto_717066 ?auto_717069 ) ) ( not ( = ?auto_717066 ?auto_717070 ) ) ( not ( = ?auto_717066 ?auto_717071 ) ) ( not ( = ?auto_717066 ?auto_717072 ) ) ( not ( = ?auto_717066 ?auto_717073 ) ) ( not ( = ?auto_717066 ?auto_717074 ) ) ( not ( = ?auto_717066 ?auto_717075 ) ) ( not ( = ?auto_717066 ?auto_717076 ) ) ( not ( = ?auto_717066 ?auto_717077 ) ) ( not ( = ?auto_717066 ?auto_717078 ) ) ( not ( = ?auto_717066 ?auto_717079 ) ) ( not ( = ?auto_717066 ?auto_717080 ) ) ( not ( = ?auto_717067 ?auto_717068 ) ) ( not ( = ?auto_717067 ?auto_717069 ) ) ( not ( = ?auto_717067 ?auto_717070 ) ) ( not ( = ?auto_717067 ?auto_717071 ) ) ( not ( = ?auto_717067 ?auto_717072 ) ) ( not ( = ?auto_717067 ?auto_717073 ) ) ( not ( = ?auto_717067 ?auto_717074 ) ) ( not ( = ?auto_717067 ?auto_717075 ) ) ( not ( = ?auto_717067 ?auto_717076 ) ) ( not ( = ?auto_717067 ?auto_717077 ) ) ( not ( = ?auto_717067 ?auto_717078 ) ) ( not ( = ?auto_717067 ?auto_717079 ) ) ( not ( = ?auto_717067 ?auto_717080 ) ) ( not ( = ?auto_717068 ?auto_717069 ) ) ( not ( = ?auto_717068 ?auto_717070 ) ) ( not ( = ?auto_717068 ?auto_717071 ) ) ( not ( = ?auto_717068 ?auto_717072 ) ) ( not ( = ?auto_717068 ?auto_717073 ) ) ( not ( = ?auto_717068 ?auto_717074 ) ) ( not ( = ?auto_717068 ?auto_717075 ) ) ( not ( = ?auto_717068 ?auto_717076 ) ) ( not ( = ?auto_717068 ?auto_717077 ) ) ( not ( = ?auto_717068 ?auto_717078 ) ) ( not ( = ?auto_717068 ?auto_717079 ) ) ( not ( = ?auto_717068 ?auto_717080 ) ) ( not ( = ?auto_717069 ?auto_717070 ) ) ( not ( = ?auto_717069 ?auto_717071 ) ) ( not ( = ?auto_717069 ?auto_717072 ) ) ( not ( = ?auto_717069 ?auto_717073 ) ) ( not ( = ?auto_717069 ?auto_717074 ) ) ( not ( = ?auto_717069 ?auto_717075 ) ) ( not ( = ?auto_717069 ?auto_717076 ) ) ( not ( = ?auto_717069 ?auto_717077 ) ) ( not ( = ?auto_717069 ?auto_717078 ) ) ( not ( = ?auto_717069 ?auto_717079 ) ) ( not ( = ?auto_717069 ?auto_717080 ) ) ( not ( = ?auto_717070 ?auto_717071 ) ) ( not ( = ?auto_717070 ?auto_717072 ) ) ( not ( = ?auto_717070 ?auto_717073 ) ) ( not ( = ?auto_717070 ?auto_717074 ) ) ( not ( = ?auto_717070 ?auto_717075 ) ) ( not ( = ?auto_717070 ?auto_717076 ) ) ( not ( = ?auto_717070 ?auto_717077 ) ) ( not ( = ?auto_717070 ?auto_717078 ) ) ( not ( = ?auto_717070 ?auto_717079 ) ) ( not ( = ?auto_717070 ?auto_717080 ) ) ( not ( = ?auto_717071 ?auto_717072 ) ) ( not ( = ?auto_717071 ?auto_717073 ) ) ( not ( = ?auto_717071 ?auto_717074 ) ) ( not ( = ?auto_717071 ?auto_717075 ) ) ( not ( = ?auto_717071 ?auto_717076 ) ) ( not ( = ?auto_717071 ?auto_717077 ) ) ( not ( = ?auto_717071 ?auto_717078 ) ) ( not ( = ?auto_717071 ?auto_717079 ) ) ( not ( = ?auto_717071 ?auto_717080 ) ) ( not ( = ?auto_717072 ?auto_717073 ) ) ( not ( = ?auto_717072 ?auto_717074 ) ) ( not ( = ?auto_717072 ?auto_717075 ) ) ( not ( = ?auto_717072 ?auto_717076 ) ) ( not ( = ?auto_717072 ?auto_717077 ) ) ( not ( = ?auto_717072 ?auto_717078 ) ) ( not ( = ?auto_717072 ?auto_717079 ) ) ( not ( = ?auto_717072 ?auto_717080 ) ) ( not ( = ?auto_717073 ?auto_717074 ) ) ( not ( = ?auto_717073 ?auto_717075 ) ) ( not ( = ?auto_717073 ?auto_717076 ) ) ( not ( = ?auto_717073 ?auto_717077 ) ) ( not ( = ?auto_717073 ?auto_717078 ) ) ( not ( = ?auto_717073 ?auto_717079 ) ) ( not ( = ?auto_717073 ?auto_717080 ) ) ( not ( = ?auto_717074 ?auto_717075 ) ) ( not ( = ?auto_717074 ?auto_717076 ) ) ( not ( = ?auto_717074 ?auto_717077 ) ) ( not ( = ?auto_717074 ?auto_717078 ) ) ( not ( = ?auto_717074 ?auto_717079 ) ) ( not ( = ?auto_717074 ?auto_717080 ) ) ( not ( = ?auto_717075 ?auto_717076 ) ) ( not ( = ?auto_717075 ?auto_717077 ) ) ( not ( = ?auto_717075 ?auto_717078 ) ) ( not ( = ?auto_717075 ?auto_717079 ) ) ( not ( = ?auto_717075 ?auto_717080 ) ) ( not ( = ?auto_717076 ?auto_717077 ) ) ( not ( = ?auto_717076 ?auto_717078 ) ) ( not ( = ?auto_717076 ?auto_717079 ) ) ( not ( = ?auto_717076 ?auto_717080 ) ) ( not ( = ?auto_717077 ?auto_717078 ) ) ( not ( = ?auto_717077 ?auto_717079 ) ) ( not ( = ?auto_717077 ?auto_717080 ) ) ( not ( = ?auto_717078 ?auto_717079 ) ) ( not ( = ?auto_717078 ?auto_717080 ) ) ( not ( = ?auto_717079 ?auto_717080 ) ) ( ON ?auto_717078 ?auto_717079 ) ( ON ?auto_717077 ?auto_717078 ) ( ON ?auto_717076 ?auto_717077 ) ( ON ?auto_717075 ?auto_717076 ) ( ON ?auto_717074 ?auto_717075 ) ( ON ?auto_717073 ?auto_717074 ) ( ON ?auto_717072 ?auto_717073 ) ( ON ?auto_717071 ?auto_717072 ) ( ON ?auto_717070 ?auto_717071 ) ( ON ?auto_717069 ?auto_717070 ) ( ON ?auto_717068 ?auto_717069 ) ( ON ?auto_717067 ?auto_717068 ) ( ON ?auto_717066 ?auto_717067 ) ( CLEAR ?auto_717064 ) ( ON ?auto_717065 ?auto_717066 ) ( CLEAR ?auto_717065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717063 ?auto_717064 ?auto_717065 )
      ( MAKE-17PILE ?auto_717063 ?auto_717064 ?auto_717065 ?auto_717066 ?auto_717067 ?auto_717068 ?auto_717069 ?auto_717070 ?auto_717071 ?auto_717072 ?auto_717073 ?auto_717074 ?auto_717075 ?auto_717076 ?auto_717077 ?auto_717078 ?auto_717079 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717098 - BLOCK
      ?auto_717099 - BLOCK
      ?auto_717100 - BLOCK
      ?auto_717101 - BLOCK
      ?auto_717102 - BLOCK
      ?auto_717103 - BLOCK
      ?auto_717104 - BLOCK
      ?auto_717105 - BLOCK
      ?auto_717106 - BLOCK
      ?auto_717107 - BLOCK
      ?auto_717108 - BLOCK
      ?auto_717109 - BLOCK
      ?auto_717110 - BLOCK
      ?auto_717111 - BLOCK
      ?auto_717112 - BLOCK
      ?auto_717113 - BLOCK
      ?auto_717114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_717114 ) ( ON-TABLE ?auto_717098 ) ( ON ?auto_717099 ?auto_717098 ) ( not ( = ?auto_717098 ?auto_717099 ) ) ( not ( = ?auto_717098 ?auto_717100 ) ) ( not ( = ?auto_717098 ?auto_717101 ) ) ( not ( = ?auto_717098 ?auto_717102 ) ) ( not ( = ?auto_717098 ?auto_717103 ) ) ( not ( = ?auto_717098 ?auto_717104 ) ) ( not ( = ?auto_717098 ?auto_717105 ) ) ( not ( = ?auto_717098 ?auto_717106 ) ) ( not ( = ?auto_717098 ?auto_717107 ) ) ( not ( = ?auto_717098 ?auto_717108 ) ) ( not ( = ?auto_717098 ?auto_717109 ) ) ( not ( = ?auto_717098 ?auto_717110 ) ) ( not ( = ?auto_717098 ?auto_717111 ) ) ( not ( = ?auto_717098 ?auto_717112 ) ) ( not ( = ?auto_717098 ?auto_717113 ) ) ( not ( = ?auto_717098 ?auto_717114 ) ) ( not ( = ?auto_717099 ?auto_717100 ) ) ( not ( = ?auto_717099 ?auto_717101 ) ) ( not ( = ?auto_717099 ?auto_717102 ) ) ( not ( = ?auto_717099 ?auto_717103 ) ) ( not ( = ?auto_717099 ?auto_717104 ) ) ( not ( = ?auto_717099 ?auto_717105 ) ) ( not ( = ?auto_717099 ?auto_717106 ) ) ( not ( = ?auto_717099 ?auto_717107 ) ) ( not ( = ?auto_717099 ?auto_717108 ) ) ( not ( = ?auto_717099 ?auto_717109 ) ) ( not ( = ?auto_717099 ?auto_717110 ) ) ( not ( = ?auto_717099 ?auto_717111 ) ) ( not ( = ?auto_717099 ?auto_717112 ) ) ( not ( = ?auto_717099 ?auto_717113 ) ) ( not ( = ?auto_717099 ?auto_717114 ) ) ( not ( = ?auto_717100 ?auto_717101 ) ) ( not ( = ?auto_717100 ?auto_717102 ) ) ( not ( = ?auto_717100 ?auto_717103 ) ) ( not ( = ?auto_717100 ?auto_717104 ) ) ( not ( = ?auto_717100 ?auto_717105 ) ) ( not ( = ?auto_717100 ?auto_717106 ) ) ( not ( = ?auto_717100 ?auto_717107 ) ) ( not ( = ?auto_717100 ?auto_717108 ) ) ( not ( = ?auto_717100 ?auto_717109 ) ) ( not ( = ?auto_717100 ?auto_717110 ) ) ( not ( = ?auto_717100 ?auto_717111 ) ) ( not ( = ?auto_717100 ?auto_717112 ) ) ( not ( = ?auto_717100 ?auto_717113 ) ) ( not ( = ?auto_717100 ?auto_717114 ) ) ( not ( = ?auto_717101 ?auto_717102 ) ) ( not ( = ?auto_717101 ?auto_717103 ) ) ( not ( = ?auto_717101 ?auto_717104 ) ) ( not ( = ?auto_717101 ?auto_717105 ) ) ( not ( = ?auto_717101 ?auto_717106 ) ) ( not ( = ?auto_717101 ?auto_717107 ) ) ( not ( = ?auto_717101 ?auto_717108 ) ) ( not ( = ?auto_717101 ?auto_717109 ) ) ( not ( = ?auto_717101 ?auto_717110 ) ) ( not ( = ?auto_717101 ?auto_717111 ) ) ( not ( = ?auto_717101 ?auto_717112 ) ) ( not ( = ?auto_717101 ?auto_717113 ) ) ( not ( = ?auto_717101 ?auto_717114 ) ) ( not ( = ?auto_717102 ?auto_717103 ) ) ( not ( = ?auto_717102 ?auto_717104 ) ) ( not ( = ?auto_717102 ?auto_717105 ) ) ( not ( = ?auto_717102 ?auto_717106 ) ) ( not ( = ?auto_717102 ?auto_717107 ) ) ( not ( = ?auto_717102 ?auto_717108 ) ) ( not ( = ?auto_717102 ?auto_717109 ) ) ( not ( = ?auto_717102 ?auto_717110 ) ) ( not ( = ?auto_717102 ?auto_717111 ) ) ( not ( = ?auto_717102 ?auto_717112 ) ) ( not ( = ?auto_717102 ?auto_717113 ) ) ( not ( = ?auto_717102 ?auto_717114 ) ) ( not ( = ?auto_717103 ?auto_717104 ) ) ( not ( = ?auto_717103 ?auto_717105 ) ) ( not ( = ?auto_717103 ?auto_717106 ) ) ( not ( = ?auto_717103 ?auto_717107 ) ) ( not ( = ?auto_717103 ?auto_717108 ) ) ( not ( = ?auto_717103 ?auto_717109 ) ) ( not ( = ?auto_717103 ?auto_717110 ) ) ( not ( = ?auto_717103 ?auto_717111 ) ) ( not ( = ?auto_717103 ?auto_717112 ) ) ( not ( = ?auto_717103 ?auto_717113 ) ) ( not ( = ?auto_717103 ?auto_717114 ) ) ( not ( = ?auto_717104 ?auto_717105 ) ) ( not ( = ?auto_717104 ?auto_717106 ) ) ( not ( = ?auto_717104 ?auto_717107 ) ) ( not ( = ?auto_717104 ?auto_717108 ) ) ( not ( = ?auto_717104 ?auto_717109 ) ) ( not ( = ?auto_717104 ?auto_717110 ) ) ( not ( = ?auto_717104 ?auto_717111 ) ) ( not ( = ?auto_717104 ?auto_717112 ) ) ( not ( = ?auto_717104 ?auto_717113 ) ) ( not ( = ?auto_717104 ?auto_717114 ) ) ( not ( = ?auto_717105 ?auto_717106 ) ) ( not ( = ?auto_717105 ?auto_717107 ) ) ( not ( = ?auto_717105 ?auto_717108 ) ) ( not ( = ?auto_717105 ?auto_717109 ) ) ( not ( = ?auto_717105 ?auto_717110 ) ) ( not ( = ?auto_717105 ?auto_717111 ) ) ( not ( = ?auto_717105 ?auto_717112 ) ) ( not ( = ?auto_717105 ?auto_717113 ) ) ( not ( = ?auto_717105 ?auto_717114 ) ) ( not ( = ?auto_717106 ?auto_717107 ) ) ( not ( = ?auto_717106 ?auto_717108 ) ) ( not ( = ?auto_717106 ?auto_717109 ) ) ( not ( = ?auto_717106 ?auto_717110 ) ) ( not ( = ?auto_717106 ?auto_717111 ) ) ( not ( = ?auto_717106 ?auto_717112 ) ) ( not ( = ?auto_717106 ?auto_717113 ) ) ( not ( = ?auto_717106 ?auto_717114 ) ) ( not ( = ?auto_717107 ?auto_717108 ) ) ( not ( = ?auto_717107 ?auto_717109 ) ) ( not ( = ?auto_717107 ?auto_717110 ) ) ( not ( = ?auto_717107 ?auto_717111 ) ) ( not ( = ?auto_717107 ?auto_717112 ) ) ( not ( = ?auto_717107 ?auto_717113 ) ) ( not ( = ?auto_717107 ?auto_717114 ) ) ( not ( = ?auto_717108 ?auto_717109 ) ) ( not ( = ?auto_717108 ?auto_717110 ) ) ( not ( = ?auto_717108 ?auto_717111 ) ) ( not ( = ?auto_717108 ?auto_717112 ) ) ( not ( = ?auto_717108 ?auto_717113 ) ) ( not ( = ?auto_717108 ?auto_717114 ) ) ( not ( = ?auto_717109 ?auto_717110 ) ) ( not ( = ?auto_717109 ?auto_717111 ) ) ( not ( = ?auto_717109 ?auto_717112 ) ) ( not ( = ?auto_717109 ?auto_717113 ) ) ( not ( = ?auto_717109 ?auto_717114 ) ) ( not ( = ?auto_717110 ?auto_717111 ) ) ( not ( = ?auto_717110 ?auto_717112 ) ) ( not ( = ?auto_717110 ?auto_717113 ) ) ( not ( = ?auto_717110 ?auto_717114 ) ) ( not ( = ?auto_717111 ?auto_717112 ) ) ( not ( = ?auto_717111 ?auto_717113 ) ) ( not ( = ?auto_717111 ?auto_717114 ) ) ( not ( = ?auto_717112 ?auto_717113 ) ) ( not ( = ?auto_717112 ?auto_717114 ) ) ( not ( = ?auto_717113 ?auto_717114 ) ) ( ON ?auto_717113 ?auto_717114 ) ( ON ?auto_717112 ?auto_717113 ) ( ON ?auto_717111 ?auto_717112 ) ( ON ?auto_717110 ?auto_717111 ) ( ON ?auto_717109 ?auto_717110 ) ( ON ?auto_717108 ?auto_717109 ) ( ON ?auto_717107 ?auto_717108 ) ( ON ?auto_717106 ?auto_717107 ) ( ON ?auto_717105 ?auto_717106 ) ( ON ?auto_717104 ?auto_717105 ) ( ON ?auto_717103 ?auto_717104 ) ( ON ?auto_717102 ?auto_717103 ) ( ON ?auto_717101 ?auto_717102 ) ( CLEAR ?auto_717099 ) ( ON ?auto_717100 ?auto_717101 ) ( CLEAR ?auto_717100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_717098 ?auto_717099 ?auto_717100 )
      ( MAKE-17PILE ?auto_717098 ?auto_717099 ?auto_717100 ?auto_717101 ?auto_717102 ?auto_717103 ?auto_717104 ?auto_717105 ?auto_717106 ?auto_717107 ?auto_717108 ?auto_717109 ?auto_717110 ?auto_717111 ?auto_717112 ?auto_717113 ?auto_717114 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717132 - BLOCK
      ?auto_717133 - BLOCK
      ?auto_717134 - BLOCK
      ?auto_717135 - BLOCK
      ?auto_717136 - BLOCK
      ?auto_717137 - BLOCK
      ?auto_717138 - BLOCK
      ?auto_717139 - BLOCK
      ?auto_717140 - BLOCK
      ?auto_717141 - BLOCK
      ?auto_717142 - BLOCK
      ?auto_717143 - BLOCK
      ?auto_717144 - BLOCK
      ?auto_717145 - BLOCK
      ?auto_717146 - BLOCK
      ?auto_717147 - BLOCK
      ?auto_717148 - BLOCK
    )
    :vars
    (
      ?auto_717149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717148 ?auto_717149 ) ( ON-TABLE ?auto_717132 ) ( not ( = ?auto_717132 ?auto_717133 ) ) ( not ( = ?auto_717132 ?auto_717134 ) ) ( not ( = ?auto_717132 ?auto_717135 ) ) ( not ( = ?auto_717132 ?auto_717136 ) ) ( not ( = ?auto_717132 ?auto_717137 ) ) ( not ( = ?auto_717132 ?auto_717138 ) ) ( not ( = ?auto_717132 ?auto_717139 ) ) ( not ( = ?auto_717132 ?auto_717140 ) ) ( not ( = ?auto_717132 ?auto_717141 ) ) ( not ( = ?auto_717132 ?auto_717142 ) ) ( not ( = ?auto_717132 ?auto_717143 ) ) ( not ( = ?auto_717132 ?auto_717144 ) ) ( not ( = ?auto_717132 ?auto_717145 ) ) ( not ( = ?auto_717132 ?auto_717146 ) ) ( not ( = ?auto_717132 ?auto_717147 ) ) ( not ( = ?auto_717132 ?auto_717148 ) ) ( not ( = ?auto_717132 ?auto_717149 ) ) ( not ( = ?auto_717133 ?auto_717134 ) ) ( not ( = ?auto_717133 ?auto_717135 ) ) ( not ( = ?auto_717133 ?auto_717136 ) ) ( not ( = ?auto_717133 ?auto_717137 ) ) ( not ( = ?auto_717133 ?auto_717138 ) ) ( not ( = ?auto_717133 ?auto_717139 ) ) ( not ( = ?auto_717133 ?auto_717140 ) ) ( not ( = ?auto_717133 ?auto_717141 ) ) ( not ( = ?auto_717133 ?auto_717142 ) ) ( not ( = ?auto_717133 ?auto_717143 ) ) ( not ( = ?auto_717133 ?auto_717144 ) ) ( not ( = ?auto_717133 ?auto_717145 ) ) ( not ( = ?auto_717133 ?auto_717146 ) ) ( not ( = ?auto_717133 ?auto_717147 ) ) ( not ( = ?auto_717133 ?auto_717148 ) ) ( not ( = ?auto_717133 ?auto_717149 ) ) ( not ( = ?auto_717134 ?auto_717135 ) ) ( not ( = ?auto_717134 ?auto_717136 ) ) ( not ( = ?auto_717134 ?auto_717137 ) ) ( not ( = ?auto_717134 ?auto_717138 ) ) ( not ( = ?auto_717134 ?auto_717139 ) ) ( not ( = ?auto_717134 ?auto_717140 ) ) ( not ( = ?auto_717134 ?auto_717141 ) ) ( not ( = ?auto_717134 ?auto_717142 ) ) ( not ( = ?auto_717134 ?auto_717143 ) ) ( not ( = ?auto_717134 ?auto_717144 ) ) ( not ( = ?auto_717134 ?auto_717145 ) ) ( not ( = ?auto_717134 ?auto_717146 ) ) ( not ( = ?auto_717134 ?auto_717147 ) ) ( not ( = ?auto_717134 ?auto_717148 ) ) ( not ( = ?auto_717134 ?auto_717149 ) ) ( not ( = ?auto_717135 ?auto_717136 ) ) ( not ( = ?auto_717135 ?auto_717137 ) ) ( not ( = ?auto_717135 ?auto_717138 ) ) ( not ( = ?auto_717135 ?auto_717139 ) ) ( not ( = ?auto_717135 ?auto_717140 ) ) ( not ( = ?auto_717135 ?auto_717141 ) ) ( not ( = ?auto_717135 ?auto_717142 ) ) ( not ( = ?auto_717135 ?auto_717143 ) ) ( not ( = ?auto_717135 ?auto_717144 ) ) ( not ( = ?auto_717135 ?auto_717145 ) ) ( not ( = ?auto_717135 ?auto_717146 ) ) ( not ( = ?auto_717135 ?auto_717147 ) ) ( not ( = ?auto_717135 ?auto_717148 ) ) ( not ( = ?auto_717135 ?auto_717149 ) ) ( not ( = ?auto_717136 ?auto_717137 ) ) ( not ( = ?auto_717136 ?auto_717138 ) ) ( not ( = ?auto_717136 ?auto_717139 ) ) ( not ( = ?auto_717136 ?auto_717140 ) ) ( not ( = ?auto_717136 ?auto_717141 ) ) ( not ( = ?auto_717136 ?auto_717142 ) ) ( not ( = ?auto_717136 ?auto_717143 ) ) ( not ( = ?auto_717136 ?auto_717144 ) ) ( not ( = ?auto_717136 ?auto_717145 ) ) ( not ( = ?auto_717136 ?auto_717146 ) ) ( not ( = ?auto_717136 ?auto_717147 ) ) ( not ( = ?auto_717136 ?auto_717148 ) ) ( not ( = ?auto_717136 ?auto_717149 ) ) ( not ( = ?auto_717137 ?auto_717138 ) ) ( not ( = ?auto_717137 ?auto_717139 ) ) ( not ( = ?auto_717137 ?auto_717140 ) ) ( not ( = ?auto_717137 ?auto_717141 ) ) ( not ( = ?auto_717137 ?auto_717142 ) ) ( not ( = ?auto_717137 ?auto_717143 ) ) ( not ( = ?auto_717137 ?auto_717144 ) ) ( not ( = ?auto_717137 ?auto_717145 ) ) ( not ( = ?auto_717137 ?auto_717146 ) ) ( not ( = ?auto_717137 ?auto_717147 ) ) ( not ( = ?auto_717137 ?auto_717148 ) ) ( not ( = ?auto_717137 ?auto_717149 ) ) ( not ( = ?auto_717138 ?auto_717139 ) ) ( not ( = ?auto_717138 ?auto_717140 ) ) ( not ( = ?auto_717138 ?auto_717141 ) ) ( not ( = ?auto_717138 ?auto_717142 ) ) ( not ( = ?auto_717138 ?auto_717143 ) ) ( not ( = ?auto_717138 ?auto_717144 ) ) ( not ( = ?auto_717138 ?auto_717145 ) ) ( not ( = ?auto_717138 ?auto_717146 ) ) ( not ( = ?auto_717138 ?auto_717147 ) ) ( not ( = ?auto_717138 ?auto_717148 ) ) ( not ( = ?auto_717138 ?auto_717149 ) ) ( not ( = ?auto_717139 ?auto_717140 ) ) ( not ( = ?auto_717139 ?auto_717141 ) ) ( not ( = ?auto_717139 ?auto_717142 ) ) ( not ( = ?auto_717139 ?auto_717143 ) ) ( not ( = ?auto_717139 ?auto_717144 ) ) ( not ( = ?auto_717139 ?auto_717145 ) ) ( not ( = ?auto_717139 ?auto_717146 ) ) ( not ( = ?auto_717139 ?auto_717147 ) ) ( not ( = ?auto_717139 ?auto_717148 ) ) ( not ( = ?auto_717139 ?auto_717149 ) ) ( not ( = ?auto_717140 ?auto_717141 ) ) ( not ( = ?auto_717140 ?auto_717142 ) ) ( not ( = ?auto_717140 ?auto_717143 ) ) ( not ( = ?auto_717140 ?auto_717144 ) ) ( not ( = ?auto_717140 ?auto_717145 ) ) ( not ( = ?auto_717140 ?auto_717146 ) ) ( not ( = ?auto_717140 ?auto_717147 ) ) ( not ( = ?auto_717140 ?auto_717148 ) ) ( not ( = ?auto_717140 ?auto_717149 ) ) ( not ( = ?auto_717141 ?auto_717142 ) ) ( not ( = ?auto_717141 ?auto_717143 ) ) ( not ( = ?auto_717141 ?auto_717144 ) ) ( not ( = ?auto_717141 ?auto_717145 ) ) ( not ( = ?auto_717141 ?auto_717146 ) ) ( not ( = ?auto_717141 ?auto_717147 ) ) ( not ( = ?auto_717141 ?auto_717148 ) ) ( not ( = ?auto_717141 ?auto_717149 ) ) ( not ( = ?auto_717142 ?auto_717143 ) ) ( not ( = ?auto_717142 ?auto_717144 ) ) ( not ( = ?auto_717142 ?auto_717145 ) ) ( not ( = ?auto_717142 ?auto_717146 ) ) ( not ( = ?auto_717142 ?auto_717147 ) ) ( not ( = ?auto_717142 ?auto_717148 ) ) ( not ( = ?auto_717142 ?auto_717149 ) ) ( not ( = ?auto_717143 ?auto_717144 ) ) ( not ( = ?auto_717143 ?auto_717145 ) ) ( not ( = ?auto_717143 ?auto_717146 ) ) ( not ( = ?auto_717143 ?auto_717147 ) ) ( not ( = ?auto_717143 ?auto_717148 ) ) ( not ( = ?auto_717143 ?auto_717149 ) ) ( not ( = ?auto_717144 ?auto_717145 ) ) ( not ( = ?auto_717144 ?auto_717146 ) ) ( not ( = ?auto_717144 ?auto_717147 ) ) ( not ( = ?auto_717144 ?auto_717148 ) ) ( not ( = ?auto_717144 ?auto_717149 ) ) ( not ( = ?auto_717145 ?auto_717146 ) ) ( not ( = ?auto_717145 ?auto_717147 ) ) ( not ( = ?auto_717145 ?auto_717148 ) ) ( not ( = ?auto_717145 ?auto_717149 ) ) ( not ( = ?auto_717146 ?auto_717147 ) ) ( not ( = ?auto_717146 ?auto_717148 ) ) ( not ( = ?auto_717146 ?auto_717149 ) ) ( not ( = ?auto_717147 ?auto_717148 ) ) ( not ( = ?auto_717147 ?auto_717149 ) ) ( not ( = ?auto_717148 ?auto_717149 ) ) ( ON ?auto_717147 ?auto_717148 ) ( ON ?auto_717146 ?auto_717147 ) ( ON ?auto_717145 ?auto_717146 ) ( ON ?auto_717144 ?auto_717145 ) ( ON ?auto_717143 ?auto_717144 ) ( ON ?auto_717142 ?auto_717143 ) ( ON ?auto_717141 ?auto_717142 ) ( ON ?auto_717140 ?auto_717141 ) ( ON ?auto_717139 ?auto_717140 ) ( ON ?auto_717138 ?auto_717139 ) ( ON ?auto_717137 ?auto_717138 ) ( ON ?auto_717136 ?auto_717137 ) ( ON ?auto_717135 ?auto_717136 ) ( ON ?auto_717134 ?auto_717135 ) ( CLEAR ?auto_717132 ) ( ON ?auto_717133 ?auto_717134 ) ( CLEAR ?auto_717133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717132 ?auto_717133 )
      ( MAKE-17PILE ?auto_717132 ?auto_717133 ?auto_717134 ?auto_717135 ?auto_717136 ?auto_717137 ?auto_717138 ?auto_717139 ?auto_717140 ?auto_717141 ?auto_717142 ?auto_717143 ?auto_717144 ?auto_717145 ?auto_717146 ?auto_717147 ?auto_717148 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717167 - BLOCK
      ?auto_717168 - BLOCK
      ?auto_717169 - BLOCK
      ?auto_717170 - BLOCK
      ?auto_717171 - BLOCK
      ?auto_717172 - BLOCK
      ?auto_717173 - BLOCK
      ?auto_717174 - BLOCK
      ?auto_717175 - BLOCK
      ?auto_717176 - BLOCK
      ?auto_717177 - BLOCK
      ?auto_717178 - BLOCK
      ?auto_717179 - BLOCK
      ?auto_717180 - BLOCK
      ?auto_717181 - BLOCK
      ?auto_717182 - BLOCK
      ?auto_717183 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_717183 ) ( ON-TABLE ?auto_717167 ) ( not ( = ?auto_717167 ?auto_717168 ) ) ( not ( = ?auto_717167 ?auto_717169 ) ) ( not ( = ?auto_717167 ?auto_717170 ) ) ( not ( = ?auto_717167 ?auto_717171 ) ) ( not ( = ?auto_717167 ?auto_717172 ) ) ( not ( = ?auto_717167 ?auto_717173 ) ) ( not ( = ?auto_717167 ?auto_717174 ) ) ( not ( = ?auto_717167 ?auto_717175 ) ) ( not ( = ?auto_717167 ?auto_717176 ) ) ( not ( = ?auto_717167 ?auto_717177 ) ) ( not ( = ?auto_717167 ?auto_717178 ) ) ( not ( = ?auto_717167 ?auto_717179 ) ) ( not ( = ?auto_717167 ?auto_717180 ) ) ( not ( = ?auto_717167 ?auto_717181 ) ) ( not ( = ?auto_717167 ?auto_717182 ) ) ( not ( = ?auto_717167 ?auto_717183 ) ) ( not ( = ?auto_717168 ?auto_717169 ) ) ( not ( = ?auto_717168 ?auto_717170 ) ) ( not ( = ?auto_717168 ?auto_717171 ) ) ( not ( = ?auto_717168 ?auto_717172 ) ) ( not ( = ?auto_717168 ?auto_717173 ) ) ( not ( = ?auto_717168 ?auto_717174 ) ) ( not ( = ?auto_717168 ?auto_717175 ) ) ( not ( = ?auto_717168 ?auto_717176 ) ) ( not ( = ?auto_717168 ?auto_717177 ) ) ( not ( = ?auto_717168 ?auto_717178 ) ) ( not ( = ?auto_717168 ?auto_717179 ) ) ( not ( = ?auto_717168 ?auto_717180 ) ) ( not ( = ?auto_717168 ?auto_717181 ) ) ( not ( = ?auto_717168 ?auto_717182 ) ) ( not ( = ?auto_717168 ?auto_717183 ) ) ( not ( = ?auto_717169 ?auto_717170 ) ) ( not ( = ?auto_717169 ?auto_717171 ) ) ( not ( = ?auto_717169 ?auto_717172 ) ) ( not ( = ?auto_717169 ?auto_717173 ) ) ( not ( = ?auto_717169 ?auto_717174 ) ) ( not ( = ?auto_717169 ?auto_717175 ) ) ( not ( = ?auto_717169 ?auto_717176 ) ) ( not ( = ?auto_717169 ?auto_717177 ) ) ( not ( = ?auto_717169 ?auto_717178 ) ) ( not ( = ?auto_717169 ?auto_717179 ) ) ( not ( = ?auto_717169 ?auto_717180 ) ) ( not ( = ?auto_717169 ?auto_717181 ) ) ( not ( = ?auto_717169 ?auto_717182 ) ) ( not ( = ?auto_717169 ?auto_717183 ) ) ( not ( = ?auto_717170 ?auto_717171 ) ) ( not ( = ?auto_717170 ?auto_717172 ) ) ( not ( = ?auto_717170 ?auto_717173 ) ) ( not ( = ?auto_717170 ?auto_717174 ) ) ( not ( = ?auto_717170 ?auto_717175 ) ) ( not ( = ?auto_717170 ?auto_717176 ) ) ( not ( = ?auto_717170 ?auto_717177 ) ) ( not ( = ?auto_717170 ?auto_717178 ) ) ( not ( = ?auto_717170 ?auto_717179 ) ) ( not ( = ?auto_717170 ?auto_717180 ) ) ( not ( = ?auto_717170 ?auto_717181 ) ) ( not ( = ?auto_717170 ?auto_717182 ) ) ( not ( = ?auto_717170 ?auto_717183 ) ) ( not ( = ?auto_717171 ?auto_717172 ) ) ( not ( = ?auto_717171 ?auto_717173 ) ) ( not ( = ?auto_717171 ?auto_717174 ) ) ( not ( = ?auto_717171 ?auto_717175 ) ) ( not ( = ?auto_717171 ?auto_717176 ) ) ( not ( = ?auto_717171 ?auto_717177 ) ) ( not ( = ?auto_717171 ?auto_717178 ) ) ( not ( = ?auto_717171 ?auto_717179 ) ) ( not ( = ?auto_717171 ?auto_717180 ) ) ( not ( = ?auto_717171 ?auto_717181 ) ) ( not ( = ?auto_717171 ?auto_717182 ) ) ( not ( = ?auto_717171 ?auto_717183 ) ) ( not ( = ?auto_717172 ?auto_717173 ) ) ( not ( = ?auto_717172 ?auto_717174 ) ) ( not ( = ?auto_717172 ?auto_717175 ) ) ( not ( = ?auto_717172 ?auto_717176 ) ) ( not ( = ?auto_717172 ?auto_717177 ) ) ( not ( = ?auto_717172 ?auto_717178 ) ) ( not ( = ?auto_717172 ?auto_717179 ) ) ( not ( = ?auto_717172 ?auto_717180 ) ) ( not ( = ?auto_717172 ?auto_717181 ) ) ( not ( = ?auto_717172 ?auto_717182 ) ) ( not ( = ?auto_717172 ?auto_717183 ) ) ( not ( = ?auto_717173 ?auto_717174 ) ) ( not ( = ?auto_717173 ?auto_717175 ) ) ( not ( = ?auto_717173 ?auto_717176 ) ) ( not ( = ?auto_717173 ?auto_717177 ) ) ( not ( = ?auto_717173 ?auto_717178 ) ) ( not ( = ?auto_717173 ?auto_717179 ) ) ( not ( = ?auto_717173 ?auto_717180 ) ) ( not ( = ?auto_717173 ?auto_717181 ) ) ( not ( = ?auto_717173 ?auto_717182 ) ) ( not ( = ?auto_717173 ?auto_717183 ) ) ( not ( = ?auto_717174 ?auto_717175 ) ) ( not ( = ?auto_717174 ?auto_717176 ) ) ( not ( = ?auto_717174 ?auto_717177 ) ) ( not ( = ?auto_717174 ?auto_717178 ) ) ( not ( = ?auto_717174 ?auto_717179 ) ) ( not ( = ?auto_717174 ?auto_717180 ) ) ( not ( = ?auto_717174 ?auto_717181 ) ) ( not ( = ?auto_717174 ?auto_717182 ) ) ( not ( = ?auto_717174 ?auto_717183 ) ) ( not ( = ?auto_717175 ?auto_717176 ) ) ( not ( = ?auto_717175 ?auto_717177 ) ) ( not ( = ?auto_717175 ?auto_717178 ) ) ( not ( = ?auto_717175 ?auto_717179 ) ) ( not ( = ?auto_717175 ?auto_717180 ) ) ( not ( = ?auto_717175 ?auto_717181 ) ) ( not ( = ?auto_717175 ?auto_717182 ) ) ( not ( = ?auto_717175 ?auto_717183 ) ) ( not ( = ?auto_717176 ?auto_717177 ) ) ( not ( = ?auto_717176 ?auto_717178 ) ) ( not ( = ?auto_717176 ?auto_717179 ) ) ( not ( = ?auto_717176 ?auto_717180 ) ) ( not ( = ?auto_717176 ?auto_717181 ) ) ( not ( = ?auto_717176 ?auto_717182 ) ) ( not ( = ?auto_717176 ?auto_717183 ) ) ( not ( = ?auto_717177 ?auto_717178 ) ) ( not ( = ?auto_717177 ?auto_717179 ) ) ( not ( = ?auto_717177 ?auto_717180 ) ) ( not ( = ?auto_717177 ?auto_717181 ) ) ( not ( = ?auto_717177 ?auto_717182 ) ) ( not ( = ?auto_717177 ?auto_717183 ) ) ( not ( = ?auto_717178 ?auto_717179 ) ) ( not ( = ?auto_717178 ?auto_717180 ) ) ( not ( = ?auto_717178 ?auto_717181 ) ) ( not ( = ?auto_717178 ?auto_717182 ) ) ( not ( = ?auto_717178 ?auto_717183 ) ) ( not ( = ?auto_717179 ?auto_717180 ) ) ( not ( = ?auto_717179 ?auto_717181 ) ) ( not ( = ?auto_717179 ?auto_717182 ) ) ( not ( = ?auto_717179 ?auto_717183 ) ) ( not ( = ?auto_717180 ?auto_717181 ) ) ( not ( = ?auto_717180 ?auto_717182 ) ) ( not ( = ?auto_717180 ?auto_717183 ) ) ( not ( = ?auto_717181 ?auto_717182 ) ) ( not ( = ?auto_717181 ?auto_717183 ) ) ( not ( = ?auto_717182 ?auto_717183 ) ) ( ON ?auto_717182 ?auto_717183 ) ( ON ?auto_717181 ?auto_717182 ) ( ON ?auto_717180 ?auto_717181 ) ( ON ?auto_717179 ?auto_717180 ) ( ON ?auto_717178 ?auto_717179 ) ( ON ?auto_717177 ?auto_717178 ) ( ON ?auto_717176 ?auto_717177 ) ( ON ?auto_717175 ?auto_717176 ) ( ON ?auto_717174 ?auto_717175 ) ( ON ?auto_717173 ?auto_717174 ) ( ON ?auto_717172 ?auto_717173 ) ( ON ?auto_717171 ?auto_717172 ) ( ON ?auto_717170 ?auto_717171 ) ( ON ?auto_717169 ?auto_717170 ) ( CLEAR ?auto_717167 ) ( ON ?auto_717168 ?auto_717169 ) ( CLEAR ?auto_717168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_717167 ?auto_717168 )
      ( MAKE-17PILE ?auto_717167 ?auto_717168 ?auto_717169 ?auto_717170 ?auto_717171 ?auto_717172 ?auto_717173 ?auto_717174 ?auto_717175 ?auto_717176 ?auto_717177 ?auto_717178 ?auto_717179 ?auto_717180 ?auto_717181 ?auto_717182 ?auto_717183 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717201 - BLOCK
      ?auto_717202 - BLOCK
      ?auto_717203 - BLOCK
      ?auto_717204 - BLOCK
      ?auto_717205 - BLOCK
      ?auto_717206 - BLOCK
      ?auto_717207 - BLOCK
      ?auto_717208 - BLOCK
      ?auto_717209 - BLOCK
      ?auto_717210 - BLOCK
      ?auto_717211 - BLOCK
      ?auto_717212 - BLOCK
      ?auto_717213 - BLOCK
      ?auto_717214 - BLOCK
      ?auto_717215 - BLOCK
      ?auto_717216 - BLOCK
      ?auto_717217 - BLOCK
    )
    :vars
    (
      ?auto_717218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_717217 ?auto_717218 ) ( not ( = ?auto_717201 ?auto_717202 ) ) ( not ( = ?auto_717201 ?auto_717203 ) ) ( not ( = ?auto_717201 ?auto_717204 ) ) ( not ( = ?auto_717201 ?auto_717205 ) ) ( not ( = ?auto_717201 ?auto_717206 ) ) ( not ( = ?auto_717201 ?auto_717207 ) ) ( not ( = ?auto_717201 ?auto_717208 ) ) ( not ( = ?auto_717201 ?auto_717209 ) ) ( not ( = ?auto_717201 ?auto_717210 ) ) ( not ( = ?auto_717201 ?auto_717211 ) ) ( not ( = ?auto_717201 ?auto_717212 ) ) ( not ( = ?auto_717201 ?auto_717213 ) ) ( not ( = ?auto_717201 ?auto_717214 ) ) ( not ( = ?auto_717201 ?auto_717215 ) ) ( not ( = ?auto_717201 ?auto_717216 ) ) ( not ( = ?auto_717201 ?auto_717217 ) ) ( not ( = ?auto_717201 ?auto_717218 ) ) ( not ( = ?auto_717202 ?auto_717203 ) ) ( not ( = ?auto_717202 ?auto_717204 ) ) ( not ( = ?auto_717202 ?auto_717205 ) ) ( not ( = ?auto_717202 ?auto_717206 ) ) ( not ( = ?auto_717202 ?auto_717207 ) ) ( not ( = ?auto_717202 ?auto_717208 ) ) ( not ( = ?auto_717202 ?auto_717209 ) ) ( not ( = ?auto_717202 ?auto_717210 ) ) ( not ( = ?auto_717202 ?auto_717211 ) ) ( not ( = ?auto_717202 ?auto_717212 ) ) ( not ( = ?auto_717202 ?auto_717213 ) ) ( not ( = ?auto_717202 ?auto_717214 ) ) ( not ( = ?auto_717202 ?auto_717215 ) ) ( not ( = ?auto_717202 ?auto_717216 ) ) ( not ( = ?auto_717202 ?auto_717217 ) ) ( not ( = ?auto_717202 ?auto_717218 ) ) ( not ( = ?auto_717203 ?auto_717204 ) ) ( not ( = ?auto_717203 ?auto_717205 ) ) ( not ( = ?auto_717203 ?auto_717206 ) ) ( not ( = ?auto_717203 ?auto_717207 ) ) ( not ( = ?auto_717203 ?auto_717208 ) ) ( not ( = ?auto_717203 ?auto_717209 ) ) ( not ( = ?auto_717203 ?auto_717210 ) ) ( not ( = ?auto_717203 ?auto_717211 ) ) ( not ( = ?auto_717203 ?auto_717212 ) ) ( not ( = ?auto_717203 ?auto_717213 ) ) ( not ( = ?auto_717203 ?auto_717214 ) ) ( not ( = ?auto_717203 ?auto_717215 ) ) ( not ( = ?auto_717203 ?auto_717216 ) ) ( not ( = ?auto_717203 ?auto_717217 ) ) ( not ( = ?auto_717203 ?auto_717218 ) ) ( not ( = ?auto_717204 ?auto_717205 ) ) ( not ( = ?auto_717204 ?auto_717206 ) ) ( not ( = ?auto_717204 ?auto_717207 ) ) ( not ( = ?auto_717204 ?auto_717208 ) ) ( not ( = ?auto_717204 ?auto_717209 ) ) ( not ( = ?auto_717204 ?auto_717210 ) ) ( not ( = ?auto_717204 ?auto_717211 ) ) ( not ( = ?auto_717204 ?auto_717212 ) ) ( not ( = ?auto_717204 ?auto_717213 ) ) ( not ( = ?auto_717204 ?auto_717214 ) ) ( not ( = ?auto_717204 ?auto_717215 ) ) ( not ( = ?auto_717204 ?auto_717216 ) ) ( not ( = ?auto_717204 ?auto_717217 ) ) ( not ( = ?auto_717204 ?auto_717218 ) ) ( not ( = ?auto_717205 ?auto_717206 ) ) ( not ( = ?auto_717205 ?auto_717207 ) ) ( not ( = ?auto_717205 ?auto_717208 ) ) ( not ( = ?auto_717205 ?auto_717209 ) ) ( not ( = ?auto_717205 ?auto_717210 ) ) ( not ( = ?auto_717205 ?auto_717211 ) ) ( not ( = ?auto_717205 ?auto_717212 ) ) ( not ( = ?auto_717205 ?auto_717213 ) ) ( not ( = ?auto_717205 ?auto_717214 ) ) ( not ( = ?auto_717205 ?auto_717215 ) ) ( not ( = ?auto_717205 ?auto_717216 ) ) ( not ( = ?auto_717205 ?auto_717217 ) ) ( not ( = ?auto_717205 ?auto_717218 ) ) ( not ( = ?auto_717206 ?auto_717207 ) ) ( not ( = ?auto_717206 ?auto_717208 ) ) ( not ( = ?auto_717206 ?auto_717209 ) ) ( not ( = ?auto_717206 ?auto_717210 ) ) ( not ( = ?auto_717206 ?auto_717211 ) ) ( not ( = ?auto_717206 ?auto_717212 ) ) ( not ( = ?auto_717206 ?auto_717213 ) ) ( not ( = ?auto_717206 ?auto_717214 ) ) ( not ( = ?auto_717206 ?auto_717215 ) ) ( not ( = ?auto_717206 ?auto_717216 ) ) ( not ( = ?auto_717206 ?auto_717217 ) ) ( not ( = ?auto_717206 ?auto_717218 ) ) ( not ( = ?auto_717207 ?auto_717208 ) ) ( not ( = ?auto_717207 ?auto_717209 ) ) ( not ( = ?auto_717207 ?auto_717210 ) ) ( not ( = ?auto_717207 ?auto_717211 ) ) ( not ( = ?auto_717207 ?auto_717212 ) ) ( not ( = ?auto_717207 ?auto_717213 ) ) ( not ( = ?auto_717207 ?auto_717214 ) ) ( not ( = ?auto_717207 ?auto_717215 ) ) ( not ( = ?auto_717207 ?auto_717216 ) ) ( not ( = ?auto_717207 ?auto_717217 ) ) ( not ( = ?auto_717207 ?auto_717218 ) ) ( not ( = ?auto_717208 ?auto_717209 ) ) ( not ( = ?auto_717208 ?auto_717210 ) ) ( not ( = ?auto_717208 ?auto_717211 ) ) ( not ( = ?auto_717208 ?auto_717212 ) ) ( not ( = ?auto_717208 ?auto_717213 ) ) ( not ( = ?auto_717208 ?auto_717214 ) ) ( not ( = ?auto_717208 ?auto_717215 ) ) ( not ( = ?auto_717208 ?auto_717216 ) ) ( not ( = ?auto_717208 ?auto_717217 ) ) ( not ( = ?auto_717208 ?auto_717218 ) ) ( not ( = ?auto_717209 ?auto_717210 ) ) ( not ( = ?auto_717209 ?auto_717211 ) ) ( not ( = ?auto_717209 ?auto_717212 ) ) ( not ( = ?auto_717209 ?auto_717213 ) ) ( not ( = ?auto_717209 ?auto_717214 ) ) ( not ( = ?auto_717209 ?auto_717215 ) ) ( not ( = ?auto_717209 ?auto_717216 ) ) ( not ( = ?auto_717209 ?auto_717217 ) ) ( not ( = ?auto_717209 ?auto_717218 ) ) ( not ( = ?auto_717210 ?auto_717211 ) ) ( not ( = ?auto_717210 ?auto_717212 ) ) ( not ( = ?auto_717210 ?auto_717213 ) ) ( not ( = ?auto_717210 ?auto_717214 ) ) ( not ( = ?auto_717210 ?auto_717215 ) ) ( not ( = ?auto_717210 ?auto_717216 ) ) ( not ( = ?auto_717210 ?auto_717217 ) ) ( not ( = ?auto_717210 ?auto_717218 ) ) ( not ( = ?auto_717211 ?auto_717212 ) ) ( not ( = ?auto_717211 ?auto_717213 ) ) ( not ( = ?auto_717211 ?auto_717214 ) ) ( not ( = ?auto_717211 ?auto_717215 ) ) ( not ( = ?auto_717211 ?auto_717216 ) ) ( not ( = ?auto_717211 ?auto_717217 ) ) ( not ( = ?auto_717211 ?auto_717218 ) ) ( not ( = ?auto_717212 ?auto_717213 ) ) ( not ( = ?auto_717212 ?auto_717214 ) ) ( not ( = ?auto_717212 ?auto_717215 ) ) ( not ( = ?auto_717212 ?auto_717216 ) ) ( not ( = ?auto_717212 ?auto_717217 ) ) ( not ( = ?auto_717212 ?auto_717218 ) ) ( not ( = ?auto_717213 ?auto_717214 ) ) ( not ( = ?auto_717213 ?auto_717215 ) ) ( not ( = ?auto_717213 ?auto_717216 ) ) ( not ( = ?auto_717213 ?auto_717217 ) ) ( not ( = ?auto_717213 ?auto_717218 ) ) ( not ( = ?auto_717214 ?auto_717215 ) ) ( not ( = ?auto_717214 ?auto_717216 ) ) ( not ( = ?auto_717214 ?auto_717217 ) ) ( not ( = ?auto_717214 ?auto_717218 ) ) ( not ( = ?auto_717215 ?auto_717216 ) ) ( not ( = ?auto_717215 ?auto_717217 ) ) ( not ( = ?auto_717215 ?auto_717218 ) ) ( not ( = ?auto_717216 ?auto_717217 ) ) ( not ( = ?auto_717216 ?auto_717218 ) ) ( not ( = ?auto_717217 ?auto_717218 ) ) ( ON ?auto_717216 ?auto_717217 ) ( ON ?auto_717215 ?auto_717216 ) ( ON ?auto_717214 ?auto_717215 ) ( ON ?auto_717213 ?auto_717214 ) ( ON ?auto_717212 ?auto_717213 ) ( ON ?auto_717211 ?auto_717212 ) ( ON ?auto_717210 ?auto_717211 ) ( ON ?auto_717209 ?auto_717210 ) ( ON ?auto_717208 ?auto_717209 ) ( ON ?auto_717207 ?auto_717208 ) ( ON ?auto_717206 ?auto_717207 ) ( ON ?auto_717205 ?auto_717206 ) ( ON ?auto_717204 ?auto_717205 ) ( ON ?auto_717203 ?auto_717204 ) ( ON ?auto_717202 ?auto_717203 ) ( ON ?auto_717201 ?auto_717202 ) ( CLEAR ?auto_717201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717201 )
      ( MAKE-17PILE ?auto_717201 ?auto_717202 ?auto_717203 ?auto_717204 ?auto_717205 ?auto_717206 ?auto_717207 ?auto_717208 ?auto_717209 ?auto_717210 ?auto_717211 ?auto_717212 ?auto_717213 ?auto_717214 ?auto_717215 ?auto_717216 ?auto_717217 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717236 - BLOCK
      ?auto_717237 - BLOCK
      ?auto_717238 - BLOCK
      ?auto_717239 - BLOCK
      ?auto_717240 - BLOCK
      ?auto_717241 - BLOCK
      ?auto_717242 - BLOCK
      ?auto_717243 - BLOCK
      ?auto_717244 - BLOCK
      ?auto_717245 - BLOCK
      ?auto_717246 - BLOCK
      ?auto_717247 - BLOCK
      ?auto_717248 - BLOCK
      ?auto_717249 - BLOCK
      ?auto_717250 - BLOCK
      ?auto_717251 - BLOCK
      ?auto_717252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_717252 ) ( not ( = ?auto_717236 ?auto_717237 ) ) ( not ( = ?auto_717236 ?auto_717238 ) ) ( not ( = ?auto_717236 ?auto_717239 ) ) ( not ( = ?auto_717236 ?auto_717240 ) ) ( not ( = ?auto_717236 ?auto_717241 ) ) ( not ( = ?auto_717236 ?auto_717242 ) ) ( not ( = ?auto_717236 ?auto_717243 ) ) ( not ( = ?auto_717236 ?auto_717244 ) ) ( not ( = ?auto_717236 ?auto_717245 ) ) ( not ( = ?auto_717236 ?auto_717246 ) ) ( not ( = ?auto_717236 ?auto_717247 ) ) ( not ( = ?auto_717236 ?auto_717248 ) ) ( not ( = ?auto_717236 ?auto_717249 ) ) ( not ( = ?auto_717236 ?auto_717250 ) ) ( not ( = ?auto_717236 ?auto_717251 ) ) ( not ( = ?auto_717236 ?auto_717252 ) ) ( not ( = ?auto_717237 ?auto_717238 ) ) ( not ( = ?auto_717237 ?auto_717239 ) ) ( not ( = ?auto_717237 ?auto_717240 ) ) ( not ( = ?auto_717237 ?auto_717241 ) ) ( not ( = ?auto_717237 ?auto_717242 ) ) ( not ( = ?auto_717237 ?auto_717243 ) ) ( not ( = ?auto_717237 ?auto_717244 ) ) ( not ( = ?auto_717237 ?auto_717245 ) ) ( not ( = ?auto_717237 ?auto_717246 ) ) ( not ( = ?auto_717237 ?auto_717247 ) ) ( not ( = ?auto_717237 ?auto_717248 ) ) ( not ( = ?auto_717237 ?auto_717249 ) ) ( not ( = ?auto_717237 ?auto_717250 ) ) ( not ( = ?auto_717237 ?auto_717251 ) ) ( not ( = ?auto_717237 ?auto_717252 ) ) ( not ( = ?auto_717238 ?auto_717239 ) ) ( not ( = ?auto_717238 ?auto_717240 ) ) ( not ( = ?auto_717238 ?auto_717241 ) ) ( not ( = ?auto_717238 ?auto_717242 ) ) ( not ( = ?auto_717238 ?auto_717243 ) ) ( not ( = ?auto_717238 ?auto_717244 ) ) ( not ( = ?auto_717238 ?auto_717245 ) ) ( not ( = ?auto_717238 ?auto_717246 ) ) ( not ( = ?auto_717238 ?auto_717247 ) ) ( not ( = ?auto_717238 ?auto_717248 ) ) ( not ( = ?auto_717238 ?auto_717249 ) ) ( not ( = ?auto_717238 ?auto_717250 ) ) ( not ( = ?auto_717238 ?auto_717251 ) ) ( not ( = ?auto_717238 ?auto_717252 ) ) ( not ( = ?auto_717239 ?auto_717240 ) ) ( not ( = ?auto_717239 ?auto_717241 ) ) ( not ( = ?auto_717239 ?auto_717242 ) ) ( not ( = ?auto_717239 ?auto_717243 ) ) ( not ( = ?auto_717239 ?auto_717244 ) ) ( not ( = ?auto_717239 ?auto_717245 ) ) ( not ( = ?auto_717239 ?auto_717246 ) ) ( not ( = ?auto_717239 ?auto_717247 ) ) ( not ( = ?auto_717239 ?auto_717248 ) ) ( not ( = ?auto_717239 ?auto_717249 ) ) ( not ( = ?auto_717239 ?auto_717250 ) ) ( not ( = ?auto_717239 ?auto_717251 ) ) ( not ( = ?auto_717239 ?auto_717252 ) ) ( not ( = ?auto_717240 ?auto_717241 ) ) ( not ( = ?auto_717240 ?auto_717242 ) ) ( not ( = ?auto_717240 ?auto_717243 ) ) ( not ( = ?auto_717240 ?auto_717244 ) ) ( not ( = ?auto_717240 ?auto_717245 ) ) ( not ( = ?auto_717240 ?auto_717246 ) ) ( not ( = ?auto_717240 ?auto_717247 ) ) ( not ( = ?auto_717240 ?auto_717248 ) ) ( not ( = ?auto_717240 ?auto_717249 ) ) ( not ( = ?auto_717240 ?auto_717250 ) ) ( not ( = ?auto_717240 ?auto_717251 ) ) ( not ( = ?auto_717240 ?auto_717252 ) ) ( not ( = ?auto_717241 ?auto_717242 ) ) ( not ( = ?auto_717241 ?auto_717243 ) ) ( not ( = ?auto_717241 ?auto_717244 ) ) ( not ( = ?auto_717241 ?auto_717245 ) ) ( not ( = ?auto_717241 ?auto_717246 ) ) ( not ( = ?auto_717241 ?auto_717247 ) ) ( not ( = ?auto_717241 ?auto_717248 ) ) ( not ( = ?auto_717241 ?auto_717249 ) ) ( not ( = ?auto_717241 ?auto_717250 ) ) ( not ( = ?auto_717241 ?auto_717251 ) ) ( not ( = ?auto_717241 ?auto_717252 ) ) ( not ( = ?auto_717242 ?auto_717243 ) ) ( not ( = ?auto_717242 ?auto_717244 ) ) ( not ( = ?auto_717242 ?auto_717245 ) ) ( not ( = ?auto_717242 ?auto_717246 ) ) ( not ( = ?auto_717242 ?auto_717247 ) ) ( not ( = ?auto_717242 ?auto_717248 ) ) ( not ( = ?auto_717242 ?auto_717249 ) ) ( not ( = ?auto_717242 ?auto_717250 ) ) ( not ( = ?auto_717242 ?auto_717251 ) ) ( not ( = ?auto_717242 ?auto_717252 ) ) ( not ( = ?auto_717243 ?auto_717244 ) ) ( not ( = ?auto_717243 ?auto_717245 ) ) ( not ( = ?auto_717243 ?auto_717246 ) ) ( not ( = ?auto_717243 ?auto_717247 ) ) ( not ( = ?auto_717243 ?auto_717248 ) ) ( not ( = ?auto_717243 ?auto_717249 ) ) ( not ( = ?auto_717243 ?auto_717250 ) ) ( not ( = ?auto_717243 ?auto_717251 ) ) ( not ( = ?auto_717243 ?auto_717252 ) ) ( not ( = ?auto_717244 ?auto_717245 ) ) ( not ( = ?auto_717244 ?auto_717246 ) ) ( not ( = ?auto_717244 ?auto_717247 ) ) ( not ( = ?auto_717244 ?auto_717248 ) ) ( not ( = ?auto_717244 ?auto_717249 ) ) ( not ( = ?auto_717244 ?auto_717250 ) ) ( not ( = ?auto_717244 ?auto_717251 ) ) ( not ( = ?auto_717244 ?auto_717252 ) ) ( not ( = ?auto_717245 ?auto_717246 ) ) ( not ( = ?auto_717245 ?auto_717247 ) ) ( not ( = ?auto_717245 ?auto_717248 ) ) ( not ( = ?auto_717245 ?auto_717249 ) ) ( not ( = ?auto_717245 ?auto_717250 ) ) ( not ( = ?auto_717245 ?auto_717251 ) ) ( not ( = ?auto_717245 ?auto_717252 ) ) ( not ( = ?auto_717246 ?auto_717247 ) ) ( not ( = ?auto_717246 ?auto_717248 ) ) ( not ( = ?auto_717246 ?auto_717249 ) ) ( not ( = ?auto_717246 ?auto_717250 ) ) ( not ( = ?auto_717246 ?auto_717251 ) ) ( not ( = ?auto_717246 ?auto_717252 ) ) ( not ( = ?auto_717247 ?auto_717248 ) ) ( not ( = ?auto_717247 ?auto_717249 ) ) ( not ( = ?auto_717247 ?auto_717250 ) ) ( not ( = ?auto_717247 ?auto_717251 ) ) ( not ( = ?auto_717247 ?auto_717252 ) ) ( not ( = ?auto_717248 ?auto_717249 ) ) ( not ( = ?auto_717248 ?auto_717250 ) ) ( not ( = ?auto_717248 ?auto_717251 ) ) ( not ( = ?auto_717248 ?auto_717252 ) ) ( not ( = ?auto_717249 ?auto_717250 ) ) ( not ( = ?auto_717249 ?auto_717251 ) ) ( not ( = ?auto_717249 ?auto_717252 ) ) ( not ( = ?auto_717250 ?auto_717251 ) ) ( not ( = ?auto_717250 ?auto_717252 ) ) ( not ( = ?auto_717251 ?auto_717252 ) ) ( ON ?auto_717251 ?auto_717252 ) ( ON ?auto_717250 ?auto_717251 ) ( ON ?auto_717249 ?auto_717250 ) ( ON ?auto_717248 ?auto_717249 ) ( ON ?auto_717247 ?auto_717248 ) ( ON ?auto_717246 ?auto_717247 ) ( ON ?auto_717245 ?auto_717246 ) ( ON ?auto_717244 ?auto_717245 ) ( ON ?auto_717243 ?auto_717244 ) ( ON ?auto_717242 ?auto_717243 ) ( ON ?auto_717241 ?auto_717242 ) ( ON ?auto_717240 ?auto_717241 ) ( ON ?auto_717239 ?auto_717240 ) ( ON ?auto_717238 ?auto_717239 ) ( ON ?auto_717237 ?auto_717238 ) ( ON ?auto_717236 ?auto_717237 ) ( CLEAR ?auto_717236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_717236 )
      ( MAKE-17PILE ?auto_717236 ?auto_717237 ?auto_717238 ?auto_717239 ?auto_717240 ?auto_717241 ?auto_717242 ?auto_717243 ?auto_717244 ?auto_717245 ?auto_717246 ?auto_717247 ?auto_717248 ?auto_717249 ?auto_717250 ?auto_717251 ?auto_717252 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_717270 - BLOCK
      ?auto_717271 - BLOCK
      ?auto_717272 - BLOCK
      ?auto_717273 - BLOCK
      ?auto_717274 - BLOCK
      ?auto_717275 - BLOCK
      ?auto_717276 - BLOCK
      ?auto_717277 - BLOCK
      ?auto_717278 - BLOCK
      ?auto_717279 - BLOCK
      ?auto_717280 - BLOCK
      ?auto_717281 - BLOCK
      ?auto_717282 - BLOCK
      ?auto_717283 - BLOCK
      ?auto_717284 - BLOCK
      ?auto_717285 - BLOCK
      ?auto_717286 - BLOCK
    )
    :vars
    (
      ?auto_717287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_717270 ?auto_717271 ) ) ( not ( = ?auto_717270 ?auto_717272 ) ) ( not ( = ?auto_717270 ?auto_717273 ) ) ( not ( = ?auto_717270 ?auto_717274 ) ) ( not ( = ?auto_717270 ?auto_717275 ) ) ( not ( = ?auto_717270 ?auto_717276 ) ) ( not ( = ?auto_717270 ?auto_717277 ) ) ( not ( = ?auto_717270 ?auto_717278 ) ) ( not ( = ?auto_717270 ?auto_717279 ) ) ( not ( = ?auto_717270 ?auto_717280 ) ) ( not ( = ?auto_717270 ?auto_717281 ) ) ( not ( = ?auto_717270 ?auto_717282 ) ) ( not ( = ?auto_717270 ?auto_717283 ) ) ( not ( = ?auto_717270 ?auto_717284 ) ) ( not ( = ?auto_717270 ?auto_717285 ) ) ( not ( = ?auto_717270 ?auto_717286 ) ) ( not ( = ?auto_717271 ?auto_717272 ) ) ( not ( = ?auto_717271 ?auto_717273 ) ) ( not ( = ?auto_717271 ?auto_717274 ) ) ( not ( = ?auto_717271 ?auto_717275 ) ) ( not ( = ?auto_717271 ?auto_717276 ) ) ( not ( = ?auto_717271 ?auto_717277 ) ) ( not ( = ?auto_717271 ?auto_717278 ) ) ( not ( = ?auto_717271 ?auto_717279 ) ) ( not ( = ?auto_717271 ?auto_717280 ) ) ( not ( = ?auto_717271 ?auto_717281 ) ) ( not ( = ?auto_717271 ?auto_717282 ) ) ( not ( = ?auto_717271 ?auto_717283 ) ) ( not ( = ?auto_717271 ?auto_717284 ) ) ( not ( = ?auto_717271 ?auto_717285 ) ) ( not ( = ?auto_717271 ?auto_717286 ) ) ( not ( = ?auto_717272 ?auto_717273 ) ) ( not ( = ?auto_717272 ?auto_717274 ) ) ( not ( = ?auto_717272 ?auto_717275 ) ) ( not ( = ?auto_717272 ?auto_717276 ) ) ( not ( = ?auto_717272 ?auto_717277 ) ) ( not ( = ?auto_717272 ?auto_717278 ) ) ( not ( = ?auto_717272 ?auto_717279 ) ) ( not ( = ?auto_717272 ?auto_717280 ) ) ( not ( = ?auto_717272 ?auto_717281 ) ) ( not ( = ?auto_717272 ?auto_717282 ) ) ( not ( = ?auto_717272 ?auto_717283 ) ) ( not ( = ?auto_717272 ?auto_717284 ) ) ( not ( = ?auto_717272 ?auto_717285 ) ) ( not ( = ?auto_717272 ?auto_717286 ) ) ( not ( = ?auto_717273 ?auto_717274 ) ) ( not ( = ?auto_717273 ?auto_717275 ) ) ( not ( = ?auto_717273 ?auto_717276 ) ) ( not ( = ?auto_717273 ?auto_717277 ) ) ( not ( = ?auto_717273 ?auto_717278 ) ) ( not ( = ?auto_717273 ?auto_717279 ) ) ( not ( = ?auto_717273 ?auto_717280 ) ) ( not ( = ?auto_717273 ?auto_717281 ) ) ( not ( = ?auto_717273 ?auto_717282 ) ) ( not ( = ?auto_717273 ?auto_717283 ) ) ( not ( = ?auto_717273 ?auto_717284 ) ) ( not ( = ?auto_717273 ?auto_717285 ) ) ( not ( = ?auto_717273 ?auto_717286 ) ) ( not ( = ?auto_717274 ?auto_717275 ) ) ( not ( = ?auto_717274 ?auto_717276 ) ) ( not ( = ?auto_717274 ?auto_717277 ) ) ( not ( = ?auto_717274 ?auto_717278 ) ) ( not ( = ?auto_717274 ?auto_717279 ) ) ( not ( = ?auto_717274 ?auto_717280 ) ) ( not ( = ?auto_717274 ?auto_717281 ) ) ( not ( = ?auto_717274 ?auto_717282 ) ) ( not ( = ?auto_717274 ?auto_717283 ) ) ( not ( = ?auto_717274 ?auto_717284 ) ) ( not ( = ?auto_717274 ?auto_717285 ) ) ( not ( = ?auto_717274 ?auto_717286 ) ) ( not ( = ?auto_717275 ?auto_717276 ) ) ( not ( = ?auto_717275 ?auto_717277 ) ) ( not ( = ?auto_717275 ?auto_717278 ) ) ( not ( = ?auto_717275 ?auto_717279 ) ) ( not ( = ?auto_717275 ?auto_717280 ) ) ( not ( = ?auto_717275 ?auto_717281 ) ) ( not ( = ?auto_717275 ?auto_717282 ) ) ( not ( = ?auto_717275 ?auto_717283 ) ) ( not ( = ?auto_717275 ?auto_717284 ) ) ( not ( = ?auto_717275 ?auto_717285 ) ) ( not ( = ?auto_717275 ?auto_717286 ) ) ( not ( = ?auto_717276 ?auto_717277 ) ) ( not ( = ?auto_717276 ?auto_717278 ) ) ( not ( = ?auto_717276 ?auto_717279 ) ) ( not ( = ?auto_717276 ?auto_717280 ) ) ( not ( = ?auto_717276 ?auto_717281 ) ) ( not ( = ?auto_717276 ?auto_717282 ) ) ( not ( = ?auto_717276 ?auto_717283 ) ) ( not ( = ?auto_717276 ?auto_717284 ) ) ( not ( = ?auto_717276 ?auto_717285 ) ) ( not ( = ?auto_717276 ?auto_717286 ) ) ( not ( = ?auto_717277 ?auto_717278 ) ) ( not ( = ?auto_717277 ?auto_717279 ) ) ( not ( = ?auto_717277 ?auto_717280 ) ) ( not ( = ?auto_717277 ?auto_717281 ) ) ( not ( = ?auto_717277 ?auto_717282 ) ) ( not ( = ?auto_717277 ?auto_717283 ) ) ( not ( = ?auto_717277 ?auto_717284 ) ) ( not ( = ?auto_717277 ?auto_717285 ) ) ( not ( = ?auto_717277 ?auto_717286 ) ) ( not ( = ?auto_717278 ?auto_717279 ) ) ( not ( = ?auto_717278 ?auto_717280 ) ) ( not ( = ?auto_717278 ?auto_717281 ) ) ( not ( = ?auto_717278 ?auto_717282 ) ) ( not ( = ?auto_717278 ?auto_717283 ) ) ( not ( = ?auto_717278 ?auto_717284 ) ) ( not ( = ?auto_717278 ?auto_717285 ) ) ( not ( = ?auto_717278 ?auto_717286 ) ) ( not ( = ?auto_717279 ?auto_717280 ) ) ( not ( = ?auto_717279 ?auto_717281 ) ) ( not ( = ?auto_717279 ?auto_717282 ) ) ( not ( = ?auto_717279 ?auto_717283 ) ) ( not ( = ?auto_717279 ?auto_717284 ) ) ( not ( = ?auto_717279 ?auto_717285 ) ) ( not ( = ?auto_717279 ?auto_717286 ) ) ( not ( = ?auto_717280 ?auto_717281 ) ) ( not ( = ?auto_717280 ?auto_717282 ) ) ( not ( = ?auto_717280 ?auto_717283 ) ) ( not ( = ?auto_717280 ?auto_717284 ) ) ( not ( = ?auto_717280 ?auto_717285 ) ) ( not ( = ?auto_717280 ?auto_717286 ) ) ( not ( = ?auto_717281 ?auto_717282 ) ) ( not ( = ?auto_717281 ?auto_717283 ) ) ( not ( = ?auto_717281 ?auto_717284 ) ) ( not ( = ?auto_717281 ?auto_717285 ) ) ( not ( = ?auto_717281 ?auto_717286 ) ) ( not ( = ?auto_717282 ?auto_717283 ) ) ( not ( = ?auto_717282 ?auto_717284 ) ) ( not ( = ?auto_717282 ?auto_717285 ) ) ( not ( = ?auto_717282 ?auto_717286 ) ) ( not ( = ?auto_717283 ?auto_717284 ) ) ( not ( = ?auto_717283 ?auto_717285 ) ) ( not ( = ?auto_717283 ?auto_717286 ) ) ( not ( = ?auto_717284 ?auto_717285 ) ) ( not ( = ?auto_717284 ?auto_717286 ) ) ( not ( = ?auto_717285 ?auto_717286 ) ) ( ON ?auto_717270 ?auto_717287 ) ( not ( = ?auto_717286 ?auto_717287 ) ) ( not ( = ?auto_717285 ?auto_717287 ) ) ( not ( = ?auto_717284 ?auto_717287 ) ) ( not ( = ?auto_717283 ?auto_717287 ) ) ( not ( = ?auto_717282 ?auto_717287 ) ) ( not ( = ?auto_717281 ?auto_717287 ) ) ( not ( = ?auto_717280 ?auto_717287 ) ) ( not ( = ?auto_717279 ?auto_717287 ) ) ( not ( = ?auto_717278 ?auto_717287 ) ) ( not ( = ?auto_717277 ?auto_717287 ) ) ( not ( = ?auto_717276 ?auto_717287 ) ) ( not ( = ?auto_717275 ?auto_717287 ) ) ( not ( = ?auto_717274 ?auto_717287 ) ) ( not ( = ?auto_717273 ?auto_717287 ) ) ( not ( = ?auto_717272 ?auto_717287 ) ) ( not ( = ?auto_717271 ?auto_717287 ) ) ( not ( = ?auto_717270 ?auto_717287 ) ) ( ON ?auto_717271 ?auto_717270 ) ( ON ?auto_717272 ?auto_717271 ) ( ON ?auto_717273 ?auto_717272 ) ( ON ?auto_717274 ?auto_717273 ) ( ON ?auto_717275 ?auto_717274 ) ( ON ?auto_717276 ?auto_717275 ) ( ON ?auto_717277 ?auto_717276 ) ( ON ?auto_717278 ?auto_717277 ) ( ON ?auto_717279 ?auto_717278 ) ( ON ?auto_717280 ?auto_717279 ) ( ON ?auto_717281 ?auto_717280 ) ( ON ?auto_717282 ?auto_717281 ) ( ON ?auto_717283 ?auto_717282 ) ( ON ?auto_717284 ?auto_717283 ) ( ON ?auto_717285 ?auto_717284 ) ( ON ?auto_717286 ?auto_717285 ) ( CLEAR ?auto_717286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_717286 ?auto_717285 ?auto_717284 ?auto_717283 ?auto_717282 ?auto_717281 ?auto_717280 ?auto_717279 ?auto_717278 ?auto_717277 ?auto_717276 ?auto_717275 ?auto_717274 ?auto_717273 ?auto_717272 ?auto_717271 ?auto_717270 )
      ( MAKE-17PILE ?auto_717270 ?auto_717271 ?auto_717272 ?auto_717273 ?auto_717274 ?auto_717275 ?auto_717276 ?auto_717277 ?auto_717278 ?auto_717279 ?auto_717280 ?auto_717281 ?auto_717282 ?auto_717283 ?auto_717284 ?auto_717285 ?auto_717286 ) )
  )

)

