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
      ?auto_76843 - BLOCK
    )
    :vars
    (
      ?auto_76844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76843 ?auto_76844 ) ( CLEAR ?auto_76843 ) ( HAND-EMPTY ) ( not ( = ?auto_76843 ?auto_76844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76843 ?auto_76844 )
      ( !PUTDOWN ?auto_76843 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76846 - BLOCK
    )
    :vars
    (
      ?auto_76847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76846 ?auto_76847 ) ( CLEAR ?auto_76846 ) ( HAND-EMPTY ) ( not ( = ?auto_76846 ?auto_76847 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76846 ?auto_76847 )
      ( !PUTDOWN ?auto_76846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76850 - BLOCK
      ?auto_76851 - BLOCK
    )
    :vars
    (
      ?auto_76852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76850 ) ( ON ?auto_76851 ?auto_76852 ) ( CLEAR ?auto_76851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76850 ) ( not ( = ?auto_76850 ?auto_76851 ) ) ( not ( = ?auto_76850 ?auto_76852 ) ) ( not ( = ?auto_76851 ?auto_76852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76851 ?auto_76852 )
      ( !STACK ?auto_76851 ?auto_76850 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76855 - BLOCK
      ?auto_76856 - BLOCK
    )
    :vars
    (
      ?auto_76857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76855 ) ( ON ?auto_76856 ?auto_76857 ) ( CLEAR ?auto_76856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76855 ) ( not ( = ?auto_76855 ?auto_76856 ) ) ( not ( = ?auto_76855 ?auto_76857 ) ) ( not ( = ?auto_76856 ?auto_76857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76856 ?auto_76857 )
      ( !STACK ?auto_76856 ?auto_76855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76860 - BLOCK
      ?auto_76861 - BLOCK
    )
    :vars
    (
      ?auto_76862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76861 ?auto_76862 ) ( not ( = ?auto_76860 ?auto_76861 ) ) ( not ( = ?auto_76860 ?auto_76862 ) ) ( not ( = ?auto_76861 ?auto_76862 ) ) ( ON ?auto_76860 ?auto_76861 ) ( CLEAR ?auto_76860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76860 )
      ( MAKE-2PILE ?auto_76860 ?auto_76861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76865 - BLOCK
      ?auto_76866 - BLOCK
    )
    :vars
    (
      ?auto_76867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76866 ?auto_76867 ) ( not ( = ?auto_76865 ?auto_76866 ) ) ( not ( = ?auto_76865 ?auto_76867 ) ) ( not ( = ?auto_76866 ?auto_76867 ) ) ( ON ?auto_76865 ?auto_76866 ) ( CLEAR ?auto_76865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76865 )
      ( MAKE-2PILE ?auto_76865 ?auto_76866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76871 - BLOCK
      ?auto_76872 - BLOCK
      ?auto_76873 - BLOCK
    )
    :vars
    (
      ?auto_76874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76872 ) ( ON ?auto_76873 ?auto_76874 ) ( CLEAR ?auto_76873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76871 ) ( ON ?auto_76872 ?auto_76871 ) ( not ( = ?auto_76871 ?auto_76872 ) ) ( not ( = ?auto_76871 ?auto_76873 ) ) ( not ( = ?auto_76871 ?auto_76874 ) ) ( not ( = ?auto_76872 ?auto_76873 ) ) ( not ( = ?auto_76872 ?auto_76874 ) ) ( not ( = ?auto_76873 ?auto_76874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76873 ?auto_76874 )
      ( !STACK ?auto_76873 ?auto_76872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76878 - BLOCK
      ?auto_76879 - BLOCK
      ?auto_76880 - BLOCK
    )
    :vars
    (
      ?auto_76881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76879 ) ( ON ?auto_76880 ?auto_76881 ) ( CLEAR ?auto_76880 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76878 ) ( ON ?auto_76879 ?auto_76878 ) ( not ( = ?auto_76878 ?auto_76879 ) ) ( not ( = ?auto_76878 ?auto_76880 ) ) ( not ( = ?auto_76878 ?auto_76881 ) ) ( not ( = ?auto_76879 ?auto_76880 ) ) ( not ( = ?auto_76879 ?auto_76881 ) ) ( not ( = ?auto_76880 ?auto_76881 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76880 ?auto_76881 )
      ( !STACK ?auto_76880 ?auto_76879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76885 - BLOCK
      ?auto_76886 - BLOCK
      ?auto_76887 - BLOCK
    )
    :vars
    (
      ?auto_76888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76887 ?auto_76888 ) ( ON-TABLE ?auto_76885 ) ( not ( = ?auto_76885 ?auto_76886 ) ) ( not ( = ?auto_76885 ?auto_76887 ) ) ( not ( = ?auto_76885 ?auto_76888 ) ) ( not ( = ?auto_76886 ?auto_76887 ) ) ( not ( = ?auto_76886 ?auto_76888 ) ) ( not ( = ?auto_76887 ?auto_76888 ) ) ( CLEAR ?auto_76885 ) ( ON ?auto_76886 ?auto_76887 ) ( CLEAR ?auto_76886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76885 ?auto_76886 )
      ( MAKE-3PILE ?auto_76885 ?auto_76886 ?auto_76887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76892 - BLOCK
      ?auto_76893 - BLOCK
      ?auto_76894 - BLOCK
    )
    :vars
    (
      ?auto_76895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76894 ?auto_76895 ) ( ON-TABLE ?auto_76892 ) ( not ( = ?auto_76892 ?auto_76893 ) ) ( not ( = ?auto_76892 ?auto_76894 ) ) ( not ( = ?auto_76892 ?auto_76895 ) ) ( not ( = ?auto_76893 ?auto_76894 ) ) ( not ( = ?auto_76893 ?auto_76895 ) ) ( not ( = ?auto_76894 ?auto_76895 ) ) ( CLEAR ?auto_76892 ) ( ON ?auto_76893 ?auto_76894 ) ( CLEAR ?auto_76893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76892 ?auto_76893 )
      ( MAKE-3PILE ?auto_76892 ?auto_76893 ?auto_76894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76899 - BLOCK
      ?auto_76900 - BLOCK
      ?auto_76901 - BLOCK
    )
    :vars
    (
      ?auto_76902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76901 ?auto_76902 ) ( not ( = ?auto_76899 ?auto_76900 ) ) ( not ( = ?auto_76899 ?auto_76901 ) ) ( not ( = ?auto_76899 ?auto_76902 ) ) ( not ( = ?auto_76900 ?auto_76901 ) ) ( not ( = ?auto_76900 ?auto_76902 ) ) ( not ( = ?auto_76901 ?auto_76902 ) ) ( ON ?auto_76900 ?auto_76901 ) ( ON ?auto_76899 ?auto_76900 ) ( CLEAR ?auto_76899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76899 )
      ( MAKE-3PILE ?auto_76899 ?auto_76900 ?auto_76901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76906 - BLOCK
      ?auto_76907 - BLOCK
      ?auto_76908 - BLOCK
    )
    :vars
    (
      ?auto_76909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76908 ?auto_76909 ) ( not ( = ?auto_76906 ?auto_76907 ) ) ( not ( = ?auto_76906 ?auto_76908 ) ) ( not ( = ?auto_76906 ?auto_76909 ) ) ( not ( = ?auto_76907 ?auto_76908 ) ) ( not ( = ?auto_76907 ?auto_76909 ) ) ( not ( = ?auto_76908 ?auto_76909 ) ) ( ON ?auto_76907 ?auto_76908 ) ( ON ?auto_76906 ?auto_76907 ) ( CLEAR ?auto_76906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76906 )
      ( MAKE-3PILE ?auto_76906 ?auto_76907 ?auto_76908 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76914 - BLOCK
      ?auto_76915 - BLOCK
      ?auto_76916 - BLOCK
      ?auto_76917 - BLOCK
    )
    :vars
    (
      ?auto_76918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76916 ) ( ON ?auto_76917 ?auto_76918 ) ( CLEAR ?auto_76917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76914 ) ( ON ?auto_76915 ?auto_76914 ) ( ON ?auto_76916 ?auto_76915 ) ( not ( = ?auto_76914 ?auto_76915 ) ) ( not ( = ?auto_76914 ?auto_76916 ) ) ( not ( = ?auto_76914 ?auto_76917 ) ) ( not ( = ?auto_76914 ?auto_76918 ) ) ( not ( = ?auto_76915 ?auto_76916 ) ) ( not ( = ?auto_76915 ?auto_76917 ) ) ( not ( = ?auto_76915 ?auto_76918 ) ) ( not ( = ?auto_76916 ?auto_76917 ) ) ( not ( = ?auto_76916 ?auto_76918 ) ) ( not ( = ?auto_76917 ?auto_76918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76917 ?auto_76918 )
      ( !STACK ?auto_76917 ?auto_76916 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76923 - BLOCK
      ?auto_76924 - BLOCK
      ?auto_76925 - BLOCK
      ?auto_76926 - BLOCK
    )
    :vars
    (
      ?auto_76927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76925 ) ( ON ?auto_76926 ?auto_76927 ) ( CLEAR ?auto_76926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76923 ) ( ON ?auto_76924 ?auto_76923 ) ( ON ?auto_76925 ?auto_76924 ) ( not ( = ?auto_76923 ?auto_76924 ) ) ( not ( = ?auto_76923 ?auto_76925 ) ) ( not ( = ?auto_76923 ?auto_76926 ) ) ( not ( = ?auto_76923 ?auto_76927 ) ) ( not ( = ?auto_76924 ?auto_76925 ) ) ( not ( = ?auto_76924 ?auto_76926 ) ) ( not ( = ?auto_76924 ?auto_76927 ) ) ( not ( = ?auto_76925 ?auto_76926 ) ) ( not ( = ?auto_76925 ?auto_76927 ) ) ( not ( = ?auto_76926 ?auto_76927 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76926 ?auto_76927 )
      ( !STACK ?auto_76926 ?auto_76925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76932 - BLOCK
      ?auto_76933 - BLOCK
      ?auto_76934 - BLOCK
      ?auto_76935 - BLOCK
    )
    :vars
    (
      ?auto_76936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76935 ?auto_76936 ) ( ON-TABLE ?auto_76932 ) ( ON ?auto_76933 ?auto_76932 ) ( not ( = ?auto_76932 ?auto_76933 ) ) ( not ( = ?auto_76932 ?auto_76934 ) ) ( not ( = ?auto_76932 ?auto_76935 ) ) ( not ( = ?auto_76932 ?auto_76936 ) ) ( not ( = ?auto_76933 ?auto_76934 ) ) ( not ( = ?auto_76933 ?auto_76935 ) ) ( not ( = ?auto_76933 ?auto_76936 ) ) ( not ( = ?auto_76934 ?auto_76935 ) ) ( not ( = ?auto_76934 ?auto_76936 ) ) ( not ( = ?auto_76935 ?auto_76936 ) ) ( CLEAR ?auto_76933 ) ( ON ?auto_76934 ?auto_76935 ) ( CLEAR ?auto_76934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76932 ?auto_76933 ?auto_76934 )
      ( MAKE-4PILE ?auto_76932 ?auto_76933 ?auto_76934 ?auto_76935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76941 - BLOCK
      ?auto_76942 - BLOCK
      ?auto_76943 - BLOCK
      ?auto_76944 - BLOCK
    )
    :vars
    (
      ?auto_76945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76944 ?auto_76945 ) ( ON-TABLE ?auto_76941 ) ( ON ?auto_76942 ?auto_76941 ) ( not ( = ?auto_76941 ?auto_76942 ) ) ( not ( = ?auto_76941 ?auto_76943 ) ) ( not ( = ?auto_76941 ?auto_76944 ) ) ( not ( = ?auto_76941 ?auto_76945 ) ) ( not ( = ?auto_76942 ?auto_76943 ) ) ( not ( = ?auto_76942 ?auto_76944 ) ) ( not ( = ?auto_76942 ?auto_76945 ) ) ( not ( = ?auto_76943 ?auto_76944 ) ) ( not ( = ?auto_76943 ?auto_76945 ) ) ( not ( = ?auto_76944 ?auto_76945 ) ) ( CLEAR ?auto_76942 ) ( ON ?auto_76943 ?auto_76944 ) ( CLEAR ?auto_76943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76941 ?auto_76942 ?auto_76943 )
      ( MAKE-4PILE ?auto_76941 ?auto_76942 ?auto_76943 ?auto_76944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76950 - BLOCK
      ?auto_76951 - BLOCK
      ?auto_76952 - BLOCK
      ?auto_76953 - BLOCK
    )
    :vars
    (
      ?auto_76954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76953 ?auto_76954 ) ( ON-TABLE ?auto_76950 ) ( not ( = ?auto_76950 ?auto_76951 ) ) ( not ( = ?auto_76950 ?auto_76952 ) ) ( not ( = ?auto_76950 ?auto_76953 ) ) ( not ( = ?auto_76950 ?auto_76954 ) ) ( not ( = ?auto_76951 ?auto_76952 ) ) ( not ( = ?auto_76951 ?auto_76953 ) ) ( not ( = ?auto_76951 ?auto_76954 ) ) ( not ( = ?auto_76952 ?auto_76953 ) ) ( not ( = ?auto_76952 ?auto_76954 ) ) ( not ( = ?auto_76953 ?auto_76954 ) ) ( ON ?auto_76952 ?auto_76953 ) ( CLEAR ?auto_76950 ) ( ON ?auto_76951 ?auto_76952 ) ( CLEAR ?auto_76951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76950 ?auto_76951 )
      ( MAKE-4PILE ?auto_76950 ?auto_76951 ?auto_76952 ?auto_76953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76959 - BLOCK
      ?auto_76960 - BLOCK
      ?auto_76961 - BLOCK
      ?auto_76962 - BLOCK
    )
    :vars
    (
      ?auto_76963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76962 ?auto_76963 ) ( ON-TABLE ?auto_76959 ) ( not ( = ?auto_76959 ?auto_76960 ) ) ( not ( = ?auto_76959 ?auto_76961 ) ) ( not ( = ?auto_76959 ?auto_76962 ) ) ( not ( = ?auto_76959 ?auto_76963 ) ) ( not ( = ?auto_76960 ?auto_76961 ) ) ( not ( = ?auto_76960 ?auto_76962 ) ) ( not ( = ?auto_76960 ?auto_76963 ) ) ( not ( = ?auto_76961 ?auto_76962 ) ) ( not ( = ?auto_76961 ?auto_76963 ) ) ( not ( = ?auto_76962 ?auto_76963 ) ) ( ON ?auto_76961 ?auto_76962 ) ( CLEAR ?auto_76959 ) ( ON ?auto_76960 ?auto_76961 ) ( CLEAR ?auto_76960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76959 ?auto_76960 )
      ( MAKE-4PILE ?auto_76959 ?auto_76960 ?auto_76961 ?auto_76962 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76968 - BLOCK
      ?auto_76969 - BLOCK
      ?auto_76970 - BLOCK
      ?auto_76971 - BLOCK
    )
    :vars
    (
      ?auto_76972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76971 ?auto_76972 ) ( not ( = ?auto_76968 ?auto_76969 ) ) ( not ( = ?auto_76968 ?auto_76970 ) ) ( not ( = ?auto_76968 ?auto_76971 ) ) ( not ( = ?auto_76968 ?auto_76972 ) ) ( not ( = ?auto_76969 ?auto_76970 ) ) ( not ( = ?auto_76969 ?auto_76971 ) ) ( not ( = ?auto_76969 ?auto_76972 ) ) ( not ( = ?auto_76970 ?auto_76971 ) ) ( not ( = ?auto_76970 ?auto_76972 ) ) ( not ( = ?auto_76971 ?auto_76972 ) ) ( ON ?auto_76970 ?auto_76971 ) ( ON ?auto_76969 ?auto_76970 ) ( ON ?auto_76968 ?auto_76969 ) ( CLEAR ?auto_76968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76968 )
      ( MAKE-4PILE ?auto_76968 ?auto_76969 ?auto_76970 ?auto_76971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_76977 - BLOCK
      ?auto_76978 - BLOCK
      ?auto_76979 - BLOCK
      ?auto_76980 - BLOCK
    )
    :vars
    (
      ?auto_76981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76980 ?auto_76981 ) ( not ( = ?auto_76977 ?auto_76978 ) ) ( not ( = ?auto_76977 ?auto_76979 ) ) ( not ( = ?auto_76977 ?auto_76980 ) ) ( not ( = ?auto_76977 ?auto_76981 ) ) ( not ( = ?auto_76978 ?auto_76979 ) ) ( not ( = ?auto_76978 ?auto_76980 ) ) ( not ( = ?auto_76978 ?auto_76981 ) ) ( not ( = ?auto_76979 ?auto_76980 ) ) ( not ( = ?auto_76979 ?auto_76981 ) ) ( not ( = ?auto_76980 ?auto_76981 ) ) ( ON ?auto_76979 ?auto_76980 ) ( ON ?auto_76978 ?auto_76979 ) ( ON ?auto_76977 ?auto_76978 ) ( CLEAR ?auto_76977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76977 )
      ( MAKE-4PILE ?auto_76977 ?auto_76978 ?auto_76979 ?auto_76980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76987 - BLOCK
      ?auto_76988 - BLOCK
      ?auto_76989 - BLOCK
      ?auto_76990 - BLOCK
      ?auto_76991 - BLOCK
    )
    :vars
    (
      ?auto_76992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76990 ) ( ON ?auto_76991 ?auto_76992 ) ( CLEAR ?auto_76991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76987 ) ( ON ?auto_76988 ?auto_76987 ) ( ON ?auto_76989 ?auto_76988 ) ( ON ?auto_76990 ?auto_76989 ) ( not ( = ?auto_76987 ?auto_76988 ) ) ( not ( = ?auto_76987 ?auto_76989 ) ) ( not ( = ?auto_76987 ?auto_76990 ) ) ( not ( = ?auto_76987 ?auto_76991 ) ) ( not ( = ?auto_76987 ?auto_76992 ) ) ( not ( = ?auto_76988 ?auto_76989 ) ) ( not ( = ?auto_76988 ?auto_76990 ) ) ( not ( = ?auto_76988 ?auto_76991 ) ) ( not ( = ?auto_76988 ?auto_76992 ) ) ( not ( = ?auto_76989 ?auto_76990 ) ) ( not ( = ?auto_76989 ?auto_76991 ) ) ( not ( = ?auto_76989 ?auto_76992 ) ) ( not ( = ?auto_76990 ?auto_76991 ) ) ( not ( = ?auto_76990 ?auto_76992 ) ) ( not ( = ?auto_76991 ?auto_76992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76991 ?auto_76992 )
      ( !STACK ?auto_76991 ?auto_76990 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76998 - BLOCK
      ?auto_76999 - BLOCK
      ?auto_77000 - BLOCK
      ?auto_77001 - BLOCK
      ?auto_77002 - BLOCK
    )
    :vars
    (
      ?auto_77003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77001 ) ( ON ?auto_77002 ?auto_77003 ) ( CLEAR ?auto_77002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76998 ) ( ON ?auto_76999 ?auto_76998 ) ( ON ?auto_77000 ?auto_76999 ) ( ON ?auto_77001 ?auto_77000 ) ( not ( = ?auto_76998 ?auto_76999 ) ) ( not ( = ?auto_76998 ?auto_77000 ) ) ( not ( = ?auto_76998 ?auto_77001 ) ) ( not ( = ?auto_76998 ?auto_77002 ) ) ( not ( = ?auto_76998 ?auto_77003 ) ) ( not ( = ?auto_76999 ?auto_77000 ) ) ( not ( = ?auto_76999 ?auto_77001 ) ) ( not ( = ?auto_76999 ?auto_77002 ) ) ( not ( = ?auto_76999 ?auto_77003 ) ) ( not ( = ?auto_77000 ?auto_77001 ) ) ( not ( = ?auto_77000 ?auto_77002 ) ) ( not ( = ?auto_77000 ?auto_77003 ) ) ( not ( = ?auto_77001 ?auto_77002 ) ) ( not ( = ?auto_77001 ?auto_77003 ) ) ( not ( = ?auto_77002 ?auto_77003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77002 ?auto_77003 )
      ( !STACK ?auto_77002 ?auto_77001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77009 - BLOCK
      ?auto_77010 - BLOCK
      ?auto_77011 - BLOCK
      ?auto_77012 - BLOCK
      ?auto_77013 - BLOCK
    )
    :vars
    (
      ?auto_77014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77013 ?auto_77014 ) ( ON-TABLE ?auto_77009 ) ( ON ?auto_77010 ?auto_77009 ) ( ON ?auto_77011 ?auto_77010 ) ( not ( = ?auto_77009 ?auto_77010 ) ) ( not ( = ?auto_77009 ?auto_77011 ) ) ( not ( = ?auto_77009 ?auto_77012 ) ) ( not ( = ?auto_77009 ?auto_77013 ) ) ( not ( = ?auto_77009 ?auto_77014 ) ) ( not ( = ?auto_77010 ?auto_77011 ) ) ( not ( = ?auto_77010 ?auto_77012 ) ) ( not ( = ?auto_77010 ?auto_77013 ) ) ( not ( = ?auto_77010 ?auto_77014 ) ) ( not ( = ?auto_77011 ?auto_77012 ) ) ( not ( = ?auto_77011 ?auto_77013 ) ) ( not ( = ?auto_77011 ?auto_77014 ) ) ( not ( = ?auto_77012 ?auto_77013 ) ) ( not ( = ?auto_77012 ?auto_77014 ) ) ( not ( = ?auto_77013 ?auto_77014 ) ) ( CLEAR ?auto_77011 ) ( ON ?auto_77012 ?auto_77013 ) ( CLEAR ?auto_77012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77009 ?auto_77010 ?auto_77011 ?auto_77012 )
      ( MAKE-5PILE ?auto_77009 ?auto_77010 ?auto_77011 ?auto_77012 ?auto_77013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77020 - BLOCK
      ?auto_77021 - BLOCK
      ?auto_77022 - BLOCK
      ?auto_77023 - BLOCK
      ?auto_77024 - BLOCK
    )
    :vars
    (
      ?auto_77025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77024 ?auto_77025 ) ( ON-TABLE ?auto_77020 ) ( ON ?auto_77021 ?auto_77020 ) ( ON ?auto_77022 ?auto_77021 ) ( not ( = ?auto_77020 ?auto_77021 ) ) ( not ( = ?auto_77020 ?auto_77022 ) ) ( not ( = ?auto_77020 ?auto_77023 ) ) ( not ( = ?auto_77020 ?auto_77024 ) ) ( not ( = ?auto_77020 ?auto_77025 ) ) ( not ( = ?auto_77021 ?auto_77022 ) ) ( not ( = ?auto_77021 ?auto_77023 ) ) ( not ( = ?auto_77021 ?auto_77024 ) ) ( not ( = ?auto_77021 ?auto_77025 ) ) ( not ( = ?auto_77022 ?auto_77023 ) ) ( not ( = ?auto_77022 ?auto_77024 ) ) ( not ( = ?auto_77022 ?auto_77025 ) ) ( not ( = ?auto_77023 ?auto_77024 ) ) ( not ( = ?auto_77023 ?auto_77025 ) ) ( not ( = ?auto_77024 ?auto_77025 ) ) ( CLEAR ?auto_77022 ) ( ON ?auto_77023 ?auto_77024 ) ( CLEAR ?auto_77023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77020 ?auto_77021 ?auto_77022 ?auto_77023 )
      ( MAKE-5PILE ?auto_77020 ?auto_77021 ?auto_77022 ?auto_77023 ?auto_77024 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77031 - BLOCK
      ?auto_77032 - BLOCK
      ?auto_77033 - BLOCK
      ?auto_77034 - BLOCK
      ?auto_77035 - BLOCK
    )
    :vars
    (
      ?auto_77036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77035 ?auto_77036 ) ( ON-TABLE ?auto_77031 ) ( ON ?auto_77032 ?auto_77031 ) ( not ( = ?auto_77031 ?auto_77032 ) ) ( not ( = ?auto_77031 ?auto_77033 ) ) ( not ( = ?auto_77031 ?auto_77034 ) ) ( not ( = ?auto_77031 ?auto_77035 ) ) ( not ( = ?auto_77031 ?auto_77036 ) ) ( not ( = ?auto_77032 ?auto_77033 ) ) ( not ( = ?auto_77032 ?auto_77034 ) ) ( not ( = ?auto_77032 ?auto_77035 ) ) ( not ( = ?auto_77032 ?auto_77036 ) ) ( not ( = ?auto_77033 ?auto_77034 ) ) ( not ( = ?auto_77033 ?auto_77035 ) ) ( not ( = ?auto_77033 ?auto_77036 ) ) ( not ( = ?auto_77034 ?auto_77035 ) ) ( not ( = ?auto_77034 ?auto_77036 ) ) ( not ( = ?auto_77035 ?auto_77036 ) ) ( ON ?auto_77034 ?auto_77035 ) ( CLEAR ?auto_77032 ) ( ON ?auto_77033 ?auto_77034 ) ( CLEAR ?auto_77033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77031 ?auto_77032 ?auto_77033 )
      ( MAKE-5PILE ?auto_77031 ?auto_77032 ?auto_77033 ?auto_77034 ?auto_77035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77042 - BLOCK
      ?auto_77043 - BLOCK
      ?auto_77044 - BLOCK
      ?auto_77045 - BLOCK
      ?auto_77046 - BLOCK
    )
    :vars
    (
      ?auto_77047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77046 ?auto_77047 ) ( ON-TABLE ?auto_77042 ) ( ON ?auto_77043 ?auto_77042 ) ( not ( = ?auto_77042 ?auto_77043 ) ) ( not ( = ?auto_77042 ?auto_77044 ) ) ( not ( = ?auto_77042 ?auto_77045 ) ) ( not ( = ?auto_77042 ?auto_77046 ) ) ( not ( = ?auto_77042 ?auto_77047 ) ) ( not ( = ?auto_77043 ?auto_77044 ) ) ( not ( = ?auto_77043 ?auto_77045 ) ) ( not ( = ?auto_77043 ?auto_77046 ) ) ( not ( = ?auto_77043 ?auto_77047 ) ) ( not ( = ?auto_77044 ?auto_77045 ) ) ( not ( = ?auto_77044 ?auto_77046 ) ) ( not ( = ?auto_77044 ?auto_77047 ) ) ( not ( = ?auto_77045 ?auto_77046 ) ) ( not ( = ?auto_77045 ?auto_77047 ) ) ( not ( = ?auto_77046 ?auto_77047 ) ) ( ON ?auto_77045 ?auto_77046 ) ( CLEAR ?auto_77043 ) ( ON ?auto_77044 ?auto_77045 ) ( CLEAR ?auto_77044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77042 ?auto_77043 ?auto_77044 )
      ( MAKE-5PILE ?auto_77042 ?auto_77043 ?auto_77044 ?auto_77045 ?auto_77046 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77053 - BLOCK
      ?auto_77054 - BLOCK
      ?auto_77055 - BLOCK
      ?auto_77056 - BLOCK
      ?auto_77057 - BLOCK
    )
    :vars
    (
      ?auto_77058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77057 ?auto_77058 ) ( ON-TABLE ?auto_77053 ) ( not ( = ?auto_77053 ?auto_77054 ) ) ( not ( = ?auto_77053 ?auto_77055 ) ) ( not ( = ?auto_77053 ?auto_77056 ) ) ( not ( = ?auto_77053 ?auto_77057 ) ) ( not ( = ?auto_77053 ?auto_77058 ) ) ( not ( = ?auto_77054 ?auto_77055 ) ) ( not ( = ?auto_77054 ?auto_77056 ) ) ( not ( = ?auto_77054 ?auto_77057 ) ) ( not ( = ?auto_77054 ?auto_77058 ) ) ( not ( = ?auto_77055 ?auto_77056 ) ) ( not ( = ?auto_77055 ?auto_77057 ) ) ( not ( = ?auto_77055 ?auto_77058 ) ) ( not ( = ?auto_77056 ?auto_77057 ) ) ( not ( = ?auto_77056 ?auto_77058 ) ) ( not ( = ?auto_77057 ?auto_77058 ) ) ( ON ?auto_77056 ?auto_77057 ) ( ON ?auto_77055 ?auto_77056 ) ( CLEAR ?auto_77053 ) ( ON ?auto_77054 ?auto_77055 ) ( CLEAR ?auto_77054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77053 ?auto_77054 )
      ( MAKE-5PILE ?auto_77053 ?auto_77054 ?auto_77055 ?auto_77056 ?auto_77057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77064 - BLOCK
      ?auto_77065 - BLOCK
      ?auto_77066 - BLOCK
      ?auto_77067 - BLOCK
      ?auto_77068 - BLOCK
    )
    :vars
    (
      ?auto_77069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77068 ?auto_77069 ) ( ON-TABLE ?auto_77064 ) ( not ( = ?auto_77064 ?auto_77065 ) ) ( not ( = ?auto_77064 ?auto_77066 ) ) ( not ( = ?auto_77064 ?auto_77067 ) ) ( not ( = ?auto_77064 ?auto_77068 ) ) ( not ( = ?auto_77064 ?auto_77069 ) ) ( not ( = ?auto_77065 ?auto_77066 ) ) ( not ( = ?auto_77065 ?auto_77067 ) ) ( not ( = ?auto_77065 ?auto_77068 ) ) ( not ( = ?auto_77065 ?auto_77069 ) ) ( not ( = ?auto_77066 ?auto_77067 ) ) ( not ( = ?auto_77066 ?auto_77068 ) ) ( not ( = ?auto_77066 ?auto_77069 ) ) ( not ( = ?auto_77067 ?auto_77068 ) ) ( not ( = ?auto_77067 ?auto_77069 ) ) ( not ( = ?auto_77068 ?auto_77069 ) ) ( ON ?auto_77067 ?auto_77068 ) ( ON ?auto_77066 ?auto_77067 ) ( CLEAR ?auto_77064 ) ( ON ?auto_77065 ?auto_77066 ) ( CLEAR ?auto_77065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77064 ?auto_77065 )
      ( MAKE-5PILE ?auto_77064 ?auto_77065 ?auto_77066 ?auto_77067 ?auto_77068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77075 - BLOCK
      ?auto_77076 - BLOCK
      ?auto_77077 - BLOCK
      ?auto_77078 - BLOCK
      ?auto_77079 - BLOCK
    )
    :vars
    (
      ?auto_77080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77079 ?auto_77080 ) ( not ( = ?auto_77075 ?auto_77076 ) ) ( not ( = ?auto_77075 ?auto_77077 ) ) ( not ( = ?auto_77075 ?auto_77078 ) ) ( not ( = ?auto_77075 ?auto_77079 ) ) ( not ( = ?auto_77075 ?auto_77080 ) ) ( not ( = ?auto_77076 ?auto_77077 ) ) ( not ( = ?auto_77076 ?auto_77078 ) ) ( not ( = ?auto_77076 ?auto_77079 ) ) ( not ( = ?auto_77076 ?auto_77080 ) ) ( not ( = ?auto_77077 ?auto_77078 ) ) ( not ( = ?auto_77077 ?auto_77079 ) ) ( not ( = ?auto_77077 ?auto_77080 ) ) ( not ( = ?auto_77078 ?auto_77079 ) ) ( not ( = ?auto_77078 ?auto_77080 ) ) ( not ( = ?auto_77079 ?auto_77080 ) ) ( ON ?auto_77078 ?auto_77079 ) ( ON ?auto_77077 ?auto_77078 ) ( ON ?auto_77076 ?auto_77077 ) ( ON ?auto_77075 ?auto_77076 ) ( CLEAR ?auto_77075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77075 )
      ( MAKE-5PILE ?auto_77075 ?auto_77076 ?auto_77077 ?auto_77078 ?auto_77079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77086 - BLOCK
      ?auto_77087 - BLOCK
      ?auto_77088 - BLOCK
      ?auto_77089 - BLOCK
      ?auto_77090 - BLOCK
    )
    :vars
    (
      ?auto_77091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77090 ?auto_77091 ) ( not ( = ?auto_77086 ?auto_77087 ) ) ( not ( = ?auto_77086 ?auto_77088 ) ) ( not ( = ?auto_77086 ?auto_77089 ) ) ( not ( = ?auto_77086 ?auto_77090 ) ) ( not ( = ?auto_77086 ?auto_77091 ) ) ( not ( = ?auto_77087 ?auto_77088 ) ) ( not ( = ?auto_77087 ?auto_77089 ) ) ( not ( = ?auto_77087 ?auto_77090 ) ) ( not ( = ?auto_77087 ?auto_77091 ) ) ( not ( = ?auto_77088 ?auto_77089 ) ) ( not ( = ?auto_77088 ?auto_77090 ) ) ( not ( = ?auto_77088 ?auto_77091 ) ) ( not ( = ?auto_77089 ?auto_77090 ) ) ( not ( = ?auto_77089 ?auto_77091 ) ) ( not ( = ?auto_77090 ?auto_77091 ) ) ( ON ?auto_77089 ?auto_77090 ) ( ON ?auto_77088 ?auto_77089 ) ( ON ?auto_77087 ?auto_77088 ) ( ON ?auto_77086 ?auto_77087 ) ( CLEAR ?auto_77086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77086 )
      ( MAKE-5PILE ?auto_77086 ?auto_77087 ?auto_77088 ?auto_77089 ?auto_77090 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77098 - BLOCK
      ?auto_77099 - BLOCK
      ?auto_77100 - BLOCK
      ?auto_77101 - BLOCK
      ?auto_77102 - BLOCK
      ?auto_77103 - BLOCK
    )
    :vars
    (
      ?auto_77104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77102 ) ( ON ?auto_77103 ?auto_77104 ) ( CLEAR ?auto_77103 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77098 ) ( ON ?auto_77099 ?auto_77098 ) ( ON ?auto_77100 ?auto_77099 ) ( ON ?auto_77101 ?auto_77100 ) ( ON ?auto_77102 ?auto_77101 ) ( not ( = ?auto_77098 ?auto_77099 ) ) ( not ( = ?auto_77098 ?auto_77100 ) ) ( not ( = ?auto_77098 ?auto_77101 ) ) ( not ( = ?auto_77098 ?auto_77102 ) ) ( not ( = ?auto_77098 ?auto_77103 ) ) ( not ( = ?auto_77098 ?auto_77104 ) ) ( not ( = ?auto_77099 ?auto_77100 ) ) ( not ( = ?auto_77099 ?auto_77101 ) ) ( not ( = ?auto_77099 ?auto_77102 ) ) ( not ( = ?auto_77099 ?auto_77103 ) ) ( not ( = ?auto_77099 ?auto_77104 ) ) ( not ( = ?auto_77100 ?auto_77101 ) ) ( not ( = ?auto_77100 ?auto_77102 ) ) ( not ( = ?auto_77100 ?auto_77103 ) ) ( not ( = ?auto_77100 ?auto_77104 ) ) ( not ( = ?auto_77101 ?auto_77102 ) ) ( not ( = ?auto_77101 ?auto_77103 ) ) ( not ( = ?auto_77101 ?auto_77104 ) ) ( not ( = ?auto_77102 ?auto_77103 ) ) ( not ( = ?auto_77102 ?auto_77104 ) ) ( not ( = ?auto_77103 ?auto_77104 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77103 ?auto_77104 )
      ( !STACK ?auto_77103 ?auto_77102 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77111 - BLOCK
      ?auto_77112 - BLOCK
      ?auto_77113 - BLOCK
      ?auto_77114 - BLOCK
      ?auto_77115 - BLOCK
      ?auto_77116 - BLOCK
    )
    :vars
    (
      ?auto_77117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77115 ) ( ON ?auto_77116 ?auto_77117 ) ( CLEAR ?auto_77116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77111 ) ( ON ?auto_77112 ?auto_77111 ) ( ON ?auto_77113 ?auto_77112 ) ( ON ?auto_77114 ?auto_77113 ) ( ON ?auto_77115 ?auto_77114 ) ( not ( = ?auto_77111 ?auto_77112 ) ) ( not ( = ?auto_77111 ?auto_77113 ) ) ( not ( = ?auto_77111 ?auto_77114 ) ) ( not ( = ?auto_77111 ?auto_77115 ) ) ( not ( = ?auto_77111 ?auto_77116 ) ) ( not ( = ?auto_77111 ?auto_77117 ) ) ( not ( = ?auto_77112 ?auto_77113 ) ) ( not ( = ?auto_77112 ?auto_77114 ) ) ( not ( = ?auto_77112 ?auto_77115 ) ) ( not ( = ?auto_77112 ?auto_77116 ) ) ( not ( = ?auto_77112 ?auto_77117 ) ) ( not ( = ?auto_77113 ?auto_77114 ) ) ( not ( = ?auto_77113 ?auto_77115 ) ) ( not ( = ?auto_77113 ?auto_77116 ) ) ( not ( = ?auto_77113 ?auto_77117 ) ) ( not ( = ?auto_77114 ?auto_77115 ) ) ( not ( = ?auto_77114 ?auto_77116 ) ) ( not ( = ?auto_77114 ?auto_77117 ) ) ( not ( = ?auto_77115 ?auto_77116 ) ) ( not ( = ?auto_77115 ?auto_77117 ) ) ( not ( = ?auto_77116 ?auto_77117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77116 ?auto_77117 )
      ( !STACK ?auto_77116 ?auto_77115 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77124 - BLOCK
      ?auto_77125 - BLOCK
      ?auto_77126 - BLOCK
      ?auto_77127 - BLOCK
      ?auto_77128 - BLOCK
      ?auto_77129 - BLOCK
    )
    :vars
    (
      ?auto_77130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77129 ?auto_77130 ) ( ON-TABLE ?auto_77124 ) ( ON ?auto_77125 ?auto_77124 ) ( ON ?auto_77126 ?auto_77125 ) ( ON ?auto_77127 ?auto_77126 ) ( not ( = ?auto_77124 ?auto_77125 ) ) ( not ( = ?auto_77124 ?auto_77126 ) ) ( not ( = ?auto_77124 ?auto_77127 ) ) ( not ( = ?auto_77124 ?auto_77128 ) ) ( not ( = ?auto_77124 ?auto_77129 ) ) ( not ( = ?auto_77124 ?auto_77130 ) ) ( not ( = ?auto_77125 ?auto_77126 ) ) ( not ( = ?auto_77125 ?auto_77127 ) ) ( not ( = ?auto_77125 ?auto_77128 ) ) ( not ( = ?auto_77125 ?auto_77129 ) ) ( not ( = ?auto_77125 ?auto_77130 ) ) ( not ( = ?auto_77126 ?auto_77127 ) ) ( not ( = ?auto_77126 ?auto_77128 ) ) ( not ( = ?auto_77126 ?auto_77129 ) ) ( not ( = ?auto_77126 ?auto_77130 ) ) ( not ( = ?auto_77127 ?auto_77128 ) ) ( not ( = ?auto_77127 ?auto_77129 ) ) ( not ( = ?auto_77127 ?auto_77130 ) ) ( not ( = ?auto_77128 ?auto_77129 ) ) ( not ( = ?auto_77128 ?auto_77130 ) ) ( not ( = ?auto_77129 ?auto_77130 ) ) ( CLEAR ?auto_77127 ) ( ON ?auto_77128 ?auto_77129 ) ( CLEAR ?auto_77128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77124 ?auto_77125 ?auto_77126 ?auto_77127 ?auto_77128 )
      ( MAKE-6PILE ?auto_77124 ?auto_77125 ?auto_77126 ?auto_77127 ?auto_77128 ?auto_77129 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77137 - BLOCK
      ?auto_77138 - BLOCK
      ?auto_77139 - BLOCK
      ?auto_77140 - BLOCK
      ?auto_77141 - BLOCK
      ?auto_77142 - BLOCK
    )
    :vars
    (
      ?auto_77143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77142 ?auto_77143 ) ( ON-TABLE ?auto_77137 ) ( ON ?auto_77138 ?auto_77137 ) ( ON ?auto_77139 ?auto_77138 ) ( ON ?auto_77140 ?auto_77139 ) ( not ( = ?auto_77137 ?auto_77138 ) ) ( not ( = ?auto_77137 ?auto_77139 ) ) ( not ( = ?auto_77137 ?auto_77140 ) ) ( not ( = ?auto_77137 ?auto_77141 ) ) ( not ( = ?auto_77137 ?auto_77142 ) ) ( not ( = ?auto_77137 ?auto_77143 ) ) ( not ( = ?auto_77138 ?auto_77139 ) ) ( not ( = ?auto_77138 ?auto_77140 ) ) ( not ( = ?auto_77138 ?auto_77141 ) ) ( not ( = ?auto_77138 ?auto_77142 ) ) ( not ( = ?auto_77138 ?auto_77143 ) ) ( not ( = ?auto_77139 ?auto_77140 ) ) ( not ( = ?auto_77139 ?auto_77141 ) ) ( not ( = ?auto_77139 ?auto_77142 ) ) ( not ( = ?auto_77139 ?auto_77143 ) ) ( not ( = ?auto_77140 ?auto_77141 ) ) ( not ( = ?auto_77140 ?auto_77142 ) ) ( not ( = ?auto_77140 ?auto_77143 ) ) ( not ( = ?auto_77141 ?auto_77142 ) ) ( not ( = ?auto_77141 ?auto_77143 ) ) ( not ( = ?auto_77142 ?auto_77143 ) ) ( CLEAR ?auto_77140 ) ( ON ?auto_77141 ?auto_77142 ) ( CLEAR ?auto_77141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77137 ?auto_77138 ?auto_77139 ?auto_77140 ?auto_77141 )
      ( MAKE-6PILE ?auto_77137 ?auto_77138 ?auto_77139 ?auto_77140 ?auto_77141 ?auto_77142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77150 - BLOCK
      ?auto_77151 - BLOCK
      ?auto_77152 - BLOCK
      ?auto_77153 - BLOCK
      ?auto_77154 - BLOCK
      ?auto_77155 - BLOCK
    )
    :vars
    (
      ?auto_77156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77155 ?auto_77156 ) ( ON-TABLE ?auto_77150 ) ( ON ?auto_77151 ?auto_77150 ) ( ON ?auto_77152 ?auto_77151 ) ( not ( = ?auto_77150 ?auto_77151 ) ) ( not ( = ?auto_77150 ?auto_77152 ) ) ( not ( = ?auto_77150 ?auto_77153 ) ) ( not ( = ?auto_77150 ?auto_77154 ) ) ( not ( = ?auto_77150 ?auto_77155 ) ) ( not ( = ?auto_77150 ?auto_77156 ) ) ( not ( = ?auto_77151 ?auto_77152 ) ) ( not ( = ?auto_77151 ?auto_77153 ) ) ( not ( = ?auto_77151 ?auto_77154 ) ) ( not ( = ?auto_77151 ?auto_77155 ) ) ( not ( = ?auto_77151 ?auto_77156 ) ) ( not ( = ?auto_77152 ?auto_77153 ) ) ( not ( = ?auto_77152 ?auto_77154 ) ) ( not ( = ?auto_77152 ?auto_77155 ) ) ( not ( = ?auto_77152 ?auto_77156 ) ) ( not ( = ?auto_77153 ?auto_77154 ) ) ( not ( = ?auto_77153 ?auto_77155 ) ) ( not ( = ?auto_77153 ?auto_77156 ) ) ( not ( = ?auto_77154 ?auto_77155 ) ) ( not ( = ?auto_77154 ?auto_77156 ) ) ( not ( = ?auto_77155 ?auto_77156 ) ) ( ON ?auto_77154 ?auto_77155 ) ( CLEAR ?auto_77152 ) ( ON ?auto_77153 ?auto_77154 ) ( CLEAR ?auto_77153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77150 ?auto_77151 ?auto_77152 ?auto_77153 )
      ( MAKE-6PILE ?auto_77150 ?auto_77151 ?auto_77152 ?auto_77153 ?auto_77154 ?auto_77155 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77163 - BLOCK
      ?auto_77164 - BLOCK
      ?auto_77165 - BLOCK
      ?auto_77166 - BLOCK
      ?auto_77167 - BLOCK
      ?auto_77168 - BLOCK
    )
    :vars
    (
      ?auto_77169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77168 ?auto_77169 ) ( ON-TABLE ?auto_77163 ) ( ON ?auto_77164 ?auto_77163 ) ( ON ?auto_77165 ?auto_77164 ) ( not ( = ?auto_77163 ?auto_77164 ) ) ( not ( = ?auto_77163 ?auto_77165 ) ) ( not ( = ?auto_77163 ?auto_77166 ) ) ( not ( = ?auto_77163 ?auto_77167 ) ) ( not ( = ?auto_77163 ?auto_77168 ) ) ( not ( = ?auto_77163 ?auto_77169 ) ) ( not ( = ?auto_77164 ?auto_77165 ) ) ( not ( = ?auto_77164 ?auto_77166 ) ) ( not ( = ?auto_77164 ?auto_77167 ) ) ( not ( = ?auto_77164 ?auto_77168 ) ) ( not ( = ?auto_77164 ?auto_77169 ) ) ( not ( = ?auto_77165 ?auto_77166 ) ) ( not ( = ?auto_77165 ?auto_77167 ) ) ( not ( = ?auto_77165 ?auto_77168 ) ) ( not ( = ?auto_77165 ?auto_77169 ) ) ( not ( = ?auto_77166 ?auto_77167 ) ) ( not ( = ?auto_77166 ?auto_77168 ) ) ( not ( = ?auto_77166 ?auto_77169 ) ) ( not ( = ?auto_77167 ?auto_77168 ) ) ( not ( = ?auto_77167 ?auto_77169 ) ) ( not ( = ?auto_77168 ?auto_77169 ) ) ( ON ?auto_77167 ?auto_77168 ) ( CLEAR ?auto_77165 ) ( ON ?auto_77166 ?auto_77167 ) ( CLEAR ?auto_77166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77163 ?auto_77164 ?auto_77165 ?auto_77166 )
      ( MAKE-6PILE ?auto_77163 ?auto_77164 ?auto_77165 ?auto_77166 ?auto_77167 ?auto_77168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77176 - BLOCK
      ?auto_77177 - BLOCK
      ?auto_77178 - BLOCK
      ?auto_77179 - BLOCK
      ?auto_77180 - BLOCK
      ?auto_77181 - BLOCK
    )
    :vars
    (
      ?auto_77182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77181 ?auto_77182 ) ( ON-TABLE ?auto_77176 ) ( ON ?auto_77177 ?auto_77176 ) ( not ( = ?auto_77176 ?auto_77177 ) ) ( not ( = ?auto_77176 ?auto_77178 ) ) ( not ( = ?auto_77176 ?auto_77179 ) ) ( not ( = ?auto_77176 ?auto_77180 ) ) ( not ( = ?auto_77176 ?auto_77181 ) ) ( not ( = ?auto_77176 ?auto_77182 ) ) ( not ( = ?auto_77177 ?auto_77178 ) ) ( not ( = ?auto_77177 ?auto_77179 ) ) ( not ( = ?auto_77177 ?auto_77180 ) ) ( not ( = ?auto_77177 ?auto_77181 ) ) ( not ( = ?auto_77177 ?auto_77182 ) ) ( not ( = ?auto_77178 ?auto_77179 ) ) ( not ( = ?auto_77178 ?auto_77180 ) ) ( not ( = ?auto_77178 ?auto_77181 ) ) ( not ( = ?auto_77178 ?auto_77182 ) ) ( not ( = ?auto_77179 ?auto_77180 ) ) ( not ( = ?auto_77179 ?auto_77181 ) ) ( not ( = ?auto_77179 ?auto_77182 ) ) ( not ( = ?auto_77180 ?auto_77181 ) ) ( not ( = ?auto_77180 ?auto_77182 ) ) ( not ( = ?auto_77181 ?auto_77182 ) ) ( ON ?auto_77180 ?auto_77181 ) ( ON ?auto_77179 ?auto_77180 ) ( CLEAR ?auto_77177 ) ( ON ?auto_77178 ?auto_77179 ) ( CLEAR ?auto_77178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77176 ?auto_77177 ?auto_77178 )
      ( MAKE-6PILE ?auto_77176 ?auto_77177 ?auto_77178 ?auto_77179 ?auto_77180 ?auto_77181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77189 - BLOCK
      ?auto_77190 - BLOCK
      ?auto_77191 - BLOCK
      ?auto_77192 - BLOCK
      ?auto_77193 - BLOCK
      ?auto_77194 - BLOCK
    )
    :vars
    (
      ?auto_77195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77194 ?auto_77195 ) ( ON-TABLE ?auto_77189 ) ( ON ?auto_77190 ?auto_77189 ) ( not ( = ?auto_77189 ?auto_77190 ) ) ( not ( = ?auto_77189 ?auto_77191 ) ) ( not ( = ?auto_77189 ?auto_77192 ) ) ( not ( = ?auto_77189 ?auto_77193 ) ) ( not ( = ?auto_77189 ?auto_77194 ) ) ( not ( = ?auto_77189 ?auto_77195 ) ) ( not ( = ?auto_77190 ?auto_77191 ) ) ( not ( = ?auto_77190 ?auto_77192 ) ) ( not ( = ?auto_77190 ?auto_77193 ) ) ( not ( = ?auto_77190 ?auto_77194 ) ) ( not ( = ?auto_77190 ?auto_77195 ) ) ( not ( = ?auto_77191 ?auto_77192 ) ) ( not ( = ?auto_77191 ?auto_77193 ) ) ( not ( = ?auto_77191 ?auto_77194 ) ) ( not ( = ?auto_77191 ?auto_77195 ) ) ( not ( = ?auto_77192 ?auto_77193 ) ) ( not ( = ?auto_77192 ?auto_77194 ) ) ( not ( = ?auto_77192 ?auto_77195 ) ) ( not ( = ?auto_77193 ?auto_77194 ) ) ( not ( = ?auto_77193 ?auto_77195 ) ) ( not ( = ?auto_77194 ?auto_77195 ) ) ( ON ?auto_77193 ?auto_77194 ) ( ON ?auto_77192 ?auto_77193 ) ( CLEAR ?auto_77190 ) ( ON ?auto_77191 ?auto_77192 ) ( CLEAR ?auto_77191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77189 ?auto_77190 ?auto_77191 )
      ( MAKE-6PILE ?auto_77189 ?auto_77190 ?auto_77191 ?auto_77192 ?auto_77193 ?auto_77194 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77202 - BLOCK
      ?auto_77203 - BLOCK
      ?auto_77204 - BLOCK
      ?auto_77205 - BLOCK
      ?auto_77206 - BLOCK
      ?auto_77207 - BLOCK
    )
    :vars
    (
      ?auto_77208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77207 ?auto_77208 ) ( ON-TABLE ?auto_77202 ) ( not ( = ?auto_77202 ?auto_77203 ) ) ( not ( = ?auto_77202 ?auto_77204 ) ) ( not ( = ?auto_77202 ?auto_77205 ) ) ( not ( = ?auto_77202 ?auto_77206 ) ) ( not ( = ?auto_77202 ?auto_77207 ) ) ( not ( = ?auto_77202 ?auto_77208 ) ) ( not ( = ?auto_77203 ?auto_77204 ) ) ( not ( = ?auto_77203 ?auto_77205 ) ) ( not ( = ?auto_77203 ?auto_77206 ) ) ( not ( = ?auto_77203 ?auto_77207 ) ) ( not ( = ?auto_77203 ?auto_77208 ) ) ( not ( = ?auto_77204 ?auto_77205 ) ) ( not ( = ?auto_77204 ?auto_77206 ) ) ( not ( = ?auto_77204 ?auto_77207 ) ) ( not ( = ?auto_77204 ?auto_77208 ) ) ( not ( = ?auto_77205 ?auto_77206 ) ) ( not ( = ?auto_77205 ?auto_77207 ) ) ( not ( = ?auto_77205 ?auto_77208 ) ) ( not ( = ?auto_77206 ?auto_77207 ) ) ( not ( = ?auto_77206 ?auto_77208 ) ) ( not ( = ?auto_77207 ?auto_77208 ) ) ( ON ?auto_77206 ?auto_77207 ) ( ON ?auto_77205 ?auto_77206 ) ( ON ?auto_77204 ?auto_77205 ) ( CLEAR ?auto_77202 ) ( ON ?auto_77203 ?auto_77204 ) ( CLEAR ?auto_77203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77202 ?auto_77203 )
      ( MAKE-6PILE ?auto_77202 ?auto_77203 ?auto_77204 ?auto_77205 ?auto_77206 ?auto_77207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77215 - BLOCK
      ?auto_77216 - BLOCK
      ?auto_77217 - BLOCK
      ?auto_77218 - BLOCK
      ?auto_77219 - BLOCK
      ?auto_77220 - BLOCK
    )
    :vars
    (
      ?auto_77221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77220 ?auto_77221 ) ( ON-TABLE ?auto_77215 ) ( not ( = ?auto_77215 ?auto_77216 ) ) ( not ( = ?auto_77215 ?auto_77217 ) ) ( not ( = ?auto_77215 ?auto_77218 ) ) ( not ( = ?auto_77215 ?auto_77219 ) ) ( not ( = ?auto_77215 ?auto_77220 ) ) ( not ( = ?auto_77215 ?auto_77221 ) ) ( not ( = ?auto_77216 ?auto_77217 ) ) ( not ( = ?auto_77216 ?auto_77218 ) ) ( not ( = ?auto_77216 ?auto_77219 ) ) ( not ( = ?auto_77216 ?auto_77220 ) ) ( not ( = ?auto_77216 ?auto_77221 ) ) ( not ( = ?auto_77217 ?auto_77218 ) ) ( not ( = ?auto_77217 ?auto_77219 ) ) ( not ( = ?auto_77217 ?auto_77220 ) ) ( not ( = ?auto_77217 ?auto_77221 ) ) ( not ( = ?auto_77218 ?auto_77219 ) ) ( not ( = ?auto_77218 ?auto_77220 ) ) ( not ( = ?auto_77218 ?auto_77221 ) ) ( not ( = ?auto_77219 ?auto_77220 ) ) ( not ( = ?auto_77219 ?auto_77221 ) ) ( not ( = ?auto_77220 ?auto_77221 ) ) ( ON ?auto_77219 ?auto_77220 ) ( ON ?auto_77218 ?auto_77219 ) ( ON ?auto_77217 ?auto_77218 ) ( CLEAR ?auto_77215 ) ( ON ?auto_77216 ?auto_77217 ) ( CLEAR ?auto_77216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77215 ?auto_77216 )
      ( MAKE-6PILE ?auto_77215 ?auto_77216 ?auto_77217 ?auto_77218 ?auto_77219 ?auto_77220 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77228 - BLOCK
      ?auto_77229 - BLOCK
      ?auto_77230 - BLOCK
      ?auto_77231 - BLOCK
      ?auto_77232 - BLOCK
      ?auto_77233 - BLOCK
    )
    :vars
    (
      ?auto_77234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77233 ?auto_77234 ) ( not ( = ?auto_77228 ?auto_77229 ) ) ( not ( = ?auto_77228 ?auto_77230 ) ) ( not ( = ?auto_77228 ?auto_77231 ) ) ( not ( = ?auto_77228 ?auto_77232 ) ) ( not ( = ?auto_77228 ?auto_77233 ) ) ( not ( = ?auto_77228 ?auto_77234 ) ) ( not ( = ?auto_77229 ?auto_77230 ) ) ( not ( = ?auto_77229 ?auto_77231 ) ) ( not ( = ?auto_77229 ?auto_77232 ) ) ( not ( = ?auto_77229 ?auto_77233 ) ) ( not ( = ?auto_77229 ?auto_77234 ) ) ( not ( = ?auto_77230 ?auto_77231 ) ) ( not ( = ?auto_77230 ?auto_77232 ) ) ( not ( = ?auto_77230 ?auto_77233 ) ) ( not ( = ?auto_77230 ?auto_77234 ) ) ( not ( = ?auto_77231 ?auto_77232 ) ) ( not ( = ?auto_77231 ?auto_77233 ) ) ( not ( = ?auto_77231 ?auto_77234 ) ) ( not ( = ?auto_77232 ?auto_77233 ) ) ( not ( = ?auto_77232 ?auto_77234 ) ) ( not ( = ?auto_77233 ?auto_77234 ) ) ( ON ?auto_77232 ?auto_77233 ) ( ON ?auto_77231 ?auto_77232 ) ( ON ?auto_77230 ?auto_77231 ) ( ON ?auto_77229 ?auto_77230 ) ( ON ?auto_77228 ?auto_77229 ) ( CLEAR ?auto_77228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77228 )
      ( MAKE-6PILE ?auto_77228 ?auto_77229 ?auto_77230 ?auto_77231 ?auto_77232 ?auto_77233 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_77241 - BLOCK
      ?auto_77242 - BLOCK
      ?auto_77243 - BLOCK
      ?auto_77244 - BLOCK
      ?auto_77245 - BLOCK
      ?auto_77246 - BLOCK
    )
    :vars
    (
      ?auto_77247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77246 ?auto_77247 ) ( not ( = ?auto_77241 ?auto_77242 ) ) ( not ( = ?auto_77241 ?auto_77243 ) ) ( not ( = ?auto_77241 ?auto_77244 ) ) ( not ( = ?auto_77241 ?auto_77245 ) ) ( not ( = ?auto_77241 ?auto_77246 ) ) ( not ( = ?auto_77241 ?auto_77247 ) ) ( not ( = ?auto_77242 ?auto_77243 ) ) ( not ( = ?auto_77242 ?auto_77244 ) ) ( not ( = ?auto_77242 ?auto_77245 ) ) ( not ( = ?auto_77242 ?auto_77246 ) ) ( not ( = ?auto_77242 ?auto_77247 ) ) ( not ( = ?auto_77243 ?auto_77244 ) ) ( not ( = ?auto_77243 ?auto_77245 ) ) ( not ( = ?auto_77243 ?auto_77246 ) ) ( not ( = ?auto_77243 ?auto_77247 ) ) ( not ( = ?auto_77244 ?auto_77245 ) ) ( not ( = ?auto_77244 ?auto_77246 ) ) ( not ( = ?auto_77244 ?auto_77247 ) ) ( not ( = ?auto_77245 ?auto_77246 ) ) ( not ( = ?auto_77245 ?auto_77247 ) ) ( not ( = ?auto_77246 ?auto_77247 ) ) ( ON ?auto_77245 ?auto_77246 ) ( ON ?auto_77244 ?auto_77245 ) ( ON ?auto_77243 ?auto_77244 ) ( ON ?auto_77242 ?auto_77243 ) ( ON ?auto_77241 ?auto_77242 ) ( CLEAR ?auto_77241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77241 )
      ( MAKE-6PILE ?auto_77241 ?auto_77242 ?auto_77243 ?auto_77244 ?auto_77245 ?auto_77246 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77255 - BLOCK
      ?auto_77256 - BLOCK
      ?auto_77257 - BLOCK
      ?auto_77258 - BLOCK
      ?auto_77259 - BLOCK
      ?auto_77260 - BLOCK
      ?auto_77261 - BLOCK
    )
    :vars
    (
      ?auto_77262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77260 ) ( ON ?auto_77261 ?auto_77262 ) ( CLEAR ?auto_77261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77255 ) ( ON ?auto_77256 ?auto_77255 ) ( ON ?auto_77257 ?auto_77256 ) ( ON ?auto_77258 ?auto_77257 ) ( ON ?auto_77259 ?auto_77258 ) ( ON ?auto_77260 ?auto_77259 ) ( not ( = ?auto_77255 ?auto_77256 ) ) ( not ( = ?auto_77255 ?auto_77257 ) ) ( not ( = ?auto_77255 ?auto_77258 ) ) ( not ( = ?auto_77255 ?auto_77259 ) ) ( not ( = ?auto_77255 ?auto_77260 ) ) ( not ( = ?auto_77255 ?auto_77261 ) ) ( not ( = ?auto_77255 ?auto_77262 ) ) ( not ( = ?auto_77256 ?auto_77257 ) ) ( not ( = ?auto_77256 ?auto_77258 ) ) ( not ( = ?auto_77256 ?auto_77259 ) ) ( not ( = ?auto_77256 ?auto_77260 ) ) ( not ( = ?auto_77256 ?auto_77261 ) ) ( not ( = ?auto_77256 ?auto_77262 ) ) ( not ( = ?auto_77257 ?auto_77258 ) ) ( not ( = ?auto_77257 ?auto_77259 ) ) ( not ( = ?auto_77257 ?auto_77260 ) ) ( not ( = ?auto_77257 ?auto_77261 ) ) ( not ( = ?auto_77257 ?auto_77262 ) ) ( not ( = ?auto_77258 ?auto_77259 ) ) ( not ( = ?auto_77258 ?auto_77260 ) ) ( not ( = ?auto_77258 ?auto_77261 ) ) ( not ( = ?auto_77258 ?auto_77262 ) ) ( not ( = ?auto_77259 ?auto_77260 ) ) ( not ( = ?auto_77259 ?auto_77261 ) ) ( not ( = ?auto_77259 ?auto_77262 ) ) ( not ( = ?auto_77260 ?auto_77261 ) ) ( not ( = ?auto_77260 ?auto_77262 ) ) ( not ( = ?auto_77261 ?auto_77262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77261 ?auto_77262 )
      ( !STACK ?auto_77261 ?auto_77260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77270 - BLOCK
      ?auto_77271 - BLOCK
      ?auto_77272 - BLOCK
      ?auto_77273 - BLOCK
      ?auto_77274 - BLOCK
      ?auto_77275 - BLOCK
      ?auto_77276 - BLOCK
    )
    :vars
    (
      ?auto_77277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77275 ) ( ON ?auto_77276 ?auto_77277 ) ( CLEAR ?auto_77276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77270 ) ( ON ?auto_77271 ?auto_77270 ) ( ON ?auto_77272 ?auto_77271 ) ( ON ?auto_77273 ?auto_77272 ) ( ON ?auto_77274 ?auto_77273 ) ( ON ?auto_77275 ?auto_77274 ) ( not ( = ?auto_77270 ?auto_77271 ) ) ( not ( = ?auto_77270 ?auto_77272 ) ) ( not ( = ?auto_77270 ?auto_77273 ) ) ( not ( = ?auto_77270 ?auto_77274 ) ) ( not ( = ?auto_77270 ?auto_77275 ) ) ( not ( = ?auto_77270 ?auto_77276 ) ) ( not ( = ?auto_77270 ?auto_77277 ) ) ( not ( = ?auto_77271 ?auto_77272 ) ) ( not ( = ?auto_77271 ?auto_77273 ) ) ( not ( = ?auto_77271 ?auto_77274 ) ) ( not ( = ?auto_77271 ?auto_77275 ) ) ( not ( = ?auto_77271 ?auto_77276 ) ) ( not ( = ?auto_77271 ?auto_77277 ) ) ( not ( = ?auto_77272 ?auto_77273 ) ) ( not ( = ?auto_77272 ?auto_77274 ) ) ( not ( = ?auto_77272 ?auto_77275 ) ) ( not ( = ?auto_77272 ?auto_77276 ) ) ( not ( = ?auto_77272 ?auto_77277 ) ) ( not ( = ?auto_77273 ?auto_77274 ) ) ( not ( = ?auto_77273 ?auto_77275 ) ) ( not ( = ?auto_77273 ?auto_77276 ) ) ( not ( = ?auto_77273 ?auto_77277 ) ) ( not ( = ?auto_77274 ?auto_77275 ) ) ( not ( = ?auto_77274 ?auto_77276 ) ) ( not ( = ?auto_77274 ?auto_77277 ) ) ( not ( = ?auto_77275 ?auto_77276 ) ) ( not ( = ?auto_77275 ?auto_77277 ) ) ( not ( = ?auto_77276 ?auto_77277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77276 ?auto_77277 )
      ( !STACK ?auto_77276 ?auto_77275 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77285 - BLOCK
      ?auto_77286 - BLOCK
      ?auto_77287 - BLOCK
      ?auto_77288 - BLOCK
      ?auto_77289 - BLOCK
      ?auto_77290 - BLOCK
      ?auto_77291 - BLOCK
    )
    :vars
    (
      ?auto_77292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77291 ?auto_77292 ) ( ON-TABLE ?auto_77285 ) ( ON ?auto_77286 ?auto_77285 ) ( ON ?auto_77287 ?auto_77286 ) ( ON ?auto_77288 ?auto_77287 ) ( ON ?auto_77289 ?auto_77288 ) ( not ( = ?auto_77285 ?auto_77286 ) ) ( not ( = ?auto_77285 ?auto_77287 ) ) ( not ( = ?auto_77285 ?auto_77288 ) ) ( not ( = ?auto_77285 ?auto_77289 ) ) ( not ( = ?auto_77285 ?auto_77290 ) ) ( not ( = ?auto_77285 ?auto_77291 ) ) ( not ( = ?auto_77285 ?auto_77292 ) ) ( not ( = ?auto_77286 ?auto_77287 ) ) ( not ( = ?auto_77286 ?auto_77288 ) ) ( not ( = ?auto_77286 ?auto_77289 ) ) ( not ( = ?auto_77286 ?auto_77290 ) ) ( not ( = ?auto_77286 ?auto_77291 ) ) ( not ( = ?auto_77286 ?auto_77292 ) ) ( not ( = ?auto_77287 ?auto_77288 ) ) ( not ( = ?auto_77287 ?auto_77289 ) ) ( not ( = ?auto_77287 ?auto_77290 ) ) ( not ( = ?auto_77287 ?auto_77291 ) ) ( not ( = ?auto_77287 ?auto_77292 ) ) ( not ( = ?auto_77288 ?auto_77289 ) ) ( not ( = ?auto_77288 ?auto_77290 ) ) ( not ( = ?auto_77288 ?auto_77291 ) ) ( not ( = ?auto_77288 ?auto_77292 ) ) ( not ( = ?auto_77289 ?auto_77290 ) ) ( not ( = ?auto_77289 ?auto_77291 ) ) ( not ( = ?auto_77289 ?auto_77292 ) ) ( not ( = ?auto_77290 ?auto_77291 ) ) ( not ( = ?auto_77290 ?auto_77292 ) ) ( not ( = ?auto_77291 ?auto_77292 ) ) ( CLEAR ?auto_77289 ) ( ON ?auto_77290 ?auto_77291 ) ( CLEAR ?auto_77290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77285 ?auto_77286 ?auto_77287 ?auto_77288 ?auto_77289 ?auto_77290 )
      ( MAKE-7PILE ?auto_77285 ?auto_77286 ?auto_77287 ?auto_77288 ?auto_77289 ?auto_77290 ?auto_77291 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77300 - BLOCK
      ?auto_77301 - BLOCK
      ?auto_77302 - BLOCK
      ?auto_77303 - BLOCK
      ?auto_77304 - BLOCK
      ?auto_77305 - BLOCK
      ?auto_77306 - BLOCK
    )
    :vars
    (
      ?auto_77307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77306 ?auto_77307 ) ( ON-TABLE ?auto_77300 ) ( ON ?auto_77301 ?auto_77300 ) ( ON ?auto_77302 ?auto_77301 ) ( ON ?auto_77303 ?auto_77302 ) ( ON ?auto_77304 ?auto_77303 ) ( not ( = ?auto_77300 ?auto_77301 ) ) ( not ( = ?auto_77300 ?auto_77302 ) ) ( not ( = ?auto_77300 ?auto_77303 ) ) ( not ( = ?auto_77300 ?auto_77304 ) ) ( not ( = ?auto_77300 ?auto_77305 ) ) ( not ( = ?auto_77300 ?auto_77306 ) ) ( not ( = ?auto_77300 ?auto_77307 ) ) ( not ( = ?auto_77301 ?auto_77302 ) ) ( not ( = ?auto_77301 ?auto_77303 ) ) ( not ( = ?auto_77301 ?auto_77304 ) ) ( not ( = ?auto_77301 ?auto_77305 ) ) ( not ( = ?auto_77301 ?auto_77306 ) ) ( not ( = ?auto_77301 ?auto_77307 ) ) ( not ( = ?auto_77302 ?auto_77303 ) ) ( not ( = ?auto_77302 ?auto_77304 ) ) ( not ( = ?auto_77302 ?auto_77305 ) ) ( not ( = ?auto_77302 ?auto_77306 ) ) ( not ( = ?auto_77302 ?auto_77307 ) ) ( not ( = ?auto_77303 ?auto_77304 ) ) ( not ( = ?auto_77303 ?auto_77305 ) ) ( not ( = ?auto_77303 ?auto_77306 ) ) ( not ( = ?auto_77303 ?auto_77307 ) ) ( not ( = ?auto_77304 ?auto_77305 ) ) ( not ( = ?auto_77304 ?auto_77306 ) ) ( not ( = ?auto_77304 ?auto_77307 ) ) ( not ( = ?auto_77305 ?auto_77306 ) ) ( not ( = ?auto_77305 ?auto_77307 ) ) ( not ( = ?auto_77306 ?auto_77307 ) ) ( CLEAR ?auto_77304 ) ( ON ?auto_77305 ?auto_77306 ) ( CLEAR ?auto_77305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77300 ?auto_77301 ?auto_77302 ?auto_77303 ?auto_77304 ?auto_77305 )
      ( MAKE-7PILE ?auto_77300 ?auto_77301 ?auto_77302 ?auto_77303 ?auto_77304 ?auto_77305 ?auto_77306 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77315 - BLOCK
      ?auto_77316 - BLOCK
      ?auto_77317 - BLOCK
      ?auto_77318 - BLOCK
      ?auto_77319 - BLOCK
      ?auto_77320 - BLOCK
      ?auto_77321 - BLOCK
    )
    :vars
    (
      ?auto_77322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77321 ?auto_77322 ) ( ON-TABLE ?auto_77315 ) ( ON ?auto_77316 ?auto_77315 ) ( ON ?auto_77317 ?auto_77316 ) ( ON ?auto_77318 ?auto_77317 ) ( not ( = ?auto_77315 ?auto_77316 ) ) ( not ( = ?auto_77315 ?auto_77317 ) ) ( not ( = ?auto_77315 ?auto_77318 ) ) ( not ( = ?auto_77315 ?auto_77319 ) ) ( not ( = ?auto_77315 ?auto_77320 ) ) ( not ( = ?auto_77315 ?auto_77321 ) ) ( not ( = ?auto_77315 ?auto_77322 ) ) ( not ( = ?auto_77316 ?auto_77317 ) ) ( not ( = ?auto_77316 ?auto_77318 ) ) ( not ( = ?auto_77316 ?auto_77319 ) ) ( not ( = ?auto_77316 ?auto_77320 ) ) ( not ( = ?auto_77316 ?auto_77321 ) ) ( not ( = ?auto_77316 ?auto_77322 ) ) ( not ( = ?auto_77317 ?auto_77318 ) ) ( not ( = ?auto_77317 ?auto_77319 ) ) ( not ( = ?auto_77317 ?auto_77320 ) ) ( not ( = ?auto_77317 ?auto_77321 ) ) ( not ( = ?auto_77317 ?auto_77322 ) ) ( not ( = ?auto_77318 ?auto_77319 ) ) ( not ( = ?auto_77318 ?auto_77320 ) ) ( not ( = ?auto_77318 ?auto_77321 ) ) ( not ( = ?auto_77318 ?auto_77322 ) ) ( not ( = ?auto_77319 ?auto_77320 ) ) ( not ( = ?auto_77319 ?auto_77321 ) ) ( not ( = ?auto_77319 ?auto_77322 ) ) ( not ( = ?auto_77320 ?auto_77321 ) ) ( not ( = ?auto_77320 ?auto_77322 ) ) ( not ( = ?auto_77321 ?auto_77322 ) ) ( ON ?auto_77320 ?auto_77321 ) ( CLEAR ?auto_77318 ) ( ON ?auto_77319 ?auto_77320 ) ( CLEAR ?auto_77319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77315 ?auto_77316 ?auto_77317 ?auto_77318 ?auto_77319 )
      ( MAKE-7PILE ?auto_77315 ?auto_77316 ?auto_77317 ?auto_77318 ?auto_77319 ?auto_77320 ?auto_77321 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77330 - BLOCK
      ?auto_77331 - BLOCK
      ?auto_77332 - BLOCK
      ?auto_77333 - BLOCK
      ?auto_77334 - BLOCK
      ?auto_77335 - BLOCK
      ?auto_77336 - BLOCK
    )
    :vars
    (
      ?auto_77337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77336 ?auto_77337 ) ( ON-TABLE ?auto_77330 ) ( ON ?auto_77331 ?auto_77330 ) ( ON ?auto_77332 ?auto_77331 ) ( ON ?auto_77333 ?auto_77332 ) ( not ( = ?auto_77330 ?auto_77331 ) ) ( not ( = ?auto_77330 ?auto_77332 ) ) ( not ( = ?auto_77330 ?auto_77333 ) ) ( not ( = ?auto_77330 ?auto_77334 ) ) ( not ( = ?auto_77330 ?auto_77335 ) ) ( not ( = ?auto_77330 ?auto_77336 ) ) ( not ( = ?auto_77330 ?auto_77337 ) ) ( not ( = ?auto_77331 ?auto_77332 ) ) ( not ( = ?auto_77331 ?auto_77333 ) ) ( not ( = ?auto_77331 ?auto_77334 ) ) ( not ( = ?auto_77331 ?auto_77335 ) ) ( not ( = ?auto_77331 ?auto_77336 ) ) ( not ( = ?auto_77331 ?auto_77337 ) ) ( not ( = ?auto_77332 ?auto_77333 ) ) ( not ( = ?auto_77332 ?auto_77334 ) ) ( not ( = ?auto_77332 ?auto_77335 ) ) ( not ( = ?auto_77332 ?auto_77336 ) ) ( not ( = ?auto_77332 ?auto_77337 ) ) ( not ( = ?auto_77333 ?auto_77334 ) ) ( not ( = ?auto_77333 ?auto_77335 ) ) ( not ( = ?auto_77333 ?auto_77336 ) ) ( not ( = ?auto_77333 ?auto_77337 ) ) ( not ( = ?auto_77334 ?auto_77335 ) ) ( not ( = ?auto_77334 ?auto_77336 ) ) ( not ( = ?auto_77334 ?auto_77337 ) ) ( not ( = ?auto_77335 ?auto_77336 ) ) ( not ( = ?auto_77335 ?auto_77337 ) ) ( not ( = ?auto_77336 ?auto_77337 ) ) ( ON ?auto_77335 ?auto_77336 ) ( CLEAR ?auto_77333 ) ( ON ?auto_77334 ?auto_77335 ) ( CLEAR ?auto_77334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77330 ?auto_77331 ?auto_77332 ?auto_77333 ?auto_77334 )
      ( MAKE-7PILE ?auto_77330 ?auto_77331 ?auto_77332 ?auto_77333 ?auto_77334 ?auto_77335 ?auto_77336 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77345 - BLOCK
      ?auto_77346 - BLOCK
      ?auto_77347 - BLOCK
      ?auto_77348 - BLOCK
      ?auto_77349 - BLOCK
      ?auto_77350 - BLOCK
      ?auto_77351 - BLOCK
    )
    :vars
    (
      ?auto_77352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77351 ?auto_77352 ) ( ON-TABLE ?auto_77345 ) ( ON ?auto_77346 ?auto_77345 ) ( ON ?auto_77347 ?auto_77346 ) ( not ( = ?auto_77345 ?auto_77346 ) ) ( not ( = ?auto_77345 ?auto_77347 ) ) ( not ( = ?auto_77345 ?auto_77348 ) ) ( not ( = ?auto_77345 ?auto_77349 ) ) ( not ( = ?auto_77345 ?auto_77350 ) ) ( not ( = ?auto_77345 ?auto_77351 ) ) ( not ( = ?auto_77345 ?auto_77352 ) ) ( not ( = ?auto_77346 ?auto_77347 ) ) ( not ( = ?auto_77346 ?auto_77348 ) ) ( not ( = ?auto_77346 ?auto_77349 ) ) ( not ( = ?auto_77346 ?auto_77350 ) ) ( not ( = ?auto_77346 ?auto_77351 ) ) ( not ( = ?auto_77346 ?auto_77352 ) ) ( not ( = ?auto_77347 ?auto_77348 ) ) ( not ( = ?auto_77347 ?auto_77349 ) ) ( not ( = ?auto_77347 ?auto_77350 ) ) ( not ( = ?auto_77347 ?auto_77351 ) ) ( not ( = ?auto_77347 ?auto_77352 ) ) ( not ( = ?auto_77348 ?auto_77349 ) ) ( not ( = ?auto_77348 ?auto_77350 ) ) ( not ( = ?auto_77348 ?auto_77351 ) ) ( not ( = ?auto_77348 ?auto_77352 ) ) ( not ( = ?auto_77349 ?auto_77350 ) ) ( not ( = ?auto_77349 ?auto_77351 ) ) ( not ( = ?auto_77349 ?auto_77352 ) ) ( not ( = ?auto_77350 ?auto_77351 ) ) ( not ( = ?auto_77350 ?auto_77352 ) ) ( not ( = ?auto_77351 ?auto_77352 ) ) ( ON ?auto_77350 ?auto_77351 ) ( ON ?auto_77349 ?auto_77350 ) ( CLEAR ?auto_77347 ) ( ON ?auto_77348 ?auto_77349 ) ( CLEAR ?auto_77348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77345 ?auto_77346 ?auto_77347 ?auto_77348 )
      ( MAKE-7PILE ?auto_77345 ?auto_77346 ?auto_77347 ?auto_77348 ?auto_77349 ?auto_77350 ?auto_77351 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77360 - BLOCK
      ?auto_77361 - BLOCK
      ?auto_77362 - BLOCK
      ?auto_77363 - BLOCK
      ?auto_77364 - BLOCK
      ?auto_77365 - BLOCK
      ?auto_77366 - BLOCK
    )
    :vars
    (
      ?auto_77367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77366 ?auto_77367 ) ( ON-TABLE ?auto_77360 ) ( ON ?auto_77361 ?auto_77360 ) ( ON ?auto_77362 ?auto_77361 ) ( not ( = ?auto_77360 ?auto_77361 ) ) ( not ( = ?auto_77360 ?auto_77362 ) ) ( not ( = ?auto_77360 ?auto_77363 ) ) ( not ( = ?auto_77360 ?auto_77364 ) ) ( not ( = ?auto_77360 ?auto_77365 ) ) ( not ( = ?auto_77360 ?auto_77366 ) ) ( not ( = ?auto_77360 ?auto_77367 ) ) ( not ( = ?auto_77361 ?auto_77362 ) ) ( not ( = ?auto_77361 ?auto_77363 ) ) ( not ( = ?auto_77361 ?auto_77364 ) ) ( not ( = ?auto_77361 ?auto_77365 ) ) ( not ( = ?auto_77361 ?auto_77366 ) ) ( not ( = ?auto_77361 ?auto_77367 ) ) ( not ( = ?auto_77362 ?auto_77363 ) ) ( not ( = ?auto_77362 ?auto_77364 ) ) ( not ( = ?auto_77362 ?auto_77365 ) ) ( not ( = ?auto_77362 ?auto_77366 ) ) ( not ( = ?auto_77362 ?auto_77367 ) ) ( not ( = ?auto_77363 ?auto_77364 ) ) ( not ( = ?auto_77363 ?auto_77365 ) ) ( not ( = ?auto_77363 ?auto_77366 ) ) ( not ( = ?auto_77363 ?auto_77367 ) ) ( not ( = ?auto_77364 ?auto_77365 ) ) ( not ( = ?auto_77364 ?auto_77366 ) ) ( not ( = ?auto_77364 ?auto_77367 ) ) ( not ( = ?auto_77365 ?auto_77366 ) ) ( not ( = ?auto_77365 ?auto_77367 ) ) ( not ( = ?auto_77366 ?auto_77367 ) ) ( ON ?auto_77365 ?auto_77366 ) ( ON ?auto_77364 ?auto_77365 ) ( CLEAR ?auto_77362 ) ( ON ?auto_77363 ?auto_77364 ) ( CLEAR ?auto_77363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77360 ?auto_77361 ?auto_77362 ?auto_77363 )
      ( MAKE-7PILE ?auto_77360 ?auto_77361 ?auto_77362 ?auto_77363 ?auto_77364 ?auto_77365 ?auto_77366 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77375 - BLOCK
      ?auto_77376 - BLOCK
      ?auto_77377 - BLOCK
      ?auto_77378 - BLOCK
      ?auto_77379 - BLOCK
      ?auto_77380 - BLOCK
      ?auto_77381 - BLOCK
    )
    :vars
    (
      ?auto_77382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77381 ?auto_77382 ) ( ON-TABLE ?auto_77375 ) ( ON ?auto_77376 ?auto_77375 ) ( not ( = ?auto_77375 ?auto_77376 ) ) ( not ( = ?auto_77375 ?auto_77377 ) ) ( not ( = ?auto_77375 ?auto_77378 ) ) ( not ( = ?auto_77375 ?auto_77379 ) ) ( not ( = ?auto_77375 ?auto_77380 ) ) ( not ( = ?auto_77375 ?auto_77381 ) ) ( not ( = ?auto_77375 ?auto_77382 ) ) ( not ( = ?auto_77376 ?auto_77377 ) ) ( not ( = ?auto_77376 ?auto_77378 ) ) ( not ( = ?auto_77376 ?auto_77379 ) ) ( not ( = ?auto_77376 ?auto_77380 ) ) ( not ( = ?auto_77376 ?auto_77381 ) ) ( not ( = ?auto_77376 ?auto_77382 ) ) ( not ( = ?auto_77377 ?auto_77378 ) ) ( not ( = ?auto_77377 ?auto_77379 ) ) ( not ( = ?auto_77377 ?auto_77380 ) ) ( not ( = ?auto_77377 ?auto_77381 ) ) ( not ( = ?auto_77377 ?auto_77382 ) ) ( not ( = ?auto_77378 ?auto_77379 ) ) ( not ( = ?auto_77378 ?auto_77380 ) ) ( not ( = ?auto_77378 ?auto_77381 ) ) ( not ( = ?auto_77378 ?auto_77382 ) ) ( not ( = ?auto_77379 ?auto_77380 ) ) ( not ( = ?auto_77379 ?auto_77381 ) ) ( not ( = ?auto_77379 ?auto_77382 ) ) ( not ( = ?auto_77380 ?auto_77381 ) ) ( not ( = ?auto_77380 ?auto_77382 ) ) ( not ( = ?auto_77381 ?auto_77382 ) ) ( ON ?auto_77380 ?auto_77381 ) ( ON ?auto_77379 ?auto_77380 ) ( ON ?auto_77378 ?auto_77379 ) ( CLEAR ?auto_77376 ) ( ON ?auto_77377 ?auto_77378 ) ( CLEAR ?auto_77377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77375 ?auto_77376 ?auto_77377 )
      ( MAKE-7PILE ?auto_77375 ?auto_77376 ?auto_77377 ?auto_77378 ?auto_77379 ?auto_77380 ?auto_77381 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77390 - BLOCK
      ?auto_77391 - BLOCK
      ?auto_77392 - BLOCK
      ?auto_77393 - BLOCK
      ?auto_77394 - BLOCK
      ?auto_77395 - BLOCK
      ?auto_77396 - BLOCK
    )
    :vars
    (
      ?auto_77397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77396 ?auto_77397 ) ( ON-TABLE ?auto_77390 ) ( ON ?auto_77391 ?auto_77390 ) ( not ( = ?auto_77390 ?auto_77391 ) ) ( not ( = ?auto_77390 ?auto_77392 ) ) ( not ( = ?auto_77390 ?auto_77393 ) ) ( not ( = ?auto_77390 ?auto_77394 ) ) ( not ( = ?auto_77390 ?auto_77395 ) ) ( not ( = ?auto_77390 ?auto_77396 ) ) ( not ( = ?auto_77390 ?auto_77397 ) ) ( not ( = ?auto_77391 ?auto_77392 ) ) ( not ( = ?auto_77391 ?auto_77393 ) ) ( not ( = ?auto_77391 ?auto_77394 ) ) ( not ( = ?auto_77391 ?auto_77395 ) ) ( not ( = ?auto_77391 ?auto_77396 ) ) ( not ( = ?auto_77391 ?auto_77397 ) ) ( not ( = ?auto_77392 ?auto_77393 ) ) ( not ( = ?auto_77392 ?auto_77394 ) ) ( not ( = ?auto_77392 ?auto_77395 ) ) ( not ( = ?auto_77392 ?auto_77396 ) ) ( not ( = ?auto_77392 ?auto_77397 ) ) ( not ( = ?auto_77393 ?auto_77394 ) ) ( not ( = ?auto_77393 ?auto_77395 ) ) ( not ( = ?auto_77393 ?auto_77396 ) ) ( not ( = ?auto_77393 ?auto_77397 ) ) ( not ( = ?auto_77394 ?auto_77395 ) ) ( not ( = ?auto_77394 ?auto_77396 ) ) ( not ( = ?auto_77394 ?auto_77397 ) ) ( not ( = ?auto_77395 ?auto_77396 ) ) ( not ( = ?auto_77395 ?auto_77397 ) ) ( not ( = ?auto_77396 ?auto_77397 ) ) ( ON ?auto_77395 ?auto_77396 ) ( ON ?auto_77394 ?auto_77395 ) ( ON ?auto_77393 ?auto_77394 ) ( CLEAR ?auto_77391 ) ( ON ?auto_77392 ?auto_77393 ) ( CLEAR ?auto_77392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77390 ?auto_77391 ?auto_77392 )
      ( MAKE-7PILE ?auto_77390 ?auto_77391 ?auto_77392 ?auto_77393 ?auto_77394 ?auto_77395 ?auto_77396 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77405 - BLOCK
      ?auto_77406 - BLOCK
      ?auto_77407 - BLOCK
      ?auto_77408 - BLOCK
      ?auto_77409 - BLOCK
      ?auto_77410 - BLOCK
      ?auto_77411 - BLOCK
    )
    :vars
    (
      ?auto_77412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77411 ?auto_77412 ) ( ON-TABLE ?auto_77405 ) ( not ( = ?auto_77405 ?auto_77406 ) ) ( not ( = ?auto_77405 ?auto_77407 ) ) ( not ( = ?auto_77405 ?auto_77408 ) ) ( not ( = ?auto_77405 ?auto_77409 ) ) ( not ( = ?auto_77405 ?auto_77410 ) ) ( not ( = ?auto_77405 ?auto_77411 ) ) ( not ( = ?auto_77405 ?auto_77412 ) ) ( not ( = ?auto_77406 ?auto_77407 ) ) ( not ( = ?auto_77406 ?auto_77408 ) ) ( not ( = ?auto_77406 ?auto_77409 ) ) ( not ( = ?auto_77406 ?auto_77410 ) ) ( not ( = ?auto_77406 ?auto_77411 ) ) ( not ( = ?auto_77406 ?auto_77412 ) ) ( not ( = ?auto_77407 ?auto_77408 ) ) ( not ( = ?auto_77407 ?auto_77409 ) ) ( not ( = ?auto_77407 ?auto_77410 ) ) ( not ( = ?auto_77407 ?auto_77411 ) ) ( not ( = ?auto_77407 ?auto_77412 ) ) ( not ( = ?auto_77408 ?auto_77409 ) ) ( not ( = ?auto_77408 ?auto_77410 ) ) ( not ( = ?auto_77408 ?auto_77411 ) ) ( not ( = ?auto_77408 ?auto_77412 ) ) ( not ( = ?auto_77409 ?auto_77410 ) ) ( not ( = ?auto_77409 ?auto_77411 ) ) ( not ( = ?auto_77409 ?auto_77412 ) ) ( not ( = ?auto_77410 ?auto_77411 ) ) ( not ( = ?auto_77410 ?auto_77412 ) ) ( not ( = ?auto_77411 ?auto_77412 ) ) ( ON ?auto_77410 ?auto_77411 ) ( ON ?auto_77409 ?auto_77410 ) ( ON ?auto_77408 ?auto_77409 ) ( ON ?auto_77407 ?auto_77408 ) ( CLEAR ?auto_77405 ) ( ON ?auto_77406 ?auto_77407 ) ( CLEAR ?auto_77406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77405 ?auto_77406 )
      ( MAKE-7PILE ?auto_77405 ?auto_77406 ?auto_77407 ?auto_77408 ?auto_77409 ?auto_77410 ?auto_77411 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77420 - BLOCK
      ?auto_77421 - BLOCK
      ?auto_77422 - BLOCK
      ?auto_77423 - BLOCK
      ?auto_77424 - BLOCK
      ?auto_77425 - BLOCK
      ?auto_77426 - BLOCK
    )
    :vars
    (
      ?auto_77427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77426 ?auto_77427 ) ( ON-TABLE ?auto_77420 ) ( not ( = ?auto_77420 ?auto_77421 ) ) ( not ( = ?auto_77420 ?auto_77422 ) ) ( not ( = ?auto_77420 ?auto_77423 ) ) ( not ( = ?auto_77420 ?auto_77424 ) ) ( not ( = ?auto_77420 ?auto_77425 ) ) ( not ( = ?auto_77420 ?auto_77426 ) ) ( not ( = ?auto_77420 ?auto_77427 ) ) ( not ( = ?auto_77421 ?auto_77422 ) ) ( not ( = ?auto_77421 ?auto_77423 ) ) ( not ( = ?auto_77421 ?auto_77424 ) ) ( not ( = ?auto_77421 ?auto_77425 ) ) ( not ( = ?auto_77421 ?auto_77426 ) ) ( not ( = ?auto_77421 ?auto_77427 ) ) ( not ( = ?auto_77422 ?auto_77423 ) ) ( not ( = ?auto_77422 ?auto_77424 ) ) ( not ( = ?auto_77422 ?auto_77425 ) ) ( not ( = ?auto_77422 ?auto_77426 ) ) ( not ( = ?auto_77422 ?auto_77427 ) ) ( not ( = ?auto_77423 ?auto_77424 ) ) ( not ( = ?auto_77423 ?auto_77425 ) ) ( not ( = ?auto_77423 ?auto_77426 ) ) ( not ( = ?auto_77423 ?auto_77427 ) ) ( not ( = ?auto_77424 ?auto_77425 ) ) ( not ( = ?auto_77424 ?auto_77426 ) ) ( not ( = ?auto_77424 ?auto_77427 ) ) ( not ( = ?auto_77425 ?auto_77426 ) ) ( not ( = ?auto_77425 ?auto_77427 ) ) ( not ( = ?auto_77426 ?auto_77427 ) ) ( ON ?auto_77425 ?auto_77426 ) ( ON ?auto_77424 ?auto_77425 ) ( ON ?auto_77423 ?auto_77424 ) ( ON ?auto_77422 ?auto_77423 ) ( CLEAR ?auto_77420 ) ( ON ?auto_77421 ?auto_77422 ) ( CLEAR ?auto_77421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77420 ?auto_77421 )
      ( MAKE-7PILE ?auto_77420 ?auto_77421 ?auto_77422 ?auto_77423 ?auto_77424 ?auto_77425 ?auto_77426 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77435 - BLOCK
      ?auto_77436 - BLOCK
      ?auto_77437 - BLOCK
      ?auto_77438 - BLOCK
      ?auto_77439 - BLOCK
      ?auto_77440 - BLOCK
      ?auto_77441 - BLOCK
    )
    :vars
    (
      ?auto_77442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77441 ?auto_77442 ) ( not ( = ?auto_77435 ?auto_77436 ) ) ( not ( = ?auto_77435 ?auto_77437 ) ) ( not ( = ?auto_77435 ?auto_77438 ) ) ( not ( = ?auto_77435 ?auto_77439 ) ) ( not ( = ?auto_77435 ?auto_77440 ) ) ( not ( = ?auto_77435 ?auto_77441 ) ) ( not ( = ?auto_77435 ?auto_77442 ) ) ( not ( = ?auto_77436 ?auto_77437 ) ) ( not ( = ?auto_77436 ?auto_77438 ) ) ( not ( = ?auto_77436 ?auto_77439 ) ) ( not ( = ?auto_77436 ?auto_77440 ) ) ( not ( = ?auto_77436 ?auto_77441 ) ) ( not ( = ?auto_77436 ?auto_77442 ) ) ( not ( = ?auto_77437 ?auto_77438 ) ) ( not ( = ?auto_77437 ?auto_77439 ) ) ( not ( = ?auto_77437 ?auto_77440 ) ) ( not ( = ?auto_77437 ?auto_77441 ) ) ( not ( = ?auto_77437 ?auto_77442 ) ) ( not ( = ?auto_77438 ?auto_77439 ) ) ( not ( = ?auto_77438 ?auto_77440 ) ) ( not ( = ?auto_77438 ?auto_77441 ) ) ( not ( = ?auto_77438 ?auto_77442 ) ) ( not ( = ?auto_77439 ?auto_77440 ) ) ( not ( = ?auto_77439 ?auto_77441 ) ) ( not ( = ?auto_77439 ?auto_77442 ) ) ( not ( = ?auto_77440 ?auto_77441 ) ) ( not ( = ?auto_77440 ?auto_77442 ) ) ( not ( = ?auto_77441 ?auto_77442 ) ) ( ON ?auto_77440 ?auto_77441 ) ( ON ?auto_77439 ?auto_77440 ) ( ON ?auto_77438 ?auto_77439 ) ( ON ?auto_77437 ?auto_77438 ) ( ON ?auto_77436 ?auto_77437 ) ( ON ?auto_77435 ?auto_77436 ) ( CLEAR ?auto_77435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77435 )
      ( MAKE-7PILE ?auto_77435 ?auto_77436 ?auto_77437 ?auto_77438 ?auto_77439 ?auto_77440 ?auto_77441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_77450 - BLOCK
      ?auto_77451 - BLOCK
      ?auto_77452 - BLOCK
      ?auto_77453 - BLOCK
      ?auto_77454 - BLOCK
      ?auto_77455 - BLOCK
      ?auto_77456 - BLOCK
    )
    :vars
    (
      ?auto_77457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77456 ?auto_77457 ) ( not ( = ?auto_77450 ?auto_77451 ) ) ( not ( = ?auto_77450 ?auto_77452 ) ) ( not ( = ?auto_77450 ?auto_77453 ) ) ( not ( = ?auto_77450 ?auto_77454 ) ) ( not ( = ?auto_77450 ?auto_77455 ) ) ( not ( = ?auto_77450 ?auto_77456 ) ) ( not ( = ?auto_77450 ?auto_77457 ) ) ( not ( = ?auto_77451 ?auto_77452 ) ) ( not ( = ?auto_77451 ?auto_77453 ) ) ( not ( = ?auto_77451 ?auto_77454 ) ) ( not ( = ?auto_77451 ?auto_77455 ) ) ( not ( = ?auto_77451 ?auto_77456 ) ) ( not ( = ?auto_77451 ?auto_77457 ) ) ( not ( = ?auto_77452 ?auto_77453 ) ) ( not ( = ?auto_77452 ?auto_77454 ) ) ( not ( = ?auto_77452 ?auto_77455 ) ) ( not ( = ?auto_77452 ?auto_77456 ) ) ( not ( = ?auto_77452 ?auto_77457 ) ) ( not ( = ?auto_77453 ?auto_77454 ) ) ( not ( = ?auto_77453 ?auto_77455 ) ) ( not ( = ?auto_77453 ?auto_77456 ) ) ( not ( = ?auto_77453 ?auto_77457 ) ) ( not ( = ?auto_77454 ?auto_77455 ) ) ( not ( = ?auto_77454 ?auto_77456 ) ) ( not ( = ?auto_77454 ?auto_77457 ) ) ( not ( = ?auto_77455 ?auto_77456 ) ) ( not ( = ?auto_77455 ?auto_77457 ) ) ( not ( = ?auto_77456 ?auto_77457 ) ) ( ON ?auto_77455 ?auto_77456 ) ( ON ?auto_77454 ?auto_77455 ) ( ON ?auto_77453 ?auto_77454 ) ( ON ?auto_77452 ?auto_77453 ) ( ON ?auto_77451 ?auto_77452 ) ( ON ?auto_77450 ?auto_77451 ) ( CLEAR ?auto_77450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77450 )
      ( MAKE-7PILE ?auto_77450 ?auto_77451 ?auto_77452 ?auto_77453 ?auto_77454 ?auto_77455 ?auto_77456 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77466 - BLOCK
      ?auto_77467 - BLOCK
      ?auto_77468 - BLOCK
      ?auto_77469 - BLOCK
      ?auto_77470 - BLOCK
      ?auto_77471 - BLOCK
      ?auto_77472 - BLOCK
      ?auto_77473 - BLOCK
    )
    :vars
    (
      ?auto_77474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77472 ) ( ON ?auto_77473 ?auto_77474 ) ( CLEAR ?auto_77473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77466 ) ( ON ?auto_77467 ?auto_77466 ) ( ON ?auto_77468 ?auto_77467 ) ( ON ?auto_77469 ?auto_77468 ) ( ON ?auto_77470 ?auto_77469 ) ( ON ?auto_77471 ?auto_77470 ) ( ON ?auto_77472 ?auto_77471 ) ( not ( = ?auto_77466 ?auto_77467 ) ) ( not ( = ?auto_77466 ?auto_77468 ) ) ( not ( = ?auto_77466 ?auto_77469 ) ) ( not ( = ?auto_77466 ?auto_77470 ) ) ( not ( = ?auto_77466 ?auto_77471 ) ) ( not ( = ?auto_77466 ?auto_77472 ) ) ( not ( = ?auto_77466 ?auto_77473 ) ) ( not ( = ?auto_77466 ?auto_77474 ) ) ( not ( = ?auto_77467 ?auto_77468 ) ) ( not ( = ?auto_77467 ?auto_77469 ) ) ( not ( = ?auto_77467 ?auto_77470 ) ) ( not ( = ?auto_77467 ?auto_77471 ) ) ( not ( = ?auto_77467 ?auto_77472 ) ) ( not ( = ?auto_77467 ?auto_77473 ) ) ( not ( = ?auto_77467 ?auto_77474 ) ) ( not ( = ?auto_77468 ?auto_77469 ) ) ( not ( = ?auto_77468 ?auto_77470 ) ) ( not ( = ?auto_77468 ?auto_77471 ) ) ( not ( = ?auto_77468 ?auto_77472 ) ) ( not ( = ?auto_77468 ?auto_77473 ) ) ( not ( = ?auto_77468 ?auto_77474 ) ) ( not ( = ?auto_77469 ?auto_77470 ) ) ( not ( = ?auto_77469 ?auto_77471 ) ) ( not ( = ?auto_77469 ?auto_77472 ) ) ( not ( = ?auto_77469 ?auto_77473 ) ) ( not ( = ?auto_77469 ?auto_77474 ) ) ( not ( = ?auto_77470 ?auto_77471 ) ) ( not ( = ?auto_77470 ?auto_77472 ) ) ( not ( = ?auto_77470 ?auto_77473 ) ) ( not ( = ?auto_77470 ?auto_77474 ) ) ( not ( = ?auto_77471 ?auto_77472 ) ) ( not ( = ?auto_77471 ?auto_77473 ) ) ( not ( = ?auto_77471 ?auto_77474 ) ) ( not ( = ?auto_77472 ?auto_77473 ) ) ( not ( = ?auto_77472 ?auto_77474 ) ) ( not ( = ?auto_77473 ?auto_77474 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77473 ?auto_77474 )
      ( !STACK ?auto_77473 ?auto_77472 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77483 - BLOCK
      ?auto_77484 - BLOCK
      ?auto_77485 - BLOCK
      ?auto_77486 - BLOCK
      ?auto_77487 - BLOCK
      ?auto_77488 - BLOCK
      ?auto_77489 - BLOCK
      ?auto_77490 - BLOCK
    )
    :vars
    (
      ?auto_77491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77489 ) ( ON ?auto_77490 ?auto_77491 ) ( CLEAR ?auto_77490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77483 ) ( ON ?auto_77484 ?auto_77483 ) ( ON ?auto_77485 ?auto_77484 ) ( ON ?auto_77486 ?auto_77485 ) ( ON ?auto_77487 ?auto_77486 ) ( ON ?auto_77488 ?auto_77487 ) ( ON ?auto_77489 ?auto_77488 ) ( not ( = ?auto_77483 ?auto_77484 ) ) ( not ( = ?auto_77483 ?auto_77485 ) ) ( not ( = ?auto_77483 ?auto_77486 ) ) ( not ( = ?auto_77483 ?auto_77487 ) ) ( not ( = ?auto_77483 ?auto_77488 ) ) ( not ( = ?auto_77483 ?auto_77489 ) ) ( not ( = ?auto_77483 ?auto_77490 ) ) ( not ( = ?auto_77483 ?auto_77491 ) ) ( not ( = ?auto_77484 ?auto_77485 ) ) ( not ( = ?auto_77484 ?auto_77486 ) ) ( not ( = ?auto_77484 ?auto_77487 ) ) ( not ( = ?auto_77484 ?auto_77488 ) ) ( not ( = ?auto_77484 ?auto_77489 ) ) ( not ( = ?auto_77484 ?auto_77490 ) ) ( not ( = ?auto_77484 ?auto_77491 ) ) ( not ( = ?auto_77485 ?auto_77486 ) ) ( not ( = ?auto_77485 ?auto_77487 ) ) ( not ( = ?auto_77485 ?auto_77488 ) ) ( not ( = ?auto_77485 ?auto_77489 ) ) ( not ( = ?auto_77485 ?auto_77490 ) ) ( not ( = ?auto_77485 ?auto_77491 ) ) ( not ( = ?auto_77486 ?auto_77487 ) ) ( not ( = ?auto_77486 ?auto_77488 ) ) ( not ( = ?auto_77486 ?auto_77489 ) ) ( not ( = ?auto_77486 ?auto_77490 ) ) ( not ( = ?auto_77486 ?auto_77491 ) ) ( not ( = ?auto_77487 ?auto_77488 ) ) ( not ( = ?auto_77487 ?auto_77489 ) ) ( not ( = ?auto_77487 ?auto_77490 ) ) ( not ( = ?auto_77487 ?auto_77491 ) ) ( not ( = ?auto_77488 ?auto_77489 ) ) ( not ( = ?auto_77488 ?auto_77490 ) ) ( not ( = ?auto_77488 ?auto_77491 ) ) ( not ( = ?auto_77489 ?auto_77490 ) ) ( not ( = ?auto_77489 ?auto_77491 ) ) ( not ( = ?auto_77490 ?auto_77491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77490 ?auto_77491 )
      ( !STACK ?auto_77490 ?auto_77489 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77500 - BLOCK
      ?auto_77501 - BLOCK
      ?auto_77502 - BLOCK
      ?auto_77503 - BLOCK
      ?auto_77504 - BLOCK
      ?auto_77505 - BLOCK
      ?auto_77506 - BLOCK
      ?auto_77507 - BLOCK
    )
    :vars
    (
      ?auto_77508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77507 ?auto_77508 ) ( ON-TABLE ?auto_77500 ) ( ON ?auto_77501 ?auto_77500 ) ( ON ?auto_77502 ?auto_77501 ) ( ON ?auto_77503 ?auto_77502 ) ( ON ?auto_77504 ?auto_77503 ) ( ON ?auto_77505 ?auto_77504 ) ( not ( = ?auto_77500 ?auto_77501 ) ) ( not ( = ?auto_77500 ?auto_77502 ) ) ( not ( = ?auto_77500 ?auto_77503 ) ) ( not ( = ?auto_77500 ?auto_77504 ) ) ( not ( = ?auto_77500 ?auto_77505 ) ) ( not ( = ?auto_77500 ?auto_77506 ) ) ( not ( = ?auto_77500 ?auto_77507 ) ) ( not ( = ?auto_77500 ?auto_77508 ) ) ( not ( = ?auto_77501 ?auto_77502 ) ) ( not ( = ?auto_77501 ?auto_77503 ) ) ( not ( = ?auto_77501 ?auto_77504 ) ) ( not ( = ?auto_77501 ?auto_77505 ) ) ( not ( = ?auto_77501 ?auto_77506 ) ) ( not ( = ?auto_77501 ?auto_77507 ) ) ( not ( = ?auto_77501 ?auto_77508 ) ) ( not ( = ?auto_77502 ?auto_77503 ) ) ( not ( = ?auto_77502 ?auto_77504 ) ) ( not ( = ?auto_77502 ?auto_77505 ) ) ( not ( = ?auto_77502 ?auto_77506 ) ) ( not ( = ?auto_77502 ?auto_77507 ) ) ( not ( = ?auto_77502 ?auto_77508 ) ) ( not ( = ?auto_77503 ?auto_77504 ) ) ( not ( = ?auto_77503 ?auto_77505 ) ) ( not ( = ?auto_77503 ?auto_77506 ) ) ( not ( = ?auto_77503 ?auto_77507 ) ) ( not ( = ?auto_77503 ?auto_77508 ) ) ( not ( = ?auto_77504 ?auto_77505 ) ) ( not ( = ?auto_77504 ?auto_77506 ) ) ( not ( = ?auto_77504 ?auto_77507 ) ) ( not ( = ?auto_77504 ?auto_77508 ) ) ( not ( = ?auto_77505 ?auto_77506 ) ) ( not ( = ?auto_77505 ?auto_77507 ) ) ( not ( = ?auto_77505 ?auto_77508 ) ) ( not ( = ?auto_77506 ?auto_77507 ) ) ( not ( = ?auto_77506 ?auto_77508 ) ) ( not ( = ?auto_77507 ?auto_77508 ) ) ( CLEAR ?auto_77505 ) ( ON ?auto_77506 ?auto_77507 ) ( CLEAR ?auto_77506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77500 ?auto_77501 ?auto_77502 ?auto_77503 ?auto_77504 ?auto_77505 ?auto_77506 )
      ( MAKE-8PILE ?auto_77500 ?auto_77501 ?auto_77502 ?auto_77503 ?auto_77504 ?auto_77505 ?auto_77506 ?auto_77507 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77517 - BLOCK
      ?auto_77518 - BLOCK
      ?auto_77519 - BLOCK
      ?auto_77520 - BLOCK
      ?auto_77521 - BLOCK
      ?auto_77522 - BLOCK
      ?auto_77523 - BLOCK
      ?auto_77524 - BLOCK
    )
    :vars
    (
      ?auto_77525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77524 ?auto_77525 ) ( ON-TABLE ?auto_77517 ) ( ON ?auto_77518 ?auto_77517 ) ( ON ?auto_77519 ?auto_77518 ) ( ON ?auto_77520 ?auto_77519 ) ( ON ?auto_77521 ?auto_77520 ) ( ON ?auto_77522 ?auto_77521 ) ( not ( = ?auto_77517 ?auto_77518 ) ) ( not ( = ?auto_77517 ?auto_77519 ) ) ( not ( = ?auto_77517 ?auto_77520 ) ) ( not ( = ?auto_77517 ?auto_77521 ) ) ( not ( = ?auto_77517 ?auto_77522 ) ) ( not ( = ?auto_77517 ?auto_77523 ) ) ( not ( = ?auto_77517 ?auto_77524 ) ) ( not ( = ?auto_77517 ?auto_77525 ) ) ( not ( = ?auto_77518 ?auto_77519 ) ) ( not ( = ?auto_77518 ?auto_77520 ) ) ( not ( = ?auto_77518 ?auto_77521 ) ) ( not ( = ?auto_77518 ?auto_77522 ) ) ( not ( = ?auto_77518 ?auto_77523 ) ) ( not ( = ?auto_77518 ?auto_77524 ) ) ( not ( = ?auto_77518 ?auto_77525 ) ) ( not ( = ?auto_77519 ?auto_77520 ) ) ( not ( = ?auto_77519 ?auto_77521 ) ) ( not ( = ?auto_77519 ?auto_77522 ) ) ( not ( = ?auto_77519 ?auto_77523 ) ) ( not ( = ?auto_77519 ?auto_77524 ) ) ( not ( = ?auto_77519 ?auto_77525 ) ) ( not ( = ?auto_77520 ?auto_77521 ) ) ( not ( = ?auto_77520 ?auto_77522 ) ) ( not ( = ?auto_77520 ?auto_77523 ) ) ( not ( = ?auto_77520 ?auto_77524 ) ) ( not ( = ?auto_77520 ?auto_77525 ) ) ( not ( = ?auto_77521 ?auto_77522 ) ) ( not ( = ?auto_77521 ?auto_77523 ) ) ( not ( = ?auto_77521 ?auto_77524 ) ) ( not ( = ?auto_77521 ?auto_77525 ) ) ( not ( = ?auto_77522 ?auto_77523 ) ) ( not ( = ?auto_77522 ?auto_77524 ) ) ( not ( = ?auto_77522 ?auto_77525 ) ) ( not ( = ?auto_77523 ?auto_77524 ) ) ( not ( = ?auto_77523 ?auto_77525 ) ) ( not ( = ?auto_77524 ?auto_77525 ) ) ( CLEAR ?auto_77522 ) ( ON ?auto_77523 ?auto_77524 ) ( CLEAR ?auto_77523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77517 ?auto_77518 ?auto_77519 ?auto_77520 ?auto_77521 ?auto_77522 ?auto_77523 )
      ( MAKE-8PILE ?auto_77517 ?auto_77518 ?auto_77519 ?auto_77520 ?auto_77521 ?auto_77522 ?auto_77523 ?auto_77524 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77534 - BLOCK
      ?auto_77535 - BLOCK
      ?auto_77536 - BLOCK
      ?auto_77537 - BLOCK
      ?auto_77538 - BLOCK
      ?auto_77539 - BLOCK
      ?auto_77540 - BLOCK
      ?auto_77541 - BLOCK
    )
    :vars
    (
      ?auto_77542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77541 ?auto_77542 ) ( ON-TABLE ?auto_77534 ) ( ON ?auto_77535 ?auto_77534 ) ( ON ?auto_77536 ?auto_77535 ) ( ON ?auto_77537 ?auto_77536 ) ( ON ?auto_77538 ?auto_77537 ) ( not ( = ?auto_77534 ?auto_77535 ) ) ( not ( = ?auto_77534 ?auto_77536 ) ) ( not ( = ?auto_77534 ?auto_77537 ) ) ( not ( = ?auto_77534 ?auto_77538 ) ) ( not ( = ?auto_77534 ?auto_77539 ) ) ( not ( = ?auto_77534 ?auto_77540 ) ) ( not ( = ?auto_77534 ?auto_77541 ) ) ( not ( = ?auto_77534 ?auto_77542 ) ) ( not ( = ?auto_77535 ?auto_77536 ) ) ( not ( = ?auto_77535 ?auto_77537 ) ) ( not ( = ?auto_77535 ?auto_77538 ) ) ( not ( = ?auto_77535 ?auto_77539 ) ) ( not ( = ?auto_77535 ?auto_77540 ) ) ( not ( = ?auto_77535 ?auto_77541 ) ) ( not ( = ?auto_77535 ?auto_77542 ) ) ( not ( = ?auto_77536 ?auto_77537 ) ) ( not ( = ?auto_77536 ?auto_77538 ) ) ( not ( = ?auto_77536 ?auto_77539 ) ) ( not ( = ?auto_77536 ?auto_77540 ) ) ( not ( = ?auto_77536 ?auto_77541 ) ) ( not ( = ?auto_77536 ?auto_77542 ) ) ( not ( = ?auto_77537 ?auto_77538 ) ) ( not ( = ?auto_77537 ?auto_77539 ) ) ( not ( = ?auto_77537 ?auto_77540 ) ) ( not ( = ?auto_77537 ?auto_77541 ) ) ( not ( = ?auto_77537 ?auto_77542 ) ) ( not ( = ?auto_77538 ?auto_77539 ) ) ( not ( = ?auto_77538 ?auto_77540 ) ) ( not ( = ?auto_77538 ?auto_77541 ) ) ( not ( = ?auto_77538 ?auto_77542 ) ) ( not ( = ?auto_77539 ?auto_77540 ) ) ( not ( = ?auto_77539 ?auto_77541 ) ) ( not ( = ?auto_77539 ?auto_77542 ) ) ( not ( = ?auto_77540 ?auto_77541 ) ) ( not ( = ?auto_77540 ?auto_77542 ) ) ( not ( = ?auto_77541 ?auto_77542 ) ) ( ON ?auto_77540 ?auto_77541 ) ( CLEAR ?auto_77538 ) ( ON ?auto_77539 ?auto_77540 ) ( CLEAR ?auto_77539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77534 ?auto_77535 ?auto_77536 ?auto_77537 ?auto_77538 ?auto_77539 )
      ( MAKE-8PILE ?auto_77534 ?auto_77535 ?auto_77536 ?auto_77537 ?auto_77538 ?auto_77539 ?auto_77540 ?auto_77541 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77551 - BLOCK
      ?auto_77552 - BLOCK
      ?auto_77553 - BLOCK
      ?auto_77554 - BLOCK
      ?auto_77555 - BLOCK
      ?auto_77556 - BLOCK
      ?auto_77557 - BLOCK
      ?auto_77558 - BLOCK
    )
    :vars
    (
      ?auto_77559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77558 ?auto_77559 ) ( ON-TABLE ?auto_77551 ) ( ON ?auto_77552 ?auto_77551 ) ( ON ?auto_77553 ?auto_77552 ) ( ON ?auto_77554 ?auto_77553 ) ( ON ?auto_77555 ?auto_77554 ) ( not ( = ?auto_77551 ?auto_77552 ) ) ( not ( = ?auto_77551 ?auto_77553 ) ) ( not ( = ?auto_77551 ?auto_77554 ) ) ( not ( = ?auto_77551 ?auto_77555 ) ) ( not ( = ?auto_77551 ?auto_77556 ) ) ( not ( = ?auto_77551 ?auto_77557 ) ) ( not ( = ?auto_77551 ?auto_77558 ) ) ( not ( = ?auto_77551 ?auto_77559 ) ) ( not ( = ?auto_77552 ?auto_77553 ) ) ( not ( = ?auto_77552 ?auto_77554 ) ) ( not ( = ?auto_77552 ?auto_77555 ) ) ( not ( = ?auto_77552 ?auto_77556 ) ) ( not ( = ?auto_77552 ?auto_77557 ) ) ( not ( = ?auto_77552 ?auto_77558 ) ) ( not ( = ?auto_77552 ?auto_77559 ) ) ( not ( = ?auto_77553 ?auto_77554 ) ) ( not ( = ?auto_77553 ?auto_77555 ) ) ( not ( = ?auto_77553 ?auto_77556 ) ) ( not ( = ?auto_77553 ?auto_77557 ) ) ( not ( = ?auto_77553 ?auto_77558 ) ) ( not ( = ?auto_77553 ?auto_77559 ) ) ( not ( = ?auto_77554 ?auto_77555 ) ) ( not ( = ?auto_77554 ?auto_77556 ) ) ( not ( = ?auto_77554 ?auto_77557 ) ) ( not ( = ?auto_77554 ?auto_77558 ) ) ( not ( = ?auto_77554 ?auto_77559 ) ) ( not ( = ?auto_77555 ?auto_77556 ) ) ( not ( = ?auto_77555 ?auto_77557 ) ) ( not ( = ?auto_77555 ?auto_77558 ) ) ( not ( = ?auto_77555 ?auto_77559 ) ) ( not ( = ?auto_77556 ?auto_77557 ) ) ( not ( = ?auto_77556 ?auto_77558 ) ) ( not ( = ?auto_77556 ?auto_77559 ) ) ( not ( = ?auto_77557 ?auto_77558 ) ) ( not ( = ?auto_77557 ?auto_77559 ) ) ( not ( = ?auto_77558 ?auto_77559 ) ) ( ON ?auto_77557 ?auto_77558 ) ( CLEAR ?auto_77555 ) ( ON ?auto_77556 ?auto_77557 ) ( CLEAR ?auto_77556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77551 ?auto_77552 ?auto_77553 ?auto_77554 ?auto_77555 ?auto_77556 )
      ( MAKE-8PILE ?auto_77551 ?auto_77552 ?auto_77553 ?auto_77554 ?auto_77555 ?auto_77556 ?auto_77557 ?auto_77558 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77568 - BLOCK
      ?auto_77569 - BLOCK
      ?auto_77570 - BLOCK
      ?auto_77571 - BLOCK
      ?auto_77572 - BLOCK
      ?auto_77573 - BLOCK
      ?auto_77574 - BLOCK
      ?auto_77575 - BLOCK
    )
    :vars
    (
      ?auto_77576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77575 ?auto_77576 ) ( ON-TABLE ?auto_77568 ) ( ON ?auto_77569 ?auto_77568 ) ( ON ?auto_77570 ?auto_77569 ) ( ON ?auto_77571 ?auto_77570 ) ( not ( = ?auto_77568 ?auto_77569 ) ) ( not ( = ?auto_77568 ?auto_77570 ) ) ( not ( = ?auto_77568 ?auto_77571 ) ) ( not ( = ?auto_77568 ?auto_77572 ) ) ( not ( = ?auto_77568 ?auto_77573 ) ) ( not ( = ?auto_77568 ?auto_77574 ) ) ( not ( = ?auto_77568 ?auto_77575 ) ) ( not ( = ?auto_77568 ?auto_77576 ) ) ( not ( = ?auto_77569 ?auto_77570 ) ) ( not ( = ?auto_77569 ?auto_77571 ) ) ( not ( = ?auto_77569 ?auto_77572 ) ) ( not ( = ?auto_77569 ?auto_77573 ) ) ( not ( = ?auto_77569 ?auto_77574 ) ) ( not ( = ?auto_77569 ?auto_77575 ) ) ( not ( = ?auto_77569 ?auto_77576 ) ) ( not ( = ?auto_77570 ?auto_77571 ) ) ( not ( = ?auto_77570 ?auto_77572 ) ) ( not ( = ?auto_77570 ?auto_77573 ) ) ( not ( = ?auto_77570 ?auto_77574 ) ) ( not ( = ?auto_77570 ?auto_77575 ) ) ( not ( = ?auto_77570 ?auto_77576 ) ) ( not ( = ?auto_77571 ?auto_77572 ) ) ( not ( = ?auto_77571 ?auto_77573 ) ) ( not ( = ?auto_77571 ?auto_77574 ) ) ( not ( = ?auto_77571 ?auto_77575 ) ) ( not ( = ?auto_77571 ?auto_77576 ) ) ( not ( = ?auto_77572 ?auto_77573 ) ) ( not ( = ?auto_77572 ?auto_77574 ) ) ( not ( = ?auto_77572 ?auto_77575 ) ) ( not ( = ?auto_77572 ?auto_77576 ) ) ( not ( = ?auto_77573 ?auto_77574 ) ) ( not ( = ?auto_77573 ?auto_77575 ) ) ( not ( = ?auto_77573 ?auto_77576 ) ) ( not ( = ?auto_77574 ?auto_77575 ) ) ( not ( = ?auto_77574 ?auto_77576 ) ) ( not ( = ?auto_77575 ?auto_77576 ) ) ( ON ?auto_77574 ?auto_77575 ) ( ON ?auto_77573 ?auto_77574 ) ( CLEAR ?auto_77571 ) ( ON ?auto_77572 ?auto_77573 ) ( CLEAR ?auto_77572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77568 ?auto_77569 ?auto_77570 ?auto_77571 ?auto_77572 )
      ( MAKE-8PILE ?auto_77568 ?auto_77569 ?auto_77570 ?auto_77571 ?auto_77572 ?auto_77573 ?auto_77574 ?auto_77575 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77585 - BLOCK
      ?auto_77586 - BLOCK
      ?auto_77587 - BLOCK
      ?auto_77588 - BLOCK
      ?auto_77589 - BLOCK
      ?auto_77590 - BLOCK
      ?auto_77591 - BLOCK
      ?auto_77592 - BLOCK
    )
    :vars
    (
      ?auto_77593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77592 ?auto_77593 ) ( ON-TABLE ?auto_77585 ) ( ON ?auto_77586 ?auto_77585 ) ( ON ?auto_77587 ?auto_77586 ) ( ON ?auto_77588 ?auto_77587 ) ( not ( = ?auto_77585 ?auto_77586 ) ) ( not ( = ?auto_77585 ?auto_77587 ) ) ( not ( = ?auto_77585 ?auto_77588 ) ) ( not ( = ?auto_77585 ?auto_77589 ) ) ( not ( = ?auto_77585 ?auto_77590 ) ) ( not ( = ?auto_77585 ?auto_77591 ) ) ( not ( = ?auto_77585 ?auto_77592 ) ) ( not ( = ?auto_77585 ?auto_77593 ) ) ( not ( = ?auto_77586 ?auto_77587 ) ) ( not ( = ?auto_77586 ?auto_77588 ) ) ( not ( = ?auto_77586 ?auto_77589 ) ) ( not ( = ?auto_77586 ?auto_77590 ) ) ( not ( = ?auto_77586 ?auto_77591 ) ) ( not ( = ?auto_77586 ?auto_77592 ) ) ( not ( = ?auto_77586 ?auto_77593 ) ) ( not ( = ?auto_77587 ?auto_77588 ) ) ( not ( = ?auto_77587 ?auto_77589 ) ) ( not ( = ?auto_77587 ?auto_77590 ) ) ( not ( = ?auto_77587 ?auto_77591 ) ) ( not ( = ?auto_77587 ?auto_77592 ) ) ( not ( = ?auto_77587 ?auto_77593 ) ) ( not ( = ?auto_77588 ?auto_77589 ) ) ( not ( = ?auto_77588 ?auto_77590 ) ) ( not ( = ?auto_77588 ?auto_77591 ) ) ( not ( = ?auto_77588 ?auto_77592 ) ) ( not ( = ?auto_77588 ?auto_77593 ) ) ( not ( = ?auto_77589 ?auto_77590 ) ) ( not ( = ?auto_77589 ?auto_77591 ) ) ( not ( = ?auto_77589 ?auto_77592 ) ) ( not ( = ?auto_77589 ?auto_77593 ) ) ( not ( = ?auto_77590 ?auto_77591 ) ) ( not ( = ?auto_77590 ?auto_77592 ) ) ( not ( = ?auto_77590 ?auto_77593 ) ) ( not ( = ?auto_77591 ?auto_77592 ) ) ( not ( = ?auto_77591 ?auto_77593 ) ) ( not ( = ?auto_77592 ?auto_77593 ) ) ( ON ?auto_77591 ?auto_77592 ) ( ON ?auto_77590 ?auto_77591 ) ( CLEAR ?auto_77588 ) ( ON ?auto_77589 ?auto_77590 ) ( CLEAR ?auto_77589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77585 ?auto_77586 ?auto_77587 ?auto_77588 ?auto_77589 )
      ( MAKE-8PILE ?auto_77585 ?auto_77586 ?auto_77587 ?auto_77588 ?auto_77589 ?auto_77590 ?auto_77591 ?auto_77592 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77602 - BLOCK
      ?auto_77603 - BLOCK
      ?auto_77604 - BLOCK
      ?auto_77605 - BLOCK
      ?auto_77606 - BLOCK
      ?auto_77607 - BLOCK
      ?auto_77608 - BLOCK
      ?auto_77609 - BLOCK
    )
    :vars
    (
      ?auto_77610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77609 ?auto_77610 ) ( ON-TABLE ?auto_77602 ) ( ON ?auto_77603 ?auto_77602 ) ( ON ?auto_77604 ?auto_77603 ) ( not ( = ?auto_77602 ?auto_77603 ) ) ( not ( = ?auto_77602 ?auto_77604 ) ) ( not ( = ?auto_77602 ?auto_77605 ) ) ( not ( = ?auto_77602 ?auto_77606 ) ) ( not ( = ?auto_77602 ?auto_77607 ) ) ( not ( = ?auto_77602 ?auto_77608 ) ) ( not ( = ?auto_77602 ?auto_77609 ) ) ( not ( = ?auto_77602 ?auto_77610 ) ) ( not ( = ?auto_77603 ?auto_77604 ) ) ( not ( = ?auto_77603 ?auto_77605 ) ) ( not ( = ?auto_77603 ?auto_77606 ) ) ( not ( = ?auto_77603 ?auto_77607 ) ) ( not ( = ?auto_77603 ?auto_77608 ) ) ( not ( = ?auto_77603 ?auto_77609 ) ) ( not ( = ?auto_77603 ?auto_77610 ) ) ( not ( = ?auto_77604 ?auto_77605 ) ) ( not ( = ?auto_77604 ?auto_77606 ) ) ( not ( = ?auto_77604 ?auto_77607 ) ) ( not ( = ?auto_77604 ?auto_77608 ) ) ( not ( = ?auto_77604 ?auto_77609 ) ) ( not ( = ?auto_77604 ?auto_77610 ) ) ( not ( = ?auto_77605 ?auto_77606 ) ) ( not ( = ?auto_77605 ?auto_77607 ) ) ( not ( = ?auto_77605 ?auto_77608 ) ) ( not ( = ?auto_77605 ?auto_77609 ) ) ( not ( = ?auto_77605 ?auto_77610 ) ) ( not ( = ?auto_77606 ?auto_77607 ) ) ( not ( = ?auto_77606 ?auto_77608 ) ) ( not ( = ?auto_77606 ?auto_77609 ) ) ( not ( = ?auto_77606 ?auto_77610 ) ) ( not ( = ?auto_77607 ?auto_77608 ) ) ( not ( = ?auto_77607 ?auto_77609 ) ) ( not ( = ?auto_77607 ?auto_77610 ) ) ( not ( = ?auto_77608 ?auto_77609 ) ) ( not ( = ?auto_77608 ?auto_77610 ) ) ( not ( = ?auto_77609 ?auto_77610 ) ) ( ON ?auto_77608 ?auto_77609 ) ( ON ?auto_77607 ?auto_77608 ) ( ON ?auto_77606 ?auto_77607 ) ( CLEAR ?auto_77604 ) ( ON ?auto_77605 ?auto_77606 ) ( CLEAR ?auto_77605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77602 ?auto_77603 ?auto_77604 ?auto_77605 )
      ( MAKE-8PILE ?auto_77602 ?auto_77603 ?auto_77604 ?auto_77605 ?auto_77606 ?auto_77607 ?auto_77608 ?auto_77609 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77619 - BLOCK
      ?auto_77620 - BLOCK
      ?auto_77621 - BLOCK
      ?auto_77622 - BLOCK
      ?auto_77623 - BLOCK
      ?auto_77624 - BLOCK
      ?auto_77625 - BLOCK
      ?auto_77626 - BLOCK
    )
    :vars
    (
      ?auto_77627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77626 ?auto_77627 ) ( ON-TABLE ?auto_77619 ) ( ON ?auto_77620 ?auto_77619 ) ( ON ?auto_77621 ?auto_77620 ) ( not ( = ?auto_77619 ?auto_77620 ) ) ( not ( = ?auto_77619 ?auto_77621 ) ) ( not ( = ?auto_77619 ?auto_77622 ) ) ( not ( = ?auto_77619 ?auto_77623 ) ) ( not ( = ?auto_77619 ?auto_77624 ) ) ( not ( = ?auto_77619 ?auto_77625 ) ) ( not ( = ?auto_77619 ?auto_77626 ) ) ( not ( = ?auto_77619 ?auto_77627 ) ) ( not ( = ?auto_77620 ?auto_77621 ) ) ( not ( = ?auto_77620 ?auto_77622 ) ) ( not ( = ?auto_77620 ?auto_77623 ) ) ( not ( = ?auto_77620 ?auto_77624 ) ) ( not ( = ?auto_77620 ?auto_77625 ) ) ( not ( = ?auto_77620 ?auto_77626 ) ) ( not ( = ?auto_77620 ?auto_77627 ) ) ( not ( = ?auto_77621 ?auto_77622 ) ) ( not ( = ?auto_77621 ?auto_77623 ) ) ( not ( = ?auto_77621 ?auto_77624 ) ) ( not ( = ?auto_77621 ?auto_77625 ) ) ( not ( = ?auto_77621 ?auto_77626 ) ) ( not ( = ?auto_77621 ?auto_77627 ) ) ( not ( = ?auto_77622 ?auto_77623 ) ) ( not ( = ?auto_77622 ?auto_77624 ) ) ( not ( = ?auto_77622 ?auto_77625 ) ) ( not ( = ?auto_77622 ?auto_77626 ) ) ( not ( = ?auto_77622 ?auto_77627 ) ) ( not ( = ?auto_77623 ?auto_77624 ) ) ( not ( = ?auto_77623 ?auto_77625 ) ) ( not ( = ?auto_77623 ?auto_77626 ) ) ( not ( = ?auto_77623 ?auto_77627 ) ) ( not ( = ?auto_77624 ?auto_77625 ) ) ( not ( = ?auto_77624 ?auto_77626 ) ) ( not ( = ?auto_77624 ?auto_77627 ) ) ( not ( = ?auto_77625 ?auto_77626 ) ) ( not ( = ?auto_77625 ?auto_77627 ) ) ( not ( = ?auto_77626 ?auto_77627 ) ) ( ON ?auto_77625 ?auto_77626 ) ( ON ?auto_77624 ?auto_77625 ) ( ON ?auto_77623 ?auto_77624 ) ( CLEAR ?auto_77621 ) ( ON ?auto_77622 ?auto_77623 ) ( CLEAR ?auto_77622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77619 ?auto_77620 ?auto_77621 ?auto_77622 )
      ( MAKE-8PILE ?auto_77619 ?auto_77620 ?auto_77621 ?auto_77622 ?auto_77623 ?auto_77624 ?auto_77625 ?auto_77626 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77636 - BLOCK
      ?auto_77637 - BLOCK
      ?auto_77638 - BLOCK
      ?auto_77639 - BLOCK
      ?auto_77640 - BLOCK
      ?auto_77641 - BLOCK
      ?auto_77642 - BLOCK
      ?auto_77643 - BLOCK
    )
    :vars
    (
      ?auto_77644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77643 ?auto_77644 ) ( ON-TABLE ?auto_77636 ) ( ON ?auto_77637 ?auto_77636 ) ( not ( = ?auto_77636 ?auto_77637 ) ) ( not ( = ?auto_77636 ?auto_77638 ) ) ( not ( = ?auto_77636 ?auto_77639 ) ) ( not ( = ?auto_77636 ?auto_77640 ) ) ( not ( = ?auto_77636 ?auto_77641 ) ) ( not ( = ?auto_77636 ?auto_77642 ) ) ( not ( = ?auto_77636 ?auto_77643 ) ) ( not ( = ?auto_77636 ?auto_77644 ) ) ( not ( = ?auto_77637 ?auto_77638 ) ) ( not ( = ?auto_77637 ?auto_77639 ) ) ( not ( = ?auto_77637 ?auto_77640 ) ) ( not ( = ?auto_77637 ?auto_77641 ) ) ( not ( = ?auto_77637 ?auto_77642 ) ) ( not ( = ?auto_77637 ?auto_77643 ) ) ( not ( = ?auto_77637 ?auto_77644 ) ) ( not ( = ?auto_77638 ?auto_77639 ) ) ( not ( = ?auto_77638 ?auto_77640 ) ) ( not ( = ?auto_77638 ?auto_77641 ) ) ( not ( = ?auto_77638 ?auto_77642 ) ) ( not ( = ?auto_77638 ?auto_77643 ) ) ( not ( = ?auto_77638 ?auto_77644 ) ) ( not ( = ?auto_77639 ?auto_77640 ) ) ( not ( = ?auto_77639 ?auto_77641 ) ) ( not ( = ?auto_77639 ?auto_77642 ) ) ( not ( = ?auto_77639 ?auto_77643 ) ) ( not ( = ?auto_77639 ?auto_77644 ) ) ( not ( = ?auto_77640 ?auto_77641 ) ) ( not ( = ?auto_77640 ?auto_77642 ) ) ( not ( = ?auto_77640 ?auto_77643 ) ) ( not ( = ?auto_77640 ?auto_77644 ) ) ( not ( = ?auto_77641 ?auto_77642 ) ) ( not ( = ?auto_77641 ?auto_77643 ) ) ( not ( = ?auto_77641 ?auto_77644 ) ) ( not ( = ?auto_77642 ?auto_77643 ) ) ( not ( = ?auto_77642 ?auto_77644 ) ) ( not ( = ?auto_77643 ?auto_77644 ) ) ( ON ?auto_77642 ?auto_77643 ) ( ON ?auto_77641 ?auto_77642 ) ( ON ?auto_77640 ?auto_77641 ) ( ON ?auto_77639 ?auto_77640 ) ( CLEAR ?auto_77637 ) ( ON ?auto_77638 ?auto_77639 ) ( CLEAR ?auto_77638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77636 ?auto_77637 ?auto_77638 )
      ( MAKE-8PILE ?auto_77636 ?auto_77637 ?auto_77638 ?auto_77639 ?auto_77640 ?auto_77641 ?auto_77642 ?auto_77643 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77653 - BLOCK
      ?auto_77654 - BLOCK
      ?auto_77655 - BLOCK
      ?auto_77656 - BLOCK
      ?auto_77657 - BLOCK
      ?auto_77658 - BLOCK
      ?auto_77659 - BLOCK
      ?auto_77660 - BLOCK
    )
    :vars
    (
      ?auto_77661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77660 ?auto_77661 ) ( ON-TABLE ?auto_77653 ) ( ON ?auto_77654 ?auto_77653 ) ( not ( = ?auto_77653 ?auto_77654 ) ) ( not ( = ?auto_77653 ?auto_77655 ) ) ( not ( = ?auto_77653 ?auto_77656 ) ) ( not ( = ?auto_77653 ?auto_77657 ) ) ( not ( = ?auto_77653 ?auto_77658 ) ) ( not ( = ?auto_77653 ?auto_77659 ) ) ( not ( = ?auto_77653 ?auto_77660 ) ) ( not ( = ?auto_77653 ?auto_77661 ) ) ( not ( = ?auto_77654 ?auto_77655 ) ) ( not ( = ?auto_77654 ?auto_77656 ) ) ( not ( = ?auto_77654 ?auto_77657 ) ) ( not ( = ?auto_77654 ?auto_77658 ) ) ( not ( = ?auto_77654 ?auto_77659 ) ) ( not ( = ?auto_77654 ?auto_77660 ) ) ( not ( = ?auto_77654 ?auto_77661 ) ) ( not ( = ?auto_77655 ?auto_77656 ) ) ( not ( = ?auto_77655 ?auto_77657 ) ) ( not ( = ?auto_77655 ?auto_77658 ) ) ( not ( = ?auto_77655 ?auto_77659 ) ) ( not ( = ?auto_77655 ?auto_77660 ) ) ( not ( = ?auto_77655 ?auto_77661 ) ) ( not ( = ?auto_77656 ?auto_77657 ) ) ( not ( = ?auto_77656 ?auto_77658 ) ) ( not ( = ?auto_77656 ?auto_77659 ) ) ( not ( = ?auto_77656 ?auto_77660 ) ) ( not ( = ?auto_77656 ?auto_77661 ) ) ( not ( = ?auto_77657 ?auto_77658 ) ) ( not ( = ?auto_77657 ?auto_77659 ) ) ( not ( = ?auto_77657 ?auto_77660 ) ) ( not ( = ?auto_77657 ?auto_77661 ) ) ( not ( = ?auto_77658 ?auto_77659 ) ) ( not ( = ?auto_77658 ?auto_77660 ) ) ( not ( = ?auto_77658 ?auto_77661 ) ) ( not ( = ?auto_77659 ?auto_77660 ) ) ( not ( = ?auto_77659 ?auto_77661 ) ) ( not ( = ?auto_77660 ?auto_77661 ) ) ( ON ?auto_77659 ?auto_77660 ) ( ON ?auto_77658 ?auto_77659 ) ( ON ?auto_77657 ?auto_77658 ) ( ON ?auto_77656 ?auto_77657 ) ( CLEAR ?auto_77654 ) ( ON ?auto_77655 ?auto_77656 ) ( CLEAR ?auto_77655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77653 ?auto_77654 ?auto_77655 )
      ( MAKE-8PILE ?auto_77653 ?auto_77654 ?auto_77655 ?auto_77656 ?auto_77657 ?auto_77658 ?auto_77659 ?auto_77660 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77670 - BLOCK
      ?auto_77671 - BLOCK
      ?auto_77672 - BLOCK
      ?auto_77673 - BLOCK
      ?auto_77674 - BLOCK
      ?auto_77675 - BLOCK
      ?auto_77676 - BLOCK
      ?auto_77677 - BLOCK
    )
    :vars
    (
      ?auto_77678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77677 ?auto_77678 ) ( ON-TABLE ?auto_77670 ) ( not ( = ?auto_77670 ?auto_77671 ) ) ( not ( = ?auto_77670 ?auto_77672 ) ) ( not ( = ?auto_77670 ?auto_77673 ) ) ( not ( = ?auto_77670 ?auto_77674 ) ) ( not ( = ?auto_77670 ?auto_77675 ) ) ( not ( = ?auto_77670 ?auto_77676 ) ) ( not ( = ?auto_77670 ?auto_77677 ) ) ( not ( = ?auto_77670 ?auto_77678 ) ) ( not ( = ?auto_77671 ?auto_77672 ) ) ( not ( = ?auto_77671 ?auto_77673 ) ) ( not ( = ?auto_77671 ?auto_77674 ) ) ( not ( = ?auto_77671 ?auto_77675 ) ) ( not ( = ?auto_77671 ?auto_77676 ) ) ( not ( = ?auto_77671 ?auto_77677 ) ) ( not ( = ?auto_77671 ?auto_77678 ) ) ( not ( = ?auto_77672 ?auto_77673 ) ) ( not ( = ?auto_77672 ?auto_77674 ) ) ( not ( = ?auto_77672 ?auto_77675 ) ) ( not ( = ?auto_77672 ?auto_77676 ) ) ( not ( = ?auto_77672 ?auto_77677 ) ) ( not ( = ?auto_77672 ?auto_77678 ) ) ( not ( = ?auto_77673 ?auto_77674 ) ) ( not ( = ?auto_77673 ?auto_77675 ) ) ( not ( = ?auto_77673 ?auto_77676 ) ) ( not ( = ?auto_77673 ?auto_77677 ) ) ( not ( = ?auto_77673 ?auto_77678 ) ) ( not ( = ?auto_77674 ?auto_77675 ) ) ( not ( = ?auto_77674 ?auto_77676 ) ) ( not ( = ?auto_77674 ?auto_77677 ) ) ( not ( = ?auto_77674 ?auto_77678 ) ) ( not ( = ?auto_77675 ?auto_77676 ) ) ( not ( = ?auto_77675 ?auto_77677 ) ) ( not ( = ?auto_77675 ?auto_77678 ) ) ( not ( = ?auto_77676 ?auto_77677 ) ) ( not ( = ?auto_77676 ?auto_77678 ) ) ( not ( = ?auto_77677 ?auto_77678 ) ) ( ON ?auto_77676 ?auto_77677 ) ( ON ?auto_77675 ?auto_77676 ) ( ON ?auto_77674 ?auto_77675 ) ( ON ?auto_77673 ?auto_77674 ) ( ON ?auto_77672 ?auto_77673 ) ( CLEAR ?auto_77670 ) ( ON ?auto_77671 ?auto_77672 ) ( CLEAR ?auto_77671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77670 ?auto_77671 )
      ( MAKE-8PILE ?auto_77670 ?auto_77671 ?auto_77672 ?auto_77673 ?auto_77674 ?auto_77675 ?auto_77676 ?auto_77677 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77687 - BLOCK
      ?auto_77688 - BLOCK
      ?auto_77689 - BLOCK
      ?auto_77690 - BLOCK
      ?auto_77691 - BLOCK
      ?auto_77692 - BLOCK
      ?auto_77693 - BLOCK
      ?auto_77694 - BLOCK
    )
    :vars
    (
      ?auto_77695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77694 ?auto_77695 ) ( ON-TABLE ?auto_77687 ) ( not ( = ?auto_77687 ?auto_77688 ) ) ( not ( = ?auto_77687 ?auto_77689 ) ) ( not ( = ?auto_77687 ?auto_77690 ) ) ( not ( = ?auto_77687 ?auto_77691 ) ) ( not ( = ?auto_77687 ?auto_77692 ) ) ( not ( = ?auto_77687 ?auto_77693 ) ) ( not ( = ?auto_77687 ?auto_77694 ) ) ( not ( = ?auto_77687 ?auto_77695 ) ) ( not ( = ?auto_77688 ?auto_77689 ) ) ( not ( = ?auto_77688 ?auto_77690 ) ) ( not ( = ?auto_77688 ?auto_77691 ) ) ( not ( = ?auto_77688 ?auto_77692 ) ) ( not ( = ?auto_77688 ?auto_77693 ) ) ( not ( = ?auto_77688 ?auto_77694 ) ) ( not ( = ?auto_77688 ?auto_77695 ) ) ( not ( = ?auto_77689 ?auto_77690 ) ) ( not ( = ?auto_77689 ?auto_77691 ) ) ( not ( = ?auto_77689 ?auto_77692 ) ) ( not ( = ?auto_77689 ?auto_77693 ) ) ( not ( = ?auto_77689 ?auto_77694 ) ) ( not ( = ?auto_77689 ?auto_77695 ) ) ( not ( = ?auto_77690 ?auto_77691 ) ) ( not ( = ?auto_77690 ?auto_77692 ) ) ( not ( = ?auto_77690 ?auto_77693 ) ) ( not ( = ?auto_77690 ?auto_77694 ) ) ( not ( = ?auto_77690 ?auto_77695 ) ) ( not ( = ?auto_77691 ?auto_77692 ) ) ( not ( = ?auto_77691 ?auto_77693 ) ) ( not ( = ?auto_77691 ?auto_77694 ) ) ( not ( = ?auto_77691 ?auto_77695 ) ) ( not ( = ?auto_77692 ?auto_77693 ) ) ( not ( = ?auto_77692 ?auto_77694 ) ) ( not ( = ?auto_77692 ?auto_77695 ) ) ( not ( = ?auto_77693 ?auto_77694 ) ) ( not ( = ?auto_77693 ?auto_77695 ) ) ( not ( = ?auto_77694 ?auto_77695 ) ) ( ON ?auto_77693 ?auto_77694 ) ( ON ?auto_77692 ?auto_77693 ) ( ON ?auto_77691 ?auto_77692 ) ( ON ?auto_77690 ?auto_77691 ) ( ON ?auto_77689 ?auto_77690 ) ( CLEAR ?auto_77687 ) ( ON ?auto_77688 ?auto_77689 ) ( CLEAR ?auto_77688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77687 ?auto_77688 )
      ( MAKE-8PILE ?auto_77687 ?auto_77688 ?auto_77689 ?auto_77690 ?auto_77691 ?auto_77692 ?auto_77693 ?auto_77694 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77704 - BLOCK
      ?auto_77705 - BLOCK
      ?auto_77706 - BLOCK
      ?auto_77707 - BLOCK
      ?auto_77708 - BLOCK
      ?auto_77709 - BLOCK
      ?auto_77710 - BLOCK
      ?auto_77711 - BLOCK
    )
    :vars
    (
      ?auto_77712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77711 ?auto_77712 ) ( not ( = ?auto_77704 ?auto_77705 ) ) ( not ( = ?auto_77704 ?auto_77706 ) ) ( not ( = ?auto_77704 ?auto_77707 ) ) ( not ( = ?auto_77704 ?auto_77708 ) ) ( not ( = ?auto_77704 ?auto_77709 ) ) ( not ( = ?auto_77704 ?auto_77710 ) ) ( not ( = ?auto_77704 ?auto_77711 ) ) ( not ( = ?auto_77704 ?auto_77712 ) ) ( not ( = ?auto_77705 ?auto_77706 ) ) ( not ( = ?auto_77705 ?auto_77707 ) ) ( not ( = ?auto_77705 ?auto_77708 ) ) ( not ( = ?auto_77705 ?auto_77709 ) ) ( not ( = ?auto_77705 ?auto_77710 ) ) ( not ( = ?auto_77705 ?auto_77711 ) ) ( not ( = ?auto_77705 ?auto_77712 ) ) ( not ( = ?auto_77706 ?auto_77707 ) ) ( not ( = ?auto_77706 ?auto_77708 ) ) ( not ( = ?auto_77706 ?auto_77709 ) ) ( not ( = ?auto_77706 ?auto_77710 ) ) ( not ( = ?auto_77706 ?auto_77711 ) ) ( not ( = ?auto_77706 ?auto_77712 ) ) ( not ( = ?auto_77707 ?auto_77708 ) ) ( not ( = ?auto_77707 ?auto_77709 ) ) ( not ( = ?auto_77707 ?auto_77710 ) ) ( not ( = ?auto_77707 ?auto_77711 ) ) ( not ( = ?auto_77707 ?auto_77712 ) ) ( not ( = ?auto_77708 ?auto_77709 ) ) ( not ( = ?auto_77708 ?auto_77710 ) ) ( not ( = ?auto_77708 ?auto_77711 ) ) ( not ( = ?auto_77708 ?auto_77712 ) ) ( not ( = ?auto_77709 ?auto_77710 ) ) ( not ( = ?auto_77709 ?auto_77711 ) ) ( not ( = ?auto_77709 ?auto_77712 ) ) ( not ( = ?auto_77710 ?auto_77711 ) ) ( not ( = ?auto_77710 ?auto_77712 ) ) ( not ( = ?auto_77711 ?auto_77712 ) ) ( ON ?auto_77710 ?auto_77711 ) ( ON ?auto_77709 ?auto_77710 ) ( ON ?auto_77708 ?auto_77709 ) ( ON ?auto_77707 ?auto_77708 ) ( ON ?auto_77706 ?auto_77707 ) ( ON ?auto_77705 ?auto_77706 ) ( ON ?auto_77704 ?auto_77705 ) ( CLEAR ?auto_77704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77704 )
      ( MAKE-8PILE ?auto_77704 ?auto_77705 ?auto_77706 ?auto_77707 ?auto_77708 ?auto_77709 ?auto_77710 ?auto_77711 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_77721 - BLOCK
      ?auto_77722 - BLOCK
      ?auto_77723 - BLOCK
      ?auto_77724 - BLOCK
      ?auto_77725 - BLOCK
      ?auto_77726 - BLOCK
      ?auto_77727 - BLOCK
      ?auto_77728 - BLOCK
    )
    :vars
    (
      ?auto_77729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77728 ?auto_77729 ) ( not ( = ?auto_77721 ?auto_77722 ) ) ( not ( = ?auto_77721 ?auto_77723 ) ) ( not ( = ?auto_77721 ?auto_77724 ) ) ( not ( = ?auto_77721 ?auto_77725 ) ) ( not ( = ?auto_77721 ?auto_77726 ) ) ( not ( = ?auto_77721 ?auto_77727 ) ) ( not ( = ?auto_77721 ?auto_77728 ) ) ( not ( = ?auto_77721 ?auto_77729 ) ) ( not ( = ?auto_77722 ?auto_77723 ) ) ( not ( = ?auto_77722 ?auto_77724 ) ) ( not ( = ?auto_77722 ?auto_77725 ) ) ( not ( = ?auto_77722 ?auto_77726 ) ) ( not ( = ?auto_77722 ?auto_77727 ) ) ( not ( = ?auto_77722 ?auto_77728 ) ) ( not ( = ?auto_77722 ?auto_77729 ) ) ( not ( = ?auto_77723 ?auto_77724 ) ) ( not ( = ?auto_77723 ?auto_77725 ) ) ( not ( = ?auto_77723 ?auto_77726 ) ) ( not ( = ?auto_77723 ?auto_77727 ) ) ( not ( = ?auto_77723 ?auto_77728 ) ) ( not ( = ?auto_77723 ?auto_77729 ) ) ( not ( = ?auto_77724 ?auto_77725 ) ) ( not ( = ?auto_77724 ?auto_77726 ) ) ( not ( = ?auto_77724 ?auto_77727 ) ) ( not ( = ?auto_77724 ?auto_77728 ) ) ( not ( = ?auto_77724 ?auto_77729 ) ) ( not ( = ?auto_77725 ?auto_77726 ) ) ( not ( = ?auto_77725 ?auto_77727 ) ) ( not ( = ?auto_77725 ?auto_77728 ) ) ( not ( = ?auto_77725 ?auto_77729 ) ) ( not ( = ?auto_77726 ?auto_77727 ) ) ( not ( = ?auto_77726 ?auto_77728 ) ) ( not ( = ?auto_77726 ?auto_77729 ) ) ( not ( = ?auto_77727 ?auto_77728 ) ) ( not ( = ?auto_77727 ?auto_77729 ) ) ( not ( = ?auto_77728 ?auto_77729 ) ) ( ON ?auto_77727 ?auto_77728 ) ( ON ?auto_77726 ?auto_77727 ) ( ON ?auto_77725 ?auto_77726 ) ( ON ?auto_77724 ?auto_77725 ) ( ON ?auto_77723 ?auto_77724 ) ( ON ?auto_77722 ?auto_77723 ) ( ON ?auto_77721 ?auto_77722 ) ( CLEAR ?auto_77721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77721 )
      ( MAKE-8PILE ?auto_77721 ?auto_77722 ?auto_77723 ?auto_77724 ?auto_77725 ?auto_77726 ?auto_77727 ?auto_77728 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77739 - BLOCK
      ?auto_77740 - BLOCK
      ?auto_77741 - BLOCK
      ?auto_77742 - BLOCK
      ?auto_77743 - BLOCK
      ?auto_77744 - BLOCK
      ?auto_77745 - BLOCK
      ?auto_77746 - BLOCK
      ?auto_77747 - BLOCK
    )
    :vars
    (
      ?auto_77748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77746 ) ( ON ?auto_77747 ?auto_77748 ) ( CLEAR ?auto_77747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77739 ) ( ON ?auto_77740 ?auto_77739 ) ( ON ?auto_77741 ?auto_77740 ) ( ON ?auto_77742 ?auto_77741 ) ( ON ?auto_77743 ?auto_77742 ) ( ON ?auto_77744 ?auto_77743 ) ( ON ?auto_77745 ?auto_77744 ) ( ON ?auto_77746 ?auto_77745 ) ( not ( = ?auto_77739 ?auto_77740 ) ) ( not ( = ?auto_77739 ?auto_77741 ) ) ( not ( = ?auto_77739 ?auto_77742 ) ) ( not ( = ?auto_77739 ?auto_77743 ) ) ( not ( = ?auto_77739 ?auto_77744 ) ) ( not ( = ?auto_77739 ?auto_77745 ) ) ( not ( = ?auto_77739 ?auto_77746 ) ) ( not ( = ?auto_77739 ?auto_77747 ) ) ( not ( = ?auto_77739 ?auto_77748 ) ) ( not ( = ?auto_77740 ?auto_77741 ) ) ( not ( = ?auto_77740 ?auto_77742 ) ) ( not ( = ?auto_77740 ?auto_77743 ) ) ( not ( = ?auto_77740 ?auto_77744 ) ) ( not ( = ?auto_77740 ?auto_77745 ) ) ( not ( = ?auto_77740 ?auto_77746 ) ) ( not ( = ?auto_77740 ?auto_77747 ) ) ( not ( = ?auto_77740 ?auto_77748 ) ) ( not ( = ?auto_77741 ?auto_77742 ) ) ( not ( = ?auto_77741 ?auto_77743 ) ) ( not ( = ?auto_77741 ?auto_77744 ) ) ( not ( = ?auto_77741 ?auto_77745 ) ) ( not ( = ?auto_77741 ?auto_77746 ) ) ( not ( = ?auto_77741 ?auto_77747 ) ) ( not ( = ?auto_77741 ?auto_77748 ) ) ( not ( = ?auto_77742 ?auto_77743 ) ) ( not ( = ?auto_77742 ?auto_77744 ) ) ( not ( = ?auto_77742 ?auto_77745 ) ) ( not ( = ?auto_77742 ?auto_77746 ) ) ( not ( = ?auto_77742 ?auto_77747 ) ) ( not ( = ?auto_77742 ?auto_77748 ) ) ( not ( = ?auto_77743 ?auto_77744 ) ) ( not ( = ?auto_77743 ?auto_77745 ) ) ( not ( = ?auto_77743 ?auto_77746 ) ) ( not ( = ?auto_77743 ?auto_77747 ) ) ( not ( = ?auto_77743 ?auto_77748 ) ) ( not ( = ?auto_77744 ?auto_77745 ) ) ( not ( = ?auto_77744 ?auto_77746 ) ) ( not ( = ?auto_77744 ?auto_77747 ) ) ( not ( = ?auto_77744 ?auto_77748 ) ) ( not ( = ?auto_77745 ?auto_77746 ) ) ( not ( = ?auto_77745 ?auto_77747 ) ) ( not ( = ?auto_77745 ?auto_77748 ) ) ( not ( = ?auto_77746 ?auto_77747 ) ) ( not ( = ?auto_77746 ?auto_77748 ) ) ( not ( = ?auto_77747 ?auto_77748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77747 ?auto_77748 )
      ( !STACK ?auto_77747 ?auto_77746 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77758 - BLOCK
      ?auto_77759 - BLOCK
      ?auto_77760 - BLOCK
      ?auto_77761 - BLOCK
      ?auto_77762 - BLOCK
      ?auto_77763 - BLOCK
      ?auto_77764 - BLOCK
      ?auto_77765 - BLOCK
      ?auto_77766 - BLOCK
    )
    :vars
    (
      ?auto_77767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77765 ) ( ON ?auto_77766 ?auto_77767 ) ( CLEAR ?auto_77766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77758 ) ( ON ?auto_77759 ?auto_77758 ) ( ON ?auto_77760 ?auto_77759 ) ( ON ?auto_77761 ?auto_77760 ) ( ON ?auto_77762 ?auto_77761 ) ( ON ?auto_77763 ?auto_77762 ) ( ON ?auto_77764 ?auto_77763 ) ( ON ?auto_77765 ?auto_77764 ) ( not ( = ?auto_77758 ?auto_77759 ) ) ( not ( = ?auto_77758 ?auto_77760 ) ) ( not ( = ?auto_77758 ?auto_77761 ) ) ( not ( = ?auto_77758 ?auto_77762 ) ) ( not ( = ?auto_77758 ?auto_77763 ) ) ( not ( = ?auto_77758 ?auto_77764 ) ) ( not ( = ?auto_77758 ?auto_77765 ) ) ( not ( = ?auto_77758 ?auto_77766 ) ) ( not ( = ?auto_77758 ?auto_77767 ) ) ( not ( = ?auto_77759 ?auto_77760 ) ) ( not ( = ?auto_77759 ?auto_77761 ) ) ( not ( = ?auto_77759 ?auto_77762 ) ) ( not ( = ?auto_77759 ?auto_77763 ) ) ( not ( = ?auto_77759 ?auto_77764 ) ) ( not ( = ?auto_77759 ?auto_77765 ) ) ( not ( = ?auto_77759 ?auto_77766 ) ) ( not ( = ?auto_77759 ?auto_77767 ) ) ( not ( = ?auto_77760 ?auto_77761 ) ) ( not ( = ?auto_77760 ?auto_77762 ) ) ( not ( = ?auto_77760 ?auto_77763 ) ) ( not ( = ?auto_77760 ?auto_77764 ) ) ( not ( = ?auto_77760 ?auto_77765 ) ) ( not ( = ?auto_77760 ?auto_77766 ) ) ( not ( = ?auto_77760 ?auto_77767 ) ) ( not ( = ?auto_77761 ?auto_77762 ) ) ( not ( = ?auto_77761 ?auto_77763 ) ) ( not ( = ?auto_77761 ?auto_77764 ) ) ( not ( = ?auto_77761 ?auto_77765 ) ) ( not ( = ?auto_77761 ?auto_77766 ) ) ( not ( = ?auto_77761 ?auto_77767 ) ) ( not ( = ?auto_77762 ?auto_77763 ) ) ( not ( = ?auto_77762 ?auto_77764 ) ) ( not ( = ?auto_77762 ?auto_77765 ) ) ( not ( = ?auto_77762 ?auto_77766 ) ) ( not ( = ?auto_77762 ?auto_77767 ) ) ( not ( = ?auto_77763 ?auto_77764 ) ) ( not ( = ?auto_77763 ?auto_77765 ) ) ( not ( = ?auto_77763 ?auto_77766 ) ) ( not ( = ?auto_77763 ?auto_77767 ) ) ( not ( = ?auto_77764 ?auto_77765 ) ) ( not ( = ?auto_77764 ?auto_77766 ) ) ( not ( = ?auto_77764 ?auto_77767 ) ) ( not ( = ?auto_77765 ?auto_77766 ) ) ( not ( = ?auto_77765 ?auto_77767 ) ) ( not ( = ?auto_77766 ?auto_77767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77766 ?auto_77767 )
      ( !STACK ?auto_77766 ?auto_77765 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77777 - BLOCK
      ?auto_77778 - BLOCK
      ?auto_77779 - BLOCK
      ?auto_77780 - BLOCK
      ?auto_77781 - BLOCK
      ?auto_77782 - BLOCK
      ?auto_77783 - BLOCK
      ?auto_77784 - BLOCK
      ?auto_77785 - BLOCK
    )
    :vars
    (
      ?auto_77786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77785 ?auto_77786 ) ( ON-TABLE ?auto_77777 ) ( ON ?auto_77778 ?auto_77777 ) ( ON ?auto_77779 ?auto_77778 ) ( ON ?auto_77780 ?auto_77779 ) ( ON ?auto_77781 ?auto_77780 ) ( ON ?auto_77782 ?auto_77781 ) ( ON ?auto_77783 ?auto_77782 ) ( not ( = ?auto_77777 ?auto_77778 ) ) ( not ( = ?auto_77777 ?auto_77779 ) ) ( not ( = ?auto_77777 ?auto_77780 ) ) ( not ( = ?auto_77777 ?auto_77781 ) ) ( not ( = ?auto_77777 ?auto_77782 ) ) ( not ( = ?auto_77777 ?auto_77783 ) ) ( not ( = ?auto_77777 ?auto_77784 ) ) ( not ( = ?auto_77777 ?auto_77785 ) ) ( not ( = ?auto_77777 ?auto_77786 ) ) ( not ( = ?auto_77778 ?auto_77779 ) ) ( not ( = ?auto_77778 ?auto_77780 ) ) ( not ( = ?auto_77778 ?auto_77781 ) ) ( not ( = ?auto_77778 ?auto_77782 ) ) ( not ( = ?auto_77778 ?auto_77783 ) ) ( not ( = ?auto_77778 ?auto_77784 ) ) ( not ( = ?auto_77778 ?auto_77785 ) ) ( not ( = ?auto_77778 ?auto_77786 ) ) ( not ( = ?auto_77779 ?auto_77780 ) ) ( not ( = ?auto_77779 ?auto_77781 ) ) ( not ( = ?auto_77779 ?auto_77782 ) ) ( not ( = ?auto_77779 ?auto_77783 ) ) ( not ( = ?auto_77779 ?auto_77784 ) ) ( not ( = ?auto_77779 ?auto_77785 ) ) ( not ( = ?auto_77779 ?auto_77786 ) ) ( not ( = ?auto_77780 ?auto_77781 ) ) ( not ( = ?auto_77780 ?auto_77782 ) ) ( not ( = ?auto_77780 ?auto_77783 ) ) ( not ( = ?auto_77780 ?auto_77784 ) ) ( not ( = ?auto_77780 ?auto_77785 ) ) ( not ( = ?auto_77780 ?auto_77786 ) ) ( not ( = ?auto_77781 ?auto_77782 ) ) ( not ( = ?auto_77781 ?auto_77783 ) ) ( not ( = ?auto_77781 ?auto_77784 ) ) ( not ( = ?auto_77781 ?auto_77785 ) ) ( not ( = ?auto_77781 ?auto_77786 ) ) ( not ( = ?auto_77782 ?auto_77783 ) ) ( not ( = ?auto_77782 ?auto_77784 ) ) ( not ( = ?auto_77782 ?auto_77785 ) ) ( not ( = ?auto_77782 ?auto_77786 ) ) ( not ( = ?auto_77783 ?auto_77784 ) ) ( not ( = ?auto_77783 ?auto_77785 ) ) ( not ( = ?auto_77783 ?auto_77786 ) ) ( not ( = ?auto_77784 ?auto_77785 ) ) ( not ( = ?auto_77784 ?auto_77786 ) ) ( not ( = ?auto_77785 ?auto_77786 ) ) ( CLEAR ?auto_77783 ) ( ON ?auto_77784 ?auto_77785 ) ( CLEAR ?auto_77784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_77777 ?auto_77778 ?auto_77779 ?auto_77780 ?auto_77781 ?auto_77782 ?auto_77783 ?auto_77784 )
      ( MAKE-9PILE ?auto_77777 ?auto_77778 ?auto_77779 ?auto_77780 ?auto_77781 ?auto_77782 ?auto_77783 ?auto_77784 ?auto_77785 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77796 - BLOCK
      ?auto_77797 - BLOCK
      ?auto_77798 - BLOCK
      ?auto_77799 - BLOCK
      ?auto_77800 - BLOCK
      ?auto_77801 - BLOCK
      ?auto_77802 - BLOCK
      ?auto_77803 - BLOCK
      ?auto_77804 - BLOCK
    )
    :vars
    (
      ?auto_77805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77804 ?auto_77805 ) ( ON-TABLE ?auto_77796 ) ( ON ?auto_77797 ?auto_77796 ) ( ON ?auto_77798 ?auto_77797 ) ( ON ?auto_77799 ?auto_77798 ) ( ON ?auto_77800 ?auto_77799 ) ( ON ?auto_77801 ?auto_77800 ) ( ON ?auto_77802 ?auto_77801 ) ( not ( = ?auto_77796 ?auto_77797 ) ) ( not ( = ?auto_77796 ?auto_77798 ) ) ( not ( = ?auto_77796 ?auto_77799 ) ) ( not ( = ?auto_77796 ?auto_77800 ) ) ( not ( = ?auto_77796 ?auto_77801 ) ) ( not ( = ?auto_77796 ?auto_77802 ) ) ( not ( = ?auto_77796 ?auto_77803 ) ) ( not ( = ?auto_77796 ?auto_77804 ) ) ( not ( = ?auto_77796 ?auto_77805 ) ) ( not ( = ?auto_77797 ?auto_77798 ) ) ( not ( = ?auto_77797 ?auto_77799 ) ) ( not ( = ?auto_77797 ?auto_77800 ) ) ( not ( = ?auto_77797 ?auto_77801 ) ) ( not ( = ?auto_77797 ?auto_77802 ) ) ( not ( = ?auto_77797 ?auto_77803 ) ) ( not ( = ?auto_77797 ?auto_77804 ) ) ( not ( = ?auto_77797 ?auto_77805 ) ) ( not ( = ?auto_77798 ?auto_77799 ) ) ( not ( = ?auto_77798 ?auto_77800 ) ) ( not ( = ?auto_77798 ?auto_77801 ) ) ( not ( = ?auto_77798 ?auto_77802 ) ) ( not ( = ?auto_77798 ?auto_77803 ) ) ( not ( = ?auto_77798 ?auto_77804 ) ) ( not ( = ?auto_77798 ?auto_77805 ) ) ( not ( = ?auto_77799 ?auto_77800 ) ) ( not ( = ?auto_77799 ?auto_77801 ) ) ( not ( = ?auto_77799 ?auto_77802 ) ) ( not ( = ?auto_77799 ?auto_77803 ) ) ( not ( = ?auto_77799 ?auto_77804 ) ) ( not ( = ?auto_77799 ?auto_77805 ) ) ( not ( = ?auto_77800 ?auto_77801 ) ) ( not ( = ?auto_77800 ?auto_77802 ) ) ( not ( = ?auto_77800 ?auto_77803 ) ) ( not ( = ?auto_77800 ?auto_77804 ) ) ( not ( = ?auto_77800 ?auto_77805 ) ) ( not ( = ?auto_77801 ?auto_77802 ) ) ( not ( = ?auto_77801 ?auto_77803 ) ) ( not ( = ?auto_77801 ?auto_77804 ) ) ( not ( = ?auto_77801 ?auto_77805 ) ) ( not ( = ?auto_77802 ?auto_77803 ) ) ( not ( = ?auto_77802 ?auto_77804 ) ) ( not ( = ?auto_77802 ?auto_77805 ) ) ( not ( = ?auto_77803 ?auto_77804 ) ) ( not ( = ?auto_77803 ?auto_77805 ) ) ( not ( = ?auto_77804 ?auto_77805 ) ) ( CLEAR ?auto_77802 ) ( ON ?auto_77803 ?auto_77804 ) ( CLEAR ?auto_77803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_77796 ?auto_77797 ?auto_77798 ?auto_77799 ?auto_77800 ?auto_77801 ?auto_77802 ?auto_77803 )
      ( MAKE-9PILE ?auto_77796 ?auto_77797 ?auto_77798 ?auto_77799 ?auto_77800 ?auto_77801 ?auto_77802 ?auto_77803 ?auto_77804 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77815 - BLOCK
      ?auto_77816 - BLOCK
      ?auto_77817 - BLOCK
      ?auto_77818 - BLOCK
      ?auto_77819 - BLOCK
      ?auto_77820 - BLOCK
      ?auto_77821 - BLOCK
      ?auto_77822 - BLOCK
      ?auto_77823 - BLOCK
    )
    :vars
    (
      ?auto_77824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77823 ?auto_77824 ) ( ON-TABLE ?auto_77815 ) ( ON ?auto_77816 ?auto_77815 ) ( ON ?auto_77817 ?auto_77816 ) ( ON ?auto_77818 ?auto_77817 ) ( ON ?auto_77819 ?auto_77818 ) ( ON ?auto_77820 ?auto_77819 ) ( not ( = ?auto_77815 ?auto_77816 ) ) ( not ( = ?auto_77815 ?auto_77817 ) ) ( not ( = ?auto_77815 ?auto_77818 ) ) ( not ( = ?auto_77815 ?auto_77819 ) ) ( not ( = ?auto_77815 ?auto_77820 ) ) ( not ( = ?auto_77815 ?auto_77821 ) ) ( not ( = ?auto_77815 ?auto_77822 ) ) ( not ( = ?auto_77815 ?auto_77823 ) ) ( not ( = ?auto_77815 ?auto_77824 ) ) ( not ( = ?auto_77816 ?auto_77817 ) ) ( not ( = ?auto_77816 ?auto_77818 ) ) ( not ( = ?auto_77816 ?auto_77819 ) ) ( not ( = ?auto_77816 ?auto_77820 ) ) ( not ( = ?auto_77816 ?auto_77821 ) ) ( not ( = ?auto_77816 ?auto_77822 ) ) ( not ( = ?auto_77816 ?auto_77823 ) ) ( not ( = ?auto_77816 ?auto_77824 ) ) ( not ( = ?auto_77817 ?auto_77818 ) ) ( not ( = ?auto_77817 ?auto_77819 ) ) ( not ( = ?auto_77817 ?auto_77820 ) ) ( not ( = ?auto_77817 ?auto_77821 ) ) ( not ( = ?auto_77817 ?auto_77822 ) ) ( not ( = ?auto_77817 ?auto_77823 ) ) ( not ( = ?auto_77817 ?auto_77824 ) ) ( not ( = ?auto_77818 ?auto_77819 ) ) ( not ( = ?auto_77818 ?auto_77820 ) ) ( not ( = ?auto_77818 ?auto_77821 ) ) ( not ( = ?auto_77818 ?auto_77822 ) ) ( not ( = ?auto_77818 ?auto_77823 ) ) ( not ( = ?auto_77818 ?auto_77824 ) ) ( not ( = ?auto_77819 ?auto_77820 ) ) ( not ( = ?auto_77819 ?auto_77821 ) ) ( not ( = ?auto_77819 ?auto_77822 ) ) ( not ( = ?auto_77819 ?auto_77823 ) ) ( not ( = ?auto_77819 ?auto_77824 ) ) ( not ( = ?auto_77820 ?auto_77821 ) ) ( not ( = ?auto_77820 ?auto_77822 ) ) ( not ( = ?auto_77820 ?auto_77823 ) ) ( not ( = ?auto_77820 ?auto_77824 ) ) ( not ( = ?auto_77821 ?auto_77822 ) ) ( not ( = ?auto_77821 ?auto_77823 ) ) ( not ( = ?auto_77821 ?auto_77824 ) ) ( not ( = ?auto_77822 ?auto_77823 ) ) ( not ( = ?auto_77822 ?auto_77824 ) ) ( not ( = ?auto_77823 ?auto_77824 ) ) ( ON ?auto_77822 ?auto_77823 ) ( CLEAR ?auto_77820 ) ( ON ?auto_77821 ?auto_77822 ) ( CLEAR ?auto_77821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77815 ?auto_77816 ?auto_77817 ?auto_77818 ?auto_77819 ?auto_77820 ?auto_77821 )
      ( MAKE-9PILE ?auto_77815 ?auto_77816 ?auto_77817 ?auto_77818 ?auto_77819 ?auto_77820 ?auto_77821 ?auto_77822 ?auto_77823 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77834 - BLOCK
      ?auto_77835 - BLOCK
      ?auto_77836 - BLOCK
      ?auto_77837 - BLOCK
      ?auto_77838 - BLOCK
      ?auto_77839 - BLOCK
      ?auto_77840 - BLOCK
      ?auto_77841 - BLOCK
      ?auto_77842 - BLOCK
    )
    :vars
    (
      ?auto_77843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77842 ?auto_77843 ) ( ON-TABLE ?auto_77834 ) ( ON ?auto_77835 ?auto_77834 ) ( ON ?auto_77836 ?auto_77835 ) ( ON ?auto_77837 ?auto_77836 ) ( ON ?auto_77838 ?auto_77837 ) ( ON ?auto_77839 ?auto_77838 ) ( not ( = ?auto_77834 ?auto_77835 ) ) ( not ( = ?auto_77834 ?auto_77836 ) ) ( not ( = ?auto_77834 ?auto_77837 ) ) ( not ( = ?auto_77834 ?auto_77838 ) ) ( not ( = ?auto_77834 ?auto_77839 ) ) ( not ( = ?auto_77834 ?auto_77840 ) ) ( not ( = ?auto_77834 ?auto_77841 ) ) ( not ( = ?auto_77834 ?auto_77842 ) ) ( not ( = ?auto_77834 ?auto_77843 ) ) ( not ( = ?auto_77835 ?auto_77836 ) ) ( not ( = ?auto_77835 ?auto_77837 ) ) ( not ( = ?auto_77835 ?auto_77838 ) ) ( not ( = ?auto_77835 ?auto_77839 ) ) ( not ( = ?auto_77835 ?auto_77840 ) ) ( not ( = ?auto_77835 ?auto_77841 ) ) ( not ( = ?auto_77835 ?auto_77842 ) ) ( not ( = ?auto_77835 ?auto_77843 ) ) ( not ( = ?auto_77836 ?auto_77837 ) ) ( not ( = ?auto_77836 ?auto_77838 ) ) ( not ( = ?auto_77836 ?auto_77839 ) ) ( not ( = ?auto_77836 ?auto_77840 ) ) ( not ( = ?auto_77836 ?auto_77841 ) ) ( not ( = ?auto_77836 ?auto_77842 ) ) ( not ( = ?auto_77836 ?auto_77843 ) ) ( not ( = ?auto_77837 ?auto_77838 ) ) ( not ( = ?auto_77837 ?auto_77839 ) ) ( not ( = ?auto_77837 ?auto_77840 ) ) ( not ( = ?auto_77837 ?auto_77841 ) ) ( not ( = ?auto_77837 ?auto_77842 ) ) ( not ( = ?auto_77837 ?auto_77843 ) ) ( not ( = ?auto_77838 ?auto_77839 ) ) ( not ( = ?auto_77838 ?auto_77840 ) ) ( not ( = ?auto_77838 ?auto_77841 ) ) ( not ( = ?auto_77838 ?auto_77842 ) ) ( not ( = ?auto_77838 ?auto_77843 ) ) ( not ( = ?auto_77839 ?auto_77840 ) ) ( not ( = ?auto_77839 ?auto_77841 ) ) ( not ( = ?auto_77839 ?auto_77842 ) ) ( not ( = ?auto_77839 ?auto_77843 ) ) ( not ( = ?auto_77840 ?auto_77841 ) ) ( not ( = ?auto_77840 ?auto_77842 ) ) ( not ( = ?auto_77840 ?auto_77843 ) ) ( not ( = ?auto_77841 ?auto_77842 ) ) ( not ( = ?auto_77841 ?auto_77843 ) ) ( not ( = ?auto_77842 ?auto_77843 ) ) ( ON ?auto_77841 ?auto_77842 ) ( CLEAR ?auto_77839 ) ( ON ?auto_77840 ?auto_77841 ) ( CLEAR ?auto_77840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77834 ?auto_77835 ?auto_77836 ?auto_77837 ?auto_77838 ?auto_77839 ?auto_77840 )
      ( MAKE-9PILE ?auto_77834 ?auto_77835 ?auto_77836 ?auto_77837 ?auto_77838 ?auto_77839 ?auto_77840 ?auto_77841 ?auto_77842 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77853 - BLOCK
      ?auto_77854 - BLOCK
      ?auto_77855 - BLOCK
      ?auto_77856 - BLOCK
      ?auto_77857 - BLOCK
      ?auto_77858 - BLOCK
      ?auto_77859 - BLOCK
      ?auto_77860 - BLOCK
      ?auto_77861 - BLOCK
    )
    :vars
    (
      ?auto_77862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77861 ?auto_77862 ) ( ON-TABLE ?auto_77853 ) ( ON ?auto_77854 ?auto_77853 ) ( ON ?auto_77855 ?auto_77854 ) ( ON ?auto_77856 ?auto_77855 ) ( ON ?auto_77857 ?auto_77856 ) ( not ( = ?auto_77853 ?auto_77854 ) ) ( not ( = ?auto_77853 ?auto_77855 ) ) ( not ( = ?auto_77853 ?auto_77856 ) ) ( not ( = ?auto_77853 ?auto_77857 ) ) ( not ( = ?auto_77853 ?auto_77858 ) ) ( not ( = ?auto_77853 ?auto_77859 ) ) ( not ( = ?auto_77853 ?auto_77860 ) ) ( not ( = ?auto_77853 ?auto_77861 ) ) ( not ( = ?auto_77853 ?auto_77862 ) ) ( not ( = ?auto_77854 ?auto_77855 ) ) ( not ( = ?auto_77854 ?auto_77856 ) ) ( not ( = ?auto_77854 ?auto_77857 ) ) ( not ( = ?auto_77854 ?auto_77858 ) ) ( not ( = ?auto_77854 ?auto_77859 ) ) ( not ( = ?auto_77854 ?auto_77860 ) ) ( not ( = ?auto_77854 ?auto_77861 ) ) ( not ( = ?auto_77854 ?auto_77862 ) ) ( not ( = ?auto_77855 ?auto_77856 ) ) ( not ( = ?auto_77855 ?auto_77857 ) ) ( not ( = ?auto_77855 ?auto_77858 ) ) ( not ( = ?auto_77855 ?auto_77859 ) ) ( not ( = ?auto_77855 ?auto_77860 ) ) ( not ( = ?auto_77855 ?auto_77861 ) ) ( not ( = ?auto_77855 ?auto_77862 ) ) ( not ( = ?auto_77856 ?auto_77857 ) ) ( not ( = ?auto_77856 ?auto_77858 ) ) ( not ( = ?auto_77856 ?auto_77859 ) ) ( not ( = ?auto_77856 ?auto_77860 ) ) ( not ( = ?auto_77856 ?auto_77861 ) ) ( not ( = ?auto_77856 ?auto_77862 ) ) ( not ( = ?auto_77857 ?auto_77858 ) ) ( not ( = ?auto_77857 ?auto_77859 ) ) ( not ( = ?auto_77857 ?auto_77860 ) ) ( not ( = ?auto_77857 ?auto_77861 ) ) ( not ( = ?auto_77857 ?auto_77862 ) ) ( not ( = ?auto_77858 ?auto_77859 ) ) ( not ( = ?auto_77858 ?auto_77860 ) ) ( not ( = ?auto_77858 ?auto_77861 ) ) ( not ( = ?auto_77858 ?auto_77862 ) ) ( not ( = ?auto_77859 ?auto_77860 ) ) ( not ( = ?auto_77859 ?auto_77861 ) ) ( not ( = ?auto_77859 ?auto_77862 ) ) ( not ( = ?auto_77860 ?auto_77861 ) ) ( not ( = ?auto_77860 ?auto_77862 ) ) ( not ( = ?auto_77861 ?auto_77862 ) ) ( ON ?auto_77860 ?auto_77861 ) ( ON ?auto_77859 ?auto_77860 ) ( CLEAR ?auto_77857 ) ( ON ?auto_77858 ?auto_77859 ) ( CLEAR ?auto_77858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77853 ?auto_77854 ?auto_77855 ?auto_77856 ?auto_77857 ?auto_77858 )
      ( MAKE-9PILE ?auto_77853 ?auto_77854 ?auto_77855 ?auto_77856 ?auto_77857 ?auto_77858 ?auto_77859 ?auto_77860 ?auto_77861 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77872 - BLOCK
      ?auto_77873 - BLOCK
      ?auto_77874 - BLOCK
      ?auto_77875 - BLOCK
      ?auto_77876 - BLOCK
      ?auto_77877 - BLOCK
      ?auto_77878 - BLOCK
      ?auto_77879 - BLOCK
      ?auto_77880 - BLOCK
    )
    :vars
    (
      ?auto_77881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77880 ?auto_77881 ) ( ON-TABLE ?auto_77872 ) ( ON ?auto_77873 ?auto_77872 ) ( ON ?auto_77874 ?auto_77873 ) ( ON ?auto_77875 ?auto_77874 ) ( ON ?auto_77876 ?auto_77875 ) ( not ( = ?auto_77872 ?auto_77873 ) ) ( not ( = ?auto_77872 ?auto_77874 ) ) ( not ( = ?auto_77872 ?auto_77875 ) ) ( not ( = ?auto_77872 ?auto_77876 ) ) ( not ( = ?auto_77872 ?auto_77877 ) ) ( not ( = ?auto_77872 ?auto_77878 ) ) ( not ( = ?auto_77872 ?auto_77879 ) ) ( not ( = ?auto_77872 ?auto_77880 ) ) ( not ( = ?auto_77872 ?auto_77881 ) ) ( not ( = ?auto_77873 ?auto_77874 ) ) ( not ( = ?auto_77873 ?auto_77875 ) ) ( not ( = ?auto_77873 ?auto_77876 ) ) ( not ( = ?auto_77873 ?auto_77877 ) ) ( not ( = ?auto_77873 ?auto_77878 ) ) ( not ( = ?auto_77873 ?auto_77879 ) ) ( not ( = ?auto_77873 ?auto_77880 ) ) ( not ( = ?auto_77873 ?auto_77881 ) ) ( not ( = ?auto_77874 ?auto_77875 ) ) ( not ( = ?auto_77874 ?auto_77876 ) ) ( not ( = ?auto_77874 ?auto_77877 ) ) ( not ( = ?auto_77874 ?auto_77878 ) ) ( not ( = ?auto_77874 ?auto_77879 ) ) ( not ( = ?auto_77874 ?auto_77880 ) ) ( not ( = ?auto_77874 ?auto_77881 ) ) ( not ( = ?auto_77875 ?auto_77876 ) ) ( not ( = ?auto_77875 ?auto_77877 ) ) ( not ( = ?auto_77875 ?auto_77878 ) ) ( not ( = ?auto_77875 ?auto_77879 ) ) ( not ( = ?auto_77875 ?auto_77880 ) ) ( not ( = ?auto_77875 ?auto_77881 ) ) ( not ( = ?auto_77876 ?auto_77877 ) ) ( not ( = ?auto_77876 ?auto_77878 ) ) ( not ( = ?auto_77876 ?auto_77879 ) ) ( not ( = ?auto_77876 ?auto_77880 ) ) ( not ( = ?auto_77876 ?auto_77881 ) ) ( not ( = ?auto_77877 ?auto_77878 ) ) ( not ( = ?auto_77877 ?auto_77879 ) ) ( not ( = ?auto_77877 ?auto_77880 ) ) ( not ( = ?auto_77877 ?auto_77881 ) ) ( not ( = ?auto_77878 ?auto_77879 ) ) ( not ( = ?auto_77878 ?auto_77880 ) ) ( not ( = ?auto_77878 ?auto_77881 ) ) ( not ( = ?auto_77879 ?auto_77880 ) ) ( not ( = ?auto_77879 ?auto_77881 ) ) ( not ( = ?auto_77880 ?auto_77881 ) ) ( ON ?auto_77879 ?auto_77880 ) ( ON ?auto_77878 ?auto_77879 ) ( CLEAR ?auto_77876 ) ( ON ?auto_77877 ?auto_77878 ) ( CLEAR ?auto_77877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77872 ?auto_77873 ?auto_77874 ?auto_77875 ?auto_77876 ?auto_77877 )
      ( MAKE-9PILE ?auto_77872 ?auto_77873 ?auto_77874 ?auto_77875 ?auto_77876 ?auto_77877 ?auto_77878 ?auto_77879 ?auto_77880 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77891 - BLOCK
      ?auto_77892 - BLOCK
      ?auto_77893 - BLOCK
      ?auto_77894 - BLOCK
      ?auto_77895 - BLOCK
      ?auto_77896 - BLOCK
      ?auto_77897 - BLOCK
      ?auto_77898 - BLOCK
      ?auto_77899 - BLOCK
    )
    :vars
    (
      ?auto_77900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77899 ?auto_77900 ) ( ON-TABLE ?auto_77891 ) ( ON ?auto_77892 ?auto_77891 ) ( ON ?auto_77893 ?auto_77892 ) ( ON ?auto_77894 ?auto_77893 ) ( not ( = ?auto_77891 ?auto_77892 ) ) ( not ( = ?auto_77891 ?auto_77893 ) ) ( not ( = ?auto_77891 ?auto_77894 ) ) ( not ( = ?auto_77891 ?auto_77895 ) ) ( not ( = ?auto_77891 ?auto_77896 ) ) ( not ( = ?auto_77891 ?auto_77897 ) ) ( not ( = ?auto_77891 ?auto_77898 ) ) ( not ( = ?auto_77891 ?auto_77899 ) ) ( not ( = ?auto_77891 ?auto_77900 ) ) ( not ( = ?auto_77892 ?auto_77893 ) ) ( not ( = ?auto_77892 ?auto_77894 ) ) ( not ( = ?auto_77892 ?auto_77895 ) ) ( not ( = ?auto_77892 ?auto_77896 ) ) ( not ( = ?auto_77892 ?auto_77897 ) ) ( not ( = ?auto_77892 ?auto_77898 ) ) ( not ( = ?auto_77892 ?auto_77899 ) ) ( not ( = ?auto_77892 ?auto_77900 ) ) ( not ( = ?auto_77893 ?auto_77894 ) ) ( not ( = ?auto_77893 ?auto_77895 ) ) ( not ( = ?auto_77893 ?auto_77896 ) ) ( not ( = ?auto_77893 ?auto_77897 ) ) ( not ( = ?auto_77893 ?auto_77898 ) ) ( not ( = ?auto_77893 ?auto_77899 ) ) ( not ( = ?auto_77893 ?auto_77900 ) ) ( not ( = ?auto_77894 ?auto_77895 ) ) ( not ( = ?auto_77894 ?auto_77896 ) ) ( not ( = ?auto_77894 ?auto_77897 ) ) ( not ( = ?auto_77894 ?auto_77898 ) ) ( not ( = ?auto_77894 ?auto_77899 ) ) ( not ( = ?auto_77894 ?auto_77900 ) ) ( not ( = ?auto_77895 ?auto_77896 ) ) ( not ( = ?auto_77895 ?auto_77897 ) ) ( not ( = ?auto_77895 ?auto_77898 ) ) ( not ( = ?auto_77895 ?auto_77899 ) ) ( not ( = ?auto_77895 ?auto_77900 ) ) ( not ( = ?auto_77896 ?auto_77897 ) ) ( not ( = ?auto_77896 ?auto_77898 ) ) ( not ( = ?auto_77896 ?auto_77899 ) ) ( not ( = ?auto_77896 ?auto_77900 ) ) ( not ( = ?auto_77897 ?auto_77898 ) ) ( not ( = ?auto_77897 ?auto_77899 ) ) ( not ( = ?auto_77897 ?auto_77900 ) ) ( not ( = ?auto_77898 ?auto_77899 ) ) ( not ( = ?auto_77898 ?auto_77900 ) ) ( not ( = ?auto_77899 ?auto_77900 ) ) ( ON ?auto_77898 ?auto_77899 ) ( ON ?auto_77897 ?auto_77898 ) ( ON ?auto_77896 ?auto_77897 ) ( CLEAR ?auto_77894 ) ( ON ?auto_77895 ?auto_77896 ) ( CLEAR ?auto_77895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77891 ?auto_77892 ?auto_77893 ?auto_77894 ?auto_77895 )
      ( MAKE-9PILE ?auto_77891 ?auto_77892 ?auto_77893 ?auto_77894 ?auto_77895 ?auto_77896 ?auto_77897 ?auto_77898 ?auto_77899 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77910 - BLOCK
      ?auto_77911 - BLOCK
      ?auto_77912 - BLOCK
      ?auto_77913 - BLOCK
      ?auto_77914 - BLOCK
      ?auto_77915 - BLOCK
      ?auto_77916 - BLOCK
      ?auto_77917 - BLOCK
      ?auto_77918 - BLOCK
    )
    :vars
    (
      ?auto_77919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77918 ?auto_77919 ) ( ON-TABLE ?auto_77910 ) ( ON ?auto_77911 ?auto_77910 ) ( ON ?auto_77912 ?auto_77911 ) ( ON ?auto_77913 ?auto_77912 ) ( not ( = ?auto_77910 ?auto_77911 ) ) ( not ( = ?auto_77910 ?auto_77912 ) ) ( not ( = ?auto_77910 ?auto_77913 ) ) ( not ( = ?auto_77910 ?auto_77914 ) ) ( not ( = ?auto_77910 ?auto_77915 ) ) ( not ( = ?auto_77910 ?auto_77916 ) ) ( not ( = ?auto_77910 ?auto_77917 ) ) ( not ( = ?auto_77910 ?auto_77918 ) ) ( not ( = ?auto_77910 ?auto_77919 ) ) ( not ( = ?auto_77911 ?auto_77912 ) ) ( not ( = ?auto_77911 ?auto_77913 ) ) ( not ( = ?auto_77911 ?auto_77914 ) ) ( not ( = ?auto_77911 ?auto_77915 ) ) ( not ( = ?auto_77911 ?auto_77916 ) ) ( not ( = ?auto_77911 ?auto_77917 ) ) ( not ( = ?auto_77911 ?auto_77918 ) ) ( not ( = ?auto_77911 ?auto_77919 ) ) ( not ( = ?auto_77912 ?auto_77913 ) ) ( not ( = ?auto_77912 ?auto_77914 ) ) ( not ( = ?auto_77912 ?auto_77915 ) ) ( not ( = ?auto_77912 ?auto_77916 ) ) ( not ( = ?auto_77912 ?auto_77917 ) ) ( not ( = ?auto_77912 ?auto_77918 ) ) ( not ( = ?auto_77912 ?auto_77919 ) ) ( not ( = ?auto_77913 ?auto_77914 ) ) ( not ( = ?auto_77913 ?auto_77915 ) ) ( not ( = ?auto_77913 ?auto_77916 ) ) ( not ( = ?auto_77913 ?auto_77917 ) ) ( not ( = ?auto_77913 ?auto_77918 ) ) ( not ( = ?auto_77913 ?auto_77919 ) ) ( not ( = ?auto_77914 ?auto_77915 ) ) ( not ( = ?auto_77914 ?auto_77916 ) ) ( not ( = ?auto_77914 ?auto_77917 ) ) ( not ( = ?auto_77914 ?auto_77918 ) ) ( not ( = ?auto_77914 ?auto_77919 ) ) ( not ( = ?auto_77915 ?auto_77916 ) ) ( not ( = ?auto_77915 ?auto_77917 ) ) ( not ( = ?auto_77915 ?auto_77918 ) ) ( not ( = ?auto_77915 ?auto_77919 ) ) ( not ( = ?auto_77916 ?auto_77917 ) ) ( not ( = ?auto_77916 ?auto_77918 ) ) ( not ( = ?auto_77916 ?auto_77919 ) ) ( not ( = ?auto_77917 ?auto_77918 ) ) ( not ( = ?auto_77917 ?auto_77919 ) ) ( not ( = ?auto_77918 ?auto_77919 ) ) ( ON ?auto_77917 ?auto_77918 ) ( ON ?auto_77916 ?auto_77917 ) ( ON ?auto_77915 ?auto_77916 ) ( CLEAR ?auto_77913 ) ( ON ?auto_77914 ?auto_77915 ) ( CLEAR ?auto_77914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77910 ?auto_77911 ?auto_77912 ?auto_77913 ?auto_77914 )
      ( MAKE-9PILE ?auto_77910 ?auto_77911 ?auto_77912 ?auto_77913 ?auto_77914 ?auto_77915 ?auto_77916 ?auto_77917 ?auto_77918 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77929 - BLOCK
      ?auto_77930 - BLOCK
      ?auto_77931 - BLOCK
      ?auto_77932 - BLOCK
      ?auto_77933 - BLOCK
      ?auto_77934 - BLOCK
      ?auto_77935 - BLOCK
      ?auto_77936 - BLOCK
      ?auto_77937 - BLOCK
    )
    :vars
    (
      ?auto_77938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77937 ?auto_77938 ) ( ON-TABLE ?auto_77929 ) ( ON ?auto_77930 ?auto_77929 ) ( ON ?auto_77931 ?auto_77930 ) ( not ( = ?auto_77929 ?auto_77930 ) ) ( not ( = ?auto_77929 ?auto_77931 ) ) ( not ( = ?auto_77929 ?auto_77932 ) ) ( not ( = ?auto_77929 ?auto_77933 ) ) ( not ( = ?auto_77929 ?auto_77934 ) ) ( not ( = ?auto_77929 ?auto_77935 ) ) ( not ( = ?auto_77929 ?auto_77936 ) ) ( not ( = ?auto_77929 ?auto_77937 ) ) ( not ( = ?auto_77929 ?auto_77938 ) ) ( not ( = ?auto_77930 ?auto_77931 ) ) ( not ( = ?auto_77930 ?auto_77932 ) ) ( not ( = ?auto_77930 ?auto_77933 ) ) ( not ( = ?auto_77930 ?auto_77934 ) ) ( not ( = ?auto_77930 ?auto_77935 ) ) ( not ( = ?auto_77930 ?auto_77936 ) ) ( not ( = ?auto_77930 ?auto_77937 ) ) ( not ( = ?auto_77930 ?auto_77938 ) ) ( not ( = ?auto_77931 ?auto_77932 ) ) ( not ( = ?auto_77931 ?auto_77933 ) ) ( not ( = ?auto_77931 ?auto_77934 ) ) ( not ( = ?auto_77931 ?auto_77935 ) ) ( not ( = ?auto_77931 ?auto_77936 ) ) ( not ( = ?auto_77931 ?auto_77937 ) ) ( not ( = ?auto_77931 ?auto_77938 ) ) ( not ( = ?auto_77932 ?auto_77933 ) ) ( not ( = ?auto_77932 ?auto_77934 ) ) ( not ( = ?auto_77932 ?auto_77935 ) ) ( not ( = ?auto_77932 ?auto_77936 ) ) ( not ( = ?auto_77932 ?auto_77937 ) ) ( not ( = ?auto_77932 ?auto_77938 ) ) ( not ( = ?auto_77933 ?auto_77934 ) ) ( not ( = ?auto_77933 ?auto_77935 ) ) ( not ( = ?auto_77933 ?auto_77936 ) ) ( not ( = ?auto_77933 ?auto_77937 ) ) ( not ( = ?auto_77933 ?auto_77938 ) ) ( not ( = ?auto_77934 ?auto_77935 ) ) ( not ( = ?auto_77934 ?auto_77936 ) ) ( not ( = ?auto_77934 ?auto_77937 ) ) ( not ( = ?auto_77934 ?auto_77938 ) ) ( not ( = ?auto_77935 ?auto_77936 ) ) ( not ( = ?auto_77935 ?auto_77937 ) ) ( not ( = ?auto_77935 ?auto_77938 ) ) ( not ( = ?auto_77936 ?auto_77937 ) ) ( not ( = ?auto_77936 ?auto_77938 ) ) ( not ( = ?auto_77937 ?auto_77938 ) ) ( ON ?auto_77936 ?auto_77937 ) ( ON ?auto_77935 ?auto_77936 ) ( ON ?auto_77934 ?auto_77935 ) ( ON ?auto_77933 ?auto_77934 ) ( CLEAR ?auto_77931 ) ( ON ?auto_77932 ?auto_77933 ) ( CLEAR ?auto_77932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77929 ?auto_77930 ?auto_77931 ?auto_77932 )
      ( MAKE-9PILE ?auto_77929 ?auto_77930 ?auto_77931 ?auto_77932 ?auto_77933 ?auto_77934 ?auto_77935 ?auto_77936 ?auto_77937 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77948 - BLOCK
      ?auto_77949 - BLOCK
      ?auto_77950 - BLOCK
      ?auto_77951 - BLOCK
      ?auto_77952 - BLOCK
      ?auto_77953 - BLOCK
      ?auto_77954 - BLOCK
      ?auto_77955 - BLOCK
      ?auto_77956 - BLOCK
    )
    :vars
    (
      ?auto_77957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77956 ?auto_77957 ) ( ON-TABLE ?auto_77948 ) ( ON ?auto_77949 ?auto_77948 ) ( ON ?auto_77950 ?auto_77949 ) ( not ( = ?auto_77948 ?auto_77949 ) ) ( not ( = ?auto_77948 ?auto_77950 ) ) ( not ( = ?auto_77948 ?auto_77951 ) ) ( not ( = ?auto_77948 ?auto_77952 ) ) ( not ( = ?auto_77948 ?auto_77953 ) ) ( not ( = ?auto_77948 ?auto_77954 ) ) ( not ( = ?auto_77948 ?auto_77955 ) ) ( not ( = ?auto_77948 ?auto_77956 ) ) ( not ( = ?auto_77948 ?auto_77957 ) ) ( not ( = ?auto_77949 ?auto_77950 ) ) ( not ( = ?auto_77949 ?auto_77951 ) ) ( not ( = ?auto_77949 ?auto_77952 ) ) ( not ( = ?auto_77949 ?auto_77953 ) ) ( not ( = ?auto_77949 ?auto_77954 ) ) ( not ( = ?auto_77949 ?auto_77955 ) ) ( not ( = ?auto_77949 ?auto_77956 ) ) ( not ( = ?auto_77949 ?auto_77957 ) ) ( not ( = ?auto_77950 ?auto_77951 ) ) ( not ( = ?auto_77950 ?auto_77952 ) ) ( not ( = ?auto_77950 ?auto_77953 ) ) ( not ( = ?auto_77950 ?auto_77954 ) ) ( not ( = ?auto_77950 ?auto_77955 ) ) ( not ( = ?auto_77950 ?auto_77956 ) ) ( not ( = ?auto_77950 ?auto_77957 ) ) ( not ( = ?auto_77951 ?auto_77952 ) ) ( not ( = ?auto_77951 ?auto_77953 ) ) ( not ( = ?auto_77951 ?auto_77954 ) ) ( not ( = ?auto_77951 ?auto_77955 ) ) ( not ( = ?auto_77951 ?auto_77956 ) ) ( not ( = ?auto_77951 ?auto_77957 ) ) ( not ( = ?auto_77952 ?auto_77953 ) ) ( not ( = ?auto_77952 ?auto_77954 ) ) ( not ( = ?auto_77952 ?auto_77955 ) ) ( not ( = ?auto_77952 ?auto_77956 ) ) ( not ( = ?auto_77952 ?auto_77957 ) ) ( not ( = ?auto_77953 ?auto_77954 ) ) ( not ( = ?auto_77953 ?auto_77955 ) ) ( not ( = ?auto_77953 ?auto_77956 ) ) ( not ( = ?auto_77953 ?auto_77957 ) ) ( not ( = ?auto_77954 ?auto_77955 ) ) ( not ( = ?auto_77954 ?auto_77956 ) ) ( not ( = ?auto_77954 ?auto_77957 ) ) ( not ( = ?auto_77955 ?auto_77956 ) ) ( not ( = ?auto_77955 ?auto_77957 ) ) ( not ( = ?auto_77956 ?auto_77957 ) ) ( ON ?auto_77955 ?auto_77956 ) ( ON ?auto_77954 ?auto_77955 ) ( ON ?auto_77953 ?auto_77954 ) ( ON ?auto_77952 ?auto_77953 ) ( CLEAR ?auto_77950 ) ( ON ?auto_77951 ?auto_77952 ) ( CLEAR ?auto_77951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77948 ?auto_77949 ?auto_77950 ?auto_77951 )
      ( MAKE-9PILE ?auto_77948 ?auto_77949 ?auto_77950 ?auto_77951 ?auto_77952 ?auto_77953 ?auto_77954 ?auto_77955 ?auto_77956 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77967 - BLOCK
      ?auto_77968 - BLOCK
      ?auto_77969 - BLOCK
      ?auto_77970 - BLOCK
      ?auto_77971 - BLOCK
      ?auto_77972 - BLOCK
      ?auto_77973 - BLOCK
      ?auto_77974 - BLOCK
      ?auto_77975 - BLOCK
    )
    :vars
    (
      ?auto_77976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77975 ?auto_77976 ) ( ON-TABLE ?auto_77967 ) ( ON ?auto_77968 ?auto_77967 ) ( not ( = ?auto_77967 ?auto_77968 ) ) ( not ( = ?auto_77967 ?auto_77969 ) ) ( not ( = ?auto_77967 ?auto_77970 ) ) ( not ( = ?auto_77967 ?auto_77971 ) ) ( not ( = ?auto_77967 ?auto_77972 ) ) ( not ( = ?auto_77967 ?auto_77973 ) ) ( not ( = ?auto_77967 ?auto_77974 ) ) ( not ( = ?auto_77967 ?auto_77975 ) ) ( not ( = ?auto_77967 ?auto_77976 ) ) ( not ( = ?auto_77968 ?auto_77969 ) ) ( not ( = ?auto_77968 ?auto_77970 ) ) ( not ( = ?auto_77968 ?auto_77971 ) ) ( not ( = ?auto_77968 ?auto_77972 ) ) ( not ( = ?auto_77968 ?auto_77973 ) ) ( not ( = ?auto_77968 ?auto_77974 ) ) ( not ( = ?auto_77968 ?auto_77975 ) ) ( not ( = ?auto_77968 ?auto_77976 ) ) ( not ( = ?auto_77969 ?auto_77970 ) ) ( not ( = ?auto_77969 ?auto_77971 ) ) ( not ( = ?auto_77969 ?auto_77972 ) ) ( not ( = ?auto_77969 ?auto_77973 ) ) ( not ( = ?auto_77969 ?auto_77974 ) ) ( not ( = ?auto_77969 ?auto_77975 ) ) ( not ( = ?auto_77969 ?auto_77976 ) ) ( not ( = ?auto_77970 ?auto_77971 ) ) ( not ( = ?auto_77970 ?auto_77972 ) ) ( not ( = ?auto_77970 ?auto_77973 ) ) ( not ( = ?auto_77970 ?auto_77974 ) ) ( not ( = ?auto_77970 ?auto_77975 ) ) ( not ( = ?auto_77970 ?auto_77976 ) ) ( not ( = ?auto_77971 ?auto_77972 ) ) ( not ( = ?auto_77971 ?auto_77973 ) ) ( not ( = ?auto_77971 ?auto_77974 ) ) ( not ( = ?auto_77971 ?auto_77975 ) ) ( not ( = ?auto_77971 ?auto_77976 ) ) ( not ( = ?auto_77972 ?auto_77973 ) ) ( not ( = ?auto_77972 ?auto_77974 ) ) ( not ( = ?auto_77972 ?auto_77975 ) ) ( not ( = ?auto_77972 ?auto_77976 ) ) ( not ( = ?auto_77973 ?auto_77974 ) ) ( not ( = ?auto_77973 ?auto_77975 ) ) ( not ( = ?auto_77973 ?auto_77976 ) ) ( not ( = ?auto_77974 ?auto_77975 ) ) ( not ( = ?auto_77974 ?auto_77976 ) ) ( not ( = ?auto_77975 ?auto_77976 ) ) ( ON ?auto_77974 ?auto_77975 ) ( ON ?auto_77973 ?auto_77974 ) ( ON ?auto_77972 ?auto_77973 ) ( ON ?auto_77971 ?auto_77972 ) ( ON ?auto_77970 ?auto_77971 ) ( CLEAR ?auto_77968 ) ( ON ?auto_77969 ?auto_77970 ) ( CLEAR ?auto_77969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77967 ?auto_77968 ?auto_77969 )
      ( MAKE-9PILE ?auto_77967 ?auto_77968 ?auto_77969 ?auto_77970 ?auto_77971 ?auto_77972 ?auto_77973 ?auto_77974 ?auto_77975 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_77986 - BLOCK
      ?auto_77987 - BLOCK
      ?auto_77988 - BLOCK
      ?auto_77989 - BLOCK
      ?auto_77990 - BLOCK
      ?auto_77991 - BLOCK
      ?auto_77992 - BLOCK
      ?auto_77993 - BLOCK
      ?auto_77994 - BLOCK
    )
    :vars
    (
      ?auto_77995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77994 ?auto_77995 ) ( ON-TABLE ?auto_77986 ) ( ON ?auto_77987 ?auto_77986 ) ( not ( = ?auto_77986 ?auto_77987 ) ) ( not ( = ?auto_77986 ?auto_77988 ) ) ( not ( = ?auto_77986 ?auto_77989 ) ) ( not ( = ?auto_77986 ?auto_77990 ) ) ( not ( = ?auto_77986 ?auto_77991 ) ) ( not ( = ?auto_77986 ?auto_77992 ) ) ( not ( = ?auto_77986 ?auto_77993 ) ) ( not ( = ?auto_77986 ?auto_77994 ) ) ( not ( = ?auto_77986 ?auto_77995 ) ) ( not ( = ?auto_77987 ?auto_77988 ) ) ( not ( = ?auto_77987 ?auto_77989 ) ) ( not ( = ?auto_77987 ?auto_77990 ) ) ( not ( = ?auto_77987 ?auto_77991 ) ) ( not ( = ?auto_77987 ?auto_77992 ) ) ( not ( = ?auto_77987 ?auto_77993 ) ) ( not ( = ?auto_77987 ?auto_77994 ) ) ( not ( = ?auto_77987 ?auto_77995 ) ) ( not ( = ?auto_77988 ?auto_77989 ) ) ( not ( = ?auto_77988 ?auto_77990 ) ) ( not ( = ?auto_77988 ?auto_77991 ) ) ( not ( = ?auto_77988 ?auto_77992 ) ) ( not ( = ?auto_77988 ?auto_77993 ) ) ( not ( = ?auto_77988 ?auto_77994 ) ) ( not ( = ?auto_77988 ?auto_77995 ) ) ( not ( = ?auto_77989 ?auto_77990 ) ) ( not ( = ?auto_77989 ?auto_77991 ) ) ( not ( = ?auto_77989 ?auto_77992 ) ) ( not ( = ?auto_77989 ?auto_77993 ) ) ( not ( = ?auto_77989 ?auto_77994 ) ) ( not ( = ?auto_77989 ?auto_77995 ) ) ( not ( = ?auto_77990 ?auto_77991 ) ) ( not ( = ?auto_77990 ?auto_77992 ) ) ( not ( = ?auto_77990 ?auto_77993 ) ) ( not ( = ?auto_77990 ?auto_77994 ) ) ( not ( = ?auto_77990 ?auto_77995 ) ) ( not ( = ?auto_77991 ?auto_77992 ) ) ( not ( = ?auto_77991 ?auto_77993 ) ) ( not ( = ?auto_77991 ?auto_77994 ) ) ( not ( = ?auto_77991 ?auto_77995 ) ) ( not ( = ?auto_77992 ?auto_77993 ) ) ( not ( = ?auto_77992 ?auto_77994 ) ) ( not ( = ?auto_77992 ?auto_77995 ) ) ( not ( = ?auto_77993 ?auto_77994 ) ) ( not ( = ?auto_77993 ?auto_77995 ) ) ( not ( = ?auto_77994 ?auto_77995 ) ) ( ON ?auto_77993 ?auto_77994 ) ( ON ?auto_77992 ?auto_77993 ) ( ON ?auto_77991 ?auto_77992 ) ( ON ?auto_77990 ?auto_77991 ) ( ON ?auto_77989 ?auto_77990 ) ( CLEAR ?auto_77987 ) ( ON ?auto_77988 ?auto_77989 ) ( CLEAR ?auto_77988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77986 ?auto_77987 ?auto_77988 )
      ( MAKE-9PILE ?auto_77986 ?auto_77987 ?auto_77988 ?auto_77989 ?auto_77990 ?auto_77991 ?auto_77992 ?auto_77993 ?auto_77994 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_78005 - BLOCK
      ?auto_78006 - BLOCK
      ?auto_78007 - BLOCK
      ?auto_78008 - BLOCK
      ?auto_78009 - BLOCK
      ?auto_78010 - BLOCK
      ?auto_78011 - BLOCK
      ?auto_78012 - BLOCK
      ?auto_78013 - BLOCK
    )
    :vars
    (
      ?auto_78014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78013 ?auto_78014 ) ( ON-TABLE ?auto_78005 ) ( not ( = ?auto_78005 ?auto_78006 ) ) ( not ( = ?auto_78005 ?auto_78007 ) ) ( not ( = ?auto_78005 ?auto_78008 ) ) ( not ( = ?auto_78005 ?auto_78009 ) ) ( not ( = ?auto_78005 ?auto_78010 ) ) ( not ( = ?auto_78005 ?auto_78011 ) ) ( not ( = ?auto_78005 ?auto_78012 ) ) ( not ( = ?auto_78005 ?auto_78013 ) ) ( not ( = ?auto_78005 ?auto_78014 ) ) ( not ( = ?auto_78006 ?auto_78007 ) ) ( not ( = ?auto_78006 ?auto_78008 ) ) ( not ( = ?auto_78006 ?auto_78009 ) ) ( not ( = ?auto_78006 ?auto_78010 ) ) ( not ( = ?auto_78006 ?auto_78011 ) ) ( not ( = ?auto_78006 ?auto_78012 ) ) ( not ( = ?auto_78006 ?auto_78013 ) ) ( not ( = ?auto_78006 ?auto_78014 ) ) ( not ( = ?auto_78007 ?auto_78008 ) ) ( not ( = ?auto_78007 ?auto_78009 ) ) ( not ( = ?auto_78007 ?auto_78010 ) ) ( not ( = ?auto_78007 ?auto_78011 ) ) ( not ( = ?auto_78007 ?auto_78012 ) ) ( not ( = ?auto_78007 ?auto_78013 ) ) ( not ( = ?auto_78007 ?auto_78014 ) ) ( not ( = ?auto_78008 ?auto_78009 ) ) ( not ( = ?auto_78008 ?auto_78010 ) ) ( not ( = ?auto_78008 ?auto_78011 ) ) ( not ( = ?auto_78008 ?auto_78012 ) ) ( not ( = ?auto_78008 ?auto_78013 ) ) ( not ( = ?auto_78008 ?auto_78014 ) ) ( not ( = ?auto_78009 ?auto_78010 ) ) ( not ( = ?auto_78009 ?auto_78011 ) ) ( not ( = ?auto_78009 ?auto_78012 ) ) ( not ( = ?auto_78009 ?auto_78013 ) ) ( not ( = ?auto_78009 ?auto_78014 ) ) ( not ( = ?auto_78010 ?auto_78011 ) ) ( not ( = ?auto_78010 ?auto_78012 ) ) ( not ( = ?auto_78010 ?auto_78013 ) ) ( not ( = ?auto_78010 ?auto_78014 ) ) ( not ( = ?auto_78011 ?auto_78012 ) ) ( not ( = ?auto_78011 ?auto_78013 ) ) ( not ( = ?auto_78011 ?auto_78014 ) ) ( not ( = ?auto_78012 ?auto_78013 ) ) ( not ( = ?auto_78012 ?auto_78014 ) ) ( not ( = ?auto_78013 ?auto_78014 ) ) ( ON ?auto_78012 ?auto_78013 ) ( ON ?auto_78011 ?auto_78012 ) ( ON ?auto_78010 ?auto_78011 ) ( ON ?auto_78009 ?auto_78010 ) ( ON ?auto_78008 ?auto_78009 ) ( ON ?auto_78007 ?auto_78008 ) ( CLEAR ?auto_78005 ) ( ON ?auto_78006 ?auto_78007 ) ( CLEAR ?auto_78006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78005 ?auto_78006 )
      ( MAKE-9PILE ?auto_78005 ?auto_78006 ?auto_78007 ?auto_78008 ?auto_78009 ?auto_78010 ?auto_78011 ?auto_78012 ?auto_78013 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_78024 - BLOCK
      ?auto_78025 - BLOCK
      ?auto_78026 - BLOCK
      ?auto_78027 - BLOCK
      ?auto_78028 - BLOCK
      ?auto_78029 - BLOCK
      ?auto_78030 - BLOCK
      ?auto_78031 - BLOCK
      ?auto_78032 - BLOCK
    )
    :vars
    (
      ?auto_78033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78032 ?auto_78033 ) ( ON-TABLE ?auto_78024 ) ( not ( = ?auto_78024 ?auto_78025 ) ) ( not ( = ?auto_78024 ?auto_78026 ) ) ( not ( = ?auto_78024 ?auto_78027 ) ) ( not ( = ?auto_78024 ?auto_78028 ) ) ( not ( = ?auto_78024 ?auto_78029 ) ) ( not ( = ?auto_78024 ?auto_78030 ) ) ( not ( = ?auto_78024 ?auto_78031 ) ) ( not ( = ?auto_78024 ?auto_78032 ) ) ( not ( = ?auto_78024 ?auto_78033 ) ) ( not ( = ?auto_78025 ?auto_78026 ) ) ( not ( = ?auto_78025 ?auto_78027 ) ) ( not ( = ?auto_78025 ?auto_78028 ) ) ( not ( = ?auto_78025 ?auto_78029 ) ) ( not ( = ?auto_78025 ?auto_78030 ) ) ( not ( = ?auto_78025 ?auto_78031 ) ) ( not ( = ?auto_78025 ?auto_78032 ) ) ( not ( = ?auto_78025 ?auto_78033 ) ) ( not ( = ?auto_78026 ?auto_78027 ) ) ( not ( = ?auto_78026 ?auto_78028 ) ) ( not ( = ?auto_78026 ?auto_78029 ) ) ( not ( = ?auto_78026 ?auto_78030 ) ) ( not ( = ?auto_78026 ?auto_78031 ) ) ( not ( = ?auto_78026 ?auto_78032 ) ) ( not ( = ?auto_78026 ?auto_78033 ) ) ( not ( = ?auto_78027 ?auto_78028 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) ( not ( = ?auto_78027 ?auto_78030 ) ) ( not ( = ?auto_78027 ?auto_78031 ) ) ( not ( = ?auto_78027 ?auto_78032 ) ) ( not ( = ?auto_78027 ?auto_78033 ) ) ( not ( = ?auto_78028 ?auto_78029 ) ) ( not ( = ?auto_78028 ?auto_78030 ) ) ( not ( = ?auto_78028 ?auto_78031 ) ) ( not ( = ?auto_78028 ?auto_78032 ) ) ( not ( = ?auto_78028 ?auto_78033 ) ) ( not ( = ?auto_78029 ?auto_78030 ) ) ( not ( = ?auto_78029 ?auto_78031 ) ) ( not ( = ?auto_78029 ?auto_78032 ) ) ( not ( = ?auto_78029 ?auto_78033 ) ) ( not ( = ?auto_78030 ?auto_78031 ) ) ( not ( = ?auto_78030 ?auto_78032 ) ) ( not ( = ?auto_78030 ?auto_78033 ) ) ( not ( = ?auto_78031 ?auto_78032 ) ) ( not ( = ?auto_78031 ?auto_78033 ) ) ( not ( = ?auto_78032 ?auto_78033 ) ) ( ON ?auto_78031 ?auto_78032 ) ( ON ?auto_78030 ?auto_78031 ) ( ON ?auto_78029 ?auto_78030 ) ( ON ?auto_78028 ?auto_78029 ) ( ON ?auto_78027 ?auto_78028 ) ( ON ?auto_78026 ?auto_78027 ) ( CLEAR ?auto_78024 ) ( ON ?auto_78025 ?auto_78026 ) ( CLEAR ?auto_78025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78024 ?auto_78025 )
      ( MAKE-9PILE ?auto_78024 ?auto_78025 ?auto_78026 ?auto_78027 ?auto_78028 ?auto_78029 ?auto_78030 ?auto_78031 ?auto_78032 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_78043 - BLOCK
      ?auto_78044 - BLOCK
      ?auto_78045 - BLOCK
      ?auto_78046 - BLOCK
      ?auto_78047 - BLOCK
      ?auto_78048 - BLOCK
      ?auto_78049 - BLOCK
      ?auto_78050 - BLOCK
      ?auto_78051 - BLOCK
    )
    :vars
    (
      ?auto_78052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78051 ?auto_78052 ) ( not ( = ?auto_78043 ?auto_78044 ) ) ( not ( = ?auto_78043 ?auto_78045 ) ) ( not ( = ?auto_78043 ?auto_78046 ) ) ( not ( = ?auto_78043 ?auto_78047 ) ) ( not ( = ?auto_78043 ?auto_78048 ) ) ( not ( = ?auto_78043 ?auto_78049 ) ) ( not ( = ?auto_78043 ?auto_78050 ) ) ( not ( = ?auto_78043 ?auto_78051 ) ) ( not ( = ?auto_78043 ?auto_78052 ) ) ( not ( = ?auto_78044 ?auto_78045 ) ) ( not ( = ?auto_78044 ?auto_78046 ) ) ( not ( = ?auto_78044 ?auto_78047 ) ) ( not ( = ?auto_78044 ?auto_78048 ) ) ( not ( = ?auto_78044 ?auto_78049 ) ) ( not ( = ?auto_78044 ?auto_78050 ) ) ( not ( = ?auto_78044 ?auto_78051 ) ) ( not ( = ?auto_78044 ?auto_78052 ) ) ( not ( = ?auto_78045 ?auto_78046 ) ) ( not ( = ?auto_78045 ?auto_78047 ) ) ( not ( = ?auto_78045 ?auto_78048 ) ) ( not ( = ?auto_78045 ?auto_78049 ) ) ( not ( = ?auto_78045 ?auto_78050 ) ) ( not ( = ?auto_78045 ?auto_78051 ) ) ( not ( = ?auto_78045 ?auto_78052 ) ) ( not ( = ?auto_78046 ?auto_78047 ) ) ( not ( = ?auto_78046 ?auto_78048 ) ) ( not ( = ?auto_78046 ?auto_78049 ) ) ( not ( = ?auto_78046 ?auto_78050 ) ) ( not ( = ?auto_78046 ?auto_78051 ) ) ( not ( = ?auto_78046 ?auto_78052 ) ) ( not ( = ?auto_78047 ?auto_78048 ) ) ( not ( = ?auto_78047 ?auto_78049 ) ) ( not ( = ?auto_78047 ?auto_78050 ) ) ( not ( = ?auto_78047 ?auto_78051 ) ) ( not ( = ?auto_78047 ?auto_78052 ) ) ( not ( = ?auto_78048 ?auto_78049 ) ) ( not ( = ?auto_78048 ?auto_78050 ) ) ( not ( = ?auto_78048 ?auto_78051 ) ) ( not ( = ?auto_78048 ?auto_78052 ) ) ( not ( = ?auto_78049 ?auto_78050 ) ) ( not ( = ?auto_78049 ?auto_78051 ) ) ( not ( = ?auto_78049 ?auto_78052 ) ) ( not ( = ?auto_78050 ?auto_78051 ) ) ( not ( = ?auto_78050 ?auto_78052 ) ) ( not ( = ?auto_78051 ?auto_78052 ) ) ( ON ?auto_78050 ?auto_78051 ) ( ON ?auto_78049 ?auto_78050 ) ( ON ?auto_78048 ?auto_78049 ) ( ON ?auto_78047 ?auto_78048 ) ( ON ?auto_78046 ?auto_78047 ) ( ON ?auto_78045 ?auto_78046 ) ( ON ?auto_78044 ?auto_78045 ) ( ON ?auto_78043 ?auto_78044 ) ( CLEAR ?auto_78043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78043 )
      ( MAKE-9PILE ?auto_78043 ?auto_78044 ?auto_78045 ?auto_78046 ?auto_78047 ?auto_78048 ?auto_78049 ?auto_78050 ?auto_78051 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_78062 - BLOCK
      ?auto_78063 - BLOCK
      ?auto_78064 - BLOCK
      ?auto_78065 - BLOCK
      ?auto_78066 - BLOCK
      ?auto_78067 - BLOCK
      ?auto_78068 - BLOCK
      ?auto_78069 - BLOCK
      ?auto_78070 - BLOCK
    )
    :vars
    (
      ?auto_78071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78070 ?auto_78071 ) ( not ( = ?auto_78062 ?auto_78063 ) ) ( not ( = ?auto_78062 ?auto_78064 ) ) ( not ( = ?auto_78062 ?auto_78065 ) ) ( not ( = ?auto_78062 ?auto_78066 ) ) ( not ( = ?auto_78062 ?auto_78067 ) ) ( not ( = ?auto_78062 ?auto_78068 ) ) ( not ( = ?auto_78062 ?auto_78069 ) ) ( not ( = ?auto_78062 ?auto_78070 ) ) ( not ( = ?auto_78062 ?auto_78071 ) ) ( not ( = ?auto_78063 ?auto_78064 ) ) ( not ( = ?auto_78063 ?auto_78065 ) ) ( not ( = ?auto_78063 ?auto_78066 ) ) ( not ( = ?auto_78063 ?auto_78067 ) ) ( not ( = ?auto_78063 ?auto_78068 ) ) ( not ( = ?auto_78063 ?auto_78069 ) ) ( not ( = ?auto_78063 ?auto_78070 ) ) ( not ( = ?auto_78063 ?auto_78071 ) ) ( not ( = ?auto_78064 ?auto_78065 ) ) ( not ( = ?auto_78064 ?auto_78066 ) ) ( not ( = ?auto_78064 ?auto_78067 ) ) ( not ( = ?auto_78064 ?auto_78068 ) ) ( not ( = ?auto_78064 ?auto_78069 ) ) ( not ( = ?auto_78064 ?auto_78070 ) ) ( not ( = ?auto_78064 ?auto_78071 ) ) ( not ( = ?auto_78065 ?auto_78066 ) ) ( not ( = ?auto_78065 ?auto_78067 ) ) ( not ( = ?auto_78065 ?auto_78068 ) ) ( not ( = ?auto_78065 ?auto_78069 ) ) ( not ( = ?auto_78065 ?auto_78070 ) ) ( not ( = ?auto_78065 ?auto_78071 ) ) ( not ( = ?auto_78066 ?auto_78067 ) ) ( not ( = ?auto_78066 ?auto_78068 ) ) ( not ( = ?auto_78066 ?auto_78069 ) ) ( not ( = ?auto_78066 ?auto_78070 ) ) ( not ( = ?auto_78066 ?auto_78071 ) ) ( not ( = ?auto_78067 ?auto_78068 ) ) ( not ( = ?auto_78067 ?auto_78069 ) ) ( not ( = ?auto_78067 ?auto_78070 ) ) ( not ( = ?auto_78067 ?auto_78071 ) ) ( not ( = ?auto_78068 ?auto_78069 ) ) ( not ( = ?auto_78068 ?auto_78070 ) ) ( not ( = ?auto_78068 ?auto_78071 ) ) ( not ( = ?auto_78069 ?auto_78070 ) ) ( not ( = ?auto_78069 ?auto_78071 ) ) ( not ( = ?auto_78070 ?auto_78071 ) ) ( ON ?auto_78069 ?auto_78070 ) ( ON ?auto_78068 ?auto_78069 ) ( ON ?auto_78067 ?auto_78068 ) ( ON ?auto_78066 ?auto_78067 ) ( ON ?auto_78065 ?auto_78066 ) ( ON ?auto_78064 ?auto_78065 ) ( ON ?auto_78063 ?auto_78064 ) ( ON ?auto_78062 ?auto_78063 ) ( CLEAR ?auto_78062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78062 )
      ( MAKE-9PILE ?auto_78062 ?auto_78063 ?auto_78064 ?auto_78065 ?auto_78066 ?auto_78067 ?auto_78068 ?auto_78069 ?auto_78070 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78082 - BLOCK
      ?auto_78083 - BLOCK
      ?auto_78084 - BLOCK
      ?auto_78085 - BLOCK
      ?auto_78086 - BLOCK
      ?auto_78087 - BLOCK
      ?auto_78088 - BLOCK
      ?auto_78089 - BLOCK
      ?auto_78090 - BLOCK
      ?auto_78091 - BLOCK
    )
    :vars
    (
      ?auto_78092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78090 ) ( ON ?auto_78091 ?auto_78092 ) ( CLEAR ?auto_78091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78082 ) ( ON ?auto_78083 ?auto_78082 ) ( ON ?auto_78084 ?auto_78083 ) ( ON ?auto_78085 ?auto_78084 ) ( ON ?auto_78086 ?auto_78085 ) ( ON ?auto_78087 ?auto_78086 ) ( ON ?auto_78088 ?auto_78087 ) ( ON ?auto_78089 ?auto_78088 ) ( ON ?auto_78090 ?auto_78089 ) ( not ( = ?auto_78082 ?auto_78083 ) ) ( not ( = ?auto_78082 ?auto_78084 ) ) ( not ( = ?auto_78082 ?auto_78085 ) ) ( not ( = ?auto_78082 ?auto_78086 ) ) ( not ( = ?auto_78082 ?auto_78087 ) ) ( not ( = ?auto_78082 ?auto_78088 ) ) ( not ( = ?auto_78082 ?auto_78089 ) ) ( not ( = ?auto_78082 ?auto_78090 ) ) ( not ( = ?auto_78082 ?auto_78091 ) ) ( not ( = ?auto_78082 ?auto_78092 ) ) ( not ( = ?auto_78083 ?auto_78084 ) ) ( not ( = ?auto_78083 ?auto_78085 ) ) ( not ( = ?auto_78083 ?auto_78086 ) ) ( not ( = ?auto_78083 ?auto_78087 ) ) ( not ( = ?auto_78083 ?auto_78088 ) ) ( not ( = ?auto_78083 ?auto_78089 ) ) ( not ( = ?auto_78083 ?auto_78090 ) ) ( not ( = ?auto_78083 ?auto_78091 ) ) ( not ( = ?auto_78083 ?auto_78092 ) ) ( not ( = ?auto_78084 ?auto_78085 ) ) ( not ( = ?auto_78084 ?auto_78086 ) ) ( not ( = ?auto_78084 ?auto_78087 ) ) ( not ( = ?auto_78084 ?auto_78088 ) ) ( not ( = ?auto_78084 ?auto_78089 ) ) ( not ( = ?auto_78084 ?auto_78090 ) ) ( not ( = ?auto_78084 ?auto_78091 ) ) ( not ( = ?auto_78084 ?auto_78092 ) ) ( not ( = ?auto_78085 ?auto_78086 ) ) ( not ( = ?auto_78085 ?auto_78087 ) ) ( not ( = ?auto_78085 ?auto_78088 ) ) ( not ( = ?auto_78085 ?auto_78089 ) ) ( not ( = ?auto_78085 ?auto_78090 ) ) ( not ( = ?auto_78085 ?auto_78091 ) ) ( not ( = ?auto_78085 ?auto_78092 ) ) ( not ( = ?auto_78086 ?auto_78087 ) ) ( not ( = ?auto_78086 ?auto_78088 ) ) ( not ( = ?auto_78086 ?auto_78089 ) ) ( not ( = ?auto_78086 ?auto_78090 ) ) ( not ( = ?auto_78086 ?auto_78091 ) ) ( not ( = ?auto_78086 ?auto_78092 ) ) ( not ( = ?auto_78087 ?auto_78088 ) ) ( not ( = ?auto_78087 ?auto_78089 ) ) ( not ( = ?auto_78087 ?auto_78090 ) ) ( not ( = ?auto_78087 ?auto_78091 ) ) ( not ( = ?auto_78087 ?auto_78092 ) ) ( not ( = ?auto_78088 ?auto_78089 ) ) ( not ( = ?auto_78088 ?auto_78090 ) ) ( not ( = ?auto_78088 ?auto_78091 ) ) ( not ( = ?auto_78088 ?auto_78092 ) ) ( not ( = ?auto_78089 ?auto_78090 ) ) ( not ( = ?auto_78089 ?auto_78091 ) ) ( not ( = ?auto_78089 ?auto_78092 ) ) ( not ( = ?auto_78090 ?auto_78091 ) ) ( not ( = ?auto_78090 ?auto_78092 ) ) ( not ( = ?auto_78091 ?auto_78092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78091 ?auto_78092 )
      ( !STACK ?auto_78091 ?auto_78090 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78103 - BLOCK
      ?auto_78104 - BLOCK
      ?auto_78105 - BLOCK
      ?auto_78106 - BLOCK
      ?auto_78107 - BLOCK
      ?auto_78108 - BLOCK
      ?auto_78109 - BLOCK
      ?auto_78110 - BLOCK
      ?auto_78111 - BLOCK
      ?auto_78112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78111 ) ( ON-TABLE ?auto_78112 ) ( CLEAR ?auto_78112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78103 ) ( ON ?auto_78104 ?auto_78103 ) ( ON ?auto_78105 ?auto_78104 ) ( ON ?auto_78106 ?auto_78105 ) ( ON ?auto_78107 ?auto_78106 ) ( ON ?auto_78108 ?auto_78107 ) ( ON ?auto_78109 ?auto_78108 ) ( ON ?auto_78110 ?auto_78109 ) ( ON ?auto_78111 ?auto_78110 ) ( not ( = ?auto_78103 ?auto_78104 ) ) ( not ( = ?auto_78103 ?auto_78105 ) ) ( not ( = ?auto_78103 ?auto_78106 ) ) ( not ( = ?auto_78103 ?auto_78107 ) ) ( not ( = ?auto_78103 ?auto_78108 ) ) ( not ( = ?auto_78103 ?auto_78109 ) ) ( not ( = ?auto_78103 ?auto_78110 ) ) ( not ( = ?auto_78103 ?auto_78111 ) ) ( not ( = ?auto_78103 ?auto_78112 ) ) ( not ( = ?auto_78104 ?auto_78105 ) ) ( not ( = ?auto_78104 ?auto_78106 ) ) ( not ( = ?auto_78104 ?auto_78107 ) ) ( not ( = ?auto_78104 ?auto_78108 ) ) ( not ( = ?auto_78104 ?auto_78109 ) ) ( not ( = ?auto_78104 ?auto_78110 ) ) ( not ( = ?auto_78104 ?auto_78111 ) ) ( not ( = ?auto_78104 ?auto_78112 ) ) ( not ( = ?auto_78105 ?auto_78106 ) ) ( not ( = ?auto_78105 ?auto_78107 ) ) ( not ( = ?auto_78105 ?auto_78108 ) ) ( not ( = ?auto_78105 ?auto_78109 ) ) ( not ( = ?auto_78105 ?auto_78110 ) ) ( not ( = ?auto_78105 ?auto_78111 ) ) ( not ( = ?auto_78105 ?auto_78112 ) ) ( not ( = ?auto_78106 ?auto_78107 ) ) ( not ( = ?auto_78106 ?auto_78108 ) ) ( not ( = ?auto_78106 ?auto_78109 ) ) ( not ( = ?auto_78106 ?auto_78110 ) ) ( not ( = ?auto_78106 ?auto_78111 ) ) ( not ( = ?auto_78106 ?auto_78112 ) ) ( not ( = ?auto_78107 ?auto_78108 ) ) ( not ( = ?auto_78107 ?auto_78109 ) ) ( not ( = ?auto_78107 ?auto_78110 ) ) ( not ( = ?auto_78107 ?auto_78111 ) ) ( not ( = ?auto_78107 ?auto_78112 ) ) ( not ( = ?auto_78108 ?auto_78109 ) ) ( not ( = ?auto_78108 ?auto_78110 ) ) ( not ( = ?auto_78108 ?auto_78111 ) ) ( not ( = ?auto_78108 ?auto_78112 ) ) ( not ( = ?auto_78109 ?auto_78110 ) ) ( not ( = ?auto_78109 ?auto_78111 ) ) ( not ( = ?auto_78109 ?auto_78112 ) ) ( not ( = ?auto_78110 ?auto_78111 ) ) ( not ( = ?auto_78110 ?auto_78112 ) ) ( not ( = ?auto_78111 ?auto_78112 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_78112 )
      ( !STACK ?auto_78112 ?auto_78111 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78123 - BLOCK
      ?auto_78124 - BLOCK
      ?auto_78125 - BLOCK
      ?auto_78126 - BLOCK
      ?auto_78127 - BLOCK
      ?auto_78128 - BLOCK
      ?auto_78129 - BLOCK
      ?auto_78130 - BLOCK
      ?auto_78131 - BLOCK
      ?auto_78132 - BLOCK
    )
    :vars
    (
      ?auto_78133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78132 ?auto_78133 ) ( ON-TABLE ?auto_78123 ) ( ON ?auto_78124 ?auto_78123 ) ( ON ?auto_78125 ?auto_78124 ) ( ON ?auto_78126 ?auto_78125 ) ( ON ?auto_78127 ?auto_78126 ) ( ON ?auto_78128 ?auto_78127 ) ( ON ?auto_78129 ?auto_78128 ) ( ON ?auto_78130 ?auto_78129 ) ( not ( = ?auto_78123 ?auto_78124 ) ) ( not ( = ?auto_78123 ?auto_78125 ) ) ( not ( = ?auto_78123 ?auto_78126 ) ) ( not ( = ?auto_78123 ?auto_78127 ) ) ( not ( = ?auto_78123 ?auto_78128 ) ) ( not ( = ?auto_78123 ?auto_78129 ) ) ( not ( = ?auto_78123 ?auto_78130 ) ) ( not ( = ?auto_78123 ?auto_78131 ) ) ( not ( = ?auto_78123 ?auto_78132 ) ) ( not ( = ?auto_78123 ?auto_78133 ) ) ( not ( = ?auto_78124 ?auto_78125 ) ) ( not ( = ?auto_78124 ?auto_78126 ) ) ( not ( = ?auto_78124 ?auto_78127 ) ) ( not ( = ?auto_78124 ?auto_78128 ) ) ( not ( = ?auto_78124 ?auto_78129 ) ) ( not ( = ?auto_78124 ?auto_78130 ) ) ( not ( = ?auto_78124 ?auto_78131 ) ) ( not ( = ?auto_78124 ?auto_78132 ) ) ( not ( = ?auto_78124 ?auto_78133 ) ) ( not ( = ?auto_78125 ?auto_78126 ) ) ( not ( = ?auto_78125 ?auto_78127 ) ) ( not ( = ?auto_78125 ?auto_78128 ) ) ( not ( = ?auto_78125 ?auto_78129 ) ) ( not ( = ?auto_78125 ?auto_78130 ) ) ( not ( = ?auto_78125 ?auto_78131 ) ) ( not ( = ?auto_78125 ?auto_78132 ) ) ( not ( = ?auto_78125 ?auto_78133 ) ) ( not ( = ?auto_78126 ?auto_78127 ) ) ( not ( = ?auto_78126 ?auto_78128 ) ) ( not ( = ?auto_78126 ?auto_78129 ) ) ( not ( = ?auto_78126 ?auto_78130 ) ) ( not ( = ?auto_78126 ?auto_78131 ) ) ( not ( = ?auto_78126 ?auto_78132 ) ) ( not ( = ?auto_78126 ?auto_78133 ) ) ( not ( = ?auto_78127 ?auto_78128 ) ) ( not ( = ?auto_78127 ?auto_78129 ) ) ( not ( = ?auto_78127 ?auto_78130 ) ) ( not ( = ?auto_78127 ?auto_78131 ) ) ( not ( = ?auto_78127 ?auto_78132 ) ) ( not ( = ?auto_78127 ?auto_78133 ) ) ( not ( = ?auto_78128 ?auto_78129 ) ) ( not ( = ?auto_78128 ?auto_78130 ) ) ( not ( = ?auto_78128 ?auto_78131 ) ) ( not ( = ?auto_78128 ?auto_78132 ) ) ( not ( = ?auto_78128 ?auto_78133 ) ) ( not ( = ?auto_78129 ?auto_78130 ) ) ( not ( = ?auto_78129 ?auto_78131 ) ) ( not ( = ?auto_78129 ?auto_78132 ) ) ( not ( = ?auto_78129 ?auto_78133 ) ) ( not ( = ?auto_78130 ?auto_78131 ) ) ( not ( = ?auto_78130 ?auto_78132 ) ) ( not ( = ?auto_78130 ?auto_78133 ) ) ( not ( = ?auto_78131 ?auto_78132 ) ) ( not ( = ?auto_78131 ?auto_78133 ) ) ( not ( = ?auto_78132 ?auto_78133 ) ) ( CLEAR ?auto_78130 ) ( ON ?auto_78131 ?auto_78132 ) ( CLEAR ?auto_78131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_78123 ?auto_78124 ?auto_78125 ?auto_78126 ?auto_78127 ?auto_78128 ?auto_78129 ?auto_78130 ?auto_78131 )
      ( MAKE-10PILE ?auto_78123 ?auto_78124 ?auto_78125 ?auto_78126 ?auto_78127 ?auto_78128 ?auto_78129 ?auto_78130 ?auto_78131 ?auto_78132 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78144 - BLOCK
      ?auto_78145 - BLOCK
      ?auto_78146 - BLOCK
      ?auto_78147 - BLOCK
      ?auto_78148 - BLOCK
      ?auto_78149 - BLOCK
      ?auto_78150 - BLOCK
      ?auto_78151 - BLOCK
      ?auto_78152 - BLOCK
      ?auto_78153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78153 ) ( ON-TABLE ?auto_78144 ) ( ON ?auto_78145 ?auto_78144 ) ( ON ?auto_78146 ?auto_78145 ) ( ON ?auto_78147 ?auto_78146 ) ( ON ?auto_78148 ?auto_78147 ) ( ON ?auto_78149 ?auto_78148 ) ( ON ?auto_78150 ?auto_78149 ) ( ON ?auto_78151 ?auto_78150 ) ( not ( = ?auto_78144 ?auto_78145 ) ) ( not ( = ?auto_78144 ?auto_78146 ) ) ( not ( = ?auto_78144 ?auto_78147 ) ) ( not ( = ?auto_78144 ?auto_78148 ) ) ( not ( = ?auto_78144 ?auto_78149 ) ) ( not ( = ?auto_78144 ?auto_78150 ) ) ( not ( = ?auto_78144 ?auto_78151 ) ) ( not ( = ?auto_78144 ?auto_78152 ) ) ( not ( = ?auto_78144 ?auto_78153 ) ) ( not ( = ?auto_78145 ?auto_78146 ) ) ( not ( = ?auto_78145 ?auto_78147 ) ) ( not ( = ?auto_78145 ?auto_78148 ) ) ( not ( = ?auto_78145 ?auto_78149 ) ) ( not ( = ?auto_78145 ?auto_78150 ) ) ( not ( = ?auto_78145 ?auto_78151 ) ) ( not ( = ?auto_78145 ?auto_78152 ) ) ( not ( = ?auto_78145 ?auto_78153 ) ) ( not ( = ?auto_78146 ?auto_78147 ) ) ( not ( = ?auto_78146 ?auto_78148 ) ) ( not ( = ?auto_78146 ?auto_78149 ) ) ( not ( = ?auto_78146 ?auto_78150 ) ) ( not ( = ?auto_78146 ?auto_78151 ) ) ( not ( = ?auto_78146 ?auto_78152 ) ) ( not ( = ?auto_78146 ?auto_78153 ) ) ( not ( = ?auto_78147 ?auto_78148 ) ) ( not ( = ?auto_78147 ?auto_78149 ) ) ( not ( = ?auto_78147 ?auto_78150 ) ) ( not ( = ?auto_78147 ?auto_78151 ) ) ( not ( = ?auto_78147 ?auto_78152 ) ) ( not ( = ?auto_78147 ?auto_78153 ) ) ( not ( = ?auto_78148 ?auto_78149 ) ) ( not ( = ?auto_78148 ?auto_78150 ) ) ( not ( = ?auto_78148 ?auto_78151 ) ) ( not ( = ?auto_78148 ?auto_78152 ) ) ( not ( = ?auto_78148 ?auto_78153 ) ) ( not ( = ?auto_78149 ?auto_78150 ) ) ( not ( = ?auto_78149 ?auto_78151 ) ) ( not ( = ?auto_78149 ?auto_78152 ) ) ( not ( = ?auto_78149 ?auto_78153 ) ) ( not ( = ?auto_78150 ?auto_78151 ) ) ( not ( = ?auto_78150 ?auto_78152 ) ) ( not ( = ?auto_78150 ?auto_78153 ) ) ( not ( = ?auto_78151 ?auto_78152 ) ) ( not ( = ?auto_78151 ?auto_78153 ) ) ( not ( = ?auto_78152 ?auto_78153 ) ) ( CLEAR ?auto_78151 ) ( ON ?auto_78152 ?auto_78153 ) ( CLEAR ?auto_78152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_78144 ?auto_78145 ?auto_78146 ?auto_78147 ?auto_78148 ?auto_78149 ?auto_78150 ?auto_78151 ?auto_78152 )
      ( MAKE-10PILE ?auto_78144 ?auto_78145 ?auto_78146 ?auto_78147 ?auto_78148 ?auto_78149 ?auto_78150 ?auto_78151 ?auto_78152 ?auto_78153 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78164 - BLOCK
      ?auto_78165 - BLOCK
      ?auto_78166 - BLOCK
      ?auto_78167 - BLOCK
      ?auto_78168 - BLOCK
      ?auto_78169 - BLOCK
      ?auto_78170 - BLOCK
      ?auto_78171 - BLOCK
      ?auto_78172 - BLOCK
      ?auto_78173 - BLOCK
    )
    :vars
    (
      ?auto_78174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78173 ?auto_78174 ) ( ON-TABLE ?auto_78164 ) ( ON ?auto_78165 ?auto_78164 ) ( ON ?auto_78166 ?auto_78165 ) ( ON ?auto_78167 ?auto_78166 ) ( ON ?auto_78168 ?auto_78167 ) ( ON ?auto_78169 ?auto_78168 ) ( ON ?auto_78170 ?auto_78169 ) ( not ( = ?auto_78164 ?auto_78165 ) ) ( not ( = ?auto_78164 ?auto_78166 ) ) ( not ( = ?auto_78164 ?auto_78167 ) ) ( not ( = ?auto_78164 ?auto_78168 ) ) ( not ( = ?auto_78164 ?auto_78169 ) ) ( not ( = ?auto_78164 ?auto_78170 ) ) ( not ( = ?auto_78164 ?auto_78171 ) ) ( not ( = ?auto_78164 ?auto_78172 ) ) ( not ( = ?auto_78164 ?auto_78173 ) ) ( not ( = ?auto_78164 ?auto_78174 ) ) ( not ( = ?auto_78165 ?auto_78166 ) ) ( not ( = ?auto_78165 ?auto_78167 ) ) ( not ( = ?auto_78165 ?auto_78168 ) ) ( not ( = ?auto_78165 ?auto_78169 ) ) ( not ( = ?auto_78165 ?auto_78170 ) ) ( not ( = ?auto_78165 ?auto_78171 ) ) ( not ( = ?auto_78165 ?auto_78172 ) ) ( not ( = ?auto_78165 ?auto_78173 ) ) ( not ( = ?auto_78165 ?auto_78174 ) ) ( not ( = ?auto_78166 ?auto_78167 ) ) ( not ( = ?auto_78166 ?auto_78168 ) ) ( not ( = ?auto_78166 ?auto_78169 ) ) ( not ( = ?auto_78166 ?auto_78170 ) ) ( not ( = ?auto_78166 ?auto_78171 ) ) ( not ( = ?auto_78166 ?auto_78172 ) ) ( not ( = ?auto_78166 ?auto_78173 ) ) ( not ( = ?auto_78166 ?auto_78174 ) ) ( not ( = ?auto_78167 ?auto_78168 ) ) ( not ( = ?auto_78167 ?auto_78169 ) ) ( not ( = ?auto_78167 ?auto_78170 ) ) ( not ( = ?auto_78167 ?auto_78171 ) ) ( not ( = ?auto_78167 ?auto_78172 ) ) ( not ( = ?auto_78167 ?auto_78173 ) ) ( not ( = ?auto_78167 ?auto_78174 ) ) ( not ( = ?auto_78168 ?auto_78169 ) ) ( not ( = ?auto_78168 ?auto_78170 ) ) ( not ( = ?auto_78168 ?auto_78171 ) ) ( not ( = ?auto_78168 ?auto_78172 ) ) ( not ( = ?auto_78168 ?auto_78173 ) ) ( not ( = ?auto_78168 ?auto_78174 ) ) ( not ( = ?auto_78169 ?auto_78170 ) ) ( not ( = ?auto_78169 ?auto_78171 ) ) ( not ( = ?auto_78169 ?auto_78172 ) ) ( not ( = ?auto_78169 ?auto_78173 ) ) ( not ( = ?auto_78169 ?auto_78174 ) ) ( not ( = ?auto_78170 ?auto_78171 ) ) ( not ( = ?auto_78170 ?auto_78172 ) ) ( not ( = ?auto_78170 ?auto_78173 ) ) ( not ( = ?auto_78170 ?auto_78174 ) ) ( not ( = ?auto_78171 ?auto_78172 ) ) ( not ( = ?auto_78171 ?auto_78173 ) ) ( not ( = ?auto_78171 ?auto_78174 ) ) ( not ( = ?auto_78172 ?auto_78173 ) ) ( not ( = ?auto_78172 ?auto_78174 ) ) ( not ( = ?auto_78173 ?auto_78174 ) ) ( ON ?auto_78172 ?auto_78173 ) ( CLEAR ?auto_78170 ) ( ON ?auto_78171 ?auto_78172 ) ( CLEAR ?auto_78171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_78164 ?auto_78165 ?auto_78166 ?auto_78167 ?auto_78168 ?auto_78169 ?auto_78170 ?auto_78171 )
      ( MAKE-10PILE ?auto_78164 ?auto_78165 ?auto_78166 ?auto_78167 ?auto_78168 ?auto_78169 ?auto_78170 ?auto_78171 ?auto_78172 ?auto_78173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78185 - BLOCK
      ?auto_78186 - BLOCK
      ?auto_78187 - BLOCK
      ?auto_78188 - BLOCK
      ?auto_78189 - BLOCK
      ?auto_78190 - BLOCK
      ?auto_78191 - BLOCK
      ?auto_78192 - BLOCK
      ?auto_78193 - BLOCK
      ?auto_78194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78194 ) ( ON-TABLE ?auto_78185 ) ( ON ?auto_78186 ?auto_78185 ) ( ON ?auto_78187 ?auto_78186 ) ( ON ?auto_78188 ?auto_78187 ) ( ON ?auto_78189 ?auto_78188 ) ( ON ?auto_78190 ?auto_78189 ) ( ON ?auto_78191 ?auto_78190 ) ( not ( = ?auto_78185 ?auto_78186 ) ) ( not ( = ?auto_78185 ?auto_78187 ) ) ( not ( = ?auto_78185 ?auto_78188 ) ) ( not ( = ?auto_78185 ?auto_78189 ) ) ( not ( = ?auto_78185 ?auto_78190 ) ) ( not ( = ?auto_78185 ?auto_78191 ) ) ( not ( = ?auto_78185 ?auto_78192 ) ) ( not ( = ?auto_78185 ?auto_78193 ) ) ( not ( = ?auto_78185 ?auto_78194 ) ) ( not ( = ?auto_78186 ?auto_78187 ) ) ( not ( = ?auto_78186 ?auto_78188 ) ) ( not ( = ?auto_78186 ?auto_78189 ) ) ( not ( = ?auto_78186 ?auto_78190 ) ) ( not ( = ?auto_78186 ?auto_78191 ) ) ( not ( = ?auto_78186 ?auto_78192 ) ) ( not ( = ?auto_78186 ?auto_78193 ) ) ( not ( = ?auto_78186 ?auto_78194 ) ) ( not ( = ?auto_78187 ?auto_78188 ) ) ( not ( = ?auto_78187 ?auto_78189 ) ) ( not ( = ?auto_78187 ?auto_78190 ) ) ( not ( = ?auto_78187 ?auto_78191 ) ) ( not ( = ?auto_78187 ?auto_78192 ) ) ( not ( = ?auto_78187 ?auto_78193 ) ) ( not ( = ?auto_78187 ?auto_78194 ) ) ( not ( = ?auto_78188 ?auto_78189 ) ) ( not ( = ?auto_78188 ?auto_78190 ) ) ( not ( = ?auto_78188 ?auto_78191 ) ) ( not ( = ?auto_78188 ?auto_78192 ) ) ( not ( = ?auto_78188 ?auto_78193 ) ) ( not ( = ?auto_78188 ?auto_78194 ) ) ( not ( = ?auto_78189 ?auto_78190 ) ) ( not ( = ?auto_78189 ?auto_78191 ) ) ( not ( = ?auto_78189 ?auto_78192 ) ) ( not ( = ?auto_78189 ?auto_78193 ) ) ( not ( = ?auto_78189 ?auto_78194 ) ) ( not ( = ?auto_78190 ?auto_78191 ) ) ( not ( = ?auto_78190 ?auto_78192 ) ) ( not ( = ?auto_78190 ?auto_78193 ) ) ( not ( = ?auto_78190 ?auto_78194 ) ) ( not ( = ?auto_78191 ?auto_78192 ) ) ( not ( = ?auto_78191 ?auto_78193 ) ) ( not ( = ?auto_78191 ?auto_78194 ) ) ( not ( = ?auto_78192 ?auto_78193 ) ) ( not ( = ?auto_78192 ?auto_78194 ) ) ( not ( = ?auto_78193 ?auto_78194 ) ) ( ON ?auto_78193 ?auto_78194 ) ( CLEAR ?auto_78191 ) ( ON ?auto_78192 ?auto_78193 ) ( CLEAR ?auto_78192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_78185 ?auto_78186 ?auto_78187 ?auto_78188 ?auto_78189 ?auto_78190 ?auto_78191 ?auto_78192 )
      ( MAKE-10PILE ?auto_78185 ?auto_78186 ?auto_78187 ?auto_78188 ?auto_78189 ?auto_78190 ?auto_78191 ?auto_78192 ?auto_78193 ?auto_78194 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78205 - BLOCK
      ?auto_78206 - BLOCK
      ?auto_78207 - BLOCK
      ?auto_78208 - BLOCK
      ?auto_78209 - BLOCK
      ?auto_78210 - BLOCK
      ?auto_78211 - BLOCK
      ?auto_78212 - BLOCK
      ?auto_78213 - BLOCK
      ?auto_78214 - BLOCK
    )
    :vars
    (
      ?auto_78215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78214 ?auto_78215 ) ( ON-TABLE ?auto_78205 ) ( ON ?auto_78206 ?auto_78205 ) ( ON ?auto_78207 ?auto_78206 ) ( ON ?auto_78208 ?auto_78207 ) ( ON ?auto_78209 ?auto_78208 ) ( ON ?auto_78210 ?auto_78209 ) ( not ( = ?auto_78205 ?auto_78206 ) ) ( not ( = ?auto_78205 ?auto_78207 ) ) ( not ( = ?auto_78205 ?auto_78208 ) ) ( not ( = ?auto_78205 ?auto_78209 ) ) ( not ( = ?auto_78205 ?auto_78210 ) ) ( not ( = ?auto_78205 ?auto_78211 ) ) ( not ( = ?auto_78205 ?auto_78212 ) ) ( not ( = ?auto_78205 ?auto_78213 ) ) ( not ( = ?auto_78205 ?auto_78214 ) ) ( not ( = ?auto_78205 ?auto_78215 ) ) ( not ( = ?auto_78206 ?auto_78207 ) ) ( not ( = ?auto_78206 ?auto_78208 ) ) ( not ( = ?auto_78206 ?auto_78209 ) ) ( not ( = ?auto_78206 ?auto_78210 ) ) ( not ( = ?auto_78206 ?auto_78211 ) ) ( not ( = ?auto_78206 ?auto_78212 ) ) ( not ( = ?auto_78206 ?auto_78213 ) ) ( not ( = ?auto_78206 ?auto_78214 ) ) ( not ( = ?auto_78206 ?auto_78215 ) ) ( not ( = ?auto_78207 ?auto_78208 ) ) ( not ( = ?auto_78207 ?auto_78209 ) ) ( not ( = ?auto_78207 ?auto_78210 ) ) ( not ( = ?auto_78207 ?auto_78211 ) ) ( not ( = ?auto_78207 ?auto_78212 ) ) ( not ( = ?auto_78207 ?auto_78213 ) ) ( not ( = ?auto_78207 ?auto_78214 ) ) ( not ( = ?auto_78207 ?auto_78215 ) ) ( not ( = ?auto_78208 ?auto_78209 ) ) ( not ( = ?auto_78208 ?auto_78210 ) ) ( not ( = ?auto_78208 ?auto_78211 ) ) ( not ( = ?auto_78208 ?auto_78212 ) ) ( not ( = ?auto_78208 ?auto_78213 ) ) ( not ( = ?auto_78208 ?auto_78214 ) ) ( not ( = ?auto_78208 ?auto_78215 ) ) ( not ( = ?auto_78209 ?auto_78210 ) ) ( not ( = ?auto_78209 ?auto_78211 ) ) ( not ( = ?auto_78209 ?auto_78212 ) ) ( not ( = ?auto_78209 ?auto_78213 ) ) ( not ( = ?auto_78209 ?auto_78214 ) ) ( not ( = ?auto_78209 ?auto_78215 ) ) ( not ( = ?auto_78210 ?auto_78211 ) ) ( not ( = ?auto_78210 ?auto_78212 ) ) ( not ( = ?auto_78210 ?auto_78213 ) ) ( not ( = ?auto_78210 ?auto_78214 ) ) ( not ( = ?auto_78210 ?auto_78215 ) ) ( not ( = ?auto_78211 ?auto_78212 ) ) ( not ( = ?auto_78211 ?auto_78213 ) ) ( not ( = ?auto_78211 ?auto_78214 ) ) ( not ( = ?auto_78211 ?auto_78215 ) ) ( not ( = ?auto_78212 ?auto_78213 ) ) ( not ( = ?auto_78212 ?auto_78214 ) ) ( not ( = ?auto_78212 ?auto_78215 ) ) ( not ( = ?auto_78213 ?auto_78214 ) ) ( not ( = ?auto_78213 ?auto_78215 ) ) ( not ( = ?auto_78214 ?auto_78215 ) ) ( ON ?auto_78213 ?auto_78214 ) ( ON ?auto_78212 ?auto_78213 ) ( CLEAR ?auto_78210 ) ( ON ?auto_78211 ?auto_78212 ) ( CLEAR ?auto_78211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78205 ?auto_78206 ?auto_78207 ?auto_78208 ?auto_78209 ?auto_78210 ?auto_78211 )
      ( MAKE-10PILE ?auto_78205 ?auto_78206 ?auto_78207 ?auto_78208 ?auto_78209 ?auto_78210 ?auto_78211 ?auto_78212 ?auto_78213 ?auto_78214 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78226 - BLOCK
      ?auto_78227 - BLOCK
      ?auto_78228 - BLOCK
      ?auto_78229 - BLOCK
      ?auto_78230 - BLOCK
      ?auto_78231 - BLOCK
      ?auto_78232 - BLOCK
      ?auto_78233 - BLOCK
      ?auto_78234 - BLOCK
      ?auto_78235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78235 ) ( ON-TABLE ?auto_78226 ) ( ON ?auto_78227 ?auto_78226 ) ( ON ?auto_78228 ?auto_78227 ) ( ON ?auto_78229 ?auto_78228 ) ( ON ?auto_78230 ?auto_78229 ) ( ON ?auto_78231 ?auto_78230 ) ( not ( = ?auto_78226 ?auto_78227 ) ) ( not ( = ?auto_78226 ?auto_78228 ) ) ( not ( = ?auto_78226 ?auto_78229 ) ) ( not ( = ?auto_78226 ?auto_78230 ) ) ( not ( = ?auto_78226 ?auto_78231 ) ) ( not ( = ?auto_78226 ?auto_78232 ) ) ( not ( = ?auto_78226 ?auto_78233 ) ) ( not ( = ?auto_78226 ?auto_78234 ) ) ( not ( = ?auto_78226 ?auto_78235 ) ) ( not ( = ?auto_78227 ?auto_78228 ) ) ( not ( = ?auto_78227 ?auto_78229 ) ) ( not ( = ?auto_78227 ?auto_78230 ) ) ( not ( = ?auto_78227 ?auto_78231 ) ) ( not ( = ?auto_78227 ?auto_78232 ) ) ( not ( = ?auto_78227 ?auto_78233 ) ) ( not ( = ?auto_78227 ?auto_78234 ) ) ( not ( = ?auto_78227 ?auto_78235 ) ) ( not ( = ?auto_78228 ?auto_78229 ) ) ( not ( = ?auto_78228 ?auto_78230 ) ) ( not ( = ?auto_78228 ?auto_78231 ) ) ( not ( = ?auto_78228 ?auto_78232 ) ) ( not ( = ?auto_78228 ?auto_78233 ) ) ( not ( = ?auto_78228 ?auto_78234 ) ) ( not ( = ?auto_78228 ?auto_78235 ) ) ( not ( = ?auto_78229 ?auto_78230 ) ) ( not ( = ?auto_78229 ?auto_78231 ) ) ( not ( = ?auto_78229 ?auto_78232 ) ) ( not ( = ?auto_78229 ?auto_78233 ) ) ( not ( = ?auto_78229 ?auto_78234 ) ) ( not ( = ?auto_78229 ?auto_78235 ) ) ( not ( = ?auto_78230 ?auto_78231 ) ) ( not ( = ?auto_78230 ?auto_78232 ) ) ( not ( = ?auto_78230 ?auto_78233 ) ) ( not ( = ?auto_78230 ?auto_78234 ) ) ( not ( = ?auto_78230 ?auto_78235 ) ) ( not ( = ?auto_78231 ?auto_78232 ) ) ( not ( = ?auto_78231 ?auto_78233 ) ) ( not ( = ?auto_78231 ?auto_78234 ) ) ( not ( = ?auto_78231 ?auto_78235 ) ) ( not ( = ?auto_78232 ?auto_78233 ) ) ( not ( = ?auto_78232 ?auto_78234 ) ) ( not ( = ?auto_78232 ?auto_78235 ) ) ( not ( = ?auto_78233 ?auto_78234 ) ) ( not ( = ?auto_78233 ?auto_78235 ) ) ( not ( = ?auto_78234 ?auto_78235 ) ) ( ON ?auto_78234 ?auto_78235 ) ( ON ?auto_78233 ?auto_78234 ) ( CLEAR ?auto_78231 ) ( ON ?auto_78232 ?auto_78233 ) ( CLEAR ?auto_78232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78226 ?auto_78227 ?auto_78228 ?auto_78229 ?auto_78230 ?auto_78231 ?auto_78232 )
      ( MAKE-10PILE ?auto_78226 ?auto_78227 ?auto_78228 ?auto_78229 ?auto_78230 ?auto_78231 ?auto_78232 ?auto_78233 ?auto_78234 ?auto_78235 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78246 - BLOCK
      ?auto_78247 - BLOCK
      ?auto_78248 - BLOCK
      ?auto_78249 - BLOCK
      ?auto_78250 - BLOCK
      ?auto_78251 - BLOCK
      ?auto_78252 - BLOCK
      ?auto_78253 - BLOCK
      ?auto_78254 - BLOCK
      ?auto_78255 - BLOCK
    )
    :vars
    (
      ?auto_78256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78255 ?auto_78256 ) ( ON-TABLE ?auto_78246 ) ( ON ?auto_78247 ?auto_78246 ) ( ON ?auto_78248 ?auto_78247 ) ( ON ?auto_78249 ?auto_78248 ) ( ON ?auto_78250 ?auto_78249 ) ( not ( = ?auto_78246 ?auto_78247 ) ) ( not ( = ?auto_78246 ?auto_78248 ) ) ( not ( = ?auto_78246 ?auto_78249 ) ) ( not ( = ?auto_78246 ?auto_78250 ) ) ( not ( = ?auto_78246 ?auto_78251 ) ) ( not ( = ?auto_78246 ?auto_78252 ) ) ( not ( = ?auto_78246 ?auto_78253 ) ) ( not ( = ?auto_78246 ?auto_78254 ) ) ( not ( = ?auto_78246 ?auto_78255 ) ) ( not ( = ?auto_78246 ?auto_78256 ) ) ( not ( = ?auto_78247 ?auto_78248 ) ) ( not ( = ?auto_78247 ?auto_78249 ) ) ( not ( = ?auto_78247 ?auto_78250 ) ) ( not ( = ?auto_78247 ?auto_78251 ) ) ( not ( = ?auto_78247 ?auto_78252 ) ) ( not ( = ?auto_78247 ?auto_78253 ) ) ( not ( = ?auto_78247 ?auto_78254 ) ) ( not ( = ?auto_78247 ?auto_78255 ) ) ( not ( = ?auto_78247 ?auto_78256 ) ) ( not ( = ?auto_78248 ?auto_78249 ) ) ( not ( = ?auto_78248 ?auto_78250 ) ) ( not ( = ?auto_78248 ?auto_78251 ) ) ( not ( = ?auto_78248 ?auto_78252 ) ) ( not ( = ?auto_78248 ?auto_78253 ) ) ( not ( = ?auto_78248 ?auto_78254 ) ) ( not ( = ?auto_78248 ?auto_78255 ) ) ( not ( = ?auto_78248 ?auto_78256 ) ) ( not ( = ?auto_78249 ?auto_78250 ) ) ( not ( = ?auto_78249 ?auto_78251 ) ) ( not ( = ?auto_78249 ?auto_78252 ) ) ( not ( = ?auto_78249 ?auto_78253 ) ) ( not ( = ?auto_78249 ?auto_78254 ) ) ( not ( = ?auto_78249 ?auto_78255 ) ) ( not ( = ?auto_78249 ?auto_78256 ) ) ( not ( = ?auto_78250 ?auto_78251 ) ) ( not ( = ?auto_78250 ?auto_78252 ) ) ( not ( = ?auto_78250 ?auto_78253 ) ) ( not ( = ?auto_78250 ?auto_78254 ) ) ( not ( = ?auto_78250 ?auto_78255 ) ) ( not ( = ?auto_78250 ?auto_78256 ) ) ( not ( = ?auto_78251 ?auto_78252 ) ) ( not ( = ?auto_78251 ?auto_78253 ) ) ( not ( = ?auto_78251 ?auto_78254 ) ) ( not ( = ?auto_78251 ?auto_78255 ) ) ( not ( = ?auto_78251 ?auto_78256 ) ) ( not ( = ?auto_78252 ?auto_78253 ) ) ( not ( = ?auto_78252 ?auto_78254 ) ) ( not ( = ?auto_78252 ?auto_78255 ) ) ( not ( = ?auto_78252 ?auto_78256 ) ) ( not ( = ?auto_78253 ?auto_78254 ) ) ( not ( = ?auto_78253 ?auto_78255 ) ) ( not ( = ?auto_78253 ?auto_78256 ) ) ( not ( = ?auto_78254 ?auto_78255 ) ) ( not ( = ?auto_78254 ?auto_78256 ) ) ( not ( = ?auto_78255 ?auto_78256 ) ) ( ON ?auto_78254 ?auto_78255 ) ( ON ?auto_78253 ?auto_78254 ) ( ON ?auto_78252 ?auto_78253 ) ( CLEAR ?auto_78250 ) ( ON ?auto_78251 ?auto_78252 ) ( CLEAR ?auto_78251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78246 ?auto_78247 ?auto_78248 ?auto_78249 ?auto_78250 ?auto_78251 )
      ( MAKE-10PILE ?auto_78246 ?auto_78247 ?auto_78248 ?auto_78249 ?auto_78250 ?auto_78251 ?auto_78252 ?auto_78253 ?auto_78254 ?auto_78255 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78267 - BLOCK
      ?auto_78268 - BLOCK
      ?auto_78269 - BLOCK
      ?auto_78270 - BLOCK
      ?auto_78271 - BLOCK
      ?auto_78272 - BLOCK
      ?auto_78273 - BLOCK
      ?auto_78274 - BLOCK
      ?auto_78275 - BLOCK
      ?auto_78276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78276 ) ( ON-TABLE ?auto_78267 ) ( ON ?auto_78268 ?auto_78267 ) ( ON ?auto_78269 ?auto_78268 ) ( ON ?auto_78270 ?auto_78269 ) ( ON ?auto_78271 ?auto_78270 ) ( not ( = ?auto_78267 ?auto_78268 ) ) ( not ( = ?auto_78267 ?auto_78269 ) ) ( not ( = ?auto_78267 ?auto_78270 ) ) ( not ( = ?auto_78267 ?auto_78271 ) ) ( not ( = ?auto_78267 ?auto_78272 ) ) ( not ( = ?auto_78267 ?auto_78273 ) ) ( not ( = ?auto_78267 ?auto_78274 ) ) ( not ( = ?auto_78267 ?auto_78275 ) ) ( not ( = ?auto_78267 ?auto_78276 ) ) ( not ( = ?auto_78268 ?auto_78269 ) ) ( not ( = ?auto_78268 ?auto_78270 ) ) ( not ( = ?auto_78268 ?auto_78271 ) ) ( not ( = ?auto_78268 ?auto_78272 ) ) ( not ( = ?auto_78268 ?auto_78273 ) ) ( not ( = ?auto_78268 ?auto_78274 ) ) ( not ( = ?auto_78268 ?auto_78275 ) ) ( not ( = ?auto_78268 ?auto_78276 ) ) ( not ( = ?auto_78269 ?auto_78270 ) ) ( not ( = ?auto_78269 ?auto_78271 ) ) ( not ( = ?auto_78269 ?auto_78272 ) ) ( not ( = ?auto_78269 ?auto_78273 ) ) ( not ( = ?auto_78269 ?auto_78274 ) ) ( not ( = ?auto_78269 ?auto_78275 ) ) ( not ( = ?auto_78269 ?auto_78276 ) ) ( not ( = ?auto_78270 ?auto_78271 ) ) ( not ( = ?auto_78270 ?auto_78272 ) ) ( not ( = ?auto_78270 ?auto_78273 ) ) ( not ( = ?auto_78270 ?auto_78274 ) ) ( not ( = ?auto_78270 ?auto_78275 ) ) ( not ( = ?auto_78270 ?auto_78276 ) ) ( not ( = ?auto_78271 ?auto_78272 ) ) ( not ( = ?auto_78271 ?auto_78273 ) ) ( not ( = ?auto_78271 ?auto_78274 ) ) ( not ( = ?auto_78271 ?auto_78275 ) ) ( not ( = ?auto_78271 ?auto_78276 ) ) ( not ( = ?auto_78272 ?auto_78273 ) ) ( not ( = ?auto_78272 ?auto_78274 ) ) ( not ( = ?auto_78272 ?auto_78275 ) ) ( not ( = ?auto_78272 ?auto_78276 ) ) ( not ( = ?auto_78273 ?auto_78274 ) ) ( not ( = ?auto_78273 ?auto_78275 ) ) ( not ( = ?auto_78273 ?auto_78276 ) ) ( not ( = ?auto_78274 ?auto_78275 ) ) ( not ( = ?auto_78274 ?auto_78276 ) ) ( not ( = ?auto_78275 ?auto_78276 ) ) ( ON ?auto_78275 ?auto_78276 ) ( ON ?auto_78274 ?auto_78275 ) ( ON ?auto_78273 ?auto_78274 ) ( CLEAR ?auto_78271 ) ( ON ?auto_78272 ?auto_78273 ) ( CLEAR ?auto_78272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78267 ?auto_78268 ?auto_78269 ?auto_78270 ?auto_78271 ?auto_78272 )
      ( MAKE-10PILE ?auto_78267 ?auto_78268 ?auto_78269 ?auto_78270 ?auto_78271 ?auto_78272 ?auto_78273 ?auto_78274 ?auto_78275 ?auto_78276 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78287 - BLOCK
      ?auto_78288 - BLOCK
      ?auto_78289 - BLOCK
      ?auto_78290 - BLOCK
      ?auto_78291 - BLOCK
      ?auto_78292 - BLOCK
      ?auto_78293 - BLOCK
      ?auto_78294 - BLOCK
      ?auto_78295 - BLOCK
      ?auto_78296 - BLOCK
    )
    :vars
    (
      ?auto_78297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78296 ?auto_78297 ) ( ON-TABLE ?auto_78287 ) ( ON ?auto_78288 ?auto_78287 ) ( ON ?auto_78289 ?auto_78288 ) ( ON ?auto_78290 ?auto_78289 ) ( not ( = ?auto_78287 ?auto_78288 ) ) ( not ( = ?auto_78287 ?auto_78289 ) ) ( not ( = ?auto_78287 ?auto_78290 ) ) ( not ( = ?auto_78287 ?auto_78291 ) ) ( not ( = ?auto_78287 ?auto_78292 ) ) ( not ( = ?auto_78287 ?auto_78293 ) ) ( not ( = ?auto_78287 ?auto_78294 ) ) ( not ( = ?auto_78287 ?auto_78295 ) ) ( not ( = ?auto_78287 ?auto_78296 ) ) ( not ( = ?auto_78287 ?auto_78297 ) ) ( not ( = ?auto_78288 ?auto_78289 ) ) ( not ( = ?auto_78288 ?auto_78290 ) ) ( not ( = ?auto_78288 ?auto_78291 ) ) ( not ( = ?auto_78288 ?auto_78292 ) ) ( not ( = ?auto_78288 ?auto_78293 ) ) ( not ( = ?auto_78288 ?auto_78294 ) ) ( not ( = ?auto_78288 ?auto_78295 ) ) ( not ( = ?auto_78288 ?auto_78296 ) ) ( not ( = ?auto_78288 ?auto_78297 ) ) ( not ( = ?auto_78289 ?auto_78290 ) ) ( not ( = ?auto_78289 ?auto_78291 ) ) ( not ( = ?auto_78289 ?auto_78292 ) ) ( not ( = ?auto_78289 ?auto_78293 ) ) ( not ( = ?auto_78289 ?auto_78294 ) ) ( not ( = ?auto_78289 ?auto_78295 ) ) ( not ( = ?auto_78289 ?auto_78296 ) ) ( not ( = ?auto_78289 ?auto_78297 ) ) ( not ( = ?auto_78290 ?auto_78291 ) ) ( not ( = ?auto_78290 ?auto_78292 ) ) ( not ( = ?auto_78290 ?auto_78293 ) ) ( not ( = ?auto_78290 ?auto_78294 ) ) ( not ( = ?auto_78290 ?auto_78295 ) ) ( not ( = ?auto_78290 ?auto_78296 ) ) ( not ( = ?auto_78290 ?auto_78297 ) ) ( not ( = ?auto_78291 ?auto_78292 ) ) ( not ( = ?auto_78291 ?auto_78293 ) ) ( not ( = ?auto_78291 ?auto_78294 ) ) ( not ( = ?auto_78291 ?auto_78295 ) ) ( not ( = ?auto_78291 ?auto_78296 ) ) ( not ( = ?auto_78291 ?auto_78297 ) ) ( not ( = ?auto_78292 ?auto_78293 ) ) ( not ( = ?auto_78292 ?auto_78294 ) ) ( not ( = ?auto_78292 ?auto_78295 ) ) ( not ( = ?auto_78292 ?auto_78296 ) ) ( not ( = ?auto_78292 ?auto_78297 ) ) ( not ( = ?auto_78293 ?auto_78294 ) ) ( not ( = ?auto_78293 ?auto_78295 ) ) ( not ( = ?auto_78293 ?auto_78296 ) ) ( not ( = ?auto_78293 ?auto_78297 ) ) ( not ( = ?auto_78294 ?auto_78295 ) ) ( not ( = ?auto_78294 ?auto_78296 ) ) ( not ( = ?auto_78294 ?auto_78297 ) ) ( not ( = ?auto_78295 ?auto_78296 ) ) ( not ( = ?auto_78295 ?auto_78297 ) ) ( not ( = ?auto_78296 ?auto_78297 ) ) ( ON ?auto_78295 ?auto_78296 ) ( ON ?auto_78294 ?auto_78295 ) ( ON ?auto_78293 ?auto_78294 ) ( ON ?auto_78292 ?auto_78293 ) ( CLEAR ?auto_78290 ) ( ON ?auto_78291 ?auto_78292 ) ( CLEAR ?auto_78291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78287 ?auto_78288 ?auto_78289 ?auto_78290 ?auto_78291 )
      ( MAKE-10PILE ?auto_78287 ?auto_78288 ?auto_78289 ?auto_78290 ?auto_78291 ?auto_78292 ?auto_78293 ?auto_78294 ?auto_78295 ?auto_78296 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78308 - BLOCK
      ?auto_78309 - BLOCK
      ?auto_78310 - BLOCK
      ?auto_78311 - BLOCK
      ?auto_78312 - BLOCK
      ?auto_78313 - BLOCK
      ?auto_78314 - BLOCK
      ?auto_78315 - BLOCK
      ?auto_78316 - BLOCK
      ?auto_78317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78317 ) ( ON-TABLE ?auto_78308 ) ( ON ?auto_78309 ?auto_78308 ) ( ON ?auto_78310 ?auto_78309 ) ( ON ?auto_78311 ?auto_78310 ) ( not ( = ?auto_78308 ?auto_78309 ) ) ( not ( = ?auto_78308 ?auto_78310 ) ) ( not ( = ?auto_78308 ?auto_78311 ) ) ( not ( = ?auto_78308 ?auto_78312 ) ) ( not ( = ?auto_78308 ?auto_78313 ) ) ( not ( = ?auto_78308 ?auto_78314 ) ) ( not ( = ?auto_78308 ?auto_78315 ) ) ( not ( = ?auto_78308 ?auto_78316 ) ) ( not ( = ?auto_78308 ?auto_78317 ) ) ( not ( = ?auto_78309 ?auto_78310 ) ) ( not ( = ?auto_78309 ?auto_78311 ) ) ( not ( = ?auto_78309 ?auto_78312 ) ) ( not ( = ?auto_78309 ?auto_78313 ) ) ( not ( = ?auto_78309 ?auto_78314 ) ) ( not ( = ?auto_78309 ?auto_78315 ) ) ( not ( = ?auto_78309 ?auto_78316 ) ) ( not ( = ?auto_78309 ?auto_78317 ) ) ( not ( = ?auto_78310 ?auto_78311 ) ) ( not ( = ?auto_78310 ?auto_78312 ) ) ( not ( = ?auto_78310 ?auto_78313 ) ) ( not ( = ?auto_78310 ?auto_78314 ) ) ( not ( = ?auto_78310 ?auto_78315 ) ) ( not ( = ?auto_78310 ?auto_78316 ) ) ( not ( = ?auto_78310 ?auto_78317 ) ) ( not ( = ?auto_78311 ?auto_78312 ) ) ( not ( = ?auto_78311 ?auto_78313 ) ) ( not ( = ?auto_78311 ?auto_78314 ) ) ( not ( = ?auto_78311 ?auto_78315 ) ) ( not ( = ?auto_78311 ?auto_78316 ) ) ( not ( = ?auto_78311 ?auto_78317 ) ) ( not ( = ?auto_78312 ?auto_78313 ) ) ( not ( = ?auto_78312 ?auto_78314 ) ) ( not ( = ?auto_78312 ?auto_78315 ) ) ( not ( = ?auto_78312 ?auto_78316 ) ) ( not ( = ?auto_78312 ?auto_78317 ) ) ( not ( = ?auto_78313 ?auto_78314 ) ) ( not ( = ?auto_78313 ?auto_78315 ) ) ( not ( = ?auto_78313 ?auto_78316 ) ) ( not ( = ?auto_78313 ?auto_78317 ) ) ( not ( = ?auto_78314 ?auto_78315 ) ) ( not ( = ?auto_78314 ?auto_78316 ) ) ( not ( = ?auto_78314 ?auto_78317 ) ) ( not ( = ?auto_78315 ?auto_78316 ) ) ( not ( = ?auto_78315 ?auto_78317 ) ) ( not ( = ?auto_78316 ?auto_78317 ) ) ( ON ?auto_78316 ?auto_78317 ) ( ON ?auto_78315 ?auto_78316 ) ( ON ?auto_78314 ?auto_78315 ) ( ON ?auto_78313 ?auto_78314 ) ( CLEAR ?auto_78311 ) ( ON ?auto_78312 ?auto_78313 ) ( CLEAR ?auto_78312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78308 ?auto_78309 ?auto_78310 ?auto_78311 ?auto_78312 )
      ( MAKE-10PILE ?auto_78308 ?auto_78309 ?auto_78310 ?auto_78311 ?auto_78312 ?auto_78313 ?auto_78314 ?auto_78315 ?auto_78316 ?auto_78317 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78328 - BLOCK
      ?auto_78329 - BLOCK
      ?auto_78330 - BLOCK
      ?auto_78331 - BLOCK
      ?auto_78332 - BLOCK
      ?auto_78333 - BLOCK
      ?auto_78334 - BLOCK
      ?auto_78335 - BLOCK
      ?auto_78336 - BLOCK
      ?auto_78337 - BLOCK
    )
    :vars
    (
      ?auto_78338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78337 ?auto_78338 ) ( ON-TABLE ?auto_78328 ) ( ON ?auto_78329 ?auto_78328 ) ( ON ?auto_78330 ?auto_78329 ) ( not ( = ?auto_78328 ?auto_78329 ) ) ( not ( = ?auto_78328 ?auto_78330 ) ) ( not ( = ?auto_78328 ?auto_78331 ) ) ( not ( = ?auto_78328 ?auto_78332 ) ) ( not ( = ?auto_78328 ?auto_78333 ) ) ( not ( = ?auto_78328 ?auto_78334 ) ) ( not ( = ?auto_78328 ?auto_78335 ) ) ( not ( = ?auto_78328 ?auto_78336 ) ) ( not ( = ?auto_78328 ?auto_78337 ) ) ( not ( = ?auto_78328 ?auto_78338 ) ) ( not ( = ?auto_78329 ?auto_78330 ) ) ( not ( = ?auto_78329 ?auto_78331 ) ) ( not ( = ?auto_78329 ?auto_78332 ) ) ( not ( = ?auto_78329 ?auto_78333 ) ) ( not ( = ?auto_78329 ?auto_78334 ) ) ( not ( = ?auto_78329 ?auto_78335 ) ) ( not ( = ?auto_78329 ?auto_78336 ) ) ( not ( = ?auto_78329 ?auto_78337 ) ) ( not ( = ?auto_78329 ?auto_78338 ) ) ( not ( = ?auto_78330 ?auto_78331 ) ) ( not ( = ?auto_78330 ?auto_78332 ) ) ( not ( = ?auto_78330 ?auto_78333 ) ) ( not ( = ?auto_78330 ?auto_78334 ) ) ( not ( = ?auto_78330 ?auto_78335 ) ) ( not ( = ?auto_78330 ?auto_78336 ) ) ( not ( = ?auto_78330 ?auto_78337 ) ) ( not ( = ?auto_78330 ?auto_78338 ) ) ( not ( = ?auto_78331 ?auto_78332 ) ) ( not ( = ?auto_78331 ?auto_78333 ) ) ( not ( = ?auto_78331 ?auto_78334 ) ) ( not ( = ?auto_78331 ?auto_78335 ) ) ( not ( = ?auto_78331 ?auto_78336 ) ) ( not ( = ?auto_78331 ?auto_78337 ) ) ( not ( = ?auto_78331 ?auto_78338 ) ) ( not ( = ?auto_78332 ?auto_78333 ) ) ( not ( = ?auto_78332 ?auto_78334 ) ) ( not ( = ?auto_78332 ?auto_78335 ) ) ( not ( = ?auto_78332 ?auto_78336 ) ) ( not ( = ?auto_78332 ?auto_78337 ) ) ( not ( = ?auto_78332 ?auto_78338 ) ) ( not ( = ?auto_78333 ?auto_78334 ) ) ( not ( = ?auto_78333 ?auto_78335 ) ) ( not ( = ?auto_78333 ?auto_78336 ) ) ( not ( = ?auto_78333 ?auto_78337 ) ) ( not ( = ?auto_78333 ?auto_78338 ) ) ( not ( = ?auto_78334 ?auto_78335 ) ) ( not ( = ?auto_78334 ?auto_78336 ) ) ( not ( = ?auto_78334 ?auto_78337 ) ) ( not ( = ?auto_78334 ?auto_78338 ) ) ( not ( = ?auto_78335 ?auto_78336 ) ) ( not ( = ?auto_78335 ?auto_78337 ) ) ( not ( = ?auto_78335 ?auto_78338 ) ) ( not ( = ?auto_78336 ?auto_78337 ) ) ( not ( = ?auto_78336 ?auto_78338 ) ) ( not ( = ?auto_78337 ?auto_78338 ) ) ( ON ?auto_78336 ?auto_78337 ) ( ON ?auto_78335 ?auto_78336 ) ( ON ?auto_78334 ?auto_78335 ) ( ON ?auto_78333 ?auto_78334 ) ( ON ?auto_78332 ?auto_78333 ) ( CLEAR ?auto_78330 ) ( ON ?auto_78331 ?auto_78332 ) ( CLEAR ?auto_78331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78328 ?auto_78329 ?auto_78330 ?auto_78331 )
      ( MAKE-10PILE ?auto_78328 ?auto_78329 ?auto_78330 ?auto_78331 ?auto_78332 ?auto_78333 ?auto_78334 ?auto_78335 ?auto_78336 ?auto_78337 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78349 - BLOCK
      ?auto_78350 - BLOCK
      ?auto_78351 - BLOCK
      ?auto_78352 - BLOCK
      ?auto_78353 - BLOCK
      ?auto_78354 - BLOCK
      ?auto_78355 - BLOCK
      ?auto_78356 - BLOCK
      ?auto_78357 - BLOCK
      ?auto_78358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78358 ) ( ON-TABLE ?auto_78349 ) ( ON ?auto_78350 ?auto_78349 ) ( ON ?auto_78351 ?auto_78350 ) ( not ( = ?auto_78349 ?auto_78350 ) ) ( not ( = ?auto_78349 ?auto_78351 ) ) ( not ( = ?auto_78349 ?auto_78352 ) ) ( not ( = ?auto_78349 ?auto_78353 ) ) ( not ( = ?auto_78349 ?auto_78354 ) ) ( not ( = ?auto_78349 ?auto_78355 ) ) ( not ( = ?auto_78349 ?auto_78356 ) ) ( not ( = ?auto_78349 ?auto_78357 ) ) ( not ( = ?auto_78349 ?auto_78358 ) ) ( not ( = ?auto_78350 ?auto_78351 ) ) ( not ( = ?auto_78350 ?auto_78352 ) ) ( not ( = ?auto_78350 ?auto_78353 ) ) ( not ( = ?auto_78350 ?auto_78354 ) ) ( not ( = ?auto_78350 ?auto_78355 ) ) ( not ( = ?auto_78350 ?auto_78356 ) ) ( not ( = ?auto_78350 ?auto_78357 ) ) ( not ( = ?auto_78350 ?auto_78358 ) ) ( not ( = ?auto_78351 ?auto_78352 ) ) ( not ( = ?auto_78351 ?auto_78353 ) ) ( not ( = ?auto_78351 ?auto_78354 ) ) ( not ( = ?auto_78351 ?auto_78355 ) ) ( not ( = ?auto_78351 ?auto_78356 ) ) ( not ( = ?auto_78351 ?auto_78357 ) ) ( not ( = ?auto_78351 ?auto_78358 ) ) ( not ( = ?auto_78352 ?auto_78353 ) ) ( not ( = ?auto_78352 ?auto_78354 ) ) ( not ( = ?auto_78352 ?auto_78355 ) ) ( not ( = ?auto_78352 ?auto_78356 ) ) ( not ( = ?auto_78352 ?auto_78357 ) ) ( not ( = ?auto_78352 ?auto_78358 ) ) ( not ( = ?auto_78353 ?auto_78354 ) ) ( not ( = ?auto_78353 ?auto_78355 ) ) ( not ( = ?auto_78353 ?auto_78356 ) ) ( not ( = ?auto_78353 ?auto_78357 ) ) ( not ( = ?auto_78353 ?auto_78358 ) ) ( not ( = ?auto_78354 ?auto_78355 ) ) ( not ( = ?auto_78354 ?auto_78356 ) ) ( not ( = ?auto_78354 ?auto_78357 ) ) ( not ( = ?auto_78354 ?auto_78358 ) ) ( not ( = ?auto_78355 ?auto_78356 ) ) ( not ( = ?auto_78355 ?auto_78357 ) ) ( not ( = ?auto_78355 ?auto_78358 ) ) ( not ( = ?auto_78356 ?auto_78357 ) ) ( not ( = ?auto_78356 ?auto_78358 ) ) ( not ( = ?auto_78357 ?auto_78358 ) ) ( ON ?auto_78357 ?auto_78358 ) ( ON ?auto_78356 ?auto_78357 ) ( ON ?auto_78355 ?auto_78356 ) ( ON ?auto_78354 ?auto_78355 ) ( ON ?auto_78353 ?auto_78354 ) ( CLEAR ?auto_78351 ) ( ON ?auto_78352 ?auto_78353 ) ( CLEAR ?auto_78352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78349 ?auto_78350 ?auto_78351 ?auto_78352 )
      ( MAKE-10PILE ?auto_78349 ?auto_78350 ?auto_78351 ?auto_78352 ?auto_78353 ?auto_78354 ?auto_78355 ?auto_78356 ?auto_78357 ?auto_78358 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78369 - BLOCK
      ?auto_78370 - BLOCK
      ?auto_78371 - BLOCK
      ?auto_78372 - BLOCK
      ?auto_78373 - BLOCK
      ?auto_78374 - BLOCK
      ?auto_78375 - BLOCK
      ?auto_78376 - BLOCK
      ?auto_78377 - BLOCK
      ?auto_78378 - BLOCK
    )
    :vars
    (
      ?auto_78379 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78378 ?auto_78379 ) ( ON-TABLE ?auto_78369 ) ( ON ?auto_78370 ?auto_78369 ) ( not ( = ?auto_78369 ?auto_78370 ) ) ( not ( = ?auto_78369 ?auto_78371 ) ) ( not ( = ?auto_78369 ?auto_78372 ) ) ( not ( = ?auto_78369 ?auto_78373 ) ) ( not ( = ?auto_78369 ?auto_78374 ) ) ( not ( = ?auto_78369 ?auto_78375 ) ) ( not ( = ?auto_78369 ?auto_78376 ) ) ( not ( = ?auto_78369 ?auto_78377 ) ) ( not ( = ?auto_78369 ?auto_78378 ) ) ( not ( = ?auto_78369 ?auto_78379 ) ) ( not ( = ?auto_78370 ?auto_78371 ) ) ( not ( = ?auto_78370 ?auto_78372 ) ) ( not ( = ?auto_78370 ?auto_78373 ) ) ( not ( = ?auto_78370 ?auto_78374 ) ) ( not ( = ?auto_78370 ?auto_78375 ) ) ( not ( = ?auto_78370 ?auto_78376 ) ) ( not ( = ?auto_78370 ?auto_78377 ) ) ( not ( = ?auto_78370 ?auto_78378 ) ) ( not ( = ?auto_78370 ?auto_78379 ) ) ( not ( = ?auto_78371 ?auto_78372 ) ) ( not ( = ?auto_78371 ?auto_78373 ) ) ( not ( = ?auto_78371 ?auto_78374 ) ) ( not ( = ?auto_78371 ?auto_78375 ) ) ( not ( = ?auto_78371 ?auto_78376 ) ) ( not ( = ?auto_78371 ?auto_78377 ) ) ( not ( = ?auto_78371 ?auto_78378 ) ) ( not ( = ?auto_78371 ?auto_78379 ) ) ( not ( = ?auto_78372 ?auto_78373 ) ) ( not ( = ?auto_78372 ?auto_78374 ) ) ( not ( = ?auto_78372 ?auto_78375 ) ) ( not ( = ?auto_78372 ?auto_78376 ) ) ( not ( = ?auto_78372 ?auto_78377 ) ) ( not ( = ?auto_78372 ?auto_78378 ) ) ( not ( = ?auto_78372 ?auto_78379 ) ) ( not ( = ?auto_78373 ?auto_78374 ) ) ( not ( = ?auto_78373 ?auto_78375 ) ) ( not ( = ?auto_78373 ?auto_78376 ) ) ( not ( = ?auto_78373 ?auto_78377 ) ) ( not ( = ?auto_78373 ?auto_78378 ) ) ( not ( = ?auto_78373 ?auto_78379 ) ) ( not ( = ?auto_78374 ?auto_78375 ) ) ( not ( = ?auto_78374 ?auto_78376 ) ) ( not ( = ?auto_78374 ?auto_78377 ) ) ( not ( = ?auto_78374 ?auto_78378 ) ) ( not ( = ?auto_78374 ?auto_78379 ) ) ( not ( = ?auto_78375 ?auto_78376 ) ) ( not ( = ?auto_78375 ?auto_78377 ) ) ( not ( = ?auto_78375 ?auto_78378 ) ) ( not ( = ?auto_78375 ?auto_78379 ) ) ( not ( = ?auto_78376 ?auto_78377 ) ) ( not ( = ?auto_78376 ?auto_78378 ) ) ( not ( = ?auto_78376 ?auto_78379 ) ) ( not ( = ?auto_78377 ?auto_78378 ) ) ( not ( = ?auto_78377 ?auto_78379 ) ) ( not ( = ?auto_78378 ?auto_78379 ) ) ( ON ?auto_78377 ?auto_78378 ) ( ON ?auto_78376 ?auto_78377 ) ( ON ?auto_78375 ?auto_78376 ) ( ON ?auto_78374 ?auto_78375 ) ( ON ?auto_78373 ?auto_78374 ) ( ON ?auto_78372 ?auto_78373 ) ( CLEAR ?auto_78370 ) ( ON ?auto_78371 ?auto_78372 ) ( CLEAR ?auto_78371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78369 ?auto_78370 ?auto_78371 )
      ( MAKE-10PILE ?auto_78369 ?auto_78370 ?auto_78371 ?auto_78372 ?auto_78373 ?auto_78374 ?auto_78375 ?auto_78376 ?auto_78377 ?auto_78378 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78390 - BLOCK
      ?auto_78391 - BLOCK
      ?auto_78392 - BLOCK
      ?auto_78393 - BLOCK
      ?auto_78394 - BLOCK
      ?auto_78395 - BLOCK
      ?auto_78396 - BLOCK
      ?auto_78397 - BLOCK
      ?auto_78398 - BLOCK
      ?auto_78399 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78399 ) ( ON-TABLE ?auto_78390 ) ( ON ?auto_78391 ?auto_78390 ) ( not ( = ?auto_78390 ?auto_78391 ) ) ( not ( = ?auto_78390 ?auto_78392 ) ) ( not ( = ?auto_78390 ?auto_78393 ) ) ( not ( = ?auto_78390 ?auto_78394 ) ) ( not ( = ?auto_78390 ?auto_78395 ) ) ( not ( = ?auto_78390 ?auto_78396 ) ) ( not ( = ?auto_78390 ?auto_78397 ) ) ( not ( = ?auto_78390 ?auto_78398 ) ) ( not ( = ?auto_78390 ?auto_78399 ) ) ( not ( = ?auto_78391 ?auto_78392 ) ) ( not ( = ?auto_78391 ?auto_78393 ) ) ( not ( = ?auto_78391 ?auto_78394 ) ) ( not ( = ?auto_78391 ?auto_78395 ) ) ( not ( = ?auto_78391 ?auto_78396 ) ) ( not ( = ?auto_78391 ?auto_78397 ) ) ( not ( = ?auto_78391 ?auto_78398 ) ) ( not ( = ?auto_78391 ?auto_78399 ) ) ( not ( = ?auto_78392 ?auto_78393 ) ) ( not ( = ?auto_78392 ?auto_78394 ) ) ( not ( = ?auto_78392 ?auto_78395 ) ) ( not ( = ?auto_78392 ?auto_78396 ) ) ( not ( = ?auto_78392 ?auto_78397 ) ) ( not ( = ?auto_78392 ?auto_78398 ) ) ( not ( = ?auto_78392 ?auto_78399 ) ) ( not ( = ?auto_78393 ?auto_78394 ) ) ( not ( = ?auto_78393 ?auto_78395 ) ) ( not ( = ?auto_78393 ?auto_78396 ) ) ( not ( = ?auto_78393 ?auto_78397 ) ) ( not ( = ?auto_78393 ?auto_78398 ) ) ( not ( = ?auto_78393 ?auto_78399 ) ) ( not ( = ?auto_78394 ?auto_78395 ) ) ( not ( = ?auto_78394 ?auto_78396 ) ) ( not ( = ?auto_78394 ?auto_78397 ) ) ( not ( = ?auto_78394 ?auto_78398 ) ) ( not ( = ?auto_78394 ?auto_78399 ) ) ( not ( = ?auto_78395 ?auto_78396 ) ) ( not ( = ?auto_78395 ?auto_78397 ) ) ( not ( = ?auto_78395 ?auto_78398 ) ) ( not ( = ?auto_78395 ?auto_78399 ) ) ( not ( = ?auto_78396 ?auto_78397 ) ) ( not ( = ?auto_78396 ?auto_78398 ) ) ( not ( = ?auto_78396 ?auto_78399 ) ) ( not ( = ?auto_78397 ?auto_78398 ) ) ( not ( = ?auto_78397 ?auto_78399 ) ) ( not ( = ?auto_78398 ?auto_78399 ) ) ( ON ?auto_78398 ?auto_78399 ) ( ON ?auto_78397 ?auto_78398 ) ( ON ?auto_78396 ?auto_78397 ) ( ON ?auto_78395 ?auto_78396 ) ( ON ?auto_78394 ?auto_78395 ) ( ON ?auto_78393 ?auto_78394 ) ( CLEAR ?auto_78391 ) ( ON ?auto_78392 ?auto_78393 ) ( CLEAR ?auto_78392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78390 ?auto_78391 ?auto_78392 )
      ( MAKE-10PILE ?auto_78390 ?auto_78391 ?auto_78392 ?auto_78393 ?auto_78394 ?auto_78395 ?auto_78396 ?auto_78397 ?auto_78398 ?auto_78399 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78410 - BLOCK
      ?auto_78411 - BLOCK
      ?auto_78412 - BLOCK
      ?auto_78413 - BLOCK
      ?auto_78414 - BLOCK
      ?auto_78415 - BLOCK
      ?auto_78416 - BLOCK
      ?auto_78417 - BLOCK
      ?auto_78418 - BLOCK
      ?auto_78419 - BLOCK
    )
    :vars
    (
      ?auto_78420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78419 ?auto_78420 ) ( ON-TABLE ?auto_78410 ) ( not ( = ?auto_78410 ?auto_78411 ) ) ( not ( = ?auto_78410 ?auto_78412 ) ) ( not ( = ?auto_78410 ?auto_78413 ) ) ( not ( = ?auto_78410 ?auto_78414 ) ) ( not ( = ?auto_78410 ?auto_78415 ) ) ( not ( = ?auto_78410 ?auto_78416 ) ) ( not ( = ?auto_78410 ?auto_78417 ) ) ( not ( = ?auto_78410 ?auto_78418 ) ) ( not ( = ?auto_78410 ?auto_78419 ) ) ( not ( = ?auto_78410 ?auto_78420 ) ) ( not ( = ?auto_78411 ?auto_78412 ) ) ( not ( = ?auto_78411 ?auto_78413 ) ) ( not ( = ?auto_78411 ?auto_78414 ) ) ( not ( = ?auto_78411 ?auto_78415 ) ) ( not ( = ?auto_78411 ?auto_78416 ) ) ( not ( = ?auto_78411 ?auto_78417 ) ) ( not ( = ?auto_78411 ?auto_78418 ) ) ( not ( = ?auto_78411 ?auto_78419 ) ) ( not ( = ?auto_78411 ?auto_78420 ) ) ( not ( = ?auto_78412 ?auto_78413 ) ) ( not ( = ?auto_78412 ?auto_78414 ) ) ( not ( = ?auto_78412 ?auto_78415 ) ) ( not ( = ?auto_78412 ?auto_78416 ) ) ( not ( = ?auto_78412 ?auto_78417 ) ) ( not ( = ?auto_78412 ?auto_78418 ) ) ( not ( = ?auto_78412 ?auto_78419 ) ) ( not ( = ?auto_78412 ?auto_78420 ) ) ( not ( = ?auto_78413 ?auto_78414 ) ) ( not ( = ?auto_78413 ?auto_78415 ) ) ( not ( = ?auto_78413 ?auto_78416 ) ) ( not ( = ?auto_78413 ?auto_78417 ) ) ( not ( = ?auto_78413 ?auto_78418 ) ) ( not ( = ?auto_78413 ?auto_78419 ) ) ( not ( = ?auto_78413 ?auto_78420 ) ) ( not ( = ?auto_78414 ?auto_78415 ) ) ( not ( = ?auto_78414 ?auto_78416 ) ) ( not ( = ?auto_78414 ?auto_78417 ) ) ( not ( = ?auto_78414 ?auto_78418 ) ) ( not ( = ?auto_78414 ?auto_78419 ) ) ( not ( = ?auto_78414 ?auto_78420 ) ) ( not ( = ?auto_78415 ?auto_78416 ) ) ( not ( = ?auto_78415 ?auto_78417 ) ) ( not ( = ?auto_78415 ?auto_78418 ) ) ( not ( = ?auto_78415 ?auto_78419 ) ) ( not ( = ?auto_78415 ?auto_78420 ) ) ( not ( = ?auto_78416 ?auto_78417 ) ) ( not ( = ?auto_78416 ?auto_78418 ) ) ( not ( = ?auto_78416 ?auto_78419 ) ) ( not ( = ?auto_78416 ?auto_78420 ) ) ( not ( = ?auto_78417 ?auto_78418 ) ) ( not ( = ?auto_78417 ?auto_78419 ) ) ( not ( = ?auto_78417 ?auto_78420 ) ) ( not ( = ?auto_78418 ?auto_78419 ) ) ( not ( = ?auto_78418 ?auto_78420 ) ) ( not ( = ?auto_78419 ?auto_78420 ) ) ( ON ?auto_78418 ?auto_78419 ) ( ON ?auto_78417 ?auto_78418 ) ( ON ?auto_78416 ?auto_78417 ) ( ON ?auto_78415 ?auto_78416 ) ( ON ?auto_78414 ?auto_78415 ) ( ON ?auto_78413 ?auto_78414 ) ( ON ?auto_78412 ?auto_78413 ) ( CLEAR ?auto_78410 ) ( ON ?auto_78411 ?auto_78412 ) ( CLEAR ?auto_78411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78410 ?auto_78411 )
      ( MAKE-10PILE ?auto_78410 ?auto_78411 ?auto_78412 ?auto_78413 ?auto_78414 ?auto_78415 ?auto_78416 ?auto_78417 ?auto_78418 ?auto_78419 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78431 - BLOCK
      ?auto_78432 - BLOCK
      ?auto_78433 - BLOCK
      ?auto_78434 - BLOCK
      ?auto_78435 - BLOCK
      ?auto_78436 - BLOCK
      ?auto_78437 - BLOCK
      ?auto_78438 - BLOCK
      ?auto_78439 - BLOCK
      ?auto_78440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78440 ) ( ON-TABLE ?auto_78431 ) ( not ( = ?auto_78431 ?auto_78432 ) ) ( not ( = ?auto_78431 ?auto_78433 ) ) ( not ( = ?auto_78431 ?auto_78434 ) ) ( not ( = ?auto_78431 ?auto_78435 ) ) ( not ( = ?auto_78431 ?auto_78436 ) ) ( not ( = ?auto_78431 ?auto_78437 ) ) ( not ( = ?auto_78431 ?auto_78438 ) ) ( not ( = ?auto_78431 ?auto_78439 ) ) ( not ( = ?auto_78431 ?auto_78440 ) ) ( not ( = ?auto_78432 ?auto_78433 ) ) ( not ( = ?auto_78432 ?auto_78434 ) ) ( not ( = ?auto_78432 ?auto_78435 ) ) ( not ( = ?auto_78432 ?auto_78436 ) ) ( not ( = ?auto_78432 ?auto_78437 ) ) ( not ( = ?auto_78432 ?auto_78438 ) ) ( not ( = ?auto_78432 ?auto_78439 ) ) ( not ( = ?auto_78432 ?auto_78440 ) ) ( not ( = ?auto_78433 ?auto_78434 ) ) ( not ( = ?auto_78433 ?auto_78435 ) ) ( not ( = ?auto_78433 ?auto_78436 ) ) ( not ( = ?auto_78433 ?auto_78437 ) ) ( not ( = ?auto_78433 ?auto_78438 ) ) ( not ( = ?auto_78433 ?auto_78439 ) ) ( not ( = ?auto_78433 ?auto_78440 ) ) ( not ( = ?auto_78434 ?auto_78435 ) ) ( not ( = ?auto_78434 ?auto_78436 ) ) ( not ( = ?auto_78434 ?auto_78437 ) ) ( not ( = ?auto_78434 ?auto_78438 ) ) ( not ( = ?auto_78434 ?auto_78439 ) ) ( not ( = ?auto_78434 ?auto_78440 ) ) ( not ( = ?auto_78435 ?auto_78436 ) ) ( not ( = ?auto_78435 ?auto_78437 ) ) ( not ( = ?auto_78435 ?auto_78438 ) ) ( not ( = ?auto_78435 ?auto_78439 ) ) ( not ( = ?auto_78435 ?auto_78440 ) ) ( not ( = ?auto_78436 ?auto_78437 ) ) ( not ( = ?auto_78436 ?auto_78438 ) ) ( not ( = ?auto_78436 ?auto_78439 ) ) ( not ( = ?auto_78436 ?auto_78440 ) ) ( not ( = ?auto_78437 ?auto_78438 ) ) ( not ( = ?auto_78437 ?auto_78439 ) ) ( not ( = ?auto_78437 ?auto_78440 ) ) ( not ( = ?auto_78438 ?auto_78439 ) ) ( not ( = ?auto_78438 ?auto_78440 ) ) ( not ( = ?auto_78439 ?auto_78440 ) ) ( ON ?auto_78439 ?auto_78440 ) ( ON ?auto_78438 ?auto_78439 ) ( ON ?auto_78437 ?auto_78438 ) ( ON ?auto_78436 ?auto_78437 ) ( ON ?auto_78435 ?auto_78436 ) ( ON ?auto_78434 ?auto_78435 ) ( ON ?auto_78433 ?auto_78434 ) ( CLEAR ?auto_78431 ) ( ON ?auto_78432 ?auto_78433 ) ( CLEAR ?auto_78432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78431 ?auto_78432 )
      ( MAKE-10PILE ?auto_78431 ?auto_78432 ?auto_78433 ?auto_78434 ?auto_78435 ?auto_78436 ?auto_78437 ?auto_78438 ?auto_78439 ?auto_78440 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78451 - BLOCK
      ?auto_78452 - BLOCK
      ?auto_78453 - BLOCK
      ?auto_78454 - BLOCK
      ?auto_78455 - BLOCK
      ?auto_78456 - BLOCK
      ?auto_78457 - BLOCK
      ?auto_78458 - BLOCK
      ?auto_78459 - BLOCK
      ?auto_78460 - BLOCK
    )
    :vars
    (
      ?auto_78461 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78460 ?auto_78461 ) ( not ( = ?auto_78451 ?auto_78452 ) ) ( not ( = ?auto_78451 ?auto_78453 ) ) ( not ( = ?auto_78451 ?auto_78454 ) ) ( not ( = ?auto_78451 ?auto_78455 ) ) ( not ( = ?auto_78451 ?auto_78456 ) ) ( not ( = ?auto_78451 ?auto_78457 ) ) ( not ( = ?auto_78451 ?auto_78458 ) ) ( not ( = ?auto_78451 ?auto_78459 ) ) ( not ( = ?auto_78451 ?auto_78460 ) ) ( not ( = ?auto_78451 ?auto_78461 ) ) ( not ( = ?auto_78452 ?auto_78453 ) ) ( not ( = ?auto_78452 ?auto_78454 ) ) ( not ( = ?auto_78452 ?auto_78455 ) ) ( not ( = ?auto_78452 ?auto_78456 ) ) ( not ( = ?auto_78452 ?auto_78457 ) ) ( not ( = ?auto_78452 ?auto_78458 ) ) ( not ( = ?auto_78452 ?auto_78459 ) ) ( not ( = ?auto_78452 ?auto_78460 ) ) ( not ( = ?auto_78452 ?auto_78461 ) ) ( not ( = ?auto_78453 ?auto_78454 ) ) ( not ( = ?auto_78453 ?auto_78455 ) ) ( not ( = ?auto_78453 ?auto_78456 ) ) ( not ( = ?auto_78453 ?auto_78457 ) ) ( not ( = ?auto_78453 ?auto_78458 ) ) ( not ( = ?auto_78453 ?auto_78459 ) ) ( not ( = ?auto_78453 ?auto_78460 ) ) ( not ( = ?auto_78453 ?auto_78461 ) ) ( not ( = ?auto_78454 ?auto_78455 ) ) ( not ( = ?auto_78454 ?auto_78456 ) ) ( not ( = ?auto_78454 ?auto_78457 ) ) ( not ( = ?auto_78454 ?auto_78458 ) ) ( not ( = ?auto_78454 ?auto_78459 ) ) ( not ( = ?auto_78454 ?auto_78460 ) ) ( not ( = ?auto_78454 ?auto_78461 ) ) ( not ( = ?auto_78455 ?auto_78456 ) ) ( not ( = ?auto_78455 ?auto_78457 ) ) ( not ( = ?auto_78455 ?auto_78458 ) ) ( not ( = ?auto_78455 ?auto_78459 ) ) ( not ( = ?auto_78455 ?auto_78460 ) ) ( not ( = ?auto_78455 ?auto_78461 ) ) ( not ( = ?auto_78456 ?auto_78457 ) ) ( not ( = ?auto_78456 ?auto_78458 ) ) ( not ( = ?auto_78456 ?auto_78459 ) ) ( not ( = ?auto_78456 ?auto_78460 ) ) ( not ( = ?auto_78456 ?auto_78461 ) ) ( not ( = ?auto_78457 ?auto_78458 ) ) ( not ( = ?auto_78457 ?auto_78459 ) ) ( not ( = ?auto_78457 ?auto_78460 ) ) ( not ( = ?auto_78457 ?auto_78461 ) ) ( not ( = ?auto_78458 ?auto_78459 ) ) ( not ( = ?auto_78458 ?auto_78460 ) ) ( not ( = ?auto_78458 ?auto_78461 ) ) ( not ( = ?auto_78459 ?auto_78460 ) ) ( not ( = ?auto_78459 ?auto_78461 ) ) ( not ( = ?auto_78460 ?auto_78461 ) ) ( ON ?auto_78459 ?auto_78460 ) ( ON ?auto_78458 ?auto_78459 ) ( ON ?auto_78457 ?auto_78458 ) ( ON ?auto_78456 ?auto_78457 ) ( ON ?auto_78455 ?auto_78456 ) ( ON ?auto_78454 ?auto_78455 ) ( ON ?auto_78453 ?auto_78454 ) ( ON ?auto_78452 ?auto_78453 ) ( ON ?auto_78451 ?auto_78452 ) ( CLEAR ?auto_78451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78451 )
      ( MAKE-10PILE ?auto_78451 ?auto_78452 ?auto_78453 ?auto_78454 ?auto_78455 ?auto_78456 ?auto_78457 ?auto_78458 ?auto_78459 ?auto_78460 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78472 - BLOCK
      ?auto_78473 - BLOCK
      ?auto_78474 - BLOCK
      ?auto_78475 - BLOCK
      ?auto_78476 - BLOCK
      ?auto_78477 - BLOCK
      ?auto_78478 - BLOCK
      ?auto_78479 - BLOCK
      ?auto_78480 - BLOCK
      ?auto_78481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78481 ) ( not ( = ?auto_78472 ?auto_78473 ) ) ( not ( = ?auto_78472 ?auto_78474 ) ) ( not ( = ?auto_78472 ?auto_78475 ) ) ( not ( = ?auto_78472 ?auto_78476 ) ) ( not ( = ?auto_78472 ?auto_78477 ) ) ( not ( = ?auto_78472 ?auto_78478 ) ) ( not ( = ?auto_78472 ?auto_78479 ) ) ( not ( = ?auto_78472 ?auto_78480 ) ) ( not ( = ?auto_78472 ?auto_78481 ) ) ( not ( = ?auto_78473 ?auto_78474 ) ) ( not ( = ?auto_78473 ?auto_78475 ) ) ( not ( = ?auto_78473 ?auto_78476 ) ) ( not ( = ?auto_78473 ?auto_78477 ) ) ( not ( = ?auto_78473 ?auto_78478 ) ) ( not ( = ?auto_78473 ?auto_78479 ) ) ( not ( = ?auto_78473 ?auto_78480 ) ) ( not ( = ?auto_78473 ?auto_78481 ) ) ( not ( = ?auto_78474 ?auto_78475 ) ) ( not ( = ?auto_78474 ?auto_78476 ) ) ( not ( = ?auto_78474 ?auto_78477 ) ) ( not ( = ?auto_78474 ?auto_78478 ) ) ( not ( = ?auto_78474 ?auto_78479 ) ) ( not ( = ?auto_78474 ?auto_78480 ) ) ( not ( = ?auto_78474 ?auto_78481 ) ) ( not ( = ?auto_78475 ?auto_78476 ) ) ( not ( = ?auto_78475 ?auto_78477 ) ) ( not ( = ?auto_78475 ?auto_78478 ) ) ( not ( = ?auto_78475 ?auto_78479 ) ) ( not ( = ?auto_78475 ?auto_78480 ) ) ( not ( = ?auto_78475 ?auto_78481 ) ) ( not ( = ?auto_78476 ?auto_78477 ) ) ( not ( = ?auto_78476 ?auto_78478 ) ) ( not ( = ?auto_78476 ?auto_78479 ) ) ( not ( = ?auto_78476 ?auto_78480 ) ) ( not ( = ?auto_78476 ?auto_78481 ) ) ( not ( = ?auto_78477 ?auto_78478 ) ) ( not ( = ?auto_78477 ?auto_78479 ) ) ( not ( = ?auto_78477 ?auto_78480 ) ) ( not ( = ?auto_78477 ?auto_78481 ) ) ( not ( = ?auto_78478 ?auto_78479 ) ) ( not ( = ?auto_78478 ?auto_78480 ) ) ( not ( = ?auto_78478 ?auto_78481 ) ) ( not ( = ?auto_78479 ?auto_78480 ) ) ( not ( = ?auto_78479 ?auto_78481 ) ) ( not ( = ?auto_78480 ?auto_78481 ) ) ( ON ?auto_78480 ?auto_78481 ) ( ON ?auto_78479 ?auto_78480 ) ( ON ?auto_78478 ?auto_78479 ) ( ON ?auto_78477 ?auto_78478 ) ( ON ?auto_78476 ?auto_78477 ) ( ON ?auto_78475 ?auto_78476 ) ( ON ?auto_78474 ?auto_78475 ) ( ON ?auto_78473 ?auto_78474 ) ( ON ?auto_78472 ?auto_78473 ) ( CLEAR ?auto_78472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78472 )
      ( MAKE-10PILE ?auto_78472 ?auto_78473 ?auto_78474 ?auto_78475 ?auto_78476 ?auto_78477 ?auto_78478 ?auto_78479 ?auto_78480 ?auto_78481 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_78492 - BLOCK
      ?auto_78493 - BLOCK
      ?auto_78494 - BLOCK
      ?auto_78495 - BLOCK
      ?auto_78496 - BLOCK
      ?auto_78497 - BLOCK
      ?auto_78498 - BLOCK
      ?auto_78499 - BLOCK
      ?auto_78500 - BLOCK
      ?auto_78501 - BLOCK
    )
    :vars
    (
      ?auto_78502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78492 ?auto_78493 ) ) ( not ( = ?auto_78492 ?auto_78494 ) ) ( not ( = ?auto_78492 ?auto_78495 ) ) ( not ( = ?auto_78492 ?auto_78496 ) ) ( not ( = ?auto_78492 ?auto_78497 ) ) ( not ( = ?auto_78492 ?auto_78498 ) ) ( not ( = ?auto_78492 ?auto_78499 ) ) ( not ( = ?auto_78492 ?auto_78500 ) ) ( not ( = ?auto_78492 ?auto_78501 ) ) ( not ( = ?auto_78493 ?auto_78494 ) ) ( not ( = ?auto_78493 ?auto_78495 ) ) ( not ( = ?auto_78493 ?auto_78496 ) ) ( not ( = ?auto_78493 ?auto_78497 ) ) ( not ( = ?auto_78493 ?auto_78498 ) ) ( not ( = ?auto_78493 ?auto_78499 ) ) ( not ( = ?auto_78493 ?auto_78500 ) ) ( not ( = ?auto_78493 ?auto_78501 ) ) ( not ( = ?auto_78494 ?auto_78495 ) ) ( not ( = ?auto_78494 ?auto_78496 ) ) ( not ( = ?auto_78494 ?auto_78497 ) ) ( not ( = ?auto_78494 ?auto_78498 ) ) ( not ( = ?auto_78494 ?auto_78499 ) ) ( not ( = ?auto_78494 ?auto_78500 ) ) ( not ( = ?auto_78494 ?auto_78501 ) ) ( not ( = ?auto_78495 ?auto_78496 ) ) ( not ( = ?auto_78495 ?auto_78497 ) ) ( not ( = ?auto_78495 ?auto_78498 ) ) ( not ( = ?auto_78495 ?auto_78499 ) ) ( not ( = ?auto_78495 ?auto_78500 ) ) ( not ( = ?auto_78495 ?auto_78501 ) ) ( not ( = ?auto_78496 ?auto_78497 ) ) ( not ( = ?auto_78496 ?auto_78498 ) ) ( not ( = ?auto_78496 ?auto_78499 ) ) ( not ( = ?auto_78496 ?auto_78500 ) ) ( not ( = ?auto_78496 ?auto_78501 ) ) ( not ( = ?auto_78497 ?auto_78498 ) ) ( not ( = ?auto_78497 ?auto_78499 ) ) ( not ( = ?auto_78497 ?auto_78500 ) ) ( not ( = ?auto_78497 ?auto_78501 ) ) ( not ( = ?auto_78498 ?auto_78499 ) ) ( not ( = ?auto_78498 ?auto_78500 ) ) ( not ( = ?auto_78498 ?auto_78501 ) ) ( not ( = ?auto_78499 ?auto_78500 ) ) ( not ( = ?auto_78499 ?auto_78501 ) ) ( not ( = ?auto_78500 ?auto_78501 ) ) ( ON ?auto_78492 ?auto_78502 ) ( not ( = ?auto_78501 ?auto_78502 ) ) ( not ( = ?auto_78500 ?auto_78502 ) ) ( not ( = ?auto_78499 ?auto_78502 ) ) ( not ( = ?auto_78498 ?auto_78502 ) ) ( not ( = ?auto_78497 ?auto_78502 ) ) ( not ( = ?auto_78496 ?auto_78502 ) ) ( not ( = ?auto_78495 ?auto_78502 ) ) ( not ( = ?auto_78494 ?auto_78502 ) ) ( not ( = ?auto_78493 ?auto_78502 ) ) ( not ( = ?auto_78492 ?auto_78502 ) ) ( ON ?auto_78493 ?auto_78492 ) ( ON ?auto_78494 ?auto_78493 ) ( ON ?auto_78495 ?auto_78494 ) ( ON ?auto_78496 ?auto_78495 ) ( ON ?auto_78497 ?auto_78496 ) ( ON ?auto_78498 ?auto_78497 ) ( ON ?auto_78499 ?auto_78498 ) ( ON ?auto_78500 ?auto_78499 ) ( ON ?auto_78501 ?auto_78500 ) ( CLEAR ?auto_78501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_78501 ?auto_78500 ?auto_78499 ?auto_78498 ?auto_78497 ?auto_78496 ?auto_78495 ?auto_78494 ?auto_78493 ?auto_78492 )
      ( MAKE-10PILE ?auto_78492 ?auto_78493 ?auto_78494 ?auto_78495 ?auto_78496 ?auto_78497 ?auto_78498 ?auto_78499 ?auto_78500 ?auto_78501 ) )
  )

)

