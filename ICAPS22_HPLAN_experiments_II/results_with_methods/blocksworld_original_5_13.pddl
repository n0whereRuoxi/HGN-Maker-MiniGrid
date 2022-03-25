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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_31861 - BLOCK
      ?auto_31862 - BLOCK
      ?auto_31863 - BLOCK
      ?auto_31864 - BLOCK
      ?auto_31865 - BLOCK
    )
    :vars
    (
      ?auto_31866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31866 ?auto_31865 ) ( CLEAR ?auto_31866 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31861 ) ( ON ?auto_31862 ?auto_31861 ) ( ON ?auto_31863 ?auto_31862 ) ( ON ?auto_31864 ?auto_31863 ) ( ON ?auto_31865 ?auto_31864 ) ( not ( = ?auto_31861 ?auto_31862 ) ) ( not ( = ?auto_31861 ?auto_31863 ) ) ( not ( = ?auto_31861 ?auto_31864 ) ) ( not ( = ?auto_31861 ?auto_31865 ) ) ( not ( = ?auto_31861 ?auto_31866 ) ) ( not ( = ?auto_31862 ?auto_31863 ) ) ( not ( = ?auto_31862 ?auto_31864 ) ) ( not ( = ?auto_31862 ?auto_31865 ) ) ( not ( = ?auto_31862 ?auto_31866 ) ) ( not ( = ?auto_31863 ?auto_31864 ) ) ( not ( = ?auto_31863 ?auto_31865 ) ) ( not ( = ?auto_31863 ?auto_31866 ) ) ( not ( = ?auto_31864 ?auto_31865 ) ) ( not ( = ?auto_31864 ?auto_31866 ) ) ( not ( = ?auto_31865 ?auto_31866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31866 ?auto_31865 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31868 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31868 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_31869 - BLOCK
    )
    :vars
    (
      ?auto_31870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31869 ?auto_31870 ) ( CLEAR ?auto_31869 ) ( HAND-EMPTY ) ( not ( = ?auto_31869 ?auto_31870 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31869 ?auto_31870 )
      ( MAKE-1PILE ?auto_31869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31875 - BLOCK
      ?auto_31876 - BLOCK
      ?auto_31877 - BLOCK
      ?auto_31878 - BLOCK
    )
    :vars
    (
      ?auto_31879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31879 ?auto_31878 ) ( CLEAR ?auto_31879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31875 ) ( ON ?auto_31876 ?auto_31875 ) ( ON ?auto_31877 ?auto_31876 ) ( ON ?auto_31878 ?auto_31877 ) ( not ( = ?auto_31875 ?auto_31876 ) ) ( not ( = ?auto_31875 ?auto_31877 ) ) ( not ( = ?auto_31875 ?auto_31878 ) ) ( not ( = ?auto_31875 ?auto_31879 ) ) ( not ( = ?auto_31876 ?auto_31877 ) ) ( not ( = ?auto_31876 ?auto_31878 ) ) ( not ( = ?auto_31876 ?auto_31879 ) ) ( not ( = ?auto_31877 ?auto_31878 ) ) ( not ( = ?auto_31877 ?auto_31879 ) ) ( not ( = ?auto_31878 ?auto_31879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31879 ?auto_31878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31880 - BLOCK
      ?auto_31881 - BLOCK
      ?auto_31882 - BLOCK
      ?auto_31883 - BLOCK
    )
    :vars
    (
      ?auto_31884 - BLOCK
      ?auto_31885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31884 ?auto_31883 ) ( CLEAR ?auto_31884 ) ( ON-TABLE ?auto_31880 ) ( ON ?auto_31881 ?auto_31880 ) ( ON ?auto_31882 ?auto_31881 ) ( ON ?auto_31883 ?auto_31882 ) ( not ( = ?auto_31880 ?auto_31881 ) ) ( not ( = ?auto_31880 ?auto_31882 ) ) ( not ( = ?auto_31880 ?auto_31883 ) ) ( not ( = ?auto_31880 ?auto_31884 ) ) ( not ( = ?auto_31881 ?auto_31882 ) ) ( not ( = ?auto_31881 ?auto_31883 ) ) ( not ( = ?auto_31881 ?auto_31884 ) ) ( not ( = ?auto_31882 ?auto_31883 ) ) ( not ( = ?auto_31882 ?auto_31884 ) ) ( not ( = ?auto_31883 ?auto_31884 ) ) ( HOLDING ?auto_31885 ) ( not ( = ?auto_31880 ?auto_31885 ) ) ( not ( = ?auto_31881 ?auto_31885 ) ) ( not ( = ?auto_31882 ?auto_31885 ) ) ( not ( = ?auto_31883 ?auto_31885 ) ) ( not ( = ?auto_31884 ?auto_31885 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_31885 )
      ( MAKE-4PILE ?auto_31880 ?auto_31881 ?auto_31882 ?auto_31883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_31886 - BLOCK
      ?auto_31887 - BLOCK
      ?auto_31888 - BLOCK
      ?auto_31889 - BLOCK
    )
    :vars
    (
      ?auto_31890 - BLOCK
      ?auto_31891 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31890 ?auto_31889 ) ( ON-TABLE ?auto_31886 ) ( ON ?auto_31887 ?auto_31886 ) ( ON ?auto_31888 ?auto_31887 ) ( ON ?auto_31889 ?auto_31888 ) ( not ( = ?auto_31886 ?auto_31887 ) ) ( not ( = ?auto_31886 ?auto_31888 ) ) ( not ( = ?auto_31886 ?auto_31889 ) ) ( not ( = ?auto_31886 ?auto_31890 ) ) ( not ( = ?auto_31887 ?auto_31888 ) ) ( not ( = ?auto_31887 ?auto_31889 ) ) ( not ( = ?auto_31887 ?auto_31890 ) ) ( not ( = ?auto_31888 ?auto_31889 ) ) ( not ( = ?auto_31888 ?auto_31890 ) ) ( not ( = ?auto_31889 ?auto_31890 ) ) ( not ( = ?auto_31886 ?auto_31891 ) ) ( not ( = ?auto_31887 ?auto_31891 ) ) ( not ( = ?auto_31888 ?auto_31891 ) ) ( not ( = ?auto_31889 ?auto_31891 ) ) ( not ( = ?auto_31890 ?auto_31891 ) ) ( ON ?auto_31891 ?auto_31890 ) ( CLEAR ?auto_31891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31886 ?auto_31887 ?auto_31888 ?auto_31889 ?auto_31890 )
      ( MAKE-4PILE ?auto_31886 ?auto_31887 ?auto_31888 ?auto_31889 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31894 - BLOCK
      ?auto_31895 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31895 ) ( CLEAR ?auto_31894 ) ( ON-TABLE ?auto_31894 ) ( not ( = ?auto_31894 ?auto_31895 ) ) )
    :subtasks
    ( ( !STACK ?auto_31895 ?auto_31894 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31896 - BLOCK
      ?auto_31897 - BLOCK
    )
    :vars
    (
      ?auto_31898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31896 ) ( ON-TABLE ?auto_31896 ) ( not ( = ?auto_31896 ?auto_31897 ) ) ( ON ?auto_31897 ?auto_31898 ) ( CLEAR ?auto_31897 ) ( HAND-EMPTY ) ( not ( = ?auto_31896 ?auto_31898 ) ) ( not ( = ?auto_31897 ?auto_31898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31897 ?auto_31898 )
      ( MAKE-2PILE ?auto_31896 ?auto_31897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31899 - BLOCK
      ?auto_31900 - BLOCK
    )
    :vars
    (
      ?auto_31901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31899 ?auto_31900 ) ) ( ON ?auto_31900 ?auto_31901 ) ( CLEAR ?auto_31900 ) ( not ( = ?auto_31899 ?auto_31901 ) ) ( not ( = ?auto_31900 ?auto_31901 ) ) ( HOLDING ?auto_31899 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31899 )
      ( MAKE-2PILE ?auto_31899 ?auto_31900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31902 - BLOCK
      ?auto_31903 - BLOCK
    )
    :vars
    (
      ?auto_31904 - BLOCK
      ?auto_31905 - BLOCK
      ?auto_31907 - BLOCK
      ?auto_31906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31902 ?auto_31903 ) ) ( ON ?auto_31903 ?auto_31904 ) ( not ( = ?auto_31902 ?auto_31904 ) ) ( not ( = ?auto_31903 ?auto_31904 ) ) ( ON ?auto_31902 ?auto_31903 ) ( CLEAR ?auto_31902 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31905 ) ( ON ?auto_31907 ?auto_31905 ) ( ON ?auto_31906 ?auto_31907 ) ( ON ?auto_31904 ?auto_31906 ) ( not ( = ?auto_31905 ?auto_31907 ) ) ( not ( = ?auto_31905 ?auto_31906 ) ) ( not ( = ?auto_31905 ?auto_31904 ) ) ( not ( = ?auto_31905 ?auto_31903 ) ) ( not ( = ?auto_31905 ?auto_31902 ) ) ( not ( = ?auto_31907 ?auto_31906 ) ) ( not ( = ?auto_31907 ?auto_31904 ) ) ( not ( = ?auto_31907 ?auto_31903 ) ) ( not ( = ?auto_31907 ?auto_31902 ) ) ( not ( = ?auto_31906 ?auto_31904 ) ) ( not ( = ?auto_31906 ?auto_31903 ) ) ( not ( = ?auto_31906 ?auto_31902 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31905 ?auto_31907 ?auto_31906 ?auto_31904 ?auto_31903 )
      ( MAKE-2PILE ?auto_31902 ?auto_31903 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31911 - BLOCK
      ?auto_31912 - BLOCK
      ?auto_31913 - BLOCK
    )
    :vars
    (
      ?auto_31914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31914 ?auto_31913 ) ( CLEAR ?auto_31914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31911 ) ( ON ?auto_31912 ?auto_31911 ) ( ON ?auto_31913 ?auto_31912 ) ( not ( = ?auto_31911 ?auto_31912 ) ) ( not ( = ?auto_31911 ?auto_31913 ) ) ( not ( = ?auto_31911 ?auto_31914 ) ) ( not ( = ?auto_31912 ?auto_31913 ) ) ( not ( = ?auto_31912 ?auto_31914 ) ) ( not ( = ?auto_31913 ?auto_31914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31914 ?auto_31913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31915 - BLOCK
      ?auto_31916 - BLOCK
      ?auto_31917 - BLOCK
    )
    :vars
    (
      ?auto_31918 - BLOCK
      ?auto_31919 - BLOCK
      ?auto_31920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31918 ?auto_31917 ) ( CLEAR ?auto_31918 ) ( ON-TABLE ?auto_31915 ) ( ON ?auto_31916 ?auto_31915 ) ( ON ?auto_31917 ?auto_31916 ) ( not ( = ?auto_31915 ?auto_31916 ) ) ( not ( = ?auto_31915 ?auto_31917 ) ) ( not ( = ?auto_31915 ?auto_31918 ) ) ( not ( = ?auto_31916 ?auto_31917 ) ) ( not ( = ?auto_31916 ?auto_31918 ) ) ( not ( = ?auto_31917 ?auto_31918 ) ) ( HOLDING ?auto_31919 ) ( CLEAR ?auto_31920 ) ( not ( = ?auto_31915 ?auto_31919 ) ) ( not ( = ?auto_31915 ?auto_31920 ) ) ( not ( = ?auto_31916 ?auto_31919 ) ) ( not ( = ?auto_31916 ?auto_31920 ) ) ( not ( = ?auto_31917 ?auto_31919 ) ) ( not ( = ?auto_31917 ?auto_31920 ) ) ( not ( = ?auto_31918 ?auto_31919 ) ) ( not ( = ?auto_31918 ?auto_31920 ) ) ( not ( = ?auto_31919 ?auto_31920 ) ) )
    :subtasks
    ( ( !STACK ?auto_31919 ?auto_31920 )
      ( MAKE-3PILE ?auto_31915 ?auto_31916 ?auto_31917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31921 - BLOCK
      ?auto_31922 - BLOCK
      ?auto_31923 - BLOCK
    )
    :vars
    (
      ?auto_31925 - BLOCK
      ?auto_31926 - BLOCK
      ?auto_31924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31925 ?auto_31923 ) ( ON-TABLE ?auto_31921 ) ( ON ?auto_31922 ?auto_31921 ) ( ON ?auto_31923 ?auto_31922 ) ( not ( = ?auto_31921 ?auto_31922 ) ) ( not ( = ?auto_31921 ?auto_31923 ) ) ( not ( = ?auto_31921 ?auto_31925 ) ) ( not ( = ?auto_31922 ?auto_31923 ) ) ( not ( = ?auto_31922 ?auto_31925 ) ) ( not ( = ?auto_31923 ?auto_31925 ) ) ( CLEAR ?auto_31926 ) ( not ( = ?auto_31921 ?auto_31924 ) ) ( not ( = ?auto_31921 ?auto_31926 ) ) ( not ( = ?auto_31922 ?auto_31924 ) ) ( not ( = ?auto_31922 ?auto_31926 ) ) ( not ( = ?auto_31923 ?auto_31924 ) ) ( not ( = ?auto_31923 ?auto_31926 ) ) ( not ( = ?auto_31925 ?auto_31924 ) ) ( not ( = ?auto_31925 ?auto_31926 ) ) ( not ( = ?auto_31924 ?auto_31926 ) ) ( ON ?auto_31924 ?auto_31925 ) ( CLEAR ?auto_31924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31921 ?auto_31922 ?auto_31923 ?auto_31925 )
      ( MAKE-3PILE ?auto_31921 ?auto_31922 ?auto_31923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31927 - BLOCK
      ?auto_31928 - BLOCK
      ?auto_31929 - BLOCK
    )
    :vars
    (
      ?auto_31931 - BLOCK
      ?auto_31932 - BLOCK
      ?auto_31930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31931 ?auto_31929 ) ( ON-TABLE ?auto_31927 ) ( ON ?auto_31928 ?auto_31927 ) ( ON ?auto_31929 ?auto_31928 ) ( not ( = ?auto_31927 ?auto_31928 ) ) ( not ( = ?auto_31927 ?auto_31929 ) ) ( not ( = ?auto_31927 ?auto_31931 ) ) ( not ( = ?auto_31928 ?auto_31929 ) ) ( not ( = ?auto_31928 ?auto_31931 ) ) ( not ( = ?auto_31929 ?auto_31931 ) ) ( not ( = ?auto_31927 ?auto_31932 ) ) ( not ( = ?auto_31927 ?auto_31930 ) ) ( not ( = ?auto_31928 ?auto_31932 ) ) ( not ( = ?auto_31928 ?auto_31930 ) ) ( not ( = ?auto_31929 ?auto_31932 ) ) ( not ( = ?auto_31929 ?auto_31930 ) ) ( not ( = ?auto_31931 ?auto_31932 ) ) ( not ( = ?auto_31931 ?auto_31930 ) ) ( not ( = ?auto_31932 ?auto_31930 ) ) ( ON ?auto_31932 ?auto_31931 ) ( CLEAR ?auto_31932 ) ( HOLDING ?auto_31930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31930 )
      ( MAKE-3PILE ?auto_31927 ?auto_31928 ?auto_31929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31933 - BLOCK
      ?auto_31934 - BLOCK
      ?auto_31935 - BLOCK
    )
    :vars
    (
      ?auto_31936 - BLOCK
      ?auto_31938 - BLOCK
      ?auto_31937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31936 ?auto_31935 ) ( ON-TABLE ?auto_31933 ) ( ON ?auto_31934 ?auto_31933 ) ( ON ?auto_31935 ?auto_31934 ) ( not ( = ?auto_31933 ?auto_31934 ) ) ( not ( = ?auto_31933 ?auto_31935 ) ) ( not ( = ?auto_31933 ?auto_31936 ) ) ( not ( = ?auto_31934 ?auto_31935 ) ) ( not ( = ?auto_31934 ?auto_31936 ) ) ( not ( = ?auto_31935 ?auto_31936 ) ) ( not ( = ?auto_31933 ?auto_31938 ) ) ( not ( = ?auto_31933 ?auto_31937 ) ) ( not ( = ?auto_31934 ?auto_31938 ) ) ( not ( = ?auto_31934 ?auto_31937 ) ) ( not ( = ?auto_31935 ?auto_31938 ) ) ( not ( = ?auto_31935 ?auto_31937 ) ) ( not ( = ?auto_31936 ?auto_31938 ) ) ( not ( = ?auto_31936 ?auto_31937 ) ) ( not ( = ?auto_31938 ?auto_31937 ) ) ( ON ?auto_31938 ?auto_31936 ) ( ON ?auto_31937 ?auto_31938 ) ( CLEAR ?auto_31937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31933 ?auto_31934 ?auto_31935 ?auto_31936 ?auto_31938 )
      ( MAKE-3PILE ?auto_31933 ?auto_31934 ?auto_31935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31942 - BLOCK
      ?auto_31943 - BLOCK
      ?auto_31944 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_31944 ) ( CLEAR ?auto_31943 ) ( ON-TABLE ?auto_31942 ) ( ON ?auto_31943 ?auto_31942 ) ( not ( = ?auto_31942 ?auto_31943 ) ) ( not ( = ?auto_31942 ?auto_31944 ) ) ( not ( = ?auto_31943 ?auto_31944 ) ) )
    :subtasks
    ( ( !STACK ?auto_31944 ?auto_31943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31945 - BLOCK
      ?auto_31946 - BLOCK
      ?auto_31947 - BLOCK
    )
    :vars
    (
      ?auto_31948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31946 ) ( ON-TABLE ?auto_31945 ) ( ON ?auto_31946 ?auto_31945 ) ( not ( = ?auto_31945 ?auto_31946 ) ) ( not ( = ?auto_31945 ?auto_31947 ) ) ( not ( = ?auto_31946 ?auto_31947 ) ) ( ON ?auto_31947 ?auto_31948 ) ( CLEAR ?auto_31947 ) ( HAND-EMPTY ) ( not ( = ?auto_31945 ?auto_31948 ) ) ( not ( = ?auto_31946 ?auto_31948 ) ) ( not ( = ?auto_31947 ?auto_31948 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31947 ?auto_31948 )
      ( MAKE-3PILE ?auto_31945 ?auto_31946 ?auto_31947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31949 - BLOCK
      ?auto_31950 - BLOCK
      ?auto_31951 - BLOCK
    )
    :vars
    (
      ?auto_31952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31949 ) ( not ( = ?auto_31949 ?auto_31950 ) ) ( not ( = ?auto_31949 ?auto_31951 ) ) ( not ( = ?auto_31950 ?auto_31951 ) ) ( ON ?auto_31951 ?auto_31952 ) ( CLEAR ?auto_31951 ) ( not ( = ?auto_31949 ?auto_31952 ) ) ( not ( = ?auto_31950 ?auto_31952 ) ) ( not ( = ?auto_31951 ?auto_31952 ) ) ( HOLDING ?auto_31950 ) ( CLEAR ?auto_31949 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31949 ?auto_31950 )
      ( MAKE-3PILE ?auto_31949 ?auto_31950 ?auto_31951 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31953 - BLOCK
      ?auto_31954 - BLOCK
      ?auto_31955 - BLOCK
    )
    :vars
    (
      ?auto_31956 - BLOCK
      ?auto_31957 - BLOCK
      ?auto_31958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_31953 ) ( not ( = ?auto_31953 ?auto_31954 ) ) ( not ( = ?auto_31953 ?auto_31955 ) ) ( not ( = ?auto_31954 ?auto_31955 ) ) ( ON ?auto_31955 ?auto_31956 ) ( not ( = ?auto_31953 ?auto_31956 ) ) ( not ( = ?auto_31954 ?auto_31956 ) ) ( not ( = ?auto_31955 ?auto_31956 ) ) ( CLEAR ?auto_31953 ) ( ON ?auto_31954 ?auto_31955 ) ( CLEAR ?auto_31954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31957 ) ( ON ?auto_31958 ?auto_31957 ) ( ON ?auto_31956 ?auto_31958 ) ( not ( = ?auto_31957 ?auto_31958 ) ) ( not ( = ?auto_31957 ?auto_31956 ) ) ( not ( = ?auto_31957 ?auto_31955 ) ) ( not ( = ?auto_31957 ?auto_31954 ) ) ( not ( = ?auto_31958 ?auto_31956 ) ) ( not ( = ?auto_31958 ?auto_31955 ) ) ( not ( = ?auto_31958 ?auto_31954 ) ) ( not ( = ?auto_31953 ?auto_31957 ) ) ( not ( = ?auto_31953 ?auto_31958 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31957 ?auto_31958 ?auto_31956 ?auto_31955 )
      ( MAKE-3PILE ?auto_31953 ?auto_31954 ?auto_31955 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31959 - BLOCK
      ?auto_31960 - BLOCK
      ?auto_31961 - BLOCK
    )
    :vars
    (
      ?auto_31962 - BLOCK
      ?auto_31964 - BLOCK
      ?auto_31963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31959 ?auto_31960 ) ) ( not ( = ?auto_31959 ?auto_31961 ) ) ( not ( = ?auto_31960 ?auto_31961 ) ) ( ON ?auto_31961 ?auto_31962 ) ( not ( = ?auto_31959 ?auto_31962 ) ) ( not ( = ?auto_31960 ?auto_31962 ) ) ( not ( = ?auto_31961 ?auto_31962 ) ) ( ON ?auto_31960 ?auto_31961 ) ( CLEAR ?auto_31960 ) ( ON-TABLE ?auto_31964 ) ( ON ?auto_31963 ?auto_31964 ) ( ON ?auto_31962 ?auto_31963 ) ( not ( = ?auto_31964 ?auto_31963 ) ) ( not ( = ?auto_31964 ?auto_31962 ) ) ( not ( = ?auto_31964 ?auto_31961 ) ) ( not ( = ?auto_31964 ?auto_31960 ) ) ( not ( = ?auto_31963 ?auto_31962 ) ) ( not ( = ?auto_31963 ?auto_31961 ) ) ( not ( = ?auto_31963 ?auto_31960 ) ) ( not ( = ?auto_31959 ?auto_31964 ) ) ( not ( = ?auto_31959 ?auto_31963 ) ) ( HOLDING ?auto_31959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_31959 )
      ( MAKE-3PILE ?auto_31959 ?auto_31960 ?auto_31961 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_31965 - BLOCK
      ?auto_31966 - BLOCK
      ?auto_31967 - BLOCK
    )
    :vars
    (
      ?auto_31968 - BLOCK
      ?auto_31969 - BLOCK
      ?auto_31970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_31965 ?auto_31966 ) ) ( not ( = ?auto_31965 ?auto_31967 ) ) ( not ( = ?auto_31966 ?auto_31967 ) ) ( ON ?auto_31967 ?auto_31968 ) ( not ( = ?auto_31965 ?auto_31968 ) ) ( not ( = ?auto_31966 ?auto_31968 ) ) ( not ( = ?auto_31967 ?auto_31968 ) ) ( ON ?auto_31966 ?auto_31967 ) ( ON-TABLE ?auto_31969 ) ( ON ?auto_31970 ?auto_31969 ) ( ON ?auto_31968 ?auto_31970 ) ( not ( = ?auto_31969 ?auto_31970 ) ) ( not ( = ?auto_31969 ?auto_31968 ) ) ( not ( = ?auto_31969 ?auto_31967 ) ) ( not ( = ?auto_31969 ?auto_31966 ) ) ( not ( = ?auto_31970 ?auto_31968 ) ) ( not ( = ?auto_31970 ?auto_31967 ) ) ( not ( = ?auto_31970 ?auto_31966 ) ) ( not ( = ?auto_31965 ?auto_31969 ) ) ( not ( = ?auto_31965 ?auto_31970 ) ) ( ON ?auto_31965 ?auto_31966 ) ( CLEAR ?auto_31965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_31969 ?auto_31970 ?auto_31968 ?auto_31967 ?auto_31966 )
      ( MAKE-3PILE ?auto_31965 ?auto_31966 ?auto_31967 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31973 - BLOCK
      ?auto_31974 - BLOCK
    )
    :vars
    (
      ?auto_31975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31975 ?auto_31974 ) ( CLEAR ?auto_31975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_31973 ) ( ON ?auto_31974 ?auto_31973 ) ( not ( = ?auto_31973 ?auto_31974 ) ) ( not ( = ?auto_31973 ?auto_31975 ) ) ( not ( = ?auto_31974 ?auto_31975 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_31975 ?auto_31974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31976 - BLOCK
      ?auto_31977 - BLOCK
    )
    :vars
    (
      ?auto_31978 - BLOCK
      ?auto_31979 - BLOCK
      ?auto_31980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31978 ?auto_31977 ) ( CLEAR ?auto_31978 ) ( ON-TABLE ?auto_31976 ) ( ON ?auto_31977 ?auto_31976 ) ( not ( = ?auto_31976 ?auto_31977 ) ) ( not ( = ?auto_31976 ?auto_31978 ) ) ( not ( = ?auto_31977 ?auto_31978 ) ) ( HOLDING ?auto_31979 ) ( CLEAR ?auto_31980 ) ( not ( = ?auto_31976 ?auto_31979 ) ) ( not ( = ?auto_31976 ?auto_31980 ) ) ( not ( = ?auto_31977 ?auto_31979 ) ) ( not ( = ?auto_31977 ?auto_31980 ) ) ( not ( = ?auto_31978 ?auto_31979 ) ) ( not ( = ?auto_31978 ?auto_31980 ) ) ( not ( = ?auto_31979 ?auto_31980 ) ) )
    :subtasks
    ( ( !STACK ?auto_31979 ?auto_31980 )
      ( MAKE-2PILE ?auto_31976 ?auto_31977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31981 - BLOCK
      ?auto_31982 - BLOCK
    )
    :vars
    (
      ?auto_31984 - BLOCK
      ?auto_31985 - BLOCK
      ?auto_31983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31984 ?auto_31982 ) ( ON-TABLE ?auto_31981 ) ( ON ?auto_31982 ?auto_31981 ) ( not ( = ?auto_31981 ?auto_31982 ) ) ( not ( = ?auto_31981 ?auto_31984 ) ) ( not ( = ?auto_31982 ?auto_31984 ) ) ( CLEAR ?auto_31985 ) ( not ( = ?auto_31981 ?auto_31983 ) ) ( not ( = ?auto_31981 ?auto_31985 ) ) ( not ( = ?auto_31982 ?auto_31983 ) ) ( not ( = ?auto_31982 ?auto_31985 ) ) ( not ( = ?auto_31984 ?auto_31983 ) ) ( not ( = ?auto_31984 ?auto_31985 ) ) ( not ( = ?auto_31983 ?auto_31985 ) ) ( ON ?auto_31983 ?auto_31984 ) ( CLEAR ?auto_31983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_31981 ?auto_31982 ?auto_31984 )
      ( MAKE-2PILE ?auto_31981 ?auto_31982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31986 - BLOCK
      ?auto_31987 - BLOCK
    )
    :vars
    (
      ?auto_31988 - BLOCK
      ?auto_31989 - BLOCK
      ?auto_31990 - BLOCK
      ?auto_31991 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31988 ?auto_31987 ) ( ON-TABLE ?auto_31986 ) ( ON ?auto_31987 ?auto_31986 ) ( not ( = ?auto_31986 ?auto_31987 ) ) ( not ( = ?auto_31986 ?auto_31988 ) ) ( not ( = ?auto_31987 ?auto_31988 ) ) ( not ( = ?auto_31986 ?auto_31989 ) ) ( not ( = ?auto_31986 ?auto_31990 ) ) ( not ( = ?auto_31987 ?auto_31989 ) ) ( not ( = ?auto_31987 ?auto_31990 ) ) ( not ( = ?auto_31988 ?auto_31989 ) ) ( not ( = ?auto_31988 ?auto_31990 ) ) ( not ( = ?auto_31989 ?auto_31990 ) ) ( ON ?auto_31989 ?auto_31988 ) ( CLEAR ?auto_31989 ) ( HOLDING ?auto_31990 ) ( CLEAR ?auto_31991 ) ( ON-TABLE ?auto_31991 ) ( not ( = ?auto_31991 ?auto_31990 ) ) ( not ( = ?auto_31986 ?auto_31991 ) ) ( not ( = ?auto_31987 ?auto_31991 ) ) ( not ( = ?auto_31988 ?auto_31991 ) ) ( not ( = ?auto_31989 ?auto_31991 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_31991 ?auto_31990 )
      ( MAKE-2PILE ?auto_31986 ?auto_31987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31992 - BLOCK
      ?auto_31993 - BLOCK
    )
    :vars
    (
      ?auto_31994 - BLOCK
      ?auto_31996 - BLOCK
      ?auto_31997 - BLOCK
      ?auto_31995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_31994 ?auto_31993 ) ( ON-TABLE ?auto_31992 ) ( ON ?auto_31993 ?auto_31992 ) ( not ( = ?auto_31992 ?auto_31993 ) ) ( not ( = ?auto_31992 ?auto_31994 ) ) ( not ( = ?auto_31993 ?auto_31994 ) ) ( not ( = ?auto_31992 ?auto_31996 ) ) ( not ( = ?auto_31992 ?auto_31997 ) ) ( not ( = ?auto_31993 ?auto_31996 ) ) ( not ( = ?auto_31993 ?auto_31997 ) ) ( not ( = ?auto_31994 ?auto_31996 ) ) ( not ( = ?auto_31994 ?auto_31997 ) ) ( not ( = ?auto_31996 ?auto_31997 ) ) ( ON ?auto_31996 ?auto_31994 ) ( CLEAR ?auto_31995 ) ( ON-TABLE ?auto_31995 ) ( not ( = ?auto_31995 ?auto_31997 ) ) ( not ( = ?auto_31992 ?auto_31995 ) ) ( not ( = ?auto_31993 ?auto_31995 ) ) ( not ( = ?auto_31994 ?auto_31995 ) ) ( not ( = ?auto_31996 ?auto_31995 ) ) ( ON ?auto_31997 ?auto_31996 ) ( CLEAR ?auto_31997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_31992 ?auto_31993 ?auto_31994 ?auto_31996 )
      ( MAKE-2PILE ?auto_31992 ?auto_31993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_31998 - BLOCK
      ?auto_31999 - BLOCK
    )
    :vars
    (
      ?auto_32002 - BLOCK
      ?auto_32001 - BLOCK
      ?auto_32003 - BLOCK
      ?auto_32000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32002 ?auto_31999 ) ( ON-TABLE ?auto_31998 ) ( ON ?auto_31999 ?auto_31998 ) ( not ( = ?auto_31998 ?auto_31999 ) ) ( not ( = ?auto_31998 ?auto_32002 ) ) ( not ( = ?auto_31999 ?auto_32002 ) ) ( not ( = ?auto_31998 ?auto_32001 ) ) ( not ( = ?auto_31998 ?auto_32003 ) ) ( not ( = ?auto_31999 ?auto_32001 ) ) ( not ( = ?auto_31999 ?auto_32003 ) ) ( not ( = ?auto_32002 ?auto_32001 ) ) ( not ( = ?auto_32002 ?auto_32003 ) ) ( not ( = ?auto_32001 ?auto_32003 ) ) ( ON ?auto_32001 ?auto_32002 ) ( not ( = ?auto_32000 ?auto_32003 ) ) ( not ( = ?auto_31998 ?auto_32000 ) ) ( not ( = ?auto_31999 ?auto_32000 ) ) ( not ( = ?auto_32002 ?auto_32000 ) ) ( not ( = ?auto_32001 ?auto_32000 ) ) ( ON ?auto_32003 ?auto_32001 ) ( CLEAR ?auto_32003 ) ( HOLDING ?auto_32000 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32000 )
      ( MAKE-2PILE ?auto_31998 ?auto_31999 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32004 - BLOCK
      ?auto_32005 - BLOCK
    )
    :vars
    (
      ?auto_32008 - BLOCK
      ?auto_32006 - BLOCK
      ?auto_32009 - BLOCK
      ?auto_32007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32008 ?auto_32005 ) ( ON-TABLE ?auto_32004 ) ( ON ?auto_32005 ?auto_32004 ) ( not ( = ?auto_32004 ?auto_32005 ) ) ( not ( = ?auto_32004 ?auto_32008 ) ) ( not ( = ?auto_32005 ?auto_32008 ) ) ( not ( = ?auto_32004 ?auto_32006 ) ) ( not ( = ?auto_32004 ?auto_32009 ) ) ( not ( = ?auto_32005 ?auto_32006 ) ) ( not ( = ?auto_32005 ?auto_32009 ) ) ( not ( = ?auto_32008 ?auto_32006 ) ) ( not ( = ?auto_32008 ?auto_32009 ) ) ( not ( = ?auto_32006 ?auto_32009 ) ) ( ON ?auto_32006 ?auto_32008 ) ( not ( = ?auto_32007 ?auto_32009 ) ) ( not ( = ?auto_32004 ?auto_32007 ) ) ( not ( = ?auto_32005 ?auto_32007 ) ) ( not ( = ?auto_32008 ?auto_32007 ) ) ( not ( = ?auto_32006 ?auto_32007 ) ) ( ON ?auto_32009 ?auto_32006 ) ( ON ?auto_32007 ?auto_32009 ) ( CLEAR ?auto_32007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32004 ?auto_32005 ?auto_32008 ?auto_32006 ?auto_32009 )
      ( MAKE-2PILE ?auto_32004 ?auto_32005 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32014 - BLOCK
      ?auto_32015 - BLOCK
      ?auto_32016 - BLOCK
      ?auto_32017 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32017 ) ( CLEAR ?auto_32016 ) ( ON-TABLE ?auto_32014 ) ( ON ?auto_32015 ?auto_32014 ) ( ON ?auto_32016 ?auto_32015 ) ( not ( = ?auto_32014 ?auto_32015 ) ) ( not ( = ?auto_32014 ?auto_32016 ) ) ( not ( = ?auto_32014 ?auto_32017 ) ) ( not ( = ?auto_32015 ?auto_32016 ) ) ( not ( = ?auto_32015 ?auto_32017 ) ) ( not ( = ?auto_32016 ?auto_32017 ) ) )
    :subtasks
    ( ( !STACK ?auto_32017 ?auto_32016 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32018 - BLOCK
      ?auto_32019 - BLOCK
      ?auto_32020 - BLOCK
      ?auto_32021 - BLOCK
    )
    :vars
    (
      ?auto_32022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32020 ) ( ON-TABLE ?auto_32018 ) ( ON ?auto_32019 ?auto_32018 ) ( ON ?auto_32020 ?auto_32019 ) ( not ( = ?auto_32018 ?auto_32019 ) ) ( not ( = ?auto_32018 ?auto_32020 ) ) ( not ( = ?auto_32018 ?auto_32021 ) ) ( not ( = ?auto_32019 ?auto_32020 ) ) ( not ( = ?auto_32019 ?auto_32021 ) ) ( not ( = ?auto_32020 ?auto_32021 ) ) ( ON ?auto_32021 ?auto_32022 ) ( CLEAR ?auto_32021 ) ( HAND-EMPTY ) ( not ( = ?auto_32018 ?auto_32022 ) ) ( not ( = ?auto_32019 ?auto_32022 ) ) ( not ( = ?auto_32020 ?auto_32022 ) ) ( not ( = ?auto_32021 ?auto_32022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32021 ?auto_32022 )
      ( MAKE-4PILE ?auto_32018 ?auto_32019 ?auto_32020 ?auto_32021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32023 - BLOCK
      ?auto_32024 - BLOCK
      ?auto_32025 - BLOCK
      ?auto_32026 - BLOCK
    )
    :vars
    (
      ?auto_32027 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32023 ) ( ON ?auto_32024 ?auto_32023 ) ( not ( = ?auto_32023 ?auto_32024 ) ) ( not ( = ?auto_32023 ?auto_32025 ) ) ( not ( = ?auto_32023 ?auto_32026 ) ) ( not ( = ?auto_32024 ?auto_32025 ) ) ( not ( = ?auto_32024 ?auto_32026 ) ) ( not ( = ?auto_32025 ?auto_32026 ) ) ( ON ?auto_32026 ?auto_32027 ) ( CLEAR ?auto_32026 ) ( not ( = ?auto_32023 ?auto_32027 ) ) ( not ( = ?auto_32024 ?auto_32027 ) ) ( not ( = ?auto_32025 ?auto_32027 ) ) ( not ( = ?auto_32026 ?auto_32027 ) ) ( HOLDING ?auto_32025 ) ( CLEAR ?auto_32024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32023 ?auto_32024 ?auto_32025 )
      ( MAKE-4PILE ?auto_32023 ?auto_32024 ?auto_32025 ?auto_32026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32028 - BLOCK
      ?auto_32029 - BLOCK
      ?auto_32030 - BLOCK
      ?auto_32031 - BLOCK
    )
    :vars
    (
      ?auto_32032 - BLOCK
      ?auto_32033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32028 ) ( ON ?auto_32029 ?auto_32028 ) ( not ( = ?auto_32028 ?auto_32029 ) ) ( not ( = ?auto_32028 ?auto_32030 ) ) ( not ( = ?auto_32028 ?auto_32031 ) ) ( not ( = ?auto_32029 ?auto_32030 ) ) ( not ( = ?auto_32029 ?auto_32031 ) ) ( not ( = ?auto_32030 ?auto_32031 ) ) ( ON ?auto_32031 ?auto_32032 ) ( not ( = ?auto_32028 ?auto_32032 ) ) ( not ( = ?auto_32029 ?auto_32032 ) ) ( not ( = ?auto_32030 ?auto_32032 ) ) ( not ( = ?auto_32031 ?auto_32032 ) ) ( CLEAR ?auto_32029 ) ( ON ?auto_32030 ?auto_32031 ) ( CLEAR ?auto_32030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32033 ) ( ON ?auto_32032 ?auto_32033 ) ( not ( = ?auto_32033 ?auto_32032 ) ) ( not ( = ?auto_32033 ?auto_32031 ) ) ( not ( = ?auto_32033 ?auto_32030 ) ) ( not ( = ?auto_32028 ?auto_32033 ) ) ( not ( = ?auto_32029 ?auto_32033 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32033 ?auto_32032 ?auto_32031 )
      ( MAKE-4PILE ?auto_32028 ?auto_32029 ?auto_32030 ?auto_32031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32034 - BLOCK
      ?auto_32035 - BLOCK
      ?auto_32036 - BLOCK
      ?auto_32037 - BLOCK
    )
    :vars
    (
      ?auto_32039 - BLOCK
      ?auto_32038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32034 ) ( not ( = ?auto_32034 ?auto_32035 ) ) ( not ( = ?auto_32034 ?auto_32036 ) ) ( not ( = ?auto_32034 ?auto_32037 ) ) ( not ( = ?auto_32035 ?auto_32036 ) ) ( not ( = ?auto_32035 ?auto_32037 ) ) ( not ( = ?auto_32036 ?auto_32037 ) ) ( ON ?auto_32037 ?auto_32039 ) ( not ( = ?auto_32034 ?auto_32039 ) ) ( not ( = ?auto_32035 ?auto_32039 ) ) ( not ( = ?auto_32036 ?auto_32039 ) ) ( not ( = ?auto_32037 ?auto_32039 ) ) ( ON ?auto_32036 ?auto_32037 ) ( CLEAR ?auto_32036 ) ( ON-TABLE ?auto_32038 ) ( ON ?auto_32039 ?auto_32038 ) ( not ( = ?auto_32038 ?auto_32039 ) ) ( not ( = ?auto_32038 ?auto_32037 ) ) ( not ( = ?auto_32038 ?auto_32036 ) ) ( not ( = ?auto_32034 ?auto_32038 ) ) ( not ( = ?auto_32035 ?auto_32038 ) ) ( HOLDING ?auto_32035 ) ( CLEAR ?auto_32034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32034 ?auto_32035 )
      ( MAKE-4PILE ?auto_32034 ?auto_32035 ?auto_32036 ?auto_32037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32040 - BLOCK
      ?auto_32041 - BLOCK
      ?auto_32042 - BLOCK
      ?auto_32043 - BLOCK
    )
    :vars
    (
      ?auto_32044 - BLOCK
      ?auto_32045 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32040 ) ( not ( = ?auto_32040 ?auto_32041 ) ) ( not ( = ?auto_32040 ?auto_32042 ) ) ( not ( = ?auto_32040 ?auto_32043 ) ) ( not ( = ?auto_32041 ?auto_32042 ) ) ( not ( = ?auto_32041 ?auto_32043 ) ) ( not ( = ?auto_32042 ?auto_32043 ) ) ( ON ?auto_32043 ?auto_32044 ) ( not ( = ?auto_32040 ?auto_32044 ) ) ( not ( = ?auto_32041 ?auto_32044 ) ) ( not ( = ?auto_32042 ?auto_32044 ) ) ( not ( = ?auto_32043 ?auto_32044 ) ) ( ON ?auto_32042 ?auto_32043 ) ( ON-TABLE ?auto_32045 ) ( ON ?auto_32044 ?auto_32045 ) ( not ( = ?auto_32045 ?auto_32044 ) ) ( not ( = ?auto_32045 ?auto_32043 ) ) ( not ( = ?auto_32045 ?auto_32042 ) ) ( not ( = ?auto_32040 ?auto_32045 ) ) ( not ( = ?auto_32041 ?auto_32045 ) ) ( CLEAR ?auto_32040 ) ( ON ?auto_32041 ?auto_32042 ) ( CLEAR ?auto_32041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32045 ?auto_32044 ?auto_32043 ?auto_32042 )
      ( MAKE-4PILE ?auto_32040 ?auto_32041 ?auto_32042 ?auto_32043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32046 - BLOCK
      ?auto_32047 - BLOCK
      ?auto_32048 - BLOCK
      ?auto_32049 - BLOCK
    )
    :vars
    (
      ?auto_32051 - BLOCK
      ?auto_32050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32046 ?auto_32047 ) ) ( not ( = ?auto_32046 ?auto_32048 ) ) ( not ( = ?auto_32046 ?auto_32049 ) ) ( not ( = ?auto_32047 ?auto_32048 ) ) ( not ( = ?auto_32047 ?auto_32049 ) ) ( not ( = ?auto_32048 ?auto_32049 ) ) ( ON ?auto_32049 ?auto_32051 ) ( not ( = ?auto_32046 ?auto_32051 ) ) ( not ( = ?auto_32047 ?auto_32051 ) ) ( not ( = ?auto_32048 ?auto_32051 ) ) ( not ( = ?auto_32049 ?auto_32051 ) ) ( ON ?auto_32048 ?auto_32049 ) ( ON-TABLE ?auto_32050 ) ( ON ?auto_32051 ?auto_32050 ) ( not ( = ?auto_32050 ?auto_32051 ) ) ( not ( = ?auto_32050 ?auto_32049 ) ) ( not ( = ?auto_32050 ?auto_32048 ) ) ( not ( = ?auto_32046 ?auto_32050 ) ) ( not ( = ?auto_32047 ?auto_32050 ) ) ( ON ?auto_32047 ?auto_32048 ) ( CLEAR ?auto_32047 ) ( HOLDING ?auto_32046 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32046 )
      ( MAKE-4PILE ?auto_32046 ?auto_32047 ?auto_32048 ?auto_32049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32052 - BLOCK
      ?auto_32053 - BLOCK
      ?auto_32054 - BLOCK
      ?auto_32055 - BLOCK
    )
    :vars
    (
      ?auto_32056 - BLOCK
      ?auto_32057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32052 ?auto_32053 ) ) ( not ( = ?auto_32052 ?auto_32054 ) ) ( not ( = ?auto_32052 ?auto_32055 ) ) ( not ( = ?auto_32053 ?auto_32054 ) ) ( not ( = ?auto_32053 ?auto_32055 ) ) ( not ( = ?auto_32054 ?auto_32055 ) ) ( ON ?auto_32055 ?auto_32056 ) ( not ( = ?auto_32052 ?auto_32056 ) ) ( not ( = ?auto_32053 ?auto_32056 ) ) ( not ( = ?auto_32054 ?auto_32056 ) ) ( not ( = ?auto_32055 ?auto_32056 ) ) ( ON ?auto_32054 ?auto_32055 ) ( ON-TABLE ?auto_32057 ) ( ON ?auto_32056 ?auto_32057 ) ( not ( = ?auto_32057 ?auto_32056 ) ) ( not ( = ?auto_32057 ?auto_32055 ) ) ( not ( = ?auto_32057 ?auto_32054 ) ) ( not ( = ?auto_32052 ?auto_32057 ) ) ( not ( = ?auto_32053 ?auto_32057 ) ) ( ON ?auto_32053 ?auto_32054 ) ( ON ?auto_32052 ?auto_32053 ) ( CLEAR ?auto_32052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32057 ?auto_32056 ?auto_32055 ?auto_32054 ?auto_32053 )
      ( MAKE-4PILE ?auto_32052 ?auto_32053 ?auto_32054 ?auto_32055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32059 - BLOCK
    )
    :vars
    (
      ?auto_32060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32060 ?auto_32059 ) ( CLEAR ?auto_32060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32059 ) ( not ( = ?auto_32059 ?auto_32060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32060 ?auto_32059 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32061 - BLOCK
    )
    :vars
    (
      ?auto_32062 - BLOCK
      ?auto_32063 - BLOCK
      ?auto_32064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32062 ?auto_32061 ) ( CLEAR ?auto_32062 ) ( ON-TABLE ?auto_32061 ) ( not ( = ?auto_32061 ?auto_32062 ) ) ( HOLDING ?auto_32063 ) ( CLEAR ?auto_32064 ) ( not ( = ?auto_32061 ?auto_32063 ) ) ( not ( = ?auto_32061 ?auto_32064 ) ) ( not ( = ?auto_32062 ?auto_32063 ) ) ( not ( = ?auto_32062 ?auto_32064 ) ) ( not ( = ?auto_32063 ?auto_32064 ) ) )
    :subtasks
    ( ( !STACK ?auto_32063 ?auto_32064 )
      ( MAKE-1PILE ?auto_32061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32065 - BLOCK
    )
    :vars
    (
      ?auto_32068 - BLOCK
      ?auto_32066 - BLOCK
      ?auto_32067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32068 ?auto_32065 ) ( ON-TABLE ?auto_32065 ) ( not ( = ?auto_32065 ?auto_32068 ) ) ( CLEAR ?auto_32066 ) ( not ( = ?auto_32065 ?auto_32067 ) ) ( not ( = ?auto_32065 ?auto_32066 ) ) ( not ( = ?auto_32068 ?auto_32067 ) ) ( not ( = ?auto_32068 ?auto_32066 ) ) ( not ( = ?auto_32067 ?auto_32066 ) ) ( ON ?auto_32067 ?auto_32068 ) ( CLEAR ?auto_32067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32065 ?auto_32068 )
      ( MAKE-1PILE ?auto_32065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32069 - BLOCK
    )
    :vars
    (
      ?auto_32071 - BLOCK
      ?auto_32070 - BLOCK
      ?auto_32072 - BLOCK
      ?auto_32074 - BLOCK
      ?auto_32073 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32071 ?auto_32069 ) ( ON-TABLE ?auto_32069 ) ( not ( = ?auto_32069 ?auto_32071 ) ) ( not ( = ?auto_32069 ?auto_32070 ) ) ( not ( = ?auto_32069 ?auto_32072 ) ) ( not ( = ?auto_32071 ?auto_32070 ) ) ( not ( = ?auto_32071 ?auto_32072 ) ) ( not ( = ?auto_32070 ?auto_32072 ) ) ( ON ?auto_32070 ?auto_32071 ) ( CLEAR ?auto_32070 ) ( HOLDING ?auto_32072 ) ( CLEAR ?auto_32074 ) ( ON-TABLE ?auto_32073 ) ( ON ?auto_32074 ?auto_32073 ) ( not ( = ?auto_32073 ?auto_32074 ) ) ( not ( = ?auto_32073 ?auto_32072 ) ) ( not ( = ?auto_32074 ?auto_32072 ) ) ( not ( = ?auto_32069 ?auto_32074 ) ) ( not ( = ?auto_32069 ?auto_32073 ) ) ( not ( = ?auto_32071 ?auto_32074 ) ) ( not ( = ?auto_32071 ?auto_32073 ) ) ( not ( = ?auto_32070 ?auto_32074 ) ) ( not ( = ?auto_32070 ?auto_32073 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32073 ?auto_32074 ?auto_32072 )
      ( MAKE-1PILE ?auto_32069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32075 - BLOCK
    )
    :vars
    (
      ?auto_32079 - BLOCK
      ?auto_32078 - BLOCK
      ?auto_32077 - BLOCK
      ?auto_32076 - BLOCK
      ?auto_32080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32079 ?auto_32075 ) ( ON-TABLE ?auto_32075 ) ( not ( = ?auto_32075 ?auto_32079 ) ) ( not ( = ?auto_32075 ?auto_32078 ) ) ( not ( = ?auto_32075 ?auto_32077 ) ) ( not ( = ?auto_32079 ?auto_32078 ) ) ( not ( = ?auto_32079 ?auto_32077 ) ) ( not ( = ?auto_32078 ?auto_32077 ) ) ( ON ?auto_32078 ?auto_32079 ) ( CLEAR ?auto_32076 ) ( ON-TABLE ?auto_32080 ) ( ON ?auto_32076 ?auto_32080 ) ( not ( = ?auto_32080 ?auto_32076 ) ) ( not ( = ?auto_32080 ?auto_32077 ) ) ( not ( = ?auto_32076 ?auto_32077 ) ) ( not ( = ?auto_32075 ?auto_32076 ) ) ( not ( = ?auto_32075 ?auto_32080 ) ) ( not ( = ?auto_32079 ?auto_32076 ) ) ( not ( = ?auto_32079 ?auto_32080 ) ) ( not ( = ?auto_32078 ?auto_32076 ) ) ( not ( = ?auto_32078 ?auto_32080 ) ) ( ON ?auto_32077 ?auto_32078 ) ( CLEAR ?auto_32077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32075 ?auto_32079 ?auto_32078 )
      ( MAKE-1PILE ?auto_32075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32081 - BLOCK
    )
    :vars
    (
      ?auto_32085 - BLOCK
      ?auto_32086 - BLOCK
      ?auto_32083 - BLOCK
      ?auto_32082 - BLOCK
      ?auto_32084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32085 ?auto_32081 ) ( ON-TABLE ?auto_32081 ) ( not ( = ?auto_32081 ?auto_32085 ) ) ( not ( = ?auto_32081 ?auto_32086 ) ) ( not ( = ?auto_32081 ?auto_32083 ) ) ( not ( = ?auto_32085 ?auto_32086 ) ) ( not ( = ?auto_32085 ?auto_32083 ) ) ( not ( = ?auto_32086 ?auto_32083 ) ) ( ON ?auto_32086 ?auto_32085 ) ( ON-TABLE ?auto_32082 ) ( not ( = ?auto_32082 ?auto_32084 ) ) ( not ( = ?auto_32082 ?auto_32083 ) ) ( not ( = ?auto_32084 ?auto_32083 ) ) ( not ( = ?auto_32081 ?auto_32084 ) ) ( not ( = ?auto_32081 ?auto_32082 ) ) ( not ( = ?auto_32085 ?auto_32084 ) ) ( not ( = ?auto_32085 ?auto_32082 ) ) ( not ( = ?auto_32086 ?auto_32084 ) ) ( not ( = ?auto_32086 ?auto_32082 ) ) ( ON ?auto_32083 ?auto_32086 ) ( CLEAR ?auto_32083 ) ( HOLDING ?auto_32084 ) ( CLEAR ?auto_32082 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32082 ?auto_32084 )
      ( MAKE-1PILE ?auto_32081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32087 - BLOCK
    )
    :vars
    (
      ?auto_32089 - BLOCK
      ?auto_32092 - BLOCK
      ?auto_32090 - BLOCK
      ?auto_32091 - BLOCK
      ?auto_32088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32089 ?auto_32087 ) ( ON-TABLE ?auto_32087 ) ( not ( = ?auto_32087 ?auto_32089 ) ) ( not ( = ?auto_32087 ?auto_32092 ) ) ( not ( = ?auto_32087 ?auto_32090 ) ) ( not ( = ?auto_32089 ?auto_32092 ) ) ( not ( = ?auto_32089 ?auto_32090 ) ) ( not ( = ?auto_32092 ?auto_32090 ) ) ( ON ?auto_32092 ?auto_32089 ) ( ON-TABLE ?auto_32091 ) ( not ( = ?auto_32091 ?auto_32088 ) ) ( not ( = ?auto_32091 ?auto_32090 ) ) ( not ( = ?auto_32088 ?auto_32090 ) ) ( not ( = ?auto_32087 ?auto_32088 ) ) ( not ( = ?auto_32087 ?auto_32091 ) ) ( not ( = ?auto_32089 ?auto_32088 ) ) ( not ( = ?auto_32089 ?auto_32091 ) ) ( not ( = ?auto_32092 ?auto_32088 ) ) ( not ( = ?auto_32092 ?auto_32091 ) ) ( ON ?auto_32090 ?auto_32092 ) ( CLEAR ?auto_32091 ) ( ON ?auto_32088 ?auto_32090 ) ( CLEAR ?auto_32088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32087 ?auto_32089 ?auto_32092 ?auto_32090 )
      ( MAKE-1PILE ?auto_32087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32093 - BLOCK
    )
    :vars
    (
      ?auto_32097 - BLOCK
      ?auto_32095 - BLOCK
      ?auto_32098 - BLOCK
      ?auto_32094 - BLOCK
      ?auto_32096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32097 ?auto_32093 ) ( ON-TABLE ?auto_32093 ) ( not ( = ?auto_32093 ?auto_32097 ) ) ( not ( = ?auto_32093 ?auto_32095 ) ) ( not ( = ?auto_32093 ?auto_32098 ) ) ( not ( = ?auto_32097 ?auto_32095 ) ) ( not ( = ?auto_32097 ?auto_32098 ) ) ( not ( = ?auto_32095 ?auto_32098 ) ) ( ON ?auto_32095 ?auto_32097 ) ( not ( = ?auto_32094 ?auto_32096 ) ) ( not ( = ?auto_32094 ?auto_32098 ) ) ( not ( = ?auto_32096 ?auto_32098 ) ) ( not ( = ?auto_32093 ?auto_32096 ) ) ( not ( = ?auto_32093 ?auto_32094 ) ) ( not ( = ?auto_32097 ?auto_32096 ) ) ( not ( = ?auto_32097 ?auto_32094 ) ) ( not ( = ?auto_32095 ?auto_32096 ) ) ( not ( = ?auto_32095 ?auto_32094 ) ) ( ON ?auto_32098 ?auto_32095 ) ( ON ?auto_32096 ?auto_32098 ) ( CLEAR ?auto_32096 ) ( HOLDING ?auto_32094 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32094 )
      ( MAKE-1PILE ?auto_32093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32099 - BLOCK
    )
    :vars
    (
      ?auto_32102 - BLOCK
      ?auto_32101 - BLOCK
      ?auto_32103 - BLOCK
      ?auto_32100 - BLOCK
      ?auto_32104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32102 ?auto_32099 ) ( ON-TABLE ?auto_32099 ) ( not ( = ?auto_32099 ?auto_32102 ) ) ( not ( = ?auto_32099 ?auto_32101 ) ) ( not ( = ?auto_32099 ?auto_32103 ) ) ( not ( = ?auto_32102 ?auto_32101 ) ) ( not ( = ?auto_32102 ?auto_32103 ) ) ( not ( = ?auto_32101 ?auto_32103 ) ) ( ON ?auto_32101 ?auto_32102 ) ( not ( = ?auto_32100 ?auto_32104 ) ) ( not ( = ?auto_32100 ?auto_32103 ) ) ( not ( = ?auto_32104 ?auto_32103 ) ) ( not ( = ?auto_32099 ?auto_32104 ) ) ( not ( = ?auto_32099 ?auto_32100 ) ) ( not ( = ?auto_32102 ?auto_32104 ) ) ( not ( = ?auto_32102 ?auto_32100 ) ) ( not ( = ?auto_32101 ?auto_32104 ) ) ( not ( = ?auto_32101 ?auto_32100 ) ) ( ON ?auto_32103 ?auto_32101 ) ( ON ?auto_32104 ?auto_32103 ) ( ON ?auto_32100 ?auto_32104 ) ( CLEAR ?auto_32100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32099 ?auto_32102 ?auto_32101 ?auto_32103 ?auto_32104 )
      ( MAKE-1PILE ?auto_32099 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32110 - BLOCK
      ?auto_32111 - BLOCK
      ?auto_32112 - BLOCK
      ?auto_32113 - BLOCK
      ?auto_32114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32114 ) ( CLEAR ?auto_32113 ) ( ON-TABLE ?auto_32110 ) ( ON ?auto_32111 ?auto_32110 ) ( ON ?auto_32112 ?auto_32111 ) ( ON ?auto_32113 ?auto_32112 ) ( not ( = ?auto_32110 ?auto_32111 ) ) ( not ( = ?auto_32110 ?auto_32112 ) ) ( not ( = ?auto_32110 ?auto_32113 ) ) ( not ( = ?auto_32110 ?auto_32114 ) ) ( not ( = ?auto_32111 ?auto_32112 ) ) ( not ( = ?auto_32111 ?auto_32113 ) ) ( not ( = ?auto_32111 ?auto_32114 ) ) ( not ( = ?auto_32112 ?auto_32113 ) ) ( not ( = ?auto_32112 ?auto_32114 ) ) ( not ( = ?auto_32113 ?auto_32114 ) ) )
    :subtasks
    ( ( !STACK ?auto_32114 ?auto_32113 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32115 - BLOCK
      ?auto_32116 - BLOCK
      ?auto_32117 - BLOCK
      ?auto_32118 - BLOCK
      ?auto_32119 - BLOCK
    )
    :vars
    (
      ?auto_32120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32118 ) ( ON-TABLE ?auto_32115 ) ( ON ?auto_32116 ?auto_32115 ) ( ON ?auto_32117 ?auto_32116 ) ( ON ?auto_32118 ?auto_32117 ) ( not ( = ?auto_32115 ?auto_32116 ) ) ( not ( = ?auto_32115 ?auto_32117 ) ) ( not ( = ?auto_32115 ?auto_32118 ) ) ( not ( = ?auto_32115 ?auto_32119 ) ) ( not ( = ?auto_32116 ?auto_32117 ) ) ( not ( = ?auto_32116 ?auto_32118 ) ) ( not ( = ?auto_32116 ?auto_32119 ) ) ( not ( = ?auto_32117 ?auto_32118 ) ) ( not ( = ?auto_32117 ?auto_32119 ) ) ( not ( = ?auto_32118 ?auto_32119 ) ) ( ON ?auto_32119 ?auto_32120 ) ( CLEAR ?auto_32119 ) ( HAND-EMPTY ) ( not ( = ?auto_32115 ?auto_32120 ) ) ( not ( = ?auto_32116 ?auto_32120 ) ) ( not ( = ?auto_32117 ?auto_32120 ) ) ( not ( = ?auto_32118 ?auto_32120 ) ) ( not ( = ?auto_32119 ?auto_32120 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32119 ?auto_32120 )
      ( MAKE-5PILE ?auto_32115 ?auto_32116 ?auto_32117 ?auto_32118 ?auto_32119 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32121 - BLOCK
      ?auto_32122 - BLOCK
      ?auto_32123 - BLOCK
      ?auto_32124 - BLOCK
      ?auto_32125 - BLOCK
    )
    :vars
    (
      ?auto_32126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32121 ) ( ON ?auto_32122 ?auto_32121 ) ( ON ?auto_32123 ?auto_32122 ) ( not ( = ?auto_32121 ?auto_32122 ) ) ( not ( = ?auto_32121 ?auto_32123 ) ) ( not ( = ?auto_32121 ?auto_32124 ) ) ( not ( = ?auto_32121 ?auto_32125 ) ) ( not ( = ?auto_32122 ?auto_32123 ) ) ( not ( = ?auto_32122 ?auto_32124 ) ) ( not ( = ?auto_32122 ?auto_32125 ) ) ( not ( = ?auto_32123 ?auto_32124 ) ) ( not ( = ?auto_32123 ?auto_32125 ) ) ( not ( = ?auto_32124 ?auto_32125 ) ) ( ON ?auto_32125 ?auto_32126 ) ( CLEAR ?auto_32125 ) ( not ( = ?auto_32121 ?auto_32126 ) ) ( not ( = ?auto_32122 ?auto_32126 ) ) ( not ( = ?auto_32123 ?auto_32126 ) ) ( not ( = ?auto_32124 ?auto_32126 ) ) ( not ( = ?auto_32125 ?auto_32126 ) ) ( HOLDING ?auto_32124 ) ( CLEAR ?auto_32123 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32121 ?auto_32122 ?auto_32123 ?auto_32124 )
      ( MAKE-5PILE ?auto_32121 ?auto_32122 ?auto_32123 ?auto_32124 ?auto_32125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32127 - BLOCK
      ?auto_32128 - BLOCK
      ?auto_32129 - BLOCK
      ?auto_32130 - BLOCK
      ?auto_32131 - BLOCK
    )
    :vars
    (
      ?auto_32132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32127 ) ( ON ?auto_32128 ?auto_32127 ) ( ON ?auto_32129 ?auto_32128 ) ( not ( = ?auto_32127 ?auto_32128 ) ) ( not ( = ?auto_32127 ?auto_32129 ) ) ( not ( = ?auto_32127 ?auto_32130 ) ) ( not ( = ?auto_32127 ?auto_32131 ) ) ( not ( = ?auto_32128 ?auto_32129 ) ) ( not ( = ?auto_32128 ?auto_32130 ) ) ( not ( = ?auto_32128 ?auto_32131 ) ) ( not ( = ?auto_32129 ?auto_32130 ) ) ( not ( = ?auto_32129 ?auto_32131 ) ) ( not ( = ?auto_32130 ?auto_32131 ) ) ( ON ?auto_32131 ?auto_32132 ) ( not ( = ?auto_32127 ?auto_32132 ) ) ( not ( = ?auto_32128 ?auto_32132 ) ) ( not ( = ?auto_32129 ?auto_32132 ) ) ( not ( = ?auto_32130 ?auto_32132 ) ) ( not ( = ?auto_32131 ?auto_32132 ) ) ( CLEAR ?auto_32129 ) ( ON ?auto_32130 ?auto_32131 ) ( CLEAR ?auto_32130 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32132 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32132 ?auto_32131 )
      ( MAKE-5PILE ?auto_32127 ?auto_32128 ?auto_32129 ?auto_32130 ?auto_32131 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32133 - BLOCK
      ?auto_32134 - BLOCK
      ?auto_32135 - BLOCK
      ?auto_32136 - BLOCK
      ?auto_32137 - BLOCK
    )
    :vars
    (
      ?auto_32138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32133 ) ( ON ?auto_32134 ?auto_32133 ) ( not ( = ?auto_32133 ?auto_32134 ) ) ( not ( = ?auto_32133 ?auto_32135 ) ) ( not ( = ?auto_32133 ?auto_32136 ) ) ( not ( = ?auto_32133 ?auto_32137 ) ) ( not ( = ?auto_32134 ?auto_32135 ) ) ( not ( = ?auto_32134 ?auto_32136 ) ) ( not ( = ?auto_32134 ?auto_32137 ) ) ( not ( = ?auto_32135 ?auto_32136 ) ) ( not ( = ?auto_32135 ?auto_32137 ) ) ( not ( = ?auto_32136 ?auto_32137 ) ) ( ON ?auto_32137 ?auto_32138 ) ( not ( = ?auto_32133 ?auto_32138 ) ) ( not ( = ?auto_32134 ?auto_32138 ) ) ( not ( = ?auto_32135 ?auto_32138 ) ) ( not ( = ?auto_32136 ?auto_32138 ) ) ( not ( = ?auto_32137 ?auto_32138 ) ) ( ON ?auto_32136 ?auto_32137 ) ( CLEAR ?auto_32136 ) ( ON-TABLE ?auto_32138 ) ( HOLDING ?auto_32135 ) ( CLEAR ?auto_32134 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32133 ?auto_32134 ?auto_32135 )
      ( MAKE-5PILE ?auto_32133 ?auto_32134 ?auto_32135 ?auto_32136 ?auto_32137 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32139 - BLOCK
      ?auto_32140 - BLOCK
      ?auto_32141 - BLOCK
      ?auto_32142 - BLOCK
      ?auto_32143 - BLOCK
    )
    :vars
    (
      ?auto_32144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32139 ) ( ON ?auto_32140 ?auto_32139 ) ( not ( = ?auto_32139 ?auto_32140 ) ) ( not ( = ?auto_32139 ?auto_32141 ) ) ( not ( = ?auto_32139 ?auto_32142 ) ) ( not ( = ?auto_32139 ?auto_32143 ) ) ( not ( = ?auto_32140 ?auto_32141 ) ) ( not ( = ?auto_32140 ?auto_32142 ) ) ( not ( = ?auto_32140 ?auto_32143 ) ) ( not ( = ?auto_32141 ?auto_32142 ) ) ( not ( = ?auto_32141 ?auto_32143 ) ) ( not ( = ?auto_32142 ?auto_32143 ) ) ( ON ?auto_32143 ?auto_32144 ) ( not ( = ?auto_32139 ?auto_32144 ) ) ( not ( = ?auto_32140 ?auto_32144 ) ) ( not ( = ?auto_32141 ?auto_32144 ) ) ( not ( = ?auto_32142 ?auto_32144 ) ) ( not ( = ?auto_32143 ?auto_32144 ) ) ( ON ?auto_32142 ?auto_32143 ) ( ON-TABLE ?auto_32144 ) ( CLEAR ?auto_32140 ) ( ON ?auto_32141 ?auto_32142 ) ( CLEAR ?auto_32141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32144 ?auto_32143 ?auto_32142 )
      ( MAKE-5PILE ?auto_32139 ?auto_32140 ?auto_32141 ?auto_32142 ?auto_32143 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32145 - BLOCK
      ?auto_32146 - BLOCK
      ?auto_32147 - BLOCK
      ?auto_32148 - BLOCK
      ?auto_32149 - BLOCK
    )
    :vars
    (
      ?auto_32150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32145 ) ( not ( = ?auto_32145 ?auto_32146 ) ) ( not ( = ?auto_32145 ?auto_32147 ) ) ( not ( = ?auto_32145 ?auto_32148 ) ) ( not ( = ?auto_32145 ?auto_32149 ) ) ( not ( = ?auto_32146 ?auto_32147 ) ) ( not ( = ?auto_32146 ?auto_32148 ) ) ( not ( = ?auto_32146 ?auto_32149 ) ) ( not ( = ?auto_32147 ?auto_32148 ) ) ( not ( = ?auto_32147 ?auto_32149 ) ) ( not ( = ?auto_32148 ?auto_32149 ) ) ( ON ?auto_32149 ?auto_32150 ) ( not ( = ?auto_32145 ?auto_32150 ) ) ( not ( = ?auto_32146 ?auto_32150 ) ) ( not ( = ?auto_32147 ?auto_32150 ) ) ( not ( = ?auto_32148 ?auto_32150 ) ) ( not ( = ?auto_32149 ?auto_32150 ) ) ( ON ?auto_32148 ?auto_32149 ) ( ON-TABLE ?auto_32150 ) ( ON ?auto_32147 ?auto_32148 ) ( CLEAR ?auto_32147 ) ( HOLDING ?auto_32146 ) ( CLEAR ?auto_32145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32145 ?auto_32146 )
      ( MAKE-5PILE ?auto_32145 ?auto_32146 ?auto_32147 ?auto_32148 ?auto_32149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32151 - BLOCK
      ?auto_32152 - BLOCK
      ?auto_32153 - BLOCK
      ?auto_32154 - BLOCK
      ?auto_32155 - BLOCK
    )
    :vars
    (
      ?auto_32156 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32151 ) ( not ( = ?auto_32151 ?auto_32152 ) ) ( not ( = ?auto_32151 ?auto_32153 ) ) ( not ( = ?auto_32151 ?auto_32154 ) ) ( not ( = ?auto_32151 ?auto_32155 ) ) ( not ( = ?auto_32152 ?auto_32153 ) ) ( not ( = ?auto_32152 ?auto_32154 ) ) ( not ( = ?auto_32152 ?auto_32155 ) ) ( not ( = ?auto_32153 ?auto_32154 ) ) ( not ( = ?auto_32153 ?auto_32155 ) ) ( not ( = ?auto_32154 ?auto_32155 ) ) ( ON ?auto_32155 ?auto_32156 ) ( not ( = ?auto_32151 ?auto_32156 ) ) ( not ( = ?auto_32152 ?auto_32156 ) ) ( not ( = ?auto_32153 ?auto_32156 ) ) ( not ( = ?auto_32154 ?auto_32156 ) ) ( not ( = ?auto_32155 ?auto_32156 ) ) ( ON ?auto_32154 ?auto_32155 ) ( ON-TABLE ?auto_32156 ) ( ON ?auto_32153 ?auto_32154 ) ( CLEAR ?auto_32151 ) ( ON ?auto_32152 ?auto_32153 ) ( CLEAR ?auto_32152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32156 ?auto_32155 ?auto_32154 ?auto_32153 )
      ( MAKE-5PILE ?auto_32151 ?auto_32152 ?auto_32153 ?auto_32154 ?auto_32155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32157 - BLOCK
      ?auto_32158 - BLOCK
      ?auto_32159 - BLOCK
      ?auto_32160 - BLOCK
      ?auto_32161 - BLOCK
    )
    :vars
    (
      ?auto_32162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32157 ?auto_32158 ) ) ( not ( = ?auto_32157 ?auto_32159 ) ) ( not ( = ?auto_32157 ?auto_32160 ) ) ( not ( = ?auto_32157 ?auto_32161 ) ) ( not ( = ?auto_32158 ?auto_32159 ) ) ( not ( = ?auto_32158 ?auto_32160 ) ) ( not ( = ?auto_32158 ?auto_32161 ) ) ( not ( = ?auto_32159 ?auto_32160 ) ) ( not ( = ?auto_32159 ?auto_32161 ) ) ( not ( = ?auto_32160 ?auto_32161 ) ) ( ON ?auto_32161 ?auto_32162 ) ( not ( = ?auto_32157 ?auto_32162 ) ) ( not ( = ?auto_32158 ?auto_32162 ) ) ( not ( = ?auto_32159 ?auto_32162 ) ) ( not ( = ?auto_32160 ?auto_32162 ) ) ( not ( = ?auto_32161 ?auto_32162 ) ) ( ON ?auto_32160 ?auto_32161 ) ( ON-TABLE ?auto_32162 ) ( ON ?auto_32159 ?auto_32160 ) ( ON ?auto_32158 ?auto_32159 ) ( CLEAR ?auto_32158 ) ( HOLDING ?auto_32157 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32157 )
      ( MAKE-5PILE ?auto_32157 ?auto_32158 ?auto_32159 ?auto_32160 ?auto_32161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32163 - BLOCK
      ?auto_32164 - BLOCK
      ?auto_32165 - BLOCK
      ?auto_32166 - BLOCK
      ?auto_32167 - BLOCK
    )
    :vars
    (
      ?auto_32168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32163 ?auto_32164 ) ) ( not ( = ?auto_32163 ?auto_32165 ) ) ( not ( = ?auto_32163 ?auto_32166 ) ) ( not ( = ?auto_32163 ?auto_32167 ) ) ( not ( = ?auto_32164 ?auto_32165 ) ) ( not ( = ?auto_32164 ?auto_32166 ) ) ( not ( = ?auto_32164 ?auto_32167 ) ) ( not ( = ?auto_32165 ?auto_32166 ) ) ( not ( = ?auto_32165 ?auto_32167 ) ) ( not ( = ?auto_32166 ?auto_32167 ) ) ( ON ?auto_32167 ?auto_32168 ) ( not ( = ?auto_32163 ?auto_32168 ) ) ( not ( = ?auto_32164 ?auto_32168 ) ) ( not ( = ?auto_32165 ?auto_32168 ) ) ( not ( = ?auto_32166 ?auto_32168 ) ) ( not ( = ?auto_32167 ?auto_32168 ) ) ( ON ?auto_32166 ?auto_32167 ) ( ON-TABLE ?auto_32168 ) ( ON ?auto_32165 ?auto_32166 ) ( ON ?auto_32164 ?auto_32165 ) ( ON ?auto_32163 ?auto_32164 ) ( CLEAR ?auto_32163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32168 ?auto_32167 ?auto_32166 ?auto_32165 ?auto_32164 )
      ( MAKE-5PILE ?auto_32163 ?auto_32164 ?auto_32165 ?auto_32166 ?auto_32167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32173 - BLOCK
      ?auto_32174 - BLOCK
      ?auto_32175 - BLOCK
      ?auto_32176 - BLOCK
    )
    :vars
    (
      ?auto_32177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32177 ?auto_32176 ) ( CLEAR ?auto_32177 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32173 ) ( ON ?auto_32174 ?auto_32173 ) ( ON ?auto_32175 ?auto_32174 ) ( ON ?auto_32176 ?auto_32175 ) ( not ( = ?auto_32173 ?auto_32174 ) ) ( not ( = ?auto_32173 ?auto_32175 ) ) ( not ( = ?auto_32173 ?auto_32176 ) ) ( not ( = ?auto_32173 ?auto_32177 ) ) ( not ( = ?auto_32174 ?auto_32175 ) ) ( not ( = ?auto_32174 ?auto_32176 ) ) ( not ( = ?auto_32174 ?auto_32177 ) ) ( not ( = ?auto_32175 ?auto_32176 ) ) ( not ( = ?auto_32175 ?auto_32177 ) ) ( not ( = ?auto_32176 ?auto_32177 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32177 ?auto_32176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32189 - BLOCK
      ?auto_32190 - BLOCK
      ?auto_32191 - BLOCK
      ?auto_32192 - BLOCK
    )
    :vars
    (
      ?auto_32193 - BLOCK
      ?auto_32194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32189 ) ( ON ?auto_32190 ?auto_32189 ) ( ON ?auto_32191 ?auto_32190 ) ( not ( = ?auto_32189 ?auto_32190 ) ) ( not ( = ?auto_32189 ?auto_32191 ) ) ( not ( = ?auto_32189 ?auto_32192 ) ) ( not ( = ?auto_32189 ?auto_32193 ) ) ( not ( = ?auto_32190 ?auto_32191 ) ) ( not ( = ?auto_32190 ?auto_32192 ) ) ( not ( = ?auto_32190 ?auto_32193 ) ) ( not ( = ?auto_32191 ?auto_32192 ) ) ( not ( = ?auto_32191 ?auto_32193 ) ) ( not ( = ?auto_32192 ?auto_32193 ) ) ( ON ?auto_32193 ?auto_32194 ) ( CLEAR ?auto_32193 ) ( not ( = ?auto_32189 ?auto_32194 ) ) ( not ( = ?auto_32190 ?auto_32194 ) ) ( not ( = ?auto_32191 ?auto_32194 ) ) ( not ( = ?auto_32192 ?auto_32194 ) ) ( not ( = ?auto_32193 ?auto_32194 ) ) ( HOLDING ?auto_32192 ) ( CLEAR ?auto_32191 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32189 ?auto_32190 ?auto_32191 ?auto_32192 ?auto_32193 )
      ( MAKE-4PILE ?auto_32189 ?auto_32190 ?auto_32191 ?auto_32192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32195 - BLOCK
      ?auto_32196 - BLOCK
      ?auto_32197 - BLOCK
      ?auto_32198 - BLOCK
    )
    :vars
    (
      ?auto_32200 - BLOCK
      ?auto_32199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32195 ) ( ON ?auto_32196 ?auto_32195 ) ( ON ?auto_32197 ?auto_32196 ) ( not ( = ?auto_32195 ?auto_32196 ) ) ( not ( = ?auto_32195 ?auto_32197 ) ) ( not ( = ?auto_32195 ?auto_32198 ) ) ( not ( = ?auto_32195 ?auto_32200 ) ) ( not ( = ?auto_32196 ?auto_32197 ) ) ( not ( = ?auto_32196 ?auto_32198 ) ) ( not ( = ?auto_32196 ?auto_32200 ) ) ( not ( = ?auto_32197 ?auto_32198 ) ) ( not ( = ?auto_32197 ?auto_32200 ) ) ( not ( = ?auto_32198 ?auto_32200 ) ) ( ON ?auto_32200 ?auto_32199 ) ( not ( = ?auto_32195 ?auto_32199 ) ) ( not ( = ?auto_32196 ?auto_32199 ) ) ( not ( = ?auto_32197 ?auto_32199 ) ) ( not ( = ?auto_32198 ?auto_32199 ) ) ( not ( = ?auto_32200 ?auto_32199 ) ) ( CLEAR ?auto_32197 ) ( ON ?auto_32198 ?auto_32200 ) ( CLEAR ?auto_32198 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32199 ?auto_32200 )
      ( MAKE-4PILE ?auto_32195 ?auto_32196 ?auto_32197 ?auto_32198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32201 - BLOCK
      ?auto_32202 - BLOCK
      ?auto_32203 - BLOCK
      ?auto_32204 - BLOCK
    )
    :vars
    (
      ?auto_32206 - BLOCK
      ?auto_32205 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32201 ) ( ON ?auto_32202 ?auto_32201 ) ( not ( = ?auto_32201 ?auto_32202 ) ) ( not ( = ?auto_32201 ?auto_32203 ) ) ( not ( = ?auto_32201 ?auto_32204 ) ) ( not ( = ?auto_32201 ?auto_32206 ) ) ( not ( = ?auto_32202 ?auto_32203 ) ) ( not ( = ?auto_32202 ?auto_32204 ) ) ( not ( = ?auto_32202 ?auto_32206 ) ) ( not ( = ?auto_32203 ?auto_32204 ) ) ( not ( = ?auto_32203 ?auto_32206 ) ) ( not ( = ?auto_32204 ?auto_32206 ) ) ( ON ?auto_32206 ?auto_32205 ) ( not ( = ?auto_32201 ?auto_32205 ) ) ( not ( = ?auto_32202 ?auto_32205 ) ) ( not ( = ?auto_32203 ?auto_32205 ) ) ( not ( = ?auto_32204 ?auto_32205 ) ) ( not ( = ?auto_32206 ?auto_32205 ) ) ( ON ?auto_32204 ?auto_32206 ) ( CLEAR ?auto_32204 ) ( ON-TABLE ?auto_32205 ) ( HOLDING ?auto_32203 ) ( CLEAR ?auto_32202 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32201 ?auto_32202 ?auto_32203 )
      ( MAKE-4PILE ?auto_32201 ?auto_32202 ?auto_32203 ?auto_32204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32207 - BLOCK
      ?auto_32208 - BLOCK
      ?auto_32209 - BLOCK
      ?auto_32210 - BLOCK
    )
    :vars
    (
      ?auto_32211 - BLOCK
      ?auto_32212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32207 ) ( ON ?auto_32208 ?auto_32207 ) ( not ( = ?auto_32207 ?auto_32208 ) ) ( not ( = ?auto_32207 ?auto_32209 ) ) ( not ( = ?auto_32207 ?auto_32210 ) ) ( not ( = ?auto_32207 ?auto_32211 ) ) ( not ( = ?auto_32208 ?auto_32209 ) ) ( not ( = ?auto_32208 ?auto_32210 ) ) ( not ( = ?auto_32208 ?auto_32211 ) ) ( not ( = ?auto_32209 ?auto_32210 ) ) ( not ( = ?auto_32209 ?auto_32211 ) ) ( not ( = ?auto_32210 ?auto_32211 ) ) ( ON ?auto_32211 ?auto_32212 ) ( not ( = ?auto_32207 ?auto_32212 ) ) ( not ( = ?auto_32208 ?auto_32212 ) ) ( not ( = ?auto_32209 ?auto_32212 ) ) ( not ( = ?auto_32210 ?auto_32212 ) ) ( not ( = ?auto_32211 ?auto_32212 ) ) ( ON ?auto_32210 ?auto_32211 ) ( ON-TABLE ?auto_32212 ) ( CLEAR ?auto_32208 ) ( ON ?auto_32209 ?auto_32210 ) ( CLEAR ?auto_32209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32212 ?auto_32211 ?auto_32210 )
      ( MAKE-4PILE ?auto_32207 ?auto_32208 ?auto_32209 ?auto_32210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32213 - BLOCK
      ?auto_32214 - BLOCK
      ?auto_32215 - BLOCK
      ?auto_32216 - BLOCK
    )
    :vars
    (
      ?auto_32217 - BLOCK
      ?auto_32218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32213 ) ( not ( = ?auto_32213 ?auto_32214 ) ) ( not ( = ?auto_32213 ?auto_32215 ) ) ( not ( = ?auto_32213 ?auto_32216 ) ) ( not ( = ?auto_32213 ?auto_32217 ) ) ( not ( = ?auto_32214 ?auto_32215 ) ) ( not ( = ?auto_32214 ?auto_32216 ) ) ( not ( = ?auto_32214 ?auto_32217 ) ) ( not ( = ?auto_32215 ?auto_32216 ) ) ( not ( = ?auto_32215 ?auto_32217 ) ) ( not ( = ?auto_32216 ?auto_32217 ) ) ( ON ?auto_32217 ?auto_32218 ) ( not ( = ?auto_32213 ?auto_32218 ) ) ( not ( = ?auto_32214 ?auto_32218 ) ) ( not ( = ?auto_32215 ?auto_32218 ) ) ( not ( = ?auto_32216 ?auto_32218 ) ) ( not ( = ?auto_32217 ?auto_32218 ) ) ( ON ?auto_32216 ?auto_32217 ) ( ON-TABLE ?auto_32218 ) ( ON ?auto_32215 ?auto_32216 ) ( CLEAR ?auto_32215 ) ( HOLDING ?auto_32214 ) ( CLEAR ?auto_32213 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32213 ?auto_32214 )
      ( MAKE-4PILE ?auto_32213 ?auto_32214 ?auto_32215 ?auto_32216 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32219 - BLOCK
      ?auto_32220 - BLOCK
      ?auto_32221 - BLOCK
      ?auto_32222 - BLOCK
    )
    :vars
    (
      ?auto_32224 - BLOCK
      ?auto_32223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32219 ) ( not ( = ?auto_32219 ?auto_32220 ) ) ( not ( = ?auto_32219 ?auto_32221 ) ) ( not ( = ?auto_32219 ?auto_32222 ) ) ( not ( = ?auto_32219 ?auto_32224 ) ) ( not ( = ?auto_32220 ?auto_32221 ) ) ( not ( = ?auto_32220 ?auto_32222 ) ) ( not ( = ?auto_32220 ?auto_32224 ) ) ( not ( = ?auto_32221 ?auto_32222 ) ) ( not ( = ?auto_32221 ?auto_32224 ) ) ( not ( = ?auto_32222 ?auto_32224 ) ) ( ON ?auto_32224 ?auto_32223 ) ( not ( = ?auto_32219 ?auto_32223 ) ) ( not ( = ?auto_32220 ?auto_32223 ) ) ( not ( = ?auto_32221 ?auto_32223 ) ) ( not ( = ?auto_32222 ?auto_32223 ) ) ( not ( = ?auto_32224 ?auto_32223 ) ) ( ON ?auto_32222 ?auto_32224 ) ( ON-TABLE ?auto_32223 ) ( ON ?auto_32221 ?auto_32222 ) ( CLEAR ?auto_32219 ) ( ON ?auto_32220 ?auto_32221 ) ( CLEAR ?auto_32220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32223 ?auto_32224 ?auto_32222 ?auto_32221 )
      ( MAKE-4PILE ?auto_32219 ?auto_32220 ?auto_32221 ?auto_32222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32225 - BLOCK
      ?auto_32226 - BLOCK
      ?auto_32227 - BLOCK
      ?auto_32228 - BLOCK
    )
    :vars
    (
      ?auto_32229 - BLOCK
      ?auto_32230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32225 ?auto_32226 ) ) ( not ( = ?auto_32225 ?auto_32227 ) ) ( not ( = ?auto_32225 ?auto_32228 ) ) ( not ( = ?auto_32225 ?auto_32229 ) ) ( not ( = ?auto_32226 ?auto_32227 ) ) ( not ( = ?auto_32226 ?auto_32228 ) ) ( not ( = ?auto_32226 ?auto_32229 ) ) ( not ( = ?auto_32227 ?auto_32228 ) ) ( not ( = ?auto_32227 ?auto_32229 ) ) ( not ( = ?auto_32228 ?auto_32229 ) ) ( ON ?auto_32229 ?auto_32230 ) ( not ( = ?auto_32225 ?auto_32230 ) ) ( not ( = ?auto_32226 ?auto_32230 ) ) ( not ( = ?auto_32227 ?auto_32230 ) ) ( not ( = ?auto_32228 ?auto_32230 ) ) ( not ( = ?auto_32229 ?auto_32230 ) ) ( ON ?auto_32228 ?auto_32229 ) ( ON-TABLE ?auto_32230 ) ( ON ?auto_32227 ?auto_32228 ) ( ON ?auto_32226 ?auto_32227 ) ( CLEAR ?auto_32226 ) ( HOLDING ?auto_32225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32225 )
      ( MAKE-4PILE ?auto_32225 ?auto_32226 ?auto_32227 ?auto_32228 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32231 - BLOCK
      ?auto_32232 - BLOCK
      ?auto_32233 - BLOCK
      ?auto_32234 - BLOCK
    )
    :vars
    (
      ?auto_32235 - BLOCK
      ?auto_32236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32231 ?auto_32232 ) ) ( not ( = ?auto_32231 ?auto_32233 ) ) ( not ( = ?auto_32231 ?auto_32234 ) ) ( not ( = ?auto_32231 ?auto_32235 ) ) ( not ( = ?auto_32232 ?auto_32233 ) ) ( not ( = ?auto_32232 ?auto_32234 ) ) ( not ( = ?auto_32232 ?auto_32235 ) ) ( not ( = ?auto_32233 ?auto_32234 ) ) ( not ( = ?auto_32233 ?auto_32235 ) ) ( not ( = ?auto_32234 ?auto_32235 ) ) ( ON ?auto_32235 ?auto_32236 ) ( not ( = ?auto_32231 ?auto_32236 ) ) ( not ( = ?auto_32232 ?auto_32236 ) ) ( not ( = ?auto_32233 ?auto_32236 ) ) ( not ( = ?auto_32234 ?auto_32236 ) ) ( not ( = ?auto_32235 ?auto_32236 ) ) ( ON ?auto_32234 ?auto_32235 ) ( ON-TABLE ?auto_32236 ) ( ON ?auto_32233 ?auto_32234 ) ( ON ?auto_32232 ?auto_32233 ) ( ON ?auto_32231 ?auto_32232 ) ( CLEAR ?auto_32231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32236 ?auto_32235 ?auto_32234 ?auto_32233 ?auto_32232 )
      ( MAKE-4PILE ?auto_32231 ?auto_32232 ?auto_32233 ?auto_32234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32238 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32238 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32239 - BLOCK
    )
    :vars
    (
      ?auto_32240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32239 ?auto_32240 ) ( CLEAR ?auto_32239 ) ( HAND-EMPTY ) ( not ( = ?auto_32239 ?auto_32240 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32239 ?auto_32240 )
      ( MAKE-1PILE ?auto_32239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32241 - BLOCK
    )
    :vars
    (
      ?auto_32242 - BLOCK
      ?auto_32243 - BLOCK
      ?auto_32245 - BLOCK
      ?auto_32244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32241 ?auto_32242 ) ) ( HOLDING ?auto_32241 ) ( CLEAR ?auto_32242 ) ( ON-TABLE ?auto_32243 ) ( ON ?auto_32245 ?auto_32243 ) ( ON ?auto_32244 ?auto_32245 ) ( ON ?auto_32242 ?auto_32244 ) ( not ( = ?auto_32243 ?auto_32245 ) ) ( not ( = ?auto_32243 ?auto_32244 ) ) ( not ( = ?auto_32243 ?auto_32242 ) ) ( not ( = ?auto_32243 ?auto_32241 ) ) ( not ( = ?auto_32245 ?auto_32244 ) ) ( not ( = ?auto_32245 ?auto_32242 ) ) ( not ( = ?auto_32245 ?auto_32241 ) ) ( not ( = ?auto_32244 ?auto_32242 ) ) ( not ( = ?auto_32244 ?auto_32241 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32243 ?auto_32245 ?auto_32244 ?auto_32242 ?auto_32241 )
      ( MAKE-1PILE ?auto_32241 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32246 - BLOCK
    )
    :vars
    (
      ?auto_32249 - BLOCK
      ?auto_32247 - BLOCK
      ?auto_32250 - BLOCK
      ?auto_32248 - BLOCK
      ?auto_32251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32246 ?auto_32249 ) ) ( CLEAR ?auto_32249 ) ( ON-TABLE ?auto_32247 ) ( ON ?auto_32250 ?auto_32247 ) ( ON ?auto_32248 ?auto_32250 ) ( ON ?auto_32249 ?auto_32248 ) ( not ( = ?auto_32247 ?auto_32250 ) ) ( not ( = ?auto_32247 ?auto_32248 ) ) ( not ( = ?auto_32247 ?auto_32249 ) ) ( not ( = ?auto_32247 ?auto_32246 ) ) ( not ( = ?auto_32250 ?auto_32248 ) ) ( not ( = ?auto_32250 ?auto_32249 ) ) ( not ( = ?auto_32250 ?auto_32246 ) ) ( not ( = ?auto_32248 ?auto_32249 ) ) ( not ( = ?auto_32248 ?auto_32246 ) ) ( ON ?auto_32246 ?auto_32251 ) ( CLEAR ?auto_32246 ) ( HAND-EMPTY ) ( not ( = ?auto_32246 ?auto_32251 ) ) ( not ( = ?auto_32249 ?auto_32251 ) ) ( not ( = ?auto_32247 ?auto_32251 ) ) ( not ( = ?auto_32250 ?auto_32251 ) ) ( not ( = ?auto_32248 ?auto_32251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32246 ?auto_32251 )
      ( MAKE-1PILE ?auto_32246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32252 - BLOCK
    )
    :vars
    (
      ?auto_32257 - BLOCK
      ?auto_32253 - BLOCK
      ?auto_32255 - BLOCK
      ?auto_32254 - BLOCK
      ?auto_32256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32252 ?auto_32257 ) ) ( ON-TABLE ?auto_32253 ) ( ON ?auto_32255 ?auto_32253 ) ( ON ?auto_32254 ?auto_32255 ) ( not ( = ?auto_32253 ?auto_32255 ) ) ( not ( = ?auto_32253 ?auto_32254 ) ) ( not ( = ?auto_32253 ?auto_32257 ) ) ( not ( = ?auto_32253 ?auto_32252 ) ) ( not ( = ?auto_32255 ?auto_32254 ) ) ( not ( = ?auto_32255 ?auto_32257 ) ) ( not ( = ?auto_32255 ?auto_32252 ) ) ( not ( = ?auto_32254 ?auto_32257 ) ) ( not ( = ?auto_32254 ?auto_32252 ) ) ( ON ?auto_32252 ?auto_32256 ) ( CLEAR ?auto_32252 ) ( not ( = ?auto_32252 ?auto_32256 ) ) ( not ( = ?auto_32257 ?auto_32256 ) ) ( not ( = ?auto_32253 ?auto_32256 ) ) ( not ( = ?auto_32255 ?auto_32256 ) ) ( not ( = ?auto_32254 ?auto_32256 ) ) ( HOLDING ?auto_32257 ) ( CLEAR ?auto_32254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32253 ?auto_32255 ?auto_32254 ?auto_32257 )
      ( MAKE-1PILE ?auto_32252 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32258 - BLOCK
    )
    :vars
    (
      ?auto_32259 - BLOCK
      ?auto_32262 - BLOCK
      ?auto_32260 - BLOCK
      ?auto_32261 - BLOCK
      ?auto_32263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32258 ?auto_32259 ) ) ( ON-TABLE ?auto_32262 ) ( ON ?auto_32260 ?auto_32262 ) ( ON ?auto_32261 ?auto_32260 ) ( not ( = ?auto_32262 ?auto_32260 ) ) ( not ( = ?auto_32262 ?auto_32261 ) ) ( not ( = ?auto_32262 ?auto_32259 ) ) ( not ( = ?auto_32262 ?auto_32258 ) ) ( not ( = ?auto_32260 ?auto_32261 ) ) ( not ( = ?auto_32260 ?auto_32259 ) ) ( not ( = ?auto_32260 ?auto_32258 ) ) ( not ( = ?auto_32261 ?auto_32259 ) ) ( not ( = ?auto_32261 ?auto_32258 ) ) ( ON ?auto_32258 ?auto_32263 ) ( not ( = ?auto_32258 ?auto_32263 ) ) ( not ( = ?auto_32259 ?auto_32263 ) ) ( not ( = ?auto_32262 ?auto_32263 ) ) ( not ( = ?auto_32260 ?auto_32263 ) ) ( not ( = ?auto_32261 ?auto_32263 ) ) ( CLEAR ?auto_32261 ) ( ON ?auto_32259 ?auto_32258 ) ( CLEAR ?auto_32259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32263 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32263 ?auto_32258 )
      ( MAKE-1PILE ?auto_32258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32264 - BLOCK
    )
    :vars
    (
      ?auto_32265 - BLOCK
      ?auto_32266 - BLOCK
      ?auto_32268 - BLOCK
      ?auto_32269 - BLOCK
      ?auto_32267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32264 ?auto_32265 ) ) ( ON-TABLE ?auto_32266 ) ( ON ?auto_32268 ?auto_32266 ) ( not ( = ?auto_32266 ?auto_32268 ) ) ( not ( = ?auto_32266 ?auto_32269 ) ) ( not ( = ?auto_32266 ?auto_32265 ) ) ( not ( = ?auto_32266 ?auto_32264 ) ) ( not ( = ?auto_32268 ?auto_32269 ) ) ( not ( = ?auto_32268 ?auto_32265 ) ) ( not ( = ?auto_32268 ?auto_32264 ) ) ( not ( = ?auto_32269 ?auto_32265 ) ) ( not ( = ?auto_32269 ?auto_32264 ) ) ( ON ?auto_32264 ?auto_32267 ) ( not ( = ?auto_32264 ?auto_32267 ) ) ( not ( = ?auto_32265 ?auto_32267 ) ) ( not ( = ?auto_32266 ?auto_32267 ) ) ( not ( = ?auto_32268 ?auto_32267 ) ) ( not ( = ?auto_32269 ?auto_32267 ) ) ( ON ?auto_32265 ?auto_32264 ) ( CLEAR ?auto_32265 ) ( ON-TABLE ?auto_32267 ) ( HOLDING ?auto_32269 ) ( CLEAR ?auto_32268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32266 ?auto_32268 ?auto_32269 )
      ( MAKE-1PILE ?auto_32264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32270 - BLOCK
    )
    :vars
    (
      ?auto_32271 - BLOCK
      ?auto_32273 - BLOCK
      ?auto_32275 - BLOCK
      ?auto_32272 - BLOCK
      ?auto_32274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32270 ?auto_32271 ) ) ( ON-TABLE ?auto_32273 ) ( ON ?auto_32275 ?auto_32273 ) ( not ( = ?auto_32273 ?auto_32275 ) ) ( not ( = ?auto_32273 ?auto_32272 ) ) ( not ( = ?auto_32273 ?auto_32271 ) ) ( not ( = ?auto_32273 ?auto_32270 ) ) ( not ( = ?auto_32275 ?auto_32272 ) ) ( not ( = ?auto_32275 ?auto_32271 ) ) ( not ( = ?auto_32275 ?auto_32270 ) ) ( not ( = ?auto_32272 ?auto_32271 ) ) ( not ( = ?auto_32272 ?auto_32270 ) ) ( ON ?auto_32270 ?auto_32274 ) ( not ( = ?auto_32270 ?auto_32274 ) ) ( not ( = ?auto_32271 ?auto_32274 ) ) ( not ( = ?auto_32273 ?auto_32274 ) ) ( not ( = ?auto_32275 ?auto_32274 ) ) ( not ( = ?auto_32272 ?auto_32274 ) ) ( ON ?auto_32271 ?auto_32270 ) ( ON-TABLE ?auto_32274 ) ( CLEAR ?auto_32275 ) ( ON ?auto_32272 ?auto_32271 ) ( CLEAR ?auto_32272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32274 ?auto_32270 ?auto_32271 )
      ( MAKE-1PILE ?auto_32270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32276 - BLOCK
    )
    :vars
    (
      ?auto_32279 - BLOCK
      ?auto_32281 - BLOCK
      ?auto_32277 - BLOCK
      ?auto_32280 - BLOCK
      ?auto_32278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32276 ?auto_32279 ) ) ( ON-TABLE ?auto_32281 ) ( not ( = ?auto_32281 ?auto_32277 ) ) ( not ( = ?auto_32281 ?auto_32280 ) ) ( not ( = ?auto_32281 ?auto_32279 ) ) ( not ( = ?auto_32281 ?auto_32276 ) ) ( not ( = ?auto_32277 ?auto_32280 ) ) ( not ( = ?auto_32277 ?auto_32279 ) ) ( not ( = ?auto_32277 ?auto_32276 ) ) ( not ( = ?auto_32280 ?auto_32279 ) ) ( not ( = ?auto_32280 ?auto_32276 ) ) ( ON ?auto_32276 ?auto_32278 ) ( not ( = ?auto_32276 ?auto_32278 ) ) ( not ( = ?auto_32279 ?auto_32278 ) ) ( not ( = ?auto_32281 ?auto_32278 ) ) ( not ( = ?auto_32277 ?auto_32278 ) ) ( not ( = ?auto_32280 ?auto_32278 ) ) ( ON ?auto_32279 ?auto_32276 ) ( ON-TABLE ?auto_32278 ) ( ON ?auto_32280 ?auto_32279 ) ( CLEAR ?auto_32280 ) ( HOLDING ?auto_32277 ) ( CLEAR ?auto_32281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32281 ?auto_32277 )
      ( MAKE-1PILE ?auto_32276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32282 - BLOCK
    )
    :vars
    (
      ?auto_32284 - BLOCK
      ?auto_32285 - BLOCK
      ?auto_32287 - BLOCK
      ?auto_32286 - BLOCK
      ?auto_32283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32282 ?auto_32284 ) ) ( ON-TABLE ?auto_32285 ) ( not ( = ?auto_32285 ?auto_32287 ) ) ( not ( = ?auto_32285 ?auto_32286 ) ) ( not ( = ?auto_32285 ?auto_32284 ) ) ( not ( = ?auto_32285 ?auto_32282 ) ) ( not ( = ?auto_32287 ?auto_32286 ) ) ( not ( = ?auto_32287 ?auto_32284 ) ) ( not ( = ?auto_32287 ?auto_32282 ) ) ( not ( = ?auto_32286 ?auto_32284 ) ) ( not ( = ?auto_32286 ?auto_32282 ) ) ( ON ?auto_32282 ?auto_32283 ) ( not ( = ?auto_32282 ?auto_32283 ) ) ( not ( = ?auto_32284 ?auto_32283 ) ) ( not ( = ?auto_32285 ?auto_32283 ) ) ( not ( = ?auto_32287 ?auto_32283 ) ) ( not ( = ?auto_32286 ?auto_32283 ) ) ( ON ?auto_32284 ?auto_32282 ) ( ON-TABLE ?auto_32283 ) ( ON ?auto_32286 ?auto_32284 ) ( CLEAR ?auto_32285 ) ( ON ?auto_32287 ?auto_32286 ) ( CLEAR ?auto_32287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32283 ?auto_32282 ?auto_32284 ?auto_32286 )
      ( MAKE-1PILE ?auto_32282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32288 - BLOCK
    )
    :vars
    (
      ?auto_32289 - BLOCK
      ?auto_32291 - BLOCK
      ?auto_32292 - BLOCK
      ?auto_32290 - BLOCK
      ?auto_32293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32288 ?auto_32289 ) ) ( not ( = ?auto_32291 ?auto_32292 ) ) ( not ( = ?auto_32291 ?auto_32290 ) ) ( not ( = ?auto_32291 ?auto_32289 ) ) ( not ( = ?auto_32291 ?auto_32288 ) ) ( not ( = ?auto_32292 ?auto_32290 ) ) ( not ( = ?auto_32292 ?auto_32289 ) ) ( not ( = ?auto_32292 ?auto_32288 ) ) ( not ( = ?auto_32290 ?auto_32289 ) ) ( not ( = ?auto_32290 ?auto_32288 ) ) ( ON ?auto_32288 ?auto_32293 ) ( not ( = ?auto_32288 ?auto_32293 ) ) ( not ( = ?auto_32289 ?auto_32293 ) ) ( not ( = ?auto_32291 ?auto_32293 ) ) ( not ( = ?auto_32292 ?auto_32293 ) ) ( not ( = ?auto_32290 ?auto_32293 ) ) ( ON ?auto_32289 ?auto_32288 ) ( ON-TABLE ?auto_32293 ) ( ON ?auto_32290 ?auto_32289 ) ( ON ?auto_32292 ?auto_32290 ) ( CLEAR ?auto_32292 ) ( HOLDING ?auto_32291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32291 )
      ( MAKE-1PILE ?auto_32288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32294 - BLOCK
    )
    :vars
    (
      ?auto_32297 - BLOCK
      ?auto_32296 - BLOCK
      ?auto_32298 - BLOCK
      ?auto_32295 - BLOCK
      ?auto_32299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32294 ?auto_32297 ) ) ( not ( = ?auto_32296 ?auto_32298 ) ) ( not ( = ?auto_32296 ?auto_32295 ) ) ( not ( = ?auto_32296 ?auto_32297 ) ) ( not ( = ?auto_32296 ?auto_32294 ) ) ( not ( = ?auto_32298 ?auto_32295 ) ) ( not ( = ?auto_32298 ?auto_32297 ) ) ( not ( = ?auto_32298 ?auto_32294 ) ) ( not ( = ?auto_32295 ?auto_32297 ) ) ( not ( = ?auto_32295 ?auto_32294 ) ) ( ON ?auto_32294 ?auto_32299 ) ( not ( = ?auto_32294 ?auto_32299 ) ) ( not ( = ?auto_32297 ?auto_32299 ) ) ( not ( = ?auto_32296 ?auto_32299 ) ) ( not ( = ?auto_32298 ?auto_32299 ) ) ( not ( = ?auto_32295 ?auto_32299 ) ) ( ON ?auto_32297 ?auto_32294 ) ( ON-TABLE ?auto_32299 ) ( ON ?auto_32295 ?auto_32297 ) ( ON ?auto_32298 ?auto_32295 ) ( ON ?auto_32296 ?auto_32298 ) ( CLEAR ?auto_32296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32299 ?auto_32294 ?auto_32297 ?auto_32295 ?auto_32298 )
      ( MAKE-1PILE ?auto_32294 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32303 - BLOCK
      ?auto_32304 - BLOCK
      ?auto_32305 - BLOCK
    )
    :vars
    (
      ?auto_32306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32306 ?auto_32305 ) ( CLEAR ?auto_32306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32303 ) ( ON ?auto_32304 ?auto_32303 ) ( ON ?auto_32305 ?auto_32304 ) ( not ( = ?auto_32303 ?auto_32304 ) ) ( not ( = ?auto_32303 ?auto_32305 ) ) ( not ( = ?auto_32303 ?auto_32306 ) ) ( not ( = ?auto_32304 ?auto_32305 ) ) ( not ( = ?auto_32304 ?auto_32306 ) ) ( not ( = ?auto_32305 ?auto_32306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32306 ?auto_32305 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32307 - BLOCK
      ?auto_32308 - BLOCK
      ?auto_32309 - BLOCK
    )
    :vars
    (
      ?auto_32310 - BLOCK
      ?auto_32311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32310 ?auto_32309 ) ( CLEAR ?auto_32310 ) ( ON-TABLE ?auto_32307 ) ( ON ?auto_32308 ?auto_32307 ) ( ON ?auto_32309 ?auto_32308 ) ( not ( = ?auto_32307 ?auto_32308 ) ) ( not ( = ?auto_32307 ?auto_32309 ) ) ( not ( = ?auto_32307 ?auto_32310 ) ) ( not ( = ?auto_32308 ?auto_32309 ) ) ( not ( = ?auto_32308 ?auto_32310 ) ) ( not ( = ?auto_32309 ?auto_32310 ) ) ( HOLDING ?auto_32311 ) ( not ( = ?auto_32307 ?auto_32311 ) ) ( not ( = ?auto_32308 ?auto_32311 ) ) ( not ( = ?auto_32309 ?auto_32311 ) ) ( not ( = ?auto_32310 ?auto_32311 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_32311 )
      ( MAKE-3PILE ?auto_32307 ?auto_32308 ?auto_32309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32312 - BLOCK
      ?auto_32313 - BLOCK
      ?auto_32314 - BLOCK
    )
    :vars
    (
      ?auto_32316 - BLOCK
      ?auto_32315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32316 ?auto_32314 ) ( ON-TABLE ?auto_32312 ) ( ON ?auto_32313 ?auto_32312 ) ( ON ?auto_32314 ?auto_32313 ) ( not ( = ?auto_32312 ?auto_32313 ) ) ( not ( = ?auto_32312 ?auto_32314 ) ) ( not ( = ?auto_32312 ?auto_32316 ) ) ( not ( = ?auto_32313 ?auto_32314 ) ) ( not ( = ?auto_32313 ?auto_32316 ) ) ( not ( = ?auto_32314 ?auto_32316 ) ) ( not ( = ?auto_32312 ?auto_32315 ) ) ( not ( = ?auto_32313 ?auto_32315 ) ) ( not ( = ?auto_32314 ?auto_32315 ) ) ( not ( = ?auto_32316 ?auto_32315 ) ) ( ON ?auto_32315 ?auto_32316 ) ( CLEAR ?auto_32315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32312 ?auto_32313 ?auto_32314 ?auto_32316 )
      ( MAKE-3PILE ?auto_32312 ?auto_32313 ?auto_32314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32317 - BLOCK
      ?auto_32318 - BLOCK
      ?auto_32319 - BLOCK
    )
    :vars
    (
      ?auto_32321 - BLOCK
      ?auto_32320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32321 ?auto_32319 ) ( ON-TABLE ?auto_32317 ) ( ON ?auto_32318 ?auto_32317 ) ( ON ?auto_32319 ?auto_32318 ) ( not ( = ?auto_32317 ?auto_32318 ) ) ( not ( = ?auto_32317 ?auto_32319 ) ) ( not ( = ?auto_32317 ?auto_32321 ) ) ( not ( = ?auto_32318 ?auto_32319 ) ) ( not ( = ?auto_32318 ?auto_32321 ) ) ( not ( = ?auto_32319 ?auto_32321 ) ) ( not ( = ?auto_32317 ?auto_32320 ) ) ( not ( = ?auto_32318 ?auto_32320 ) ) ( not ( = ?auto_32319 ?auto_32320 ) ) ( not ( = ?auto_32321 ?auto_32320 ) ) ( HOLDING ?auto_32320 ) ( CLEAR ?auto_32321 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32317 ?auto_32318 ?auto_32319 ?auto_32321 ?auto_32320 )
      ( MAKE-3PILE ?auto_32317 ?auto_32318 ?auto_32319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32322 - BLOCK
      ?auto_32323 - BLOCK
      ?auto_32324 - BLOCK
    )
    :vars
    (
      ?auto_32325 - BLOCK
      ?auto_32326 - BLOCK
      ?auto_32327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32325 ?auto_32324 ) ( ON-TABLE ?auto_32322 ) ( ON ?auto_32323 ?auto_32322 ) ( ON ?auto_32324 ?auto_32323 ) ( not ( = ?auto_32322 ?auto_32323 ) ) ( not ( = ?auto_32322 ?auto_32324 ) ) ( not ( = ?auto_32322 ?auto_32325 ) ) ( not ( = ?auto_32323 ?auto_32324 ) ) ( not ( = ?auto_32323 ?auto_32325 ) ) ( not ( = ?auto_32324 ?auto_32325 ) ) ( not ( = ?auto_32322 ?auto_32326 ) ) ( not ( = ?auto_32323 ?auto_32326 ) ) ( not ( = ?auto_32324 ?auto_32326 ) ) ( not ( = ?auto_32325 ?auto_32326 ) ) ( CLEAR ?auto_32325 ) ( ON ?auto_32326 ?auto_32327 ) ( CLEAR ?auto_32326 ) ( HAND-EMPTY ) ( not ( = ?auto_32322 ?auto_32327 ) ) ( not ( = ?auto_32323 ?auto_32327 ) ) ( not ( = ?auto_32324 ?auto_32327 ) ) ( not ( = ?auto_32325 ?auto_32327 ) ) ( not ( = ?auto_32326 ?auto_32327 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32326 ?auto_32327 )
      ( MAKE-3PILE ?auto_32322 ?auto_32323 ?auto_32324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32340 - BLOCK
      ?auto_32341 - BLOCK
      ?auto_32342 - BLOCK
    )
    :vars
    (
      ?auto_32344 - BLOCK
      ?auto_32345 - BLOCK
      ?auto_32343 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32340 ) ( ON ?auto_32341 ?auto_32340 ) ( not ( = ?auto_32340 ?auto_32341 ) ) ( not ( = ?auto_32340 ?auto_32342 ) ) ( not ( = ?auto_32340 ?auto_32344 ) ) ( not ( = ?auto_32341 ?auto_32342 ) ) ( not ( = ?auto_32341 ?auto_32344 ) ) ( not ( = ?auto_32342 ?auto_32344 ) ) ( not ( = ?auto_32340 ?auto_32345 ) ) ( not ( = ?auto_32341 ?auto_32345 ) ) ( not ( = ?auto_32342 ?auto_32345 ) ) ( not ( = ?auto_32344 ?auto_32345 ) ) ( ON ?auto_32345 ?auto_32343 ) ( not ( = ?auto_32340 ?auto_32343 ) ) ( not ( = ?auto_32341 ?auto_32343 ) ) ( not ( = ?auto_32342 ?auto_32343 ) ) ( not ( = ?auto_32344 ?auto_32343 ) ) ( not ( = ?auto_32345 ?auto_32343 ) ) ( ON ?auto_32344 ?auto_32345 ) ( CLEAR ?auto_32344 ) ( HOLDING ?auto_32342 ) ( CLEAR ?auto_32341 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32340 ?auto_32341 ?auto_32342 ?auto_32344 )
      ( MAKE-3PILE ?auto_32340 ?auto_32341 ?auto_32342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32346 - BLOCK
      ?auto_32347 - BLOCK
      ?auto_32348 - BLOCK
    )
    :vars
    (
      ?auto_32351 - BLOCK
      ?auto_32349 - BLOCK
      ?auto_32350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32346 ) ( ON ?auto_32347 ?auto_32346 ) ( not ( = ?auto_32346 ?auto_32347 ) ) ( not ( = ?auto_32346 ?auto_32348 ) ) ( not ( = ?auto_32346 ?auto_32351 ) ) ( not ( = ?auto_32347 ?auto_32348 ) ) ( not ( = ?auto_32347 ?auto_32351 ) ) ( not ( = ?auto_32348 ?auto_32351 ) ) ( not ( = ?auto_32346 ?auto_32349 ) ) ( not ( = ?auto_32347 ?auto_32349 ) ) ( not ( = ?auto_32348 ?auto_32349 ) ) ( not ( = ?auto_32351 ?auto_32349 ) ) ( ON ?auto_32349 ?auto_32350 ) ( not ( = ?auto_32346 ?auto_32350 ) ) ( not ( = ?auto_32347 ?auto_32350 ) ) ( not ( = ?auto_32348 ?auto_32350 ) ) ( not ( = ?auto_32351 ?auto_32350 ) ) ( not ( = ?auto_32349 ?auto_32350 ) ) ( ON ?auto_32351 ?auto_32349 ) ( CLEAR ?auto_32347 ) ( ON ?auto_32348 ?auto_32351 ) ( CLEAR ?auto_32348 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32350 ?auto_32349 ?auto_32351 )
      ( MAKE-3PILE ?auto_32346 ?auto_32347 ?auto_32348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32352 - BLOCK
      ?auto_32353 - BLOCK
      ?auto_32354 - BLOCK
    )
    :vars
    (
      ?auto_32355 - BLOCK
      ?auto_32356 - BLOCK
      ?auto_32357 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32352 ) ( not ( = ?auto_32352 ?auto_32353 ) ) ( not ( = ?auto_32352 ?auto_32354 ) ) ( not ( = ?auto_32352 ?auto_32355 ) ) ( not ( = ?auto_32353 ?auto_32354 ) ) ( not ( = ?auto_32353 ?auto_32355 ) ) ( not ( = ?auto_32354 ?auto_32355 ) ) ( not ( = ?auto_32352 ?auto_32356 ) ) ( not ( = ?auto_32353 ?auto_32356 ) ) ( not ( = ?auto_32354 ?auto_32356 ) ) ( not ( = ?auto_32355 ?auto_32356 ) ) ( ON ?auto_32356 ?auto_32357 ) ( not ( = ?auto_32352 ?auto_32357 ) ) ( not ( = ?auto_32353 ?auto_32357 ) ) ( not ( = ?auto_32354 ?auto_32357 ) ) ( not ( = ?auto_32355 ?auto_32357 ) ) ( not ( = ?auto_32356 ?auto_32357 ) ) ( ON ?auto_32355 ?auto_32356 ) ( ON ?auto_32354 ?auto_32355 ) ( CLEAR ?auto_32354 ) ( ON-TABLE ?auto_32357 ) ( HOLDING ?auto_32353 ) ( CLEAR ?auto_32352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32352 ?auto_32353 )
      ( MAKE-3PILE ?auto_32352 ?auto_32353 ?auto_32354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32358 - BLOCK
      ?auto_32359 - BLOCK
      ?auto_32360 - BLOCK
    )
    :vars
    (
      ?auto_32363 - BLOCK
      ?auto_32361 - BLOCK
      ?auto_32362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32358 ) ( not ( = ?auto_32358 ?auto_32359 ) ) ( not ( = ?auto_32358 ?auto_32360 ) ) ( not ( = ?auto_32358 ?auto_32363 ) ) ( not ( = ?auto_32359 ?auto_32360 ) ) ( not ( = ?auto_32359 ?auto_32363 ) ) ( not ( = ?auto_32360 ?auto_32363 ) ) ( not ( = ?auto_32358 ?auto_32361 ) ) ( not ( = ?auto_32359 ?auto_32361 ) ) ( not ( = ?auto_32360 ?auto_32361 ) ) ( not ( = ?auto_32363 ?auto_32361 ) ) ( ON ?auto_32361 ?auto_32362 ) ( not ( = ?auto_32358 ?auto_32362 ) ) ( not ( = ?auto_32359 ?auto_32362 ) ) ( not ( = ?auto_32360 ?auto_32362 ) ) ( not ( = ?auto_32363 ?auto_32362 ) ) ( not ( = ?auto_32361 ?auto_32362 ) ) ( ON ?auto_32363 ?auto_32361 ) ( ON ?auto_32360 ?auto_32363 ) ( ON-TABLE ?auto_32362 ) ( CLEAR ?auto_32358 ) ( ON ?auto_32359 ?auto_32360 ) ( CLEAR ?auto_32359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32362 ?auto_32361 ?auto_32363 ?auto_32360 )
      ( MAKE-3PILE ?auto_32358 ?auto_32359 ?auto_32360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32364 - BLOCK
      ?auto_32365 - BLOCK
      ?auto_32366 - BLOCK
    )
    :vars
    (
      ?auto_32369 - BLOCK
      ?auto_32368 - BLOCK
      ?auto_32367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32364 ?auto_32365 ) ) ( not ( = ?auto_32364 ?auto_32366 ) ) ( not ( = ?auto_32364 ?auto_32369 ) ) ( not ( = ?auto_32365 ?auto_32366 ) ) ( not ( = ?auto_32365 ?auto_32369 ) ) ( not ( = ?auto_32366 ?auto_32369 ) ) ( not ( = ?auto_32364 ?auto_32368 ) ) ( not ( = ?auto_32365 ?auto_32368 ) ) ( not ( = ?auto_32366 ?auto_32368 ) ) ( not ( = ?auto_32369 ?auto_32368 ) ) ( ON ?auto_32368 ?auto_32367 ) ( not ( = ?auto_32364 ?auto_32367 ) ) ( not ( = ?auto_32365 ?auto_32367 ) ) ( not ( = ?auto_32366 ?auto_32367 ) ) ( not ( = ?auto_32369 ?auto_32367 ) ) ( not ( = ?auto_32368 ?auto_32367 ) ) ( ON ?auto_32369 ?auto_32368 ) ( ON ?auto_32366 ?auto_32369 ) ( ON-TABLE ?auto_32367 ) ( ON ?auto_32365 ?auto_32366 ) ( CLEAR ?auto_32365 ) ( HOLDING ?auto_32364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32364 )
      ( MAKE-3PILE ?auto_32364 ?auto_32365 ?auto_32366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32370 - BLOCK
      ?auto_32371 - BLOCK
      ?auto_32372 - BLOCK
    )
    :vars
    (
      ?auto_32373 - BLOCK
      ?auto_32374 - BLOCK
      ?auto_32375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32370 ?auto_32371 ) ) ( not ( = ?auto_32370 ?auto_32372 ) ) ( not ( = ?auto_32370 ?auto_32373 ) ) ( not ( = ?auto_32371 ?auto_32372 ) ) ( not ( = ?auto_32371 ?auto_32373 ) ) ( not ( = ?auto_32372 ?auto_32373 ) ) ( not ( = ?auto_32370 ?auto_32374 ) ) ( not ( = ?auto_32371 ?auto_32374 ) ) ( not ( = ?auto_32372 ?auto_32374 ) ) ( not ( = ?auto_32373 ?auto_32374 ) ) ( ON ?auto_32374 ?auto_32375 ) ( not ( = ?auto_32370 ?auto_32375 ) ) ( not ( = ?auto_32371 ?auto_32375 ) ) ( not ( = ?auto_32372 ?auto_32375 ) ) ( not ( = ?auto_32373 ?auto_32375 ) ) ( not ( = ?auto_32374 ?auto_32375 ) ) ( ON ?auto_32373 ?auto_32374 ) ( ON ?auto_32372 ?auto_32373 ) ( ON-TABLE ?auto_32375 ) ( ON ?auto_32371 ?auto_32372 ) ( ON ?auto_32370 ?auto_32371 ) ( CLEAR ?auto_32370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32375 ?auto_32374 ?auto_32373 ?auto_32372 ?auto_32371 )
      ( MAKE-3PILE ?auto_32370 ?auto_32371 ?auto_32372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32378 - BLOCK
      ?auto_32379 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32379 ) ( CLEAR ?auto_32378 ) ( ON-TABLE ?auto_32378 ) ( not ( = ?auto_32378 ?auto_32379 ) ) )
    :subtasks
    ( ( !STACK ?auto_32379 ?auto_32378 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32380 - BLOCK
      ?auto_32381 - BLOCK
    )
    :vars
    (
      ?auto_32382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32380 ) ( ON-TABLE ?auto_32380 ) ( not ( = ?auto_32380 ?auto_32381 ) ) ( ON ?auto_32381 ?auto_32382 ) ( CLEAR ?auto_32381 ) ( HAND-EMPTY ) ( not ( = ?auto_32380 ?auto_32382 ) ) ( not ( = ?auto_32381 ?auto_32382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32381 ?auto_32382 )
      ( MAKE-2PILE ?auto_32380 ?auto_32381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32383 - BLOCK
      ?auto_32384 - BLOCK
    )
    :vars
    (
      ?auto_32385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32383 ?auto_32384 ) ) ( ON ?auto_32384 ?auto_32385 ) ( CLEAR ?auto_32384 ) ( not ( = ?auto_32383 ?auto_32385 ) ) ( not ( = ?auto_32384 ?auto_32385 ) ) ( HOLDING ?auto_32383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32383 )
      ( MAKE-2PILE ?auto_32383 ?auto_32384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32386 - BLOCK
      ?auto_32387 - BLOCK
    )
    :vars
    (
      ?auto_32388 - BLOCK
      ?auto_32390 - BLOCK
      ?auto_32389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32386 ?auto_32387 ) ) ( ON ?auto_32387 ?auto_32388 ) ( not ( = ?auto_32386 ?auto_32388 ) ) ( not ( = ?auto_32387 ?auto_32388 ) ) ( ON ?auto_32386 ?auto_32387 ) ( CLEAR ?auto_32386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32390 ) ( ON ?auto_32389 ?auto_32390 ) ( ON ?auto_32388 ?auto_32389 ) ( not ( = ?auto_32390 ?auto_32389 ) ) ( not ( = ?auto_32390 ?auto_32388 ) ) ( not ( = ?auto_32390 ?auto_32387 ) ) ( not ( = ?auto_32390 ?auto_32386 ) ) ( not ( = ?auto_32389 ?auto_32388 ) ) ( not ( = ?auto_32389 ?auto_32387 ) ) ( not ( = ?auto_32389 ?auto_32386 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32390 ?auto_32389 ?auto_32388 ?auto_32387 )
      ( MAKE-2PILE ?auto_32386 ?auto_32387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32391 - BLOCK
      ?auto_32392 - BLOCK
    )
    :vars
    (
      ?auto_32393 - BLOCK
      ?auto_32395 - BLOCK
      ?auto_32394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32391 ?auto_32392 ) ) ( ON ?auto_32392 ?auto_32393 ) ( not ( = ?auto_32391 ?auto_32393 ) ) ( not ( = ?auto_32392 ?auto_32393 ) ) ( ON-TABLE ?auto_32395 ) ( ON ?auto_32394 ?auto_32395 ) ( ON ?auto_32393 ?auto_32394 ) ( not ( = ?auto_32395 ?auto_32394 ) ) ( not ( = ?auto_32395 ?auto_32393 ) ) ( not ( = ?auto_32395 ?auto_32392 ) ) ( not ( = ?auto_32395 ?auto_32391 ) ) ( not ( = ?auto_32394 ?auto_32393 ) ) ( not ( = ?auto_32394 ?auto_32392 ) ) ( not ( = ?auto_32394 ?auto_32391 ) ) ( HOLDING ?auto_32391 ) ( CLEAR ?auto_32392 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32395 ?auto_32394 ?auto_32393 ?auto_32392 ?auto_32391 )
      ( MAKE-2PILE ?auto_32391 ?auto_32392 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32396 - BLOCK
      ?auto_32397 - BLOCK
    )
    :vars
    (
      ?auto_32399 - BLOCK
      ?auto_32398 - BLOCK
      ?auto_32400 - BLOCK
      ?auto_32401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32396 ?auto_32397 ) ) ( ON ?auto_32397 ?auto_32399 ) ( not ( = ?auto_32396 ?auto_32399 ) ) ( not ( = ?auto_32397 ?auto_32399 ) ) ( ON-TABLE ?auto_32398 ) ( ON ?auto_32400 ?auto_32398 ) ( ON ?auto_32399 ?auto_32400 ) ( not ( = ?auto_32398 ?auto_32400 ) ) ( not ( = ?auto_32398 ?auto_32399 ) ) ( not ( = ?auto_32398 ?auto_32397 ) ) ( not ( = ?auto_32398 ?auto_32396 ) ) ( not ( = ?auto_32400 ?auto_32399 ) ) ( not ( = ?auto_32400 ?auto_32397 ) ) ( not ( = ?auto_32400 ?auto_32396 ) ) ( CLEAR ?auto_32397 ) ( ON ?auto_32396 ?auto_32401 ) ( CLEAR ?auto_32396 ) ( HAND-EMPTY ) ( not ( = ?auto_32396 ?auto_32401 ) ) ( not ( = ?auto_32397 ?auto_32401 ) ) ( not ( = ?auto_32399 ?auto_32401 ) ) ( not ( = ?auto_32398 ?auto_32401 ) ) ( not ( = ?auto_32400 ?auto_32401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32396 ?auto_32401 )
      ( MAKE-2PILE ?auto_32396 ?auto_32397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32402 - BLOCK
      ?auto_32403 - BLOCK
    )
    :vars
    (
      ?auto_32406 - BLOCK
      ?auto_32404 - BLOCK
      ?auto_32407 - BLOCK
      ?auto_32405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32402 ?auto_32403 ) ) ( not ( = ?auto_32402 ?auto_32406 ) ) ( not ( = ?auto_32403 ?auto_32406 ) ) ( ON-TABLE ?auto_32404 ) ( ON ?auto_32407 ?auto_32404 ) ( ON ?auto_32406 ?auto_32407 ) ( not ( = ?auto_32404 ?auto_32407 ) ) ( not ( = ?auto_32404 ?auto_32406 ) ) ( not ( = ?auto_32404 ?auto_32403 ) ) ( not ( = ?auto_32404 ?auto_32402 ) ) ( not ( = ?auto_32407 ?auto_32406 ) ) ( not ( = ?auto_32407 ?auto_32403 ) ) ( not ( = ?auto_32407 ?auto_32402 ) ) ( ON ?auto_32402 ?auto_32405 ) ( CLEAR ?auto_32402 ) ( not ( = ?auto_32402 ?auto_32405 ) ) ( not ( = ?auto_32403 ?auto_32405 ) ) ( not ( = ?auto_32406 ?auto_32405 ) ) ( not ( = ?auto_32404 ?auto_32405 ) ) ( not ( = ?auto_32407 ?auto_32405 ) ) ( HOLDING ?auto_32403 ) ( CLEAR ?auto_32406 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32404 ?auto_32407 ?auto_32406 ?auto_32403 )
      ( MAKE-2PILE ?auto_32402 ?auto_32403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32408 - BLOCK
      ?auto_32409 - BLOCK
    )
    :vars
    (
      ?auto_32410 - BLOCK
      ?auto_32412 - BLOCK
      ?auto_32411 - BLOCK
      ?auto_32413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32408 ?auto_32409 ) ) ( not ( = ?auto_32408 ?auto_32410 ) ) ( not ( = ?auto_32409 ?auto_32410 ) ) ( ON-TABLE ?auto_32412 ) ( ON ?auto_32411 ?auto_32412 ) ( ON ?auto_32410 ?auto_32411 ) ( not ( = ?auto_32412 ?auto_32411 ) ) ( not ( = ?auto_32412 ?auto_32410 ) ) ( not ( = ?auto_32412 ?auto_32409 ) ) ( not ( = ?auto_32412 ?auto_32408 ) ) ( not ( = ?auto_32411 ?auto_32410 ) ) ( not ( = ?auto_32411 ?auto_32409 ) ) ( not ( = ?auto_32411 ?auto_32408 ) ) ( ON ?auto_32408 ?auto_32413 ) ( not ( = ?auto_32408 ?auto_32413 ) ) ( not ( = ?auto_32409 ?auto_32413 ) ) ( not ( = ?auto_32410 ?auto_32413 ) ) ( not ( = ?auto_32412 ?auto_32413 ) ) ( not ( = ?auto_32411 ?auto_32413 ) ) ( CLEAR ?auto_32410 ) ( ON ?auto_32409 ?auto_32408 ) ( CLEAR ?auto_32409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32413 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32413 ?auto_32408 )
      ( MAKE-2PILE ?auto_32408 ?auto_32409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32414 - BLOCK
      ?auto_32415 - BLOCK
    )
    :vars
    (
      ?auto_32418 - BLOCK
      ?auto_32419 - BLOCK
      ?auto_32416 - BLOCK
      ?auto_32417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32414 ?auto_32415 ) ) ( not ( = ?auto_32414 ?auto_32418 ) ) ( not ( = ?auto_32415 ?auto_32418 ) ) ( ON-TABLE ?auto_32419 ) ( ON ?auto_32416 ?auto_32419 ) ( not ( = ?auto_32419 ?auto_32416 ) ) ( not ( = ?auto_32419 ?auto_32418 ) ) ( not ( = ?auto_32419 ?auto_32415 ) ) ( not ( = ?auto_32419 ?auto_32414 ) ) ( not ( = ?auto_32416 ?auto_32418 ) ) ( not ( = ?auto_32416 ?auto_32415 ) ) ( not ( = ?auto_32416 ?auto_32414 ) ) ( ON ?auto_32414 ?auto_32417 ) ( not ( = ?auto_32414 ?auto_32417 ) ) ( not ( = ?auto_32415 ?auto_32417 ) ) ( not ( = ?auto_32418 ?auto_32417 ) ) ( not ( = ?auto_32419 ?auto_32417 ) ) ( not ( = ?auto_32416 ?auto_32417 ) ) ( ON ?auto_32415 ?auto_32414 ) ( CLEAR ?auto_32415 ) ( ON-TABLE ?auto_32417 ) ( HOLDING ?auto_32418 ) ( CLEAR ?auto_32416 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32419 ?auto_32416 ?auto_32418 )
      ( MAKE-2PILE ?auto_32414 ?auto_32415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32420 - BLOCK
      ?auto_32421 - BLOCK
    )
    :vars
    (
      ?auto_32425 - BLOCK
      ?auto_32423 - BLOCK
      ?auto_32424 - BLOCK
      ?auto_32422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32420 ?auto_32421 ) ) ( not ( = ?auto_32420 ?auto_32425 ) ) ( not ( = ?auto_32421 ?auto_32425 ) ) ( ON-TABLE ?auto_32423 ) ( ON ?auto_32424 ?auto_32423 ) ( not ( = ?auto_32423 ?auto_32424 ) ) ( not ( = ?auto_32423 ?auto_32425 ) ) ( not ( = ?auto_32423 ?auto_32421 ) ) ( not ( = ?auto_32423 ?auto_32420 ) ) ( not ( = ?auto_32424 ?auto_32425 ) ) ( not ( = ?auto_32424 ?auto_32421 ) ) ( not ( = ?auto_32424 ?auto_32420 ) ) ( ON ?auto_32420 ?auto_32422 ) ( not ( = ?auto_32420 ?auto_32422 ) ) ( not ( = ?auto_32421 ?auto_32422 ) ) ( not ( = ?auto_32425 ?auto_32422 ) ) ( not ( = ?auto_32423 ?auto_32422 ) ) ( not ( = ?auto_32424 ?auto_32422 ) ) ( ON ?auto_32421 ?auto_32420 ) ( ON-TABLE ?auto_32422 ) ( CLEAR ?auto_32424 ) ( ON ?auto_32425 ?auto_32421 ) ( CLEAR ?auto_32425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32422 ?auto_32420 ?auto_32421 )
      ( MAKE-2PILE ?auto_32420 ?auto_32421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32426 - BLOCK
      ?auto_32427 - BLOCK
    )
    :vars
    (
      ?auto_32428 - BLOCK
      ?auto_32431 - BLOCK
      ?auto_32430 - BLOCK
      ?auto_32429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32426 ?auto_32427 ) ) ( not ( = ?auto_32426 ?auto_32428 ) ) ( not ( = ?auto_32427 ?auto_32428 ) ) ( ON-TABLE ?auto_32431 ) ( not ( = ?auto_32431 ?auto_32430 ) ) ( not ( = ?auto_32431 ?auto_32428 ) ) ( not ( = ?auto_32431 ?auto_32427 ) ) ( not ( = ?auto_32431 ?auto_32426 ) ) ( not ( = ?auto_32430 ?auto_32428 ) ) ( not ( = ?auto_32430 ?auto_32427 ) ) ( not ( = ?auto_32430 ?auto_32426 ) ) ( ON ?auto_32426 ?auto_32429 ) ( not ( = ?auto_32426 ?auto_32429 ) ) ( not ( = ?auto_32427 ?auto_32429 ) ) ( not ( = ?auto_32428 ?auto_32429 ) ) ( not ( = ?auto_32431 ?auto_32429 ) ) ( not ( = ?auto_32430 ?auto_32429 ) ) ( ON ?auto_32427 ?auto_32426 ) ( ON-TABLE ?auto_32429 ) ( ON ?auto_32428 ?auto_32427 ) ( CLEAR ?auto_32428 ) ( HOLDING ?auto_32430 ) ( CLEAR ?auto_32431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32431 ?auto_32430 )
      ( MAKE-2PILE ?auto_32426 ?auto_32427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32432 - BLOCK
      ?auto_32433 - BLOCK
    )
    :vars
    (
      ?auto_32435 - BLOCK
      ?auto_32436 - BLOCK
      ?auto_32434 - BLOCK
      ?auto_32437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32432 ?auto_32433 ) ) ( not ( = ?auto_32432 ?auto_32435 ) ) ( not ( = ?auto_32433 ?auto_32435 ) ) ( ON-TABLE ?auto_32436 ) ( not ( = ?auto_32436 ?auto_32434 ) ) ( not ( = ?auto_32436 ?auto_32435 ) ) ( not ( = ?auto_32436 ?auto_32433 ) ) ( not ( = ?auto_32436 ?auto_32432 ) ) ( not ( = ?auto_32434 ?auto_32435 ) ) ( not ( = ?auto_32434 ?auto_32433 ) ) ( not ( = ?auto_32434 ?auto_32432 ) ) ( ON ?auto_32432 ?auto_32437 ) ( not ( = ?auto_32432 ?auto_32437 ) ) ( not ( = ?auto_32433 ?auto_32437 ) ) ( not ( = ?auto_32435 ?auto_32437 ) ) ( not ( = ?auto_32436 ?auto_32437 ) ) ( not ( = ?auto_32434 ?auto_32437 ) ) ( ON ?auto_32433 ?auto_32432 ) ( ON-TABLE ?auto_32437 ) ( ON ?auto_32435 ?auto_32433 ) ( CLEAR ?auto_32436 ) ( ON ?auto_32434 ?auto_32435 ) ( CLEAR ?auto_32434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32437 ?auto_32432 ?auto_32433 ?auto_32435 )
      ( MAKE-2PILE ?auto_32432 ?auto_32433 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32438 - BLOCK
      ?auto_32439 - BLOCK
    )
    :vars
    (
      ?auto_32443 - BLOCK
      ?auto_32441 - BLOCK
      ?auto_32442 - BLOCK
      ?auto_32440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32438 ?auto_32439 ) ) ( not ( = ?auto_32438 ?auto_32443 ) ) ( not ( = ?auto_32439 ?auto_32443 ) ) ( not ( = ?auto_32441 ?auto_32442 ) ) ( not ( = ?auto_32441 ?auto_32443 ) ) ( not ( = ?auto_32441 ?auto_32439 ) ) ( not ( = ?auto_32441 ?auto_32438 ) ) ( not ( = ?auto_32442 ?auto_32443 ) ) ( not ( = ?auto_32442 ?auto_32439 ) ) ( not ( = ?auto_32442 ?auto_32438 ) ) ( ON ?auto_32438 ?auto_32440 ) ( not ( = ?auto_32438 ?auto_32440 ) ) ( not ( = ?auto_32439 ?auto_32440 ) ) ( not ( = ?auto_32443 ?auto_32440 ) ) ( not ( = ?auto_32441 ?auto_32440 ) ) ( not ( = ?auto_32442 ?auto_32440 ) ) ( ON ?auto_32439 ?auto_32438 ) ( ON-TABLE ?auto_32440 ) ( ON ?auto_32443 ?auto_32439 ) ( ON ?auto_32442 ?auto_32443 ) ( CLEAR ?auto_32442 ) ( HOLDING ?auto_32441 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32441 )
      ( MAKE-2PILE ?auto_32438 ?auto_32439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32444 - BLOCK
      ?auto_32445 - BLOCK
    )
    :vars
    (
      ?auto_32447 - BLOCK
      ?auto_32446 - BLOCK
      ?auto_32449 - BLOCK
      ?auto_32448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32444 ?auto_32445 ) ) ( not ( = ?auto_32444 ?auto_32447 ) ) ( not ( = ?auto_32445 ?auto_32447 ) ) ( not ( = ?auto_32446 ?auto_32449 ) ) ( not ( = ?auto_32446 ?auto_32447 ) ) ( not ( = ?auto_32446 ?auto_32445 ) ) ( not ( = ?auto_32446 ?auto_32444 ) ) ( not ( = ?auto_32449 ?auto_32447 ) ) ( not ( = ?auto_32449 ?auto_32445 ) ) ( not ( = ?auto_32449 ?auto_32444 ) ) ( ON ?auto_32444 ?auto_32448 ) ( not ( = ?auto_32444 ?auto_32448 ) ) ( not ( = ?auto_32445 ?auto_32448 ) ) ( not ( = ?auto_32447 ?auto_32448 ) ) ( not ( = ?auto_32446 ?auto_32448 ) ) ( not ( = ?auto_32449 ?auto_32448 ) ) ( ON ?auto_32445 ?auto_32444 ) ( ON-TABLE ?auto_32448 ) ( ON ?auto_32447 ?auto_32445 ) ( ON ?auto_32449 ?auto_32447 ) ( ON ?auto_32446 ?auto_32449 ) ( CLEAR ?auto_32446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32448 ?auto_32444 ?auto_32445 ?auto_32447 ?auto_32449 )
      ( MAKE-2PILE ?auto_32444 ?auto_32445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32452 - BLOCK
      ?auto_32453 - BLOCK
    )
    :vars
    (
      ?auto_32454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32454 ?auto_32453 ) ( CLEAR ?auto_32454 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32452 ) ( ON ?auto_32453 ?auto_32452 ) ( not ( = ?auto_32452 ?auto_32453 ) ) ( not ( = ?auto_32452 ?auto_32454 ) ) ( not ( = ?auto_32453 ?auto_32454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32454 ?auto_32453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32455 - BLOCK
      ?auto_32456 - BLOCK
    )
    :vars
    (
      ?auto_32457 - BLOCK
      ?auto_32458 - BLOCK
      ?auto_32459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32457 ?auto_32456 ) ( CLEAR ?auto_32457 ) ( ON-TABLE ?auto_32455 ) ( ON ?auto_32456 ?auto_32455 ) ( not ( = ?auto_32455 ?auto_32456 ) ) ( not ( = ?auto_32455 ?auto_32457 ) ) ( not ( = ?auto_32456 ?auto_32457 ) ) ( HOLDING ?auto_32458 ) ( CLEAR ?auto_32459 ) ( not ( = ?auto_32455 ?auto_32458 ) ) ( not ( = ?auto_32455 ?auto_32459 ) ) ( not ( = ?auto_32456 ?auto_32458 ) ) ( not ( = ?auto_32456 ?auto_32459 ) ) ( not ( = ?auto_32457 ?auto_32458 ) ) ( not ( = ?auto_32457 ?auto_32459 ) ) ( not ( = ?auto_32458 ?auto_32459 ) ) )
    :subtasks
    ( ( !STACK ?auto_32458 ?auto_32459 )
      ( MAKE-2PILE ?auto_32455 ?auto_32456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32460 - BLOCK
      ?auto_32461 - BLOCK
    )
    :vars
    (
      ?auto_32464 - BLOCK
      ?auto_32462 - BLOCK
      ?auto_32463 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32464 ?auto_32461 ) ( ON-TABLE ?auto_32460 ) ( ON ?auto_32461 ?auto_32460 ) ( not ( = ?auto_32460 ?auto_32461 ) ) ( not ( = ?auto_32460 ?auto_32464 ) ) ( not ( = ?auto_32461 ?auto_32464 ) ) ( CLEAR ?auto_32462 ) ( not ( = ?auto_32460 ?auto_32463 ) ) ( not ( = ?auto_32460 ?auto_32462 ) ) ( not ( = ?auto_32461 ?auto_32463 ) ) ( not ( = ?auto_32461 ?auto_32462 ) ) ( not ( = ?auto_32464 ?auto_32463 ) ) ( not ( = ?auto_32464 ?auto_32462 ) ) ( not ( = ?auto_32463 ?auto_32462 ) ) ( ON ?auto_32463 ?auto_32464 ) ( CLEAR ?auto_32463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32460 ?auto_32461 ?auto_32464 )
      ( MAKE-2PILE ?auto_32460 ?auto_32461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32465 - BLOCK
      ?auto_32466 - BLOCK
    )
    :vars
    (
      ?auto_32467 - BLOCK
      ?auto_32469 - BLOCK
      ?auto_32468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32467 ?auto_32466 ) ( ON-TABLE ?auto_32465 ) ( ON ?auto_32466 ?auto_32465 ) ( not ( = ?auto_32465 ?auto_32466 ) ) ( not ( = ?auto_32465 ?auto_32467 ) ) ( not ( = ?auto_32466 ?auto_32467 ) ) ( not ( = ?auto_32465 ?auto_32469 ) ) ( not ( = ?auto_32465 ?auto_32468 ) ) ( not ( = ?auto_32466 ?auto_32469 ) ) ( not ( = ?auto_32466 ?auto_32468 ) ) ( not ( = ?auto_32467 ?auto_32469 ) ) ( not ( = ?auto_32467 ?auto_32468 ) ) ( not ( = ?auto_32469 ?auto_32468 ) ) ( ON ?auto_32469 ?auto_32467 ) ( CLEAR ?auto_32469 ) ( HOLDING ?auto_32468 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32468 )
      ( MAKE-2PILE ?auto_32465 ?auto_32466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32470 - BLOCK
      ?auto_32471 - BLOCK
    )
    :vars
    (
      ?auto_32473 - BLOCK
      ?auto_32472 - BLOCK
      ?auto_32474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32473 ?auto_32471 ) ( ON-TABLE ?auto_32470 ) ( ON ?auto_32471 ?auto_32470 ) ( not ( = ?auto_32470 ?auto_32471 ) ) ( not ( = ?auto_32470 ?auto_32473 ) ) ( not ( = ?auto_32471 ?auto_32473 ) ) ( not ( = ?auto_32470 ?auto_32472 ) ) ( not ( = ?auto_32470 ?auto_32474 ) ) ( not ( = ?auto_32471 ?auto_32472 ) ) ( not ( = ?auto_32471 ?auto_32474 ) ) ( not ( = ?auto_32473 ?auto_32472 ) ) ( not ( = ?auto_32473 ?auto_32474 ) ) ( not ( = ?auto_32472 ?auto_32474 ) ) ( ON ?auto_32472 ?auto_32473 ) ( ON ?auto_32474 ?auto_32472 ) ( CLEAR ?auto_32474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32470 ?auto_32471 ?auto_32473 ?auto_32472 )
      ( MAKE-2PILE ?auto_32470 ?auto_32471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32475 - BLOCK
      ?auto_32476 - BLOCK
    )
    :vars
    (
      ?auto_32478 - BLOCK
      ?auto_32479 - BLOCK
      ?auto_32477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32478 ?auto_32476 ) ( ON-TABLE ?auto_32475 ) ( ON ?auto_32476 ?auto_32475 ) ( not ( = ?auto_32475 ?auto_32476 ) ) ( not ( = ?auto_32475 ?auto_32478 ) ) ( not ( = ?auto_32476 ?auto_32478 ) ) ( not ( = ?auto_32475 ?auto_32479 ) ) ( not ( = ?auto_32475 ?auto_32477 ) ) ( not ( = ?auto_32476 ?auto_32479 ) ) ( not ( = ?auto_32476 ?auto_32477 ) ) ( not ( = ?auto_32478 ?auto_32479 ) ) ( not ( = ?auto_32478 ?auto_32477 ) ) ( not ( = ?auto_32479 ?auto_32477 ) ) ( ON ?auto_32479 ?auto_32478 ) ( HOLDING ?auto_32477 ) ( CLEAR ?auto_32479 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32475 ?auto_32476 ?auto_32478 ?auto_32479 ?auto_32477 )
      ( MAKE-2PILE ?auto_32475 ?auto_32476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32480 - BLOCK
      ?auto_32481 - BLOCK
    )
    :vars
    (
      ?auto_32484 - BLOCK
      ?auto_32482 - BLOCK
      ?auto_32483 - BLOCK
      ?auto_32485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32484 ?auto_32481 ) ( ON-TABLE ?auto_32480 ) ( ON ?auto_32481 ?auto_32480 ) ( not ( = ?auto_32480 ?auto_32481 ) ) ( not ( = ?auto_32480 ?auto_32484 ) ) ( not ( = ?auto_32481 ?auto_32484 ) ) ( not ( = ?auto_32480 ?auto_32482 ) ) ( not ( = ?auto_32480 ?auto_32483 ) ) ( not ( = ?auto_32481 ?auto_32482 ) ) ( not ( = ?auto_32481 ?auto_32483 ) ) ( not ( = ?auto_32484 ?auto_32482 ) ) ( not ( = ?auto_32484 ?auto_32483 ) ) ( not ( = ?auto_32482 ?auto_32483 ) ) ( ON ?auto_32482 ?auto_32484 ) ( CLEAR ?auto_32482 ) ( ON ?auto_32483 ?auto_32485 ) ( CLEAR ?auto_32483 ) ( HAND-EMPTY ) ( not ( = ?auto_32480 ?auto_32485 ) ) ( not ( = ?auto_32481 ?auto_32485 ) ) ( not ( = ?auto_32484 ?auto_32485 ) ) ( not ( = ?auto_32482 ?auto_32485 ) ) ( not ( = ?auto_32483 ?auto_32485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32483 ?auto_32485 )
      ( MAKE-2PILE ?auto_32480 ?auto_32481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32486 - BLOCK
      ?auto_32487 - BLOCK
    )
    :vars
    (
      ?auto_32488 - BLOCK
      ?auto_32490 - BLOCK
      ?auto_32489 - BLOCK
      ?auto_32491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32488 ?auto_32487 ) ( ON-TABLE ?auto_32486 ) ( ON ?auto_32487 ?auto_32486 ) ( not ( = ?auto_32486 ?auto_32487 ) ) ( not ( = ?auto_32486 ?auto_32488 ) ) ( not ( = ?auto_32487 ?auto_32488 ) ) ( not ( = ?auto_32486 ?auto_32490 ) ) ( not ( = ?auto_32486 ?auto_32489 ) ) ( not ( = ?auto_32487 ?auto_32490 ) ) ( not ( = ?auto_32487 ?auto_32489 ) ) ( not ( = ?auto_32488 ?auto_32490 ) ) ( not ( = ?auto_32488 ?auto_32489 ) ) ( not ( = ?auto_32490 ?auto_32489 ) ) ( ON ?auto_32489 ?auto_32491 ) ( CLEAR ?auto_32489 ) ( not ( = ?auto_32486 ?auto_32491 ) ) ( not ( = ?auto_32487 ?auto_32491 ) ) ( not ( = ?auto_32488 ?auto_32491 ) ) ( not ( = ?auto_32490 ?auto_32491 ) ) ( not ( = ?auto_32489 ?auto_32491 ) ) ( HOLDING ?auto_32490 ) ( CLEAR ?auto_32488 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32486 ?auto_32487 ?auto_32488 ?auto_32490 )
      ( MAKE-2PILE ?auto_32486 ?auto_32487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32492 - BLOCK
      ?auto_32493 - BLOCK
    )
    :vars
    (
      ?auto_32495 - BLOCK
      ?auto_32494 - BLOCK
      ?auto_32497 - BLOCK
      ?auto_32496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32495 ?auto_32493 ) ( ON-TABLE ?auto_32492 ) ( ON ?auto_32493 ?auto_32492 ) ( not ( = ?auto_32492 ?auto_32493 ) ) ( not ( = ?auto_32492 ?auto_32495 ) ) ( not ( = ?auto_32493 ?auto_32495 ) ) ( not ( = ?auto_32492 ?auto_32494 ) ) ( not ( = ?auto_32492 ?auto_32497 ) ) ( not ( = ?auto_32493 ?auto_32494 ) ) ( not ( = ?auto_32493 ?auto_32497 ) ) ( not ( = ?auto_32495 ?auto_32494 ) ) ( not ( = ?auto_32495 ?auto_32497 ) ) ( not ( = ?auto_32494 ?auto_32497 ) ) ( ON ?auto_32497 ?auto_32496 ) ( not ( = ?auto_32492 ?auto_32496 ) ) ( not ( = ?auto_32493 ?auto_32496 ) ) ( not ( = ?auto_32495 ?auto_32496 ) ) ( not ( = ?auto_32494 ?auto_32496 ) ) ( not ( = ?auto_32497 ?auto_32496 ) ) ( CLEAR ?auto_32495 ) ( ON ?auto_32494 ?auto_32497 ) ( CLEAR ?auto_32494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32496 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32496 ?auto_32497 )
      ( MAKE-2PILE ?auto_32492 ?auto_32493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32510 - BLOCK
      ?auto_32511 - BLOCK
    )
    :vars
    (
      ?auto_32514 - BLOCK
      ?auto_32513 - BLOCK
      ?auto_32512 - BLOCK
      ?auto_32515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32510 ) ( not ( = ?auto_32510 ?auto_32511 ) ) ( not ( = ?auto_32510 ?auto_32514 ) ) ( not ( = ?auto_32511 ?auto_32514 ) ) ( not ( = ?auto_32510 ?auto_32513 ) ) ( not ( = ?auto_32510 ?auto_32512 ) ) ( not ( = ?auto_32511 ?auto_32513 ) ) ( not ( = ?auto_32511 ?auto_32512 ) ) ( not ( = ?auto_32514 ?auto_32513 ) ) ( not ( = ?auto_32514 ?auto_32512 ) ) ( not ( = ?auto_32513 ?auto_32512 ) ) ( ON ?auto_32512 ?auto_32515 ) ( not ( = ?auto_32510 ?auto_32515 ) ) ( not ( = ?auto_32511 ?auto_32515 ) ) ( not ( = ?auto_32514 ?auto_32515 ) ) ( not ( = ?auto_32513 ?auto_32515 ) ) ( not ( = ?auto_32512 ?auto_32515 ) ) ( ON ?auto_32513 ?auto_32512 ) ( ON-TABLE ?auto_32515 ) ( ON ?auto_32514 ?auto_32513 ) ( CLEAR ?auto_32514 ) ( HOLDING ?auto_32511 ) ( CLEAR ?auto_32510 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32510 ?auto_32511 ?auto_32514 )
      ( MAKE-2PILE ?auto_32510 ?auto_32511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32516 - BLOCK
      ?auto_32517 - BLOCK
    )
    :vars
    (
      ?auto_32518 - BLOCK
      ?auto_32519 - BLOCK
      ?auto_32521 - BLOCK
      ?auto_32520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32516 ) ( not ( = ?auto_32516 ?auto_32517 ) ) ( not ( = ?auto_32516 ?auto_32518 ) ) ( not ( = ?auto_32517 ?auto_32518 ) ) ( not ( = ?auto_32516 ?auto_32519 ) ) ( not ( = ?auto_32516 ?auto_32521 ) ) ( not ( = ?auto_32517 ?auto_32519 ) ) ( not ( = ?auto_32517 ?auto_32521 ) ) ( not ( = ?auto_32518 ?auto_32519 ) ) ( not ( = ?auto_32518 ?auto_32521 ) ) ( not ( = ?auto_32519 ?auto_32521 ) ) ( ON ?auto_32521 ?auto_32520 ) ( not ( = ?auto_32516 ?auto_32520 ) ) ( not ( = ?auto_32517 ?auto_32520 ) ) ( not ( = ?auto_32518 ?auto_32520 ) ) ( not ( = ?auto_32519 ?auto_32520 ) ) ( not ( = ?auto_32521 ?auto_32520 ) ) ( ON ?auto_32519 ?auto_32521 ) ( ON-TABLE ?auto_32520 ) ( ON ?auto_32518 ?auto_32519 ) ( CLEAR ?auto_32516 ) ( ON ?auto_32517 ?auto_32518 ) ( CLEAR ?auto_32517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32520 ?auto_32521 ?auto_32519 ?auto_32518 )
      ( MAKE-2PILE ?auto_32516 ?auto_32517 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32522 - BLOCK
      ?auto_32523 - BLOCK
    )
    :vars
    (
      ?auto_32524 - BLOCK
      ?auto_32525 - BLOCK
      ?auto_32526 - BLOCK
      ?auto_32527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32522 ?auto_32523 ) ) ( not ( = ?auto_32522 ?auto_32524 ) ) ( not ( = ?auto_32523 ?auto_32524 ) ) ( not ( = ?auto_32522 ?auto_32525 ) ) ( not ( = ?auto_32522 ?auto_32526 ) ) ( not ( = ?auto_32523 ?auto_32525 ) ) ( not ( = ?auto_32523 ?auto_32526 ) ) ( not ( = ?auto_32524 ?auto_32525 ) ) ( not ( = ?auto_32524 ?auto_32526 ) ) ( not ( = ?auto_32525 ?auto_32526 ) ) ( ON ?auto_32526 ?auto_32527 ) ( not ( = ?auto_32522 ?auto_32527 ) ) ( not ( = ?auto_32523 ?auto_32527 ) ) ( not ( = ?auto_32524 ?auto_32527 ) ) ( not ( = ?auto_32525 ?auto_32527 ) ) ( not ( = ?auto_32526 ?auto_32527 ) ) ( ON ?auto_32525 ?auto_32526 ) ( ON-TABLE ?auto_32527 ) ( ON ?auto_32524 ?auto_32525 ) ( ON ?auto_32523 ?auto_32524 ) ( CLEAR ?auto_32523 ) ( HOLDING ?auto_32522 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32522 )
      ( MAKE-2PILE ?auto_32522 ?auto_32523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_32528 - BLOCK
      ?auto_32529 - BLOCK
    )
    :vars
    (
      ?auto_32532 - BLOCK
      ?auto_32531 - BLOCK
      ?auto_32530 - BLOCK
      ?auto_32533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32528 ?auto_32529 ) ) ( not ( = ?auto_32528 ?auto_32532 ) ) ( not ( = ?auto_32529 ?auto_32532 ) ) ( not ( = ?auto_32528 ?auto_32531 ) ) ( not ( = ?auto_32528 ?auto_32530 ) ) ( not ( = ?auto_32529 ?auto_32531 ) ) ( not ( = ?auto_32529 ?auto_32530 ) ) ( not ( = ?auto_32532 ?auto_32531 ) ) ( not ( = ?auto_32532 ?auto_32530 ) ) ( not ( = ?auto_32531 ?auto_32530 ) ) ( ON ?auto_32530 ?auto_32533 ) ( not ( = ?auto_32528 ?auto_32533 ) ) ( not ( = ?auto_32529 ?auto_32533 ) ) ( not ( = ?auto_32532 ?auto_32533 ) ) ( not ( = ?auto_32531 ?auto_32533 ) ) ( not ( = ?auto_32530 ?auto_32533 ) ) ( ON ?auto_32531 ?auto_32530 ) ( ON-TABLE ?auto_32533 ) ( ON ?auto_32532 ?auto_32531 ) ( ON ?auto_32529 ?auto_32532 ) ( ON ?auto_32528 ?auto_32529 ) ( CLEAR ?auto_32528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32533 ?auto_32530 ?auto_32531 ?auto_32532 ?auto_32529 )
      ( MAKE-2PILE ?auto_32528 ?auto_32529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32537 - BLOCK
      ?auto_32538 - BLOCK
      ?auto_32539 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32539 ) ( CLEAR ?auto_32538 ) ( ON-TABLE ?auto_32537 ) ( ON ?auto_32538 ?auto_32537 ) ( not ( = ?auto_32537 ?auto_32538 ) ) ( not ( = ?auto_32537 ?auto_32539 ) ) ( not ( = ?auto_32538 ?auto_32539 ) ) )
    :subtasks
    ( ( !STACK ?auto_32539 ?auto_32538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32540 - BLOCK
      ?auto_32541 - BLOCK
      ?auto_32542 - BLOCK
    )
    :vars
    (
      ?auto_32543 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32541 ) ( ON-TABLE ?auto_32540 ) ( ON ?auto_32541 ?auto_32540 ) ( not ( = ?auto_32540 ?auto_32541 ) ) ( not ( = ?auto_32540 ?auto_32542 ) ) ( not ( = ?auto_32541 ?auto_32542 ) ) ( ON ?auto_32542 ?auto_32543 ) ( CLEAR ?auto_32542 ) ( HAND-EMPTY ) ( not ( = ?auto_32540 ?auto_32543 ) ) ( not ( = ?auto_32541 ?auto_32543 ) ) ( not ( = ?auto_32542 ?auto_32543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32542 ?auto_32543 )
      ( MAKE-3PILE ?auto_32540 ?auto_32541 ?auto_32542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32544 - BLOCK
      ?auto_32545 - BLOCK
      ?auto_32546 - BLOCK
    )
    :vars
    (
      ?auto_32547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32544 ) ( not ( = ?auto_32544 ?auto_32545 ) ) ( not ( = ?auto_32544 ?auto_32546 ) ) ( not ( = ?auto_32545 ?auto_32546 ) ) ( ON ?auto_32546 ?auto_32547 ) ( CLEAR ?auto_32546 ) ( not ( = ?auto_32544 ?auto_32547 ) ) ( not ( = ?auto_32545 ?auto_32547 ) ) ( not ( = ?auto_32546 ?auto_32547 ) ) ( HOLDING ?auto_32545 ) ( CLEAR ?auto_32544 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32544 ?auto_32545 )
      ( MAKE-3PILE ?auto_32544 ?auto_32545 ?auto_32546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32548 - BLOCK
      ?auto_32549 - BLOCK
      ?auto_32550 - BLOCK
    )
    :vars
    (
      ?auto_32551 - BLOCK
      ?auto_32552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32548 ) ( not ( = ?auto_32548 ?auto_32549 ) ) ( not ( = ?auto_32548 ?auto_32550 ) ) ( not ( = ?auto_32549 ?auto_32550 ) ) ( ON ?auto_32550 ?auto_32551 ) ( not ( = ?auto_32548 ?auto_32551 ) ) ( not ( = ?auto_32549 ?auto_32551 ) ) ( not ( = ?auto_32550 ?auto_32551 ) ) ( CLEAR ?auto_32548 ) ( ON ?auto_32549 ?auto_32550 ) ( CLEAR ?auto_32549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32552 ) ( ON ?auto_32551 ?auto_32552 ) ( not ( = ?auto_32552 ?auto_32551 ) ) ( not ( = ?auto_32552 ?auto_32550 ) ) ( not ( = ?auto_32552 ?auto_32549 ) ) ( not ( = ?auto_32548 ?auto_32552 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32552 ?auto_32551 ?auto_32550 )
      ( MAKE-3PILE ?auto_32548 ?auto_32549 ?auto_32550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32553 - BLOCK
      ?auto_32554 - BLOCK
      ?auto_32555 - BLOCK
    )
    :vars
    (
      ?auto_32557 - BLOCK
      ?auto_32556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32553 ?auto_32554 ) ) ( not ( = ?auto_32553 ?auto_32555 ) ) ( not ( = ?auto_32554 ?auto_32555 ) ) ( ON ?auto_32555 ?auto_32557 ) ( not ( = ?auto_32553 ?auto_32557 ) ) ( not ( = ?auto_32554 ?auto_32557 ) ) ( not ( = ?auto_32555 ?auto_32557 ) ) ( ON ?auto_32554 ?auto_32555 ) ( CLEAR ?auto_32554 ) ( ON-TABLE ?auto_32556 ) ( ON ?auto_32557 ?auto_32556 ) ( not ( = ?auto_32556 ?auto_32557 ) ) ( not ( = ?auto_32556 ?auto_32555 ) ) ( not ( = ?auto_32556 ?auto_32554 ) ) ( not ( = ?auto_32553 ?auto_32556 ) ) ( HOLDING ?auto_32553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32553 )
      ( MAKE-3PILE ?auto_32553 ?auto_32554 ?auto_32555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32558 - BLOCK
      ?auto_32559 - BLOCK
      ?auto_32560 - BLOCK
    )
    :vars
    (
      ?auto_32561 - BLOCK
      ?auto_32562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32558 ?auto_32559 ) ) ( not ( = ?auto_32558 ?auto_32560 ) ) ( not ( = ?auto_32559 ?auto_32560 ) ) ( ON ?auto_32560 ?auto_32561 ) ( not ( = ?auto_32558 ?auto_32561 ) ) ( not ( = ?auto_32559 ?auto_32561 ) ) ( not ( = ?auto_32560 ?auto_32561 ) ) ( ON ?auto_32559 ?auto_32560 ) ( ON-TABLE ?auto_32562 ) ( ON ?auto_32561 ?auto_32562 ) ( not ( = ?auto_32562 ?auto_32561 ) ) ( not ( = ?auto_32562 ?auto_32560 ) ) ( not ( = ?auto_32562 ?auto_32559 ) ) ( not ( = ?auto_32558 ?auto_32562 ) ) ( ON ?auto_32558 ?auto_32559 ) ( CLEAR ?auto_32558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32562 ?auto_32561 ?auto_32560 ?auto_32559 )
      ( MAKE-3PILE ?auto_32558 ?auto_32559 ?auto_32560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32563 - BLOCK
      ?auto_32564 - BLOCK
      ?auto_32565 - BLOCK
    )
    :vars
    (
      ?auto_32567 - BLOCK
      ?auto_32566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32563 ?auto_32564 ) ) ( not ( = ?auto_32563 ?auto_32565 ) ) ( not ( = ?auto_32564 ?auto_32565 ) ) ( ON ?auto_32565 ?auto_32567 ) ( not ( = ?auto_32563 ?auto_32567 ) ) ( not ( = ?auto_32564 ?auto_32567 ) ) ( not ( = ?auto_32565 ?auto_32567 ) ) ( ON ?auto_32564 ?auto_32565 ) ( ON-TABLE ?auto_32566 ) ( ON ?auto_32567 ?auto_32566 ) ( not ( = ?auto_32566 ?auto_32567 ) ) ( not ( = ?auto_32566 ?auto_32565 ) ) ( not ( = ?auto_32566 ?auto_32564 ) ) ( not ( = ?auto_32563 ?auto_32566 ) ) ( HOLDING ?auto_32563 ) ( CLEAR ?auto_32564 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32566 ?auto_32567 ?auto_32565 ?auto_32564 ?auto_32563 )
      ( MAKE-3PILE ?auto_32563 ?auto_32564 ?auto_32565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32568 - BLOCK
      ?auto_32569 - BLOCK
      ?auto_32570 - BLOCK
    )
    :vars
    (
      ?auto_32572 - BLOCK
      ?auto_32571 - BLOCK
      ?auto_32573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32568 ?auto_32569 ) ) ( not ( = ?auto_32568 ?auto_32570 ) ) ( not ( = ?auto_32569 ?auto_32570 ) ) ( ON ?auto_32570 ?auto_32572 ) ( not ( = ?auto_32568 ?auto_32572 ) ) ( not ( = ?auto_32569 ?auto_32572 ) ) ( not ( = ?auto_32570 ?auto_32572 ) ) ( ON ?auto_32569 ?auto_32570 ) ( ON-TABLE ?auto_32571 ) ( ON ?auto_32572 ?auto_32571 ) ( not ( = ?auto_32571 ?auto_32572 ) ) ( not ( = ?auto_32571 ?auto_32570 ) ) ( not ( = ?auto_32571 ?auto_32569 ) ) ( not ( = ?auto_32568 ?auto_32571 ) ) ( CLEAR ?auto_32569 ) ( ON ?auto_32568 ?auto_32573 ) ( CLEAR ?auto_32568 ) ( HAND-EMPTY ) ( not ( = ?auto_32568 ?auto_32573 ) ) ( not ( = ?auto_32569 ?auto_32573 ) ) ( not ( = ?auto_32570 ?auto_32573 ) ) ( not ( = ?auto_32572 ?auto_32573 ) ) ( not ( = ?auto_32571 ?auto_32573 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32568 ?auto_32573 )
      ( MAKE-3PILE ?auto_32568 ?auto_32569 ?auto_32570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32574 - BLOCK
      ?auto_32575 - BLOCK
      ?auto_32576 - BLOCK
    )
    :vars
    (
      ?auto_32579 - BLOCK
      ?auto_32578 - BLOCK
      ?auto_32577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32574 ?auto_32575 ) ) ( not ( = ?auto_32574 ?auto_32576 ) ) ( not ( = ?auto_32575 ?auto_32576 ) ) ( ON ?auto_32576 ?auto_32579 ) ( not ( = ?auto_32574 ?auto_32579 ) ) ( not ( = ?auto_32575 ?auto_32579 ) ) ( not ( = ?auto_32576 ?auto_32579 ) ) ( ON-TABLE ?auto_32578 ) ( ON ?auto_32579 ?auto_32578 ) ( not ( = ?auto_32578 ?auto_32579 ) ) ( not ( = ?auto_32578 ?auto_32576 ) ) ( not ( = ?auto_32578 ?auto_32575 ) ) ( not ( = ?auto_32574 ?auto_32578 ) ) ( ON ?auto_32574 ?auto_32577 ) ( CLEAR ?auto_32574 ) ( not ( = ?auto_32574 ?auto_32577 ) ) ( not ( = ?auto_32575 ?auto_32577 ) ) ( not ( = ?auto_32576 ?auto_32577 ) ) ( not ( = ?auto_32579 ?auto_32577 ) ) ( not ( = ?auto_32578 ?auto_32577 ) ) ( HOLDING ?auto_32575 ) ( CLEAR ?auto_32576 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32578 ?auto_32579 ?auto_32576 ?auto_32575 )
      ( MAKE-3PILE ?auto_32574 ?auto_32575 ?auto_32576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32580 - BLOCK
      ?auto_32581 - BLOCK
      ?auto_32582 - BLOCK
    )
    :vars
    (
      ?auto_32584 - BLOCK
      ?auto_32583 - BLOCK
      ?auto_32585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32580 ?auto_32581 ) ) ( not ( = ?auto_32580 ?auto_32582 ) ) ( not ( = ?auto_32581 ?auto_32582 ) ) ( ON ?auto_32582 ?auto_32584 ) ( not ( = ?auto_32580 ?auto_32584 ) ) ( not ( = ?auto_32581 ?auto_32584 ) ) ( not ( = ?auto_32582 ?auto_32584 ) ) ( ON-TABLE ?auto_32583 ) ( ON ?auto_32584 ?auto_32583 ) ( not ( = ?auto_32583 ?auto_32584 ) ) ( not ( = ?auto_32583 ?auto_32582 ) ) ( not ( = ?auto_32583 ?auto_32581 ) ) ( not ( = ?auto_32580 ?auto_32583 ) ) ( ON ?auto_32580 ?auto_32585 ) ( not ( = ?auto_32580 ?auto_32585 ) ) ( not ( = ?auto_32581 ?auto_32585 ) ) ( not ( = ?auto_32582 ?auto_32585 ) ) ( not ( = ?auto_32584 ?auto_32585 ) ) ( not ( = ?auto_32583 ?auto_32585 ) ) ( CLEAR ?auto_32582 ) ( ON ?auto_32581 ?auto_32580 ) ( CLEAR ?auto_32581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32585 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32585 ?auto_32580 )
      ( MAKE-3PILE ?auto_32580 ?auto_32581 ?auto_32582 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32586 - BLOCK
      ?auto_32587 - BLOCK
      ?auto_32588 - BLOCK
    )
    :vars
    (
      ?auto_32589 - BLOCK
      ?auto_32591 - BLOCK
      ?auto_32590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32586 ?auto_32587 ) ) ( not ( = ?auto_32586 ?auto_32588 ) ) ( not ( = ?auto_32587 ?auto_32588 ) ) ( not ( = ?auto_32586 ?auto_32589 ) ) ( not ( = ?auto_32587 ?auto_32589 ) ) ( not ( = ?auto_32588 ?auto_32589 ) ) ( ON-TABLE ?auto_32591 ) ( ON ?auto_32589 ?auto_32591 ) ( not ( = ?auto_32591 ?auto_32589 ) ) ( not ( = ?auto_32591 ?auto_32588 ) ) ( not ( = ?auto_32591 ?auto_32587 ) ) ( not ( = ?auto_32586 ?auto_32591 ) ) ( ON ?auto_32586 ?auto_32590 ) ( not ( = ?auto_32586 ?auto_32590 ) ) ( not ( = ?auto_32587 ?auto_32590 ) ) ( not ( = ?auto_32588 ?auto_32590 ) ) ( not ( = ?auto_32589 ?auto_32590 ) ) ( not ( = ?auto_32591 ?auto_32590 ) ) ( ON ?auto_32587 ?auto_32586 ) ( CLEAR ?auto_32587 ) ( ON-TABLE ?auto_32590 ) ( HOLDING ?auto_32588 ) ( CLEAR ?auto_32589 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32591 ?auto_32589 ?auto_32588 )
      ( MAKE-3PILE ?auto_32586 ?auto_32587 ?auto_32588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32592 - BLOCK
      ?auto_32593 - BLOCK
      ?auto_32594 - BLOCK
    )
    :vars
    (
      ?auto_32596 - BLOCK
      ?auto_32597 - BLOCK
      ?auto_32595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32592 ?auto_32593 ) ) ( not ( = ?auto_32592 ?auto_32594 ) ) ( not ( = ?auto_32593 ?auto_32594 ) ) ( not ( = ?auto_32592 ?auto_32596 ) ) ( not ( = ?auto_32593 ?auto_32596 ) ) ( not ( = ?auto_32594 ?auto_32596 ) ) ( ON-TABLE ?auto_32597 ) ( ON ?auto_32596 ?auto_32597 ) ( not ( = ?auto_32597 ?auto_32596 ) ) ( not ( = ?auto_32597 ?auto_32594 ) ) ( not ( = ?auto_32597 ?auto_32593 ) ) ( not ( = ?auto_32592 ?auto_32597 ) ) ( ON ?auto_32592 ?auto_32595 ) ( not ( = ?auto_32592 ?auto_32595 ) ) ( not ( = ?auto_32593 ?auto_32595 ) ) ( not ( = ?auto_32594 ?auto_32595 ) ) ( not ( = ?auto_32596 ?auto_32595 ) ) ( not ( = ?auto_32597 ?auto_32595 ) ) ( ON ?auto_32593 ?auto_32592 ) ( ON-TABLE ?auto_32595 ) ( CLEAR ?auto_32596 ) ( ON ?auto_32594 ?auto_32593 ) ( CLEAR ?auto_32594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32595 ?auto_32592 ?auto_32593 )
      ( MAKE-3PILE ?auto_32592 ?auto_32593 ?auto_32594 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32598 - BLOCK
      ?auto_32599 - BLOCK
      ?auto_32600 - BLOCK
    )
    :vars
    (
      ?auto_32601 - BLOCK
      ?auto_32602 - BLOCK
      ?auto_32603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32598 ?auto_32599 ) ) ( not ( = ?auto_32598 ?auto_32600 ) ) ( not ( = ?auto_32599 ?auto_32600 ) ) ( not ( = ?auto_32598 ?auto_32601 ) ) ( not ( = ?auto_32599 ?auto_32601 ) ) ( not ( = ?auto_32600 ?auto_32601 ) ) ( ON-TABLE ?auto_32602 ) ( not ( = ?auto_32602 ?auto_32601 ) ) ( not ( = ?auto_32602 ?auto_32600 ) ) ( not ( = ?auto_32602 ?auto_32599 ) ) ( not ( = ?auto_32598 ?auto_32602 ) ) ( ON ?auto_32598 ?auto_32603 ) ( not ( = ?auto_32598 ?auto_32603 ) ) ( not ( = ?auto_32599 ?auto_32603 ) ) ( not ( = ?auto_32600 ?auto_32603 ) ) ( not ( = ?auto_32601 ?auto_32603 ) ) ( not ( = ?auto_32602 ?auto_32603 ) ) ( ON ?auto_32599 ?auto_32598 ) ( ON-TABLE ?auto_32603 ) ( ON ?auto_32600 ?auto_32599 ) ( CLEAR ?auto_32600 ) ( HOLDING ?auto_32601 ) ( CLEAR ?auto_32602 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32602 ?auto_32601 )
      ( MAKE-3PILE ?auto_32598 ?auto_32599 ?auto_32600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32604 - BLOCK
      ?auto_32605 - BLOCK
      ?auto_32606 - BLOCK
    )
    :vars
    (
      ?auto_32608 - BLOCK
      ?auto_32609 - BLOCK
      ?auto_32607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32604 ?auto_32605 ) ) ( not ( = ?auto_32604 ?auto_32606 ) ) ( not ( = ?auto_32605 ?auto_32606 ) ) ( not ( = ?auto_32604 ?auto_32608 ) ) ( not ( = ?auto_32605 ?auto_32608 ) ) ( not ( = ?auto_32606 ?auto_32608 ) ) ( ON-TABLE ?auto_32609 ) ( not ( = ?auto_32609 ?auto_32608 ) ) ( not ( = ?auto_32609 ?auto_32606 ) ) ( not ( = ?auto_32609 ?auto_32605 ) ) ( not ( = ?auto_32604 ?auto_32609 ) ) ( ON ?auto_32604 ?auto_32607 ) ( not ( = ?auto_32604 ?auto_32607 ) ) ( not ( = ?auto_32605 ?auto_32607 ) ) ( not ( = ?auto_32606 ?auto_32607 ) ) ( not ( = ?auto_32608 ?auto_32607 ) ) ( not ( = ?auto_32609 ?auto_32607 ) ) ( ON ?auto_32605 ?auto_32604 ) ( ON-TABLE ?auto_32607 ) ( ON ?auto_32606 ?auto_32605 ) ( CLEAR ?auto_32609 ) ( ON ?auto_32608 ?auto_32606 ) ( CLEAR ?auto_32608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32607 ?auto_32604 ?auto_32605 ?auto_32606 )
      ( MAKE-3PILE ?auto_32604 ?auto_32605 ?auto_32606 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32610 - BLOCK
      ?auto_32611 - BLOCK
      ?auto_32612 - BLOCK
    )
    :vars
    (
      ?auto_32615 - BLOCK
      ?auto_32614 - BLOCK
      ?auto_32613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32610 ?auto_32611 ) ) ( not ( = ?auto_32610 ?auto_32612 ) ) ( not ( = ?auto_32611 ?auto_32612 ) ) ( not ( = ?auto_32610 ?auto_32615 ) ) ( not ( = ?auto_32611 ?auto_32615 ) ) ( not ( = ?auto_32612 ?auto_32615 ) ) ( not ( = ?auto_32614 ?auto_32615 ) ) ( not ( = ?auto_32614 ?auto_32612 ) ) ( not ( = ?auto_32614 ?auto_32611 ) ) ( not ( = ?auto_32610 ?auto_32614 ) ) ( ON ?auto_32610 ?auto_32613 ) ( not ( = ?auto_32610 ?auto_32613 ) ) ( not ( = ?auto_32611 ?auto_32613 ) ) ( not ( = ?auto_32612 ?auto_32613 ) ) ( not ( = ?auto_32615 ?auto_32613 ) ) ( not ( = ?auto_32614 ?auto_32613 ) ) ( ON ?auto_32611 ?auto_32610 ) ( ON-TABLE ?auto_32613 ) ( ON ?auto_32612 ?auto_32611 ) ( ON ?auto_32615 ?auto_32612 ) ( CLEAR ?auto_32615 ) ( HOLDING ?auto_32614 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32614 )
      ( MAKE-3PILE ?auto_32610 ?auto_32611 ?auto_32612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_32616 - BLOCK
      ?auto_32617 - BLOCK
      ?auto_32618 - BLOCK
    )
    :vars
    (
      ?auto_32619 - BLOCK
      ?auto_32620 - BLOCK
      ?auto_32621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32616 ?auto_32617 ) ) ( not ( = ?auto_32616 ?auto_32618 ) ) ( not ( = ?auto_32617 ?auto_32618 ) ) ( not ( = ?auto_32616 ?auto_32619 ) ) ( not ( = ?auto_32617 ?auto_32619 ) ) ( not ( = ?auto_32618 ?auto_32619 ) ) ( not ( = ?auto_32620 ?auto_32619 ) ) ( not ( = ?auto_32620 ?auto_32618 ) ) ( not ( = ?auto_32620 ?auto_32617 ) ) ( not ( = ?auto_32616 ?auto_32620 ) ) ( ON ?auto_32616 ?auto_32621 ) ( not ( = ?auto_32616 ?auto_32621 ) ) ( not ( = ?auto_32617 ?auto_32621 ) ) ( not ( = ?auto_32618 ?auto_32621 ) ) ( not ( = ?auto_32619 ?auto_32621 ) ) ( not ( = ?auto_32620 ?auto_32621 ) ) ( ON ?auto_32617 ?auto_32616 ) ( ON-TABLE ?auto_32621 ) ( ON ?auto_32618 ?auto_32617 ) ( ON ?auto_32619 ?auto_32618 ) ( ON ?auto_32620 ?auto_32619 ) ( CLEAR ?auto_32620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32621 ?auto_32616 ?auto_32617 ?auto_32618 ?auto_32619 )
      ( MAKE-3PILE ?auto_32616 ?auto_32617 ?auto_32618 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32623 - BLOCK
    )
    :vars
    (
      ?auto_32624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32624 ?auto_32623 ) ( CLEAR ?auto_32624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32623 ) ( not ( = ?auto_32623 ?auto_32624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32624 ?auto_32623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32625 - BLOCK
    )
    :vars
    (
      ?auto_32626 - BLOCK
      ?auto_32627 - BLOCK
      ?auto_32628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32626 ?auto_32625 ) ( CLEAR ?auto_32626 ) ( ON-TABLE ?auto_32625 ) ( not ( = ?auto_32625 ?auto_32626 ) ) ( HOLDING ?auto_32627 ) ( CLEAR ?auto_32628 ) ( not ( = ?auto_32625 ?auto_32627 ) ) ( not ( = ?auto_32625 ?auto_32628 ) ) ( not ( = ?auto_32626 ?auto_32627 ) ) ( not ( = ?auto_32626 ?auto_32628 ) ) ( not ( = ?auto_32627 ?auto_32628 ) ) )
    :subtasks
    ( ( !STACK ?auto_32627 ?auto_32628 )
      ( MAKE-1PILE ?auto_32625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32629 - BLOCK
    )
    :vars
    (
      ?auto_32630 - BLOCK
      ?auto_32631 - BLOCK
      ?auto_32632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32630 ?auto_32629 ) ( ON-TABLE ?auto_32629 ) ( not ( = ?auto_32629 ?auto_32630 ) ) ( CLEAR ?auto_32631 ) ( not ( = ?auto_32629 ?auto_32632 ) ) ( not ( = ?auto_32629 ?auto_32631 ) ) ( not ( = ?auto_32630 ?auto_32632 ) ) ( not ( = ?auto_32630 ?auto_32631 ) ) ( not ( = ?auto_32632 ?auto_32631 ) ) ( ON ?auto_32632 ?auto_32630 ) ( CLEAR ?auto_32632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32629 ?auto_32630 )
      ( MAKE-1PILE ?auto_32629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32633 - BLOCK
    )
    :vars
    (
      ?auto_32635 - BLOCK
      ?auto_32636 - BLOCK
      ?auto_32634 - BLOCK
      ?auto_32637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32635 ?auto_32633 ) ( ON-TABLE ?auto_32633 ) ( not ( = ?auto_32633 ?auto_32635 ) ) ( not ( = ?auto_32633 ?auto_32636 ) ) ( not ( = ?auto_32633 ?auto_32634 ) ) ( not ( = ?auto_32635 ?auto_32636 ) ) ( not ( = ?auto_32635 ?auto_32634 ) ) ( not ( = ?auto_32636 ?auto_32634 ) ) ( ON ?auto_32636 ?auto_32635 ) ( CLEAR ?auto_32636 ) ( HOLDING ?auto_32634 ) ( CLEAR ?auto_32637 ) ( ON-TABLE ?auto_32637 ) ( not ( = ?auto_32637 ?auto_32634 ) ) ( not ( = ?auto_32633 ?auto_32637 ) ) ( not ( = ?auto_32635 ?auto_32637 ) ) ( not ( = ?auto_32636 ?auto_32637 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32637 ?auto_32634 )
      ( MAKE-1PILE ?auto_32633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32638 - BLOCK
    )
    :vars
    (
      ?auto_32640 - BLOCK
      ?auto_32641 - BLOCK
      ?auto_32642 - BLOCK
      ?auto_32639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32640 ?auto_32638 ) ( ON-TABLE ?auto_32638 ) ( not ( = ?auto_32638 ?auto_32640 ) ) ( not ( = ?auto_32638 ?auto_32641 ) ) ( not ( = ?auto_32638 ?auto_32642 ) ) ( not ( = ?auto_32640 ?auto_32641 ) ) ( not ( = ?auto_32640 ?auto_32642 ) ) ( not ( = ?auto_32641 ?auto_32642 ) ) ( ON ?auto_32641 ?auto_32640 ) ( CLEAR ?auto_32639 ) ( ON-TABLE ?auto_32639 ) ( not ( = ?auto_32639 ?auto_32642 ) ) ( not ( = ?auto_32638 ?auto_32639 ) ) ( not ( = ?auto_32640 ?auto_32639 ) ) ( not ( = ?auto_32641 ?auto_32639 ) ) ( ON ?auto_32642 ?auto_32641 ) ( CLEAR ?auto_32642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32638 ?auto_32640 ?auto_32641 )
      ( MAKE-1PILE ?auto_32638 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32643 - BLOCK
    )
    :vars
    (
      ?auto_32647 - BLOCK
      ?auto_32646 - BLOCK
      ?auto_32645 - BLOCK
      ?auto_32644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32647 ?auto_32643 ) ( ON-TABLE ?auto_32643 ) ( not ( = ?auto_32643 ?auto_32647 ) ) ( not ( = ?auto_32643 ?auto_32646 ) ) ( not ( = ?auto_32643 ?auto_32645 ) ) ( not ( = ?auto_32647 ?auto_32646 ) ) ( not ( = ?auto_32647 ?auto_32645 ) ) ( not ( = ?auto_32646 ?auto_32645 ) ) ( ON ?auto_32646 ?auto_32647 ) ( not ( = ?auto_32644 ?auto_32645 ) ) ( not ( = ?auto_32643 ?auto_32644 ) ) ( not ( = ?auto_32647 ?auto_32644 ) ) ( not ( = ?auto_32646 ?auto_32644 ) ) ( ON ?auto_32645 ?auto_32646 ) ( CLEAR ?auto_32645 ) ( HOLDING ?auto_32644 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32644 )
      ( MAKE-1PILE ?auto_32643 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32648 - BLOCK
    )
    :vars
    (
      ?auto_32652 - BLOCK
      ?auto_32651 - BLOCK
      ?auto_32650 - BLOCK
      ?auto_32649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32652 ?auto_32648 ) ( ON-TABLE ?auto_32648 ) ( not ( = ?auto_32648 ?auto_32652 ) ) ( not ( = ?auto_32648 ?auto_32651 ) ) ( not ( = ?auto_32648 ?auto_32650 ) ) ( not ( = ?auto_32652 ?auto_32651 ) ) ( not ( = ?auto_32652 ?auto_32650 ) ) ( not ( = ?auto_32651 ?auto_32650 ) ) ( ON ?auto_32651 ?auto_32652 ) ( not ( = ?auto_32649 ?auto_32650 ) ) ( not ( = ?auto_32648 ?auto_32649 ) ) ( not ( = ?auto_32652 ?auto_32649 ) ) ( not ( = ?auto_32651 ?auto_32649 ) ) ( ON ?auto_32650 ?auto_32651 ) ( ON ?auto_32649 ?auto_32650 ) ( CLEAR ?auto_32649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32648 ?auto_32652 ?auto_32651 ?auto_32650 )
      ( MAKE-1PILE ?auto_32648 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32653 - BLOCK
    )
    :vars
    (
      ?auto_32654 - BLOCK
      ?auto_32656 - BLOCK
      ?auto_32657 - BLOCK
      ?auto_32655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32654 ?auto_32653 ) ( ON-TABLE ?auto_32653 ) ( not ( = ?auto_32653 ?auto_32654 ) ) ( not ( = ?auto_32653 ?auto_32656 ) ) ( not ( = ?auto_32653 ?auto_32657 ) ) ( not ( = ?auto_32654 ?auto_32656 ) ) ( not ( = ?auto_32654 ?auto_32657 ) ) ( not ( = ?auto_32656 ?auto_32657 ) ) ( ON ?auto_32656 ?auto_32654 ) ( not ( = ?auto_32655 ?auto_32657 ) ) ( not ( = ?auto_32653 ?auto_32655 ) ) ( not ( = ?auto_32654 ?auto_32655 ) ) ( not ( = ?auto_32656 ?auto_32655 ) ) ( ON ?auto_32657 ?auto_32656 ) ( HOLDING ?auto_32655 ) ( CLEAR ?auto_32657 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32653 ?auto_32654 ?auto_32656 ?auto_32657 ?auto_32655 )
      ( MAKE-1PILE ?auto_32653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32658 - BLOCK
    )
    :vars
    (
      ?auto_32659 - BLOCK
      ?auto_32661 - BLOCK
      ?auto_32660 - BLOCK
      ?auto_32662 - BLOCK
      ?auto_32663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32659 ?auto_32658 ) ( ON-TABLE ?auto_32658 ) ( not ( = ?auto_32658 ?auto_32659 ) ) ( not ( = ?auto_32658 ?auto_32661 ) ) ( not ( = ?auto_32658 ?auto_32660 ) ) ( not ( = ?auto_32659 ?auto_32661 ) ) ( not ( = ?auto_32659 ?auto_32660 ) ) ( not ( = ?auto_32661 ?auto_32660 ) ) ( ON ?auto_32661 ?auto_32659 ) ( not ( = ?auto_32662 ?auto_32660 ) ) ( not ( = ?auto_32658 ?auto_32662 ) ) ( not ( = ?auto_32659 ?auto_32662 ) ) ( not ( = ?auto_32661 ?auto_32662 ) ) ( ON ?auto_32660 ?auto_32661 ) ( CLEAR ?auto_32660 ) ( ON ?auto_32662 ?auto_32663 ) ( CLEAR ?auto_32662 ) ( HAND-EMPTY ) ( not ( = ?auto_32658 ?auto_32663 ) ) ( not ( = ?auto_32659 ?auto_32663 ) ) ( not ( = ?auto_32661 ?auto_32663 ) ) ( not ( = ?auto_32660 ?auto_32663 ) ) ( not ( = ?auto_32662 ?auto_32663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32662 ?auto_32663 )
      ( MAKE-1PILE ?auto_32658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32664 - BLOCK
    )
    :vars
    (
      ?auto_32665 - BLOCK
      ?auto_32667 - BLOCK
      ?auto_32669 - BLOCK
      ?auto_32668 - BLOCK
      ?auto_32666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32665 ?auto_32664 ) ( ON-TABLE ?auto_32664 ) ( not ( = ?auto_32664 ?auto_32665 ) ) ( not ( = ?auto_32664 ?auto_32667 ) ) ( not ( = ?auto_32664 ?auto_32669 ) ) ( not ( = ?auto_32665 ?auto_32667 ) ) ( not ( = ?auto_32665 ?auto_32669 ) ) ( not ( = ?auto_32667 ?auto_32669 ) ) ( ON ?auto_32667 ?auto_32665 ) ( not ( = ?auto_32668 ?auto_32669 ) ) ( not ( = ?auto_32664 ?auto_32668 ) ) ( not ( = ?auto_32665 ?auto_32668 ) ) ( not ( = ?auto_32667 ?auto_32668 ) ) ( ON ?auto_32668 ?auto_32666 ) ( CLEAR ?auto_32668 ) ( not ( = ?auto_32664 ?auto_32666 ) ) ( not ( = ?auto_32665 ?auto_32666 ) ) ( not ( = ?auto_32667 ?auto_32666 ) ) ( not ( = ?auto_32669 ?auto_32666 ) ) ( not ( = ?auto_32668 ?auto_32666 ) ) ( HOLDING ?auto_32669 ) ( CLEAR ?auto_32667 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32664 ?auto_32665 ?auto_32667 ?auto_32669 )
      ( MAKE-1PILE ?auto_32664 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32670 - BLOCK
    )
    :vars
    (
      ?auto_32671 - BLOCK
      ?auto_32673 - BLOCK
      ?auto_32672 - BLOCK
      ?auto_32675 - BLOCK
      ?auto_32674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32671 ?auto_32670 ) ( ON-TABLE ?auto_32670 ) ( not ( = ?auto_32670 ?auto_32671 ) ) ( not ( = ?auto_32670 ?auto_32673 ) ) ( not ( = ?auto_32670 ?auto_32672 ) ) ( not ( = ?auto_32671 ?auto_32673 ) ) ( not ( = ?auto_32671 ?auto_32672 ) ) ( not ( = ?auto_32673 ?auto_32672 ) ) ( ON ?auto_32673 ?auto_32671 ) ( not ( = ?auto_32675 ?auto_32672 ) ) ( not ( = ?auto_32670 ?auto_32675 ) ) ( not ( = ?auto_32671 ?auto_32675 ) ) ( not ( = ?auto_32673 ?auto_32675 ) ) ( ON ?auto_32675 ?auto_32674 ) ( not ( = ?auto_32670 ?auto_32674 ) ) ( not ( = ?auto_32671 ?auto_32674 ) ) ( not ( = ?auto_32673 ?auto_32674 ) ) ( not ( = ?auto_32672 ?auto_32674 ) ) ( not ( = ?auto_32675 ?auto_32674 ) ) ( CLEAR ?auto_32673 ) ( ON ?auto_32672 ?auto_32675 ) ( CLEAR ?auto_32672 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32674 ?auto_32675 )
      ( MAKE-1PILE ?auto_32670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32676 - BLOCK
    )
    :vars
    (
      ?auto_32678 - BLOCK
      ?auto_32681 - BLOCK
      ?auto_32677 - BLOCK
      ?auto_32679 - BLOCK
      ?auto_32680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32678 ?auto_32676 ) ( ON-TABLE ?auto_32676 ) ( not ( = ?auto_32676 ?auto_32678 ) ) ( not ( = ?auto_32676 ?auto_32681 ) ) ( not ( = ?auto_32676 ?auto_32677 ) ) ( not ( = ?auto_32678 ?auto_32681 ) ) ( not ( = ?auto_32678 ?auto_32677 ) ) ( not ( = ?auto_32681 ?auto_32677 ) ) ( not ( = ?auto_32679 ?auto_32677 ) ) ( not ( = ?auto_32676 ?auto_32679 ) ) ( not ( = ?auto_32678 ?auto_32679 ) ) ( not ( = ?auto_32681 ?auto_32679 ) ) ( ON ?auto_32679 ?auto_32680 ) ( not ( = ?auto_32676 ?auto_32680 ) ) ( not ( = ?auto_32678 ?auto_32680 ) ) ( not ( = ?auto_32681 ?auto_32680 ) ) ( not ( = ?auto_32677 ?auto_32680 ) ) ( not ( = ?auto_32679 ?auto_32680 ) ) ( ON ?auto_32677 ?auto_32679 ) ( CLEAR ?auto_32677 ) ( ON-TABLE ?auto_32680 ) ( HOLDING ?auto_32681 ) ( CLEAR ?auto_32678 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32676 ?auto_32678 ?auto_32681 )
      ( MAKE-1PILE ?auto_32676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32682 - BLOCK
    )
    :vars
    (
      ?auto_32685 - BLOCK
      ?auto_32684 - BLOCK
      ?auto_32686 - BLOCK
      ?auto_32683 - BLOCK
      ?auto_32687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_32685 ?auto_32682 ) ( ON-TABLE ?auto_32682 ) ( not ( = ?auto_32682 ?auto_32685 ) ) ( not ( = ?auto_32682 ?auto_32684 ) ) ( not ( = ?auto_32682 ?auto_32686 ) ) ( not ( = ?auto_32685 ?auto_32684 ) ) ( not ( = ?auto_32685 ?auto_32686 ) ) ( not ( = ?auto_32684 ?auto_32686 ) ) ( not ( = ?auto_32683 ?auto_32686 ) ) ( not ( = ?auto_32682 ?auto_32683 ) ) ( not ( = ?auto_32685 ?auto_32683 ) ) ( not ( = ?auto_32684 ?auto_32683 ) ) ( ON ?auto_32683 ?auto_32687 ) ( not ( = ?auto_32682 ?auto_32687 ) ) ( not ( = ?auto_32685 ?auto_32687 ) ) ( not ( = ?auto_32684 ?auto_32687 ) ) ( not ( = ?auto_32686 ?auto_32687 ) ) ( not ( = ?auto_32683 ?auto_32687 ) ) ( ON ?auto_32686 ?auto_32683 ) ( ON-TABLE ?auto_32687 ) ( CLEAR ?auto_32685 ) ( ON ?auto_32684 ?auto_32686 ) ( CLEAR ?auto_32684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32687 ?auto_32683 ?auto_32686 )
      ( MAKE-1PILE ?auto_32682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32700 - BLOCK
    )
    :vars
    (
      ?auto_32704 - BLOCK
      ?auto_32701 - BLOCK
      ?auto_32703 - BLOCK
      ?auto_32705 - BLOCK
      ?auto_32702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32700 ?auto_32704 ) ) ( not ( = ?auto_32700 ?auto_32701 ) ) ( not ( = ?auto_32700 ?auto_32703 ) ) ( not ( = ?auto_32704 ?auto_32701 ) ) ( not ( = ?auto_32704 ?auto_32703 ) ) ( not ( = ?auto_32701 ?auto_32703 ) ) ( not ( = ?auto_32705 ?auto_32703 ) ) ( not ( = ?auto_32700 ?auto_32705 ) ) ( not ( = ?auto_32704 ?auto_32705 ) ) ( not ( = ?auto_32701 ?auto_32705 ) ) ( ON ?auto_32705 ?auto_32702 ) ( not ( = ?auto_32700 ?auto_32702 ) ) ( not ( = ?auto_32704 ?auto_32702 ) ) ( not ( = ?auto_32701 ?auto_32702 ) ) ( not ( = ?auto_32703 ?auto_32702 ) ) ( not ( = ?auto_32705 ?auto_32702 ) ) ( ON ?auto_32703 ?auto_32705 ) ( ON-TABLE ?auto_32702 ) ( ON ?auto_32701 ?auto_32703 ) ( ON ?auto_32704 ?auto_32701 ) ( CLEAR ?auto_32704 ) ( HOLDING ?auto_32700 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32700 ?auto_32704 )
      ( MAKE-1PILE ?auto_32700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_32706 - BLOCK
    )
    :vars
    (
      ?auto_32707 - BLOCK
      ?auto_32709 - BLOCK
      ?auto_32711 - BLOCK
      ?auto_32708 - BLOCK
      ?auto_32710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32706 ?auto_32707 ) ) ( not ( = ?auto_32706 ?auto_32709 ) ) ( not ( = ?auto_32706 ?auto_32711 ) ) ( not ( = ?auto_32707 ?auto_32709 ) ) ( not ( = ?auto_32707 ?auto_32711 ) ) ( not ( = ?auto_32709 ?auto_32711 ) ) ( not ( = ?auto_32708 ?auto_32711 ) ) ( not ( = ?auto_32706 ?auto_32708 ) ) ( not ( = ?auto_32707 ?auto_32708 ) ) ( not ( = ?auto_32709 ?auto_32708 ) ) ( ON ?auto_32708 ?auto_32710 ) ( not ( = ?auto_32706 ?auto_32710 ) ) ( not ( = ?auto_32707 ?auto_32710 ) ) ( not ( = ?auto_32709 ?auto_32710 ) ) ( not ( = ?auto_32711 ?auto_32710 ) ) ( not ( = ?auto_32708 ?auto_32710 ) ) ( ON ?auto_32711 ?auto_32708 ) ( ON-TABLE ?auto_32710 ) ( ON ?auto_32709 ?auto_32711 ) ( ON ?auto_32707 ?auto_32709 ) ( ON ?auto_32706 ?auto_32707 ) ( CLEAR ?auto_32706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32710 ?auto_32708 ?auto_32711 ?auto_32709 ?auto_32707 )
      ( MAKE-1PILE ?auto_32706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32716 - BLOCK
      ?auto_32717 - BLOCK
      ?auto_32718 - BLOCK
      ?auto_32719 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32719 ) ( CLEAR ?auto_32718 ) ( ON-TABLE ?auto_32716 ) ( ON ?auto_32717 ?auto_32716 ) ( ON ?auto_32718 ?auto_32717 ) ( not ( = ?auto_32716 ?auto_32717 ) ) ( not ( = ?auto_32716 ?auto_32718 ) ) ( not ( = ?auto_32716 ?auto_32719 ) ) ( not ( = ?auto_32717 ?auto_32718 ) ) ( not ( = ?auto_32717 ?auto_32719 ) ) ( not ( = ?auto_32718 ?auto_32719 ) ) )
    :subtasks
    ( ( !STACK ?auto_32719 ?auto_32718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32720 - BLOCK
      ?auto_32721 - BLOCK
      ?auto_32722 - BLOCK
      ?auto_32723 - BLOCK
    )
    :vars
    (
      ?auto_32724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32722 ) ( ON-TABLE ?auto_32720 ) ( ON ?auto_32721 ?auto_32720 ) ( ON ?auto_32722 ?auto_32721 ) ( not ( = ?auto_32720 ?auto_32721 ) ) ( not ( = ?auto_32720 ?auto_32722 ) ) ( not ( = ?auto_32720 ?auto_32723 ) ) ( not ( = ?auto_32721 ?auto_32722 ) ) ( not ( = ?auto_32721 ?auto_32723 ) ) ( not ( = ?auto_32722 ?auto_32723 ) ) ( ON ?auto_32723 ?auto_32724 ) ( CLEAR ?auto_32723 ) ( HAND-EMPTY ) ( not ( = ?auto_32720 ?auto_32724 ) ) ( not ( = ?auto_32721 ?auto_32724 ) ) ( not ( = ?auto_32722 ?auto_32724 ) ) ( not ( = ?auto_32723 ?auto_32724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32723 ?auto_32724 )
      ( MAKE-4PILE ?auto_32720 ?auto_32721 ?auto_32722 ?auto_32723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32725 - BLOCK
      ?auto_32726 - BLOCK
      ?auto_32727 - BLOCK
      ?auto_32728 - BLOCK
    )
    :vars
    (
      ?auto_32729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32725 ) ( ON ?auto_32726 ?auto_32725 ) ( not ( = ?auto_32725 ?auto_32726 ) ) ( not ( = ?auto_32725 ?auto_32727 ) ) ( not ( = ?auto_32725 ?auto_32728 ) ) ( not ( = ?auto_32726 ?auto_32727 ) ) ( not ( = ?auto_32726 ?auto_32728 ) ) ( not ( = ?auto_32727 ?auto_32728 ) ) ( ON ?auto_32728 ?auto_32729 ) ( CLEAR ?auto_32728 ) ( not ( = ?auto_32725 ?auto_32729 ) ) ( not ( = ?auto_32726 ?auto_32729 ) ) ( not ( = ?auto_32727 ?auto_32729 ) ) ( not ( = ?auto_32728 ?auto_32729 ) ) ( HOLDING ?auto_32727 ) ( CLEAR ?auto_32726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32725 ?auto_32726 ?auto_32727 )
      ( MAKE-4PILE ?auto_32725 ?auto_32726 ?auto_32727 ?auto_32728 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32730 - BLOCK
      ?auto_32731 - BLOCK
      ?auto_32732 - BLOCK
      ?auto_32733 - BLOCK
    )
    :vars
    (
      ?auto_32734 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32730 ) ( ON ?auto_32731 ?auto_32730 ) ( not ( = ?auto_32730 ?auto_32731 ) ) ( not ( = ?auto_32730 ?auto_32732 ) ) ( not ( = ?auto_32730 ?auto_32733 ) ) ( not ( = ?auto_32731 ?auto_32732 ) ) ( not ( = ?auto_32731 ?auto_32733 ) ) ( not ( = ?auto_32732 ?auto_32733 ) ) ( ON ?auto_32733 ?auto_32734 ) ( not ( = ?auto_32730 ?auto_32734 ) ) ( not ( = ?auto_32731 ?auto_32734 ) ) ( not ( = ?auto_32732 ?auto_32734 ) ) ( not ( = ?auto_32733 ?auto_32734 ) ) ( CLEAR ?auto_32731 ) ( ON ?auto_32732 ?auto_32733 ) ( CLEAR ?auto_32732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32734 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32734 ?auto_32733 )
      ( MAKE-4PILE ?auto_32730 ?auto_32731 ?auto_32732 ?auto_32733 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32735 - BLOCK
      ?auto_32736 - BLOCK
      ?auto_32737 - BLOCK
      ?auto_32738 - BLOCK
    )
    :vars
    (
      ?auto_32739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32735 ) ( not ( = ?auto_32735 ?auto_32736 ) ) ( not ( = ?auto_32735 ?auto_32737 ) ) ( not ( = ?auto_32735 ?auto_32738 ) ) ( not ( = ?auto_32736 ?auto_32737 ) ) ( not ( = ?auto_32736 ?auto_32738 ) ) ( not ( = ?auto_32737 ?auto_32738 ) ) ( ON ?auto_32738 ?auto_32739 ) ( not ( = ?auto_32735 ?auto_32739 ) ) ( not ( = ?auto_32736 ?auto_32739 ) ) ( not ( = ?auto_32737 ?auto_32739 ) ) ( not ( = ?auto_32738 ?auto_32739 ) ) ( ON ?auto_32737 ?auto_32738 ) ( CLEAR ?auto_32737 ) ( ON-TABLE ?auto_32739 ) ( HOLDING ?auto_32736 ) ( CLEAR ?auto_32735 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32735 ?auto_32736 )
      ( MAKE-4PILE ?auto_32735 ?auto_32736 ?auto_32737 ?auto_32738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32740 - BLOCK
      ?auto_32741 - BLOCK
      ?auto_32742 - BLOCK
      ?auto_32743 - BLOCK
    )
    :vars
    (
      ?auto_32744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32740 ) ( not ( = ?auto_32740 ?auto_32741 ) ) ( not ( = ?auto_32740 ?auto_32742 ) ) ( not ( = ?auto_32740 ?auto_32743 ) ) ( not ( = ?auto_32741 ?auto_32742 ) ) ( not ( = ?auto_32741 ?auto_32743 ) ) ( not ( = ?auto_32742 ?auto_32743 ) ) ( ON ?auto_32743 ?auto_32744 ) ( not ( = ?auto_32740 ?auto_32744 ) ) ( not ( = ?auto_32741 ?auto_32744 ) ) ( not ( = ?auto_32742 ?auto_32744 ) ) ( not ( = ?auto_32743 ?auto_32744 ) ) ( ON ?auto_32742 ?auto_32743 ) ( ON-TABLE ?auto_32744 ) ( CLEAR ?auto_32740 ) ( ON ?auto_32741 ?auto_32742 ) ( CLEAR ?auto_32741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32744 ?auto_32743 ?auto_32742 )
      ( MAKE-4PILE ?auto_32740 ?auto_32741 ?auto_32742 ?auto_32743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32745 - BLOCK
      ?auto_32746 - BLOCK
      ?auto_32747 - BLOCK
      ?auto_32748 - BLOCK
    )
    :vars
    (
      ?auto_32749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32745 ?auto_32746 ) ) ( not ( = ?auto_32745 ?auto_32747 ) ) ( not ( = ?auto_32745 ?auto_32748 ) ) ( not ( = ?auto_32746 ?auto_32747 ) ) ( not ( = ?auto_32746 ?auto_32748 ) ) ( not ( = ?auto_32747 ?auto_32748 ) ) ( ON ?auto_32748 ?auto_32749 ) ( not ( = ?auto_32745 ?auto_32749 ) ) ( not ( = ?auto_32746 ?auto_32749 ) ) ( not ( = ?auto_32747 ?auto_32749 ) ) ( not ( = ?auto_32748 ?auto_32749 ) ) ( ON ?auto_32747 ?auto_32748 ) ( ON-TABLE ?auto_32749 ) ( ON ?auto_32746 ?auto_32747 ) ( CLEAR ?auto_32746 ) ( HOLDING ?auto_32745 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32745 )
      ( MAKE-4PILE ?auto_32745 ?auto_32746 ?auto_32747 ?auto_32748 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32750 - BLOCK
      ?auto_32751 - BLOCK
      ?auto_32752 - BLOCK
      ?auto_32753 - BLOCK
    )
    :vars
    (
      ?auto_32754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32750 ?auto_32751 ) ) ( not ( = ?auto_32750 ?auto_32752 ) ) ( not ( = ?auto_32750 ?auto_32753 ) ) ( not ( = ?auto_32751 ?auto_32752 ) ) ( not ( = ?auto_32751 ?auto_32753 ) ) ( not ( = ?auto_32752 ?auto_32753 ) ) ( ON ?auto_32753 ?auto_32754 ) ( not ( = ?auto_32750 ?auto_32754 ) ) ( not ( = ?auto_32751 ?auto_32754 ) ) ( not ( = ?auto_32752 ?auto_32754 ) ) ( not ( = ?auto_32753 ?auto_32754 ) ) ( ON ?auto_32752 ?auto_32753 ) ( ON-TABLE ?auto_32754 ) ( ON ?auto_32751 ?auto_32752 ) ( ON ?auto_32750 ?auto_32751 ) ( CLEAR ?auto_32750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32754 ?auto_32753 ?auto_32752 ?auto_32751 )
      ( MAKE-4PILE ?auto_32750 ?auto_32751 ?auto_32752 ?auto_32753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32755 - BLOCK
      ?auto_32756 - BLOCK
      ?auto_32757 - BLOCK
      ?auto_32758 - BLOCK
    )
    :vars
    (
      ?auto_32759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32755 ?auto_32756 ) ) ( not ( = ?auto_32755 ?auto_32757 ) ) ( not ( = ?auto_32755 ?auto_32758 ) ) ( not ( = ?auto_32756 ?auto_32757 ) ) ( not ( = ?auto_32756 ?auto_32758 ) ) ( not ( = ?auto_32757 ?auto_32758 ) ) ( ON ?auto_32758 ?auto_32759 ) ( not ( = ?auto_32755 ?auto_32759 ) ) ( not ( = ?auto_32756 ?auto_32759 ) ) ( not ( = ?auto_32757 ?auto_32759 ) ) ( not ( = ?auto_32758 ?auto_32759 ) ) ( ON ?auto_32757 ?auto_32758 ) ( ON-TABLE ?auto_32759 ) ( ON ?auto_32756 ?auto_32757 ) ( HOLDING ?auto_32755 ) ( CLEAR ?auto_32756 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32759 ?auto_32758 ?auto_32757 ?auto_32756 ?auto_32755 )
      ( MAKE-4PILE ?auto_32755 ?auto_32756 ?auto_32757 ?auto_32758 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32760 - BLOCK
      ?auto_32761 - BLOCK
      ?auto_32762 - BLOCK
      ?auto_32763 - BLOCK
    )
    :vars
    (
      ?auto_32764 - BLOCK
      ?auto_32765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32760 ?auto_32761 ) ) ( not ( = ?auto_32760 ?auto_32762 ) ) ( not ( = ?auto_32760 ?auto_32763 ) ) ( not ( = ?auto_32761 ?auto_32762 ) ) ( not ( = ?auto_32761 ?auto_32763 ) ) ( not ( = ?auto_32762 ?auto_32763 ) ) ( ON ?auto_32763 ?auto_32764 ) ( not ( = ?auto_32760 ?auto_32764 ) ) ( not ( = ?auto_32761 ?auto_32764 ) ) ( not ( = ?auto_32762 ?auto_32764 ) ) ( not ( = ?auto_32763 ?auto_32764 ) ) ( ON ?auto_32762 ?auto_32763 ) ( ON-TABLE ?auto_32764 ) ( ON ?auto_32761 ?auto_32762 ) ( CLEAR ?auto_32761 ) ( ON ?auto_32760 ?auto_32765 ) ( CLEAR ?auto_32760 ) ( HAND-EMPTY ) ( not ( = ?auto_32760 ?auto_32765 ) ) ( not ( = ?auto_32761 ?auto_32765 ) ) ( not ( = ?auto_32762 ?auto_32765 ) ) ( not ( = ?auto_32763 ?auto_32765 ) ) ( not ( = ?auto_32764 ?auto_32765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32760 ?auto_32765 )
      ( MAKE-4PILE ?auto_32760 ?auto_32761 ?auto_32762 ?auto_32763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32766 - BLOCK
      ?auto_32767 - BLOCK
      ?auto_32768 - BLOCK
      ?auto_32769 - BLOCK
    )
    :vars
    (
      ?auto_32770 - BLOCK
      ?auto_32771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32766 ?auto_32767 ) ) ( not ( = ?auto_32766 ?auto_32768 ) ) ( not ( = ?auto_32766 ?auto_32769 ) ) ( not ( = ?auto_32767 ?auto_32768 ) ) ( not ( = ?auto_32767 ?auto_32769 ) ) ( not ( = ?auto_32768 ?auto_32769 ) ) ( ON ?auto_32769 ?auto_32770 ) ( not ( = ?auto_32766 ?auto_32770 ) ) ( not ( = ?auto_32767 ?auto_32770 ) ) ( not ( = ?auto_32768 ?auto_32770 ) ) ( not ( = ?auto_32769 ?auto_32770 ) ) ( ON ?auto_32768 ?auto_32769 ) ( ON-TABLE ?auto_32770 ) ( ON ?auto_32766 ?auto_32771 ) ( CLEAR ?auto_32766 ) ( not ( = ?auto_32766 ?auto_32771 ) ) ( not ( = ?auto_32767 ?auto_32771 ) ) ( not ( = ?auto_32768 ?auto_32771 ) ) ( not ( = ?auto_32769 ?auto_32771 ) ) ( not ( = ?auto_32770 ?auto_32771 ) ) ( HOLDING ?auto_32767 ) ( CLEAR ?auto_32768 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32770 ?auto_32769 ?auto_32768 ?auto_32767 )
      ( MAKE-4PILE ?auto_32766 ?auto_32767 ?auto_32768 ?auto_32769 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32772 - BLOCK
      ?auto_32773 - BLOCK
      ?auto_32774 - BLOCK
      ?auto_32775 - BLOCK
    )
    :vars
    (
      ?auto_32777 - BLOCK
      ?auto_32776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32772 ?auto_32773 ) ) ( not ( = ?auto_32772 ?auto_32774 ) ) ( not ( = ?auto_32772 ?auto_32775 ) ) ( not ( = ?auto_32773 ?auto_32774 ) ) ( not ( = ?auto_32773 ?auto_32775 ) ) ( not ( = ?auto_32774 ?auto_32775 ) ) ( ON ?auto_32775 ?auto_32777 ) ( not ( = ?auto_32772 ?auto_32777 ) ) ( not ( = ?auto_32773 ?auto_32777 ) ) ( not ( = ?auto_32774 ?auto_32777 ) ) ( not ( = ?auto_32775 ?auto_32777 ) ) ( ON ?auto_32774 ?auto_32775 ) ( ON-TABLE ?auto_32777 ) ( ON ?auto_32772 ?auto_32776 ) ( not ( = ?auto_32772 ?auto_32776 ) ) ( not ( = ?auto_32773 ?auto_32776 ) ) ( not ( = ?auto_32774 ?auto_32776 ) ) ( not ( = ?auto_32775 ?auto_32776 ) ) ( not ( = ?auto_32777 ?auto_32776 ) ) ( CLEAR ?auto_32774 ) ( ON ?auto_32773 ?auto_32772 ) ( CLEAR ?auto_32773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32776 ?auto_32772 )
      ( MAKE-4PILE ?auto_32772 ?auto_32773 ?auto_32774 ?auto_32775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32778 - BLOCK
      ?auto_32779 - BLOCK
      ?auto_32780 - BLOCK
      ?auto_32781 - BLOCK
    )
    :vars
    (
      ?auto_32783 - BLOCK
      ?auto_32782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32778 ?auto_32779 ) ) ( not ( = ?auto_32778 ?auto_32780 ) ) ( not ( = ?auto_32778 ?auto_32781 ) ) ( not ( = ?auto_32779 ?auto_32780 ) ) ( not ( = ?auto_32779 ?auto_32781 ) ) ( not ( = ?auto_32780 ?auto_32781 ) ) ( ON ?auto_32781 ?auto_32783 ) ( not ( = ?auto_32778 ?auto_32783 ) ) ( not ( = ?auto_32779 ?auto_32783 ) ) ( not ( = ?auto_32780 ?auto_32783 ) ) ( not ( = ?auto_32781 ?auto_32783 ) ) ( ON-TABLE ?auto_32783 ) ( ON ?auto_32778 ?auto_32782 ) ( not ( = ?auto_32778 ?auto_32782 ) ) ( not ( = ?auto_32779 ?auto_32782 ) ) ( not ( = ?auto_32780 ?auto_32782 ) ) ( not ( = ?auto_32781 ?auto_32782 ) ) ( not ( = ?auto_32783 ?auto_32782 ) ) ( ON ?auto_32779 ?auto_32778 ) ( CLEAR ?auto_32779 ) ( ON-TABLE ?auto_32782 ) ( HOLDING ?auto_32780 ) ( CLEAR ?auto_32781 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32783 ?auto_32781 ?auto_32780 )
      ( MAKE-4PILE ?auto_32778 ?auto_32779 ?auto_32780 ?auto_32781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32784 - BLOCK
      ?auto_32785 - BLOCK
      ?auto_32786 - BLOCK
      ?auto_32787 - BLOCK
    )
    :vars
    (
      ?auto_32788 - BLOCK
      ?auto_32789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32784 ?auto_32785 ) ) ( not ( = ?auto_32784 ?auto_32786 ) ) ( not ( = ?auto_32784 ?auto_32787 ) ) ( not ( = ?auto_32785 ?auto_32786 ) ) ( not ( = ?auto_32785 ?auto_32787 ) ) ( not ( = ?auto_32786 ?auto_32787 ) ) ( ON ?auto_32787 ?auto_32788 ) ( not ( = ?auto_32784 ?auto_32788 ) ) ( not ( = ?auto_32785 ?auto_32788 ) ) ( not ( = ?auto_32786 ?auto_32788 ) ) ( not ( = ?auto_32787 ?auto_32788 ) ) ( ON-TABLE ?auto_32788 ) ( ON ?auto_32784 ?auto_32789 ) ( not ( = ?auto_32784 ?auto_32789 ) ) ( not ( = ?auto_32785 ?auto_32789 ) ) ( not ( = ?auto_32786 ?auto_32789 ) ) ( not ( = ?auto_32787 ?auto_32789 ) ) ( not ( = ?auto_32788 ?auto_32789 ) ) ( ON ?auto_32785 ?auto_32784 ) ( ON-TABLE ?auto_32789 ) ( CLEAR ?auto_32787 ) ( ON ?auto_32786 ?auto_32785 ) ( CLEAR ?auto_32786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32789 ?auto_32784 ?auto_32785 )
      ( MAKE-4PILE ?auto_32784 ?auto_32785 ?auto_32786 ?auto_32787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32790 - BLOCK
      ?auto_32791 - BLOCK
      ?auto_32792 - BLOCK
      ?auto_32793 - BLOCK
    )
    :vars
    (
      ?auto_32795 - BLOCK
      ?auto_32794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32790 ?auto_32791 ) ) ( not ( = ?auto_32790 ?auto_32792 ) ) ( not ( = ?auto_32790 ?auto_32793 ) ) ( not ( = ?auto_32791 ?auto_32792 ) ) ( not ( = ?auto_32791 ?auto_32793 ) ) ( not ( = ?auto_32792 ?auto_32793 ) ) ( not ( = ?auto_32790 ?auto_32795 ) ) ( not ( = ?auto_32791 ?auto_32795 ) ) ( not ( = ?auto_32792 ?auto_32795 ) ) ( not ( = ?auto_32793 ?auto_32795 ) ) ( ON-TABLE ?auto_32795 ) ( ON ?auto_32790 ?auto_32794 ) ( not ( = ?auto_32790 ?auto_32794 ) ) ( not ( = ?auto_32791 ?auto_32794 ) ) ( not ( = ?auto_32792 ?auto_32794 ) ) ( not ( = ?auto_32793 ?auto_32794 ) ) ( not ( = ?auto_32795 ?auto_32794 ) ) ( ON ?auto_32791 ?auto_32790 ) ( ON-TABLE ?auto_32794 ) ( ON ?auto_32792 ?auto_32791 ) ( CLEAR ?auto_32792 ) ( HOLDING ?auto_32793 ) ( CLEAR ?auto_32795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32795 ?auto_32793 )
      ( MAKE-4PILE ?auto_32790 ?auto_32791 ?auto_32792 ?auto_32793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32796 - BLOCK
      ?auto_32797 - BLOCK
      ?auto_32798 - BLOCK
      ?auto_32799 - BLOCK
    )
    :vars
    (
      ?auto_32801 - BLOCK
      ?auto_32800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32796 ?auto_32797 ) ) ( not ( = ?auto_32796 ?auto_32798 ) ) ( not ( = ?auto_32796 ?auto_32799 ) ) ( not ( = ?auto_32797 ?auto_32798 ) ) ( not ( = ?auto_32797 ?auto_32799 ) ) ( not ( = ?auto_32798 ?auto_32799 ) ) ( not ( = ?auto_32796 ?auto_32801 ) ) ( not ( = ?auto_32797 ?auto_32801 ) ) ( not ( = ?auto_32798 ?auto_32801 ) ) ( not ( = ?auto_32799 ?auto_32801 ) ) ( ON-TABLE ?auto_32801 ) ( ON ?auto_32796 ?auto_32800 ) ( not ( = ?auto_32796 ?auto_32800 ) ) ( not ( = ?auto_32797 ?auto_32800 ) ) ( not ( = ?auto_32798 ?auto_32800 ) ) ( not ( = ?auto_32799 ?auto_32800 ) ) ( not ( = ?auto_32801 ?auto_32800 ) ) ( ON ?auto_32797 ?auto_32796 ) ( ON-TABLE ?auto_32800 ) ( ON ?auto_32798 ?auto_32797 ) ( CLEAR ?auto_32801 ) ( ON ?auto_32799 ?auto_32798 ) ( CLEAR ?auto_32799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32800 ?auto_32796 ?auto_32797 ?auto_32798 )
      ( MAKE-4PILE ?auto_32796 ?auto_32797 ?auto_32798 ?auto_32799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32802 - BLOCK
      ?auto_32803 - BLOCK
      ?auto_32804 - BLOCK
      ?auto_32805 - BLOCK
    )
    :vars
    (
      ?auto_32807 - BLOCK
      ?auto_32806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32802 ?auto_32803 ) ) ( not ( = ?auto_32802 ?auto_32804 ) ) ( not ( = ?auto_32802 ?auto_32805 ) ) ( not ( = ?auto_32803 ?auto_32804 ) ) ( not ( = ?auto_32803 ?auto_32805 ) ) ( not ( = ?auto_32804 ?auto_32805 ) ) ( not ( = ?auto_32802 ?auto_32807 ) ) ( not ( = ?auto_32803 ?auto_32807 ) ) ( not ( = ?auto_32804 ?auto_32807 ) ) ( not ( = ?auto_32805 ?auto_32807 ) ) ( ON ?auto_32802 ?auto_32806 ) ( not ( = ?auto_32802 ?auto_32806 ) ) ( not ( = ?auto_32803 ?auto_32806 ) ) ( not ( = ?auto_32804 ?auto_32806 ) ) ( not ( = ?auto_32805 ?auto_32806 ) ) ( not ( = ?auto_32807 ?auto_32806 ) ) ( ON ?auto_32803 ?auto_32802 ) ( ON-TABLE ?auto_32806 ) ( ON ?auto_32804 ?auto_32803 ) ( ON ?auto_32805 ?auto_32804 ) ( CLEAR ?auto_32805 ) ( HOLDING ?auto_32807 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32807 )
      ( MAKE-4PILE ?auto_32802 ?auto_32803 ?auto_32804 ?auto_32805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_32808 - BLOCK
      ?auto_32809 - BLOCK
      ?auto_32810 - BLOCK
      ?auto_32811 - BLOCK
    )
    :vars
    (
      ?auto_32812 - BLOCK
      ?auto_32813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32808 ?auto_32809 ) ) ( not ( = ?auto_32808 ?auto_32810 ) ) ( not ( = ?auto_32808 ?auto_32811 ) ) ( not ( = ?auto_32809 ?auto_32810 ) ) ( not ( = ?auto_32809 ?auto_32811 ) ) ( not ( = ?auto_32810 ?auto_32811 ) ) ( not ( = ?auto_32808 ?auto_32812 ) ) ( not ( = ?auto_32809 ?auto_32812 ) ) ( not ( = ?auto_32810 ?auto_32812 ) ) ( not ( = ?auto_32811 ?auto_32812 ) ) ( ON ?auto_32808 ?auto_32813 ) ( not ( = ?auto_32808 ?auto_32813 ) ) ( not ( = ?auto_32809 ?auto_32813 ) ) ( not ( = ?auto_32810 ?auto_32813 ) ) ( not ( = ?auto_32811 ?auto_32813 ) ) ( not ( = ?auto_32812 ?auto_32813 ) ) ( ON ?auto_32809 ?auto_32808 ) ( ON-TABLE ?auto_32813 ) ( ON ?auto_32810 ?auto_32809 ) ( ON ?auto_32811 ?auto_32810 ) ( ON ?auto_32812 ?auto_32811 ) ( CLEAR ?auto_32812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32813 ?auto_32808 ?auto_32809 ?auto_32810 ?auto_32811 )
      ( MAKE-4PILE ?auto_32808 ?auto_32809 ?auto_32810 ?auto_32811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32819 - BLOCK
      ?auto_32820 - BLOCK
      ?auto_32821 - BLOCK
      ?auto_32822 - BLOCK
      ?auto_32823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_32823 ) ( CLEAR ?auto_32822 ) ( ON-TABLE ?auto_32819 ) ( ON ?auto_32820 ?auto_32819 ) ( ON ?auto_32821 ?auto_32820 ) ( ON ?auto_32822 ?auto_32821 ) ( not ( = ?auto_32819 ?auto_32820 ) ) ( not ( = ?auto_32819 ?auto_32821 ) ) ( not ( = ?auto_32819 ?auto_32822 ) ) ( not ( = ?auto_32819 ?auto_32823 ) ) ( not ( = ?auto_32820 ?auto_32821 ) ) ( not ( = ?auto_32820 ?auto_32822 ) ) ( not ( = ?auto_32820 ?auto_32823 ) ) ( not ( = ?auto_32821 ?auto_32822 ) ) ( not ( = ?auto_32821 ?auto_32823 ) ) ( not ( = ?auto_32822 ?auto_32823 ) ) )
    :subtasks
    ( ( !STACK ?auto_32823 ?auto_32822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32824 - BLOCK
      ?auto_32825 - BLOCK
      ?auto_32826 - BLOCK
      ?auto_32827 - BLOCK
      ?auto_32828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_32827 ) ( ON-TABLE ?auto_32824 ) ( ON ?auto_32825 ?auto_32824 ) ( ON ?auto_32826 ?auto_32825 ) ( ON ?auto_32827 ?auto_32826 ) ( not ( = ?auto_32824 ?auto_32825 ) ) ( not ( = ?auto_32824 ?auto_32826 ) ) ( not ( = ?auto_32824 ?auto_32827 ) ) ( not ( = ?auto_32824 ?auto_32828 ) ) ( not ( = ?auto_32825 ?auto_32826 ) ) ( not ( = ?auto_32825 ?auto_32827 ) ) ( not ( = ?auto_32825 ?auto_32828 ) ) ( not ( = ?auto_32826 ?auto_32827 ) ) ( not ( = ?auto_32826 ?auto_32828 ) ) ( not ( = ?auto_32827 ?auto_32828 ) ) ( ON-TABLE ?auto_32828 ) ( CLEAR ?auto_32828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_32828 )
      ( MAKE-5PILE ?auto_32824 ?auto_32825 ?auto_32826 ?auto_32827 ?auto_32828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32829 - BLOCK
      ?auto_32830 - BLOCK
      ?auto_32831 - BLOCK
      ?auto_32832 - BLOCK
      ?auto_32833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32829 ) ( ON ?auto_32830 ?auto_32829 ) ( ON ?auto_32831 ?auto_32830 ) ( not ( = ?auto_32829 ?auto_32830 ) ) ( not ( = ?auto_32829 ?auto_32831 ) ) ( not ( = ?auto_32829 ?auto_32832 ) ) ( not ( = ?auto_32829 ?auto_32833 ) ) ( not ( = ?auto_32830 ?auto_32831 ) ) ( not ( = ?auto_32830 ?auto_32832 ) ) ( not ( = ?auto_32830 ?auto_32833 ) ) ( not ( = ?auto_32831 ?auto_32832 ) ) ( not ( = ?auto_32831 ?auto_32833 ) ) ( not ( = ?auto_32832 ?auto_32833 ) ) ( ON-TABLE ?auto_32833 ) ( CLEAR ?auto_32833 ) ( HOLDING ?auto_32832 ) ( CLEAR ?auto_32831 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32829 ?auto_32830 ?auto_32831 ?auto_32832 )
      ( MAKE-5PILE ?auto_32829 ?auto_32830 ?auto_32831 ?auto_32832 ?auto_32833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32834 - BLOCK
      ?auto_32835 - BLOCK
      ?auto_32836 - BLOCK
      ?auto_32837 - BLOCK
      ?auto_32838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32834 ) ( ON ?auto_32835 ?auto_32834 ) ( ON ?auto_32836 ?auto_32835 ) ( not ( = ?auto_32834 ?auto_32835 ) ) ( not ( = ?auto_32834 ?auto_32836 ) ) ( not ( = ?auto_32834 ?auto_32837 ) ) ( not ( = ?auto_32834 ?auto_32838 ) ) ( not ( = ?auto_32835 ?auto_32836 ) ) ( not ( = ?auto_32835 ?auto_32837 ) ) ( not ( = ?auto_32835 ?auto_32838 ) ) ( not ( = ?auto_32836 ?auto_32837 ) ) ( not ( = ?auto_32836 ?auto_32838 ) ) ( not ( = ?auto_32837 ?auto_32838 ) ) ( ON-TABLE ?auto_32838 ) ( CLEAR ?auto_32836 ) ( ON ?auto_32837 ?auto_32838 ) ( CLEAR ?auto_32837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32838 )
      ( MAKE-5PILE ?auto_32834 ?auto_32835 ?auto_32836 ?auto_32837 ?auto_32838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32839 - BLOCK
      ?auto_32840 - BLOCK
      ?auto_32841 - BLOCK
      ?auto_32842 - BLOCK
      ?auto_32843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32839 ) ( ON ?auto_32840 ?auto_32839 ) ( not ( = ?auto_32839 ?auto_32840 ) ) ( not ( = ?auto_32839 ?auto_32841 ) ) ( not ( = ?auto_32839 ?auto_32842 ) ) ( not ( = ?auto_32839 ?auto_32843 ) ) ( not ( = ?auto_32840 ?auto_32841 ) ) ( not ( = ?auto_32840 ?auto_32842 ) ) ( not ( = ?auto_32840 ?auto_32843 ) ) ( not ( = ?auto_32841 ?auto_32842 ) ) ( not ( = ?auto_32841 ?auto_32843 ) ) ( not ( = ?auto_32842 ?auto_32843 ) ) ( ON-TABLE ?auto_32843 ) ( ON ?auto_32842 ?auto_32843 ) ( CLEAR ?auto_32842 ) ( HOLDING ?auto_32841 ) ( CLEAR ?auto_32840 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32839 ?auto_32840 ?auto_32841 )
      ( MAKE-5PILE ?auto_32839 ?auto_32840 ?auto_32841 ?auto_32842 ?auto_32843 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32844 - BLOCK
      ?auto_32845 - BLOCK
      ?auto_32846 - BLOCK
      ?auto_32847 - BLOCK
      ?auto_32848 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32844 ) ( ON ?auto_32845 ?auto_32844 ) ( not ( = ?auto_32844 ?auto_32845 ) ) ( not ( = ?auto_32844 ?auto_32846 ) ) ( not ( = ?auto_32844 ?auto_32847 ) ) ( not ( = ?auto_32844 ?auto_32848 ) ) ( not ( = ?auto_32845 ?auto_32846 ) ) ( not ( = ?auto_32845 ?auto_32847 ) ) ( not ( = ?auto_32845 ?auto_32848 ) ) ( not ( = ?auto_32846 ?auto_32847 ) ) ( not ( = ?auto_32846 ?auto_32848 ) ) ( not ( = ?auto_32847 ?auto_32848 ) ) ( ON-TABLE ?auto_32848 ) ( ON ?auto_32847 ?auto_32848 ) ( CLEAR ?auto_32845 ) ( ON ?auto_32846 ?auto_32847 ) ( CLEAR ?auto_32846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32848 ?auto_32847 )
      ( MAKE-5PILE ?auto_32844 ?auto_32845 ?auto_32846 ?auto_32847 ?auto_32848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32849 - BLOCK
      ?auto_32850 - BLOCK
      ?auto_32851 - BLOCK
      ?auto_32852 - BLOCK
      ?auto_32853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32849 ) ( not ( = ?auto_32849 ?auto_32850 ) ) ( not ( = ?auto_32849 ?auto_32851 ) ) ( not ( = ?auto_32849 ?auto_32852 ) ) ( not ( = ?auto_32849 ?auto_32853 ) ) ( not ( = ?auto_32850 ?auto_32851 ) ) ( not ( = ?auto_32850 ?auto_32852 ) ) ( not ( = ?auto_32850 ?auto_32853 ) ) ( not ( = ?auto_32851 ?auto_32852 ) ) ( not ( = ?auto_32851 ?auto_32853 ) ) ( not ( = ?auto_32852 ?auto_32853 ) ) ( ON-TABLE ?auto_32853 ) ( ON ?auto_32852 ?auto_32853 ) ( ON ?auto_32851 ?auto_32852 ) ( CLEAR ?auto_32851 ) ( HOLDING ?auto_32850 ) ( CLEAR ?auto_32849 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32849 ?auto_32850 )
      ( MAKE-5PILE ?auto_32849 ?auto_32850 ?auto_32851 ?auto_32852 ?auto_32853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32854 - BLOCK
      ?auto_32855 - BLOCK
      ?auto_32856 - BLOCK
      ?auto_32857 - BLOCK
      ?auto_32858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_32854 ) ( not ( = ?auto_32854 ?auto_32855 ) ) ( not ( = ?auto_32854 ?auto_32856 ) ) ( not ( = ?auto_32854 ?auto_32857 ) ) ( not ( = ?auto_32854 ?auto_32858 ) ) ( not ( = ?auto_32855 ?auto_32856 ) ) ( not ( = ?auto_32855 ?auto_32857 ) ) ( not ( = ?auto_32855 ?auto_32858 ) ) ( not ( = ?auto_32856 ?auto_32857 ) ) ( not ( = ?auto_32856 ?auto_32858 ) ) ( not ( = ?auto_32857 ?auto_32858 ) ) ( ON-TABLE ?auto_32858 ) ( ON ?auto_32857 ?auto_32858 ) ( ON ?auto_32856 ?auto_32857 ) ( CLEAR ?auto_32854 ) ( ON ?auto_32855 ?auto_32856 ) ( CLEAR ?auto_32855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32858 ?auto_32857 ?auto_32856 )
      ( MAKE-5PILE ?auto_32854 ?auto_32855 ?auto_32856 ?auto_32857 ?auto_32858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32859 - BLOCK
      ?auto_32860 - BLOCK
      ?auto_32861 - BLOCK
      ?auto_32862 - BLOCK
      ?auto_32863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32859 ?auto_32860 ) ) ( not ( = ?auto_32859 ?auto_32861 ) ) ( not ( = ?auto_32859 ?auto_32862 ) ) ( not ( = ?auto_32859 ?auto_32863 ) ) ( not ( = ?auto_32860 ?auto_32861 ) ) ( not ( = ?auto_32860 ?auto_32862 ) ) ( not ( = ?auto_32860 ?auto_32863 ) ) ( not ( = ?auto_32861 ?auto_32862 ) ) ( not ( = ?auto_32861 ?auto_32863 ) ) ( not ( = ?auto_32862 ?auto_32863 ) ) ( ON-TABLE ?auto_32863 ) ( ON ?auto_32862 ?auto_32863 ) ( ON ?auto_32861 ?auto_32862 ) ( ON ?auto_32860 ?auto_32861 ) ( CLEAR ?auto_32860 ) ( HOLDING ?auto_32859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32859 )
      ( MAKE-5PILE ?auto_32859 ?auto_32860 ?auto_32861 ?auto_32862 ?auto_32863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32864 - BLOCK
      ?auto_32865 - BLOCK
      ?auto_32866 - BLOCK
      ?auto_32867 - BLOCK
      ?auto_32868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32864 ?auto_32865 ) ) ( not ( = ?auto_32864 ?auto_32866 ) ) ( not ( = ?auto_32864 ?auto_32867 ) ) ( not ( = ?auto_32864 ?auto_32868 ) ) ( not ( = ?auto_32865 ?auto_32866 ) ) ( not ( = ?auto_32865 ?auto_32867 ) ) ( not ( = ?auto_32865 ?auto_32868 ) ) ( not ( = ?auto_32866 ?auto_32867 ) ) ( not ( = ?auto_32866 ?auto_32868 ) ) ( not ( = ?auto_32867 ?auto_32868 ) ) ( ON-TABLE ?auto_32868 ) ( ON ?auto_32867 ?auto_32868 ) ( ON ?auto_32866 ?auto_32867 ) ( ON ?auto_32865 ?auto_32866 ) ( ON ?auto_32864 ?auto_32865 ) ( CLEAR ?auto_32864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32868 ?auto_32867 ?auto_32866 ?auto_32865 )
      ( MAKE-5PILE ?auto_32864 ?auto_32865 ?auto_32866 ?auto_32867 ?auto_32868 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32869 - BLOCK
      ?auto_32870 - BLOCK
      ?auto_32871 - BLOCK
      ?auto_32872 - BLOCK
      ?auto_32873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32869 ?auto_32870 ) ) ( not ( = ?auto_32869 ?auto_32871 ) ) ( not ( = ?auto_32869 ?auto_32872 ) ) ( not ( = ?auto_32869 ?auto_32873 ) ) ( not ( = ?auto_32870 ?auto_32871 ) ) ( not ( = ?auto_32870 ?auto_32872 ) ) ( not ( = ?auto_32870 ?auto_32873 ) ) ( not ( = ?auto_32871 ?auto_32872 ) ) ( not ( = ?auto_32871 ?auto_32873 ) ) ( not ( = ?auto_32872 ?auto_32873 ) ) ( ON-TABLE ?auto_32873 ) ( ON ?auto_32872 ?auto_32873 ) ( ON ?auto_32871 ?auto_32872 ) ( ON ?auto_32870 ?auto_32871 ) ( HOLDING ?auto_32869 ) ( CLEAR ?auto_32870 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32873 ?auto_32872 ?auto_32871 ?auto_32870 ?auto_32869 )
      ( MAKE-5PILE ?auto_32869 ?auto_32870 ?auto_32871 ?auto_32872 ?auto_32873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32874 - BLOCK
      ?auto_32875 - BLOCK
      ?auto_32876 - BLOCK
      ?auto_32877 - BLOCK
      ?auto_32878 - BLOCK
    )
    :vars
    (
      ?auto_32879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32874 ?auto_32875 ) ) ( not ( = ?auto_32874 ?auto_32876 ) ) ( not ( = ?auto_32874 ?auto_32877 ) ) ( not ( = ?auto_32874 ?auto_32878 ) ) ( not ( = ?auto_32875 ?auto_32876 ) ) ( not ( = ?auto_32875 ?auto_32877 ) ) ( not ( = ?auto_32875 ?auto_32878 ) ) ( not ( = ?auto_32876 ?auto_32877 ) ) ( not ( = ?auto_32876 ?auto_32878 ) ) ( not ( = ?auto_32877 ?auto_32878 ) ) ( ON-TABLE ?auto_32878 ) ( ON ?auto_32877 ?auto_32878 ) ( ON ?auto_32876 ?auto_32877 ) ( ON ?auto_32875 ?auto_32876 ) ( CLEAR ?auto_32875 ) ( ON ?auto_32874 ?auto_32879 ) ( CLEAR ?auto_32874 ) ( HAND-EMPTY ) ( not ( = ?auto_32874 ?auto_32879 ) ) ( not ( = ?auto_32875 ?auto_32879 ) ) ( not ( = ?auto_32876 ?auto_32879 ) ) ( not ( = ?auto_32877 ?auto_32879 ) ) ( not ( = ?auto_32878 ?auto_32879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_32874 ?auto_32879 )
      ( MAKE-5PILE ?auto_32874 ?auto_32875 ?auto_32876 ?auto_32877 ?auto_32878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32880 - BLOCK
      ?auto_32881 - BLOCK
      ?auto_32882 - BLOCK
      ?auto_32883 - BLOCK
      ?auto_32884 - BLOCK
    )
    :vars
    (
      ?auto_32885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32880 ?auto_32881 ) ) ( not ( = ?auto_32880 ?auto_32882 ) ) ( not ( = ?auto_32880 ?auto_32883 ) ) ( not ( = ?auto_32880 ?auto_32884 ) ) ( not ( = ?auto_32881 ?auto_32882 ) ) ( not ( = ?auto_32881 ?auto_32883 ) ) ( not ( = ?auto_32881 ?auto_32884 ) ) ( not ( = ?auto_32882 ?auto_32883 ) ) ( not ( = ?auto_32882 ?auto_32884 ) ) ( not ( = ?auto_32883 ?auto_32884 ) ) ( ON-TABLE ?auto_32884 ) ( ON ?auto_32883 ?auto_32884 ) ( ON ?auto_32882 ?auto_32883 ) ( ON ?auto_32880 ?auto_32885 ) ( CLEAR ?auto_32880 ) ( not ( = ?auto_32880 ?auto_32885 ) ) ( not ( = ?auto_32881 ?auto_32885 ) ) ( not ( = ?auto_32882 ?auto_32885 ) ) ( not ( = ?auto_32883 ?auto_32885 ) ) ( not ( = ?auto_32884 ?auto_32885 ) ) ( HOLDING ?auto_32881 ) ( CLEAR ?auto_32882 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32884 ?auto_32883 ?auto_32882 ?auto_32881 )
      ( MAKE-5PILE ?auto_32880 ?auto_32881 ?auto_32882 ?auto_32883 ?auto_32884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32886 - BLOCK
      ?auto_32887 - BLOCK
      ?auto_32888 - BLOCK
      ?auto_32889 - BLOCK
      ?auto_32890 - BLOCK
    )
    :vars
    (
      ?auto_32891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32886 ?auto_32887 ) ) ( not ( = ?auto_32886 ?auto_32888 ) ) ( not ( = ?auto_32886 ?auto_32889 ) ) ( not ( = ?auto_32886 ?auto_32890 ) ) ( not ( = ?auto_32887 ?auto_32888 ) ) ( not ( = ?auto_32887 ?auto_32889 ) ) ( not ( = ?auto_32887 ?auto_32890 ) ) ( not ( = ?auto_32888 ?auto_32889 ) ) ( not ( = ?auto_32888 ?auto_32890 ) ) ( not ( = ?auto_32889 ?auto_32890 ) ) ( ON-TABLE ?auto_32890 ) ( ON ?auto_32889 ?auto_32890 ) ( ON ?auto_32888 ?auto_32889 ) ( ON ?auto_32886 ?auto_32891 ) ( not ( = ?auto_32886 ?auto_32891 ) ) ( not ( = ?auto_32887 ?auto_32891 ) ) ( not ( = ?auto_32888 ?auto_32891 ) ) ( not ( = ?auto_32889 ?auto_32891 ) ) ( not ( = ?auto_32890 ?auto_32891 ) ) ( CLEAR ?auto_32888 ) ( ON ?auto_32887 ?auto_32886 ) ( CLEAR ?auto_32887 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32891 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32891 ?auto_32886 )
      ( MAKE-5PILE ?auto_32886 ?auto_32887 ?auto_32888 ?auto_32889 ?auto_32890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32892 - BLOCK
      ?auto_32893 - BLOCK
      ?auto_32894 - BLOCK
      ?auto_32895 - BLOCK
      ?auto_32896 - BLOCK
    )
    :vars
    (
      ?auto_32897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32892 ?auto_32893 ) ) ( not ( = ?auto_32892 ?auto_32894 ) ) ( not ( = ?auto_32892 ?auto_32895 ) ) ( not ( = ?auto_32892 ?auto_32896 ) ) ( not ( = ?auto_32893 ?auto_32894 ) ) ( not ( = ?auto_32893 ?auto_32895 ) ) ( not ( = ?auto_32893 ?auto_32896 ) ) ( not ( = ?auto_32894 ?auto_32895 ) ) ( not ( = ?auto_32894 ?auto_32896 ) ) ( not ( = ?auto_32895 ?auto_32896 ) ) ( ON-TABLE ?auto_32896 ) ( ON ?auto_32895 ?auto_32896 ) ( ON ?auto_32892 ?auto_32897 ) ( not ( = ?auto_32892 ?auto_32897 ) ) ( not ( = ?auto_32893 ?auto_32897 ) ) ( not ( = ?auto_32894 ?auto_32897 ) ) ( not ( = ?auto_32895 ?auto_32897 ) ) ( not ( = ?auto_32896 ?auto_32897 ) ) ( ON ?auto_32893 ?auto_32892 ) ( CLEAR ?auto_32893 ) ( ON-TABLE ?auto_32897 ) ( HOLDING ?auto_32894 ) ( CLEAR ?auto_32895 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32896 ?auto_32895 ?auto_32894 )
      ( MAKE-5PILE ?auto_32892 ?auto_32893 ?auto_32894 ?auto_32895 ?auto_32896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32898 - BLOCK
      ?auto_32899 - BLOCK
      ?auto_32900 - BLOCK
      ?auto_32901 - BLOCK
      ?auto_32902 - BLOCK
    )
    :vars
    (
      ?auto_32903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32898 ?auto_32899 ) ) ( not ( = ?auto_32898 ?auto_32900 ) ) ( not ( = ?auto_32898 ?auto_32901 ) ) ( not ( = ?auto_32898 ?auto_32902 ) ) ( not ( = ?auto_32899 ?auto_32900 ) ) ( not ( = ?auto_32899 ?auto_32901 ) ) ( not ( = ?auto_32899 ?auto_32902 ) ) ( not ( = ?auto_32900 ?auto_32901 ) ) ( not ( = ?auto_32900 ?auto_32902 ) ) ( not ( = ?auto_32901 ?auto_32902 ) ) ( ON-TABLE ?auto_32902 ) ( ON ?auto_32901 ?auto_32902 ) ( ON ?auto_32898 ?auto_32903 ) ( not ( = ?auto_32898 ?auto_32903 ) ) ( not ( = ?auto_32899 ?auto_32903 ) ) ( not ( = ?auto_32900 ?auto_32903 ) ) ( not ( = ?auto_32901 ?auto_32903 ) ) ( not ( = ?auto_32902 ?auto_32903 ) ) ( ON ?auto_32899 ?auto_32898 ) ( ON-TABLE ?auto_32903 ) ( CLEAR ?auto_32901 ) ( ON ?auto_32900 ?auto_32899 ) ( CLEAR ?auto_32900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_32903 ?auto_32898 ?auto_32899 )
      ( MAKE-5PILE ?auto_32898 ?auto_32899 ?auto_32900 ?auto_32901 ?auto_32902 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32904 - BLOCK
      ?auto_32905 - BLOCK
      ?auto_32906 - BLOCK
      ?auto_32907 - BLOCK
      ?auto_32908 - BLOCK
    )
    :vars
    (
      ?auto_32909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32904 ?auto_32905 ) ) ( not ( = ?auto_32904 ?auto_32906 ) ) ( not ( = ?auto_32904 ?auto_32907 ) ) ( not ( = ?auto_32904 ?auto_32908 ) ) ( not ( = ?auto_32905 ?auto_32906 ) ) ( not ( = ?auto_32905 ?auto_32907 ) ) ( not ( = ?auto_32905 ?auto_32908 ) ) ( not ( = ?auto_32906 ?auto_32907 ) ) ( not ( = ?auto_32906 ?auto_32908 ) ) ( not ( = ?auto_32907 ?auto_32908 ) ) ( ON-TABLE ?auto_32908 ) ( ON ?auto_32904 ?auto_32909 ) ( not ( = ?auto_32904 ?auto_32909 ) ) ( not ( = ?auto_32905 ?auto_32909 ) ) ( not ( = ?auto_32906 ?auto_32909 ) ) ( not ( = ?auto_32907 ?auto_32909 ) ) ( not ( = ?auto_32908 ?auto_32909 ) ) ( ON ?auto_32905 ?auto_32904 ) ( ON-TABLE ?auto_32909 ) ( ON ?auto_32906 ?auto_32905 ) ( CLEAR ?auto_32906 ) ( HOLDING ?auto_32907 ) ( CLEAR ?auto_32908 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_32908 ?auto_32907 )
      ( MAKE-5PILE ?auto_32904 ?auto_32905 ?auto_32906 ?auto_32907 ?auto_32908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32910 - BLOCK
      ?auto_32911 - BLOCK
      ?auto_32912 - BLOCK
      ?auto_32913 - BLOCK
      ?auto_32914 - BLOCK
    )
    :vars
    (
      ?auto_32915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32910 ?auto_32911 ) ) ( not ( = ?auto_32910 ?auto_32912 ) ) ( not ( = ?auto_32910 ?auto_32913 ) ) ( not ( = ?auto_32910 ?auto_32914 ) ) ( not ( = ?auto_32911 ?auto_32912 ) ) ( not ( = ?auto_32911 ?auto_32913 ) ) ( not ( = ?auto_32911 ?auto_32914 ) ) ( not ( = ?auto_32912 ?auto_32913 ) ) ( not ( = ?auto_32912 ?auto_32914 ) ) ( not ( = ?auto_32913 ?auto_32914 ) ) ( ON-TABLE ?auto_32914 ) ( ON ?auto_32910 ?auto_32915 ) ( not ( = ?auto_32910 ?auto_32915 ) ) ( not ( = ?auto_32911 ?auto_32915 ) ) ( not ( = ?auto_32912 ?auto_32915 ) ) ( not ( = ?auto_32913 ?auto_32915 ) ) ( not ( = ?auto_32914 ?auto_32915 ) ) ( ON ?auto_32911 ?auto_32910 ) ( ON-TABLE ?auto_32915 ) ( ON ?auto_32912 ?auto_32911 ) ( CLEAR ?auto_32914 ) ( ON ?auto_32913 ?auto_32912 ) ( CLEAR ?auto_32913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_32915 ?auto_32910 ?auto_32911 ?auto_32912 )
      ( MAKE-5PILE ?auto_32910 ?auto_32911 ?auto_32912 ?auto_32913 ?auto_32914 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32916 - BLOCK
      ?auto_32917 - BLOCK
      ?auto_32918 - BLOCK
      ?auto_32919 - BLOCK
      ?auto_32920 - BLOCK
    )
    :vars
    (
      ?auto_32921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32916 ?auto_32917 ) ) ( not ( = ?auto_32916 ?auto_32918 ) ) ( not ( = ?auto_32916 ?auto_32919 ) ) ( not ( = ?auto_32916 ?auto_32920 ) ) ( not ( = ?auto_32917 ?auto_32918 ) ) ( not ( = ?auto_32917 ?auto_32919 ) ) ( not ( = ?auto_32917 ?auto_32920 ) ) ( not ( = ?auto_32918 ?auto_32919 ) ) ( not ( = ?auto_32918 ?auto_32920 ) ) ( not ( = ?auto_32919 ?auto_32920 ) ) ( ON ?auto_32916 ?auto_32921 ) ( not ( = ?auto_32916 ?auto_32921 ) ) ( not ( = ?auto_32917 ?auto_32921 ) ) ( not ( = ?auto_32918 ?auto_32921 ) ) ( not ( = ?auto_32919 ?auto_32921 ) ) ( not ( = ?auto_32920 ?auto_32921 ) ) ( ON ?auto_32917 ?auto_32916 ) ( ON-TABLE ?auto_32921 ) ( ON ?auto_32918 ?auto_32917 ) ( ON ?auto_32919 ?auto_32918 ) ( CLEAR ?auto_32919 ) ( HOLDING ?auto_32920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_32920 )
      ( MAKE-5PILE ?auto_32916 ?auto_32917 ?auto_32918 ?auto_32919 ?auto_32920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_32922 - BLOCK
      ?auto_32923 - BLOCK
      ?auto_32924 - BLOCK
      ?auto_32925 - BLOCK
      ?auto_32926 - BLOCK
    )
    :vars
    (
      ?auto_32927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_32922 ?auto_32923 ) ) ( not ( = ?auto_32922 ?auto_32924 ) ) ( not ( = ?auto_32922 ?auto_32925 ) ) ( not ( = ?auto_32922 ?auto_32926 ) ) ( not ( = ?auto_32923 ?auto_32924 ) ) ( not ( = ?auto_32923 ?auto_32925 ) ) ( not ( = ?auto_32923 ?auto_32926 ) ) ( not ( = ?auto_32924 ?auto_32925 ) ) ( not ( = ?auto_32924 ?auto_32926 ) ) ( not ( = ?auto_32925 ?auto_32926 ) ) ( ON ?auto_32922 ?auto_32927 ) ( not ( = ?auto_32922 ?auto_32927 ) ) ( not ( = ?auto_32923 ?auto_32927 ) ) ( not ( = ?auto_32924 ?auto_32927 ) ) ( not ( = ?auto_32925 ?auto_32927 ) ) ( not ( = ?auto_32926 ?auto_32927 ) ) ( ON ?auto_32923 ?auto_32922 ) ( ON-TABLE ?auto_32927 ) ( ON ?auto_32924 ?auto_32923 ) ( ON ?auto_32925 ?auto_32924 ) ( ON ?auto_32926 ?auto_32925 ) ( CLEAR ?auto_32926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_32927 ?auto_32922 ?auto_32923 ?auto_32924 ?auto_32925 )
      ( MAKE-5PILE ?auto_32922 ?auto_32923 ?auto_32924 ?auto_32925 ?auto_32926 ) )
  )

)

