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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_132828 - BLOCK
      ?auto_132829 - BLOCK
      ?auto_132830 - BLOCK
      ?auto_132831 - BLOCK
      ?auto_132832 - BLOCK
      ?auto_132833 - BLOCK
      ?auto_132834 - BLOCK
      ?auto_132835 - BLOCK
    )
    :vars
    (
      ?auto_132836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132836 ?auto_132835 ) ( CLEAR ?auto_132836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132828 ) ( ON ?auto_132829 ?auto_132828 ) ( ON ?auto_132830 ?auto_132829 ) ( ON ?auto_132831 ?auto_132830 ) ( ON ?auto_132832 ?auto_132831 ) ( ON ?auto_132833 ?auto_132832 ) ( ON ?auto_132834 ?auto_132833 ) ( ON ?auto_132835 ?auto_132834 ) ( not ( = ?auto_132828 ?auto_132829 ) ) ( not ( = ?auto_132828 ?auto_132830 ) ) ( not ( = ?auto_132828 ?auto_132831 ) ) ( not ( = ?auto_132828 ?auto_132832 ) ) ( not ( = ?auto_132828 ?auto_132833 ) ) ( not ( = ?auto_132828 ?auto_132834 ) ) ( not ( = ?auto_132828 ?auto_132835 ) ) ( not ( = ?auto_132828 ?auto_132836 ) ) ( not ( = ?auto_132829 ?auto_132830 ) ) ( not ( = ?auto_132829 ?auto_132831 ) ) ( not ( = ?auto_132829 ?auto_132832 ) ) ( not ( = ?auto_132829 ?auto_132833 ) ) ( not ( = ?auto_132829 ?auto_132834 ) ) ( not ( = ?auto_132829 ?auto_132835 ) ) ( not ( = ?auto_132829 ?auto_132836 ) ) ( not ( = ?auto_132830 ?auto_132831 ) ) ( not ( = ?auto_132830 ?auto_132832 ) ) ( not ( = ?auto_132830 ?auto_132833 ) ) ( not ( = ?auto_132830 ?auto_132834 ) ) ( not ( = ?auto_132830 ?auto_132835 ) ) ( not ( = ?auto_132830 ?auto_132836 ) ) ( not ( = ?auto_132831 ?auto_132832 ) ) ( not ( = ?auto_132831 ?auto_132833 ) ) ( not ( = ?auto_132831 ?auto_132834 ) ) ( not ( = ?auto_132831 ?auto_132835 ) ) ( not ( = ?auto_132831 ?auto_132836 ) ) ( not ( = ?auto_132832 ?auto_132833 ) ) ( not ( = ?auto_132832 ?auto_132834 ) ) ( not ( = ?auto_132832 ?auto_132835 ) ) ( not ( = ?auto_132832 ?auto_132836 ) ) ( not ( = ?auto_132833 ?auto_132834 ) ) ( not ( = ?auto_132833 ?auto_132835 ) ) ( not ( = ?auto_132833 ?auto_132836 ) ) ( not ( = ?auto_132834 ?auto_132835 ) ) ( not ( = ?auto_132834 ?auto_132836 ) ) ( not ( = ?auto_132835 ?auto_132836 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132836 ?auto_132835 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132838 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132838 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_132838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_132839 - BLOCK
    )
    :vars
    (
      ?auto_132840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132839 ?auto_132840 ) ( CLEAR ?auto_132839 ) ( HAND-EMPTY ) ( not ( = ?auto_132839 ?auto_132840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132839 ?auto_132840 )
      ( MAKE-1PILE ?auto_132839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132848 - BLOCK
      ?auto_132849 - BLOCK
      ?auto_132850 - BLOCK
      ?auto_132851 - BLOCK
      ?auto_132852 - BLOCK
      ?auto_132853 - BLOCK
      ?auto_132854 - BLOCK
    )
    :vars
    (
      ?auto_132855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132855 ?auto_132854 ) ( CLEAR ?auto_132855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132848 ) ( ON ?auto_132849 ?auto_132848 ) ( ON ?auto_132850 ?auto_132849 ) ( ON ?auto_132851 ?auto_132850 ) ( ON ?auto_132852 ?auto_132851 ) ( ON ?auto_132853 ?auto_132852 ) ( ON ?auto_132854 ?auto_132853 ) ( not ( = ?auto_132848 ?auto_132849 ) ) ( not ( = ?auto_132848 ?auto_132850 ) ) ( not ( = ?auto_132848 ?auto_132851 ) ) ( not ( = ?auto_132848 ?auto_132852 ) ) ( not ( = ?auto_132848 ?auto_132853 ) ) ( not ( = ?auto_132848 ?auto_132854 ) ) ( not ( = ?auto_132848 ?auto_132855 ) ) ( not ( = ?auto_132849 ?auto_132850 ) ) ( not ( = ?auto_132849 ?auto_132851 ) ) ( not ( = ?auto_132849 ?auto_132852 ) ) ( not ( = ?auto_132849 ?auto_132853 ) ) ( not ( = ?auto_132849 ?auto_132854 ) ) ( not ( = ?auto_132849 ?auto_132855 ) ) ( not ( = ?auto_132850 ?auto_132851 ) ) ( not ( = ?auto_132850 ?auto_132852 ) ) ( not ( = ?auto_132850 ?auto_132853 ) ) ( not ( = ?auto_132850 ?auto_132854 ) ) ( not ( = ?auto_132850 ?auto_132855 ) ) ( not ( = ?auto_132851 ?auto_132852 ) ) ( not ( = ?auto_132851 ?auto_132853 ) ) ( not ( = ?auto_132851 ?auto_132854 ) ) ( not ( = ?auto_132851 ?auto_132855 ) ) ( not ( = ?auto_132852 ?auto_132853 ) ) ( not ( = ?auto_132852 ?auto_132854 ) ) ( not ( = ?auto_132852 ?auto_132855 ) ) ( not ( = ?auto_132853 ?auto_132854 ) ) ( not ( = ?auto_132853 ?auto_132855 ) ) ( not ( = ?auto_132854 ?auto_132855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132855 ?auto_132854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132856 - BLOCK
      ?auto_132857 - BLOCK
      ?auto_132858 - BLOCK
      ?auto_132859 - BLOCK
      ?auto_132860 - BLOCK
      ?auto_132861 - BLOCK
      ?auto_132862 - BLOCK
    )
    :vars
    (
      ?auto_132863 - BLOCK
      ?auto_132864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132863 ?auto_132862 ) ( CLEAR ?auto_132863 ) ( ON-TABLE ?auto_132856 ) ( ON ?auto_132857 ?auto_132856 ) ( ON ?auto_132858 ?auto_132857 ) ( ON ?auto_132859 ?auto_132858 ) ( ON ?auto_132860 ?auto_132859 ) ( ON ?auto_132861 ?auto_132860 ) ( ON ?auto_132862 ?auto_132861 ) ( not ( = ?auto_132856 ?auto_132857 ) ) ( not ( = ?auto_132856 ?auto_132858 ) ) ( not ( = ?auto_132856 ?auto_132859 ) ) ( not ( = ?auto_132856 ?auto_132860 ) ) ( not ( = ?auto_132856 ?auto_132861 ) ) ( not ( = ?auto_132856 ?auto_132862 ) ) ( not ( = ?auto_132856 ?auto_132863 ) ) ( not ( = ?auto_132857 ?auto_132858 ) ) ( not ( = ?auto_132857 ?auto_132859 ) ) ( not ( = ?auto_132857 ?auto_132860 ) ) ( not ( = ?auto_132857 ?auto_132861 ) ) ( not ( = ?auto_132857 ?auto_132862 ) ) ( not ( = ?auto_132857 ?auto_132863 ) ) ( not ( = ?auto_132858 ?auto_132859 ) ) ( not ( = ?auto_132858 ?auto_132860 ) ) ( not ( = ?auto_132858 ?auto_132861 ) ) ( not ( = ?auto_132858 ?auto_132862 ) ) ( not ( = ?auto_132858 ?auto_132863 ) ) ( not ( = ?auto_132859 ?auto_132860 ) ) ( not ( = ?auto_132859 ?auto_132861 ) ) ( not ( = ?auto_132859 ?auto_132862 ) ) ( not ( = ?auto_132859 ?auto_132863 ) ) ( not ( = ?auto_132860 ?auto_132861 ) ) ( not ( = ?auto_132860 ?auto_132862 ) ) ( not ( = ?auto_132860 ?auto_132863 ) ) ( not ( = ?auto_132861 ?auto_132862 ) ) ( not ( = ?auto_132861 ?auto_132863 ) ) ( not ( = ?auto_132862 ?auto_132863 ) ) ( HOLDING ?auto_132864 ) ( not ( = ?auto_132856 ?auto_132864 ) ) ( not ( = ?auto_132857 ?auto_132864 ) ) ( not ( = ?auto_132858 ?auto_132864 ) ) ( not ( = ?auto_132859 ?auto_132864 ) ) ( not ( = ?auto_132860 ?auto_132864 ) ) ( not ( = ?auto_132861 ?auto_132864 ) ) ( not ( = ?auto_132862 ?auto_132864 ) ) ( not ( = ?auto_132863 ?auto_132864 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_132864 )
      ( MAKE-7PILE ?auto_132856 ?auto_132857 ?auto_132858 ?auto_132859 ?auto_132860 ?auto_132861 ?auto_132862 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_132865 - BLOCK
      ?auto_132866 - BLOCK
      ?auto_132867 - BLOCK
      ?auto_132868 - BLOCK
      ?auto_132869 - BLOCK
      ?auto_132870 - BLOCK
      ?auto_132871 - BLOCK
    )
    :vars
    (
      ?auto_132872 - BLOCK
      ?auto_132873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132872 ?auto_132871 ) ( ON-TABLE ?auto_132865 ) ( ON ?auto_132866 ?auto_132865 ) ( ON ?auto_132867 ?auto_132866 ) ( ON ?auto_132868 ?auto_132867 ) ( ON ?auto_132869 ?auto_132868 ) ( ON ?auto_132870 ?auto_132869 ) ( ON ?auto_132871 ?auto_132870 ) ( not ( = ?auto_132865 ?auto_132866 ) ) ( not ( = ?auto_132865 ?auto_132867 ) ) ( not ( = ?auto_132865 ?auto_132868 ) ) ( not ( = ?auto_132865 ?auto_132869 ) ) ( not ( = ?auto_132865 ?auto_132870 ) ) ( not ( = ?auto_132865 ?auto_132871 ) ) ( not ( = ?auto_132865 ?auto_132872 ) ) ( not ( = ?auto_132866 ?auto_132867 ) ) ( not ( = ?auto_132866 ?auto_132868 ) ) ( not ( = ?auto_132866 ?auto_132869 ) ) ( not ( = ?auto_132866 ?auto_132870 ) ) ( not ( = ?auto_132866 ?auto_132871 ) ) ( not ( = ?auto_132866 ?auto_132872 ) ) ( not ( = ?auto_132867 ?auto_132868 ) ) ( not ( = ?auto_132867 ?auto_132869 ) ) ( not ( = ?auto_132867 ?auto_132870 ) ) ( not ( = ?auto_132867 ?auto_132871 ) ) ( not ( = ?auto_132867 ?auto_132872 ) ) ( not ( = ?auto_132868 ?auto_132869 ) ) ( not ( = ?auto_132868 ?auto_132870 ) ) ( not ( = ?auto_132868 ?auto_132871 ) ) ( not ( = ?auto_132868 ?auto_132872 ) ) ( not ( = ?auto_132869 ?auto_132870 ) ) ( not ( = ?auto_132869 ?auto_132871 ) ) ( not ( = ?auto_132869 ?auto_132872 ) ) ( not ( = ?auto_132870 ?auto_132871 ) ) ( not ( = ?auto_132870 ?auto_132872 ) ) ( not ( = ?auto_132871 ?auto_132872 ) ) ( not ( = ?auto_132865 ?auto_132873 ) ) ( not ( = ?auto_132866 ?auto_132873 ) ) ( not ( = ?auto_132867 ?auto_132873 ) ) ( not ( = ?auto_132868 ?auto_132873 ) ) ( not ( = ?auto_132869 ?auto_132873 ) ) ( not ( = ?auto_132870 ?auto_132873 ) ) ( not ( = ?auto_132871 ?auto_132873 ) ) ( not ( = ?auto_132872 ?auto_132873 ) ) ( ON ?auto_132873 ?auto_132872 ) ( CLEAR ?auto_132873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132865 ?auto_132866 ?auto_132867 ?auto_132868 ?auto_132869 ?auto_132870 ?auto_132871 ?auto_132872 )
      ( MAKE-7PILE ?auto_132865 ?auto_132866 ?auto_132867 ?auto_132868 ?auto_132869 ?auto_132870 ?auto_132871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132876 - BLOCK
      ?auto_132877 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132877 ) ( CLEAR ?auto_132876 ) ( ON-TABLE ?auto_132876 ) ( not ( = ?auto_132876 ?auto_132877 ) ) )
    :subtasks
    ( ( !STACK ?auto_132877 ?auto_132876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132878 - BLOCK
      ?auto_132879 - BLOCK
    )
    :vars
    (
      ?auto_132880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132878 ) ( ON-TABLE ?auto_132878 ) ( not ( = ?auto_132878 ?auto_132879 ) ) ( ON ?auto_132879 ?auto_132880 ) ( CLEAR ?auto_132879 ) ( HAND-EMPTY ) ( not ( = ?auto_132878 ?auto_132880 ) ) ( not ( = ?auto_132879 ?auto_132880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132879 ?auto_132880 )
      ( MAKE-2PILE ?auto_132878 ?auto_132879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132881 - BLOCK
      ?auto_132882 - BLOCK
    )
    :vars
    (
      ?auto_132883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132881 ?auto_132882 ) ) ( ON ?auto_132882 ?auto_132883 ) ( CLEAR ?auto_132882 ) ( not ( = ?auto_132881 ?auto_132883 ) ) ( not ( = ?auto_132882 ?auto_132883 ) ) ( HOLDING ?auto_132881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132881 )
      ( MAKE-2PILE ?auto_132881 ?auto_132882 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_132884 - BLOCK
      ?auto_132885 - BLOCK
    )
    :vars
    (
      ?auto_132886 - BLOCK
      ?auto_132887 - BLOCK
      ?auto_132890 - BLOCK
      ?auto_132891 - BLOCK
      ?auto_132888 - BLOCK
      ?auto_132889 - BLOCK
      ?auto_132892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132884 ?auto_132885 ) ) ( ON ?auto_132885 ?auto_132886 ) ( not ( = ?auto_132884 ?auto_132886 ) ) ( not ( = ?auto_132885 ?auto_132886 ) ) ( ON ?auto_132884 ?auto_132885 ) ( CLEAR ?auto_132884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132887 ) ( ON ?auto_132890 ?auto_132887 ) ( ON ?auto_132891 ?auto_132890 ) ( ON ?auto_132888 ?auto_132891 ) ( ON ?auto_132889 ?auto_132888 ) ( ON ?auto_132892 ?auto_132889 ) ( ON ?auto_132886 ?auto_132892 ) ( not ( = ?auto_132887 ?auto_132890 ) ) ( not ( = ?auto_132887 ?auto_132891 ) ) ( not ( = ?auto_132887 ?auto_132888 ) ) ( not ( = ?auto_132887 ?auto_132889 ) ) ( not ( = ?auto_132887 ?auto_132892 ) ) ( not ( = ?auto_132887 ?auto_132886 ) ) ( not ( = ?auto_132887 ?auto_132885 ) ) ( not ( = ?auto_132887 ?auto_132884 ) ) ( not ( = ?auto_132890 ?auto_132891 ) ) ( not ( = ?auto_132890 ?auto_132888 ) ) ( not ( = ?auto_132890 ?auto_132889 ) ) ( not ( = ?auto_132890 ?auto_132892 ) ) ( not ( = ?auto_132890 ?auto_132886 ) ) ( not ( = ?auto_132890 ?auto_132885 ) ) ( not ( = ?auto_132890 ?auto_132884 ) ) ( not ( = ?auto_132891 ?auto_132888 ) ) ( not ( = ?auto_132891 ?auto_132889 ) ) ( not ( = ?auto_132891 ?auto_132892 ) ) ( not ( = ?auto_132891 ?auto_132886 ) ) ( not ( = ?auto_132891 ?auto_132885 ) ) ( not ( = ?auto_132891 ?auto_132884 ) ) ( not ( = ?auto_132888 ?auto_132889 ) ) ( not ( = ?auto_132888 ?auto_132892 ) ) ( not ( = ?auto_132888 ?auto_132886 ) ) ( not ( = ?auto_132888 ?auto_132885 ) ) ( not ( = ?auto_132888 ?auto_132884 ) ) ( not ( = ?auto_132889 ?auto_132892 ) ) ( not ( = ?auto_132889 ?auto_132886 ) ) ( not ( = ?auto_132889 ?auto_132885 ) ) ( not ( = ?auto_132889 ?auto_132884 ) ) ( not ( = ?auto_132892 ?auto_132886 ) ) ( not ( = ?auto_132892 ?auto_132885 ) ) ( not ( = ?auto_132892 ?auto_132884 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132887 ?auto_132890 ?auto_132891 ?auto_132888 ?auto_132889 ?auto_132892 ?auto_132886 ?auto_132885 )
      ( MAKE-2PILE ?auto_132884 ?auto_132885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132899 - BLOCK
      ?auto_132900 - BLOCK
      ?auto_132901 - BLOCK
      ?auto_132902 - BLOCK
      ?auto_132903 - BLOCK
      ?auto_132904 - BLOCK
    )
    :vars
    (
      ?auto_132905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132905 ?auto_132904 ) ( CLEAR ?auto_132905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132899 ) ( ON ?auto_132900 ?auto_132899 ) ( ON ?auto_132901 ?auto_132900 ) ( ON ?auto_132902 ?auto_132901 ) ( ON ?auto_132903 ?auto_132902 ) ( ON ?auto_132904 ?auto_132903 ) ( not ( = ?auto_132899 ?auto_132900 ) ) ( not ( = ?auto_132899 ?auto_132901 ) ) ( not ( = ?auto_132899 ?auto_132902 ) ) ( not ( = ?auto_132899 ?auto_132903 ) ) ( not ( = ?auto_132899 ?auto_132904 ) ) ( not ( = ?auto_132899 ?auto_132905 ) ) ( not ( = ?auto_132900 ?auto_132901 ) ) ( not ( = ?auto_132900 ?auto_132902 ) ) ( not ( = ?auto_132900 ?auto_132903 ) ) ( not ( = ?auto_132900 ?auto_132904 ) ) ( not ( = ?auto_132900 ?auto_132905 ) ) ( not ( = ?auto_132901 ?auto_132902 ) ) ( not ( = ?auto_132901 ?auto_132903 ) ) ( not ( = ?auto_132901 ?auto_132904 ) ) ( not ( = ?auto_132901 ?auto_132905 ) ) ( not ( = ?auto_132902 ?auto_132903 ) ) ( not ( = ?auto_132902 ?auto_132904 ) ) ( not ( = ?auto_132902 ?auto_132905 ) ) ( not ( = ?auto_132903 ?auto_132904 ) ) ( not ( = ?auto_132903 ?auto_132905 ) ) ( not ( = ?auto_132904 ?auto_132905 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132905 ?auto_132904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132906 - BLOCK
      ?auto_132907 - BLOCK
      ?auto_132908 - BLOCK
      ?auto_132909 - BLOCK
      ?auto_132910 - BLOCK
      ?auto_132911 - BLOCK
    )
    :vars
    (
      ?auto_132912 - BLOCK
      ?auto_132913 - BLOCK
      ?auto_132914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132912 ?auto_132911 ) ( CLEAR ?auto_132912 ) ( ON-TABLE ?auto_132906 ) ( ON ?auto_132907 ?auto_132906 ) ( ON ?auto_132908 ?auto_132907 ) ( ON ?auto_132909 ?auto_132908 ) ( ON ?auto_132910 ?auto_132909 ) ( ON ?auto_132911 ?auto_132910 ) ( not ( = ?auto_132906 ?auto_132907 ) ) ( not ( = ?auto_132906 ?auto_132908 ) ) ( not ( = ?auto_132906 ?auto_132909 ) ) ( not ( = ?auto_132906 ?auto_132910 ) ) ( not ( = ?auto_132906 ?auto_132911 ) ) ( not ( = ?auto_132906 ?auto_132912 ) ) ( not ( = ?auto_132907 ?auto_132908 ) ) ( not ( = ?auto_132907 ?auto_132909 ) ) ( not ( = ?auto_132907 ?auto_132910 ) ) ( not ( = ?auto_132907 ?auto_132911 ) ) ( not ( = ?auto_132907 ?auto_132912 ) ) ( not ( = ?auto_132908 ?auto_132909 ) ) ( not ( = ?auto_132908 ?auto_132910 ) ) ( not ( = ?auto_132908 ?auto_132911 ) ) ( not ( = ?auto_132908 ?auto_132912 ) ) ( not ( = ?auto_132909 ?auto_132910 ) ) ( not ( = ?auto_132909 ?auto_132911 ) ) ( not ( = ?auto_132909 ?auto_132912 ) ) ( not ( = ?auto_132910 ?auto_132911 ) ) ( not ( = ?auto_132910 ?auto_132912 ) ) ( not ( = ?auto_132911 ?auto_132912 ) ) ( HOLDING ?auto_132913 ) ( CLEAR ?auto_132914 ) ( not ( = ?auto_132906 ?auto_132913 ) ) ( not ( = ?auto_132906 ?auto_132914 ) ) ( not ( = ?auto_132907 ?auto_132913 ) ) ( not ( = ?auto_132907 ?auto_132914 ) ) ( not ( = ?auto_132908 ?auto_132913 ) ) ( not ( = ?auto_132908 ?auto_132914 ) ) ( not ( = ?auto_132909 ?auto_132913 ) ) ( not ( = ?auto_132909 ?auto_132914 ) ) ( not ( = ?auto_132910 ?auto_132913 ) ) ( not ( = ?auto_132910 ?auto_132914 ) ) ( not ( = ?auto_132911 ?auto_132913 ) ) ( not ( = ?auto_132911 ?auto_132914 ) ) ( not ( = ?auto_132912 ?auto_132913 ) ) ( not ( = ?auto_132912 ?auto_132914 ) ) ( not ( = ?auto_132913 ?auto_132914 ) ) )
    :subtasks
    ( ( !STACK ?auto_132913 ?auto_132914 )
      ( MAKE-6PILE ?auto_132906 ?auto_132907 ?auto_132908 ?auto_132909 ?auto_132910 ?auto_132911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132915 - BLOCK
      ?auto_132916 - BLOCK
      ?auto_132917 - BLOCK
      ?auto_132918 - BLOCK
      ?auto_132919 - BLOCK
      ?auto_132920 - BLOCK
    )
    :vars
    (
      ?auto_132923 - BLOCK
      ?auto_132921 - BLOCK
      ?auto_132922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132923 ?auto_132920 ) ( ON-TABLE ?auto_132915 ) ( ON ?auto_132916 ?auto_132915 ) ( ON ?auto_132917 ?auto_132916 ) ( ON ?auto_132918 ?auto_132917 ) ( ON ?auto_132919 ?auto_132918 ) ( ON ?auto_132920 ?auto_132919 ) ( not ( = ?auto_132915 ?auto_132916 ) ) ( not ( = ?auto_132915 ?auto_132917 ) ) ( not ( = ?auto_132915 ?auto_132918 ) ) ( not ( = ?auto_132915 ?auto_132919 ) ) ( not ( = ?auto_132915 ?auto_132920 ) ) ( not ( = ?auto_132915 ?auto_132923 ) ) ( not ( = ?auto_132916 ?auto_132917 ) ) ( not ( = ?auto_132916 ?auto_132918 ) ) ( not ( = ?auto_132916 ?auto_132919 ) ) ( not ( = ?auto_132916 ?auto_132920 ) ) ( not ( = ?auto_132916 ?auto_132923 ) ) ( not ( = ?auto_132917 ?auto_132918 ) ) ( not ( = ?auto_132917 ?auto_132919 ) ) ( not ( = ?auto_132917 ?auto_132920 ) ) ( not ( = ?auto_132917 ?auto_132923 ) ) ( not ( = ?auto_132918 ?auto_132919 ) ) ( not ( = ?auto_132918 ?auto_132920 ) ) ( not ( = ?auto_132918 ?auto_132923 ) ) ( not ( = ?auto_132919 ?auto_132920 ) ) ( not ( = ?auto_132919 ?auto_132923 ) ) ( not ( = ?auto_132920 ?auto_132923 ) ) ( CLEAR ?auto_132921 ) ( not ( = ?auto_132915 ?auto_132922 ) ) ( not ( = ?auto_132915 ?auto_132921 ) ) ( not ( = ?auto_132916 ?auto_132922 ) ) ( not ( = ?auto_132916 ?auto_132921 ) ) ( not ( = ?auto_132917 ?auto_132922 ) ) ( not ( = ?auto_132917 ?auto_132921 ) ) ( not ( = ?auto_132918 ?auto_132922 ) ) ( not ( = ?auto_132918 ?auto_132921 ) ) ( not ( = ?auto_132919 ?auto_132922 ) ) ( not ( = ?auto_132919 ?auto_132921 ) ) ( not ( = ?auto_132920 ?auto_132922 ) ) ( not ( = ?auto_132920 ?auto_132921 ) ) ( not ( = ?auto_132923 ?auto_132922 ) ) ( not ( = ?auto_132923 ?auto_132921 ) ) ( not ( = ?auto_132922 ?auto_132921 ) ) ( ON ?auto_132922 ?auto_132923 ) ( CLEAR ?auto_132922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132915 ?auto_132916 ?auto_132917 ?auto_132918 ?auto_132919 ?auto_132920 ?auto_132923 )
      ( MAKE-6PILE ?auto_132915 ?auto_132916 ?auto_132917 ?auto_132918 ?auto_132919 ?auto_132920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132924 - BLOCK
      ?auto_132925 - BLOCK
      ?auto_132926 - BLOCK
      ?auto_132927 - BLOCK
      ?auto_132928 - BLOCK
      ?auto_132929 - BLOCK
    )
    :vars
    (
      ?auto_132932 - BLOCK
      ?auto_132930 - BLOCK
      ?auto_132931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132932 ?auto_132929 ) ( ON-TABLE ?auto_132924 ) ( ON ?auto_132925 ?auto_132924 ) ( ON ?auto_132926 ?auto_132925 ) ( ON ?auto_132927 ?auto_132926 ) ( ON ?auto_132928 ?auto_132927 ) ( ON ?auto_132929 ?auto_132928 ) ( not ( = ?auto_132924 ?auto_132925 ) ) ( not ( = ?auto_132924 ?auto_132926 ) ) ( not ( = ?auto_132924 ?auto_132927 ) ) ( not ( = ?auto_132924 ?auto_132928 ) ) ( not ( = ?auto_132924 ?auto_132929 ) ) ( not ( = ?auto_132924 ?auto_132932 ) ) ( not ( = ?auto_132925 ?auto_132926 ) ) ( not ( = ?auto_132925 ?auto_132927 ) ) ( not ( = ?auto_132925 ?auto_132928 ) ) ( not ( = ?auto_132925 ?auto_132929 ) ) ( not ( = ?auto_132925 ?auto_132932 ) ) ( not ( = ?auto_132926 ?auto_132927 ) ) ( not ( = ?auto_132926 ?auto_132928 ) ) ( not ( = ?auto_132926 ?auto_132929 ) ) ( not ( = ?auto_132926 ?auto_132932 ) ) ( not ( = ?auto_132927 ?auto_132928 ) ) ( not ( = ?auto_132927 ?auto_132929 ) ) ( not ( = ?auto_132927 ?auto_132932 ) ) ( not ( = ?auto_132928 ?auto_132929 ) ) ( not ( = ?auto_132928 ?auto_132932 ) ) ( not ( = ?auto_132929 ?auto_132932 ) ) ( not ( = ?auto_132924 ?auto_132930 ) ) ( not ( = ?auto_132924 ?auto_132931 ) ) ( not ( = ?auto_132925 ?auto_132930 ) ) ( not ( = ?auto_132925 ?auto_132931 ) ) ( not ( = ?auto_132926 ?auto_132930 ) ) ( not ( = ?auto_132926 ?auto_132931 ) ) ( not ( = ?auto_132927 ?auto_132930 ) ) ( not ( = ?auto_132927 ?auto_132931 ) ) ( not ( = ?auto_132928 ?auto_132930 ) ) ( not ( = ?auto_132928 ?auto_132931 ) ) ( not ( = ?auto_132929 ?auto_132930 ) ) ( not ( = ?auto_132929 ?auto_132931 ) ) ( not ( = ?auto_132932 ?auto_132930 ) ) ( not ( = ?auto_132932 ?auto_132931 ) ) ( not ( = ?auto_132930 ?auto_132931 ) ) ( ON ?auto_132930 ?auto_132932 ) ( CLEAR ?auto_132930 ) ( HOLDING ?auto_132931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132931 )
      ( MAKE-6PILE ?auto_132924 ?auto_132925 ?auto_132926 ?auto_132927 ?auto_132928 ?auto_132929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_132933 - BLOCK
      ?auto_132934 - BLOCK
      ?auto_132935 - BLOCK
      ?auto_132936 - BLOCK
      ?auto_132937 - BLOCK
      ?auto_132938 - BLOCK
    )
    :vars
    (
      ?auto_132940 - BLOCK
      ?auto_132939 - BLOCK
      ?auto_132941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132940 ?auto_132938 ) ( ON-TABLE ?auto_132933 ) ( ON ?auto_132934 ?auto_132933 ) ( ON ?auto_132935 ?auto_132934 ) ( ON ?auto_132936 ?auto_132935 ) ( ON ?auto_132937 ?auto_132936 ) ( ON ?auto_132938 ?auto_132937 ) ( not ( = ?auto_132933 ?auto_132934 ) ) ( not ( = ?auto_132933 ?auto_132935 ) ) ( not ( = ?auto_132933 ?auto_132936 ) ) ( not ( = ?auto_132933 ?auto_132937 ) ) ( not ( = ?auto_132933 ?auto_132938 ) ) ( not ( = ?auto_132933 ?auto_132940 ) ) ( not ( = ?auto_132934 ?auto_132935 ) ) ( not ( = ?auto_132934 ?auto_132936 ) ) ( not ( = ?auto_132934 ?auto_132937 ) ) ( not ( = ?auto_132934 ?auto_132938 ) ) ( not ( = ?auto_132934 ?auto_132940 ) ) ( not ( = ?auto_132935 ?auto_132936 ) ) ( not ( = ?auto_132935 ?auto_132937 ) ) ( not ( = ?auto_132935 ?auto_132938 ) ) ( not ( = ?auto_132935 ?auto_132940 ) ) ( not ( = ?auto_132936 ?auto_132937 ) ) ( not ( = ?auto_132936 ?auto_132938 ) ) ( not ( = ?auto_132936 ?auto_132940 ) ) ( not ( = ?auto_132937 ?auto_132938 ) ) ( not ( = ?auto_132937 ?auto_132940 ) ) ( not ( = ?auto_132938 ?auto_132940 ) ) ( not ( = ?auto_132933 ?auto_132939 ) ) ( not ( = ?auto_132933 ?auto_132941 ) ) ( not ( = ?auto_132934 ?auto_132939 ) ) ( not ( = ?auto_132934 ?auto_132941 ) ) ( not ( = ?auto_132935 ?auto_132939 ) ) ( not ( = ?auto_132935 ?auto_132941 ) ) ( not ( = ?auto_132936 ?auto_132939 ) ) ( not ( = ?auto_132936 ?auto_132941 ) ) ( not ( = ?auto_132937 ?auto_132939 ) ) ( not ( = ?auto_132937 ?auto_132941 ) ) ( not ( = ?auto_132938 ?auto_132939 ) ) ( not ( = ?auto_132938 ?auto_132941 ) ) ( not ( = ?auto_132940 ?auto_132939 ) ) ( not ( = ?auto_132940 ?auto_132941 ) ) ( not ( = ?auto_132939 ?auto_132941 ) ) ( ON ?auto_132939 ?auto_132940 ) ( ON ?auto_132941 ?auto_132939 ) ( CLEAR ?auto_132941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132933 ?auto_132934 ?auto_132935 ?auto_132936 ?auto_132937 ?auto_132938 ?auto_132940 ?auto_132939 )
      ( MAKE-6PILE ?auto_132933 ?auto_132934 ?auto_132935 ?auto_132936 ?auto_132937 ?auto_132938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132945 - BLOCK
      ?auto_132946 - BLOCK
      ?auto_132947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_132947 ) ( CLEAR ?auto_132946 ) ( ON-TABLE ?auto_132945 ) ( ON ?auto_132946 ?auto_132945 ) ( not ( = ?auto_132945 ?auto_132946 ) ) ( not ( = ?auto_132945 ?auto_132947 ) ) ( not ( = ?auto_132946 ?auto_132947 ) ) )
    :subtasks
    ( ( !STACK ?auto_132947 ?auto_132946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132948 - BLOCK
      ?auto_132949 - BLOCK
      ?auto_132950 - BLOCK
    )
    :vars
    (
      ?auto_132951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_132949 ) ( ON-TABLE ?auto_132948 ) ( ON ?auto_132949 ?auto_132948 ) ( not ( = ?auto_132948 ?auto_132949 ) ) ( not ( = ?auto_132948 ?auto_132950 ) ) ( not ( = ?auto_132949 ?auto_132950 ) ) ( ON ?auto_132950 ?auto_132951 ) ( CLEAR ?auto_132950 ) ( HAND-EMPTY ) ( not ( = ?auto_132948 ?auto_132951 ) ) ( not ( = ?auto_132949 ?auto_132951 ) ) ( not ( = ?auto_132950 ?auto_132951 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132950 ?auto_132951 )
      ( MAKE-3PILE ?auto_132948 ?auto_132949 ?auto_132950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132952 - BLOCK
      ?auto_132953 - BLOCK
      ?auto_132954 - BLOCK
    )
    :vars
    (
      ?auto_132955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132952 ) ( not ( = ?auto_132952 ?auto_132953 ) ) ( not ( = ?auto_132952 ?auto_132954 ) ) ( not ( = ?auto_132953 ?auto_132954 ) ) ( ON ?auto_132954 ?auto_132955 ) ( CLEAR ?auto_132954 ) ( not ( = ?auto_132952 ?auto_132955 ) ) ( not ( = ?auto_132953 ?auto_132955 ) ) ( not ( = ?auto_132954 ?auto_132955 ) ) ( HOLDING ?auto_132953 ) ( CLEAR ?auto_132952 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_132952 ?auto_132953 )
      ( MAKE-3PILE ?auto_132952 ?auto_132953 ?auto_132954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132956 - BLOCK
      ?auto_132957 - BLOCK
      ?auto_132958 - BLOCK
    )
    :vars
    (
      ?auto_132959 - BLOCK
      ?auto_132960 - BLOCK
      ?auto_132962 - BLOCK
      ?auto_132964 - BLOCK
      ?auto_132961 - BLOCK
      ?auto_132963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_132956 ) ( not ( = ?auto_132956 ?auto_132957 ) ) ( not ( = ?auto_132956 ?auto_132958 ) ) ( not ( = ?auto_132957 ?auto_132958 ) ) ( ON ?auto_132958 ?auto_132959 ) ( not ( = ?auto_132956 ?auto_132959 ) ) ( not ( = ?auto_132957 ?auto_132959 ) ) ( not ( = ?auto_132958 ?auto_132959 ) ) ( CLEAR ?auto_132956 ) ( ON ?auto_132957 ?auto_132958 ) ( CLEAR ?auto_132957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132960 ) ( ON ?auto_132962 ?auto_132960 ) ( ON ?auto_132964 ?auto_132962 ) ( ON ?auto_132961 ?auto_132964 ) ( ON ?auto_132963 ?auto_132961 ) ( ON ?auto_132959 ?auto_132963 ) ( not ( = ?auto_132960 ?auto_132962 ) ) ( not ( = ?auto_132960 ?auto_132964 ) ) ( not ( = ?auto_132960 ?auto_132961 ) ) ( not ( = ?auto_132960 ?auto_132963 ) ) ( not ( = ?auto_132960 ?auto_132959 ) ) ( not ( = ?auto_132960 ?auto_132958 ) ) ( not ( = ?auto_132960 ?auto_132957 ) ) ( not ( = ?auto_132962 ?auto_132964 ) ) ( not ( = ?auto_132962 ?auto_132961 ) ) ( not ( = ?auto_132962 ?auto_132963 ) ) ( not ( = ?auto_132962 ?auto_132959 ) ) ( not ( = ?auto_132962 ?auto_132958 ) ) ( not ( = ?auto_132962 ?auto_132957 ) ) ( not ( = ?auto_132964 ?auto_132961 ) ) ( not ( = ?auto_132964 ?auto_132963 ) ) ( not ( = ?auto_132964 ?auto_132959 ) ) ( not ( = ?auto_132964 ?auto_132958 ) ) ( not ( = ?auto_132964 ?auto_132957 ) ) ( not ( = ?auto_132961 ?auto_132963 ) ) ( not ( = ?auto_132961 ?auto_132959 ) ) ( not ( = ?auto_132961 ?auto_132958 ) ) ( not ( = ?auto_132961 ?auto_132957 ) ) ( not ( = ?auto_132963 ?auto_132959 ) ) ( not ( = ?auto_132963 ?auto_132958 ) ) ( not ( = ?auto_132963 ?auto_132957 ) ) ( not ( = ?auto_132956 ?auto_132960 ) ) ( not ( = ?auto_132956 ?auto_132962 ) ) ( not ( = ?auto_132956 ?auto_132964 ) ) ( not ( = ?auto_132956 ?auto_132961 ) ) ( not ( = ?auto_132956 ?auto_132963 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_132960 ?auto_132962 ?auto_132964 ?auto_132961 ?auto_132963 ?auto_132959 ?auto_132958 )
      ( MAKE-3PILE ?auto_132956 ?auto_132957 ?auto_132958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132965 - BLOCK
      ?auto_132966 - BLOCK
      ?auto_132967 - BLOCK
    )
    :vars
    (
      ?auto_132969 - BLOCK
      ?auto_132968 - BLOCK
      ?auto_132972 - BLOCK
      ?auto_132970 - BLOCK
      ?auto_132973 - BLOCK
      ?auto_132971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132965 ?auto_132966 ) ) ( not ( = ?auto_132965 ?auto_132967 ) ) ( not ( = ?auto_132966 ?auto_132967 ) ) ( ON ?auto_132967 ?auto_132969 ) ( not ( = ?auto_132965 ?auto_132969 ) ) ( not ( = ?auto_132966 ?auto_132969 ) ) ( not ( = ?auto_132967 ?auto_132969 ) ) ( ON ?auto_132966 ?auto_132967 ) ( CLEAR ?auto_132966 ) ( ON-TABLE ?auto_132968 ) ( ON ?auto_132972 ?auto_132968 ) ( ON ?auto_132970 ?auto_132972 ) ( ON ?auto_132973 ?auto_132970 ) ( ON ?auto_132971 ?auto_132973 ) ( ON ?auto_132969 ?auto_132971 ) ( not ( = ?auto_132968 ?auto_132972 ) ) ( not ( = ?auto_132968 ?auto_132970 ) ) ( not ( = ?auto_132968 ?auto_132973 ) ) ( not ( = ?auto_132968 ?auto_132971 ) ) ( not ( = ?auto_132968 ?auto_132969 ) ) ( not ( = ?auto_132968 ?auto_132967 ) ) ( not ( = ?auto_132968 ?auto_132966 ) ) ( not ( = ?auto_132972 ?auto_132970 ) ) ( not ( = ?auto_132972 ?auto_132973 ) ) ( not ( = ?auto_132972 ?auto_132971 ) ) ( not ( = ?auto_132972 ?auto_132969 ) ) ( not ( = ?auto_132972 ?auto_132967 ) ) ( not ( = ?auto_132972 ?auto_132966 ) ) ( not ( = ?auto_132970 ?auto_132973 ) ) ( not ( = ?auto_132970 ?auto_132971 ) ) ( not ( = ?auto_132970 ?auto_132969 ) ) ( not ( = ?auto_132970 ?auto_132967 ) ) ( not ( = ?auto_132970 ?auto_132966 ) ) ( not ( = ?auto_132973 ?auto_132971 ) ) ( not ( = ?auto_132973 ?auto_132969 ) ) ( not ( = ?auto_132973 ?auto_132967 ) ) ( not ( = ?auto_132973 ?auto_132966 ) ) ( not ( = ?auto_132971 ?auto_132969 ) ) ( not ( = ?auto_132971 ?auto_132967 ) ) ( not ( = ?auto_132971 ?auto_132966 ) ) ( not ( = ?auto_132965 ?auto_132968 ) ) ( not ( = ?auto_132965 ?auto_132972 ) ) ( not ( = ?auto_132965 ?auto_132970 ) ) ( not ( = ?auto_132965 ?auto_132973 ) ) ( not ( = ?auto_132965 ?auto_132971 ) ) ( HOLDING ?auto_132965 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_132965 )
      ( MAKE-3PILE ?auto_132965 ?auto_132966 ?auto_132967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_132974 - BLOCK
      ?auto_132975 - BLOCK
      ?auto_132976 - BLOCK
    )
    :vars
    (
      ?auto_132978 - BLOCK
      ?auto_132981 - BLOCK
      ?auto_132977 - BLOCK
      ?auto_132982 - BLOCK
      ?auto_132979 - BLOCK
      ?auto_132980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_132974 ?auto_132975 ) ) ( not ( = ?auto_132974 ?auto_132976 ) ) ( not ( = ?auto_132975 ?auto_132976 ) ) ( ON ?auto_132976 ?auto_132978 ) ( not ( = ?auto_132974 ?auto_132978 ) ) ( not ( = ?auto_132975 ?auto_132978 ) ) ( not ( = ?auto_132976 ?auto_132978 ) ) ( ON ?auto_132975 ?auto_132976 ) ( ON-TABLE ?auto_132981 ) ( ON ?auto_132977 ?auto_132981 ) ( ON ?auto_132982 ?auto_132977 ) ( ON ?auto_132979 ?auto_132982 ) ( ON ?auto_132980 ?auto_132979 ) ( ON ?auto_132978 ?auto_132980 ) ( not ( = ?auto_132981 ?auto_132977 ) ) ( not ( = ?auto_132981 ?auto_132982 ) ) ( not ( = ?auto_132981 ?auto_132979 ) ) ( not ( = ?auto_132981 ?auto_132980 ) ) ( not ( = ?auto_132981 ?auto_132978 ) ) ( not ( = ?auto_132981 ?auto_132976 ) ) ( not ( = ?auto_132981 ?auto_132975 ) ) ( not ( = ?auto_132977 ?auto_132982 ) ) ( not ( = ?auto_132977 ?auto_132979 ) ) ( not ( = ?auto_132977 ?auto_132980 ) ) ( not ( = ?auto_132977 ?auto_132978 ) ) ( not ( = ?auto_132977 ?auto_132976 ) ) ( not ( = ?auto_132977 ?auto_132975 ) ) ( not ( = ?auto_132982 ?auto_132979 ) ) ( not ( = ?auto_132982 ?auto_132980 ) ) ( not ( = ?auto_132982 ?auto_132978 ) ) ( not ( = ?auto_132982 ?auto_132976 ) ) ( not ( = ?auto_132982 ?auto_132975 ) ) ( not ( = ?auto_132979 ?auto_132980 ) ) ( not ( = ?auto_132979 ?auto_132978 ) ) ( not ( = ?auto_132979 ?auto_132976 ) ) ( not ( = ?auto_132979 ?auto_132975 ) ) ( not ( = ?auto_132980 ?auto_132978 ) ) ( not ( = ?auto_132980 ?auto_132976 ) ) ( not ( = ?auto_132980 ?auto_132975 ) ) ( not ( = ?auto_132974 ?auto_132981 ) ) ( not ( = ?auto_132974 ?auto_132977 ) ) ( not ( = ?auto_132974 ?auto_132982 ) ) ( not ( = ?auto_132974 ?auto_132979 ) ) ( not ( = ?auto_132974 ?auto_132980 ) ) ( ON ?auto_132974 ?auto_132975 ) ( CLEAR ?auto_132974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_132981 ?auto_132977 ?auto_132982 ?auto_132979 ?auto_132980 ?auto_132978 ?auto_132976 ?auto_132975 )
      ( MAKE-3PILE ?auto_132974 ?auto_132975 ?auto_132976 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132988 - BLOCK
      ?auto_132989 - BLOCK
      ?auto_132990 - BLOCK
      ?auto_132991 - BLOCK
      ?auto_132992 - BLOCK
    )
    :vars
    (
      ?auto_132993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132993 ?auto_132992 ) ( CLEAR ?auto_132993 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_132988 ) ( ON ?auto_132989 ?auto_132988 ) ( ON ?auto_132990 ?auto_132989 ) ( ON ?auto_132991 ?auto_132990 ) ( ON ?auto_132992 ?auto_132991 ) ( not ( = ?auto_132988 ?auto_132989 ) ) ( not ( = ?auto_132988 ?auto_132990 ) ) ( not ( = ?auto_132988 ?auto_132991 ) ) ( not ( = ?auto_132988 ?auto_132992 ) ) ( not ( = ?auto_132988 ?auto_132993 ) ) ( not ( = ?auto_132989 ?auto_132990 ) ) ( not ( = ?auto_132989 ?auto_132991 ) ) ( not ( = ?auto_132989 ?auto_132992 ) ) ( not ( = ?auto_132989 ?auto_132993 ) ) ( not ( = ?auto_132990 ?auto_132991 ) ) ( not ( = ?auto_132990 ?auto_132992 ) ) ( not ( = ?auto_132990 ?auto_132993 ) ) ( not ( = ?auto_132991 ?auto_132992 ) ) ( not ( = ?auto_132991 ?auto_132993 ) ) ( not ( = ?auto_132992 ?auto_132993 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_132993 ?auto_132992 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_132994 - BLOCK
      ?auto_132995 - BLOCK
      ?auto_132996 - BLOCK
      ?auto_132997 - BLOCK
      ?auto_132998 - BLOCK
    )
    :vars
    (
      ?auto_132999 - BLOCK
      ?auto_133000 - BLOCK
      ?auto_133001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_132999 ?auto_132998 ) ( CLEAR ?auto_132999 ) ( ON-TABLE ?auto_132994 ) ( ON ?auto_132995 ?auto_132994 ) ( ON ?auto_132996 ?auto_132995 ) ( ON ?auto_132997 ?auto_132996 ) ( ON ?auto_132998 ?auto_132997 ) ( not ( = ?auto_132994 ?auto_132995 ) ) ( not ( = ?auto_132994 ?auto_132996 ) ) ( not ( = ?auto_132994 ?auto_132997 ) ) ( not ( = ?auto_132994 ?auto_132998 ) ) ( not ( = ?auto_132994 ?auto_132999 ) ) ( not ( = ?auto_132995 ?auto_132996 ) ) ( not ( = ?auto_132995 ?auto_132997 ) ) ( not ( = ?auto_132995 ?auto_132998 ) ) ( not ( = ?auto_132995 ?auto_132999 ) ) ( not ( = ?auto_132996 ?auto_132997 ) ) ( not ( = ?auto_132996 ?auto_132998 ) ) ( not ( = ?auto_132996 ?auto_132999 ) ) ( not ( = ?auto_132997 ?auto_132998 ) ) ( not ( = ?auto_132997 ?auto_132999 ) ) ( not ( = ?auto_132998 ?auto_132999 ) ) ( HOLDING ?auto_133000 ) ( CLEAR ?auto_133001 ) ( not ( = ?auto_132994 ?auto_133000 ) ) ( not ( = ?auto_132994 ?auto_133001 ) ) ( not ( = ?auto_132995 ?auto_133000 ) ) ( not ( = ?auto_132995 ?auto_133001 ) ) ( not ( = ?auto_132996 ?auto_133000 ) ) ( not ( = ?auto_132996 ?auto_133001 ) ) ( not ( = ?auto_132997 ?auto_133000 ) ) ( not ( = ?auto_132997 ?auto_133001 ) ) ( not ( = ?auto_132998 ?auto_133000 ) ) ( not ( = ?auto_132998 ?auto_133001 ) ) ( not ( = ?auto_132999 ?auto_133000 ) ) ( not ( = ?auto_132999 ?auto_133001 ) ) ( not ( = ?auto_133000 ?auto_133001 ) ) )
    :subtasks
    ( ( !STACK ?auto_133000 ?auto_133001 )
      ( MAKE-5PILE ?auto_132994 ?auto_132995 ?auto_132996 ?auto_132997 ?auto_132998 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133002 - BLOCK
      ?auto_133003 - BLOCK
      ?auto_133004 - BLOCK
      ?auto_133005 - BLOCK
      ?auto_133006 - BLOCK
    )
    :vars
    (
      ?auto_133009 - BLOCK
      ?auto_133008 - BLOCK
      ?auto_133007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133009 ?auto_133006 ) ( ON-TABLE ?auto_133002 ) ( ON ?auto_133003 ?auto_133002 ) ( ON ?auto_133004 ?auto_133003 ) ( ON ?auto_133005 ?auto_133004 ) ( ON ?auto_133006 ?auto_133005 ) ( not ( = ?auto_133002 ?auto_133003 ) ) ( not ( = ?auto_133002 ?auto_133004 ) ) ( not ( = ?auto_133002 ?auto_133005 ) ) ( not ( = ?auto_133002 ?auto_133006 ) ) ( not ( = ?auto_133002 ?auto_133009 ) ) ( not ( = ?auto_133003 ?auto_133004 ) ) ( not ( = ?auto_133003 ?auto_133005 ) ) ( not ( = ?auto_133003 ?auto_133006 ) ) ( not ( = ?auto_133003 ?auto_133009 ) ) ( not ( = ?auto_133004 ?auto_133005 ) ) ( not ( = ?auto_133004 ?auto_133006 ) ) ( not ( = ?auto_133004 ?auto_133009 ) ) ( not ( = ?auto_133005 ?auto_133006 ) ) ( not ( = ?auto_133005 ?auto_133009 ) ) ( not ( = ?auto_133006 ?auto_133009 ) ) ( CLEAR ?auto_133008 ) ( not ( = ?auto_133002 ?auto_133007 ) ) ( not ( = ?auto_133002 ?auto_133008 ) ) ( not ( = ?auto_133003 ?auto_133007 ) ) ( not ( = ?auto_133003 ?auto_133008 ) ) ( not ( = ?auto_133004 ?auto_133007 ) ) ( not ( = ?auto_133004 ?auto_133008 ) ) ( not ( = ?auto_133005 ?auto_133007 ) ) ( not ( = ?auto_133005 ?auto_133008 ) ) ( not ( = ?auto_133006 ?auto_133007 ) ) ( not ( = ?auto_133006 ?auto_133008 ) ) ( not ( = ?auto_133009 ?auto_133007 ) ) ( not ( = ?auto_133009 ?auto_133008 ) ) ( not ( = ?auto_133007 ?auto_133008 ) ) ( ON ?auto_133007 ?auto_133009 ) ( CLEAR ?auto_133007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133002 ?auto_133003 ?auto_133004 ?auto_133005 ?auto_133006 ?auto_133009 )
      ( MAKE-5PILE ?auto_133002 ?auto_133003 ?auto_133004 ?auto_133005 ?auto_133006 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133010 - BLOCK
      ?auto_133011 - BLOCK
      ?auto_133012 - BLOCK
      ?auto_133013 - BLOCK
      ?auto_133014 - BLOCK
    )
    :vars
    (
      ?auto_133016 - BLOCK
      ?auto_133017 - BLOCK
      ?auto_133015 - BLOCK
      ?auto_133018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133016 ?auto_133014 ) ( ON-TABLE ?auto_133010 ) ( ON ?auto_133011 ?auto_133010 ) ( ON ?auto_133012 ?auto_133011 ) ( ON ?auto_133013 ?auto_133012 ) ( ON ?auto_133014 ?auto_133013 ) ( not ( = ?auto_133010 ?auto_133011 ) ) ( not ( = ?auto_133010 ?auto_133012 ) ) ( not ( = ?auto_133010 ?auto_133013 ) ) ( not ( = ?auto_133010 ?auto_133014 ) ) ( not ( = ?auto_133010 ?auto_133016 ) ) ( not ( = ?auto_133011 ?auto_133012 ) ) ( not ( = ?auto_133011 ?auto_133013 ) ) ( not ( = ?auto_133011 ?auto_133014 ) ) ( not ( = ?auto_133011 ?auto_133016 ) ) ( not ( = ?auto_133012 ?auto_133013 ) ) ( not ( = ?auto_133012 ?auto_133014 ) ) ( not ( = ?auto_133012 ?auto_133016 ) ) ( not ( = ?auto_133013 ?auto_133014 ) ) ( not ( = ?auto_133013 ?auto_133016 ) ) ( not ( = ?auto_133014 ?auto_133016 ) ) ( not ( = ?auto_133010 ?auto_133017 ) ) ( not ( = ?auto_133010 ?auto_133015 ) ) ( not ( = ?auto_133011 ?auto_133017 ) ) ( not ( = ?auto_133011 ?auto_133015 ) ) ( not ( = ?auto_133012 ?auto_133017 ) ) ( not ( = ?auto_133012 ?auto_133015 ) ) ( not ( = ?auto_133013 ?auto_133017 ) ) ( not ( = ?auto_133013 ?auto_133015 ) ) ( not ( = ?auto_133014 ?auto_133017 ) ) ( not ( = ?auto_133014 ?auto_133015 ) ) ( not ( = ?auto_133016 ?auto_133017 ) ) ( not ( = ?auto_133016 ?auto_133015 ) ) ( not ( = ?auto_133017 ?auto_133015 ) ) ( ON ?auto_133017 ?auto_133016 ) ( CLEAR ?auto_133017 ) ( HOLDING ?auto_133015 ) ( CLEAR ?auto_133018 ) ( ON-TABLE ?auto_133018 ) ( not ( = ?auto_133018 ?auto_133015 ) ) ( not ( = ?auto_133010 ?auto_133018 ) ) ( not ( = ?auto_133011 ?auto_133018 ) ) ( not ( = ?auto_133012 ?auto_133018 ) ) ( not ( = ?auto_133013 ?auto_133018 ) ) ( not ( = ?auto_133014 ?auto_133018 ) ) ( not ( = ?auto_133016 ?auto_133018 ) ) ( not ( = ?auto_133017 ?auto_133018 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133018 ?auto_133015 )
      ( MAKE-5PILE ?auto_133010 ?auto_133011 ?auto_133012 ?auto_133013 ?auto_133014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133019 - BLOCK
      ?auto_133020 - BLOCK
      ?auto_133021 - BLOCK
      ?auto_133022 - BLOCK
      ?auto_133023 - BLOCK
    )
    :vars
    (
      ?auto_133026 - BLOCK
      ?auto_133025 - BLOCK
      ?auto_133024 - BLOCK
      ?auto_133027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133026 ?auto_133023 ) ( ON-TABLE ?auto_133019 ) ( ON ?auto_133020 ?auto_133019 ) ( ON ?auto_133021 ?auto_133020 ) ( ON ?auto_133022 ?auto_133021 ) ( ON ?auto_133023 ?auto_133022 ) ( not ( = ?auto_133019 ?auto_133020 ) ) ( not ( = ?auto_133019 ?auto_133021 ) ) ( not ( = ?auto_133019 ?auto_133022 ) ) ( not ( = ?auto_133019 ?auto_133023 ) ) ( not ( = ?auto_133019 ?auto_133026 ) ) ( not ( = ?auto_133020 ?auto_133021 ) ) ( not ( = ?auto_133020 ?auto_133022 ) ) ( not ( = ?auto_133020 ?auto_133023 ) ) ( not ( = ?auto_133020 ?auto_133026 ) ) ( not ( = ?auto_133021 ?auto_133022 ) ) ( not ( = ?auto_133021 ?auto_133023 ) ) ( not ( = ?auto_133021 ?auto_133026 ) ) ( not ( = ?auto_133022 ?auto_133023 ) ) ( not ( = ?auto_133022 ?auto_133026 ) ) ( not ( = ?auto_133023 ?auto_133026 ) ) ( not ( = ?auto_133019 ?auto_133025 ) ) ( not ( = ?auto_133019 ?auto_133024 ) ) ( not ( = ?auto_133020 ?auto_133025 ) ) ( not ( = ?auto_133020 ?auto_133024 ) ) ( not ( = ?auto_133021 ?auto_133025 ) ) ( not ( = ?auto_133021 ?auto_133024 ) ) ( not ( = ?auto_133022 ?auto_133025 ) ) ( not ( = ?auto_133022 ?auto_133024 ) ) ( not ( = ?auto_133023 ?auto_133025 ) ) ( not ( = ?auto_133023 ?auto_133024 ) ) ( not ( = ?auto_133026 ?auto_133025 ) ) ( not ( = ?auto_133026 ?auto_133024 ) ) ( not ( = ?auto_133025 ?auto_133024 ) ) ( ON ?auto_133025 ?auto_133026 ) ( CLEAR ?auto_133027 ) ( ON-TABLE ?auto_133027 ) ( not ( = ?auto_133027 ?auto_133024 ) ) ( not ( = ?auto_133019 ?auto_133027 ) ) ( not ( = ?auto_133020 ?auto_133027 ) ) ( not ( = ?auto_133021 ?auto_133027 ) ) ( not ( = ?auto_133022 ?auto_133027 ) ) ( not ( = ?auto_133023 ?auto_133027 ) ) ( not ( = ?auto_133026 ?auto_133027 ) ) ( not ( = ?auto_133025 ?auto_133027 ) ) ( ON ?auto_133024 ?auto_133025 ) ( CLEAR ?auto_133024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133019 ?auto_133020 ?auto_133021 ?auto_133022 ?auto_133023 ?auto_133026 ?auto_133025 )
      ( MAKE-5PILE ?auto_133019 ?auto_133020 ?auto_133021 ?auto_133022 ?auto_133023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133028 - BLOCK
      ?auto_133029 - BLOCK
      ?auto_133030 - BLOCK
      ?auto_133031 - BLOCK
      ?auto_133032 - BLOCK
    )
    :vars
    (
      ?auto_133033 - BLOCK
      ?auto_133035 - BLOCK
      ?auto_133036 - BLOCK
      ?auto_133034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133033 ?auto_133032 ) ( ON-TABLE ?auto_133028 ) ( ON ?auto_133029 ?auto_133028 ) ( ON ?auto_133030 ?auto_133029 ) ( ON ?auto_133031 ?auto_133030 ) ( ON ?auto_133032 ?auto_133031 ) ( not ( = ?auto_133028 ?auto_133029 ) ) ( not ( = ?auto_133028 ?auto_133030 ) ) ( not ( = ?auto_133028 ?auto_133031 ) ) ( not ( = ?auto_133028 ?auto_133032 ) ) ( not ( = ?auto_133028 ?auto_133033 ) ) ( not ( = ?auto_133029 ?auto_133030 ) ) ( not ( = ?auto_133029 ?auto_133031 ) ) ( not ( = ?auto_133029 ?auto_133032 ) ) ( not ( = ?auto_133029 ?auto_133033 ) ) ( not ( = ?auto_133030 ?auto_133031 ) ) ( not ( = ?auto_133030 ?auto_133032 ) ) ( not ( = ?auto_133030 ?auto_133033 ) ) ( not ( = ?auto_133031 ?auto_133032 ) ) ( not ( = ?auto_133031 ?auto_133033 ) ) ( not ( = ?auto_133032 ?auto_133033 ) ) ( not ( = ?auto_133028 ?auto_133035 ) ) ( not ( = ?auto_133028 ?auto_133036 ) ) ( not ( = ?auto_133029 ?auto_133035 ) ) ( not ( = ?auto_133029 ?auto_133036 ) ) ( not ( = ?auto_133030 ?auto_133035 ) ) ( not ( = ?auto_133030 ?auto_133036 ) ) ( not ( = ?auto_133031 ?auto_133035 ) ) ( not ( = ?auto_133031 ?auto_133036 ) ) ( not ( = ?auto_133032 ?auto_133035 ) ) ( not ( = ?auto_133032 ?auto_133036 ) ) ( not ( = ?auto_133033 ?auto_133035 ) ) ( not ( = ?auto_133033 ?auto_133036 ) ) ( not ( = ?auto_133035 ?auto_133036 ) ) ( ON ?auto_133035 ?auto_133033 ) ( not ( = ?auto_133034 ?auto_133036 ) ) ( not ( = ?auto_133028 ?auto_133034 ) ) ( not ( = ?auto_133029 ?auto_133034 ) ) ( not ( = ?auto_133030 ?auto_133034 ) ) ( not ( = ?auto_133031 ?auto_133034 ) ) ( not ( = ?auto_133032 ?auto_133034 ) ) ( not ( = ?auto_133033 ?auto_133034 ) ) ( not ( = ?auto_133035 ?auto_133034 ) ) ( ON ?auto_133036 ?auto_133035 ) ( CLEAR ?auto_133036 ) ( HOLDING ?auto_133034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133034 )
      ( MAKE-5PILE ?auto_133028 ?auto_133029 ?auto_133030 ?auto_133031 ?auto_133032 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133037 - BLOCK
      ?auto_133038 - BLOCK
      ?auto_133039 - BLOCK
      ?auto_133040 - BLOCK
      ?auto_133041 - BLOCK
    )
    :vars
    (
      ?auto_133045 - BLOCK
      ?auto_133042 - BLOCK
      ?auto_133043 - BLOCK
      ?auto_133044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133045 ?auto_133041 ) ( ON-TABLE ?auto_133037 ) ( ON ?auto_133038 ?auto_133037 ) ( ON ?auto_133039 ?auto_133038 ) ( ON ?auto_133040 ?auto_133039 ) ( ON ?auto_133041 ?auto_133040 ) ( not ( = ?auto_133037 ?auto_133038 ) ) ( not ( = ?auto_133037 ?auto_133039 ) ) ( not ( = ?auto_133037 ?auto_133040 ) ) ( not ( = ?auto_133037 ?auto_133041 ) ) ( not ( = ?auto_133037 ?auto_133045 ) ) ( not ( = ?auto_133038 ?auto_133039 ) ) ( not ( = ?auto_133038 ?auto_133040 ) ) ( not ( = ?auto_133038 ?auto_133041 ) ) ( not ( = ?auto_133038 ?auto_133045 ) ) ( not ( = ?auto_133039 ?auto_133040 ) ) ( not ( = ?auto_133039 ?auto_133041 ) ) ( not ( = ?auto_133039 ?auto_133045 ) ) ( not ( = ?auto_133040 ?auto_133041 ) ) ( not ( = ?auto_133040 ?auto_133045 ) ) ( not ( = ?auto_133041 ?auto_133045 ) ) ( not ( = ?auto_133037 ?auto_133042 ) ) ( not ( = ?auto_133037 ?auto_133043 ) ) ( not ( = ?auto_133038 ?auto_133042 ) ) ( not ( = ?auto_133038 ?auto_133043 ) ) ( not ( = ?auto_133039 ?auto_133042 ) ) ( not ( = ?auto_133039 ?auto_133043 ) ) ( not ( = ?auto_133040 ?auto_133042 ) ) ( not ( = ?auto_133040 ?auto_133043 ) ) ( not ( = ?auto_133041 ?auto_133042 ) ) ( not ( = ?auto_133041 ?auto_133043 ) ) ( not ( = ?auto_133045 ?auto_133042 ) ) ( not ( = ?auto_133045 ?auto_133043 ) ) ( not ( = ?auto_133042 ?auto_133043 ) ) ( ON ?auto_133042 ?auto_133045 ) ( not ( = ?auto_133044 ?auto_133043 ) ) ( not ( = ?auto_133037 ?auto_133044 ) ) ( not ( = ?auto_133038 ?auto_133044 ) ) ( not ( = ?auto_133039 ?auto_133044 ) ) ( not ( = ?auto_133040 ?auto_133044 ) ) ( not ( = ?auto_133041 ?auto_133044 ) ) ( not ( = ?auto_133045 ?auto_133044 ) ) ( not ( = ?auto_133042 ?auto_133044 ) ) ( ON ?auto_133043 ?auto_133042 ) ( ON ?auto_133044 ?auto_133043 ) ( CLEAR ?auto_133044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133037 ?auto_133038 ?auto_133039 ?auto_133040 ?auto_133041 ?auto_133045 ?auto_133042 ?auto_133043 )
      ( MAKE-5PILE ?auto_133037 ?auto_133038 ?auto_133039 ?auto_133040 ?auto_133041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133050 - BLOCK
      ?auto_133051 - BLOCK
      ?auto_133052 - BLOCK
      ?auto_133053 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_133053 ) ( CLEAR ?auto_133052 ) ( ON-TABLE ?auto_133050 ) ( ON ?auto_133051 ?auto_133050 ) ( ON ?auto_133052 ?auto_133051 ) ( not ( = ?auto_133050 ?auto_133051 ) ) ( not ( = ?auto_133050 ?auto_133052 ) ) ( not ( = ?auto_133050 ?auto_133053 ) ) ( not ( = ?auto_133051 ?auto_133052 ) ) ( not ( = ?auto_133051 ?auto_133053 ) ) ( not ( = ?auto_133052 ?auto_133053 ) ) )
    :subtasks
    ( ( !STACK ?auto_133053 ?auto_133052 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133054 - BLOCK
      ?auto_133055 - BLOCK
      ?auto_133056 - BLOCK
      ?auto_133057 - BLOCK
    )
    :vars
    (
      ?auto_133058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133056 ) ( ON-TABLE ?auto_133054 ) ( ON ?auto_133055 ?auto_133054 ) ( ON ?auto_133056 ?auto_133055 ) ( not ( = ?auto_133054 ?auto_133055 ) ) ( not ( = ?auto_133054 ?auto_133056 ) ) ( not ( = ?auto_133054 ?auto_133057 ) ) ( not ( = ?auto_133055 ?auto_133056 ) ) ( not ( = ?auto_133055 ?auto_133057 ) ) ( not ( = ?auto_133056 ?auto_133057 ) ) ( ON ?auto_133057 ?auto_133058 ) ( CLEAR ?auto_133057 ) ( HAND-EMPTY ) ( not ( = ?auto_133054 ?auto_133058 ) ) ( not ( = ?auto_133055 ?auto_133058 ) ) ( not ( = ?auto_133056 ?auto_133058 ) ) ( not ( = ?auto_133057 ?auto_133058 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133057 ?auto_133058 )
      ( MAKE-4PILE ?auto_133054 ?auto_133055 ?auto_133056 ?auto_133057 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133059 - BLOCK
      ?auto_133060 - BLOCK
      ?auto_133061 - BLOCK
      ?auto_133062 - BLOCK
    )
    :vars
    (
      ?auto_133063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133059 ) ( ON ?auto_133060 ?auto_133059 ) ( not ( = ?auto_133059 ?auto_133060 ) ) ( not ( = ?auto_133059 ?auto_133061 ) ) ( not ( = ?auto_133059 ?auto_133062 ) ) ( not ( = ?auto_133060 ?auto_133061 ) ) ( not ( = ?auto_133060 ?auto_133062 ) ) ( not ( = ?auto_133061 ?auto_133062 ) ) ( ON ?auto_133062 ?auto_133063 ) ( CLEAR ?auto_133062 ) ( not ( = ?auto_133059 ?auto_133063 ) ) ( not ( = ?auto_133060 ?auto_133063 ) ) ( not ( = ?auto_133061 ?auto_133063 ) ) ( not ( = ?auto_133062 ?auto_133063 ) ) ( HOLDING ?auto_133061 ) ( CLEAR ?auto_133060 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133059 ?auto_133060 ?auto_133061 )
      ( MAKE-4PILE ?auto_133059 ?auto_133060 ?auto_133061 ?auto_133062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133064 - BLOCK
      ?auto_133065 - BLOCK
      ?auto_133066 - BLOCK
      ?auto_133067 - BLOCK
    )
    :vars
    (
      ?auto_133068 - BLOCK
      ?auto_133070 - BLOCK
      ?auto_133071 - BLOCK
      ?auto_133072 - BLOCK
      ?auto_133069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133064 ) ( ON ?auto_133065 ?auto_133064 ) ( not ( = ?auto_133064 ?auto_133065 ) ) ( not ( = ?auto_133064 ?auto_133066 ) ) ( not ( = ?auto_133064 ?auto_133067 ) ) ( not ( = ?auto_133065 ?auto_133066 ) ) ( not ( = ?auto_133065 ?auto_133067 ) ) ( not ( = ?auto_133066 ?auto_133067 ) ) ( ON ?auto_133067 ?auto_133068 ) ( not ( = ?auto_133064 ?auto_133068 ) ) ( not ( = ?auto_133065 ?auto_133068 ) ) ( not ( = ?auto_133066 ?auto_133068 ) ) ( not ( = ?auto_133067 ?auto_133068 ) ) ( CLEAR ?auto_133065 ) ( ON ?auto_133066 ?auto_133067 ) ( CLEAR ?auto_133066 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133070 ) ( ON ?auto_133071 ?auto_133070 ) ( ON ?auto_133072 ?auto_133071 ) ( ON ?auto_133069 ?auto_133072 ) ( ON ?auto_133068 ?auto_133069 ) ( not ( = ?auto_133070 ?auto_133071 ) ) ( not ( = ?auto_133070 ?auto_133072 ) ) ( not ( = ?auto_133070 ?auto_133069 ) ) ( not ( = ?auto_133070 ?auto_133068 ) ) ( not ( = ?auto_133070 ?auto_133067 ) ) ( not ( = ?auto_133070 ?auto_133066 ) ) ( not ( = ?auto_133071 ?auto_133072 ) ) ( not ( = ?auto_133071 ?auto_133069 ) ) ( not ( = ?auto_133071 ?auto_133068 ) ) ( not ( = ?auto_133071 ?auto_133067 ) ) ( not ( = ?auto_133071 ?auto_133066 ) ) ( not ( = ?auto_133072 ?auto_133069 ) ) ( not ( = ?auto_133072 ?auto_133068 ) ) ( not ( = ?auto_133072 ?auto_133067 ) ) ( not ( = ?auto_133072 ?auto_133066 ) ) ( not ( = ?auto_133069 ?auto_133068 ) ) ( not ( = ?auto_133069 ?auto_133067 ) ) ( not ( = ?auto_133069 ?auto_133066 ) ) ( not ( = ?auto_133064 ?auto_133070 ) ) ( not ( = ?auto_133064 ?auto_133071 ) ) ( not ( = ?auto_133064 ?auto_133072 ) ) ( not ( = ?auto_133064 ?auto_133069 ) ) ( not ( = ?auto_133065 ?auto_133070 ) ) ( not ( = ?auto_133065 ?auto_133071 ) ) ( not ( = ?auto_133065 ?auto_133072 ) ) ( not ( = ?auto_133065 ?auto_133069 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133070 ?auto_133071 ?auto_133072 ?auto_133069 ?auto_133068 ?auto_133067 )
      ( MAKE-4PILE ?auto_133064 ?auto_133065 ?auto_133066 ?auto_133067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133073 - BLOCK
      ?auto_133074 - BLOCK
      ?auto_133075 - BLOCK
      ?auto_133076 - BLOCK
    )
    :vars
    (
      ?auto_133079 - BLOCK
      ?auto_133077 - BLOCK
      ?auto_133080 - BLOCK
      ?auto_133078 - BLOCK
      ?auto_133081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133073 ) ( not ( = ?auto_133073 ?auto_133074 ) ) ( not ( = ?auto_133073 ?auto_133075 ) ) ( not ( = ?auto_133073 ?auto_133076 ) ) ( not ( = ?auto_133074 ?auto_133075 ) ) ( not ( = ?auto_133074 ?auto_133076 ) ) ( not ( = ?auto_133075 ?auto_133076 ) ) ( ON ?auto_133076 ?auto_133079 ) ( not ( = ?auto_133073 ?auto_133079 ) ) ( not ( = ?auto_133074 ?auto_133079 ) ) ( not ( = ?auto_133075 ?auto_133079 ) ) ( not ( = ?auto_133076 ?auto_133079 ) ) ( ON ?auto_133075 ?auto_133076 ) ( CLEAR ?auto_133075 ) ( ON-TABLE ?auto_133077 ) ( ON ?auto_133080 ?auto_133077 ) ( ON ?auto_133078 ?auto_133080 ) ( ON ?auto_133081 ?auto_133078 ) ( ON ?auto_133079 ?auto_133081 ) ( not ( = ?auto_133077 ?auto_133080 ) ) ( not ( = ?auto_133077 ?auto_133078 ) ) ( not ( = ?auto_133077 ?auto_133081 ) ) ( not ( = ?auto_133077 ?auto_133079 ) ) ( not ( = ?auto_133077 ?auto_133076 ) ) ( not ( = ?auto_133077 ?auto_133075 ) ) ( not ( = ?auto_133080 ?auto_133078 ) ) ( not ( = ?auto_133080 ?auto_133081 ) ) ( not ( = ?auto_133080 ?auto_133079 ) ) ( not ( = ?auto_133080 ?auto_133076 ) ) ( not ( = ?auto_133080 ?auto_133075 ) ) ( not ( = ?auto_133078 ?auto_133081 ) ) ( not ( = ?auto_133078 ?auto_133079 ) ) ( not ( = ?auto_133078 ?auto_133076 ) ) ( not ( = ?auto_133078 ?auto_133075 ) ) ( not ( = ?auto_133081 ?auto_133079 ) ) ( not ( = ?auto_133081 ?auto_133076 ) ) ( not ( = ?auto_133081 ?auto_133075 ) ) ( not ( = ?auto_133073 ?auto_133077 ) ) ( not ( = ?auto_133073 ?auto_133080 ) ) ( not ( = ?auto_133073 ?auto_133078 ) ) ( not ( = ?auto_133073 ?auto_133081 ) ) ( not ( = ?auto_133074 ?auto_133077 ) ) ( not ( = ?auto_133074 ?auto_133080 ) ) ( not ( = ?auto_133074 ?auto_133078 ) ) ( not ( = ?auto_133074 ?auto_133081 ) ) ( HOLDING ?auto_133074 ) ( CLEAR ?auto_133073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133073 ?auto_133074 )
      ( MAKE-4PILE ?auto_133073 ?auto_133074 ?auto_133075 ?auto_133076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133082 - BLOCK
      ?auto_133083 - BLOCK
      ?auto_133084 - BLOCK
      ?auto_133085 - BLOCK
    )
    :vars
    (
      ?auto_133090 - BLOCK
      ?auto_133087 - BLOCK
      ?auto_133086 - BLOCK
      ?auto_133088 - BLOCK
      ?auto_133089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133082 ) ( not ( = ?auto_133082 ?auto_133083 ) ) ( not ( = ?auto_133082 ?auto_133084 ) ) ( not ( = ?auto_133082 ?auto_133085 ) ) ( not ( = ?auto_133083 ?auto_133084 ) ) ( not ( = ?auto_133083 ?auto_133085 ) ) ( not ( = ?auto_133084 ?auto_133085 ) ) ( ON ?auto_133085 ?auto_133090 ) ( not ( = ?auto_133082 ?auto_133090 ) ) ( not ( = ?auto_133083 ?auto_133090 ) ) ( not ( = ?auto_133084 ?auto_133090 ) ) ( not ( = ?auto_133085 ?auto_133090 ) ) ( ON ?auto_133084 ?auto_133085 ) ( ON-TABLE ?auto_133087 ) ( ON ?auto_133086 ?auto_133087 ) ( ON ?auto_133088 ?auto_133086 ) ( ON ?auto_133089 ?auto_133088 ) ( ON ?auto_133090 ?auto_133089 ) ( not ( = ?auto_133087 ?auto_133086 ) ) ( not ( = ?auto_133087 ?auto_133088 ) ) ( not ( = ?auto_133087 ?auto_133089 ) ) ( not ( = ?auto_133087 ?auto_133090 ) ) ( not ( = ?auto_133087 ?auto_133085 ) ) ( not ( = ?auto_133087 ?auto_133084 ) ) ( not ( = ?auto_133086 ?auto_133088 ) ) ( not ( = ?auto_133086 ?auto_133089 ) ) ( not ( = ?auto_133086 ?auto_133090 ) ) ( not ( = ?auto_133086 ?auto_133085 ) ) ( not ( = ?auto_133086 ?auto_133084 ) ) ( not ( = ?auto_133088 ?auto_133089 ) ) ( not ( = ?auto_133088 ?auto_133090 ) ) ( not ( = ?auto_133088 ?auto_133085 ) ) ( not ( = ?auto_133088 ?auto_133084 ) ) ( not ( = ?auto_133089 ?auto_133090 ) ) ( not ( = ?auto_133089 ?auto_133085 ) ) ( not ( = ?auto_133089 ?auto_133084 ) ) ( not ( = ?auto_133082 ?auto_133087 ) ) ( not ( = ?auto_133082 ?auto_133086 ) ) ( not ( = ?auto_133082 ?auto_133088 ) ) ( not ( = ?auto_133082 ?auto_133089 ) ) ( not ( = ?auto_133083 ?auto_133087 ) ) ( not ( = ?auto_133083 ?auto_133086 ) ) ( not ( = ?auto_133083 ?auto_133088 ) ) ( not ( = ?auto_133083 ?auto_133089 ) ) ( CLEAR ?auto_133082 ) ( ON ?auto_133083 ?auto_133084 ) ( CLEAR ?auto_133083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133087 ?auto_133086 ?auto_133088 ?auto_133089 ?auto_133090 ?auto_133085 ?auto_133084 )
      ( MAKE-4PILE ?auto_133082 ?auto_133083 ?auto_133084 ?auto_133085 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133091 - BLOCK
      ?auto_133092 - BLOCK
      ?auto_133093 - BLOCK
      ?auto_133094 - BLOCK
    )
    :vars
    (
      ?auto_133095 - BLOCK
      ?auto_133096 - BLOCK
      ?auto_133097 - BLOCK
      ?auto_133098 - BLOCK
      ?auto_133099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133091 ?auto_133092 ) ) ( not ( = ?auto_133091 ?auto_133093 ) ) ( not ( = ?auto_133091 ?auto_133094 ) ) ( not ( = ?auto_133092 ?auto_133093 ) ) ( not ( = ?auto_133092 ?auto_133094 ) ) ( not ( = ?auto_133093 ?auto_133094 ) ) ( ON ?auto_133094 ?auto_133095 ) ( not ( = ?auto_133091 ?auto_133095 ) ) ( not ( = ?auto_133092 ?auto_133095 ) ) ( not ( = ?auto_133093 ?auto_133095 ) ) ( not ( = ?auto_133094 ?auto_133095 ) ) ( ON ?auto_133093 ?auto_133094 ) ( ON-TABLE ?auto_133096 ) ( ON ?auto_133097 ?auto_133096 ) ( ON ?auto_133098 ?auto_133097 ) ( ON ?auto_133099 ?auto_133098 ) ( ON ?auto_133095 ?auto_133099 ) ( not ( = ?auto_133096 ?auto_133097 ) ) ( not ( = ?auto_133096 ?auto_133098 ) ) ( not ( = ?auto_133096 ?auto_133099 ) ) ( not ( = ?auto_133096 ?auto_133095 ) ) ( not ( = ?auto_133096 ?auto_133094 ) ) ( not ( = ?auto_133096 ?auto_133093 ) ) ( not ( = ?auto_133097 ?auto_133098 ) ) ( not ( = ?auto_133097 ?auto_133099 ) ) ( not ( = ?auto_133097 ?auto_133095 ) ) ( not ( = ?auto_133097 ?auto_133094 ) ) ( not ( = ?auto_133097 ?auto_133093 ) ) ( not ( = ?auto_133098 ?auto_133099 ) ) ( not ( = ?auto_133098 ?auto_133095 ) ) ( not ( = ?auto_133098 ?auto_133094 ) ) ( not ( = ?auto_133098 ?auto_133093 ) ) ( not ( = ?auto_133099 ?auto_133095 ) ) ( not ( = ?auto_133099 ?auto_133094 ) ) ( not ( = ?auto_133099 ?auto_133093 ) ) ( not ( = ?auto_133091 ?auto_133096 ) ) ( not ( = ?auto_133091 ?auto_133097 ) ) ( not ( = ?auto_133091 ?auto_133098 ) ) ( not ( = ?auto_133091 ?auto_133099 ) ) ( not ( = ?auto_133092 ?auto_133096 ) ) ( not ( = ?auto_133092 ?auto_133097 ) ) ( not ( = ?auto_133092 ?auto_133098 ) ) ( not ( = ?auto_133092 ?auto_133099 ) ) ( ON ?auto_133092 ?auto_133093 ) ( CLEAR ?auto_133092 ) ( HOLDING ?auto_133091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133091 )
      ( MAKE-4PILE ?auto_133091 ?auto_133092 ?auto_133093 ?auto_133094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133100 - BLOCK
      ?auto_133101 - BLOCK
      ?auto_133102 - BLOCK
      ?auto_133103 - BLOCK
    )
    :vars
    (
      ?auto_133106 - BLOCK
      ?auto_133105 - BLOCK
      ?auto_133108 - BLOCK
      ?auto_133107 - BLOCK
      ?auto_133104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133100 ?auto_133101 ) ) ( not ( = ?auto_133100 ?auto_133102 ) ) ( not ( = ?auto_133100 ?auto_133103 ) ) ( not ( = ?auto_133101 ?auto_133102 ) ) ( not ( = ?auto_133101 ?auto_133103 ) ) ( not ( = ?auto_133102 ?auto_133103 ) ) ( ON ?auto_133103 ?auto_133106 ) ( not ( = ?auto_133100 ?auto_133106 ) ) ( not ( = ?auto_133101 ?auto_133106 ) ) ( not ( = ?auto_133102 ?auto_133106 ) ) ( not ( = ?auto_133103 ?auto_133106 ) ) ( ON ?auto_133102 ?auto_133103 ) ( ON-TABLE ?auto_133105 ) ( ON ?auto_133108 ?auto_133105 ) ( ON ?auto_133107 ?auto_133108 ) ( ON ?auto_133104 ?auto_133107 ) ( ON ?auto_133106 ?auto_133104 ) ( not ( = ?auto_133105 ?auto_133108 ) ) ( not ( = ?auto_133105 ?auto_133107 ) ) ( not ( = ?auto_133105 ?auto_133104 ) ) ( not ( = ?auto_133105 ?auto_133106 ) ) ( not ( = ?auto_133105 ?auto_133103 ) ) ( not ( = ?auto_133105 ?auto_133102 ) ) ( not ( = ?auto_133108 ?auto_133107 ) ) ( not ( = ?auto_133108 ?auto_133104 ) ) ( not ( = ?auto_133108 ?auto_133106 ) ) ( not ( = ?auto_133108 ?auto_133103 ) ) ( not ( = ?auto_133108 ?auto_133102 ) ) ( not ( = ?auto_133107 ?auto_133104 ) ) ( not ( = ?auto_133107 ?auto_133106 ) ) ( not ( = ?auto_133107 ?auto_133103 ) ) ( not ( = ?auto_133107 ?auto_133102 ) ) ( not ( = ?auto_133104 ?auto_133106 ) ) ( not ( = ?auto_133104 ?auto_133103 ) ) ( not ( = ?auto_133104 ?auto_133102 ) ) ( not ( = ?auto_133100 ?auto_133105 ) ) ( not ( = ?auto_133100 ?auto_133108 ) ) ( not ( = ?auto_133100 ?auto_133107 ) ) ( not ( = ?auto_133100 ?auto_133104 ) ) ( not ( = ?auto_133101 ?auto_133105 ) ) ( not ( = ?auto_133101 ?auto_133108 ) ) ( not ( = ?auto_133101 ?auto_133107 ) ) ( not ( = ?auto_133101 ?auto_133104 ) ) ( ON ?auto_133101 ?auto_133102 ) ( ON ?auto_133100 ?auto_133101 ) ( CLEAR ?auto_133100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133105 ?auto_133108 ?auto_133107 ?auto_133104 ?auto_133106 ?auto_133103 ?auto_133102 ?auto_133101 )
      ( MAKE-4PILE ?auto_133100 ?auto_133101 ?auto_133102 ?auto_133103 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133113 - BLOCK
      ?auto_133114 - BLOCK
      ?auto_133115 - BLOCK
      ?auto_133116 - BLOCK
    )
    :vars
    (
      ?auto_133117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133117 ?auto_133116 ) ( CLEAR ?auto_133117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133113 ) ( ON ?auto_133114 ?auto_133113 ) ( ON ?auto_133115 ?auto_133114 ) ( ON ?auto_133116 ?auto_133115 ) ( not ( = ?auto_133113 ?auto_133114 ) ) ( not ( = ?auto_133113 ?auto_133115 ) ) ( not ( = ?auto_133113 ?auto_133116 ) ) ( not ( = ?auto_133113 ?auto_133117 ) ) ( not ( = ?auto_133114 ?auto_133115 ) ) ( not ( = ?auto_133114 ?auto_133116 ) ) ( not ( = ?auto_133114 ?auto_133117 ) ) ( not ( = ?auto_133115 ?auto_133116 ) ) ( not ( = ?auto_133115 ?auto_133117 ) ) ( not ( = ?auto_133116 ?auto_133117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133117 ?auto_133116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133118 - BLOCK
      ?auto_133119 - BLOCK
      ?auto_133120 - BLOCK
      ?auto_133121 - BLOCK
    )
    :vars
    (
      ?auto_133122 - BLOCK
      ?auto_133123 - BLOCK
      ?auto_133124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133122 ?auto_133121 ) ( CLEAR ?auto_133122 ) ( ON-TABLE ?auto_133118 ) ( ON ?auto_133119 ?auto_133118 ) ( ON ?auto_133120 ?auto_133119 ) ( ON ?auto_133121 ?auto_133120 ) ( not ( = ?auto_133118 ?auto_133119 ) ) ( not ( = ?auto_133118 ?auto_133120 ) ) ( not ( = ?auto_133118 ?auto_133121 ) ) ( not ( = ?auto_133118 ?auto_133122 ) ) ( not ( = ?auto_133119 ?auto_133120 ) ) ( not ( = ?auto_133119 ?auto_133121 ) ) ( not ( = ?auto_133119 ?auto_133122 ) ) ( not ( = ?auto_133120 ?auto_133121 ) ) ( not ( = ?auto_133120 ?auto_133122 ) ) ( not ( = ?auto_133121 ?auto_133122 ) ) ( HOLDING ?auto_133123 ) ( CLEAR ?auto_133124 ) ( not ( = ?auto_133118 ?auto_133123 ) ) ( not ( = ?auto_133118 ?auto_133124 ) ) ( not ( = ?auto_133119 ?auto_133123 ) ) ( not ( = ?auto_133119 ?auto_133124 ) ) ( not ( = ?auto_133120 ?auto_133123 ) ) ( not ( = ?auto_133120 ?auto_133124 ) ) ( not ( = ?auto_133121 ?auto_133123 ) ) ( not ( = ?auto_133121 ?auto_133124 ) ) ( not ( = ?auto_133122 ?auto_133123 ) ) ( not ( = ?auto_133122 ?auto_133124 ) ) ( not ( = ?auto_133123 ?auto_133124 ) ) )
    :subtasks
    ( ( !STACK ?auto_133123 ?auto_133124 )
      ( MAKE-4PILE ?auto_133118 ?auto_133119 ?auto_133120 ?auto_133121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133125 - BLOCK
      ?auto_133126 - BLOCK
      ?auto_133127 - BLOCK
      ?auto_133128 - BLOCK
    )
    :vars
    (
      ?auto_133130 - BLOCK
      ?auto_133129 - BLOCK
      ?auto_133131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133130 ?auto_133128 ) ( ON-TABLE ?auto_133125 ) ( ON ?auto_133126 ?auto_133125 ) ( ON ?auto_133127 ?auto_133126 ) ( ON ?auto_133128 ?auto_133127 ) ( not ( = ?auto_133125 ?auto_133126 ) ) ( not ( = ?auto_133125 ?auto_133127 ) ) ( not ( = ?auto_133125 ?auto_133128 ) ) ( not ( = ?auto_133125 ?auto_133130 ) ) ( not ( = ?auto_133126 ?auto_133127 ) ) ( not ( = ?auto_133126 ?auto_133128 ) ) ( not ( = ?auto_133126 ?auto_133130 ) ) ( not ( = ?auto_133127 ?auto_133128 ) ) ( not ( = ?auto_133127 ?auto_133130 ) ) ( not ( = ?auto_133128 ?auto_133130 ) ) ( CLEAR ?auto_133129 ) ( not ( = ?auto_133125 ?auto_133131 ) ) ( not ( = ?auto_133125 ?auto_133129 ) ) ( not ( = ?auto_133126 ?auto_133131 ) ) ( not ( = ?auto_133126 ?auto_133129 ) ) ( not ( = ?auto_133127 ?auto_133131 ) ) ( not ( = ?auto_133127 ?auto_133129 ) ) ( not ( = ?auto_133128 ?auto_133131 ) ) ( not ( = ?auto_133128 ?auto_133129 ) ) ( not ( = ?auto_133130 ?auto_133131 ) ) ( not ( = ?auto_133130 ?auto_133129 ) ) ( not ( = ?auto_133131 ?auto_133129 ) ) ( ON ?auto_133131 ?auto_133130 ) ( CLEAR ?auto_133131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133125 ?auto_133126 ?auto_133127 ?auto_133128 ?auto_133130 )
      ( MAKE-4PILE ?auto_133125 ?auto_133126 ?auto_133127 ?auto_133128 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133132 - BLOCK
      ?auto_133133 - BLOCK
      ?auto_133134 - BLOCK
      ?auto_133135 - BLOCK
    )
    :vars
    (
      ?auto_133136 - BLOCK
      ?auto_133138 - BLOCK
      ?auto_133137 - BLOCK
      ?auto_133140 - BLOCK
      ?auto_133139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133136 ?auto_133135 ) ( ON-TABLE ?auto_133132 ) ( ON ?auto_133133 ?auto_133132 ) ( ON ?auto_133134 ?auto_133133 ) ( ON ?auto_133135 ?auto_133134 ) ( not ( = ?auto_133132 ?auto_133133 ) ) ( not ( = ?auto_133132 ?auto_133134 ) ) ( not ( = ?auto_133132 ?auto_133135 ) ) ( not ( = ?auto_133132 ?auto_133136 ) ) ( not ( = ?auto_133133 ?auto_133134 ) ) ( not ( = ?auto_133133 ?auto_133135 ) ) ( not ( = ?auto_133133 ?auto_133136 ) ) ( not ( = ?auto_133134 ?auto_133135 ) ) ( not ( = ?auto_133134 ?auto_133136 ) ) ( not ( = ?auto_133135 ?auto_133136 ) ) ( not ( = ?auto_133132 ?auto_133138 ) ) ( not ( = ?auto_133132 ?auto_133137 ) ) ( not ( = ?auto_133133 ?auto_133138 ) ) ( not ( = ?auto_133133 ?auto_133137 ) ) ( not ( = ?auto_133134 ?auto_133138 ) ) ( not ( = ?auto_133134 ?auto_133137 ) ) ( not ( = ?auto_133135 ?auto_133138 ) ) ( not ( = ?auto_133135 ?auto_133137 ) ) ( not ( = ?auto_133136 ?auto_133138 ) ) ( not ( = ?auto_133136 ?auto_133137 ) ) ( not ( = ?auto_133138 ?auto_133137 ) ) ( ON ?auto_133138 ?auto_133136 ) ( CLEAR ?auto_133138 ) ( HOLDING ?auto_133137 ) ( CLEAR ?auto_133140 ) ( ON-TABLE ?auto_133139 ) ( ON ?auto_133140 ?auto_133139 ) ( not ( = ?auto_133139 ?auto_133140 ) ) ( not ( = ?auto_133139 ?auto_133137 ) ) ( not ( = ?auto_133140 ?auto_133137 ) ) ( not ( = ?auto_133132 ?auto_133140 ) ) ( not ( = ?auto_133132 ?auto_133139 ) ) ( not ( = ?auto_133133 ?auto_133140 ) ) ( not ( = ?auto_133133 ?auto_133139 ) ) ( not ( = ?auto_133134 ?auto_133140 ) ) ( not ( = ?auto_133134 ?auto_133139 ) ) ( not ( = ?auto_133135 ?auto_133140 ) ) ( not ( = ?auto_133135 ?auto_133139 ) ) ( not ( = ?auto_133136 ?auto_133140 ) ) ( not ( = ?auto_133136 ?auto_133139 ) ) ( not ( = ?auto_133138 ?auto_133140 ) ) ( not ( = ?auto_133138 ?auto_133139 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133139 ?auto_133140 ?auto_133137 )
      ( MAKE-4PILE ?auto_133132 ?auto_133133 ?auto_133134 ?auto_133135 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133141 - BLOCK
      ?auto_133142 - BLOCK
      ?auto_133143 - BLOCK
      ?auto_133144 - BLOCK
    )
    :vars
    (
      ?auto_133146 - BLOCK
      ?auto_133145 - BLOCK
      ?auto_133148 - BLOCK
      ?auto_133147 - BLOCK
      ?auto_133149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133146 ?auto_133144 ) ( ON-TABLE ?auto_133141 ) ( ON ?auto_133142 ?auto_133141 ) ( ON ?auto_133143 ?auto_133142 ) ( ON ?auto_133144 ?auto_133143 ) ( not ( = ?auto_133141 ?auto_133142 ) ) ( not ( = ?auto_133141 ?auto_133143 ) ) ( not ( = ?auto_133141 ?auto_133144 ) ) ( not ( = ?auto_133141 ?auto_133146 ) ) ( not ( = ?auto_133142 ?auto_133143 ) ) ( not ( = ?auto_133142 ?auto_133144 ) ) ( not ( = ?auto_133142 ?auto_133146 ) ) ( not ( = ?auto_133143 ?auto_133144 ) ) ( not ( = ?auto_133143 ?auto_133146 ) ) ( not ( = ?auto_133144 ?auto_133146 ) ) ( not ( = ?auto_133141 ?auto_133145 ) ) ( not ( = ?auto_133141 ?auto_133148 ) ) ( not ( = ?auto_133142 ?auto_133145 ) ) ( not ( = ?auto_133142 ?auto_133148 ) ) ( not ( = ?auto_133143 ?auto_133145 ) ) ( not ( = ?auto_133143 ?auto_133148 ) ) ( not ( = ?auto_133144 ?auto_133145 ) ) ( not ( = ?auto_133144 ?auto_133148 ) ) ( not ( = ?auto_133146 ?auto_133145 ) ) ( not ( = ?auto_133146 ?auto_133148 ) ) ( not ( = ?auto_133145 ?auto_133148 ) ) ( ON ?auto_133145 ?auto_133146 ) ( CLEAR ?auto_133147 ) ( ON-TABLE ?auto_133149 ) ( ON ?auto_133147 ?auto_133149 ) ( not ( = ?auto_133149 ?auto_133147 ) ) ( not ( = ?auto_133149 ?auto_133148 ) ) ( not ( = ?auto_133147 ?auto_133148 ) ) ( not ( = ?auto_133141 ?auto_133147 ) ) ( not ( = ?auto_133141 ?auto_133149 ) ) ( not ( = ?auto_133142 ?auto_133147 ) ) ( not ( = ?auto_133142 ?auto_133149 ) ) ( not ( = ?auto_133143 ?auto_133147 ) ) ( not ( = ?auto_133143 ?auto_133149 ) ) ( not ( = ?auto_133144 ?auto_133147 ) ) ( not ( = ?auto_133144 ?auto_133149 ) ) ( not ( = ?auto_133146 ?auto_133147 ) ) ( not ( = ?auto_133146 ?auto_133149 ) ) ( not ( = ?auto_133145 ?auto_133147 ) ) ( not ( = ?auto_133145 ?auto_133149 ) ) ( ON ?auto_133148 ?auto_133145 ) ( CLEAR ?auto_133148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133141 ?auto_133142 ?auto_133143 ?auto_133144 ?auto_133146 ?auto_133145 )
      ( MAKE-4PILE ?auto_133141 ?auto_133142 ?auto_133143 ?auto_133144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133150 - BLOCK
      ?auto_133151 - BLOCK
      ?auto_133152 - BLOCK
      ?auto_133153 - BLOCK
    )
    :vars
    (
      ?auto_133158 - BLOCK
      ?auto_133155 - BLOCK
      ?auto_133154 - BLOCK
      ?auto_133156 - BLOCK
      ?auto_133157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133158 ?auto_133153 ) ( ON-TABLE ?auto_133150 ) ( ON ?auto_133151 ?auto_133150 ) ( ON ?auto_133152 ?auto_133151 ) ( ON ?auto_133153 ?auto_133152 ) ( not ( = ?auto_133150 ?auto_133151 ) ) ( not ( = ?auto_133150 ?auto_133152 ) ) ( not ( = ?auto_133150 ?auto_133153 ) ) ( not ( = ?auto_133150 ?auto_133158 ) ) ( not ( = ?auto_133151 ?auto_133152 ) ) ( not ( = ?auto_133151 ?auto_133153 ) ) ( not ( = ?auto_133151 ?auto_133158 ) ) ( not ( = ?auto_133152 ?auto_133153 ) ) ( not ( = ?auto_133152 ?auto_133158 ) ) ( not ( = ?auto_133153 ?auto_133158 ) ) ( not ( = ?auto_133150 ?auto_133155 ) ) ( not ( = ?auto_133150 ?auto_133154 ) ) ( not ( = ?auto_133151 ?auto_133155 ) ) ( not ( = ?auto_133151 ?auto_133154 ) ) ( not ( = ?auto_133152 ?auto_133155 ) ) ( not ( = ?auto_133152 ?auto_133154 ) ) ( not ( = ?auto_133153 ?auto_133155 ) ) ( not ( = ?auto_133153 ?auto_133154 ) ) ( not ( = ?auto_133158 ?auto_133155 ) ) ( not ( = ?auto_133158 ?auto_133154 ) ) ( not ( = ?auto_133155 ?auto_133154 ) ) ( ON ?auto_133155 ?auto_133158 ) ( ON-TABLE ?auto_133156 ) ( not ( = ?auto_133156 ?auto_133157 ) ) ( not ( = ?auto_133156 ?auto_133154 ) ) ( not ( = ?auto_133157 ?auto_133154 ) ) ( not ( = ?auto_133150 ?auto_133157 ) ) ( not ( = ?auto_133150 ?auto_133156 ) ) ( not ( = ?auto_133151 ?auto_133157 ) ) ( not ( = ?auto_133151 ?auto_133156 ) ) ( not ( = ?auto_133152 ?auto_133157 ) ) ( not ( = ?auto_133152 ?auto_133156 ) ) ( not ( = ?auto_133153 ?auto_133157 ) ) ( not ( = ?auto_133153 ?auto_133156 ) ) ( not ( = ?auto_133158 ?auto_133157 ) ) ( not ( = ?auto_133158 ?auto_133156 ) ) ( not ( = ?auto_133155 ?auto_133157 ) ) ( not ( = ?auto_133155 ?auto_133156 ) ) ( ON ?auto_133154 ?auto_133155 ) ( CLEAR ?auto_133154 ) ( HOLDING ?auto_133157 ) ( CLEAR ?auto_133156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133156 ?auto_133157 )
      ( MAKE-4PILE ?auto_133150 ?auto_133151 ?auto_133152 ?auto_133153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133159 - BLOCK
      ?auto_133160 - BLOCK
      ?auto_133161 - BLOCK
      ?auto_133162 - BLOCK
    )
    :vars
    (
      ?auto_133165 - BLOCK
      ?auto_133166 - BLOCK
      ?auto_133164 - BLOCK
      ?auto_133167 - BLOCK
      ?auto_133163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133165 ?auto_133162 ) ( ON-TABLE ?auto_133159 ) ( ON ?auto_133160 ?auto_133159 ) ( ON ?auto_133161 ?auto_133160 ) ( ON ?auto_133162 ?auto_133161 ) ( not ( = ?auto_133159 ?auto_133160 ) ) ( not ( = ?auto_133159 ?auto_133161 ) ) ( not ( = ?auto_133159 ?auto_133162 ) ) ( not ( = ?auto_133159 ?auto_133165 ) ) ( not ( = ?auto_133160 ?auto_133161 ) ) ( not ( = ?auto_133160 ?auto_133162 ) ) ( not ( = ?auto_133160 ?auto_133165 ) ) ( not ( = ?auto_133161 ?auto_133162 ) ) ( not ( = ?auto_133161 ?auto_133165 ) ) ( not ( = ?auto_133162 ?auto_133165 ) ) ( not ( = ?auto_133159 ?auto_133166 ) ) ( not ( = ?auto_133159 ?auto_133164 ) ) ( not ( = ?auto_133160 ?auto_133166 ) ) ( not ( = ?auto_133160 ?auto_133164 ) ) ( not ( = ?auto_133161 ?auto_133166 ) ) ( not ( = ?auto_133161 ?auto_133164 ) ) ( not ( = ?auto_133162 ?auto_133166 ) ) ( not ( = ?auto_133162 ?auto_133164 ) ) ( not ( = ?auto_133165 ?auto_133166 ) ) ( not ( = ?auto_133165 ?auto_133164 ) ) ( not ( = ?auto_133166 ?auto_133164 ) ) ( ON ?auto_133166 ?auto_133165 ) ( ON-TABLE ?auto_133167 ) ( not ( = ?auto_133167 ?auto_133163 ) ) ( not ( = ?auto_133167 ?auto_133164 ) ) ( not ( = ?auto_133163 ?auto_133164 ) ) ( not ( = ?auto_133159 ?auto_133163 ) ) ( not ( = ?auto_133159 ?auto_133167 ) ) ( not ( = ?auto_133160 ?auto_133163 ) ) ( not ( = ?auto_133160 ?auto_133167 ) ) ( not ( = ?auto_133161 ?auto_133163 ) ) ( not ( = ?auto_133161 ?auto_133167 ) ) ( not ( = ?auto_133162 ?auto_133163 ) ) ( not ( = ?auto_133162 ?auto_133167 ) ) ( not ( = ?auto_133165 ?auto_133163 ) ) ( not ( = ?auto_133165 ?auto_133167 ) ) ( not ( = ?auto_133166 ?auto_133163 ) ) ( not ( = ?auto_133166 ?auto_133167 ) ) ( ON ?auto_133164 ?auto_133166 ) ( CLEAR ?auto_133167 ) ( ON ?auto_133163 ?auto_133164 ) ( CLEAR ?auto_133163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133159 ?auto_133160 ?auto_133161 ?auto_133162 ?auto_133165 ?auto_133166 ?auto_133164 )
      ( MAKE-4PILE ?auto_133159 ?auto_133160 ?auto_133161 ?auto_133162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133168 - BLOCK
      ?auto_133169 - BLOCK
      ?auto_133170 - BLOCK
      ?auto_133171 - BLOCK
    )
    :vars
    (
      ?auto_133174 - BLOCK
      ?auto_133175 - BLOCK
      ?auto_133172 - BLOCK
      ?auto_133173 - BLOCK
      ?auto_133176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133174 ?auto_133171 ) ( ON-TABLE ?auto_133168 ) ( ON ?auto_133169 ?auto_133168 ) ( ON ?auto_133170 ?auto_133169 ) ( ON ?auto_133171 ?auto_133170 ) ( not ( = ?auto_133168 ?auto_133169 ) ) ( not ( = ?auto_133168 ?auto_133170 ) ) ( not ( = ?auto_133168 ?auto_133171 ) ) ( not ( = ?auto_133168 ?auto_133174 ) ) ( not ( = ?auto_133169 ?auto_133170 ) ) ( not ( = ?auto_133169 ?auto_133171 ) ) ( not ( = ?auto_133169 ?auto_133174 ) ) ( not ( = ?auto_133170 ?auto_133171 ) ) ( not ( = ?auto_133170 ?auto_133174 ) ) ( not ( = ?auto_133171 ?auto_133174 ) ) ( not ( = ?auto_133168 ?auto_133175 ) ) ( not ( = ?auto_133168 ?auto_133172 ) ) ( not ( = ?auto_133169 ?auto_133175 ) ) ( not ( = ?auto_133169 ?auto_133172 ) ) ( not ( = ?auto_133170 ?auto_133175 ) ) ( not ( = ?auto_133170 ?auto_133172 ) ) ( not ( = ?auto_133171 ?auto_133175 ) ) ( not ( = ?auto_133171 ?auto_133172 ) ) ( not ( = ?auto_133174 ?auto_133175 ) ) ( not ( = ?auto_133174 ?auto_133172 ) ) ( not ( = ?auto_133175 ?auto_133172 ) ) ( ON ?auto_133175 ?auto_133174 ) ( not ( = ?auto_133173 ?auto_133176 ) ) ( not ( = ?auto_133173 ?auto_133172 ) ) ( not ( = ?auto_133176 ?auto_133172 ) ) ( not ( = ?auto_133168 ?auto_133176 ) ) ( not ( = ?auto_133168 ?auto_133173 ) ) ( not ( = ?auto_133169 ?auto_133176 ) ) ( not ( = ?auto_133169 ?auto_133173 ) ) ( not ( = ?auto_133170 ?auto_133176 ) ) ( not ( = ?auto_133170 ?auto_133173 ) ) ( not ( = ?auto_133171 ?auto_133176 ) ) ( not ( = ?auto_133171 ?auto_133173 ) ) ( not ( = ?auto_133174 ?auto_133176 ) ) ( not ( = ?auto_133174 ?auto_133173 ) ) ( not ( = ?auto_133175 ?auto_133176 ) ) ( not ( = ?auto_133175 ?auto_133173 ) ) ( ON ?auto_133172 ?auto_133175 ) ( ON ?auto_133176 ?auto_133172 ) ( CLEAR ?auto_133176 ) ( HOLDING ?auto_133173 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133173 )
      ( MAKE-4PILE ?auto_133168 ?auto_133169 ?auto_133170 ?auto_133171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_133177 - BLOCK
      ?auto_133178 - BLOCK
      ?auto_133179 - BLOCK
      ?auto_133180 - BLOCK
    )
    :vars
    (
      ?auto_133182 - BLOCK
      ?auto_133184 - BLOCK
      ?auto_133183 - BLOCK
      ?auto_133181 - BLOCK
      ?auto_133185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133182 ?auto_133180 ) ( ON-TABLE ?auto_133177 ) ( ON ?auto_133178 ?auto_133177 ) ( ON ?auto_133179 ?auto_133178 ) ( ON ?auto_133180 ?auto_133179 ) ( not ( = ?auto_133177 ?auto_133178 ) ) ( not ( = ?auto_133177 ?auto_133179 ) ) ( not ( = ?auto_133177 ?auto_133180 ) ) ( not ( = ?auto_133177 ?auto_133182 ) ) ( not ( = ?auto_133178 ?auto_133179 ) ) ( not ( = ?auto_133178 ?auto_133180 ) ) ( not ( = ?auto_133178 ?auto_133182 ) ) ( not ( = ?auto_133179 ?auto_133180 ) ) ( not ( = ?auto_133179 ?auto_133182 ) ) ( not ( = ?auto_133180 ?auto_133182 ) ) ( not ( = ?auto_133177 ?auto_133184 ) ) ( not ( = ?auto_133177 ?auto_133183 ) ) ( not ( = ?auto_133178 ?auto_133184 ) ) ( not ( = ?auto_133178 ?auto_133183 ) ) ( not ( = ?auto_133179 ?auto_133184 ) ) ( not ( = ?auto_133179 ?auto_133183 ) ) ( not ( = ?auto_133180 ?auto_133184 ) ) ( not ( = ?auto_133180 ?auto_133183 ) ) ( not ( = ?auto_133182 ?auto_133184 ) ) ( not ( = ?auto_133182 ?auto_133183 ) ) ( not ( = ?auto_133184 ?auto_133183 ) ) ( ON ?auto_133184 ?auto_133182 ) ( not ( = ?auto_133181 ?auto_133185 ) ) ( not ( = ?auto_133181 ?auto_133183 ) ) ( not ( = ?auto_133185 ?auto_133183 ) ) ( not ( = ?auto_133177 ?auto_133185 ) ) ( not ( = ?auto_133177 ?auto_133181 ) ) ( not ( = ?auto_133178 ?auto_133185 ) ) ( not ( = ?auto_133178 ?auto_133181 ) ) ( not ( = ?auto_133179 ?auto_133185 ) ) ( not ( = ?auto_133179 ?auto_133181 ) ) ( not ( = ?auto_133180 ?auto_133185 ) ) ( not ( = ?auto_133180 ?auto_133181 ) ) ( not ( = ?auto_133182 ?auto_133185 ) ) ( not ( = ?auto_133182 ?auto_133181 ) ) ( not ( = ?auto_133184 ?auto_133185 ) ) ( not ( = ?auto_133184 ?auto_133181 ) ) ( ON ?auto_133183 ?auto_133184 ) ( ON ?auto_133185 ?auto_133183 ) ( ON ?auto_133181 ?auto_133185 ) ( CLEAR ?auto_133181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133177 ?auto_133178 ?auto_133179 ?auto_133180 ?auto_133182 ?auto_133184 ?auto_133183 ?auto_133185 )
      ( MAKE-4PILE ?auto_133177 ?auto_133178 ?auto_133179 ?auto_133180 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133191 - BLOCK
      ?auto_133192 - BLOCK
      ?auto_133193 - BLOCK
      ?auto_133194 - BLOCK
      ?auto_133195 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_133195 ) ( CLEAR ?auto_133194 ) ( ON-TABLE ?auto_133191 ) ( ON ?auto_133192 ?auto_133191 ) ( ON ?auto_133193 ?auto_133192 ) ( ON ?auto_133194 ?auto_133193 ) ( not ( = ?auto_133191 ?auto_133192 ) ) ( not ( = ?auto_133191 ?auto_133193 ) ) ( not ( = ?auto_133191 ?auto_133194 ) ) ( not ( = ?auto_133191 ?auto_133195 ) ) ( not ( = ?auto_133192 ?auto_133193 ) ) ( not ( = ?auto_133192 ?auto_133194 ) ) ( not ( = ?auto_133192 ?auto_133195 ) ) ( not ( = ?auto_133193 ?auto_133194 ) ) ( not ( = ?auto_133193 ?auto_133195 ) ) ( not ( = ?auto_133194 ?auto_133195 ) ) )
    :subtasks
    ( ( !STACK ?auto_133195 ?auto_133194 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133196 - BLOCK
      ?auto_133197 - BLOCK
      ?auto_133198 - BLOCK
      ?auto_133199 - BLOCK
      ?auto_133200 - BLOCK
    )
    :vars
    (
      ?auto_133201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133199 ) ( ON-TABLE ?auto_133196 ) ( ON ?auto_133197 ?auto_133196 ) ( ON ?auto_133198 ?auto_133197 ) ( ON ?auto_133199 ?auto_133198 ) ( not ( = ?auto_133196 ?auto_133197 ) ) ( not ( = ?auto_133196 ?auto_133198 ) ) ( not ( = ?auto_133196 ?auto_133199 ) ) ( not ( = ?auto_133196 ?auto_133200 ) ) ( not ( = ?auto_133197 ?auto_133198 ) ) ( not ( = ?auto_133197 ?auto_133199 ) ) ( not ( = ?auto_133197 ?auto_133200 ) ) ( not ( = ?auto_133198 ?auto_133199 ) ) ( not ( = ?auto_133198 ?auto_133200 ) ) ( not ( = ?auto_133199 ?auto_133200 ) ) ( ON ?auto_133200 ?auto_133201 ) ( CLEAR ?auto_133200 ) ( HAND-EMPTY ) ( not ( = ?auto_133196 ?auto_133201 ) ) ( not ( = ?auto_133197 ?auto_133201 ) ) ( not ( = ?auto_133198 ?auto_133201 ) ) ( not ( = ?auto_133199 ?auto_133201 ) ) ( not ( = ?auto_133200 ?auto_133201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133200 ?auto_133201 )
      ( MAKE-5PILE ?auto_133196 ?auto_133197 ?auto_133198 ?auto_133199 ?auto_133200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133202 - BLOCK
      ?auto_133203 - BLOCK
      ?auto_133204 - BLOCK
      ?auto_133205 - BLOCK
      ?auto_133206 - BLOCK
    )
    :vars
    (
      ?auto_133207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133202 ) ( ON ?auto_133203 ?auto_133202 ) ( ON ?auto_133204 ?auto_133203 ) ( not ( = ?auto_133202 ?auto_133203 ) ) ( not ( = ?auto_133202 ?auto_133204 ) ) ( not ( = ?auto_133202 ?auto_133205 ) ) ( not ( = ?auto_133202 ?auto_133206 ) ) ( not ( = ?auto_133203 ?auto_133204 ) ) ( not ( = ?auto_133203 ?auto_133205 ) ) ( not ( = ?auto_133203 ?auto_133206 ) ) ( not ( = ?auto_133204 ?auto_133205 ) ) ( not ( = ?auto_133204 ?auto_133206 ) ) ( not ( = ?auto_133205 ?auto_133206 ) ) ( ON ?auto_133206 ?auto_133207 ) ( CLEAR ?auto_133206 ) ( not ( = ?auto_133202 ?auto_133207 ) ) ( not ( = ?auto_133203 ?auto_133207 ) ) ( not ( = ?auto_133204 ?auto_133207 ) ) ( not ( = ?auto_133205 ?auto_133207 ) ) ( not ( = ?auto_133206 ?auto_133207 ) ) ( HOLDING ?auto_133205 ) ( CLEAR ?auto_133204 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133202 ?auto_133203 ?auto_133204 ?auto_133205 )
      ( MAKE-5PILE ?auto_133202 ?auto_133203 ?auto_133204 ?auto_133205 ?auto_133206 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133208 - BLOCK
      ?auto_133209 - BLOCK
      ?auto_133210 - BLOCK
      ?auto_133211 - BLOCK
      ?auto_133212 - BLOCK
    )
    :vars
    (
      ?auto_133213 - BLOCK
      ?auto_133215 - BLOCK
      ?auto_133216 - BLOCK
      ?auto_133214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133208 ) ( ON ?auto_133209 ?auto_133208 ) ( ON ?auto_133210 ?auto_133209 ) ( not ( = ?auto_133208 ?auto_133209 ) ) ( not ( = ?auto_133208 ?auto_133210 ) ) ( not ( = ?auto_133208 ?auto_133211 ) ) ( not ( = ?auto_133208 ?auto_133212 ) ) ( not ( = ?auto_133209 ?auto_133210 ) ) ( not ( = ?auto_133209 ?auto_133211 ) ) ( not ( = ?auto_133209 ?auto_133212 ) ) ( not ( = ?auto_133210 ?auto_133211 ) ) ( not ( = ?auto_133210 ?auto_133212 ) ) ( not ( = ?auto_133211 ?auto_133212 ) ) ( ON ?auto_133212 ?auto_133213 ) ( not ( = ?auto_133208 ?auto_133213 ) ) ( not ( = ?auto_133209 ?auto_133213 ) ) ( not ( = ?auto_133210 ?auto_133213 ) ) ( not ( = ?auto_133211 ?auto_133213 ) ) ( not ( = ?auto_133212 ?auto_133213 ) ) ( CLEAR ?auto_133210 ) ( ON ?auto_133211 ?auto_133212 ) ( CLEAR ?auto_133211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133215 ) ( ON ?auto_133216 ?auto_133215 ) ( ON ?auto_133214 ?auto_133216 ) ( ON ?auto_133213 ?auto_133214 ) ( not ( = ?auto_133215 ?auto_133216 ) ) ( not ( = ?auto_133215 ?auto_133214 ) ) ( not ( = ?auto_133215 ?auto_133213 ) ) ( not ( = ?auto_133215 ?auto_133212 ) ) ( not ( = ?auto_133215 ?auto_133211 ) ) ( not ( = ?auto_133216 ?auto_133214 ) ) ( not ( = ?auto_133216 ?auto_133213 ) ) ( not ( = ?auto_133216 ?auto_133212 ) ) ( not ( = ?auto_133216 ?auto_133211 ) ) ( not ( = ?auto_133214 ?auto_133213 ) ) ( not ( = ?auto_133214 ?auto_133212 ) ) ( not ( = ?auto_133214 ?auto_133211 ) ) ( not ( = ?auto_133208 ?auto_133215 ) ) ( not ( = ?auto_133208 ?auto_133216 ) ) ( not ( = ?auto_133208 ?auto_133214 ) ) ( not ( = ?auto_133209 ?auto_133215 ) ) ( not ( = ?auto_133209 ?auto_133216 ) ) ( not ( = ?auto_133209 ?auto_133214 ) ) ( not ( = ?auto_133210 ?auto_133215 ) ) ( not ( = ?auto_133210 ?auto_133216 ) ) ( not ( = ?auto_133210 ?auto_133214 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133215 ?auto_133216 ?auto_133214 ?auto_133213 ?auto_133212 )
      ( MAKE-5PILE ?auto_133208 ?auto_133209 ?auto_133210 ?auto_133211 ?auto_133212 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133217 - BLOCK
      ?auto_133218 - BLOCK
      ?auto_133219 - BLOCK
      ?auto_133220 - BLOCK
      ?auto_133221 - BLOCK
    )
    :vars
    (
      ?auto_133222 - BLOCK
      ?auto_133223 - BLOCK
      ?auto_133224 - BLOCK
      ?auto_133225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133217 ) ( ON ?auto_133218 ?auto_133217 ) ( not ( = ?auto_133217 ?auto_133218 ) ) ( not ( = ?auto_133217 ?auto_133219 ) ) ( not ( = ?auto_133217 ?auto_133220 ) ) ( not ( = ?auto_133217 ?auto_133221 ) ) ( not ( = ?auto_133218 ?auto_133219 ) ) ( not ( = ?auto_133218 ?auto_133220 ) ) ( not ( = ?auto_133218 ?auto_133221 ) ) ( not ( = ?auto_133219 ?auto_133220 ) ) ( not ( = ?auto_133219 ?auto_133221 ) ) ( not ( = ?auto_133220 ?auto_133221 ) ) ( ON ?auto_133221 ?auto_133222 ) ( not ( = ?auto_133217 ?auto_133222 ) ) ( not ( = ?auto_133218 ?auto_133222 ) ) ( not ( = ?auto_133219 ?auto_133222 ) ) ( not ( = ?auto_133220 ?auto_133222 ) ) ( not ( = ?auto_133221 ?auto_133222 ) ) ( ON ?auto_133220 ?auto_133221 ) ( CLEAR ?auto_133220 ) ( ON-TABLE ?auto_133223 ) ( ON ?auto_133224 ?auto_133223 ) ( ON ?auto_133225 ?auto_133224 ) ( ON ?auto_133222 ?auto_133225 ) ( not ( = ?auto_133223 ?auto_133224 ) ) ( not ( = ?auto_133223 ?auto_133225 ) ) ( not ( = ?auto_133223 ?auto_133222 ) ) ( not ( = ?auto_133223 ?auto_133221 ) ) ( not ( = ?auto_133223 ?auto_133220 ) ) ( not ( = ?auto_133224 ?auto_133225 ) ) ( not ( = ?auto_133224 ?auto_133222 ) ) ( not ( = ?auto_133224 ?auto_133221 ) ) ( not ( = ?auto_133224 ?auto_133220 ) ) ( not ( = ?auto_133225 ?auto_133222 ) ) ( not ( = ?auto_133225 ?auto_133221 ) ) ( not ( = ?auto_133225 ?auto_133220 ) ) ( not ( = ?auto_133217 ?auto_133223 ) ) ( not ( = ?auto_133217 ?auto_133224 ) ) ( not ( = ?auto_133217 ?auto_133225 ) ) ( not ( = ?auto_133218 ?auto_133223 ) ) ( not ( = ?auto_133218 ?auto_133224 ) ) ( not ( = ?auto_133218 ?auto_133225 ) ) ( not ( = ?auto_133219 ?auto_133223 ) ) ( not ( = ?auto_133219 ?auto_133224 ) ) ( not ( = ?auto_133219 ?auto_133225 ) ) ( HOLDING ?auto_133219 ) ( CLEAR ?auto_133218 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133217 ?auto_133218 ?auto_133219 )
      ( MAKE-5PILE ?auto_133217 ?auto_133218 ?auto_133219 ?auto_133220 ?auto_133221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133226 - BLOCK
      ?auto_133227 - BLOCK
      ?auto_133228 - BLOCK
      ?auto_133229 - BLOCK
      ?auto_133230 - BLOCK
    )
    :vars
    (
      ?auto_133231 - BLOCK
      ?auto_133234 - BLOCK
      ?auto_133233 - BLOCK
      ?auto_133232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133226 ) ( ON ?auto_133227 ?auto_133226 ) ( not ( = ?auto_133226 ?auto_133227 ) ) ( not ( = ?auto_133226 ?auto_133228 ) ) ( not ( = ?auto_133226 ?auto_133229 ) ) ( not ( = ?auto_133226 ?auto_133230 ) ) ( not ( = ?auto_133227 ?auto_133228 ) ) ( not ( = ?auto_133227 ?auto_133229 ) ) ( not ( = ?auto_133227 ?auto_133230 ) ) ( not ( = ?auto_133228 ?auto_133229 ) ) ( not ( = ?auto_133228 ?auto_133230 ) ) ( not ( = ?auto_133229 ?auto_133230 ) ) ( ON ?auto_133230 ?auto_133231 ) ( not ( = ?auto_133226 ?auto_133231 ) ) ( not ( = ?auto_133227 ?auto_133231 ) ) ( not ( = ?auto_133228 ?auto_133231 ) ) ( not ( = ?auto_133229 ?auto_133231 ) ) ( not ( = ?auto_133230 ?auto_133231 ) ) ( ON ?auto_133229 ?auto_133230 ) ( ON-TABLE ?auto_133234 ) ( ON ?auto_133233 ?auto_133234 ) ( ON ?auto_133232 ?auto_133233 ) ( ON ?auto_133231 ?auto_133232 ) ( not ( = ?auto_133234 ?auto_133233 ) ) ( not ( = ?auto_133234 ?auto_133232 ) ) ( not ( = ?auto_133234 ?auto_133231 ) ) ( not ( = ?auto_133234 ?auto_133230 ) ) ( not ( = ?auto_133234 ?auto_133229 ) ) ( not ( = ?auto_133233 ?auto_133232 ) ) ( not ( = ?auto_133233 ?auto_133231 ) ) ( not ( = ?auto_133233 ?auto_133230 ) ) ( not ( = ?auto_133233 ?auto_133229 ) ) ( not ( = ?auto_133232 ?auto_133231 ) ) ( not ( = ?auto_133232 ?auto_133230 ) ) ( not ( = ?auto_133232 ?auto_133229 ) ) ( not ( = ?auto_133226 ?auto_133234 ) ) ( not ( = ?auto_133226 ?auto_133233 ) ) ( not ( = ?auto_133226 ?auto_133232 ) ) ( not ( = ?auto_133227 ?auto_133234 ) ) ( not ( = ?auto_133227 ?auto_133233 ) ) ( not ( = ?auto_133227 ?auto_133232 ) ) ( not ( = ?auto_133228 ?auto_133234 ) ) ( not ( = ?auto_133228 ?auto_133233 ) ) ( not ( = ?auto_133228 ?auto_133232 ) ) ( CLEAR ?auto_133227 ) ( ON ?auto_133228 ?auto_133229 ) ( CLEAR ?auto_133228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133234 ?auto_133233 ?auto_133232 ?auto_133231 ?auto_133230 ?auto_133229 )
      ( MAKE-5PILE ?auto_133226 ?auto_133227 ?auto_133228 ?auto_133229 ?auto_133230 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133235 - BLOCK
      ?auto_133236 - BLOCK
      ?auto_133237 - BLOCK
      ?auto_133238 - BLOCK
      ?auto_133239 - BLOCK
    )
    :vars
    (
      ?auto_133243 - BLOCK
      ?auto_133241 - BLOCK
      ?auto_133240 - BLOCK
      ?auto_133242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133235 ) ( not ( = ?auto_133235 ?auto_133236 ) ) ( not ( = ?auto_133235 ?auto_133237 ) ) ( not ( = ?auto_133235 ?auto_133238 ) ) ( not ( = ?auto_133235 ?auto_133239 ) ) ( not ( = ?auto_133236 ?auto_133237 ) ) ( not ( = ?auto_133236 ?auto_133238 ) ) ( not ( = ?auto_133236 ?auto_133239 ) ) ( not ( = ?auto_133237 ?auto_133238 ) ) ( not ( = ?auto_133237 ?auto_133239 ) ) ( not ( = ?auto_133238 ?auto_133239 ) ) ( ON ?auto_133239 ?auto_133243 ) ( not ( = ?auto_133235 ?auto_133243 ) ) ( not ( = ?auto_133236 ?auto_133243 ) ) ( not ( = ?auto_133237 ?auto_133243 ) ) ( not ( = ?auto_133238 ?auto_133243 ) ) ( not ( = ?auto_133239 ?auto_133243 ) ) ( ON ?auto_133238 ?auto_133239 ) ( ON-TABLE ?auto_133241 ) ( ON ?auto_133240 ?auto_133241 ) ( ON ?auto_133242 ?auto_133240 ) ( ON ?auto_133243 ?auto_133242 ) ( not ( = ?auto_133241 ?auto_133240 ) ) ( not ( = ?auto_133241 ?auto_133242 ) ) ( not ( = ?auto_133241 ?auto_133243 ) ) ( not ( = ?auto_133241 ?auto_133239 ) ) ( not ( = ?auto_133241 ?auto_133238 ) ) ( not ( = ?auto_133240 ?auto_133242 ) ) ( not ( = ?auto_133240 ?auto_133243 ) ) ( not ( = ?auto_133240 ?auto_133239 ) ) ( not ( = ?auto_133240 ?auto_133238 ) ) ( not ( = ?auto_133242 ?auto_133243 ) ) ( not ( = ?auto_133242 ?auto_133239 ) ) ( not ( = ?auto_133242 ?auto_133238 ) ) ( not ( = ?auto_133235 ?auto_133241 ) ) ( not ( = ?auto_133235 ?auto_133240 ) ) ( not ( = ?auto_133235 ?auto_133242 ) ) ( not ( = ?auto_133236 ?auto_133241 ) ) ( not ( = ?auto_133236 ?auto_133240 ) ) ( not ( = ?auto_133236 ?auto_133242 ) ) ( not ( = ?auto_133237 ?auto_133241 ) ) ( not ( = ?auto_133237 ?auto_133240 ) ) ( not ( = ?auto_133237 ?auto_133242 ) ) ( ON ?auto_133237 ?auto_133238 ) ( CLEAR ?auto_133237 ) ( HOLDING ?auto_133236 ) ( CLEAR ?auto_133235 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133235 ?auto_133236 )
      ( MAKE-5PILE ?auto_133235 ?auto_133236 ?auto_133237 ?auto_133238 ?auto_133239 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133244 - BLOCK
      ?auto_133245 - BLOCK
      ?auto_133246 - BLOCK
      ?auto_133247 - BLOCK
      ?auto_133248 - BLOCK
    )
    :vars
    (
      ?auto_133249 - BLOCK
      ?auto_133251 - BLOCK
      ?auto_133250 - BLOCK
      ?auto_133252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133244 ) ( not ( = ?auto_133244 ?auto_133245 ) ) ( not ( = ?auto_133244 ?auto_133246 ) ) ( not ( = ?auto_133244 ?auto_133247 ) ) ( not ( = ?auto_133244 ?auto_133248 ) ) ( not ( = ?auto_133245 ?auto_133246 ) ) ( not ( = ?auto_133245 ?auto_133247 ) ) ( not ( = ?auto_133245 ?auto_133248 ) ) ( not ( = ?auto_133246 ?auto_133247 ) ) ( not ( = ?auto_133246 ?auto_133248 ) ) ( not ( = ?auto_133247 ?auto_133248 ) ) ( ON ?auto_133248 ?auto_133249 ) ( not ( = ?auto_133244 ?auto_133249 ) ) ( not ( = ?auto_133245 ?auto_133249 ) ) ( not ( = ?auto_133246 ?auto_133249 ) ) ( not ( = ?auto_133247 ?auto_133249 ) ) ( not ( = ?auto_133248 ?auto_133249 ) ) ( ON ?auto_133247 ?auto_133248 ) ( ON-TABLE ?auto_133251 ) ( ON ?auto_133250 ?auto_133251 ) ( ON ?auto_133252 ?auto_133250 ) ( ON ?auto_133249 ?auto_133252 ) ( not ( = ?auto_133251 ?auto_133250 ) ) ( not ( = ?auto_133251 ?auto_133252 ) ) ( not ( = ?auto_133251 ?auto_133249 ) ) ( not ( = ?auto_133251 ?auto_133248 ) ) ( not ( = ?auto_133251 ?auto_133247 ) ) ( not ( = ?auto_133250 ?auto_133252 ) ) ( not ( = ?auto_133250 ?auto_133249 ) ) ( not ( = ?auto_133250 ?auto_133248 ) ) ( not ( = ?auto_133250 ?auto_133247 ) ) ( not ( = ?auto_133252 ?auto_133249 ) ) ( not ( = ?auto_133252 ?auto_133248 ) ) ( not ( = ?auto_133252 ?auto_133247 ) ) ( not ( = ?auto_133244 ?auto_133251 ) ) ( not ( = ?auto_133244 ?auto_133250 ) ) ( not ( = ?auto_133244 ?auto_133252 ) ) ( not ( = ?auto_133245 ?auto_133251 ) ) ( not ( = ?auto_133245 ?auto_133250 ) ) ( not ( = ?auto_133245 ?auto_133252 ) ) ( not ( = ?auto_133246 ?auto_133251 ) ) ( not ( = ?auto_133246 ?auto_133250 ) ) ( not ( = ?auto_133246 ?auto_133252 ) ) ( ON ?auto_133246 ?auto_133247 ) ( CLEAR ?auto_133244 ) ( ON ?auto_133245 ?auto_133246 ) ( CLEAR ?auto_133245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133251 ?auto_133250 ?auto_133252 ?auto_133249 ?auto_133248 ?auto_133247 ?auto_133246 )
      ( MAKE-5PILE ?auto_133244 ?auto_133245 ?auto_133246 ?auto_133247 ?auto_133248 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133253 - BLOCK
      ?auto_133254 - BLOCK
      ?auto_133255 - BLOCK
      ?auto_133256 - BLOCK
      ?auto_133257 - BLOCK
    )
    :vars
    (
      ?auto_133259 - BLOCK
      ?auto_133261 - BLOCK
      ?auto_133260 - BLOCK
      ?auto_133258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133253 ?auto_133254 ) ) ( not ( = ?auto_133253 ?auto_133255 ) ) ( not ( = ?auto_133253 ?auto_133256 ) ) ( not ( = ?auto_133253 ?auto_133257 ) ) ( not ( = ?auto_133254 ?auto_133255 ) ) ( not ( = ?auto_133254 ?auto_133256 ) ) ( not ( = ?auto_133254 ?auto_133257 ) ) ( not ( = ?auto_133255 ?auto_133256 ) ) ( not ( = ?auto_133255 ?auto_133257 ) ) ( not ( = ?auto_133256 ?auto_133257 ) ) ( ON ?auto_133257 ?auto_133259 ) ( not ( = ?auto_133253 ?auto_133259 ) ) ( not ( = ?auto_133254 ?auto_133259 ) ) ( not ( = ?auto_133255 ?auto_133259 ) ) ( not ( = ?auto_133256 ?auto_133259 ) ) ( not ( = ?auto_133257 ?auto_133259 ) ) ( ON ?auto_133256 ?auto_133257 ) ( ON-TABLE ?auto_133261 ) ( ON ?auto_133260 ?auto_133261 ) ( ON ?auto_133258 ?auto_133260 ) ( ON ?auto_133259 ?auto_133258 ) ( not ( = ?auto_133261 ?auto_133260 ) ) ( not ( = ?auto_133261 ?auto_133258 ) ) ( not ( = ?auto_133261 ?auto_133259 ) ) ( not ( = ?auto_133261 ?auto_133257 ) ) ( not ( = ?auto_133261 ?auto_133256 ) ) ( not ( = ?auto_133260 ?auto_133258 ) ) ( not ( = ?auto_133260 ?auto_133259 ) ) ( not ( = ?auto_133260 ?auto_133257 ) ) ( not ( = ?auto_133260 ?auto_133256 ) ) ( not ( = ?auto_133258 ?auto_133259 ) ) ( not ( = ?auto_133258 ?auto_133257 ) ) ( not ( = ?auto_133258 ?auto_133256 ) ) ( not ( = ?auto_133253 ?auto_133261 ) ) ( not ( = ?auto_133253 ?auto_133260 ) ) ( not ( = ?auto_133253 ?auto_133258 ) ) ( not ( = ?auto_133254 ?auto_133261 ) ) ( not ( = ?auto_133254 ?auto_133260 ) ) ( not ( = ?auto_133254 ?auto_133258 ) ) ( not ( = ?auto_133255 ?auto_133261 ) ) ( not ( = ?auto_133255 ?auto_133260 ) ) ( not ( = ?auto_133255 ?auto_133258 ) ) ( ON ?auto_133255 ?auto_133256 ) ( ON ?auto_133254 ?auto_133255 ) ( CLEAR ?auto_133254 ) ( HOLDING ?auto_133253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133253 )
      ( MAKE-5PILE ?auto_133253 ?auto_133254 ?auto_133255 ?auto_133256 ?auto_133257 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_133262 - BLOCK
      ?auto_133263 - BLOCK
      ?auto_133264 - BLOCK
      ?auto_133265 - BLOCK
      ?auto_133266 - BLOCK
    )
    :vars
    (
      ?auto_133269 - BLOCK
      ?auto_133268 - BLOCK
      ?auto_133270 - BLOCK
      ?auto_133267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133262 ?auto_133263 ) ) ( not ( = ?auto_133262 ?auto_133264 ) ) ( not ( = ?auto_133262 ?auto_133265 ) ) ( not ( = ?auto_133262 ?auto_133266 ) ) ( not ( = ?auto_133263 ?auto_133264 ) ) ( not ( = ?auto_133263 ?auto_133265 ) ) ( not ( = ?auto_133263 ?auto_133266 ) ) ( not ( = ?auto_133264 ?auto_133265 ) ) ( not ( = ?auto_133264 ?auto_133266 ) ) ( not ( = ?auto_133265 ?auto_133266 ) ) ( ON ?auto_133266 ?auto_133269 ) ( not ( = ?auto_133262 ?auto_133269 ) ) ( not ( = ?auto_133263 ?auto_133269 ) ) ( not ( = ?auto_133264 ?auto_133269 ) ) ( not ( = ?auto_133265 ?auto_133269 ) ) ( not ( = ?auto_133266 ?auto_133269 ) ) ( ON ?auto_133265 ?auto_133266 ) ( ON-TABLE ?auto_133268 ) ( ON ?auto_133270 ?auto_133268 ) ( ON ?auto_133267 ?auto_133270 ) ( ON ?auto_133269 ?auto_133267 ) ( not ( = ?auto_133268 ?auto_133270 ) ) ( not ( = ?auto_133268 ?auto_133267 ) ) ( not ( = ?auto_133268 ?auto_133269 ) ) ( not ( = ?auto_133268 ?auto_133266 ) ) ( not ( = ?auto_133268 ?auto_133265 ) ) ( not ( = ?auto_133270 ?auto_133267 ) ) ( not ( = ?auto_133270 ?auto_133269 ) ) ( not ( = ?auto_133270 ?auto_133266 ) ) ( not ( = ?auto_133270 ?auto_133265 ) ) ( not ( = ?auto_133267 ?auto_133269 ) ) ( not ( = ?auto_133267 ?auto_133266 ) ) ( not ( = ?auto_133267 ?auto_133265 ) ) ( not ( = ?auto_133262 ?auto_133268 ) ) ( not ( = ?auto_133262 ?auto_133270 ) ) ( not ( = ?auto_133262 ?auto_133267 ) ) ( not ( = ?auto_133263 ?auto_133268 ) ) ( not ( = ?auto_133263 ?auto_133270 ) ) ( not ( = ?auto_133263 ?auto_133267 ) ) ( not ( = ?auto_133264 ?auto_133268 ) ) ( not ( = ?auto_133264 ?auto_133270 ) ) ( not ( = ?auto_133264 ?auto_133267 ) ) ( ON ?auto_133264 ?auto_133265 ) ( ON ?auto_133263 ?auto_133264 ) ( ON ?auto_133262 ?auto_133263 ) ( CLEAR ?auto_133262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133268 ?auto_133270 ?auto_133267 ?auto_133269 ?auto_133266 ?auto_133265 ?auto_133264 ?auto_133263 )
      ( MAKE-5PILE ?auto_133262 ?auto_133263 ?auto_133264 ?auto_133265 ?auto_133266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133274 - BLOCK
      ?auto_133275 - BLOCK
      ?auto_133276 - BLOCK
    )
    :vars
    (
      ?auto_133277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133277 ?auto_133276 ) ( CLEAR ?auto_133277 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133274 ) ( ON ?auto_133275 ?auto_133274 ) ( ON ?auto_133276 ?auto_133275 ) ( not ( = ?auto_133274 ?auto_133275 ) ) ( not ( = ?auto_133274 ?auto_133276 ) ) ( not ( = ?auto_133274 ?auto_133277 ) ) ( not ( = ?auto_133275 ?auto_133276 ) ) ( not ( = ?auto_133275 ?auto_133277 ) ) ( not ( = ?auto_133276 ?auto_133277 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133277 ?auto_133276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133278 - BLOCK
      ?auto_133279 - BLOCK
      ?auto_133280 - BLOCK
    )
    :vars
    (
      ?auto_133281 - BLOCK
      ?auto_133282 - BLOCK
      ?auto_133283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133281 ?auto_133280 ) ( CLEAR ?auto_133281 ) ( ON-TABLE ?auto_133278 ) ( ON ?auto_133279 ?auto_133278 ) ( ON ?auto_133280 ?auto_133279 ) ( not ( = ?auto_133278 ?auto_133279 ) ) ( not ( = ?auto_133278 ?auto_133280 ) ) ( not ( = ?auto_133278 ?auto_133281 ) ) ( not ( = ?auto_133279 ?auto_133280 ) ) ( not ( = ?auto_133279 ?auto_133281 ) ) ( not ( = ?auto_133280 ?auto_133281 ) ) ( HOLDING ?auto_133282 ) ( CLEAR ?auto_133283 ) ( not ( = ?auto_133278 ?auto_133282 ) ) ( not ( = ?auto_133278 ?auto_133283 ) ) ( not ( = ?auto_133279 ?auto_133282 ) ) ( not ( = ?auto_133279 ?auto_133283 ) ) ( not ( = ?auto_133280 ?auto_133282 ) ) ( not ( = ?auto_133280 ?auto_133283 ) ) ( not ( = ?auto_133281 ?auto_133282 ) ) ( not ( = ?auto_133281 ?auto_133283 ) ) ( not ( = ?auto_133282 ?auto_133283 ) ) )
    :subtasks
    ( ( !STACK ?auto_133282 ?auto_133283 )
      ( MAKE-3PILE ?auto_133278 ?auto_133279 ?auto_133280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133284 - BLOCK
      ?auto_133285 - BLOCK
      ?auto_133286 - BLOCK
    )
    :vars
    (
      ?auto_133288 - BLOCK
      ?auto_133289 - BLOCK
      ?auto_133287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133288 ?auto_133286 ) ( ON-TABLE ?auto_133284 ) ( ON ?auto_133285 ?auto_133284 ) ( ON ?auto_133286 ?auto_133285 ) ( not ( = ?auto_133284 ?auto_133285 ) ) ( not ( = ?auto_133284 ?auto_133286 ) ) ( not ( = ?auto_133284 ?auto_133288 ) ) ( not ( = ?auto_133285 ?auto_133286 ) ) ( not ( = ?auto_133285 ?auto_133288 ) ) ( not ( = ?auto_133286 ?auto_133288 ) ) ( CLEAR ?auto_133289 ) ( not ( = ?auto_133284 ?auto_133287 ) ) ( not ( = ?auto_133284 ?auto_133289 ) ) ( not ( = ?auto_133285 ?auto_133287 ) ) ( not ( = ?auto_133285 ?auto_133289 ) ) ( not ( = ?auto_133286 ?auto_133287 ) ) ( not ( = ?auto_133286 ?auto_133289 ) ) ( not ( = ?auto_133288 ?auto_133287 ) ) ( not ( = ?auto_133288 ?auto_133289 ) ) ( not ( = ?auto_133287 ?auto_133289 ) ) ( ON ?auto_133287 ?auto_133288 ) ( CLEAR ?auto_133287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133284 ?auto_133285 ?auto_133286 ?auto_133288 )
      ( MAKE-3PILE ?auto_133284 ?auto_133285 ?auto_133286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133290 - BLOCK
      ?auto_133291 - BLOCK
      ?auto_133292 - BLOCK
    )
    :vars
    (
      ?auto_133295 - BLOCK
      ?auto_133294 - BLOCK
      ?auto_133293 - BLOCK
      ?auto_133297 - BLOCK
      ?auto_133296 - BLOCK
      ?auto_133298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133295 ?auto_133292 ) ( ON-TABLE ?auto_133290 ) ( ON ?auto_133291 ?auto_133290 ) ( ON ?auto_133292 ?auto_133291 ) ( not ( = ?auto_133290 ?auto_133291 ) ) ( not ( = ?auto_133290 ?auto_133292 ) ) ( not ( = ?auto_133290 ?auto_133295 ) ) ( not ( = ?auto_133291 ?auto_133292 ) ) ( not ( = ?auto_133291 ?auto_133295 ) ) ( not ( = ?auto_133292 ?auto_133295 ) ) ( not ( = ?auto_133290 ?auto_133294 ) ) ( not ( = ?auto_133290 ?auto_133293 ) ) ( not ( = ?auto_133291 ?auto_133294 ) ) ( not ( = ?auto_133291 ?auto_133293 ) ) ( not ( = ?auto_133292 ?auto_133294 ) ) ( not ( = ?auto_133292 ?auto_133293 ) ) ( not ( = ?auto_133295 ?auto_133294 ) ) ( not ( = ?auto_133295 ?auto_133293 ) ) ( not ( = ?auto_133294 ?auto_133293 ) ) ( ON ?auto_133294 ?auto_133295 ) ( CLEAR ?auto_133294 ) ( HOLDING ?auto_133293 ) ( CLEAR ?auto_133297 ) ( ON-TABLE ?auto_133296 ) ( ON ?auto_133298 ?auto_133296 ) ( ON ?auto_133297 ?auto_133298 ) ( not ( = ?auto_133296 ?auto_133298 ) ) ( not ( = ?auto_133296 ?auto_133297 ) ) ( not ( = ?auto_133296 ?auto_133293 ) ) ( not ( = ?auto_133298 ?auto_133297 ) ) ( not ( = ?auto_133298 ?auto_133293 ) ) ( not ( = ?auto_133297 ?auto_133293 ) ) ( not ( = ?auto_133290 ?auto_133297 ) ) ( not ( = ?auto_133290 ?auto_133296 ) ) ( not ( = ?auto_133290 ?auto_133298 ) ) ( not ( = ?auto_133291 ?auto_133297 ) ) ( not ( = ?auto_133291 ?auto_133296 ) ) ( not ( = ?auto_133291 ?auto_133298 ) ) ( not ( = ?auto_133292 ?auto_133297 ) ) ( not ( = ?auto_133292 ?auto_133296 ) ) ( not ( = ?auto_133292 ?auto_133298 ) ) ( not ( = ?auto_133295 ?auto_133297 ) ) ( not ( = ?auto_133295 ?auto_133296 ) ) ( not ( = ?auto_133295 ?auto_133298 ) ) ( not ( = ?auto_133294 ?auto_133297 ) ) ( not ( = ?auto_133294 ?auto_133296 ) ) ( not ( = ?auto_133294 ?auto_133298 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133296 ?auto_133298 ?auto_133297 ?auto_133293 )
      ( MAKE-3PILE ?auto_133290 ?auto_133291 ?auto_133292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133299 - BLOCK
      ?auto_133300 - BLOCK
      ?auto_133301 - BLOCK
    )
    :vars
    (
      ?auto_133305 - BLOCK
      ?auto_133303 - BLOCK
      ?auto_133304 - BLOCK
      ?auto_133306 - BLOCK
      ?auto_133302 - BLOCK
      ?auto_133307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133305 ?auto_133301 ) ( ON-TABLE ?auto_133299 ) ( ON ?auto_133300 ?auto_133299 ) ( ON ?auto_133301 ?auto_133300 ) ( not ( = ?auto_133299 ?auto_133300 ) ) ( not ( = ?auto_133299 ?auto_133301 ) ) ( not ( = ?auto_133299 ?auto_133305 ) ) ( not ( = ?auto_133300 ?auto_133301 ) ) ( not ( = ?auto_133300 ?auto_133305 ) ) ( not ( = ?auto_133301 ?auto_133305 ) ) ( not ( = ?auto_133299 ?auto_133303 ) ) ( not ( = ?auto_133299 ?auto_133304 ) ) ( not ( = ?auto_133300 ?auto_133303 ) ) ( not ( = ?auto_133300 ?auto_133304 ) ) ( not ( = ?auto_133301 ?auto_133303 ) ) ( not ( = ?auto_133301 ?auto_133304 ) ) ( not ( = ?auto_133305 ?auto_133303 ) ) ( not ( = ?auto_133305 ?auto_133304 ) ) ( not ( = ?auto_133303 ?auto_133304 ) ) ( ON ?auto_133303 ?auto_133305 ) ( CLEAR ?auto_133306 ) ( ON-TABLE ?auto_133302 ) ( ON ?auto_133307 ?auto_133302 ) ( ON ?auto_133306 ?auto_133307 ) ( not ( = ?auto_133302 ?auto_133307 ) ) ( not ( = ?auto_133302 ?auto_133306 ) ) ( not ( = ?auto_133302 ?auto_133304 ) ) ( not ( = ?auto_133307 ?auto_133306 ) ) ( not ( = ?auto_133307 ?auto_133304 ) ) ( not ( = ?auto_133306 ?auto_133304 ) ) ( not ( = ?auto_133299 ?auto_133306 ) ) ( not ( = ?auto_133299 ?auto_133302 ) ) ( not ( = ?auto_133299 ?auto_133307 ) ) ( not ( = ?auto_133300 ?auto_133306 ) ) ( not ( = ?auto_133300 ?auto_133302 ) ) ( not ( = ?auto_133300 ?auto_133307 ) ) ( not ( = ?auto_133301 ?auto_133306 ) ) ( not ( = ?auto_133301 ?auto_133302 ) ) ( not ( = ?auto_133301 ?auto_133307 ) ) ( not ( = ?auto_133305 ?auto_133306 ) ) ( not ( = ?auto_133305 ?auto_133302 ) ) ( not ( = ?auto_133305 ?auto_133307 ) ) ( not ( = ?auto_133303 ?auto_133306 ) ) ( not ( = ?auto_133303 ?auto_133302 ) ) ( not ( = ?auto_133303 ?auto_133307 ) ) ( ON ?auto_133304 ?auto_133303 ) ( CLEAR ?auto_133304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133299 ?auto_133300 ?auto_133301 ?auto_133305 ?auto_133303 )
      ( MAKE-3PILE ?auto_133299 ?auto_133300 ?auto_133301 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133308 - BLOCK
      ?auto_133309 - BLOCK
      ?auto_133310 - BLOCK
    )
    :vars
    (
      ?auto_133311 - BLOCK
      ?auto_133312 - BLOCK
      ?auto_133316 - BLOCK
      ?auto_133315 - BLOCK
      ?auto_133313 - BLOCK
      ?auto_133314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133311 ?auto_133310 ) ( ON-TABLE ?auto_133308 ) ( ON ?auto_133309 ?auto_133308 ) ( ON ?auto_133310 ?auto_133309 ) ( not ( = ?auto_133308 ?auto_133309 ) ) ( not ( = ?auto_133308 ?auto_133310 ) ) ( not ( = ?auto_133308 ?auto_133311 ) ) ( not ( = ?auto_133309 ?auto_133310 ) ) ( not ( = ?auto_133309 ?auto_133311 ) ) ( not ( = ?auto_133310 ?auto_133311 ) ) ( not ( = ?auto_133308 ?auto_133312 ) ) ( not ( = ?auto_133308 ?auto_133316 ) ) ( not ( = ?auto_133309 ?auto_133312 ) ) ( not ( = ?auto_133309 ?auto_133316 ) ) ( not ( = ?auto_133310 ?auto_133312 ) ) ( not ( = ?auto_133310 ?auto_133316 ) ) ( not ( = ?auto_133311 ?auto_133312 ) ) ( not ( = ?auto_133311 ?auto_133316 ) ) ( not ( = ?auto_133312 ?auto_133316 ) ) ( ON ?auto_133312 ?auto_133311 ) ( ON-TABLE ?auto_133315 ) ( ON ?auto_133313 ?auto_133315 ) ( not ( = ?auto_133315 ?auto_133313 ) ) ( not ( = ?auto_133315 ?auto_133314 ) ) ( not ( = ?auto_133315 ?auto_133316 ) ) ( not ( = ?auto_133313 ?auto_133314 ) ) ( not ( = ?auto_133313 ?auto_133316 ) ) ( not ( = ?auto_133314 ?auto_133316 ) ) ( not ( = ?auto_133308 ?auto_133314 ) ) ( not ( = ?auto_133308 ?auto_133315 ) ) ( not ( = ?auto_133308 ?auto_133313 ) ) ( not ( = ?auto_133309 ?auto_133314 ) ) ( not ( = ?auto_133309 ?auto_133315 ) ) ( not ( = ?auto_133309 ?auto_133313 ) ) ( not ( = ?auto_133310 ?auto_133314 ) ) ( not ( = ?auto_133310 ?auto_133315 ) ) ( not ( = ?auto_133310 ?auto_133313 ) ) ( not ( = ?auto_133311 ?auto_133314 ) ) ( not ( = ?auto_133311 ?auto_133315 ) ) ( not ( = ?auto_133311 ?auto_133313 ) ) ( not ( = ?auto_133312 ?auto_133314 ) ) ( not ( = ?auto_133312 ?auto_133315 ) ) ( not ( = ?auto_133312 ?auto_133313 ) ) ( ON ?auto_133316 ?auto_133312 ) ( CLEAR ?auto_133316 ) ( HOLDING ?auto_133314 ) ( CLEAR ?auto_133313 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133315 ?auto_133313 ?auto_133314 )
      ( MAKE-3PILE ?auto_133308 ?auto_133309 ?auto_133310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133317 - BLOCK
      ?auto_133318 - BLOCK
      ?auto_133319 - BLOCK
    )
    :vars
    (
      ?auto_133324 - BLOCK
      ?auto_133325 - BLOCK
      ?auto_133322 - BLOCK
      ?auto_133323 - BLOCK
      ?auto_133320 - BLOCK
      ?auto_133321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133324 ?auto_133319 ) ( ON-TABLE ?auto_133317 ) ( ON ?auto_133318 ?auto_133317 ) ( ON ?auto_133319 ?auto_133318 ) ( not ( = ?auto_133317 ?auto_133318 ) ) ( not ( = ?auto_133317 ?auto_133319 ) ) ( not ( = ?auto_133317 ?auto_133324 ) ) ( not ( = ?auto_133318 ?auto_133319 ) ) ( not ( = ?auto_133318 ?auto_133324 ) ) ( not ( = ?auto_133319 ?auto_133324 ) ) ( not ( = ?auto_133317 ?auto_133325 ) ) ( not ( = ?auto_133317 ?auto_133322 ) ) ( not ( = ?auto_133318 ?auto_133325 ) ) ( not ( = ?auto_133318 ?auto_133322 ) ) ( not ( = ?auto_133319 ?auto_133325 ) ) ( not ( = ?auto_133319 ?auto_133322 ) ) ( not ( = ?auto_133324 ?auto_133325 ) ) ( not ( = ?auto_133324 ?auto_133322 ) ) ( not ( = ?auto_133325 ?auto_133322 ) ) ( ON ?auto_133325 ?auto_133324 ) ( ON-TABLE ?auto_133323 ) ( ON ?auto_133320 ?auto_133323 ) ( not ( = ?auto_133323 ?auto_133320 ) ) ( not ( = ?auto_133323 ?auto_133321 ) ) ( not ( = ?auto_133323 ?auto_133322 ) ) ( not ( = ?auto_133320 ?auto_133321 ) ) ( not ( = ?auto_133320 ?auto_133322 ) ) ( not ( = ?auto_133321 ?auto_133322 ) ) ( not ( = ?auto_133317 ?auto_133321 ) ) ( not ( = ?auto_133317 ?auto_133323 ) ) ( not ( = ?auto_133317 ?auto_133320 ) ) ( not ( = ?auto_133318 ?auto_133321 ) ) ( not ( = ?auto_133318 ?auto_133323 ) ) ( not ( = ?auto_133318 ?auto_133320 ) ) ( not ( = ?auto_133319 ?auto_133321 ) ) ( not ( = ?auto_133319 ?auto_133323 ) ) ( not ( = ?auto_133319 ?auto_133320 ) ) ( not ( = ?auto_133324 ?auto_133321 ) ) ( not ( = ?auto_133324 ?auto_133323 ) ) ( not ( = ?auto_133324 ?auto_133320 ) ) ( not ( = ?auto_133325 ?auto_133321 ) ) ( not ( = ?auto_133325 ?auto_133323 ) ) ( not ( = ?auto_133325 ?auto_133320 ) ) ( ON ?auto_133322 ?auto_133325 ) ( CLEAR ?auto_133320 ) ( ON ?auto_133321 ?auto_133322 ) ( CLEAR ?auto_133321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133317 ?auto_133318 ?auto_133319 ?auto_133324 ?auto_133325 ?auto_133322 )
      ( MAKE-3PILE ?auto_133317 ?auto_133318 ?auto_133319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133326 - BLOCK
      ?auto_133327 - BLOCK
      ?auto_133328 - BLOCK
    )
    :vars
    (
      ?auto_133330 - BLOCK
      ?auto_133331 - BLOCK
      ?auto_133333 - BLOCK
      ?auto_133332 - BLOCK
      ?auto_133334 - BLOCK
      ?auto_133329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133330 ?auto_133328 ) ( ON-TABLE ?auto_133326 ) ( ON ?auto_133327 ?auto_133326 ) ( ON ?auto_133328 ?auto_133327 ) ( not ( = ?auto_133326 ?auto_133327 ) ) ( not ( = ?auto_133326 ?auto_133328 ) ) ( not ( = ?auto_133326 ?auto_133330 ) ) ( not ( = ?auto_133327 ?auto_133328 ) ) ( not ( = ?auto_133327 ?auto_133330 ) ) ( not ( = ?auto_133328 ?auto_133330 ) ) ( not ( = ?auto_133326 ?auto_133331 ) ) ( not ( = ?auto_133326 ?auto_133333 ) ) ( not ( = ?auto_133327 ?auto_133331 ) ) ( not ( = ?auto_133327 ?auto_133333 ) ) ( not ( = ?auto_133328 ?auto_133331 ) ) ( not ( = ?auto_133328 ?auto_133333 ) ) ( not ( = ?auto_133330 ?auto_133331 ) ) ( not ( = ?auto_133330 ?auto_133333 ) ) ( not ( = ?auto_133331 ?auto_133333 ) ) ( ON ?auto_133331 ?auto_133330 ) ( ON-TABLE ?auto_133332 ) ( not ( = ?auto_133332 ?auto_133334 ) ) ( not ( = ?auto_133332 ?auto_133329 ) ) ( not ( = ?auto_133332 ?auto_133333 ) ) ( not ( = ?auto_133334 ?auto_133329 ) ) ( not ( = ?auto_133334 ?auto_133333 ) ) ( not ( = ?auto_133329 ?auto_133333 ) ) ( not ( = ?auto_133326 ?auto_133329 ) ) ( not ( = ?auto_133326 ?auto_133332 ) ) ( not ( = ?auto_133326 ?auto_133334 ) ) ( not ( = ?auto_133327 ?auto_133329 ) ) ( not ( = ?auto_133327 ?auto_133332 ) ) ( not ( = ?auto_133327 ?auto_133334 ) ) ( not ( = ?auto_133328 ?auto_133329 ) ) ( not ( = ?auto_133328 ?auto_133332 ) ) ( not ( = ?auto_133328 ?auto_133334 ) ) ( not ( = ?auto_133330 ?auto_133329 ) ) ( not ( = ?auto_133330 ?auto_133332 ) ) ( not ( = ?auto_133330 ?auto_133334 ) ) ( not ( = ?auto_133331 ?auto_133329 ) ) ( not ( = ?auto_133331 ?auto_133332 ) ) ( not ( = ?auto_133331 ?auto_133334 ) ) ( ON ?auto_133333 ?auto_133331 ) ( ON ?auto_133329 ?auto_133333 ) ( CLEAR ?auto_133329 ) ( HOLDING ?auto_133334 ) ( CLEAR ?auto_133332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133332 ?auto_133334 )
      ( MAKE-3PILE ?auto_133326 ?auto_133327 ?auto_133328 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133335 - BLOCK
      ?auto_133336 - BLOCK
      ?auto_133337 - BLOCK
    )
    :vars
    (
      ?auto_133339 - BLOCK
      ?auto_133338 - BLOCK
      ?auto_133342 - BLOCK
      ?auto_133343 - BLOCK
      ?auto_133340 - BLOCK
      ?auto_133341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133339 ?auto_133337 ) ( ON-TABLE ?auto_133335 ) ( ON ?auto_133336 ?auto_133335 ) ( ON ?auto_133337 ?auto_133336 ) ( not ( = ?auto_133335 ?auto_133336 ) ) ( not ( = ?auto_133335 ?auto_133337 ) ) ( not ( = ?auto_133335 ?auto_133339 ) ) ( not ( = ?auto_133336 ?auto_133337 ) ) ( not ( = ?auto_133336 ?auto_133339 ) ) ( not ( = ?auto_133337 ?auto_133339 ) ) ( not ( = ?auto_133335 ?auto_133338 ) ) ( not ( = ?auto_133335 ?auto_133342 ) ) ( not ( = ?auto_133336 ?auto_133338 ) ) ( not ( = ?auto_133336 ?auto_133342 ) ) ( not ( = ?auto_133337 ?auto_133338 ) ) ( not ( = ?auto_133337 ?auto_133342 ) ) ( not ( = ?auto_133339 ?auto_133338 ) ) ( not ( = ?auto_133339 ?auto_133342 ) ) ( not ( = ?auto_133338 ?auto_133342 ) ) ( ON ?auto_133338 ?auto_133339 ) ( ON-TABLE ?auto_133343 ) ( not ( = ?auto_133343 ?auto_133340 ) ) ( not ( = ?auto_133343 ?auto_133341 ) ) ( not ( = ?auto_133343 ?auto_133342 ) ) ( not ( = ?auto_133340 ?auto_133341 ) ) ( not ( = ?auto_133340 ?auto_133342 ) ) ( not ( = ?auto_133341 ?auto_133342 ) ) ( not ( = ?auto_133335 ?auto_133341 ) ) ( not ( = ?auto_133335 ?auto_133343 ) ) ( not ( = ?auto_133335 ?auto_133340 ) ) ( not ( = ?auto_133336 ?auto_133341 ) ) ( not ( = ?auto_133336 ?auto_133343 ) ) ( not ( = ?auto_133336 ?auto_133340 ) ) ( not ( = ?auto_133337 ?auto_133341 ) ) ( not ( = ?auto_133337 ?auto_133343 ) ) ( not ( = ?auto_133337 ?auto_133340 ) ) ( not ( = ?auto_133339 ?auto_133341 ) ) ( not ( = ?auto_133339 ?auto_133343 ) ) ( not ( = ?auto_133339 ?auto_133340 ) ) ( not ( = ?auto_133338 ?auto_133341 ) ) ( not ( = ?auto_133338 ?auto_133343 ) ) ( not ( = ?auto_133338 ?auto_133340 ) ) ( ON ?auto_133342 ?auto_133338 ) ( ON ?auto_133341 ?auto_133342 ) ( CLEAR ?auto_133343 ) ( ON ?auto_133340 ?auto_133341 ) ( CLEAR ?auto_133340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133335 ?auto_133336 ?auto_133337 ?auto_133339 ?auto_133338 ?auto_133342 ?auto_133341 )
      ( MAKE-3PILE ?auto_133335 ?auto_133336 ?auto_133337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133344 - BLOCK
      ?auto_133345 - BLOCK
      ?auto_133346 - BLOCK
    )
    :vars
    (
      ?auto_133352 - BLOCK
      ?auto_133349 - BLOCK
      ?auto_133348 - BLOCK
      ?auto_133350 - BLOCK
      ?auto_133351 - BLOCK
      ?auto_133347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133352 ?auto_133346 ) ( ON-TABLE ?auto_133344 ) ( ON ?auto_133345 ?auto_133344 ) ( ON ?auto_133346 ?auto_133345 ) ( not ( = ?auto_133344 ?auto_133345 ) ) ( not ( = ?auto_133344 ?auto_133346 ) ) ( not ( = ?auto_133344 ?auto_133352 ) ) ( not ( = ?auto_133345 ?auto_133346 ) ) ( not ( = ?auto_133345 ?auto_133352 ) ) ( not ( = ?auto_133346 ?auto_133352 ) ) ( not ( = ?auto_133344 ?auto_133349 ) ) ( not ( = ?auto_133344 ?auto_133348 ) ) ( not ( = ?auto_133345 ?auto_133349 ) ) ( not ( = ?auto_133345 ?auto_133348 ) ) ( not ( = ?auto_133346 ?auto_133349 ) ) ( not ( = ?auto_133346 ?auto_133348 ) ) ( not ( = ?auto_133352 ?auto_133349 ) ) ( not ( = ?auto_133352 ?auto_133348 ) ) ( not ( = ?auto_133349 ?auto_133348 ) ) ( ON ?auto_133349 ?auto_133352 ) ( not ( = ?auto_133350 ?auto_133351 ) ) ( not ( = ?auto_133350 ?auto_133347 ) ) ( not ( = ?auto_133350 ?auto_133348 ) ) ( not ( = ?auto_133351 ?auto_133347 ) ) ( not ( = ?auto_133351 ?auto_133348 ) ) ( not ( = ?auto_133347 ?auto_133348 ) ) ( not ( = ?auto_133344 ?auto_133347 ) ) ( not ( = ?auto_133344 ?auto_133350 ) ) ( not ( = ?auto_133344 ?auto_133351 ) ) ( not ( = ?auto_133345 ?auto_133347 ) ) ( not ( = ?auto_133345 ?auto_133350 ) ) ( not ( = ?auto_133345 ?auto_133351 ) ) ( not ( = ?auto_133346 ?auto_133347 ) ) ( not ( = ?auto_133346 ?auto_133350 ) ) ( not ( = ?auto_133346 ?auto_133351 ) ) ( not ( = ?auto_133352 ?auto_133347 ) ) ( not ( = ?auto_133352 ?auto_133350 ) ) ( not ( = ?auto_133352 ?auto_133351 ) ) ( not ( = ?auto_133349 ?auto_133347 ) ) ( not ( = ?auto_133349 ?auto_133350 ) ) ( not ( = ?auto_133349 ?auto_133351 ) ) ( ON ?auto_133348 ?auto_133349 ) ( ON ?auto_133347 ?auto_133348 ) ( ON ?auto_133351 ?auto_133347 ) ( CLEAR ?auto_133351 ) ( HOLDING ?auto_133350 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133350 )
      ( MAKE-3PILE ?auto_133344 ?auto_133345 ?auto_133346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_133353 - BLOCK
      ?auto_133354 - BLOCK
      ?auto_133355 - BLOCK
    )
    :vars
    (
      ?auto_133359 - BLOCK
      ?auto_133360 - BLOCK
      ?auto_133358 - BLOCK
      ?auto_133356 - BLOCK
      ?auto_133357 - BLOCK
      ?auto_133361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133359 ?auto_133355 ) ( ON-TABLE ?auto_133353 ) ( ON ?auto_133354 ?auto_133353 ) ( ON ?auto_133355 ?auto_133354 ) ( not ( = ?auto_133353 ?auto_133354 ) ) ( not ( = ?auto_133353 ?auto_133355 ) ) ( not ( = ?auto_133353 ?auto_133359 ) ) ( not ( = ?auto_133354 ?auto_133355 ) ) ( not ( = ?auto_133354 ?auto_133359 ) ) ( not ( = ?auto_133355 ?auto_133359 ) ) ( not ( = ?auto_133353 ?auto_133360 ) ) ( not ( = ?auto_133353 ?auto_133358 ) ) ( not ( = ?auto_133354 ?auto_133360 ) ) ( not ( = ?auto_133354 ?auto_133358 ) ) ( not ( = ?auto_133355 ?auto_133360 ) ) ( not ( = ?auto_133355 ?auto_133358 ) ) ( not ( = ?auto_133359 ?auto_133360 ) ) ( not ( = ?auto_133359 ?auto_133358 ) ) ( not ( = ?auto_133360 ?auto_133358 ) ) ( ON ?auto_133360 ?auto_133359 ) ( not ( = ?auto_133356 ?auto_133357 ) ) ( not ( = ?auto_133356 ?auto_133361 ) ) ( not ( = ?auto_133356 ?auto_133358 ) ) ( not ( = ?auto_133357 ?auto_133361 ) ) ( not ( = ?auto_133357 ?auto_133358 ) ) ( not ( = ?auto_133361 ?auto_133358 ) ) ( not ( = ?auto_133353 ?auto_133361 ) ) ( not ( = ?auto_133353 ?auto_133356 ) ) ( not ( = ?auto_133353 ?auto_133357 ) ) ( not ( = ?auto_133354 ?auto_133361 ) ) ( not ( = ?auto_133354 ?auto_133356 ) ) ( not ( = ?auto_133354 ?auto_133357 ) ) ( not ( = ?auto_133355 ?auto_133361 ) ) ( not ( = ?auto_133355 ?auto_133356 ) ) ( not ( = ?auto_133355 ?auto_133357 ) ) ( not ( = ?auto_133359 ?auto_133361 ) ) ( not ( = ?auto_133359 ?auto_133356 ) ) ( not ( = ?auto_133359 ?auto_133357 ) ) ( not ( = ?auto_133360 ?auto_133361 ) ) ( not ( = ?auto_133360 ?auto_133356 ) ) ( not ( = ?auto_133360 ?auto_133357 ) ) ( ON ?auto_133358 ?auto_133360 ) ( ON ?auto_133361 ?auto_133358 ) ( ON ?auto_133357 ?auto_133361 ) ( ON ?auto_133356 ?auto_133357 ) ( CLEAR ?auto_133356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133353 ?auto_133354 ?auto_133355 ?auto_133359 ?auto_133360 ?auto_133358 ?auto_133361 ?auto_133357 )
      ( MAKE-3PILE ?auto_133353 ?auto_133354 ?auto_133355 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133368 - BLOCK
      ?auto_133369 - BLOCK
      ?auto_133370 - BLOCK
      ?auto_133371 - BLOCK
      ?auto_133372 - BLOCK
      ?auto_133373 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_133373 ) ( CLEAR ?auto_133372 ) ( ON-TABLE ?auto_133368 ) ( ON ?auto_133369 ?auto_133368 ) ( ON ?auto_133370 ?auto_133369 ) ( ON ?auto_133371 ?auto_133370 ) ( ON ?auto_133372 ?auto_133371 ) ( not ( = ?auto_133368 ?auto_133369 ) ) ( not ( = ?auto_133368 ?auto_133370 ) ) ( not ( = ?auto_133368 ?auto_133371 ) ) ( not ( = ?auto_133368 ?auto_133372 ) ) ( not ( = ?auto_133368 ?auto_133373 ) ) ( not ( = ?auto_133369 ?auto_133370 ) ) ( not ( = ?auto_133369 ?auto_133371 ) ) ( not ( = ?auto_133369 ?auto_133372 ) ) ( not ( = ?auto_133369 ?auto_133373 ) ) ( not ( = ?auto_133370 ?auto_133371 ) ) ( not ( = ?auto_133370 ?auto_133372 ) ) ( not ( = ?auto_133370 ?auto_133373 ) ) ( not ( = ?auto_133371 ?auto_133372 ) ) ( not ( = ?auto_133371 ?auto_133373 ) ) ( not ( = ?auto_133372 ?auto_133373 ) ) )
    :subtasks
    ( ( !STACK ?auto_133373 ?auto_133372 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133374 - BLOCK
      ?auto_133375 - BLOCK
      ?auto_133376 - BLOCK
      ?auto_133377 - BLOCK
      ?auto_133378 - BLOCK
      ?auto_133379 - BLOCK
    )
    :vars
    (
      ?auto_133380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133378 ) ( ON-TABLE ?auto_133374 ) ( ON ?auto_133375 ?auto_133374 ) ( ON ?auto_133376 ?auto_133375 ) ( ON ?auto_133377 ?auto_133376 ) ( ON ?auto_133378 ?auto_133377 ) ( not ( = ?auto_133374 ?auto_133375 ) ) ( not ( = ?auto_133374 ?auto_133376 ) ) ( not ( = ?auto_133374 ?auto_133377 ) ) ( not ( = ?auto_133374 ?auto_133378 ) ) ( not ( = ?auto_133374 ?auto_133379 ) ) ( not ( = ?auto_133375 ?auto_133376 ) ) ( not ( = ?auto_133375 ?auto_133377 ) ) ( not ( = ?auto_133375 ?auto_133378 ) ) ( not ( = ?auto_133375 ?auto_133379 ) ) ( not ( = ?auto_133376 ?auto_133377 ) ) ( not ( = ?auto_133376 ?auto_133378 ) ) ( not ( = ?auto_133376 ?auto_133379 ) ) ( not ( = ?auto_133377 ?auto_133378 ) ) ( not ( = ?auto_133377 ?auto_133379 ) ) ( not ( = ?auto_133378 ?auto_133379 ) ) ( ON ?auto_133379 ?auto_133380 ) ( CLEAR ?auto_133379 ) ( HAND-EMPTY ) ( not ( = ?auto_133374 ?auto_133380 ) ) ( not ( = ?auto_133375 ?auto_133380 ) ) ( not ( = ?auto_133376 ?auto_133380 ) ) ( not ( = ?auto_133377 ?auto_133380 ) ) ( not ( = ?auto_133378 ?auto_133380 ) ) ( not ( = ?auto_133379 ?auto_133380 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133379 ?auto_133380 )
      ( MAKE-6PILE ?auto_133374 ?auto_133375 ?auto_133376 ?auto_133377 ?auto_133378 ?auto_133379 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133381 - BLOCK
      ?auto_133382 - BLOCK
      ?auto_133383 - BLOCK
      ?auto_133384 - BLOCK
      ?auto_133385 - BLOCK
      ?auto_133386 - BLOCK
    )
    :vars
    (
      ?auto_133387 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133381 ) ( ON ?auto_133382 ?auto_133381 ) ( ON ?auto_133383 ?auto_133382 ) ( ON ?auto_133384 ?auto_133383 ) ( not ( = ?auto_133381 ?auto_133382 ) ) ( not ( = ?auto_133381 ?auto_133383 ) ) ( not ( = ?auto_133381 ?auto_133384 ) ) ( not ( = ?auto_133381 ?auto_133385 ) ) ( not ( = ?auto_133381 ?auto_133386 ) ) ( not ( = ?auto_133382 ?auto_133383 ) ) ( not ( = ?auto_133382 ?auto_133384 ) ) ( not ( = ?auto_133382 ?auto_133385 ) ) ( not ( = ?auto_133382 ?auto_133386 ) ) ( not ( = ?auto_133383 ?auto_133384 ) ) ( not ( = ?auto_133383 ?auto_133385 ) ) ( not ( = ?auto_133383 ?auto_133386 ) ) ( not ( = ?auto_133384 ?auto_133385 ) ) ( not ( = ?auto_133384 ?auto_133386 ) ) ( not ( = ?auto_133385 ?auto_133386 ) ) ( ON ?auto_133386 ?auto_133387 ) ( CLEAR ?auto_133386 ) ( not ( = ?auto_133381 ?auto_133387 ) ) ( not ( = ?auto_133382 ?auto_133387 ) ) ( not ( = ?auto_133383 ?auto_133387 ) ) ( not ( = ?auto_133384 ?auto_133387 ) ) ( not ( = ?auto_133385 ?auto_133387 ) ) ( not ( = ?auto_133386 ?auto_133387 ) ) ( HOLDING ?auto_133385 ) ( CLEAR ?auto_133384 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133381 ?auto_133382 ?auto_133383 ?auto_133384 ?auto_133385 )
      ( MAKE-6PILE ?auto_133381 ?auto_133382 ?auto_133383 ?auto_133384 ?auto_133385 ?auto_133386 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133388 - BLOCK
      ?auto_133389 - BLOCK
      ?auto_133390 - BLOCK
      ?auto_133391 - BLOCK
      ?auto_133392 - BLOCK
      ?auto_133393 - BLOCK
    )
    :vars
    (
      ?auto_133394 - BLOCK
      ?auto_133395 - BLOCK
      ?auto_133396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133388 ) ( ON ?auto_133389 ?auto_133388 ) ( ON ?auto_133390 ?auto_133389 ) ( ON ?auto_133391 ?auto_133390 ) ( not ( = ?auto_133388 ?auto_133389 ) ) ( not ( = ?auto_133388 ?auto_133390 ) ) ( not ( = ?auto_133388 ?auto_133391 ) ) ( not ( = ?auto_133388 ?auto_133392 ) ) ( not ( = ?auto_133388 ?auto_133393 ) ) ( not ( = ?auto_133389 ?auto_133390 ) ) ( not ( = ?auto_133389 ?auto_133391 ) ) ( not ( = ?auto_133389 ?auto_133392 ) ) ( not ( = ?auto_133389 ?auto_133393 ) ) ( not ( = ?auto_133390 ?auto_133391 ) ) ( not ( = ?auto_133390 ?auto_133392 ) ) ( not ( = ?auto_133390 ?auto_133393 ) ) ( not ( = ?auto_133391 ?auto_133392 ) ) ( not ( = ?auto_133391 ?auto_133393 ) ) ( not ( = ?auto_133392 ?auto_133393 ) ) ( ON ?auto_133393 ?auto_133394 ) ( not ( = ?auto_133388 ?auto_133394 ) ) ( not ( = ?auto_133389 ?auto_133394 ) ) ( not ( = ?auto_133390 ?auto_133394 ) ) ( not ( = ?auto_133391 ?auto_133394 ) ) ( not ( = ?auto_133392 ?auto_133394 ) ) ( not ( = ?auto_133393 ?auto_133394 ) ) ( CLEAR ?auto_133391 ) ( ON ?auto_133392 ?auto_133393 ) ( CLEAR ?auto_133392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133395 ) ( ON ?auto_133396 ?auto_133395 ) ( ON ?auto_133394 ?auto_133396 ) ( not ( = ?auto_133395 ?auto_133396 ) ) ( not ( = ?auto_133395 ?auto_133394 ) ) ( not ( = ?auto_133395 ?auto_133393 ) ) ( not ( = ?auto_133395 ?auto_133392 ) ) ( not ( = ?auto_133396 ?auto_133394 ) ) ( not ( = ?auto_133396 ?auto_133393 ) ) ( not ( = ?auto_133396 ?auto_133392 ) ) ( not ( = ?auto_133388 ?auto_133395 ) ) ( not ( = ?auto_133388 ?auto_133396 ) ) ( not ( = ?auto_133389 ?auto_133395 ) ) ( not ( = ?auto_133389 ?auto_133396 ) ) ( not ( = ?auto_133390 ?auto_133395 ) ) ( not ( = ?auto_133390 ?auto_133396 ) ) ( not ( = ?auto_133391 ?auto_133395 ) ) ( not ( = ?auto_133391 ?auto_133396 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133395 ?auto_133396 ?auto_133394 ?auto_133393 )
      ( MAKE-6PILE ?auto_133388 ?auto_133389 ?auto_133390 ?auto_133391 ?auto_133392 ?auto_133393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133397 - BLOCK
      ?auto_133398 - BLOCK
      ?auto_133399 - BLOCK
      ?auto_133400 - BLOCK
      ?auto_133401 - BLOCK
      ?auto_133402 - BLOCK
    )
    :vars
    (
      ?auto_133405 - BLOCK
      ?auto_133404 - BLOCK
      ?auto_133403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133397 ) ( ON ?auto_133398 ?auto_133397 ) ( ON ?auto_133399 ?auto_133398 ) ( not ( = ?auto_133397 ?auto_133398 ) ) ( not ( = ?auto_133397 ?auto_133399 ) ) ( not ( = ?auto_133397 ?auto_133400 ) ) ( not ( = ?auto_133397 ?auto_133401 ) ) ( not ( = ?auto_133397 ?auto_133402 ) ) ( not ( = ?auto_133398 ?auto_133399 ) ) ( not ( = ?auto_133398 ?auto_133400 ) ) ( not ( = ?auto_133398 ?auto_133401 ) ) ( not ( = ?auto_133398 ?auto_133402 ) ) ( not ( = ?auto_133399 ?auto_133400 ) ) ( not ( = ?auto_133399 ?auto_133401 ) ) ( not ( = ?auto_133399 ?auto_133402 ) ) ( not ( = ?auto_133400 ?auto_133401 ) ) ( not ( = ?auto_133400 ?auto_133402 ) ) ( not ( = ?auto_133401 ?auto_133402 ) ) ( ON ?auto_133402 ?auto_133405 ) ( not ( = ?auto_133397 ?auto_133405 ) ) ( not ( = ?auto_133398 ?auto_133405 ) ) ( not ( = ?auto_133399 ?auto_133405 ) ) ( not ( = ?auto_133400 ?auto_133405 ) ) ( not ( = ?auto_133401 ?auto_133405 ) ) ( not ( = ?auto_133402 ?auto_133405 ) ) ( ON ?auto_133401 ?auto_133402 ) ( CLEAR ?auto_133401 ) ( ON-TABLE ?auto_133404 ) ( ON ?auto_133403 ?auto_133404 ) ( ON ?auto_133405 ?auto_133403 ) ( not ( = ?auto_133404 ?auto_133403 ) ) ( not ( = ?auto_133404 ?auto_133405 ) ) ( not ( = ?auto_133404 ?auto_133402 ) ) ( not ( = ?auto_133404 ?auto_133401 ) ) ( not ( = ?auto_133403 ?auto_133405 ) ) ( not ( = ?auto_133403 ?auto_133402 ) ) ( not ( = ?auto_133403 ?auto_133401 ) ) ( not ( = ?auto_133397 ?auto_133404 ) ) ( not ( = ?auto_133397 ?auto_133403 ) ) ( not ( = ?auto_133398 ?auto_133404 ) ) ( not ( = ?auto_133398 ?auto_133403 ) ) ( not ( = ?auto_133399 ?auto_133404 ) ) ( not ( = ?auto_133399 ?auto_133403 ) ) ( not ( = ?auto_133400 ?auto_133404 ) ) ( not ( = ?auto_133400 ?auto_133403 ) ) ( HOLDING ?auto_133400 ) ( CLEAR ?auto_133399 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133397 ?auto_133398 ?auto_133399 ?auto_133400 )
      ( MAKE-6PILE ?auto_133397 ?auto_133398 ?auto_133399 ?auto_133400 ?auto_133401 ?auto_133402 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133406 - BLOCK
      ?auto_133407 - BLOCK
      ?auto_133408 - BLOCK
      ?auto_133409 - BLOCK
      ?auto_133410 - BLOCK
      ?auto_133411 - BLOCK
    )
    :vars
    (
      ?auto_133413 - BLOCK
      ?auto_133412 - BLOCK
      ?auto_133414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133406 ) ( ON ?auto_133407 ?auto_133406 ) ( ON ?auto_133408 ?auto_133407 ) ( not ( = ?auto_133406 ?auto_133407 ) ) ( not ( = ?auto_133406 ?auto_133408 ) ) ( not ( = ?auto_133406 ?auto_133409 ) ) ( not ( = ?auto_133406 ?auto_133410 ) ) ( not ( = ?auto_133406 ?auto_133411 ) ) ( not ( = ?auto_133407 ?auto_133408 ) ) ( not ( = ?auto_133407 ?auto_133409 ) ) ( not ( = ?auto_133407 ?auto_133410 ) ) ( not ( = ?auto_133407 ?auto_133411 ) ) ( not ( = ?auto_133408 ?auto_133409 ) ) ( not ( = ?auto_133408 ?auto_133410 ) ) ( not ( = ?auto_133408 ?auto_133411 ) ) ( not ( = ?auto_133409 ?auto_133410 ) ) ( not ( = ?auto_133409 ?auto_133411 ) ) ( not ( = ?auto_133410 ?auto_133411 ) ) ( ON ?auto_133411 ?auto_133413 ) ( not ( = ?auto_133406 ?auto_133413 ) ) ( not ( = ?auto_133407 ?auto_133413 ) ) ( not ( = ?auto_133408 ?auto_133413 ) ) ( not ( = ?auto_133409 ?auto_133413 ) ) ( not ( = ?auto_133410 ?auto_133413 ) ) ( not ( = ?auto_133411 ?auto_133413 ) ) ( ON ?auto_133410 ?auto_133411 ) ( ON-TABLE ?auto_133412 ) ( ON ?auto_133414 ?auto_133412 ) ( ON ?auto_133413 ?auto_133414 ) ( not ( = ?auto_133412 ?auto_133414 ) ) ( not ( = ?auto_133412 ?auto_133413 ) ) ( not ( = ?auto_133412 ?auto_133411 ) ) ( not ( = ?auto_133412 ?auto_133410 ) ) ( not ( = ?auto_133414 ?auto_133413 ) ) ( not ( = ?auto_133414 ?auto_133411 ) ) ( not ( = ?auto_133414 ?auto_133410 ) ) ( not ( = ?auto_133406 ?auto_133412 ) ) ( not ( = ?auto_133406 ?auto_133414 ) ) ( not ( = ?auto_133407 ?auto_133412 ) ) ( not ( = ?auto_133407 ?auto_133414 ) ) ( not ( = ?auto_133408 ?auto_133412 ) ) ( not ( = ?auto_133408 ?auto_133414 ) ) ( not ( = ?auto_133409 ?auto_133412 ) ) ( not ( = ?auto_133409 ?auto_133414 ) ) ( CLEAR ?auto_133408 ) ( ON ?auto_133409 ?auto_133410 ) ( CLEAR ?auto_133409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133412 ?auto_133414 ?auto_133413 ?auto_133411 ?auto_133410 )
      ( MAKE-6PILE ?auto_133406 ?auto_133407 ?auto_133408 ?auto_133409 ?auto_133410 ?auto_133411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133415 - BLOCK
      ?auto_133416 - BLOCK
      ?auto_133417 - BLOCK
      ?auto_133418 - BLOCK
      ?auto_133419 - BLOCK
      ?auto_133420 - BLOCK
    )
    :vars
    (
      ?auto_133423 - BLOCK
      ?auto_133421 - BLOCK
      ?auto_133422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133415 ) ( ON ?auto_133416 ?auto_133415 ) ( not ( = ?auto_133415 ?auto_133416 ) ) ( not ( = ?auto_133415 ?auto_133417 ) ) ( not ( = ?auto_133415 ?auto_133418 ) ) ( not ( = ?auto_133415 ?auto_133419 ) ) ( not ( = ?auto_133415 ?auto_133420 ) ) ( not ( = ?auto_133416 ?auto_133417 ) ) ( not ( = ?auto_133416 ?auto_133418 ) ) ( not ( = ?auto_133416 ?auto_133419 ) ) ( not ( = ?auto_133416 ?auto_133420 ) ) ( not ( = ?auto_133417 ?auto_133418 ) ) ( not ( = ?auto_133417 ?auto_133419 ) ) ( not ( = ?auto_133417 ?auto_133420 ) ) ( not ( = ?auto_133418 ?auto_133419 ) ) ( not ( = ?auto_133418 ?auto_133420 ) ) ( not ( = ?auto_133419 ?auto_133420 ) ) ( ON ?auto_133420 ?auto_133423 ) ( not ( = ?auto_133415 ?auto_133423 ) ) ( not ( = ?auto_133416 ?auto_133423 ) ) ( not ( = ?auto_133417 ?auto_133423 ) ) ( not ( = ?auto_133418 ?auto_133423 ) ) ( not ( = ?auto_133419 ?auto_133423 ) ) ( not ( = ?auto_133420 ?auto_133423 ) ) ( ON ?auto_133419 ?auto_133420 ) ( ON-TABLE ?auto_133421 ) ( ON ?auto_133422 ?auto_133421 ) ( ON ?auto_133423 ?auto_133422 ) ( not ( = ?auto_133421 ?auto_133422 ) ) ( not ( = ?auto_133421 ?auto_133423 ) ) ( not ( = ?auto_133421 ?auto_133420 ) ) ( not ( = ?auto_133421 ?auto_133419 ) ) ( not ( = ?auto_133422 ?auto_133423 ) ) ( not ( = ?auto_133422 ?auto_133420 ) ) ( not ( = ?auto_133422 ?auto_133419 ) ) ( not ( = ?auto_133415 ?auto_133421 ) ) ( not ( = ?auto_133415 ?auto_133422 ) ) ( not ( = ?auto_133416 ?auto_133421 ) ) ( not ( = ?auto_133416 ?auto_133422 ) ) ( not ( = ?auto_133417 ?auto_133421 ) ) ( not ( = ?auto_133417 ?auto_133422 ) ) ( not ( = ?auto_133418 ?auto_133421 ) ) ( not ( = ?auto_133418 ?auto_133422 ) ) ( ON ?auto_133418 ?auto_133419 ) ( CLEAR ?auto_133418 ) ( HOLDING ?auto_133417 ) ( CLEAR ?auto_133416 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133415 ?auto_133416 ?auto_133417 )
      ( MAKE-6PILE ?auto_133415 ?auto_133416 ?auto_133417 ?auto_133418 ?auto_133419 ?auto_133420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133424 - BLOCK
      ?auto_133425 - BLOCK
      ?auto_133426 - BLOCK
      ?auto_133427 - BLOCK
      ?auto_133428 - BLOCK
      ?auto_133429 - BLOCK
    )
    :vars
    (
      ?auto_133430 - BLOCK
      ?auto_133432 - BLOCK
      ?auto_133431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133424 ) ( ON ?auto_133425 ?auto_133424 ) ( not ( = ?auto_133424 ?auto_133425 ) ) ( not ( = ?auto_133424 ?auto_133426 ) ) ( not ( = ?auto_133424 ?auto_133427 ) ) ( not ( = ?auto_133424 ?auto_133428 ) ) ( not ( = ?auto_133424 ?auto_133429 ) ) ( not ( = ?auto_133425 ?auto_133426 ) ) ( not ( = ?auto_133425 ?auto_133427 ) ) ( not ( = ?auto_133425 ?auto_133428 ) ) ( not ( = ?auto_133425 ?auto_133429 ) ) ( not ( = ?auto_133426 ?auto_133427 ) ) ( not ( = ?auto_133426 ?auto_133428 ) ) ( not ( = ?auto_133426 ?auto_133429 ) ) ( not ( = ?auto_133427 ?auto_133428 ) ) ( not ( = ?auto_133427 ?auto_133429 ) ) ( not ( = ?auto_133428 ?auto_133429 ) ) ( ON ?auto_133429 ?auto_133430 ) ( not ( = ?auto_133424 ?auto_133430 ) ) ( not ( = ?auto_133425 ?auto_133430 ) ) ( not ( = ?auto_133426 ?auto_133430 ) ) ( not ( = ?auto_133427 ?auto_133430 ) ) ( not ( = ?auto_133428 ?auto_133430 ) ) ( not ( = ?auto_133429 ?auto_133430 ) ) ( ON ?auto_133428 ?auto_133429 ) ( ON-TABLE ?auto_133432 ) ( ON ?auto_133431 ?auto_133432 ) ( ON ?auto_133430 ?auto_133431 ) ( not ( = ?auto_133432 ?auto_133431 ) ) ( not ( = ?auto_133432 ?auto_133430 ) ) ( not ( = ?auto_133432 ?auto_133429 ) ) ( not ( = ?auto_133432 ?auto_133428 ) ) ( not ( = ?auto_133431 ?auto_133430 ) ) ( not ( = ?auto_133431 ?auto_133429 ) ) ( not ( = ?auto_133431 ?auto_133428 ) ) ( not ( = ?auto_133424 ?auto_133432 ) ) ( not ( = ?auto_133424 ?auto_133431 ) ) ( not ( = ?auto_133425 ?auto_133432 ) ) ( not ( = ?auto_133425 ?auto_133431 ) ) ( not ( = ?auto_133426 ?auto_133432 ) ) ( not ( = ?auto_133426 ?auto_133431 ) ) ( not ( = ?auto_133427 ?auto_133432 ) ) ( not ( = ?auto_133427 ?auto_133431 ) ) ( ON ?auto_133427 ?auto_133428 ) ( CLEAR ?auto_133425 ) ( ON ?auto_133426 ?auto_133427 ) ( CLEAR ?auto_133426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133432 ?auto_133431 ?auto_133430 ?auto_133429 ?auto_133428 ?auto_133427 )
      ( MAKE-6PILE ?auto_133424 ?auto_133425 ?auto_133426 ?auto_133427 ?auto_133428 ?auto_133429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133433 - BLOCK
      ?auto_133434 - BLOCK
      ?auto_133435 - BLOCK
      ?auto_133436 - BLOCK
      ?auto_133437 - BLOCK
      ?auto_133438 - BLOCK
    )
    :vars
    (
      ?auto_133441 - BLOCK
      ?auto_133440 - BLOCK
      ?auto_133439 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133433 ) ( not ( = ?auto_133433 ?auto_133434 ) ) ( not ( = ?auto_133433 ?auto_133435 ) ) ( not ( = ?auto_133433 ?auto_133436 ) ) ( not ( = ?auto_133433 ?auto_133437 ) ) ( not ( = ?auto_133433 ?auto_133438 ) ) ( not ( = ?auto_133434 ?auto_133435 ) ) ( not ( = ?auto_133434 ?auto_133436 ) ) ( not ( = ?auto_133434 ?auto_133437 ) ) ( not ( = ?auto_133434 ?auto_133438 ) ) ( not ( = ?auto_133435 ?auto_133436 ) ) ( not ( = ?auto_133435 ?auto_133437 ) ) ( not ( = ?auto_133435 ?auto_133438 ) ) ( not ( = ?auto_133436 ?auto_133437 ) ) ( not ( = ?auto_133436 ?auto_133438 ) ) ( not ( = ?auto_133437 ?auto_133438 ) ) ( ON ?auto_133438 ?auto_133441 ) ( not ( = ?auto_133433 ?auto_133441 ) ) ( not ( = ?auto_133434 ?auto_133441 ) ) ( not ( = ?auto_133435 ?auto_133441 ) ) ( not ( = ?auto_133436 ?auto_133441 ) ) ( not ( = ?auto_133437 ?auto_133441 ) ) ( not ( = ?auto_133438 ?auto_133441 ) ) ( ON ?auto_133437 ?auto_133438 ) ( ON-TABLE ?auto_133440 ) ( ON ?auto_133439 ?auto_133440 ) ( ON ?auto_133441 ?auto_133439 ) ( not ( = ?auto_133440 ?auto_133439 ) ) ( not ( = ?auto_133440 ?auto_133441 ) ) ( not ( = ?auto_133440 ?auto_133438 ) ) ( not ( = ?auto_133440 ?auto_133437 ) ) ( not ( = ?auto_133439 ?auto_133441 ) ) ( not ( = ?auto_133439 ?auto_133438 ) ) ( not ( = ?auto_133439 ?auto_133437 ) ) ( not ( = ?auto_133433 ?auto_133440 ) ) ( not ( = ?auto_133433 ?auto_133439 ) ) ( not ( = ?auto_133434 ?auto_133440 ) ) ( not ( = ?auto_133434 ?auto_133439 ) ) ( not ( = ?auto_133435 ?auto_133440 ) ) ( not ( = ?auto_133435 ?auto_133439 ) ) ( not ( = ?auto_133436 ?auto_133440 ) ) ( not ( = ?auto_133436 ?auto_133439 ) ) ( ON ?auto_133436 ?auto_133437 ) ( ON ?auto_133435 ?auto_133436 ) ( CLEAR ?auto_133435 ) ( HOLDING ?auto_133434 ) ( CLEAR ?auto_133433 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133433 ?auto_133434 )
      ( MAKE-6PILE ?auto_133433 ?auto_133434 ?auto_133435 ?auto_133436 ?auto_133437 ?auto_133438 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133442 - BLOCK
      ?auto_133443 - BLOCK
      ?auto_133444 - BLOCK
      ?auto_133445 - BLOCK
      ?auto_133446 - BLOCK
      ?auto_133447 - BLOCK
    )
    :vars
    (
      ?auto_133450 - BLOCK
      ?auto_133448 - BLOCK
      ?auto_133449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133442 ) ( not ( = ?auto_133442 ?auto_133443 ) ) ( not ( = ?auto_133442 ?auto_133444 ) ) ( not ( = ?auto_133442 ?auto_133445 ) ) ( not ( = ?auto_133442 ?auto_133446 ) ) ( not ( = ?auto_133442 ?auto_133447 ) ) ( not ( = ?auto_133443 ?auto_133444 ) ) ( not ( = ?auto_133443 ?auto_133445 ) ) ( not ( = ?auto_133443 ?auto_133446 ) ) ( not ( = ?auto_133443 ?auto_133447 ) ) ( not ( = ?auto_133444 ?auto_133445 ) ) ( not ( = ?auto_133444 ?auto_133446 ) ) ( not ( = ?auto_133444 ?auto_133447 ) ) ( not ( = ?auto_133445 ?auto_133446 ) ) ( not ( = ?auto_133445 ?auto_133447 ) ) ( not ( = ?auto_133446 ?auto_133447 ) ) ( ON ?auto_133447 ?auto_133450 ) ( not ( = ?auto_133442 ?auto_133450 ) ) ( not ( = ?auto_133443 ?auto_133450 ) ) ( not ( = ?auto_133444 ?auto_133450 ) ) ( not ( = ?auto_133445 ?auto_133450 ) ) ( not ( = ?auto_133446 ?auto_133450 ) ) ( not ( = ?auto_133447 ?auto_133450 ) ) ( ON ?auto_133446 ?auto_133447 ) ( ON-TABLE ?auto_133448 ) ( ON ?auto_133449 ?auto_133448 ) ( ON ?auto_133450 ?auto_133449 ) ( not ( = ?auto_133448 ?auto_133449 ) ) ( not ( = ?auto_133448 ?auto_133450 ) ) ( not ( = ?auto_133448 ?auto_133447 ) ) ( not ( = ?auto_133448 ?auto_133446 ) ) ( not ( = ?auto_133449 ?auto_133450 ) ) ( not ( = ?auto_133449 ?auto_133447 ) ) ( not ( = ?auto_133449 ?auto_133446 ) ) ( not ( = ?auto_133442 ?auto_133448 ) ) ( not ( = ?auto_133442 ?auto_133449 ) ) ( not ( = ?auto_133443 ?auto_133448 ) ) ( not ( = ?auto_133443 ?auto_133449 ) ) ( not ( = ?auto_133444 ?auto_133448 ) ) ( not ( = ?auto_133444 ?auto_133449 ) ) ( not ( = ?auto_133445 ?auto_133448 ) ) ( not ( = ?auto_133445 ?auto_133449 ) ) ( ON ?auto_133445 ?auto_133446 ) ( ON ?auto_133444 ?auto_133445 ) ( CLEAR ?auto_133442 ) ( ON ?auto_133443 ?auto_133444 ) ( CLEAR ?auto_133443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133448 ?auto_133449 ?auto_133450 ?auto_133447 ?auto_133446 ?auto_133445 ?auto_133444 )
      ( MAKE-6PILE ?auto_133442 ?auto_133443 ?auto_133444 ?auto_133445 ?auto_133446 ?auto_133447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133451 - BLOCK
      ?auto_133452 - BLOCK
      ?auto_133453 - BLOCK
      ?auto_133454 - BLOCK
      ?auto_133455 - BLOCK
      ?auto_133456 - BLOCK
    )
    :vars
    (
      ?auto_133457 - BLOCK
      ?auto_133458 - BLOCK
      ?auto_133459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133451 ?auto_133452 ) ) ( not ( = ?auto_133451 ?auto_133453 ) ) ( not ( = ?auto_133451 ?auto_133454 ) ) ( not ( = ?auto_133451 ?auto_133455 ) ) ( not ( = ?auto_133451 ?auto_133456 ) ) ( not ( = ?auto_133452 ?auto_133453 ) ) ( not ( = ?auto_133452 ?auto_133454 ) ) ( not ( = ?auto_133452 ?auto_133455 ) ) ( not ( = ?auto_133452 ?auto_133456 ) ) ( not ( = ?auto_133453 ?auto_133454 ) ) ( not ( = ?auto_133453 ?auto_133455 ) ) ( not ( = ?auto_133453 ?auto_133456 ) ) ( not ( = ?auto_133454 ?auto_133455 ) ) ( not ( = ?auto_133454 ?auto_133456 ) ) ( not ( = ?auto_133455 ?auto_133456 ) ) ( ON ?auto_133456 ?auto_133457 ) ( not ( = ?auto_133451 ?auto_133457 ) ) ( not ( = ?auto_133452 ?auto_133457 ) ) ( not ( = ?auto_133453 ?auto_133457 ) ) ( not ( = ?auto_133454 ?auto_133457 ) ) ( not ( = ?auto_133455 ?auto_133457 ) ) ( not ( = ?auto_133456 ?auto_133457 ) ) ( ON ?auto_133455 ?auto_133456 ) ( ON-TABLE ?auto_133458 ) ( ON ?auto_133459 ?auto_133458 ) ( ON ?auto_133457 ?auto_133459 ) ( not ( = ?auto_133458 ?auto_133459 ) ) ( not ( = ?auto_133458 ?auto_133457 ) ) ( not ( = ?auto_133458 ?auto_133456 ) ) ( not ( = ?auto_133458 ?auto_133455 ) ) ( not ( = ?auto_133459 ?auto_133457 ) ) ( not ( = ?auto_133459 ?auto_133456 ) ) ( not ( = ?auto_133459 ?auto_133455 ) ) ( not ( = ?auto_133451 ?auto_133458 ) ) ( not ( = ?auto_133451 ?auto_133459 ) ) ( not ( = ?auto_133452 ?auto_133458 ) ) ( not ( = ?auto_133452 ?auto_133459 ) ) ( not ( = ?auto_133453 ?auto_133458 ) ) ( not ( = ?auto_133453 ?auto_133459 ) ) ( not ( = ?auto_133454 ?auto_133458 ) ) ( not ( = ?auto_133454 ?auto_133459 ) ) ( ON ?auto_133454 ?auto_133455 ) ( ON ?auto_133453 ?auto_133454 ) ( ON ?auto_133452 ?auto_133453 ) ( CLEAR ?auto_133452 ) ( HOLDING ?auto_133451 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133451 )
      ( MAKE-6PILE ?auto_133451 ?auto_133452 ?auto_133453 ?auto_133454 ?auto_133455 ?auto_133456 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_133460 - BLOCK
      ?auto_133461 - BLOCK
      ?auto_133462 - BLOCK
      ?auto_133463 - BLOCK
      ?auto_133464 - BLOCK
      ?auto_133465 - BLOCK
    )
    :vars
    (
      ?auto_133466 - BLOCK
      ?auto_133467 - BLOCK
      ?auto_133468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133460 ?auto_133461 ) ) ( not ( = ?auto_133460 ?auto_133462 ) ) ( not ( = ?auto_133460 ?auto_133463 ) ) ( not ( = ?auto_133460 ?auto_133464 ) ) ( not ( = ?auto_133460 ?auto_133465 ) ) ( not ( = ?auto_133461 ?auto_133462 ) ) ( not ( = ?auto_133461 ?auto_133463 ) ) ( not ( = ?auto_133461 ?auto_133464 ) ) ( not ( = ?auto_133461 ?auto_133465 ) ) ( not ( = ?auto_133462 ?auto_133463 ) ) ( not ( = ?auto_133462 ?auto_133464 ) ) ( not ( = ?auto_133462 ?auto_133465 ) ) ( not ( = ?auto_133463 ?auto_133464 ) ) ( not ( = ?auto_133463 ?auto_133465 ) ) ( not ( = ?auto_133464 ?auto_133465 ) ) ( ON ?auto_133465 ?auto_133466 ) ( not ( = ?auto_133460 ?auto_133466 ) ) ( not ( = ?auto_133461 ?auto_133466 ) ) ( not ( = ?auto_133462 ?auto_133466 ) ) ( not ( = ?auto_133463 ?auto_133466 ) ) ( not ( = ?auto_133464 ?auto_133466 ) ) ( not ( = ?auto_133465 ?auto_133466 ) ) ( ON ?auto_133464 ?auto_133465 ) ( ON-TABLE ?auto_133467 ) ( ON ?auto_133468 ?auto_133467 ) ( ON ?auto_133466 ?auto_133468 ) ( not ( = ?auto_133467 ?auto_133468 ) ) ( not ( = ?auto_133467 ?auto_133466 ) ) ( not ( = ?auto_133467 ?auto_133465 ) ) ( not ( = ?auto_133467 ?auto_133464 ) ) ( not ( = ?auto_133468 ?auto_133466 ) ) ( not ( = ?auto_133468 ?auto_133465 ) ) ( not ( = ?auto_133468 ?auto_133464 ) ) ( not ( = ?auto_133460 ?auto_133467 ) ) ( not ( = ?auto_133460 ?auto_133468 ) ) ( not ( = ?auto_133461 ?auto_133467 ) ) ( not ( = ?auto_133461 ?auto_133468 ) ) ( not ( = ?auto_133462 ?auto_133467 ) ) ( not ( = ?auto_133462 ?auto_133468 ) ) ( not ( = ?auto_133463 ?auto_133467 ) ) ( not ( = ?auto_133463 ?auto_133468 ) ) ( ON ?auto_133463 ?auto_133464 ) ( ON ?auto_133462 ?auto_133463 ) ( ON ?auto_133461 ?auto_133462 ) ( ON ?auto_133460 ?auto_133461 ) ( CLEAR ?auto_133460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133467 ?auto_133468 ?auto_133466 ?auto_133465 ?auto_133464 ?auto_133463 ?auto_133462 ?auto_133461 )
      ( MAKE-6PILE ?auto_133460 ?auto_133461 ?auto_133462 ?auto_133463 ?auto_133464 ?auto_133465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133471 - BLOCK
      ?auto_133472 - BLOCK
    )
    :vars
    (
      ?auto_133473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133473 ?auto_133472 ) ( CLEAR ?auto_133473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133471 ) ( ON ?auto_133472 ?auto_133471 ) ( not ( = ?auto_133471 ?auto_133472 ) ) ( not ( = ?auto_133471 ?auto_133473 ) ) ( not ( = ?auto_133472 ?auto_133473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133473 ?auto_133472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133474 - BLOCK
      ?auto_133475 - BLOCK
    )
    :vars
    (
      ?auto_133476 - BLOCK
      ?auto_133477 - BLOCK
      ?auto_133478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133476 ?auto_133475 ) ( CLEAR ?auto_133476 ) ( ON-TABLE ?auto_133474 ) ( ON ?auto_133475 ?auto_133474 ) ( not ( = ?auto_133474 ?auto_133475 ) ) ( not ( = ?auto_133474 ?auto_133476 ) ) ( not ( = ?auto_133475 ?auto_133476 ) ) ( HOLDING ?auto_133477 ) ( CLEAR ?auto_133478 ) ( not ( = ?auto_133474 ?auto_133477 ) ) ( not ( = ?auto_133474 ?auto_133478 ) ) ( not ( = ?auto_133475 ?auto_133477 ) ) ( not ( = ?auto_133475 ?auto_133478 ) ) ( not ( = ?auto_133476 ?auto_133477 ) ) ( not ( = ?auto_133476 ?auto_133478 ) ) ( not ( = ?auto_133477 ?auto_133478 ) ) )
    :subtasks
    ( ( !STACK ?auto_133477 ?auto_133478 )
      ( MAKE-2PILE ?auto_133474 ?auto_133475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133479 - BLOCK
      ?auto_133480 - BLOCK
    )
    :vars
    (
      ?auto_133481 - BLOCK
      ?auto_133482 - BLOCK
      ?auto_133483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133481 ?auto_133480 ) ( ON-TABLE ?auto_133479 ) ( ON ?auto_133480 ?auto_133479 ) ( not ( = ?auto_133479 ?auto_133480 ) ) ( not ( = ?auto_133479 ?auto_133481 ) ) ( not ( = ?auto_133480 ?auto_133481 ) ) ( CLEAR ?auto_133482 ) ( not ( = ?auto_133479 ?auto_133483 ) ) ( not ( = ?auto_133479 ?auto_133482 ) ) ( not ( = ?auto_133480 ?auto_133483 ) ) ( not ( = ?auto_133480 ?auto_133482 ) ) ( not ( = ?auto_133481 ?auto_133483 ) ) ( not ( = ?auto_133481 ?auto_133482 ) ) ( not ( = ?auto_133483 ?auto_133482 ) ) ( ON ?auto_133483 ?auto_133481 ) ( CLEAR ?auto_133483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133479 ?auto_133480 ?auto_133481 )
      ( MAKE-2PILE ?auto_133479 ?auto_133480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133484 - BLOCK
      ?auto_133485 - BLOCK
    )
    :vars
    (
      ?auto_133487 - BLOCK
      ?auto_133486 - BLOCK
      ?auto_133488 - BLOCK
      ?auto_133490 - BLOCK
      ?auto_133489 - BLOCK
      ?auto_133492 - BLOCK
      ?auto_133491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133487 ?auto_133485 ) ( ON-TABLE ?auto_133484 ) ( ON ?auto_133485 ?auto_133484 ) ( not ( = ?auto_133484 ?auto_133485 ) ) ( not ( = ?auto_133484 ?auto_133487 ) ) ( not ( = ?auto_133485 ?auto_133487 ) ) ( not ( = ?auto_133484 ?auto_133486 ) ) ( not ( = ?auto_133484 ?auto_133488 ) ) ( not ( = ?auto_133485 ?auto_133486 ) ) ( not ( = ?auto_133485 ?auto_133488 ) ) ( not ( = ?auto_133487 ?auto_133486 ) ) ( not ( = ?auto_133487 ?auto_133488 ) ) ( not ( = ?auto_133486 ?auto_133488 ) ) ( ON ?auto_133486 ?auto_133487 ) ( CLEAR ?auto_133486 ) ( HOLDING ?auto_133488 ) ( CLEAR ?auto_133490 ) ( ON-TABLE ?auto_133489 ) ( ON ?auto_133492 ?auto_133489 ) ( ON ?auto_133491 ?auto_133492 ) ( ON ?auto_133490 ?auto_133491 ) ( not ( = ?auto_133489 ?auto_133492 ) ) ( not ( = ?auto_133489 ?auto_133491 ) ) ( not ( = ?auto_133489 ?auto_133490 ) ) ( not ( = ?auto_133489 ?auto_133488 ) ) ( not ( = ?auto_133492 ?auto_133491 ) ) ( not ( = ?auto_133492 ?auto_133490 ) ) ( not ( = ?auto_133492 ?auto_133488 ) ) ( not ( = ?auto_133491 ?auto_133490 ) ) ( not ( = ?auto_133491 ?auto_133488 ) ) ( not ( = ?auto_133490 ?auto_133488 ) ) ( not ( = ?auto_133484 ?auto_133490 ) ) ( not ( = ?auto_133484 ?auto_133489 ) ) ( not ( = ?auto_133484 ?auto_133492 ) ) ( not ( = ?auto_133484 ?auto_133491 ) ) ( not ( = ?auto_133485 ?auto_133490 ) ) ( not ( = ?auto_133485 ?auto_133489 ) ) ( not ( = ?auto_133485 ?auto_133492 ) ) ( not ( = ?auto_133485 ?auto_133491 ) ) ( not ( = ?auto_133487 ?auto_133490 ) ) ( not ( = ?auto_133487 ?auto_133489 ) ) ( not ( = ?auto_133487 ?auto_133492 ) ) ( not ( = ?auto_133487 ?auto_133491 ) ) ( not ( = ?auto_133486 ?auto_133490 ) ) ( not ( = ?auto_133486 ?auto_133489 ) ) ( not ( = ?auto_133486 ?auto_133492 ) ) ( not ( = ?auto_133486 ?auto_133491 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133489 ?auto_133492 ?auto_133491 ?auto_133490 ?auto_133488 )
      ( MAKE-2PILE ?auto_133484 ?auto_133485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133493 - BLOCK
      ?auto_133494 - BLOCK
    )
    :vars
    (
      ?auto_133497 - BLOCK
      ?auto_133498 - BLOCK
      ?auto_133495 - BLOCK
      ?auto_133496 - BLOCK
      ?auto_133499 - BLOCK
      ?auto_133500 - BLOCK
      ?auto_133501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133497 ?auto_133494 ) ( ON-TABLE ?auto_133493 ) ( ON ?auto_133494 ?auto_133493 ) ( not ( = ?auto_133493 ?auto_133494 ) ) ( not ( = ?auto_133493 ?auto_133497 ) ) ( not ( = ?auto_133494 ?auto_133497 ) ) ( not ( = ?auto_133493 ?auto_133498 ) ) ( not ( = ?auto_133493 ?auto_133495 ) ) ( not ( = ?auto_133494 ?auto_133498 ) ) ( not ( = ?auto_133494 ?auto_133495 ) ) ( not ( = ?auto_133497 ?auto_133498 ) ) ( not ( = ?auto_133497 ?auto_133495 ) ) ( not ( = ?auto_133498 ?auto_133495 ) ) ( ON ?auto_133498 ?auto_133497 ) ( CLEAR ?auto_133496 ) ( ON-TABLE ?auto_133499 ) ( ON ?auto_133500 ?auto_133499 ) ( ON ?auto_133501 ?auto_133500 ) ( ON ?auto_133496 ?auto_133501 ) ( not ( = ?auto_133499 ?auto_133500 ) ) ( not ( = ?auto_133499 ?auto_133501 ) ) ( not ( = ?auto_133499 ?auto_133496 ) ) ( not ( = ?auto_133499 ?auto_133495 ) ) ( not ( = ?auto_133500 ?auto_133501 ) ) ( not ( = ?auto_133500 ?auto_133496 ) ) ( not ( = ?auto_133500 ?auto_133495 ) ) ( not ( = ?auto_133501 ?auto_133496 ) ) ( not ( = ?auto_133501 ?auto_133495 ) ) ( not ( = ?auto_133496 ?auto_133495 ) ) ( not ( = ?auto_133493 ?auto_133496 ) ) ( not ( = ?auto_133493 ?auto_133499 ) ) ( not ( = ?auto_133493 ?auto_133500 ) ) ( not ( = ?auto_133493 ?auto_133501 ) ) ( not ( = ?auto_133494 ?auto_133496 ) ) ( not ( = ?auto_133494 ?auto_133499 ) ) ( not ( = ?auto_133494 ?auto_133500 ) ) ( not ( = ?auto_133494 ?auto_133501 ) ) ( not ( = ?auto_133497 ?auto_133496 ) ) ( not ( = ?auto_133497 ?auto_133499 ) ) ( not ( = ?auto_133497 ?auto_133500 ) ) ( not ( = ?auto_133497 ?auto_133501 ) ) ( not ( = ?auto_133498 ?auto_133496 ) ) ( not ( = ?auto_133498 ?auto_133499 ) ) ( not ( = ?auto_133498 ?auto_133500 ) ) ( not ( = ?auto_133498 ?auto_133501 ) ) ( ON ?auto_133495 ?auto_133498 ) ( CLEAR ?auto_133495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133493 ?auto_133494 ?auto_133497 ?auto_133498 )
      ( MAKE-2PILE ?auto_133493 ?auto_133494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133502 - BLOCK
      ?auto_133503 - BLOCK
    )
    :vars
    (
      ?auto_133506 - BLOCK
      ?auto_133507 - BLOCK
      ?auto_133509 - BLOCK
      ?auto_133504 - BLOCK
      ?auto_133508 - BLOCK
      ?auto_133510 - BLOCK
      ?auto_133505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133506 ?auto_133503 ) ( ON-TABLE ?auto_133502 ) ( ON ?auto_133503 ?auto_133502 ) ( not ( = ?auto_133502 ?auto_133503 ) ) ( not ( = ?auto_133502 ?auto_133506 ) ) ( not ( = ?auto_133503 ?auto_133506 ) ) ( not ( = ?auto_133502 ?auto_133507 ) ) ( not ( = ?auto_133502 ?auto_133509 ) ) ( not ( = ?auto_133503 ?auto_133507 ) ) ( not ( = ?auto_133503 ?auto_133509 ) ) ( not ( = ?auto_133506 ?auto_133507 ) ) ( not ( = ?auto_133506 ?auto_133509 ) ) ( not ( = ?auto_133507 ?auto_133509 ) ) ( ON ?auto_133507 ?auto_133506 ) ( ON-TABLE ?auto_133504 ) ( ON ?auto_133508 ?auto_133504 ) ( ON ?auto_133510 ?auto_133508 ) ( not ( = ?auto_133504 ?auto_133508 ) ) ( not ( = ?auto_133504 ?auto_133510 ) ) ( not ( = ?auto_133504 ?auto_133505 ) ) ( not ( = ?auto_133504 ?auto_133509 ) ) ( not ( = ?auto_133508 ?auto_133510 ) ) ( not ( = ?auto_133508 ?auto_133505 ) ) ( not ( = ?auto_133508 ?auto_133509 ) ) ( not ( = ?auto_133510 ?auto_133505 ) ) ( not ( = ?auto_133510 ?auto_133509 ) ) ( not ( = ?auto_133505 ?auto_133509 ) ) ( not ( = ?auto_133502 ?auto_133505 ) ) ( not ( = ?auto_133502 ?auto_133504 ) ) ( not ( = ?auto_133502 ?auto_133508 ) ) ( not ( = ?auto_133502 ?auto_133510 ) ) ( not ( = ?auto_133503 ?auto_133505 ) ) ( not ( = ?auto_133503 ?auto_133504 ) ) ( not ( = ?auto_133503 ?auto_133508 ) ) ( not ( = ?auto_133503 ?auto_133510 ) ) ( not ( = ?auto_133506 ?auto_133505 ) ) ( not ( = ?auto_133506 ?auto_133504 ) ) ( not ( = ?auto_133506 ?auto_133508 ) ) ( not ( = ?auto_133506 ?auto_133510 ) ) ( not ( = ?auto_133507 ?auto_133505 ) ) ( not ( = ?auto_133507 ?auto_133504 ) ) ( not ( = ?auto_133507 ?auto_133508 ) ) ( not ( = ?auto_133507 ?auto_133510 ) ) ( ON ?auto_133509 ?auto_133507 ) ( CLEAR ?auto_133509 ) ( HOLDING ?auto_133505 ) ( CLEAR ?auto_133510 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133504 ?auto_133508 ?auto_133510 ?auto_133505 )
      ( MAKE-2PILE ?auto_133502 ?auto_133503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133511 - BLOCK
      ?auto_133512 - BLOCK
    )
    :vars
    (
      ?auto_133518 - BLOCK
      ?auto_133513 - BLOCK
      ?auto_133517 - BLOCK
      ?auto_133516 - BLOCK
      ?auto_133514 - BLOCK
      ?auto_133515 - BLOCK
      ?auto_133519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133518 ?auto_133512 ) ( ON-TABLE ?auto_133511 ) ( ON ?auto_133512 ?auto_133511 ) ( not ( = ?auto_133511 ?auto_133512 ) ) ( not ( = ?auto_133511 ?auto_133518 ) ) ( not ( = ?auto_133512 ?auto_133518 ) ) ( not ( = ?auto_133511 ?auto_133513 ) ) ( not ( = ?auto_133511 ?auto_133517 ) ) ( not ( = ?auto_133512 ?auto_133513 ) ) ( not ( = ?auto_133512 ?auto_133517 ) ) ( not ( = ?auto_133518 ?auto_133513 ) ) ( not ( = ?auto_133518 ?auto_133517 ) ) ( not ( = ?auto_133513 ?auto_133517 ) ) ( ON ?auto_133513 ?auto_133518 ) ( ON-TABLE ?auto_133516 ) ( ON ?auto_133514 ?auto_133516 ) ( ON ?auto_133515 ?auto_133514 ) ( not ( = ?auto_133516 ?auto_133514 ) ) ( not ( = ?auto_133516 ?auto_133515 ) ) ( not ( = ?auto_133516 ?auto_133519 ) ) ( not ( = ?auto_133516 ?auto_133517 ) ) ( not ( = ?auto_133514 ?auto_133515 ) ) ( not ( = ?auto_133514 ?auto_133519 ) ) ( not ( = ?auto_133514 ?auto_133517 ) ) ( not ( = ?auto_133515 ?auto_133519 ) ) ( not ( = ?auto_133515 ?auto_133517 ) ) ( not ( = ?auto_133519 ?auto_133517 ) ) ( not ( = ?auto_133511 ?auto_133519 ) ) ( not ( = ?auto_133511 ?auto_133516 ) ) ( not ( = ?auto_133511 ?auto_133514 ) ) ( not ( = ?auto_133511 ?auto_133515 ) ) ( not ( = ?auto_133512 ?auto_133519 ) ) ( not ( = ?auto_133512 ?auto_133516 ) ) ( not ( = ?auto_133512 ?auto_133514 ) ) ( not ( = ?auto_133512 ?auto_133515 ) ) ( not ( = ?auto_133518 ?auto_133519 ) ) ( not ( = ?auto_133518 ?auto_133516 ) ) ( not ( = ?auto_133518 ?auto_133514 ) ) ( not ( = ?auto_133518 ?auto_133515 ) ) ( not ( = ?auto_133513 ?auto_133519 ) ) ( not ( = ?auto_133513 ?auto_133516 ) ) ( not ( = ?auto_133513 ?auto_133514 ) ) ( not ( = ?auto_133513 ?auto_133515 ) ) ( ON ?auto_133517 ?auto_133513 ) ( CLEAR ?auto_133515 ) ( ON ?auto_133519 ?auto_133517 ) ( CLEAR ?auto_133519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133511 ?auto_133512 ?auto_133518 ?auto_133513 ?auto_133517 )
      ( MAKE-2PILE ?auto_133511 ?auto_133512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133520 - BLOCK
      ?auto_133521 - BLOCK
    )
    :vars
    (
      ?auto_133526 - BLOCK
      ?auto_133527 - BLOCK
      ?auto_133525 - BLOCK
      ?auto_133524 - BLOCK
      ?auto_133528 - BLOCK
      ?auto_133523 - BLOCK
      ?auto_133522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133526 ?auto_133521 ) ( ON-TABLE ?auto_133520 ) ( ON ?auto_133521 ?auto_133520 ) ( not ( = ?auto_133520 ?auto_133521 ) ) ( not ( = ?auto_133520 ?auto_133526 ) ) ( not ( = ?auto_133521 ?auto_133526 ) ) ( not ( = ?auto_133520 ?auto_133527 ) ) ( not ( = ?auto_133520 ?auto_133525 ) ) ( not ( = ?auto_133521 ?auto_133527 ) ) ( not ( = ?auto_133521 ?auto_133525 ) ) ( not ( = ?auto_133526 ?auto_133527 ) ) ( not ( = ?auto_133526 ?auto_133525 ) ) ( not ( = ?auto_133527 ?auto_133525 ) ) ( ON ?auto_133527 ?auto_133526 ) ( ON-TABLE ?auto_133524 ) ( ON ?auto_133528 ?auto_133524 ) ( not ( = ?auto_133524 ?auto_133528 ) ) ( not ( = ?auto_133524 ?auto_133523 ) ) ( not ( = ?auto_133524 ?auto_133522 ) ) ( not ( = ?auto_133524 ?auto_133525 ) ) ( not ( = ?auto_133528 ?auto_133523 ) ) ( not ( = ?auto_133528 ?auto_133522 ) ) ( not ( = ?auto_133528 ?auto_133525 ) ) ( not ( = ?auto_133523 ?auto_133522 ) ) ( not ( = ?auto_133523 ?auto_133525 ) ) ( not ( = ?auto_133522 ?auto_133525 ) ) ( not ( = ?auto_133520 ?auto_133522 ) ) ( not ( = ?auto_133520 ?auto_133524 ) ) ( not ( = ?auto_133520 ?auto_133528 ) ) ( not ( = ?auto_133520 ?auto_133523 ) ) ( not ( = ?auto_133521 ?auto_133522 ) ) ( not ( = ?auto_133521 ?auto_133524 ) ) ( not ( = ?auto_133521 ?auto_133528 ) ) ( not ( = ?auto_133521 ?auto_133523 ) ) ( not ( = ?auto_133526 ?auto_133522 ) ) ( not ( = ?auto_133526 ?auto_133524 ) ) ( not ( = ?auto_133526 ?auto_133528 ) ) ( not ( = ?auto_133526 ?auto_133523 ) ) ( not ( = ?auto_133527 ?auto_133522 ) ) ( not ( = ?auto_133527 ?auto_133524 ) ) ( not ( = ?auto_133527 ?auto_133528 ) ) ( not ( = ?auto_133527 ?auto_133523 ) ) ( ON ?auto_133525 ?auto_133527 ) ( ON ?auto_133522 ?auto_133525 ) ( CLEAR ?auto_133522 ) ( HOLDING ?auto_133523 ) ( CLEAR ?auto_133528 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133524 ?auto_133528 ?auto_133523 )
      ( MAKE-2PILE ?auto_133520 ?auto_133521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133529 - BLOCK
      ?auto_133530 - BLOCK
    )
    :vars
    (
      ?auto_133536 - BLOCK
      ?auto_133537 - BLOCK
      ?auto_133532 - BLOCK
      ?auto_133533 - BLOCK
      ?auto_133531 - BLOCK
      ?auto_133535 - BLOCK
      ?auto_133534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133536 ?auto_133530 ) ( ON-TABLE ?auto_133529 ) ( ON ?auto_133530 ?auto_133529 ) ( not ( = ?auto_133529 ?auto_133530 ) ) ( not ( = ?auto_133529 ?auto_133536 ) ) ( not ( = ?auto_133530 ?auto_133536 ) ) ( not ( = ?auto_133529 ?auto_133537 ) ) ( not ( = ?auto_133529 ?auto_133532 ) ) ( not ( = ?auto_133530 ?auto_133537 ) ) ( not ( = ?auto_133530 ?auto_133532 ) ) ( not ( = ?auto_133536 ?auto_133537 ) ) ( not ( = ?auto_133536 ?auto_133532 ) ) ( not ( = ?auto_133537 ?auto_133532 ) ) ( ON ?auto_133537 ?auto_133536 ) ( ON-TABLE ?auto_133533 ) ( ON ?auto_133531 ?auto_133533 ) ( not ( = ?auto_133533 ?auto_133531 ) ) ( not ( = ?auto_133533 ?auto_133535 ) ) ( not ( = ?auto_133533 ?auto_133534 ) ) ( not ( = ?auto_133533 ?auto_133532 ) ) ( not ( = ?auto_133531 ?auto_133535 ) ) ( not ( = ?auto_133531 ?auto_133534 ) ) ( not ( = ?auto_133531 ?auto_133532 ) ) ( not ( = ?auto_133535 ?auto_133534 ) ) ( not ( = ?auto_133535 ?auto_133532 ) ) ( not ( = ?auto_133534 ?auto_133532 ) ) ( not ( = ?auto_133529 ?auto_133534 ) ) ( not ( = ?auto_133529 ?auto_133533 ) ) ( not ( = ?auto_133529 ?auto_133531 ) ) ( not ( = ?auto_133529 ?auto_133535 ) ) ( not ( = ?auto_133530 ?auto_133534 ) ) ( not ( = ?auto_133530 ?auto_133533 ) ) ( not ( = ?auto_133530 ?auto_133531 ) ) ( not ( = ?auto_133530 ?auto_133535 ) ) ( not ( = ?auto_133536 ?auto_133534 ) ) ( not ( = ?auto_133536 ?auto_133533 ) ) ( not ( = ?auto_133536 ?auto_133531 ) ) ( not ( = ?auto_133536 ?auto_133535 ) ) ( not ( = ?auto_133537 ?auto_133534 ) ) ( not ( = ?auto_133537 ?auto_133533 ) ) ( not ( = ?auto_133537 ?auto_133531 ) ) ( not ( = ?auto_133537 ?auto_133535 ) ) ( ON ?auto_133532 ?auto_133537 ) ( ON ?auto_133534 ?auto_133532 ) ( CLEAR ?auto_133531 ) ( ON ?auto_133535 ?auto_133534 ) ( CLEAR ?auto_133535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133529 ?auto_133530 ?auto_133536 ?auto_133537 ?auto_133532 ?auto_133534 )
      ( MAKE-2PILE ?auto_133529 ?auto_133530 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133538 - BLOCK
      ?auto_133539 - BLOCK
    )
    :vars
    (
      ?auto_133541 - BLOCK
      ?auto_133545 - BLOCK
      ?auto_133543 - BLOCK
      ?auto_133546 - BLOCK
      ?auto_133544 - BLOCK
      ?auto_133542 - BLOCK
      ?auto_133540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133541 ?auto_133539 ) ( ON-TABLE ?auto_133538 ) ( ON ?auto_133539 ?auto_133538 ) ( not ( = ?auto_133538 ?auto_133539 ) ) ( not ( = ?auto_133538 ?auto_133541 ) ) ( not ( = ?auto_133539 ?auto_133541 ) ) ( not ( = ?auto_133538 ?auto_133545 ) ) ( not ( = ?auto_133538 ?auto_133543 ) ) ( not ( = ?auto_133539 ?auto_133545 ) ) ( not ( = ?auto_133539 ?auto_133543 ) ) ( not ( = ?auto_133541 ?auto_133545 ) ) ( not ( = ?auto_133541 ?auto_133543 ) ) ( not ( = ?auto_133545 ?auto_133543 ) ) ( ON ?auto_133545 ?auto_133541 ) ( ON-TABLE ?auto_133546 ) ( not ( = ?auto_133546 ?auto_133544 ) ) ( not ( = ?auto_133546 ?auto_133542 ) ) ( not ( = ?auto_133546 ?auto_133540 ) ) ( not ( = ?auto_133546 ?auto_133543 ) ) ( not ( = ?auto_133544 ?auto_133542 ) ) ( not ( = ?auto_133544 ?auto_133540 ) ) ( not ( = ?auto_133544 ?auto_133543 ) ) ( not ( = ?auto_133542 ?auto_133540 ) ) ( not ( = ?auto_133542 ?auto_133543 ) ) ( not ( = ?auto_133540 ?auto_133543 ) ) ( not ( = ?auto_133538 ?auto_133540 ) ) ( not ( = ?auto_133538 ?auto_133546 ) ) ( not ( = ?auto_133538 ?auto_133544 ) ) ( not ( = ?auto_133538 ?auto_133542 ) ) ( not ( = ?auto_133539 ?auto_133540 ) ) ( not ( = ?auto_133539 ?auto_133546 ) ) ( not ( = ?auto_133539 ?auto_133544 ) ) ( not ( = ?auto_133539 ?auto_133542 ) ) ( not ( = ?auto_133541 ?auto_133540 ) ) ( not ( = ?auto_133541 ?auto_133546 ) ) ( not ( = ?auto_133541 ?auto_133544 ) ) ( not ( = ?auto_133541 ?auto_133542 ) ) ( not ( = ?auto_133545 ?auto_133540 ) ) ( not ( = ?auto_133545 ?auto_133546 ) ) ( not ( = ?auto_133545 ?auto_133544 ) ) ( not ( = ?auto_133545 ?auto_133542 ) ) ( ON ?auto_133543 ?auto_133545 ) ( ON ?auto_133540 ?auto_133543 ) ( ON ?auto_133542 ?auto_133540 ) ( CLEAR ?auto_133542 ) ( HOLDING ?auto_133544 ) ( CLEAR ?auto_133546 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133546 ?auto_133544 )
      ( MAKE-2PILE ?auto_133538 ?auto_133539 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133547 - BLOCK
      ?auto_133548 - BLOCK
    )
    :vars
    (
      ?auto_133553 - BLOCK
      ?auto_133549 - BLOCK
      ?auto_133552 - BLOCK
      ?auto_133555 - BLOCK
      ?auto_133554 - BLOCK
      ?auto_133550 - BLOCK
      ?auto_133551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133553 ?auto_133548 ) ( ON-TABLE ?auto_133547 ) ( ON ?auto_133548 ?auto_133547 ) ( not ( = ?auto_133547 ?auto_133548 ) ) ( not ( = ?auto_133547 ?auto_133553 ) ) ( not ( = ?auto_133548 ?auto_133553 ) ) ( not ( = ?auto_133547 ?auto_133549 ) ) ( not ( = ?auto_133547 ?auto_133552 ) ) ( not ( = ?auto_133548 ?auto_133549 ) ) ( not ( = ?auto_133548 ?auto_133552 ) ) ( not ( = ?auto_133553 ?auto_133549 ) ) ( not ( = ?auto_133553 ?auto_133552 ) ) ( not ( = ?auto_133549 ?auto_133552 ) ) ( ON ?auto_133549 ?auto_133553 ) ( ON-TABLE ?auto_133555 ) ( not ( = ?auto_133555 ?auto_133554 ) ) ( not ( = ?auto_133555 ?auto_133550 ) ) ( not ( = ?auto_133555 ?auto_133551 ) ) ( not ( = ?auto_133555 ?auto_133552 ) ) ( not ( = ?auto_133554 ?auto_133550 ) ) ( not ( = ?auto_133554 ?auto_133551 ) ) ( not ( = ?auto_133554 ?auto_133552 ) ) ( not ( = ?auto_133550 ?auto_133551 ) ) ( not ( = ?auto_133550 ?auto_133552 ) ) ( not ( = ?auto_133551 ?auto_133552 ) ) ( not ( = ?auto_133547 ?auto_133551 ) ) ( not ( = ?auto_133547 ?auto_133555 ) ) ( not ( = ?auto_133547 ?auto_133554 ) ) ( not ( = ?auto_133547 ?auto_133550 ) ) ( not ( = ?auto_133548 ?auto_133551 ) ) ( not ( = ?auto_133548 ?auto_133555 ) ) ( not ( = ?auto_133548 ?auto_133554 ) ) ( not ( = ?auto_133548 ?auto_133550 ) ) ( not ( = ?auto_133553 ?auto_133551 ) ) ( not ( = ?auto_133553 ?auto_133555 ) ) ( not ( = ?auto_133553 ?auto_133554 ) ) ( not ( = ?auto_133553 ?auto_133550 ) ) ( not ( = ?auto_133549 ?auto_133551 ) ) ( not ( = ?auto_133549 ?auto_133555 ) ) ( not ( = ?auto_133549 ?auto_133554 ) ) ( not ( = ?auto_133549 ?auto_133550 ) ) ( ON ?auto_133552 ?auto_133549 ) ( ON ?auto_133551 ?auto_133552 ) ( ON ?auto_133550 ?auto_133551 ) ( CLEAR ?auto_133555 ) ( ON ?auto_133554 ?auto_133550 ) ( CLEAR ?auto_133554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133547 ?auto_133548 ?auto_133553 ?auto_133549 ?auto_133552 ?auto_133551 ?auto_133550 )
      ( MAKE-2PILE ?auto_133547 ?auto_133548 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133556 - BLOCK
      ?auto_133557 - BLOCK
    )
    :vars
    (
      ?auto_133559 - BLOCK
      ?auto_133562 - BLOCK
      ?auto_133561 - BLOCK
      ?auto_133564 - BLOCK
      ?auto_133560 - BLOCK
      ?auto_133563 - BLOCK
      ?auto_133558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133559 ?auto_133557 ) ( ON-TABLE ?auto_133556 ) ( ON ?auto_133557 ?auto_133556 ) ( not ( = ?auto_133556 ?auto_133557 ) ) ( not ( = ?auto_133556 ?auto_133559 ) ) ( not ( = ?auto_133557 ?auto_133559 ) ) ( not ( = ?auto_133556 ?auto_133562 ) ) ( not ( = ?auto_133556 ?auto_133561 ) ) ( not ( = ?auto_133557 ?auto_133562 ) ) ( not ( = ?auto_133557 ?auto_133561 ) ) ( not ( = ?auto_133559 ?auto_133562 ) ) ( not ( = ?auto_133559 ?auto_133561 ) ) ( not ( = ?auto_133562 ?auto_133561 ) ) ( ON ?auto_133562 ?auto_133559 ) ( not ( = ?auto_133564 ?auto_133560 ) ) ( not ( = ?auto_133564 ?auto_133563 ) ) ( not ( = ?auto_133564 ?auto_133558 ) ) ( not ( = ?auto_133564 ?auto_133561 ) ) ( not ( = ?auto_133560 ?auto_133563 ) ) ( not ( = ?auto_133560 ?auto_133558 ) ) ( not ( = ?auto_133560 ?auto_133561 ) ) ( not ( = ?auto_133563 ?auto_133558 ) ) ( not ( = ?auto_133563 ?auto_133561 ) ) ( not ( = ?auto_133558 ?auto_133561 ) ) ( not ( = ?auto_133556 ?auto_133558 ) ) ( not ( = ?auto_133556 ?auto_133564 ) ) ( not ( = ?auto_133556 ?auto_133560 ) ) ( not ( = ?auto_133556 ?auto_133563 ) ) ( not ( = ?auto_133557 ?auto_133558 ) ) ( not ( = ?auto_133557 ?auto_133564 ) ) ( not ( = ?auto_133557 ?auto_133560 ) ) ( not ( = ?auto_133557 ?auto_133563 ) ) ( not ( = ?auto_133559 ?auto_133558 ) ) ( not ( = ?auto_133559 ?auto_133564 ) ) ( not ( = ?auto_133559 ?auto_133560 ) ) ( not ( = ?auto_133559 ?auto_133563 ) ) ( not ( = ?auto_133562 ?auto_133558 ) ) ( not ( = ?auto_133562 ?auto_133564 ) ) ( not ( = ?auto_133562 ?auto_133560 ) ) ( not ( = ?auto_133562 ?auto_133563 ) ) ( ON ?auto_133561 ?auto_133562 ) ( ON ?auto_133558 ?auto_133561 ) ( ON ?auto_133563 ?auto_133558 ) ( ON ?auto_133560 ?auto_133563 ) ( CLEAR ?auto_133560 ) ( HOLDING ?auto_133564 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133564 )
      ( MAKE-2PILE ?auto_133556 ?auto_133557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_133565 - BLOCK
      ?auto_133566 - BLOCK
    )
    :vars
    (
      ?auto_133569 - BLOCK
      ?auto_133570 - BLOCK
      ?auto_133567 - BLOCK
      ?auto_133571 - BLOCK
      ?auto_133573 - BLOCK
      ?auto_133568 - BLOCK
      ?auto_133572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133569 ?auto_133566 ) ( ON-TABLE ?auto_133565 ) ( ON ?auto_133566 ?auto_133565 ) ( not ( = ?auto_133565 ?auto_133566 ) ) ( not ( = ?auto_133565 ?auto_133569 ) ) ( not ( = ?auto_133566 ?auto_133569 ) ) ( not ( = ?auto_133565 ?auto_133570 ) ) ( not ( = ?auto_133565 ?auto_133567 ) ) ( not ( = ?auto_133566 ?auto_133570 ) ) ( not ( = ?auto_133566 ?auto_133567 ) ) ( not ( = ?auto_133569 ?auto_133570 ) ) ( not ( = ?auto_133569 ?auto_133567 ) ) ( not ( = ?auto_133570 ?auto_133567 ) ) ( ON ?auto_133570 ?auto_133569 ) ( not ( = ?auto_133571 ?auto_133573 ) ) ( not ( = ?auto_133571 ?auto_133568 ) ) ( not ( = ?auto_133571 ?auto_133572 ) ) ( not ( = ?auto_133571 ?auto_133567 ) ) ( not ( = ?auto_133573 ?auto_133568 ) ) ( not ( = ?auto_133573 ?auto_133572 ) ) ( not ( = ?auto_133573 ?auto_133567 ) ) ( not ( = ?auto_133568 ?auto_133572 ) ) ( not ( = ?auto_133568 ?auto_133567 ) ) ( not ( = ?auto_133572 ?auto_133567 ) ) ( not ( = ?auto_133565 ?auto_133572 ) ) ( not ( = ?auto_133565 ?auto_133571 ) ) ( not ( = ?auto_133565 ?auto_133573 ) ) ( not ( = ?auto_133565 ?auto_133568 ) ) ( not ( = ?auto_133566 ?auto_133572 ) ) ( not ( = ?auto_133566 ?auto_133571 ) ) ( not ( = ?auto_133566 ?auto_133573 ) ) ( not ( = ?auto_133566 ?auto_133568 ) ) ( not ( = ?auto_133569 ?auto_133572 ) ) ( not ( = ?auto_133569 ?auto_133571 ) ) ( not ( = ?auto_133569 ?auto_133573 ) ) ( not ( = ?auto_133569 ?auto_133568 ) ) ( not ( = ?auto_133570 ?auto_133572 ) ) ( not ( = ?auto_133570 ?auto_133571 ) ) ( not ( = ?auto_133570 ?auto_133573 ) ) ( not ( = ?auto_133570 ?auto_133568 ) ) ( ON ?auto_133567 ?auto_133570 ) ( ON ?auto_133572 ?auto_133567 ) ( ON ?auto_133568 ?auto_133572 ) ( ON ?auto_133573 ?auto_133568 ) ( ON ?auto_133571 ?auto_133573 ) ( CLEAR ?auto_133571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133565 ?auto_133566 ?auto_133569 ?auto_133570 ?auto_133567 ?auto_133572 ?auto_133568 ?auto_133573 )
      ( MAKE-2PILE ?auto_133565 ?auto_133566 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133581 - BLOCK
      ?auto_133582 - BLOCK
      ?auto_133583 - BLOCK
      ?auto_133584 - BLOCK
      ?auto_133585 - BLOCK
      ?auto_133586 - BLOCK
      ?auto_133587 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_133587 ) ( CLEAR ?auto_133586 ) ( ON-TABLE ?auto_133581 ) ( ON ?auto_133582 ?auto_133581 ) ( ON ?auto_133583 ?auto_133582 ) ( ON ?auto_133584 ?auto_133583 ) ( ON ?auto_133585 ?auto_133584 ) ( ON ?auto_133586 ?auto_133585 ) ( not ( = ?auto_133581 ?auto_133582 ) ) ( not ( = ?auto_133581 ?auto_133583 ) ) ( not ( = ?auto_133581 ?auto_133584 ) ) ( not ( = ?auto_133581 ?auto_133585 ) ) ( not ( = ?auto_133581 ?auto_133586 ) ) ( not ( = ?auto_133581 ?auto_133587 ) ) ( not ( = ?auto_133582 ?auto_133583 ) ) ( not ( = ?auto_133582 ?auto_133584 ) ) ( not ( = ?auto_133582 ?auto_133585 ) ) ( not ( = ?auto_133582 ?auto_133586 ) ) ( not ( = ?auto_133582 ?auto_133587 ) ) ( not ( = ?auto_133583 ?auto_133584 ) ) ( not ( = ?auto_133583 ?auto_133585 ) ) ( not ( = ?auto_133583 ?auto_133586 ) ) ( not ( = ?auto_133583 ?auto_133587 ) ) ( not ( = ?auto_133584 ?auto_133585 ) ) ( not ( = ?auto_133584 ?auto_133586 ) ) ( not ( = ?auto_133584 ?auto_133587 ) ) ( not ( = ?auto_133585 ?auto_133586 ) ) ( not ( = ?auto_133585 ?auto_133587 ) ) ( not ( = ?auto_133586 ?auto_133587 ) ) )
    :subtasks
    ( ( !STACK ?auto_133587 ?auto_133586 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133588 - BLOCK
      ?auto_133589 - BLOCK
      ?auto_133590 - BLOCK
      ?auto_133591 - BLOCK
      ?auto_133592 - BLOCK
      ?auto_133593 - BLOCK
      ?auto_133594 - BLOCK
    )
    :vars
    (
      ?auto_133595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133593 ) ( ON-TABLE ?auto_133588 ) ( ON ?auto_133589 ?auto_133588 ) ( ON ?auto_133590 ?auto_133589 ) ( ON ?auto_133591 ?auto_133590 ) ( ON ?auto_133592 ?auto_133591 ) ( ON ?auto_133593 ?auto_133592 ) ( not ( = ?auto_133588 ?auto_133589 ) ) ( not ( = ?auto_133588 ?auto_133590 ) ) ( not ( = ?auto_133588 ?auto_133591 ) ) ( not ( = ?auto_133588 ?auto_133592 ) ) ( not ( = ?auto_133588 ?auto_133593 ) ) ( not ( = ?auto_133588 ?auto_133594 ) ) ( not ( = ?auto_133589 ?auto_133590 ) ) ( not ( = ?auto_133589 ?auto_133591 ) ) ( not ( = ?auto_133589 ?auto_133592 ) ) ( not ( = ?auto_133589 ?auto_133593 ) ) ( not ( = ?auto_133589 ?auto_133594 ) ) ( not ( = ?auto_133590 ?auto_133591 ) ) ( not ( = ?auto_133590 ?auto_133592 ) ) ( not ( = ?auto_133590 ?auto_133593 ) ) ( not ( = ?auto_133590 ?auto_133594 ) ) ( not ( = ?auto_133591 ?auto_133592 ) ) ( not ( = ?auto_133591 ?auto_133593 ) ) ( not ( = ?auto_133591 ?auto_133594 ) ) ( not ( = ?auto_133592 ?auto_133593 ) ) ( not ( = ?auto_133592 ?auto_133594 ) ) ( not ( = ?auto_133593 ?auto_133594 ) ) ( ON ?auto_133594 ?auto_133595 ) ( CLEAR ?auto_133594 ) ( HAND-EMPTY ) ( not ( = ?auto_133588 ?auto_133595 ) ) ( not ( = ?auto_133589 ?auto_133595 ) ) ( not ( = ?auto_133590 ?auto_133595 ) ) ( not ( = ?auto_133591 ?auto_133595 ) ) ( not ( = ?auto_133592 ?auto_133595 ) ) ( not ( = ?auto_133593 ?auto_133595 ) ) ( not ( = ?auto_133594 ?auto_133595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133594 ?auto_133595 )
      ( MAKE-7PILE ?auto_133588 ?auto_133589 ?auto_133590 ?auto_133591 ?auto_133592 ?auto_133593 ?auto_133594 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133596 - BLOCK
      ?auto_133597 - BLOCK
      ?auto_133598 - BLOCK
      ?auto_133599 - BLOCK
      ?auto_133600 - BLOCK
      ?auto_133601 - BLOCK
      ?auto_133602 - BLOCK
    )
    :vars
    (
      ?auto_133603 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133596 ) ( ON ?auto_133597 ?auto_133596 ) ( ON ?auto_133598 ?auto_133597 ) ( ON ?auto_133599 ?auto_133598 ) ( ON ?auto_133600 ?auto_133599 ) ( not ( = ?auto_133596 ?auto_133597 ) ) ( not ( = ?auto_133596 ?auto_133598 ) ) ( not ( = ?auto_133596 ?auto_133599 ) ) ( not ( = ?auto_133596 ?auto_133600 ) ) ( not ( = ?auto_133596 ?auto_133601 ) ) ( not ( = ?auto_133596 ?auto_133602 ) ) ( not ( = ?auto_133597 ?auto_133598 ) ) ( not ( = ?auto_133597 ?auto_133599 ) ) ( not ( = ?auto_133597 ?auto_133600 ) ) ( not ( = ?auto_133597 ?auto_133601 ) ) ( not ( = ?auto_133597 ?auto_133602 ) ) ( not ( = ?auto_133598 ?auto_133599 ) ) ( not ( = ?auto_133598 ?auto_133600 ) ) ( not ( = ?auto_133598 ?auto_133601 ) ) ( not ( = ?auto_133598 ?auto_133602 ) ) ( not ( = ?auto_133599 ?auto_133600 ) ) ( not ( = ?auto_133599 ?auto_133601 ) ) ( not ( = ?auto_133599 ?auto_133602 ) ) ( not ( = ?auto_133600 ?auto_133601 ) ) ( not ( = ?auto_133600 ?auto_133602 ) ) ( not ( = ?auto_133601 ?auto_133602 ) ) ( ON ?auto_133602 ?auto_133603 ) ( CLEAR ?auto_133602 ) ( not ( = ?auto_133596 ?auto_133603 ) ) ( not ( = ?auto_133597 ?auto_133603 ) ) ( not ( = ?auto_133598 ?auto_133603 ) ) ( not ( = ?auto_133599 ?auto_133603 ) ) ( not ( = ?auto_133600 ?auto_133603 ) ) ( not ( = ?auto_133601 ?auto_133603 ) ) ( not ( = ?auto_133602 ?auto_133603 ) ) ( HOLDING ?auto_133601 ) ( CLEAR ?auto_133600 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133596 ?auto_133597 ?auto_133598 ?auto_133599 ?auto_133600 ?auto_133601 )
      ( MAKE-7PILE ?auto_133596 ?auto_133597 ?auto_133598 ?auto_133599 ?auto_133600 ?auto_133601 ?auto_133602 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133604 - BLOCK
      ?auto_133605 - BLOCK
      ?auto_133606 - BLOCK
      ?auto_133607 - BLOCK
      ?auto_133608 - BLOCK
      ?auto_133609 - BLOCK
      ?auto_133610 - BLOCK
    )
    :vars
    (
      ?auto_133611 - BLOCK
      ?auto_133612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133604 ) ( ON ?auto_133605 ?auto_133604 ) ( ON ?auto_133606 ?auto_133605 ) ( ON ?auto_133607 ?auto_133606 ) ( ON ?auto_133608 ?auto_133607 ) ( not ( = ?auto_133604 ?auto_133605 ) ) ( not ( = ?auto_133604 ?auto_133606 ) ) ( not ( = ?auto_133604 ?auto_133607 ) ) ( not ( = ?auto_133604 ?auto_133608 ) ) ( not ( = ?auto_133604 ?auto_133609 ) ) ( not ( = ?auto_133604 ?auto_133610 ) ) ( not ( = ?auto_133605 ?auto_133606 ) ) ( not ( = ?auto_133605 ?auto_133607 ) ) ( not ( = ?auto_133605 ?auto_133608 ) ) ( not ( = ?auto_133605 ?auto_133609 ) ) ( not ( = ?auto_133605 ?auto_133610 ) ) ( not ( = ?auto_133606 ?auto_133607 ) ) ( not ( = ?auto_133606 ?auto_133608 ) ) ( not ( = ?auto_133606 ?auto_133609 ) ) ( not ( = ?auto_133606 ?auto_133610 ) ) ( not ( = ?auto_133607 ?auto_133608 ) ) ( not ( = ?auto_133607 ?auto_133609 ) ) ( not ( = ?auto_133607 ?auto_133610 ) ) ( not ( = ?auto_133608 ?auto_133609 ) ) ( not ( = ?auto_133608 ?auto_133610 ) ) ( not ( = ?auto_133609 ?auto_133610 ) ) ( ON ?auto_133610 ?auto_133611 ) ( not ( = ?auto_133604 ?auto_133611 ) ) ( not ( = ?auto_133605 ?auto_133611 ) ) ( not ( = ?auto_133606 ?auto_133611 ) ) ( not ( = ?auto_133607 ?auto_133611 ) ) ( not ( = ?auto_133608 ?auto_133611 ) ) ( not ( = ?auto_133609 ?auto_133611 ) ) ( not ( = ?auto_133610 ?auto_133611 ) ) ( CLEAR ?auto_133608 ) ( ON ?auto_133609 ?auto_133610 ) ( CLEAR ?auto_133609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133612 ) ( ON ?auto_133611 ?auto_133612 ) ( not ( = ?auto_133612 ?auto_133611 ) ) ( not ( = ?auto_133612 ?auto_133610 ) ) ( not ( = ?auto_133612 ?auto_133609 ) ) ( not ( = ?auto_133604 ?auto_133612 ) ) ( not ( = ?auto_133605 ?auto_133612 ) ) ( not ( = ?auto_133606 ?auto_133612 ) ) ( not ( = ?auto_133607 ?auto_133612 ) ) ( not ( = ?auto_133608 ?auto_133612 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133612 ?auto_133611 ?auto_133610 )
      ( MAKE-7PILE ?auto_133604 ?auto_133605 ?auto_133606 ?auto_133607 ?auto_133608 ?auto_133609 ?auto_133610 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133613 - BLOCK
      ?auto_133614 - BLOCK
      ?auto_133615 - BLOCK
      ?auto_133616 - BLOCK
      ?auto_133617 - BLOCK
      ?auto_133618 - BLOCK
      ?auto_133619 - BLOCK
    )
    :vars
    (
      ?auto_133621 - BLOCK
      ?auto_133620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133613 ) ( ON ?auto_133614 ?auto_133613 ) ( ON ?auto_133615 ?auto_133614 ) ( ON ?auto_133616 ?auto_133615 ) ( not ( = ?auto_133613 ?auto_133614 ) ) ( not ( = ?auto_133613 ?auto_133615 ) ) ( not ( = ?auto_133613 ?auto_133616 ) ) ( not ( = ?auto_133613 ?auto_133617 ) ) ( not ( = ?auto_133613 ?auto_133618 ) ) ( not ( = ?auto_133613 ?auto_133619 ) ) ( not ( = ?auto_133614 ?auto_133615 ) ) ( not ( = ?auto_133614 ?auto_133616 ) ) ( not ( = ?auto_133614 ?auto_133617 ) ) ( not ( = ?auto_133614 ?auto_133618 ) ) ( not ( = ?auto_133614 ?auto_133619 ) ) ( not ( = ?auto_133615 ?auto_133616 ) ) ( not ( = ?auto_133615 ?auto_133617 ) ) ( not ( = ?auto_133615 ?auto_133618 ) ) ( not ( = ?auto_133615 ?auto_133619 ) ) ( not ( = ?auto_133616 ?auto_133617 ) ) ( not ( = ?auto_133616 ?auto_133618 ) ) ( not ( = ?auto_133616 ?auto_133619 ) ) ( not ( = ?auto_133617 ?auto_133618 ) ) ( not ( = ?auto_133617 ?auto_133619 ) ) ( not ( = ?auto_133618 ?auto_133619 ) ) ( ON ?auto_133619 ?auto_133621 ) ( not ( = ?auto_133613 ?auto_133621 ) ) ( not ( = ?auto_133614 ?auto_133621 ) ) ( not ( = ?auto_133615 ?auto_133621 ) ) ( not ( = ?auto_133616 ?auto_133621 ) ) ( not ( = ?auto_133617 ?auto_133621 ) ) ( not ( = ?auto_133618 ?auto_133621 ) ) ( not ( = ?auto_133619 ?auto_133621 ) ) ( ON ?auto_133618 ?auto_133619 ) ( CLEAR ?auto_133618 ) ( ON-TABLE ?auto_133620 ) ( ON ?auto_133621 ?auto_133620 ) ( not ( = ?auto_133620 ?auto_133621 ) ) ( not ( = ?auto_133620 ?auto_133619 ) ) ( not ( = ?auto_133620 ?auto_133618 ) ) ( not ( = ?auto_133613 ?auto_133620 ) ) ( not ( = ?auto_133614 ?auto_133620 ) ) ( not ( = ?auto_133615 ?auto_133620 ) ) ( not ( = ?auto_133616 ?auto_133620 ) ) ( not ( = ?auto_133617 ?auto_133620 ) ) ( HOLDING ?auto_133617 ) ( CLEAR ?auto_133616 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133613 ?auto_133614 ?auto_133615 ?auto_133616 ?auto_133617 )
      ( MAKE-7PILE ?auto_133613 ?auto_133614 ?auto_133615 ?auto_133616 ?auto_133617 ?auto_133618 ?auto_133619 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133622 - BLOCK
      ?auto_133623 - BLOCK
      ?auto_133624 - BLOCK
      ?auto_133625 - BLOCK
      ?auto_133626 - BLOCK
      ?auto_133627 - BLOCK
      ?auto_133628 - BLOCK
    )
    :vars
    (
      ?auto_133630 - BLOCK
      ?auto_133629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133622 ) ( ON ?auto_133623 ?auto_133622 ) ( ON ?auto_133624 ?auto_133623 ) ( ON ?auto_133625 ?auto_133624 ) ( not ( = ?auto_133622 ?auto_133623 ) ) ( not ( = ?auto_133622 ?auto_133624 ) ) ( not ( = ?auto_133622 ?auto_133625 ) ) ( not ( = ?auto_133622 ?auto_133626 ) ) ( not ( = ?auto_133622 ?auto_133627 ) ) ( not ( = ?auto_133622 ?auto_133628 ) ) ( not ( = ?auto_133623 ?auto_133624 ) ) ( not ( = ?auto_133623 ?auto_133625 ) ) ( not ( = ?auto_133623 ?auto_133626 ) ) ( not ( = ?auto_133623 ?auto_133627 ) ) ( not ( = ?auto_133623 ?auto_133628 ) ) ( not ( = ?auto_133624 ?auto_133625 ) ) ( not ( = ?auto_133624 ?auto_133626 ) ) ( not ( = ?auto_133624 ?auto_133627 ) ) ( not ( = ?auto_133624 ?auto_133628 ) ) ( not ( = ?auto_133625 ?auto_133626 ) ) ( not ( = ?auto_133625 ?auto_133627 ) ) ( not ( = ?auto_133625 ?auto_133628 ) ) ( not ( = ?auto_133626 ?auto_133627 ) ) ( not ( = ?auto_133626 ?auto_133628 ) ) ( not ( = ?auto_133627 ?auto_133628 ) ) ( ON ?auto_133628 ?auto_133630 ) ( not ( = ?auto_133622 ?auto_133630 ) ) ( not ( = ?auto_133623 ?auto_133630 ) ) ( not ( = ?auto_133624 ?auto_133630 ) ) ( not ( = ?auto_133625 ?auto_133630 ) ) ( not ( = ?auto_133626 ?auto_133630 ) ) ( not ( = ?auto_133627 ?auto_133630 ) ) ( not ( = ?auto_133628 ?auto_133630 ) ) ( ON ?auto_133627 ?auto_133628 ) ( ON-TABLE ?auto_133629 ) ( ON ?auto_133630 ?auto_133629 ) ( not ( = ?auto_133629 ?auto_133630 ) ) ( not ( = ?auto_133629 ?auto_133628 ) ) ( not ( = ?auto_133629 ?auto_133627 ) ) ( not ( = ?auto_133622 ?auto_133629 ) ) ( not ( = ?auto_133623 ?auto_133629 ) ) ( not ( = ?auto_133624 ?auto_133629 ) ) ( not ( = ?auto_133625 ?auto_133629 ) ) ( not ( = ?auto_133626 ?auto_133629 ) ) ( CLEAR ?auto_133625 ) ( ON ?auto_133626 ?auto_133627 ) ( CLEAR ?auto_133626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133629 ?auto_133630 ?auto_133628 ?auto_133627 )
      ( MAKE-7PILE ?auto_133622 ?auto_133623 ?auto_133624 ?auto_133625 ?auto_133626 ?auto_133627 ?auto_133628 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133631 - BLOCK
      ?auto_133632 - BLOCK
      ?auto_133633 - BLOCK
      ?auto_133634 - BLOCK
      ?auto_133635 - BLOCK
      ?auto_133636 - BLOCK
      ?auto_133637 - BLOCK
    )
    :vars
    (
      ?auto_133638 - BLOCK
      ?auto_133639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133631 ) ( ON ?auto_133632 ?auto_133631 ) ( ON ?auto_133633 ?auto_133632 ) ( not ( = ?auto_133631 ?auto_133632 ) ) ( not ( = ?auto_133631 ?auto_133633 ) ) ( not ( = ?auto_133631 ?auto_133634 ) ) ( not ( = ?auto_133631 ?auto_133635 ) ) ( not ( = ?auto_133631 ?auto_133636 ) ) ( not ( = ?auto_133631 ?auto_133637 ) ) ( not ( = ?auto_133632 ?auto_133633 ) ) ( not ( = ?auto_133632 ?auto_133634 ) ) ( not ( = ?auto_133632 ?auto_133635 ) ) ( not ( = ?auto_133632 ?auto_133636 ) ) ( not ( = ?auto_133632 ?auto_133637 ) ) ( not ( = ?auto_133633 ?auto_133634 ) ) ( not ( = ?auto_133633 ?auto_133635 ) ) ( not ( = ?auto_133633 ?auto_133636 ) ) ( not ( = ?auto_133633 ?auto_133637 ) ) ( not ( = ?auto_133634 ?auto_133635 ) ) ( not ( = ?auto_133634 ?auto_133636 ) ) ( not ( = ?auto_133634 ?auto_133637 ) ) ( not ( = ?auto_133635 ?auto_133636 ) ) ( not ( = ?auto_133635 ?auto_133637 ) ) ( not ( = ?auto_133636 ?auto_133637 ) ) ( ON ?auto_133637 ?auto_133638 ) ( not ( = ?auto_133631 ?auto_133638 ) ) ( not ( = ?auto_133632 ?auto_133638 ) ) ( not ( = ?auto_133633 ?auto_133638 ) ) ( not ( = ?auto_133634 ?auto_133638 ) ) ( not ( = ?auto_133635 ?auto_133638 ) ) ( not ( = ?auto_133636 ?auto_133638 ) ) ( not ( = ?auto_133637 ?auto_133638 ) ) ( ON ?auto_133636 ?auto_133637 ) ( ON-TABLE ?auto_133639 ) ( ON ?auto_133638 ?auto_133639 ) ( not ( = ?auto_133639 ?auto_133638 ) ) ( not ( = ?auto_133639 ?auto_133637 ) ) ( not ( = ?auto_133639 ?auto_133636 ) ) ( not ( = ?auto_133631 ?auto_133639 ) ) ( not ( = ?auto_133632 ?auto_133639 ) ) ( not ( = ?auto_133633 ?auto_133639 ) ) ( not ( = ?auto_133634 ?auto_133639 ) ) ( not ( = ?auto_133635 ?auto_133639 ) ) ( ON ?auto_133635 ?auto_133636 ) ( CLEAR ?auto_133635 ) ( HOLDING ?auto_133634 ) ( CLEAR ?auto_133633 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133631 ?auto_133632 ?auto_133633 ?auto_133634 )
      ( MAKE-7PILE ?auto_133631 ?auto_133632 ?auto_133633 ?auto_133634 ?auto_133635 ?auto_133636 ?auto_133637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133640 - BLOCK
      ?auto_133641 - BLOCK
      ?auto_133642 - BLOCK
      ?auto_133643 - BLOCK
      ?auto_133644 - BLOCK
      ?auto_133645 - BLOCK
      ?auto_133646 - BLOCK
    )
    :vars
    (
      ?auto_133647 - BLOCK
      ?auto_133648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133640 ) ( ON ?auto_133641 ?auto_133640 ) ( ON ?auto_133642 ?auto_133641 ) ( not ( = ?auto_133640 ?auto_133641 ) ) ( not ( = ?auto_133640 ?auto_133642 ) ) ( not ( = ?auto_133640 ?auto_133643 ) ) ( not ( = ?auto_133640 ?auto_133644 ) ) ( not ( = ?auto_133640 ?auto_133645 ) ) ( not ( = ?auto_133640 ?auto_133646 ) ) ( not ( = ?auto_133641 ?auto_133642 ) ) ( not ( = ?auto_133641 ?auto_133643 ) ) ( not ( = ?auto_133641 ?auto_133644 ) ) ( not ( = ?auto_133641 ?auto_133645 ) ) ( not ( = ?auto_133641 ?auto_133646 ) ) ( not ( = ?auto_133642 ?auto_133643 ) ) ( not ( = ?auto_133642 ?auto_133644 ) ) ( not ( = ?auto_133642 ?auto_133645 ) ) ( not ( = ?auto_133642 ?auto_133646 ) ) ( not ( = ?auto_133643 ?auto_133644 ) ) ( not ( = ?auto_133643 ?auto_133645 ) ) ( not ( = ?auto_133643 ?auto_133646 ) ) ( not ( = ?auto_133644 ?auto_133645 ) ) ( not ( = ?auto_133644 ?auto_133646 ) ) ( not ( = ?auto_133645 ?auto_133646 ) ) ( ON ?auto_133646 ?auto_133647 ) ( not ( = ?auto_133640 ?auto_133647 ) ) ( not ( = ?auto_133641 ?auto_133647 ) ) ( not ( = ?auto_133642 ?auto_133647 ) ) ( not ( = ?auto_133643 ?auto_133647 ) ) ( not ( = ?auto_133644 ?auto_133647 ) ) ( not ( = ?auto_133645 ?auto_133647 ) ) ( not ( = ?auto_133646 ?auto_133647 ) ) ( ON ?auto_133645 ?auto_133646 ) ( ON-TABLE ?auto_133648 ) ( ON ?auto_133647 ?auto_133648 ) ( not ( = ?auto_133648 ?auto_133647 ) ) ( not ( = ?auto_133648 ?auto_133646 ) ) ( not ( = ?auto_133648 ?auto_133645 ) ) ( not ( = ?auto_133640 ?auto_133648 ) ) ( not ( = ?auto_133641 ?auto_133648 ) ) ( not ( = ?auto_133642 ?auto_133648 ) ) ( not ( = ?auto_133643 ?auto_133648 ) ) ( not ( = ?auto_133644 ?auto_133648 ) ) ( ON ?auto_133644 ?auto_133645 ) ( CLEAR ?auto_133642 ) ( ON ?auto_133643 ?auto_133644 ) ( CLEAR ?auto_133643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133648 ?auto_133647 ?auto_133646 ?auto_133645 ?auto_133644 )
      ( MAKE-7PILE ?auto_133640 ?auto_133641 ?auto_133642 ?auto_133643 ?auto_133644 ?auto_133645 ?auto_133646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133649 - BLOCK
      ?auto_133650 - BLOCK
      ?auto_133651 - BLOCK
      ?auto_133652 - BLOCK
      ?auto_133653 - BLOCK
      ?auto_133654 - BLOCK
      ?auto_133655 - BLOCK
    )
    :vars
    (
      ?auto_133657 - BLOCK
      ?auto_133656 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133649 ) ( ON ?auto_133650 ?auto_133649 ) ( not ( = ?auto_133649 ?auto_133650 ) ) ( not ( = ?auto_133649 ?auto_133651 ) ) ( not ( = ?auto_133649 ?auto_133652 ) ) ( not ( = ?auto_133649 ?auto_133653 ) ) ( not ( = ?auto_133649 ?auto_133654 ) ) ( not ( = ?auto_133649 ?auto_133655 ) ) ( not ( = ?auto_133650 ?auto_133651 ) ) ( not ( = ?auto_133650 ?auto_133652 ) ) ( not ( = ?auto_133650 ?auto_133653 ) ) ( not ( = ?auto_133650 ?auto_133654 ) ) ( not ( = ?auto_133650 ?auto_133655 ) ) ( not ( = ?auto_133651 ?auto_133652 ) ) ( not ( = ?auto_133651 ?auto_133653 ) ) ( not ( = ?auto_133651 ?auto_133654 ) ) ( not ( = ?auto_133651 ?auto_133655 ) ) ( not ( = ?auto_133652 ?auto_133653 ) ) ( not ( = ?auto_133652 ?auto_133654 ) ) ( not ( = ?auto_133652 ?auto_133655 ) ) ( not ( = ?auto_133653 ?auto_133654 ) ) ( not ( = ?auto_133653 ?auto_133655 ) ) ( not ( = ?auto_133654 ?auto_133655 ) ) ( ON ?auto_133655 ?auto_133657 ) ( not ( = ?auto_133649 ?auto_133657 ) ) ( not ( = ?auto_133650 ?auto_133657 ) ) ( not ( = ?auto_133651 ?auto_133657 ) ) ( not ( = ?auto_133652 ?auto_133657 ) ) ( not ( = ?auto_133653 ?auto_133657 ) ) ( not ( = ?auto_133654 ?auto_133657 ) ) ( not ( = ?auto_133655 ?auto_133657 ) ) ( ON ?auto_133654 ?auto_133655 ) ( ON-TABLE ?auto_133656 ) ( ON ?auto_133657 ?auto_133656 ) ( not ( = ?auto_133656 ?auto_133657 ) ) ( not ( = ?auto_133656 ?auto_133655 ) ) ( not ( = ?auto_133656 ?auto_133654 ) ) ( not ( = ?auto_133649 ?auto_133656 ) ) ( not ( = ?auto_133650 ?auto_133656 ) ) ( not ( = ?auto_133651 ?auto_133656 ) ) ( not ( = ?auto_133652 ?auto_133656 ) ) ( not ( = ?auto_133653 ?auto_133656 ) ) ( ON ?auto_133653 ?auto_133654 ) ( ON ?auto_133652 ?auto_133653 ) ( CLEAR ?auto_133652 ) ( HOLDING ?auto_133651 ) ( CLEAR ?auto_133650 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133649 ?auto_133650 ?auto_133651 )
      ( MAKE-7PILE ?auto_133649 ?auto_133650 ?auto_133651 ?auto_133652 ?auto_133653 ?auto_133654 ?auto_133655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133658 - BLOCK
      ?auto_133659 - BLOCK
      ?auto_133660 - BLOCK
      ?auto_133661 - BLOCK
      ?auto_133662 - BLOCK
      ?auto_133663 - BLOCK
      ?auto_133664 - BLOCK
    )
    :vars
    (
      ?auto_133665 - BLOCK
      ?auto_133666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133658 ) ( ON ?auto_133659 ?auto_133658 ) ( not ( = ?auto_133658 ?auto_133659 ) ) ( not ( = ?auto_133658 ?auto_133660 ) ) ( not ( = ?auto_133658 ?auto_133661 ) ) ( not ( = ?auto_133658 ?auto_133662 ) ) ( not ( = ?auto_133658 ?auto_133663 ) ) ( not ( = ?auto_133658 ?auto_133664 ) ) ( not ( = ?auto_133659 ?auto_133660 ) ) ( not ( = ?auto_133659 ?auto_133661 ) ) ( not ( = ?auto_133659 ?auto_133662 ) ) ( not ( = ?auto_133659 ?auto_133663 ) ) ( not ( = ?auto_133659 ?auto_133664 ) ) ( not ( = ?auto_133660 ?auto_133661 ) ) ( not ( = ?auto_133660 ?auto_133662 ) ) ( not ( = ?auto_133660 ?auto_133663 ) ) ( not ( = ?auto_133660 ?auto_133664 ) ) ( not ( = ?auto_133661 ?auto_133662 ) ) ( not ( = ?auto_133661 ?auto_133663 ) ) ( not ( = ?auto_133661 ?auto_133664 ) ) ( not ( = ?auto_133662 ?auto_133663 ) ) ( not ( = ?auto_133662 ?auto_133664 ) ) ( not ( = ?auto_133663 ?auto_133664 ) ) ( ON ?auto_133664 ?auto_133665 ) ( not ( = ?auto_133658 ?auto_133665 ) ) ( not ( = ?auto_133659 ?auto_133665 ) ) ( not ( = ?auto_133660 ?auto_133665 ) ) ( not ( = ?auto_133661 ?auto_133665 ) ) ( not ( = ?auto_133662 ?auto_133665 ) ) ( not ( = ?auto_133663 ?auto_133665 ) ) ( not ( = ?auto_133664 ?auto_133665 ) ) ( ON ?auto_133663 ?auto_133664 ) ( ON-TABLE ?auto_133666 ) ( ON ?auto_133665 ?auto_133666 ) ( not ( = ?auto_133666 ?auto_133665 ) ) ( not ( = ?auto_133666 ?auto_133664 ) ) ( not ( = ?auto_133666 ?auto_133663 ) ) ( not ( = ?auto_133658 ?auto_133666 ) ) ( not ( = ?auto_133659 ?auto_133666 ) ) ( not ( = ?auto_133660 ?auto_133666 ) ) ( not ( = ?auto_133661 ?auto_133666 ) ) ( not ( = ?auto_133662 ?auto_133666 ) ) ( ON ?auto_133662 ?auto_133663 ) ( ON ?auto_133661 ?auto_133662 ) ( CLEAR ?auto_133659 ) ( ON ?auto_133660 ?auto_133661 ) ( CLEAR ?auto_133660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133666 ?auto_133665 ?auto_133664 ?auto_133663 ?auto_133662 ?auto_133661 )
      ( MAKE-7PILE ?auto_133658 ?auto_133659 ?auto_133660 ?auto_133661 ?auto_133662 ?auto_133663 ?auto_133664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133667 - BLOCK
      ?auto_133668 - BLOCK
      ?auto_133669 - BLOCK
      ?auto_133670 - BLOCK
      ?auto_133671 - BLOCK
      ?auto_133672 - BLOCK
      ?auto_133673 - BLOCK
    )
    :vars
    (
      ?auto_133675 - BLOCK
      ?auto_133674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133667 ) ( not ( = ?auto_133667 ?auto_133668 ) ) ( not ( = ?auto_133667 ?auto_133669 ) ) ( not ( = ?auto_133667 ?auto_133670 ) ) ( not ( = ?auto_133667 ?auto_133671 ) ) ( not ( = ?auto_133667 ?auto_133672 ) ) ( not ( = ?auto_133667 ?auto_133673 ) ) ( not ( = ?auto_133668 ?auto_133669 ) ) ( not ( = ?auto_133668 ?auto_133670 ) ) ( not ( = ?auto_133668 ?auto_133671 ) ) ( not ( = ?auto_133668 ?auto_133672 ) ) ( not ( = ?auto_133668 ?auto_133673 ) ) ( not ( = ?auto_133669 ?auto_133670 ) ) ( not ( = ?auto_133669 ?auto_133671 ) ) ( not ( = ?auto_133669 ?auto_133672 ) ) ( not ( = ?auto_133669 ?auto_133673 ) ) ( not ( = ?auto_133670 ?auto_133671 ) ) ( not ( = ?auto_133670 ?auto_133672 ) ) ( not ( = ?auto_133670 ?auto_133673 ) ) ( not ( = ?auto_133671 ?auto_133672 ) ) ( not ( = ?auto_133671 ?auto_133673 ) ) ( not ( = ?auto_133672 ?auto_133673 ) ) ( ON ?auto_133673 ?auto_133675 ) ( not ( = ?auto_133667 ?auto_133675 ) ) ( not ( = ?auto_133668 ?auto_133675 ) ) ( not ( = ?auto_133669 ?auto_133675 ) ) ( not ( = ?auto_133670 ?auto_133675 ) ) ( not ( = ?auto_133671 ?auto_133675 ) ) ( not ( = ?auto_133672 ?auto_133675 ) ) ( not ( = ?auto_133673 ?auto_133675 ) ) ( ON ?auto_133672 ?auto_133673 ) ( ON-TABLE ?auto_133674 ) ( ON ?auto_133675 ?auto_133674 ) ( not ( = ?auto_133674 ?auto_133675 ) ) ( not ( = ?auto_133674 ?auto_133673 ) ) ( not ( = ?auto_133674 ?auto_133672 ) ) ( not ( = ?auto_133667 ?auto_133674 ) ) ( not ( = ?auto_133668 ?auto_133674 ) ) ( not ( = ?auto_133669 ?auto_133674 ) ) ( not ( = ?auto_133670 ?auto_133674 ) ) ( not ( = ?auto_133671 ?auto_133674 ) ) ( ON ?auto_133671 ?auto_133672 ) ( ON ?auto_133670 ?auto_133671 ) ( ON ?auto_133669 ?auto_133670 ) ( CLEAR ?auto_133669 ) ( HOLDING ?auto_133668 ) ( CLEAR ?auto_133667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133667 ?auto_133668 )
      ( MAKE-7PILE ?auto_133667 ?auto_133668 ?auto_133669 ?auto_133670 ?auto_133671 ?auto_133672 ?auto_133673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133676 - BLOCK
      ?auto_133677 - BLOCK
      ?auto_133678 - BLOCK
      ?auto_133679 - BLOCK
      ?auto_133680 - BLOCK
      ?auto_133681 - BLOCK
      ?auto_133682 - BLOCK
    )
    :vars
    (
      ?auto_133683 - BLOCK
      ?auto_133684 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133676 ) ( not ( = ?auto_133676 ?auto_133677 ) ) ( not ( = ?auto_133676 ?auto_133678 ) ) ( not ( = ?auto_133676 ?auto_133679 ) ) ( not ( = ?auto_133676 ?auto_133680 ) ) ( not ( = ?auto_133676 ?auto_133681 ) ) ( not ( = ?auto_133676 ?auto_133682 ) ) ( not ( = ?auto_133677 ?auto_133678 ) ) ( not ( = ?auto_133677 ?auto_133679 ) ) ( not ( = ?auto_133677 ?auto_133680 ) ) ( not ( = ?auto_133677 ?auto_133681 ) ) ( not ( = ?auto_133677 ?auto_133682 ) ) ( not ( = ?auto_133678 ?auto_133679 ) ) ( not ( = ?auto_133678 ?auto_133680 ) ) ( not ( = ?auto_133678 ?auto_133681 ) ) ( not ( = ?auto_133678 ?auto_133682 ) ) ( not ( = ?auto_133679 ?auto_133680 ) ) ( not ( = ?auto_133679 ?auto_133681 ) ) ( not ( = ?auto_133679 ?auto_133682 ) ) ( not ( = ?auto_133680 ?auto_133681 ) ) ( not ( = ?auto_133680 ?auto_133682 ) ) ( not ( = ?auto_133681 ?auto_133682 ) ) ( ON ?auto_133682 ?auto_133683 ) ( not ( = ?auto_133676 ?auto_133683 ) ) ( not ( = ?auto_133677 ?auto_133683 ) ) ( not ( = ?auto_133678 ?auto_133683 ) ) ( not ( = ?auto_133679 ?auto_133683 ) ) ( not ( = ?auto_133680 ?auto_133683 ) ) ( not ( = ?auto_133681 ?auto_133683 ) ) ( not ( = ?auto_133682 ?auto_133683 ) ) ( ON ?auto_133681 ?auto_133682 ) ( ON-TABLE ?auto_133684 ) ( ON ?auto_133683 ?auto_133684 ) ( not ( = ?auto_133684 ?auto_133683 ) ) ( not ( = ?auto_133684 ?auto_133682 ) ) ( not ( = ?auto_133684 ?auto_133681 ) ) ( not ( = ?auto_133676 ?auto_133684 ) ) ( not ( = ?auto_133677 ?auto_133684 ) ) ( not ( = ?auto_133678 ?auto_133684 ) ) ( not ( = ?auto_133679 ?auto_133684 ) ) ( not ( = ?auto_133680 ?auto_133684 ) ) ( ON ?auto_133680 ?auto_133681 ) ( ON ?auto_133679 ?auto_133680 ) ( ON ?auto_133678 ?auto_133679 ) ( CLEAR ?auto_133676 ) ( ON ?auto_133677 ?auto_133678 ) ( CLEAR ?auto_133677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133684 ?auto_133683 ?auto_133682 ?auto_133681 ?auto_133680 ?auto_133679 ?auto_133678 )
      ( MAKE-7PILE ?auto_133676 ?auto_133677 ?auto_133678 ?auto_133679 ?auto_133680 ?auto_133681 ?auto_133682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133685 - BLOCK
      ?auto_133686 - BLOCK
      ?auto_133687 - BLOCK
      ?auto_133688 - BLOCK
      ?auto_133689 - BLOCK
      ?auto_133690 - BLOCK
      ?auto_133691 - BLOCK
    )
    :vars
    (
      ?auto_133692 - BLOCK
      ?auto_133693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133685 ?auto_133686 ) ) ( not ( = ?auto_133685 ?auto_133687 ) ) ( not ( = ?auto_133685 ?auto_133688 ) ) ( not ( = ?auto_133685 ?auto_133689 ) ) ( not ( = ?auto_133685 ?auto_133690 ) ) ( not ( = ?auto_133685 ?auto_133691 ) ) ( not ( = ?auto_133686 ?auto_133687 ) ) ( not ( = ?auto_133686 ?auto_133688 ) ) ( not ( = ?auto_133686 ?auto_133689 ) ) ( not ( = ?auto_133686 ?auto_133690 ) ) ( not ( = ?auto_133686 ?auto_133691 ) ) ( not ( = ?auto_133687 ?auto_133688 ) ) ( not ( = ?auto_133687 ?auto_133689 ) ) ( not ( = ?auto_133687 ?auto_133690 ) ) ( not ( = ?auto_133687 ?auto_133691 ) ) ( not ( = ?auto_133688 ?auto_133689 ) ) ( not ( = ?auto_133688 ?auto_133690 ) ) ( not ( = ?auto_133688 ?auto_133691 ) ) ( not ( = ?auto_133689 ?auto_133690 ) ) ( not ( = ?auto_133689 ?auto_133691 ) ) ( not ( = ?auto_133690 ?auto_133691 ) ) ( ON ?auto_133691 ?auto_133692 ) ( not ( = ?auto_133685 ?auto_133692 ) ) ( not ( = ?auto_133686 ?auto_133692 ) ) ( not ( = ?auto_133687 ?auto_133692 ) ) ( not ( = ?auto_133688 ?auto_133692 ) ) ( not ( = ?auto_133689 ?auto_133692 ) ) ( not ( = ?auto_133690 ?auto_133692 ) ) ( not ( = ?auto_133691 ?auto_133692 ) ) ( ON ?auto_133690 ?auto_133691 ) ( ON-TABLE ?auto_133693 ) ( ON ?auto_133692 ?auto_133693 ) ( not ( = ?auto_133693 ?auto_133692 ) ) ( not ( = ?auto_133693 ?auto_133691 ) ) ( not ( = ?auto_133693 ?auto_133690 ) ) ( not ( = ?auto_133685 ?auto_133693 ) ) ( not ( = ?auto_133686 ?auto_133693 ) ) ( not ( = ?auto_133687 ?auto_133693 ) ) ( not ( = ?auto_133688 ?auto_133693 ) ) ( not ( = ?auto_133689 ?auto_133693 ) ) ( ON ?auto_133689 ?auto_133690 ) ( ON ?auto_133688 ?auto_133689 ) ( ON ?auto_133687 ?auto_133688 ) ( ON ?auto_133686 ?auto_133687 ) ( CLEAR ?auto_133686 ) ( HOLDING ?auto_133685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133685 )
      ( MAKE-7PILE ?auto_133685 ?auto_133686 ?auto_133687 ?auto_133688 ?auto_133689 ?auto_133690 ?auto_133691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133694 - BLOCK
      ?auto_133695 - BLOCK
      ?auto_133696 - BLOCK
      ?auto_133697 - BLOCK
      ?auto_133698 - BLOCK
      ?auto_133699 - BLOCK
      ?auto_133700 - BLOCK
    )
    :vars
    (
      ?auto_133701 - BLOCK
      ?auto_133702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133694 ?auto_133695 ) ) ( not ( = ?auto_133694 ?auto_133696 ) ) ( not ( = ?auto_133694 ?auto_133697 ) ) ( not ( = ?auto_133694 ?auto_133698 ) ) ( not ( = ?auto_133694 ?auto_133699 ) ) ( not ( = ?auto_133694 ?auto_133700 ) ) ( not ( = ?auto_133695 ?auto_133696 ) ) ( not ( = ?auto_133695 ?auto_133697 ) ) ( not ( = ?auto_133695 ?auto_133698 ) ) ( not ( = ?auto_133695 ?auto_133699 ) ) ( not ( = ?auto_133695 ?auto_133700 ) ) ( not ( = ?auto_133696 ?auto_133697 ) ) ( not ( = ?auto_133696 ?auto_133698 ) ) ( not ( = ?auto_133696 ?auto_133699 ) ) ( not ( = ?auto_133696 ?auto_133700 ) ) ( not ( = ?auto_133697 ?auto_133698 ) ) ( not ( = ?auto_133697 ?auto_133699 ) ) ( not ( = ?auto_133697 ?auto_133700 ) ) ( not ( = ?auto_133698 ?auto_133699 ) ) ( not ( = ?auto_133698 ?auto_133700 ) ) ( not ( = ?auto_133699 ?auto_133700 ) ) ( ON ?auto_133700 ?auto_133701 ) ( not ( = ?auto_133694 ?auto_133701 ) ) ( not ( = ?auto_133695 ?auto_133701 ) ) ( not ( = ?auto_133696 ?auto_133701 ) ) ( not ( = ?auto_133697 ?auto_133701 ) ) ( not ( = ?auto_133698 ?auto_133701 ) ) ( not ( = ?auto_133699 ?auto_133701 ) ) ( not ( = ?auto_133700 ?auto_133701 ) ) ( ON ?auto_133699 ?auto_133700 ) ( ON-TABLE ?auto_133702 ) ( ON ?auto_133701 ?auto_133702 ) ( not ( = ?auto_133702 ?auto_133701 ) ) ( not ( = ?auto_133702 ?auto_133700 ) ) ( not ( = ?auto_133702 ?auto_133699 ) ) ( not ( = ?auto_133694 ?auto_133702 ) ) ( not ( = ?auto_133695 ?auto_133702 ) ) ( not ( = ?auto_133696 ?auto_133702 ) ) ( not ( = ?auto_133697 ?auto_133702 ) ) ( not ( = ?auto_133698 ?auto_133702 ) ) ( ON ?auto_133698 ?auto_133699 ) ( ON ?auto_133697 ?auto_133698 ) ( ON ?auto_133696 ?auto_133697 ) ( ON ?auto_133695 ?auto_133696 ) ( ON ?auto_133694 ?auto_133695 ) ( CLEAR ?auto_133694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133702 ?auto_133701 ?auto_133700 ?auto_133699 ?auto_133698 ?auto_133697 ?auto_133696 ?auto_133695 )
      ( MAKE-7PILE ?auto_133694 ?auto_133695 ?auto_133696 ?auto_133697 ?auto_133698 ?auto_133699 ?auto_133700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133704 - BLOCK
    )
    :vars
    (
      ?auto_133705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133705 ?auto_133704 ) ( CLEAR ?auto_133705 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133704 ) ( not ( = ?auto_133704 ?auto_133705 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133705 ?auto_133704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133706 - BLOCK
    )
    :vars
    (
      ?auto_133707 - BLOCK
      ?auto_133708 - BLOCK
      ?auto_133709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133707 ?auto_133706 ) ( CLEAR ?auto_133707 ) ( ON-TABLE ?auto_133706 ) ( not ( = ?auto_133706 ?auto_133707 ) ) ( HOLDING ?auto_133708 ) ( CLEAR ?auto_133709 ) ( not ( = ?auto_133706 ?auto_133708 ) ) ( not ( = ?auto_133706 ?auto_133709 ) ) ( not ( = ?auto_133707 ?auto_133708 ) ) ( not ( = ?auto_133707 ?auto_133709 ) ) ( not ( = ?auto_133708 ?auto_133709 ) ) )
    :subtasks
    ( ( !STACK ?auto_133708 ?auto_133709 )
      ( MAKE-1PILE ?auto_133706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133710 - BLOCK
    )
    :vars
    (
      ?auto_133711 - BLOCK
      ?auto_133713 - BLOCK
      ?auto_133712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133711 ?auto_133710 ) ( ON-TABLE ?auto_133710 ) ( not ( = ?auto_133710 ?auto_133711 ) ) ( CLEAR ?auto_133713 ) ( not ( = ?auto_133710 ?auto_133712 ) ) ( not ( = ?auto_133710 ?auto_133713 ) ) ( not ( = ?auto_133711 ?auto_133712 ) ) ( not ( = ?auto_133711 ?auto_133713 ) ) ( not ( = ?auto_133712 ?auto_133713 ) ) ( ON ?auto_133712 ?auto_133711 ) ( CLEAR ?auto_133712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133710 ?auto_133711 )
      ( MAKE-1PILE ?auto_133710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133714 - BLOCK
    )
    :vars
    (
      ?auto_133716 - BLOCK
      ?auto_133715 - BLOCK
      ?auto_133717 - BLOCK
      ?auto_133719 - BLOCK
      ?auto_133721 - BLOCK
      ?auto_133720 - BLOCK
      ?auto_133718 - BLOCK
      ?auto_133722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133716 ?auto_133714 ) ( ON-TABLE ?auto_133714 ) ( not ( = ?auto_133714 ?auto_133716 ) ) ( not ( = ?auto_133714 ?auto_133715 ) ) ( not ( = ?auto_133714 ?auto_133717 ) ) ( not ( = ?auto_133716 ?auto_133715 ) ) ( not ( = ?auto_133716 ?auto_133717 ) ) ( not ( = ?auto_133715 ?auto_133717 ) ) ( ON ?auto_133715 ?auto_133716 ) ( CLEAR ?auto_133715 ) ( HOLDING ?auto_133717 ) ( CLEAR ?auto_133719 ) ( ON-TABLE ?auto_133721 ) ( ON ?auto_133720 ?auto_133721 ) ( ON ?auto_133718 ?auto_133720 ) ( ON ?auto_133722 ?auto_133718 ) ( ON ?auto_133719 ?auto_133722 ) ( not ( = ?auto_133721 ?auto_133720 ) ) ( not ( = ?auto_133721 ?auto_133718 ) ) ( not ( = ?auto_133721 ?auto_133722 ) ) ( not ( = ?auto_133721 ?auto_133719 ) ) ( not ( = ?auto_133721 ?auto_133717 ) ) ( not ( = ?auto_133720 ?auto_133718 ) ) ( not ( = ?auto_133720 ?auto_133722 ) ) ( not ( = ?auto_133720 ?auto_133719 ) ) ( not ( = ?auto_133720 ?auto_133717 ) ) ( not ( = ?auto_133718 ?auto_133722 ) ) ( not ( = ?auto_133718 ?auto_133719 ) ) ( not ( = ?auto_133718 ?auto_133717 ) ) ( not ( = ?auto_133722 ?auto_133719 ) ) ( not ( = ?auto_133722 ?auto_133717 ) ) ( not ( = ?auto_133719 ?auto_133717 ) ) ( not ( = ?auto_133714 ?auto_133719 ) ) ( not ( = ?auto_133714 ?auto_133721 ) ) ( not ( = ?auto_133714 ?auto_133720 ) ) ( not ( = ?auto_133714 ?auto_133718 ) ) ( not ( = ?auto_133714 ?auto_133722 ) ) ( not ( = ?auto_133716 ?auto_133719 ) ) ( not ( = ?auto_133716 ?auto_133721 ) ) ( not ( = ?auto_133716 ?auto_133720 ) ) ( not ( = ?auto_133716 ?auto_133718 ) ) ( not ( = ?auto_133716 ?auto_133722 ) ) ( not ( = ?auto_133715 ?auto_133719 ) ) ( not ( = ?auto_133715 ?auto_133721 ) ) ( not ( = ?auto_133715 ?auto_133720 ) ) ( not ( = ?auto_133715 ?auto_133718 ) ) ( not ( = ?auto_133715 ?auto_133722 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133721 ?auto_133720 ?auto_133718 ?auto_133722 ?auto_133719 ?auto_133717 )
      ( MAKE-1PILE ?auto_133714 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133723 - BLOCK
    )
    :vars
    (
      ?auto_133726 - BLOCK
      ?auto_133730 - BLOCK
      ?auto_133725 - BLOCK
      ?auto_133731 - BLOCK
      ?auto_133724 - BLOCK
      ?auto_133727 - BLOCK
      ?auto_133728 - BLOCK
      ?auto_133729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133726 ?auto_133723 ) ( ON-TABLE ?auto_133723 ) ( not ( = ?auto_133723 ?auto_133726 ) ) ( not ( = ?auto_133723 ?auto_133730 ) ) ( not ( = ?auto_133723 ?auto_133725 ) ) ( not ( = ?auto_133726 ?auto_133730 ) ) ( not ( = ?auto_133726 ?auto_133725 ) ) ( not ( = ?auto_133730 ?auto_133725 ) ) ( ON ?auto_133730 ?auto_133726 ) ( CLEAR ?auto_133731 ) ( ON-TABLE ?auto_133724 ) ( ON ?auto_133727 ?auto_133724 ) ( ON ?auto_133728 ?auto_133727 ) ( ON ?auto_133729 ?auto_133728 ) ( ON ?auto_133731 ?auto_133729 ) ( not ( = ?auto_133724 ?auto_133727 ) ) ( not ( = ?auto_133724 ?auto_133728 ) ) ( not ( = ?auto_133724 ?auto_133729 ) ) ( not ( = ?auto_133724 ?auto_133731 ) ) ( not ( = ?auto_133724 ?auto_133725 ) ) ( not ( = ?auto_133727 ?auto_133728 ) ) ( not ( = ?auto_133727 ?auto_133729 ) ) ( not ( = ?auto_133727 ?auto_133731 ) ) ( not ( = ?auto_133727 ?auto_133725 ) ) ( not ( = ?auto_133728 ?auto_133729 ) ) ( not ( = ?auto_133728 ?auto_133731 ) ) ( not ( = ?auto_133728 ?auto_133725 ) ) ( not ( = ?auto_133729 ?auto_133731 ) ) ( not ( = ?auto_133729 ?auto_133725 ) ) ( not ( = ?auto_133731 ?auto_133725 ) ) ( not ( = ?auto_133723 ?auto_133731 ) ) ( not ( = ?auto_133723 ?auto_133724 ) ) ( not ( = ?auto_133723 ?auto_133727 ) ) ( not ( = ?auto_133723 ?auto_133728 ) ) ( not ( = ?auto_133723 ?auto_133729 ) ) ( not ( = ?auto_133726 ?auto_133731 ) ) ( not ( = ?auto_133726 ?auto_133724 ) ) ( not ( = ?auto_133726 ?auto_133727 ) ) ( not ( = ?auto_133726 ?auto_133728 ) ) ( not ( = ?auto_133726 ?auto_133729 ) ) ( not ( = ?auto_133730 ?auto_133731 ) ) ( not ( = ?auto_133730 ?auto_133724 ) ) ( not ( = ?auto_133730 ?auto_133727 ) ) ( not ( = ?auto_133730 ?auto_133728 ) ) ( not ( = ?auto_133730 ?auto_133729 ) ) ( ON ?auto_133725 ?auto_133730 ) ( CLEAR ?auto_133725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133723 ?auto_133726 ?auto_133730 )
      ( MAKE-1PILE ?auto_133723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133732 - BLOCK
    )
    :vars
    (
      ?auto_133740 - BLOCK
      ?auto_133739 - BLOCK
      ?auto_133733 - BLOCK
      ?auto_133734 - BLOCK
      ?auto_133738 - BLOCK
      ?auto_133736 - BLOCK
      ?auto_133737 - BLOCK
      ?auto_133735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133740 ?auto_133732 ) ( ON-TABLE ?auto_133732 ) ( not ( = ?auto_133732 ?auto_133740 ) ) ( not ( = ?auto_133732 ?auto_133739 ) ) ( not ( = ?auto_133732 ?auto_133733 ) ) ( not ( = ?auto_133740 ?auto_133739 ) ) ( not ( = ?auto_133740 ?auto_133733 ) ) ( not ( = ?auto_133739 ?auto_133733 ) ) ( ON ?auto_133739 ?auto_133740 ) ( ON-TABLE ?auto_133734 ) ( ON ?auto_133738 ?auto_133734 ) ( ON ?auto_133736 ?auto_133738 ) ( ON ?auto_133737 ?auto_133736 ) ( not ( = ?auto_133734 ?auto_133738 ) ) ( not ( = ?auto_133734 ?auto_133736 ) ) ( not ( = ?auto_133734 ?auto_133737 ) ) ( not ( = ?auto_133734 ?auto_133735 ) ) ( not ( = ?auto_133734 ?auto_133733 ) ) ( not ( = ?auto_133738 ?auto_133736 ) ) ( not ( = ?auto_133738 ?auto_133737 ) ) ( not ( = ?auto_133738 ?auto_133735 ) ) ( not ( = ?auto_133738 ?auto_133733 ) ) ( not ( = ?auto_133736 ?auto_133737 ) ) ( not ( = ?auto_133736 ?auto_133735 ) ) ( not ( = ?auto_133736 ?auto_133733 ) ) ( not ( = ?auto_133737 ?auto_133735 ) ) ( not ( = ?auto_133737 ?auto_133733 ) ) ( not ( = ?auto_133735 ?auto_133733 ) ) ( not ( = ?auto_133732 ?auto_133735 ) ) ( not ( = ?auto_133732 ?auto_133734 ) ) ( not ( = ?auto_133732 ?auto_133738 ) ) ( not ( = ?auto_133732 ?auto_133736 ) ) ( not ( = ?auto_133732 ?auto_133737 ) ) ( not ( = ?auto_133740 ?auto_133735 ) ) ( not ( = ?auto_133740 ?auto_133734 ) ) ( not ( = ?auto_133740 ?auto_133738 ) ) ( not ( = ?auto_133740 ?auto_133736 ) ) ( not ( = ?auto_133740 ?auto_133737 ) ) ( not ( = ?auto_133739 ?auto_133735 ) ) ( not ( = ?auto_133739 ?auto_133734 ) ) ( not ( = ?auto_133739 ?auto_133738 ) ) ( not ( = ?auto_133739 ?auto_133736 ) ) ( not ( = ?auto_133739 ?auto_133737 ) ) ( ON ?auto_133733 ?auto_133739 ) ( CLEAR ?auto_133733 ) ( HOLDING ?auto_133735 ) ( CLEAR ?auto_133737 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133734 ?auto_133738 ?auto_133736 ?auto_133737 ?auto_133735 )
      ( MAKE-1PILE ?auto_133732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133741 - BLOCK
    )
    :vars
    (
      ?auto_133743 - BLOCK
      ?auto_133742 - BLOCK
      ?auto_133744 - BLOCK
      ?auto_133748 - BLOCK
      ?auto_133747 - BLOCK
      ?auto_133746 - BLOCK
      ?auto_133745 - BLOCK
      ?auto_133749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133743 ?auto_133741 ) ( ON-TABLE ?auto_133741 ) ( not ( = ?auto_133741 ?auto_133743 ) ) ( not ( = ?auto_133741 ?auto_133742 ) ) ( not ( = ?auto_133741 ?auto_133744 ) ) ( not ( = ?auto_133743 ?auto_133742 ) ) ( not ( = ?auto_133743 ?auto_133744 ) ) ( not ( = ?auto_133742 ?auto_133744 ) ) ( ON ?auto_133742 ?auto_133743 ) ( ON-TABLE ?auto_133748 ) ( ON ?auto_133747 ?auto_133748 ) ( ON ?auto_133746 ?auto_133747 ) ( ON ?auto_133745 ?auto_133746 ) ( not ( = ?auto_133748 ?auto_133747 ) ) ( not ( = ?auto_133748 ?auto_133746 ) ) ( not ( = ?auto_133748 ?auto_133745 ) ) ( not ( = ?auto_133748 ?auto_133749 ) ) ( not ( = ?auto_133748 ?auto_133744 ) ) ( not ( = ?auto_133747 ?auto_133746 ) ) ( not ( = ?auto_133747 ?auto_133745 ) ) ( not ( = ?auto_133747 ?auto_133749 ) ) ( not ( = ?auto_133747 ?auto_133744 ) ) ( not ( = ?auto_133746 ?auto_133745 ) ) ( not ( = ?auto_133746 ?auto_133749 ) ) ( not ( = ?auto_133746 ?auto_133744 ) ) ( not ( = ?auto_133745 ?auto_133749 ) ) ( not ( = ?auto_133745 ?auto_133744 ) ) ( not ( = ?auto_133749 ?auto_133744 ) ) ( not ( = ?auto_133741 ?auto_133749 ) ) ( not ( = ?auto_133741 ?auto_133748 ) ) ( not ( = ?auto_133741 ?auto_133747 ) ) ( not ( = ?auto_133741 ?auto_133746 ) ) ( not ( = ?auto_133741 ?auto_133745 ) ) ( not ( = ?auto_133743 ?auto_133749 ) ) ( not ( = ?auto_133743 ?auto_133748 ) ) ( not ( = ?auto_133743 ?auto_133747 ) ) ( not ( = ?auto_133743 ?auto_133746 ) ) ( not ( = ?auto_133743 ?auto_133745 ) ) ( not ( = ?auto_133742 ?auto_133749 ) ) ( not ( = ?auto_133742 ?auto_133748 ) ) ( not ( = ?auto_133742 ?auto_133747 ) ) ( not ( = ?auto_133742 ?auto_133746 ) ) ( not ( = ?auto_133742 ?auto_133745 ) ) ( ON ?auto_133744 ?auto_133742 ) ( CLEAR ?auto_133745 ) ( ON ?auto_133749 ?auto_133744 ) ( CLEAR ?auto_133749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133741 ?auto_133743 ?auto_133742 ?auto_133744 )
      ( MAKE-1PILE ?auto_133741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133750 - BLOCK
    )
    :vars
    (
      ?auto_133757 - BLOCK
      ?auto_133752 - BLOCK
      ?auto_133751 - BLOCK
      ?auto_133753 - BLOCK
      ?auto_133754 - BLOCK
      ?auto_133755 - BLOCK
      ?auto_133756 - BLOCK
      ?auto_133758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133757 ?auto_133750 ) ( ON-TABLE ?auto_133750 ) ( not ( = ?auto_133750 ?auto_133757 ) ) ( not ( = ?auto_133750 ?auto_133752 ) ) ( not ( = ?auto_133750 ?auto_133751 ) ) ( not ( = ?auto_133757 ?auto_133752 ) ) ( not ( = ?auto_133757 ?auto_133751 ) ) ( not ( = ?auto_133752 ?auto_133751 ) ) ( ON ?auto_133752 ?auto_133757 ) ( ON-TABLE ?auto_133753 ) ( ON ?auto_133754 ?auto_133753 ) ( ON ?auto_133755 ?auto_133754 ) ( not ( = ?auto_133753 ?auto_133754 ) ) ( not ( = ?auto_133753 ?auto_133755 ) ) ( not ( = ?auto_133753 ?auto_133756 ) ) ( not ( = ?auto_133753 ?auto_133758 ) ) ( not ( = ?auto_133753 ?auto_133751 ) ) ( not ( = ?auto_133754 ?auto_133755 ) ) ( not ( = ?auto_133754 ?auto_133756 ) ) ( not ( = ?auto_133754 ?auto_133758 ) ) ( not ( = ?auto_133754 ?auto_133751 ) ) ( not ( = ?auto_133755 ?auto_133756 ) ) ( not ( = ?auto_133755 ?auto_133758 ) ) ( not ( = ?auto_133755 ?auto_133751 ) ) ( not ( = ?auto_133756 ?auto_133758 ) ) ( not ( = ?auto_133756 ?auto_133751 ) ) ( not ( = ?auto_133758 ?auto_133751 ) ) ( not ( = ?auto_133750 ?auto_133758 ) ) ( not ( = ?auto_133750 ?auto_133753 ) ) ( not ( = ?auto_133750 ?auto_133754 ) ) ( not ( = ?auto_133750 ?auto_133755 ) ) ( not ( = ?auto_133750 ?auto_133756 ) ) ( not ( = ?auto_133757 ?auto_133758 ) ) ( not ( = ?auto_133757 ?auto_133753 ) ) ( not ( = ?auto_133757 ?auto_133754 ) ) ( not ( = ?auto_133757 ?auto_133755 ) ) ( not ( = ?auto_133757 ?auto_133756 ) ) ( not ( = ?auto_133752 ?auto_133758 ) ) ( not ( = ?auto_133752 ?auto_133753 ) ) ( not ( = ?auto_133752 ?auto_133754 ) ) ( not ( = ?auto_133752 ?auto_133755 ) ) ( not ( = ?auto_133752 ?auto_133756 ) ) ( ON ?auto_133751 ?auto_133752 ) ( ON ?auto_133758 ?auto_133751 ) ( CLEAR ?auto_133758 ) ( HOLDING ?auto_133756 ) ( CLEAR ?auto_133755 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133753 ?auto_133754 ?auto_133755 ?auto_133756 )
      ( MAKE-1PILE ?auto_133750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133759 - BLOCK
    )
    :vars
    (
      ?auto_133765 - BLOCK
      ?auto_133762 - BLOCK
      ?auto_133761 - BLOCK
      ?auto_133760 - BLOCK
      ?auto_133764 - BLOCK
      ?auto_133763 - BLOCK
      ?auto_133766 - BLOCK
      ?auto_133767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133765 ?auto_133759 ) ( ON-TABLE ?auto_133759 ) ( not ( = ?auto_133759 ?auto_133765 ) ) ( not ( = ?auto_133759 ?auto_133762 ) ) ( not ( = ?auto_133759 ?auto_133761 ) ) ( not ( = ?auto_133765 ?auto_133762 ) ) ( not ( = ?auto_133765 ?auto_133761 ) ) ( not ( = ?auto_133762 ?auto_133761 ) ) ( ON ?auto_133762 ?auto_133765 ) ( ON-TABLE ?auto_133760 ) ( ON ?auto_133764 ?auto_133760 ) ( ON ?auto_133763 ?auto_133764 ) ( not ( = ?auto_133760 ?auto_133764 ) ) ( not ( = ?auto_133760 ?auto_133763 ) ) ( not ( = ?auto_133760 ?auto_133766 ) ) ( not ( = ?auto_133760 ?auto_133767 ) ) ( not ( = ?auto_133760 ?auto_133761 ) ) ( not ( = ?auto_133764 ?auto_133763 ) ) ( not ( = ?auto_133764 ?auto_133766 ) ) ( not ( = ?auto_133764 ?auto_133767 ) ) ( not ( = ?auto_133764 ?auto_133761 ) ) ( not ( = ?auto_133763 ?auto_133766 ) ) ( not ( = ?auto_133763 ?auto_133767 ) ) ( not ( = ?auto_133763 ?auto_133761 ) ) ( not ( = ?auto_133766 ?auto_133767 ) ) ( not ( = ?auto_133766 ?auto_133761 ) ) ( not ( = ?auto_133767 ?auto_133761 ) ) ( not ( = ?auto_133759 ?auto_133767 ) ) ( not ( = ?auto_133759 ?auto_133760 ) ) ( not ( = ?auto_133759 ?auto_133764 ) ) ( not ( = ?auto_133759 ?auto_133763 ) ) ( not ( = ?auto_133759 ?auto_133766 ) ) ( not ( = ?auto_133765 ?auto_133767 ) ) ( not ( = ?auto_133765 ?auto_133760 ) ) ( not ( = ?auto_133765 ?auto_133764 ) ) ( not ( = ?auto_133765 ?auto_133763 ) ) ( not ( = ?auto_133765 ?auto_133766 ) ) ( not ( = ?auto_133762 ?auto_133767 ) ) ( not ( = ?auto_133762 ?auto_133760 ) ) ( not ( = ?auto_133762 ?auto_133764 ) ) ( not ( = ?auto_133762 ?auto_133763 ) ) ( not ( = ?auto_133762 ?auto_133766 ) ) ( ON ?auto_133761 ?auto_133762 ) ( ON ?auto_133767 ?auto_133761 ) ( CLEAR ?auto_133763 ) ( ON ?auto_133766 ?auto_133767 ) ( CLEAR ?auto_133766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133759 ?auto_133765 ?auto_133762 ?auto_133761 ?auto_133767 )
      ( MAKE-1PILE ?auto_133759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133768 - BLOCK
    )
    :vars
    (
      ?auto_133774 - BLOCK
      ?auto_133773 - BLOCK
      ?auto_133770 - BLOCK
      ?auto_133769 - BLOCK
      ?auto_133771 - BLOCK
      ?auto_133776 - BLOCK
      ?auto_133775 - BLOCK
      ?auto_133772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133774 ?auto_133768 ) ( ON-TABLE ?auto_133768 ) ( not ( = ?auto_133768 ?auto_133774 ) ) ( not ( = ?auto_133768 ?auto_133773 ) ) ( not ( = ?auto_133768 ?auto_133770 ) ) ( not ( = ?auto_133774 ?auto_133773 ) ) ( not ( = ?auto_133774 ?auto_133770 ) ) ( not ( = ?auto_133773 ?auto_133770 ) ) ( ON ?auto_133773 ?auto_133774 ) ( ON-TABLE ?auto_133769 ) ( ON ?auto_133771 ?auto_133769 ) ( not ( = ?auto_133769 ?auto_133771 ) ) ( not ( = ?auto_133769 ?auto_133776 ) ) ( not ( = ?auto_133769 ?auto_133775 ) ) ( not ( = ?auto_133769 ?auto_133772 ) ) ( not ( = ?auto_133769 ?auto_133770 ) ) ( not ( = ?auto_133771 ?auto_133776 ) ) ( not ( = ?auto_133771 ?auto_133775 ) ) ( not ( = ?auto_133771 ?auto_133772 ) ) ( not ( = ?auto_133771 ?auto_133770 ) ) ( not ( = ?auto_133776 ?auto_133775 ) ) ( not ( = ?auto_133776 ?auto_133772 ) ) ( not ( = ?auto_133776 ?auto_133770 ) ) ( not ( = ?auto_133775 ?auto_133772 ) ) ( not ( = ?auto_133775 ?auto_133770 ) ) ( not ( = ?auto_133772 ?auto_133770 ) ) ( not ( = ?auto_133768 ?auto_133772 ) ) ( not ( = ?auto_133768 ?auto_133769 ) ) ( not ( = ?auto_133768 ?auto_133771 ) ) ( not ( = ?auto_133768 ?auto_133776 ) ) ( not ( = ?auto_133768 ?auto_133775 ) ) ( not ( = ?auto_133774 ?auto_133772 ) ) ( not ( = ?auto_133774 ?auto_133769 ) ) ( not ( = ?auto_133774 ?auto_133771 ) ) ( not ( = ?auto_133774 ?auto_133776 ) ) ( not ( = ?auto_133774 ?auto_133775 ) ) ( not ( = ?auto_133773 ?auto_133772 ) ) ( not ( = ?auto_133773 ?auto_133769 ) ) ( not ( = ?auto_133773 ?auto_133771 ) ) ( not ( = ?auto_133773 ?auto_133776 ) ) ( not ( = ?auto_133773 ?auto_133775 ) ) ( ON ?auto_133770 ?auto_133773 ) ( ON ?auto_133772 ?auto_133770 ) ( ON ?auto_133775 ?auto_133772 ) ( CLEAR ?auto_133775 ) ( HOLDING ?auto_133776 ) ( CLEAR ?auto_133771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133769 ?auto_133771 ?auto_133776 )
      ( MAKE-1PILE ?auto_133768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133777 - BLOCK
    )
    :vars
    (
      ?auto_133782 - BLOCK
      ?auto_133785 - BLOCK
      ?auto_133784 - BLOCK
      ?auto_133778 - BLOCK
      ?auto_133781 - BLOCK
      ?auto_133780 - BLOCK
      ?auto_133783 - BLOCK
      ?auto_133779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133782 ?auto_133777 ) ( ON-TABLE ?auto_133777 ) ( not ( = ?auto_133777 ?auto_133782 ) ) ( not ( = ?auto_133777 ?auto_133785 ) ) ( not ( = ?auto_133777 ?auto_133784 ) ) ( not ( = ?auto_133782 ?auto_133785 ) ) ( not ( = ?auto_133782 ?auto_133784 ) ) ( not ( = ?auto_133785 ?auto_133784 ) ) ( ON ?auto_133785 ?auto_133782 ) ( ON-TABLE ?auto_133778 ) ( ON ?auto_133781 ?auto_133778 ) ( not ( = ?auto_133778 ?auto_133781 ) ) ( not ( = ?auto_133778 ?auto_133780 ) ) ( not ( = ?auto_133778 ?auto_133783 ) ) ( not ( = ?auto_133778 ?auto_133779 ) ) ( not ( = ?auto_133778 ?auto_133784 ) ) ( not ( = ?auto_133781 ?auto_133780 ) ) ( not ( = ?auto_133781 ?auto_133783 ) ) ( not ( = ?auto_133781 ?auto_133779 ) ) ( not ( = ?auto_133781 ?auto_133784 ) ) ( not ( = ?auto_133780 ?auto_133783 ) ) ( not ( = ?auto_133780 ?auto_133779 ) ) ( not ( = ?auto_133780 ?auto_133784 ) ) ( not ( = ?auto_133783 ?auto_133779 ) ) ( not ( = ?auto_133783 ?auto_133784 ) ) ( not ( = ?auto_133779 ?auto_133784 ) ) ( not ( = ?auto_133777 ?auto_133779 ) ) ( not ( = ?auto_133777 ?auto_133778 ) ) ( not ( = ?auto_133777 ?auto_133781 ) ) ( not ( = ?auto_133777 ?auto_133780 ) ) ( not ( = ?auto_133777 ?auto_133783 ) ) ( not ( = ?auto_133782 ?auto_133779 ) ) ( not ( = ?auto_133782 ?auto_133778 ) ) ( not ( = ?auto_133782 ?auto_133781 ) ) ( not ( = ?auto_133782 ?auto_133780 ) ) ( not ( = ?auto_133782 ?auto_133783 ) ) ( not ( = ?auto_133785 ?auto_133779 ) ) ( not ( = ?auto_133785 ?auto_133778 ) ) ( not ( = ?auto_133785 ?auto_133781 ) ) ( not ( = ?auto_133785 ?auto_133780 ) ) ( not ( = ?auto_133785 ?auto_133783 ) ) ( ON ?auto_133784 ?auto_133785 ) ( ON ?auto_133779 ?auto_133784 ) ( ON ?auto_133783 ?auto_133779 ) ( CLEAR ?auto_133781 ) ( ON ?auto_133780 ?auto_133783 ) ( CLEAR ?auto_133780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133777 ?auto_133782 ?auto_133785 ?auto_133784 ?auto_133779 ?auto_133783 )
      ( MAKE-1PILE ?auto_133777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133786 - BLOCK
    )
    :vars
    (
      ?auto_133792 - BLOCK
      ?auto_133790 - BLOCK
      ?auto_133787 - BLOCK
      ?auto_133789 - BLOCK
      ?auto_133788 - BLOCK
      ?auto_133793 - BLOCK
      ?auto_133794 - BLOCK
      ?auto_133791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133792 ?auto_133786 ) ( ON-TABLE ?auto_133786 ) ( not ( = ?auto_133786 ?auto_133792 ) ) ( not ( = ?auto_133786 ?auto_133790 ) ) ( not ( = ?auto_133786 ?auto_133787 ) ) ( not ( = ?auto_133792 ?auto_133790 ) ) ( not ( = ?auto_133792 ?auto_133787 ) ) ( not ( = ?auto_133790 ?auto_133787 ) ) ( ON ?auto_133790 ?auto_133792 ) ( ON-TABLE ?auto_133789 ) ( not ( = ?auto_133789 ?auto_133788 ) ) ( not ( = ?auto_133789 ?auto_133793 ) ) ( not ( = ?auto_133789 ?auto_133794 ) ) ( not ( = ?auto_133789 ?auto_133791 ) ) ( not ( = ?auto_133789 ?auto_133787 ) ) ( not ( = ?auto_133788 ?auto_133793 ) ) ( not ( = ?auto_133788 ?auto_133794 ) ) ( not ( = ?auto_133788 ?auto_133791 ) ) ( not ( = ?auto_133788 ?auto_133787 ) ) ( not ( = ?auto_133793 ?auto_133794 ) ) ( not ( = ?auto_133793 ?auto_133791 ) ) ( not ( = ?auto_133793 ?auto_133787 ) ) ( not ( = ?auto_133794 ?auto_133791 ) ) ( not ( = ?auto_133794 ?auto_133787 ) ) ( not ( = ?auto_133791 ?auto_133787 ) ) ( not ( = ?auto_133786 ?auto_133791 ) ) ( not ( = ?auto_133786 ?auto_133789 ) ) ( not ( = ?auto_133786 ?auto_133788 ) ) ( not ( = ?auto_133786 ?auto_133793 ) ) ( not ( = ?auto_133786 ?auto_133794 ) ) ( not ( = ?auto_133792 ?auto_133791 ) ) ( not ( = ?auto_133792 ?auto_133789 ) ) ( not ( = ?auto_133792 ?auto_133788 ) ) ( not ( = ?auto_133792 ?auto_133793 ) ) ( not ( = ?auto_133792 ?auto_133794 ) ) ( not ( = ?auto_133790 ?auto_133791 ) ) ( not ( = ?auto_133790 ?auto_133789 ) ) ( not ( = ?auto_133790 ?auto_133788 ) ) ( not ( = ?auto_133790 ?auto_133793 ) ) ( not ( = ?auto_133790 ?auto_133794 ) ) ( ON ?auto_133787 ?auto_133790 ) ( ON ?auto_133791 ?auto_133787 ) ( ON ?auto_133794 ?auto_133791 ) ( ON ?auto_133793 ?auto_133794 ) ( CLEAR ?auto_133793 ) ( HOLDING ?auto_133788 ) ( CLEAR ?auto_133789 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133789 ?auto_133788 )
      ( MAKE-1PILE ?auto_133786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133795 - BLOCK
    )
    :vars
    (
      ?auto_133798 - BLOCK
      ?auto_133800 - BLOCK
      ?auto_133796 - BLOCK
      ?auto_133803 - BLOCK
      ?auto_133802 - BLOCK
      ?auto_133801 - BLOCK
      ?auto_133799 - BLOCK
      ?auto_133797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133798 ?auto_133795 ) ( ON-TABLE ?auto_133795 ) ( not ( = ?auto_133795 ?auto_133798 ) ) ( not ( = ?auto_133795 ?auto_133800 ) ) ( not ( = ?auto_133795 ?auto_133796 ) ) ( not ( = ?auto_133798 ?auto_133800 ) ) ( not ( = ?auto_133798 ?auto_133796 ) ) ( not ( = ?auto_133800 ?auto_133796 ) ) ( ON ?auto_133800 ?auto_133798 ) ( ON-TABLE ?auto_133803 ) ( not ( = ?auto_133803 ?auto_133802 ) ) ( not ( = ?auto_133803 ?auto_133801 ) ) ( not ( = ?auto_133803 ?auto_133799 ) ) ( not ( = ?auto_133803 ?auto_133797 ) ) ( not ( = ?auto_133803 ?auto_133796 ) ) ( not ( = ?auto_133802 ?auto_133801 ) ) ( not ( = ?auto_133802 ?auto_133799 ) ) ( not ( = ?auto_133802 ?auto_133797 ) ) ( not ( = ?auto_133802 ?auto_133796 ) ) ( not ( = ?auto_133801 ?auto_133799 ) ) ( not ( = ?auto_133801 ?auto_133797 ) ) ( not ( = ?auto_133801 ?auto_133796 ) ) ( not ( = ?auto_133799 ?auto_133797 ) ) ( not ( = ?auto_133799 ?auto_133796 ) ) ( not ( = ?auto_133797 ?auto_133796 ) ) ( not ( = ?auto_133795 ?auto_133797 ) ) ( not ( = ?auto_133795 ?auto_133803 ) ) ( not ( = ?auto_133795 ?auto_133802 ) ) ( not ( = ?auto_133795 ?auto_133801 ) ) ( not ( = ?auto_133795 ?auto_133799 ) ) ( not ( = ?auto_133798 ?auto_133797 ) ) ( not ( = ?auto_133798 ?auto_133803 ) ) ( not ( = ?auto_133798 ?auto_133802 ) ) ( not ( = ?auto_133798 ?auto_133801 ) ) ( not ( = ?auto_133798 ?auto_133799 ) ) ( not ( = ?auto_133800 ?auto_133797 ) ) ( not ( = ?auto_133800 ?auto_133803 ) ) ( not ( = ?auto_133800 ?auto_133802 ) ) ( not ( = ?auto_133800 ?auto_133801 ) ) ( not ( = ?auto_133800 ?auto_133799 ) ) ( ON ?auto_133796 ?auto_133800 ) ( ON ?auto_133797 ?auto_133796 ) ( ON ?auto_133799 ?auto_133797 ) ( ON ?auto_133801 ?auto_133799 ) ( CLEAR ?auto_133803 ) ( ON ?auto_133802 ?auto_133801 ) ( CLEAR ?auto_133802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133795 ?auto_133798 ?auto_133800 ?auto_133796 ?auto_133797 ?auto_133799 ?auto_133801 )
      ( MAKE-1PILE ?auto_133795 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133804 - BLOCK
    )
    :vars
    (
      ?auto_133808 - BLOCK
      ?auto_133810 - BLOCK
      ?auto_133805 - BLOCK
      ?auto_133812 - BLOCK
      ?auto_133806 - BLOCK
      ?auto_133807 - BLOCK
      ?auto_133811 - BLOCK
      ?auto_133809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133808 ?auto_133804 ) ( ON-TABLE ?auto_133804 ) ( not ( = ?auto_133804 ?auto_133808 ) ) ( not ( = ?auto_133804 ?auto_133810 ) ) ( not ( = ?auto_133804 ?auto_133805 ) ) ( not ( = ?auto_133808 ?auto_133810 ) ) ( not ( = ?auto_133808 ?auto_133805 ) ) ( not ( = ?auto_133810 ?auto_133805 ) ) ( ON ?auto_133810 ?auto_133808 ) ( not ( = ?auto_133812 ?auto_133806 ) ) ( not ( = ?auto_133812 ?auto_133807 ) ) ( not ( = ?auto_133812 ?auto_133811 ) ) ( not ( = ?auto_133812 ?auto_133809 ) ) ( not ( = ?auto_133812 ?auto_133805 ) ) ( not ( = ?auto_133806 ?auto_133807 ) ) ( not ( = ?auto_133806 ?auto_133811 ) ) ( not ( = ?auto_133806 ?auto_133809 ) ) ( not ( = ?auto_133806 ?auto_133805 ) ) ( not ( = ?auto_133807 ?auto_133811 ) ) ( not ( = ?auto_133807 ?auto_133809 ) ) ( not ( = ?auto_133807 ?auto_133805 ) ) ( not ( = ?auto_133811 ?auto_133809 ) ) ( not ( = ?auto_133811 ?auto_133805 ) ) ( not ( = ?auto_133809 ?auto_133805 ) ) ( not ( = ?auto_133804 ?auto_133809 ) ) ( not ( = ?auto_133804 ?auto_133812 ) ) ( not ( = ?auto_133804 ?auto_133806 ) ) ( not ( = ?auto_133804 ?auto_133807 ) ) ( not ( = ?auto_133804 ?auto_133811 ) ) ( not ( = ?auto_133808 ?auto_133809 ) ) ( not ( = ?auto_133808 ?auto_133812 ) ) ( not ( = ?auto_133808 ?auto_133806 ) ) ( not ( = ?auto_133808 ?auto_133807 ) ) ( not ( = ?auto_133808 ?auto_133811 ) ) ( not ( = ?auto_133810 ?auto_133809 ) ) ( not ( = ?auto_133810 ?auto_133812 ) ) ( not ( = ?auto_133810 ?auto_133806 ) ) ( not ( = ?auto_133810 ?auto_133807 ) ) ( not ( = ?auto_133810 ?auto_133811 ) ) ( ON ?auto_133805 ?auto_133810 ) ( ON ?auto_133809 ?auto_133805 ) ( ON ?auto_133811 ?auto_133809 ) ( ON ?auto_133807 ?auto_133811 ) ( ON ?auto_133806 ?auto_133807 ) ( CLEAR ?auto_133806 ) ( HOLDING ?auto_133812 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133812 )
      ( MAKE-1PILE ?auto_133804 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_133813 - BLOCK
    )
    :vars
    (
      ?auto_133819 - BLOCK
      ?auto_133814 - BLOCK
      ?auto_133821 - BLOCK
      ?auto_133815 - BLOCK
      ?auto_133816 - BLOCK
      ?auto_133817 - BLOCK
      ?auto_133820 - BLOCK
      ?auto_133818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133819 ?auto_133813 ) ( ON-TABLE ?auto_133813 ) ( not ( = ?auto_133813 ?auto_133819 ) ) ( not ( = ?auto_133813 ?auto_133814 ) ) ( not ( = ?auto_133813 ?auto_133821 ) ) ( not ( = ?auto_133819 ?auto_133814 ) ) ( not ( = ?auto_133819 ?auto_133821 ) ) ( not ( = ?auto_133814 ?auto_133821 ) ) ( ON ?auto_133814 ?auto_133819 ) ( not ( = ?auto_133815 ?auto_133816 ) ) ( not ( = ?auto_133815 ?auto_133817 ) ) ( not ( = ?auto_133815 ?auto_133820 ) ) ( not ( = ?auto_133815 ?auto_133818 ) ) ( not ( = ?auto_133815 ?auto_133821 ) ) ( not ( = ?auto_133816 ?auto_133817 ) ) ( not ( = ?auto_133816 ?auto_133820 ) ) ( not ( = ?auto_133816 ?auto_133818 ) ) ( not ( = ?auto_133816 ?auto_133821 ) ) ( not ( = ?auto_133817 ?auto_133820 ) ) ( not ( = ?auto_133817 ?auto_133818 ) ) ( not ( = ?auto_133817 ?auto_133821 ) ) ( not ( = ?auto_133820 ?auto_133818 ) ) ( not ( = ?auto_133820 ?auto_133821 ) ) ( not ( = ?auto_133818 ?auto_133821 ) ) ( not ( = ?auto_133813 ?auto_133818 ) ) ( not ( = ?auto_133813 ?auto_133815 ) ) ( not ( = ?auto_133813 ?auto_133816 ) ) ( not ( = ?auto_133813 ?auto_133817 ) ) ( not ( = ?auto_133813 ?auto_133820 ) ) ( not ( = ?auto_133819 ?auto_133818 ) ) ( not ( = ?auto_133819 ?auto_133815 ) ) ( not ( = ?auto_133819 ?auto_133816 ) ) ( not ( = ?auto_133819 ?auto_133817 ) ) ( not ( = ?auto_133819 ?auto_133820 ) ) ( not ( = ?auto_133814 ?auto_133818 ) ) ( not ( = ?auto_133814 ?auto_133815 ) ) ( not ( = ?auto_133814 ?auto_133816 ) ) ( not ( = ?auto_133814 ?auto_133817 ) ) ( not ( = ?auto_133814 ?auto_133820 ) ) ( ON ?auto_133821 ?auto_133814 ) ( ON ?auto_133818 ?auto_133821 ) ( ON ?auto_133820 ?auto_133818 ) ( ON ?auto_133817 ?auto_133820 ) ( ON ?auto_133816 ?auto_133817 ) ( ON ?auto_133815 ?auto_133816 ) ( CLEAR ?auto_133815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133813 ?auto_133819 ?auto_133814 ?auto_133821 ?auto_133818 ?auto_133820 ?auto_133817 ?auto_133816 )
      ( MAKE-1PILE ?auto_133813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133830 - BLOCK
      ?auto_133831 - BLOCK
      ?auto_133832 - BLOCK
      ?auto_133833 - BLOCK
      ?auto_133834 - BLOCK
      ?auto_133835 - BLOCK
      ?auto_133836 - BLOCK
      ?auto_133837 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_133837 ) ( CLEAR ?auto_133836 ) ( ON-TABLE ?auto_133830 ) ( ON ?auto_133831 ?auto_133830 ) ( ON ?auto_133832 ?auto_133831 ) ( ON ?auto_133833 ?auto_133832 ) ( ON ?auto_133834 ?auto_133833 ) ( ON ?auto_133835 ?auto_133834 ) ( ON ?auto_133836 ?auto_133835 ) ( not ( = ?auto_133830 ?auto_133831 ) ) ( not ( = ?auto_133830 ?auto_133832 ) ) ( not ( = ?auto_133830 ?auto_133833 ) ) ( not ( = ?auto_133830 ?auto_133834 ) ) ( not ( = ?auto_133830 ?auto_133835 ) ) ( not ( = ?auto_133830 ?auto_133836 ) ) ( not ( = ?auto_133830 ?auto_133837 ) ) ( not ( = ?auto_133831 ?auto_133832 ) ) ( not ( = ?auto_133831 ?auto_133833 ) ) ( not ( = ?auto_133831 ?auto_133834 ) ) ( not ( = ?auto_133831 ?auto_133835 ) ) ( not ( = ?auto_133831 ?auto_133836 ) ) ( not ( = ?auto_133831 ?auto_133837 ) ) ( not ( = ?auto_133832 ?auto_133833 ) ) ( not ( = ?auto_133832 ?auto_133834 ) ) ( not ( = ?auto_133832 ?auto_133835 ) ) ( not ( = ?auto_133832 ?auto_133836 ) ) ( not ( = ?auto_133832 ?auto_133837 ) ) ( not ( = ?auto_133833 ?auto_133834 ) ) ( not ( = ?auto_133833 ?auto_133835 ) ) ( not ( = ?auto_133833 ?auto_133836 ) ) ( not ( = ?auto_133833 ?auto_133837 ) ) ( not ( = ?auto_133834 ?auto_133835 ) ) ( not ( = ?auto_133834 ?auto_133836 ) ) ( not ( = ?auto_133834 ?auto_133837 ) ) ( not ( = ?auto_133835 ?auto_133836 ) ) ( not ( = ?auto_133835 ?auto_133837 ) ) ( not ( = ?auto_133836 ?auto_133837 ) ) )
    :subtasks
    ( ( !STACK ?auto_133837 ?auto_133836 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133838 - BLOCK
      ?auto_133839 - BLOCK
      ?auto_133840 - BLOCK
      ?auto_133841 - BLOCK
      ?auto_133842 - BLOCK
      ?auto_133843 - BLOCK
      ?auto_133844 - BLOCK
      ?auto_133845 - BLOCK
    )
    :vars
    (
      ?auto_133846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_133844 ) ( ON-TABLE ?auto_133838 ) ( ON ?auto_133839 ?auto_133838 ) ( ON ?auto_133840 ?auto_133839 ) ( ON ?auto_133841 ?auto_133840 ) ( ON ?auto_133842 ?auto_133841 ) ( ON ?auto_133843 ?auto_133842 ) ( ON ?auto_133844 ?auto_133843 ) ( not ( = ?auto_133838 ?auto_133839 ) ) ( not ( = ?auto_133838 ?auto_133840 ) ) ( not ( = ?auto_133838 ?auto_133841 ) ) ( not ( = ?auto_133838 ?auto_133842 ) ) ( not ( = ?auto_133838 ?auto_133843 ) ) ( not ( = ?auto_133838 ?auto_133844 ) ) ( not ( = ?auto_133838 ?auto_133845 ) ) ( not ( = ?auto_133839 ?auto_133840 ) ) ( not ( = ?auto_133839 ?auto_133841 ) ) ( not ( = ?auto_133839 ?auto_133842 ) ) ( not ( = ?auto_133839 ?auto_133843 ) ) ( not ( = ?auto_133839 ?auto_133844 ) ) ( not ( = ?auto_133839 ?auto_133845 ) ) ( not ( = ?auto_133840 ?auto_133841 ) ) ( not ( = ?auto_133840 ?auto_133842 ) ) ( not ( = ?auto_133840 ?auto_133843 ) ) ( not ( = ?auto_133840 ?auto_133844 ) ) ( not ( = ?auto_133840 ?auto_133845 ) ) ( not ( = ?auto_133841 ?auto_133842 ) ) ( not ( = ?auto_133841 ?auto_133843 ) ) ( not ( = ?auto_133841 ?auto_133844 ) ) ( not ( = ?auto_133841 ?auto_133845 ) ) ( not ( = ?auto_133842 ?auto_133843 ) ) ( not ( = ?auto_133842 ?auto_133844 ) ) ( not ( = ?auto_133842 ?auto_133845 ) ) ( not ( = ?auto_133843 ?auto_133844 ) ) ( not ( = ?auto_133843 ?auto_133845 ) ) ( not ( = ?auto_133844 ?auto_133845 ) ) ( ON ?auto_133845 ?auto_133846 ) ( CLEAR ?auto_133845 ) ( HAND-EMPTY ) ( not ( = ?auto_133838 ?auto_133846 ) ) ( not ( = ?auto_133839 ?auto_133846 ) ) ( not ( = ?auto_133840 ?auto_133846 ) ) ( not ( = ?auto_133841 ?auto_133846 ) ) ( not ( = ?auto_133842 ?auto_133846 ) ) ( not ( = ?auto_133843 ?auto_133846 ) ) ( not ( = ?auto_133844 ?auto_133846 ) ) ( not ( = ?auto_133845 ?auto_133846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133845 ?auto_133846 )
      ( MAKE-8PILE ?auto_133838 ?auto_133839 ?auto_133840 ?auto_133841 ?auto_133842 ?auto_133843 ?auto_133844 ?auto_133845 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133847 - BLOCK
      ?auto_133848 - BLOCK
      ?auto_133849 - BLOCK
      ?auto_133850 - BLOCK
      ?auto_133851 - BLOCK
      ?auto_133852 - BLOCK
      ?auto_133853 - BLOCK
      ?auto_133854 - BLOCK
    )
    :vars
    (
      ?auto_133855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133847 ) ( ON ?auto_133848 ?auto_133847 ) ( ON ?auto_133849 ?auto_133848 ) ( ON ?auto_133850 ?auto_133849 ) ( ON ?auto_133851 ?auto_133850 ) ( ON ?auto_133852 ?auto_133851 ) ( not ( = ?auto_133847 ?auto_133848 ) ) ( not ( = ?auto_133847 ?auto_133849 ) ) ( not ( = ?auto_133847 ?auto_133850 ) ) ( not ( = ?auto_133847 ?auto_133851 ) ) ( not ( = ?auto_133847 ?auto_133852 ) ) ( not ( = ?auto_133847 ?auto_133853 ) ) ( not ( = ?auto_133847 ?auto_133854 ) ) ( not ( = ?auto_133848 ?auto_133849 ) ) ( not ( = ?auto_133848 ?auto_133850 ) ) ( not ( = ?auto_133848 ?auto_133851 ) ) ( not ( = ?auto_133848 ?auto_133852 ) ) ( not ( = ?auto_133848 ?auto_133853 ) ) ( not ( = ?auto_133848 ?auto_133854 ) ) ( not ( = ?auto_133849 ?auto_133850 ) ) ( not ( = ?auto_133849 ?auto_133851 ) ) ( not ( = ?auto_133849 ?auto_133852 ) ) ( not ( = ?auto_133849 ?auto_133853 ) ) ( not ( = ?auto_133849 ?auto_133854 ) ) ( not ( = ?auto_133850 ?auto_133851 ) ) ( not ( = ?auto_133850 ?auto_133852 ) ) ( not ( = ?auto_133850 ?auto_133853 ) ) ( not ( = ?auto_133850 ?auto_133854 ) ) ( not ( = ?auto_133851 ?auto_133852 ) ) ( not ( = ?auto_133851 ?auto_133853 ) ) ( not ( = ?auto_133851 ?auto_133854 ) ) ( not ( = ?auto_133852 ?auto_133853 ) ) ( not ( = ?auto_133852 ?auto_133854 ) ) ( not ( = ?auto_133853 ?auto_133854 ) ) ( ON ?auto_133854 ?auto_133855 ) ( CLEAR ?auto_133854 ) ( not ( = ?auto_133847 ?auto_133855 ) ) ( not ( = ?auto_133848 ?auto_133855 ) ) ( not ( = ?auto_133849 ?auto_133855 ) ) ( not ( = ?auto_133850 ?auto_133855 ) ) ( not ( = ?auto_133851 ?auto_133855 ) ) ( not ( = ?auto_133852 ?auto_133855 ) ) ( not ( = ?auto_133853 ?auto_133855 ) ) ( not ( = ?auto_133854 ?auto_133855 ) ) ( HOLDING ?auto_133853 ) ( CLEAR ?auto_133852 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133847 ?auto_133848 ?auto_133849 ?auto_133850 ?auto_133851 ?auto_133852 ?auto_133853 )
      ( MAKE-8PILE ?auto_133847 ?auto_133848 ?auto_133849 ?auto_133850 ?auto_133851 ?auto_133852 ?auto_133853 ?auto_133854 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133856 - BLOCK
      ?auto_133857 - BLOCK
      ?auto_133858 - BLOCK
      ?auto_133859 - BLOCK
      ?auto_133860 - BLOCK
      ?auto_133861 - BLOCK
      ?auto_133862 - BLOCK
      ?auto_133863 - BLOCK
    )
    :vars
    (
      ?auto_133864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133856 ) ( ON ?auto_133857 ?auto_133856 ) ( ON ?auto_133858 ?auto_133857 ) ( ON ?auto_133859 ?auto_133858 ) ( ON ?auto_133860 ?auto_133859 ) ( ON ?auto_133861 ?auto_133860 ) ( not ( = ?auto_133856 ?auto_133857 ) ) ( not ( = ?auto_133856 ?auto_133858 ) ) ( not ( = ?auto_133856 ?auto_133859 ) ) ( not ( = ?auto_133856 ?auto_133860 ) ) ( not ( = ?auto_133856 ?auto_133861 ) ) ( not ( = ?auto_133856 ?auto_133862 ) ) ( not ( = ?auto_133856 ?auto_133863 ) ) ( not ( = ?auto_133857 ?auto_133858 ) ) ( not ( = ?auto_133857 ?auto_133859 ) ) ( not ( = ?auto_133857 ?auto_133860 ) ) ( not ( = ?auto_133857 ?auto_133861 ) ) ( not ( = ?auto_133857 ?auto_133862 ) ) ( not ( = ?auto_133857 ?auto_133863 ) ) ( not ( = ?auto_133858 ?auto_133859 ) ) ( not ( = ?auto_133858 ?auto_133860 ) ) ( not ( = ?auto_133858 ?auto_133861 ) ) ( not ( = ?auto_133858 ?auto_133862 ) ) ( not ( = ?auto_133858 ?auto_133863 ) ) ( not ( = ?auto_133859 ?auto_133860 ) ) ( not ( = ?auto_133859 ?auto_133861 ) ) ( not ( = ?auto_133859 ?auto_133862 ) ) ( not ( = ?auto_133859 ?auto_133863 ) ) ( not ( = ?auto_133860 ?auto_133861 ) ) ( not ( = ?auto_133860 ?auto_133862 ) ) ( not ( = ?auto_133860 ?auto_133863 ) ) ( not ( = ?auto_133861 ?auto_133862 ) ) ( not ( = ?auto_133861 ?auto_133863 ) ) ( not ( = ?auto_133862 ?auto_133863 ) ) ( ON ?auto_133863 ?auto_133864 ) ( not ( = ?auto_133856 ?auto_133864 ) ) ( not ( = ?auto_133857 ?auto_133864 ) ) ( not ( = ?auto_133858 ?auto_133864 ) ) ( not ( = ?auto_133859 ?auto_133864 ) ) ( not ( = ?auto_133860 ?auto_133864 ) ) ( not ( = ?auto_133861 ?auto_133864 ) ) ( not ( = ?auto_133862 ?auto_133864 ) ) ( not ( = ?auto_133863 ?auto_133864 ) ) ( CLEAR ?auto_133861 ) ( ON ?auto_133862 ?auto_133863 ) ( CLEAR ?auto_133862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133864 ?auto_133863 )
      ( MAKE-8PILE ?auto_133856 ?auto_133857 ?auto_133858 ?auto_133859 ?auto_133860 ?auto_133861 ?auto_133862 ?auto_133863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133865 - BLOCK
      ?auto_133866 - BLOCK
      ?auto_133867 - BLOCK
      ?auto_133868 - BLOCK
      ?auto_133869 - BLOCK
      ?auto_133870 - BLOCK
      ?auto_133871 - BLOCK
      ?auto_133872 - BLOCK
    )
    :vars
    (
      ?auto_133873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133865 ) ( ON ?auto_133866 ?auto_133865 ) ( ON ?auto_133867 ?auto_133866 ) ( ON ?auto_133868 ?auto_133867 ) ( ON ?auto_133869 ?auto_133868 ) ( not ( = ?auto_133865 ?auto_133866 ) ) ( not ( = ?auto_133865 ?auto_133867 ) ) ( not ( = ?auto_133865 ?auto_133868 ) ) ( not ( = ?auto_133865 ?auto_133869 ) ) ( not ( = ?auto_133865 ?auto_133870 ) ) ( not ( = ?auto_133865 ?auto_133871 ) ) ( not ( = ?auto_133865 ?auto_133872 ) ) ( not ( = ?auto_133866 ?auto_133867 ) ) ( not ( = ?auto_133866 ?auto_133868 ) ) ( not ( = ?auto_133866 ?auto_133869 ) ) ( not ( = ?auto_133866 ?auto_133870 ) ) ( not ( = ?auto_133866 ?auto_133871 ) ) ( not ( = ?auto_133866 ?auto_133872 ) ) ( not ( = ?auto_133867 ?auto_133868 ) ) ( not ( = ?auto_133867 ?auto_133869 ) ) ( not ( = ?auto_133867 ?auto_133870 ) ) ( not ( = ?auto_133867 ?auto_133871 ) ) ( not ( = ?auto_133867 ?auto_133872 ) ) ( not ( = ?auto_133868 ?auto_133869 ) ) ( not ( = ?auto_133868 ?auto_133870 ) ) ( not ( = ?auto_133868 ?auto_133871 ) ) ( not ( = ?auto_133868 ?auto_133872 ) ) ( not ( = ?auto_133869 ?auto_133870 ) ) ( not ( = ?auto_133869 ?auto_133871 ) ) ( not ( = ?auto_133869 ?auto_133872 ) ) ( not ( = ?auto_133870 ?auto_133871 ) ) ( not ( = ?auto_133870 ?auto_133872 ) ) ( not ( = ?auto_133871 ?auto_133872 ) ) ( ON ?auto_133872 ?auto_133873 ) ( not ( = ?auto_133865 ?auto_133873 ) ) ( not ( = ?auto_133866 ?auto_133873 ) ) ( not ( = ?auto_133867 ?auto_133873 ) ) ( not ( = ?auto_133868 ?auto_133873 ) ) ( not ( = ?auto_133869 ?auto_133873 ) ) ( not ( = ?auto_133870 ?auto_133873 ) ) ( not ( = ?auto_133871 ?auto_133873 ) ) ( not ( = ?auto_133872 ?auto_133873 ) ) ( ON ?auto_133871 ?auto_133872 ) ( CLEAR ?auto_133871 ) ( ON-TABLE ?auto_133873 ) ( HOLDING ?auto_133870 ) ( CLEAR ?auto_133869 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133865 ?auto_133866 ?auto_133867 ?auto_133868 ?auto_133869 ?auto_133870 )
      ( MAKE-8PILE ?auto_133865 ?auto_133866 ?auto_133867 ?auto_133868 ?auto_133869 ?auto_133870 ?auto_133871 ?auto_133872 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133874 - BLOCK
      ?auto_133875 - BLOCK
      ?auto_133876 - BLOCK
      ?auto_133877 - BLOCK
      ?auto_133878 - BLOCK
      ?auto_133879 - BLOCK
      ?auto_133880 - BLOCK
      ?auto_133881 - BLOCK
    )
    :vars
    (
      ?auto_133882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133874 ) ( ON ?auto_133875 ?auto_133874 ) ( ON ?auto_133876 ?auto_133875 ) ( ON ?auto_133877 ?auto_133876 ) ( ON ?auto_133878 ?auto_133877 ) ( not ( = ?auto_133874 ?auto_133875 ) ) ( not ( = ?auto_133874 ?auto_133876 ) ) ( not ( = ?auto_133874 ?auto_133877 ) ) ( not ( = ?auto_133874 ?auto_133878 ) ) ( not ( = ?auto_133874 ?auto_133879 ) ) ( not ( = ?auto_133874 ?auto_133880 ) ) ( not ( = ?auto_133874 ?auto_133881 ) ) ( not ( = ?auto_133875 ?auto_133876 ) ) ( not ( = ?auto_133875 ?auto_133877 ) ) ( not ( = ?auto_133875 ?auto_133878 ) ) ( not ( = ?auto_133875 ?auto_133879 ) ) ( not ( = ?auto_133875 ?auto_133880 ) ) ( not ( = ?auto_133875 ?auto_133881 ) ) ( not ( = ?auto_133876 ?auto_133877 ) ) ( not ( = ?auto_133876 ?auto_133878 ) ) ( not ( = ?auto_133876 ?auto_133879 ) ) ( not ( = ?auto_133876 ?auto_133880 ) ) ( not ( = ?auto_133876 ?auto_133881 ) ) ( not ( = ?auto_133877 ?auto_133878 ) ) ( not ( = ?auto_133877 ?auto_133879 ) ) ( not ( = ?auto_133877 ?auto_133880 ) ) ( not ( = ?auto_133877 ?auto_133881 ) ) ( not ( = ?auto_133878 ?auto_133879 ) ) ( not ( = ?auto_133878 ?auto_133880 ) ) ( not ( = ?auto_133878 ?auto_133881 ) ) ( not ( = ?auto_133879 ?auto_133880 ) ) ( not ( = ?auto_133879 ?auto_133881 ) ) ( not ( = ?auto_133880 ?auto_133881 ) ) ( ON ?auto_133881 ?auto_133882 ) ( not ( = ?auto_133874 ?auto_133882 ) ) ( not ( = ?auto_133875 ?auto_133882 ) ) ( not ( = ?auto_133876 ?auto_133882 ) ) ( not ( = ?auto_133877 ?auto_133882 ) ) ( not ( = ?auto_133878 ?auto_133882 ) ) ( not ( = ?auto_133879 ?auto_133882 ) ) ( not ( = ?auto_133880 ?auto_133882 ) ) ( not ( = ?auto_133881 ?auto_133882 ) ) ( ON ?auto_133880 ?auto_133881 ) ( ON-TABLE ?auto_133882 ) ( CLEAR ?auto_133878 ) ( ON ?auto_133879 ?auto_133880 ) ( CLEAR ?auto_133879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133882 ?auto_133881 ?auto_133880 )
      ( MAKE-8PILE ?auto_133874 ?auto_133875 ?auto_133876 ?auto_133877 ?auto_133878 ?auto_133879 ?auto_133880 ?auto_133881 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133883 - BLOCK
      ?auto_133884 - BLOCK
      ?auto_133885 - BLOCK
      ?auto_133886 - BLOCK
      ?auto_133887 - BLOCK
      ?auto_133888 - BLOCK
      ?auto_133889 - BLOCK
      ?auto_133890 - BLOCK
    )
    :vars
    (
      ?auto_133891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133883 ) ( ON ?auto_133884 ?auto_133883 ) ( ON ?auto_133885 ?auto_133884 ) ( ON ?auto_133886 ?auto_133885 ) ( not ( = ?auto_133883 ?auto_133884 ) ) ( not ( = ?auto_133883 ?auto_133885 ) ) ( not ( = ?auto_133883 ?auto_133886 ) ) ( not ( = ?auto_133883 ?auto_133887 ) ) ( not ( = ?auto_133883 ?auto_133888 ) ) ( not ( = ?auto_133883 ?auto_133889 ) ) ( not ( = ?auto_133883 ?auto_133890 ) ) ( not ( = ?auto_133884 ?auto_133885 ) ) ( not ( = ?auto_133884 ?auto_133886 ) ) ( not ( = ?auto_133884 ?auto_133887 ) ) ( not ( = ?auto_133884 ?auto_133888 ) ) ( not ( = ?auto_133884 ?auto_133889 ) ) ( not ( = ?auto_133884 ?auto_133890 ) ) ( not ( = ?auto_133885 ?auto_133886 ) ) ( not ( = ?auto_133885 ?auto_133887 ) ) ( not ( = ?auto_133885 ?auto_133888 ) ) ( not ( = ?auto_133885 ?auto_133889 ) ) ( not ( = ?auto_133885 ?auto_133890 ) ) ( not ( = ?auto_133886 ?auto_133887 ) ) ( not ( = ?auto_133886 ?auto_133888 ) ) ( not ( = ?auto_133886 ?auto_133889 ) ) ( not ( = ?auto_133886 ?auto_133890 ) ) ( not ( = ?auto_133887 ?auto_133888 ) ) ( not ( = ?auto_133887 ?auto_133889 ) ) ( not ( = ?auto_133887 ?auto_133890 ) ) ( not ( = ?auto_133888 ?auto_133889 ) ) ( not ( = ?auto_133888 ?auto_133890 ) ) ( not ( = ?auto_133889 ?auto_133890 ) ) ( ON ?auto_133890 ?auto_133891 ) ( not ( = ?auto_133883 ?auto_133891 ) ) ( not ( = ?auto_133884 ?auto_133891 ) ) ( not ( = ?auto_133885 ?auto_133891 ) ) ( not ( = ?auto_133886 ?auto_133891 ) ) ( not ( = ?auto_133887 ?auto_133891 ) ) ( not ( = ?auto_133888 ?auto_133891 ) ) ( not ( = ?auto_133889 ?auto_133891 ) ) ( not ( = ?auto_133890 ?auto_133891 ) ) ( ON ?auto_133889 ?auto_133890 ) ( ON-TABLE ?auto_133891 ) ( ON ?auto_133888 ?auto_133889 ) ( CLEAR ?auto_133888 ) ( HOLDING ?auto_133887 ) ( CLEAR ?auto_133886 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133883 ?auto_133884 ?auto_133885 ?auto_133886 ?auto_133887 )
      ( MAKE-8PILE ?auto_133883 ?auto_133884 ?auto_133885 ?auto_133886 ?auto_133887 ?auto_133888 ?auto_133889 ?auto_133890 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133892 - BLOCK
      ?auto_133893 - BLOCK
      ?auto_133894 - BLOCK
      ?auto_133895 - BLOCK
      ?auto_133896 - BLOCK
      ?auto_133897 - BLOCK
      ?auto_133898 - BLOCK
      ?auto_133899 - BLOCK
    )
    :vars
    (
      ?auto_133900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133892 ) ( ON ?auto_133893 ?auto_133892 ) ( ON ?auto_133894 ?auto_133893 ) ( ON ?auto_133895 ?auto_133894 ) ( not ( = ?auto_133892 ?auto_133893 ) ) ( not ( = ?auto_133892 ?auto_133894 ) ) ( not ( = ?auto_133892 ?auto_133895 ) ) ( not ( = ?auto_133892 ?auto_133896 ) ) ( not ( = ?auto_133892 ?auto_133897 ) ) ( not ( = ?auto_133892 ?auto_133898 ) ) ( not ( = ?auto_133892 ?auto_133899 ) ) ( not ( = ?auto_133893 ?auto_133894 ) ) ( not ( = ?auto_133893 ?auto_133895 ) ) ( not ( = ?auto_133893 ?auto_133896 ) ) ( not ( = ?auto_133893 ?auto_133897 ) ) ( not ( = ?auto_133893 ?auto_133898 ) ) ( not ( = ?auto_133893 ?auto_133899 ) ) ( not ( = ?auto_133894 ?auto_133895 ) ) ( not ( = ?auto_133894 ?auto_133896 ) ) ( not ( = ?auto_133894 ?auto_133897 ) ) ( not ( = ?auto_133894 ?auto_133898 ) ) ( not ( = ?auto_133894 ?auto_133899 ) ) ( not ( = ?auto_133895 ?auto_133896 ) ) ( not ( = ?auto_133895 ?auto_133897 ) ) ( not ( = ?auto_133895 ?auto_133898 ) ) ( not ( = ?auto_133895 ?auto_133899 ) ) ( not ( = ?auto_133896 ?auto_133897 ) ) ( not ( = ?auto_133896 ?auto_133898 ) ) ( not ( = ?auto_133896 ?auto_133899 ) ) ( not ( = ?auto_133897 ?auto_133898 ) ) ( not ( = ?auto_133897 ?auto_133899 ) ) ( not ( = ?auto_133898 ?auto_133899 ) ) ( ON ?auto_133899 ?auto_133900 ) ( not ( = ?auto_133892 ?auto_133900 ) ) ( not ( = ?auto_133893 ?auto_133900 ) ) ( not ( = ?auto_133894 ?auto_133900 ) ) ( not ( = ?auto_133895 ?auto_133900 ) ) ( not ( = ?auto_133896 ?auto_133900 ) ) ( not ( = ?auto_133897 ?auto_133900 ) ) ( not ( = ?auto_133898 ?auto_133900 ) ) ( not ( = ?auto_133899 ?auto_133900 ) ) ( ON ?auto_133898 ?auto_133899 ) ( ON-TABLE ?auto_133900 ) ( ON ?auto_133897 ?auto_133898 ) ( CLEAR ?auto_133895 ) ( ON ?auto_133896 ?auto_133897 ) ( CLEAR ?auto_133896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133900 ?auto_133899 ?auto_133898 ?auto_133897 )
      ( MAKE-8PILE ?auto_133892 ?auto_133893 ?auto_133894 ?auto_133895 ?auto_133896 ?auto_133897 ?auto_133898 ?auto_133899 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133901 - BLOCK
      ?auto_133902 - BLOCK
      ?auto_133903 - BLOCK
      ?auto_133904 - BLOCK
      ?auto_133905 - BLOCK
      ?auto_133906 - BLOCK
      ?auto_133907 - BLOCK
      ?auto_133908 - BLOCK
    )
    :vars
    (
      ?auto_133909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133901 ) ( ON ?auto_133902 ?auto_133901 ) ( ON ?auto_133903 ?auto_133902 ) ( not ( = ?auto_133901 ?auto_133902 ) ) ( not ( = ?auto_133901 ?auto_133903 ) ) ( not ( = ?auto_133901 ?auto_133904 ) ) ( not ( = ?auto_133901 ?auto_133905 ) ) ( not ( = ?auto_133901 ?auto_133906 ) ) ( not ( = ?auto_133901 ?auto_133907 ) ) ( not ( = ?auto_133901 ?auto_133908 ) ) ( not ( = ?auto_133902 ?auto_133903 ) ) ( not ( = ?auto_133902 ?auto_133904 ) ) ( not ( = ?auto_133902 ?auto_133905 ) ) ( not ( = ?auto_133902 ?auto_133906 ) ) ( not ( = ?auto_133902 ?auto_133907 ) ) ( not ( = ?auto_133902 ?auto_133908 ) ) ( not ( = ?auto_133903 ?auto_133904 ) ) ( not ( = ?auto_133903 ?auto_133905 ) ) ( not ( = ?auto_133903 ?auto_133906 ) ) ( not ( = ?auto_133903 ?auto_133907 ) ) ( not ( = ?auto_133903 ?auto_133908 ) ) ( not ( = ?auto_133904 ?auto_133905 ) ) ( not ( = ?auto_133904 ?auto_133906 ) ) ( not ( = ?auto_133904 ?auto_133907 ) ) ( not ( = ?auto_133904 ?auto_133908 ) ) ( not ( = ?auto_133905 ?auto_133906 ) ) ( not ( = ?auto_133905 ?auto_133907 ) ) ( not ( = ?auto_133905 ?auto_133908 ) ) ( not ( = ?auto_133906 ?auto_133907 ) ) ( not ( = ?auto_133906 ?auto_133908 ) ) ( not ( = ?auto_133907 ?auto_133908 ) ) ( ON ?auto_133908 ?auto_133909 ) ( not ( = ?auto_133901 ?auto_133909 ) ) ( not ( = ?auto_133902 ?auto_133909 ) ) ( not ( = ?auto_133903 ?auto_133909 ) ) ( not ( = ?auto_133904 ?auto_133909 ) ) ( not ( = ?auto_133905 ?auto_133909 ) ) ( not ( = ?auto_133906 ?auto_133909 ) ) ( not ( = ?auto_133907 ?auto_133909 ) ) ( not ( = ?auto_133908 ?auto_133909 ) ) ( ON ?auto_133907 ?auto_133908 ) ( ON-TABLE ?auto_133909 ) ( ON ?auto_133906 ?auto_133907 ) ( ON ?auto_133905 ?auto_133906 ) ( CLEAR ?auto_133905 ) ( HOLDING ?auto_133904 ) ( CLEAR ?auto_133903 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_133901 ?auto_133902 ?auto_133903 ?auto_133904 )
      ( MAKE-8PILE ?auto_133901 ?auto_133902 ?auto_133903 ?auto_133904 ?auto_133905 ?auto_133906 ?auto_133907 ?auto_133908 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133910 - BLOCK
      ?auto_133911 - BLOCK
      ?auto_133912 - BLOCK
      ?auto_133913 - BLOCK
      ?auto_133914 - BLOCK
      ?auto_133915 - BLOCK
      ?auto_133916 - BLOCK
      ?auto_133917 - BLOCK
    )
    :vars
    (
      ?auto_133918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133910 ) ( ON ?auto_133911 ?auto_133910 ) ( ON ?auto_133912 ?auto_133911 ) ( not ( = ?auto_133910 ?auto_133911 ) ) ( not ( = ?auto_133910 ?auto_133912 ) ) ( not ( = ?auto_133910 ?auto_133913 ) ) ( not ( = ?auto_133910 ?auto_133914 ) ) ( not ( = ?auto_133910 ?auto_133915 ) ) ( not ( = ?auto_133910 ?auto_133916 ) ) ( not ( = ?auto_133910 ?auto_133917 ) ) ( not ( = ?auto_133911 ?auto_133912 ) ) ( not ( = ?auto_133911 ?auto_133913 ) ) ( not ( = ?auto_133911 ?auto_133914 ) ) ( not ( = ?auto_133911 ?auto_133915 ) ) ( not ( = ?auto_133911 ?auto_133916 ) ) ( not ( = ?auto_133911 ?auto_133917 ) ) ( not ( = ?auto_133912 ?auto_133913 ) ) ( not ( = ?auto_133912 ?auto_133914 ) ) ( not ( = ?auto_133912 ?auto_133915 ) ) ( not ( = ?auto_133912 ?auto_133916 ) ) ( not ( = ?auto_133912 ?auto_133917 ) ) ( not ( = ?auto_133913 ?auto_133914 ) ) ( not ( = ?auto_133913 ?auto_133915 ) ) ( not ( = ?auto_133913 ?auto_133916 ) ) ( not ( = ?auto_133913 ?auto_133917 ) ) ( not ( = ?auto_133914 ?auto_133915 ) ) ( not ( = ?auto_133914 ?auto_133916 ) ) ( not ( = ?auto_133914 ?auto_133917 ) ) ( not ( = ?auto_133915 ?auto_133916 ) ) ( not ( = ?auto_133915 ?auto_133917 ) ) ( not ( = ?auto_133916 ?auto_133917 ) ) ( ON ?auto_133917 ?auto_133918 ) ( not ( = ?auto_133910 ?auto_133918 ) ) ( not ( = ?auto_133911 ?auto_133918 ) ) ( not ( = ?auto_133912 ?auto_133918 ) ) ( not ( = ?auto_133913 ?auto_133918 ) ) ( not ( = ?auto_133914 ?auto_133918 ) ) ( not ( = ?auto_133915 ?auto_133918 ) ) ( not ( = ?auto_133916 ?auto_133918 ) ) ( not ( = ?auto_133917 ?auto_133918 ) ) ( ON ?auto_133916 ?auto_133917 ) ( ON-TABLE ?auto_133918 ) ( ON ?auto_133915 ?auto_133916 ) ( ON ?auto_133914 ?auto_133915 ) ( CLEAR ?auto_133912 ) ( ON ?auto_133913 ?auto_133914 ) ( CLEAR ?auto_133913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_133918 ?auto_133917 ?auto_133916 ?auto_133915 ?auto_133914 )
      ( MAKE-8PILE ?auto_133910 ?auto_133911 ?auto_133912 ?auto_133913 ?auto_133914 ?auto_133915 ?auto_133916 ?auto_133917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133919 - BLOCK
      ?auto_133920 - BLOCK
      ?auto_133921 - BLOCK
      ?auto_133922 - BLOCK
      ?auto_133923 - BLOCK
      ?auto_133924 - BLOCK
      ?auto_133925 - BLOCK
      ?auto_133926 - BLOCK
    )
    :vars
    (
      ?auto_133927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133919 ) ( ON ?auto_133920 ?auto_133919 ) ( not ( = ?auto_133919 ?auto_133920 ) ) ( not ( = ?auto_133919 ?auto_133921 ) ) ( not ( = ?auto_133919 ?auto_133922 ) ) ( not ( = ?auto_133919 ?auto_133923 ) ) ( not ( = ?auto_133919 ?auto_133924 ) ) ( not ( = ?auto_133919 ?auto_133925 ) ) ( not ( = ?auto_133919 ?auto_133926 ) ) ( not ( = ?auto_133920 ?auto_133921 ) ) ( not ( = ?auto_133920 ?auto_133922 ) ) ( not ( = ?auto_133920 ?auto_133923 ) ) ( not ( = ?auto_133920 ?auto_133924 ) ) ( not ( = ?auto_133920 ?auto_133925 ) ) ( not ( = ?auto_133920 ?auto_133926 ) ) ( not ( = ?auto_133921 ?auto_133922 ) ) ( not ( = ?auto_133921 ?auto_133923 ) ) ( not ( = ?auto_133921 ?auto_133924 ) ) ( not ( = ?auto_133921 ?auto_133925 ) ) ( not ( = ?auto_133921 ?auto_133926 ) ) ( not ( = ?auto_133922 ?auto_133923 ) ) ( not ( = ?auto_133922 ?auto_133924 ) ) ( not ( = ?auto_133922 ?auto_133925 ) ) ( not ( = ?auto_133922 ?auto_133926 ) ) ( not ( = ?auto_133923 ?auto_133924 ) ) ( not ( = ?auto_133923 ?auto_133925 ) ) ( not ( = ?auto_133923 ?auto_133926 ) ) ( not ( = ?auto_133924 ?auto_133925 ) ) ( not ( = ?auto_133924 ?auto_133926 ) ) ( not ( = ?auto_133925 ?auto_133926 ) ) ( ON ?auto_133926 ?auto_133927 ) ( not ( = ?auto_133919 ?auto_133927 ) ) ( not ( = ?auto_133920 ?auto_133927 ) ) ( not ( = ?auto_133921 ?auto_133927 ) ) ( not ( = ?auto_133922 ?auto_133927 ) ) ( not ( = ?auto_133923 ?auto_133927 ) ) ( not ( = ?auto_133924 ?auto_133927 ) ) ( not ( = ?auto_133925 ?auto_133927 ) ) ( not ( = ?auto_133926 ?auto_133927 ) ) ( ON ?auto_133925 ?auto_133926 ) ( ON-TABLE ?auto_133927 ) ( ON ?auto_133924 ?auto_133925 ) ( ON ?auto_133923 ?auto_133924 ) ( ON ?auto_133922 ?auto_133923 ) ( CLEAR ?auto_133922 ) ( HOLDING ?auto_133921 ) ( CLEAR ?auto_133920 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_133919 ?auto_133920 ?auto_133921 )
      ( MAKE-8PILE ?auto_133919 ?auto_133920 ?auto_133921 ?auto_133922 ?auto_133923 ?auto_133924 ?auto_133925 ?auto_133926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133928 - BLOCK
      ?auto_133929 - BLOCK
      ?auto_133930 - BLOCK
      ?auto_133931 - BLOCK
      ?auto_133932 - BLOCK
      ?auto_133933 - BLOCK
      ?auto_133934 - BLOCK
      ?auto_133935 - BLOCK
    )
    :vars
    (
      ?auto_133936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133928 ) ( ON ?auto_133929 ?auto_133928 ) ( not ( = ?auto_133928 ?auto_133929 ) ) ( not ( = ?auto_133928 ?auto_133930 ) ) ( not ( = ?auto_133928 ?auto_133931 ) ) ( not ( = ?auto_133928 ?auto_133932 ) ) ( not ( = ?auto_133928 ?auto_133933 ) ) ( not ( = ?auto_133928 ?auto_133934 ) ) ( not ( = ?auto_133928 ?auto_133935 ) ) ( not ( = ?auto_133929 ?auto_133930 ) ) ( not ( = ?auto_133929 ?auto_133931 ) ) ( not ( = ?auto_133929 ?auto_133932 ) ) ( not ( = ?auto_133929 ?auto_133933 ) ) ( not ( = ?auto_133929 ?auto_133934 ) ) ( not ( = ?auto_133929 ?auto_133935 ) ) ( not ( = ?auto_133930 ?auto_133931 ) ) ( not ( = ?auto_133930 ?auto_133932 ) ) ( not ( = ?auto_133930 ?auto_133933 ) ) ( not ( = ?auto_133930 ?auto_133934 ) ) ( not ( = ?auto_133930 ?auto_133935 ) ) ( not ( = ?auto_133931 ?auto_133932 ) ) ( not ( = ?auto_133931 ?auto_133933 ) ) ( not ( = ?auto_133931 ?auto_133934 ) ) ( not ( = ?auto_133931 ?auto_133935 ) ) ( not ( = ?auto_133932 ?auto_133933 ) ) ( not ( = ?auto_133932 ?auto_133934 ) ) ( not ( = ?auto_133932 ?auto_133935 ) ) ( not ( = ?auto_133933 ?auto_133934 ) ) ( not ( = ?auto_133933 ?auto_133935 ) ) ( not ( = ?auto_133934 ?auto_133935 ) ) ( ON ?auto_133935 ?auto_133936 ) ( not ( = ?auto_133928 ?auto_133936 ) ) ( not ( = ?auto_133929 ?auto_133936 ) ) ( not ( = ?auto_133930 ?auto_133936 ) ) ( not ( = ?auto_133931 ?auto_133936 ) ) ( not ( = ?auto_133932 ?auto_133936 ) ) ( not ( = ?auto_133933 ?auto_133936 ) ) ( not ( = ?auto_133934 ?auto_133936 ) ) ( not ( = ?auto_133935 ?auto_133936 ) ) ( ON ?auto_133934 ?auto_133935 ) ( ON-TABLE ?auto_133936 ) ( ON ?auto_133933 ?auto_133934 ) ( ON ?auto_133932 ?auto_133933 ) ( ON ?auto_133931 ?auto_133932 ) ( CLEAR ?auto_133929 ) ( ON ?auto_133930 ?auto_133931 ) ( CLEAR ?auto_133930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_133936 ?auto_133935 ?auto_133934 ?auto_133933 ?auto_133932 ?auto_133931 )
      ( MAKE-8PILE ?auto_133928 ?auto_133929 ?auto_133930 ?auto_133931 ?auto_133932 ?auto_133933 ?auto_133934 ?auto_133935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133937 - BLOCK
      ?auto_133938 - BLOCK
      ?auto_133939 - BLOCK
      ?auto_133940 - BLOCK
      ?auto_133941 - BLOCK
      ?auto_133942 - BLOCK
      ?auto_133943 - BLOCK
      ?auto_133944 - BLOCK
    )
    :vars
    (
      ?auto_133945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133937 ) ( not ( = ?auto_133937 ?auto_133938 ) ) ( not ( = ?auto_133937 ?auto_133939 ) ) ( not ( = ?auto_133937 ?auto_133940 ) ) ( not ( = ?auto_133937 ?auto_133941 ) ) ( not ( = ?auto_133937 ?auto_133942 ) ) ( not ( = ?auto_133937 ?auto_133943 ) ) ( not ( = ?auto_133937 ?auto_133944 ) ) ( not ( = ?auto_133938 ?auto_133939 ) ) ( not ( = ?auto_133938 ?auto_133940 ) ) ( not ( = ?auto_133938 ?auto_133941 ) ) ( not ( = ?auto_133938 ?auto_133942 ) ) ( not ( = ?auto_133938 ?auto_133943 ) ) ( not ( = ?auto_133938 ?auto_133944 ) ) ( not ( = ?auto_133939 ?auto_133940 ) ) ( not ( = ?auto_133939 ?auto_133941 ) ) ( not ( = ?auto_133939 ?auto_133942 ) ) ( not ( = ?auto_133939 ?auto_133943 ) ) ( not ( = ?auto_133939 ?auto_133944 ) ) ( not ( = ?auto_133940 ?auto_133941 ) ) ( not ( = ?auto_133940 ?auto_133942 ) ) ( not ( = ?auto_133940 ?auto_133943 ) ) ( not ( = ?auto_133940 ?auto_133944 ) ) ( not ( = ?auto_133941 ?auto_133942 ) ) ( not ( = ?auto_133941 ?auto_133943 ) ) ( not ( = ?auto_133941 ?auto_133944 ) ) ( not ( = ?auto_133942 ?auto_133943 ) ) ( not ( = ?auto_133942 ?auto_133944 ) ) ( not ( = ?auto_133943 ?auto_133944 ) ) ( ON ?auto_133944 ?auto_133945 ) ( not ( = ?auto_133937 ?auto_133945 ) ) ( not ( = ?auto_133938 ?auto_133945 ) ) ( not ( = ?auto_133939 ?auto_133945 ) ) ( not ( = ?auto_133940 ?auto_133945 ) ) ( not ( = ?auto_133941 ?auto_133945 ) ) ( not ( = ?auto_133942 ?auto_133945 ) ) ( not ( = ?auto_133943 ?auto_133945 ) ) ( not ( = ?auto_133944 ?auto_133945 ) ) ( ON ?auto_133943 ?auto_133944 ) ( ON-TABLE ?auto_133945 ) ( ON ?auto_133942 ?auto_133943 ) ( ON ?auto_133941 ?auto_133942 ) ( ON ?auto_133940 ?auto_133941 ) ( ON ?auto_133939 ?auto_133940 ) ( CLEAR ?auto_133939 ) ( HOLDING ?auto_133938 ) ( CLEAR ?auto_133937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_133937 ?auto_133938 )
      ( MAKE-8PILE ?auto_133937 ?auto_133938 ?auto_133939 ?auto_133940 ?auto_133941 ?auto_133942 ?auto_133943 ?auto_133944 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133946 - BLOCK
      ?auto_133947 - BLOCK
      ?auto_133948 - BLOCK
      ?auto_133949 - BLOCK
      ?auto_133950 - BLOCK
      ?auto_133951 - BLOCK
      ?auto_133952 - BLOCK
      ?auto_133953 - BLOCK
    )
    :vars
    (
      ?auto_133954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_133946 ) ( not ( = ?auto_133946 ?auto_133947 ) ) ( not ( = ?auto_133946 ?auto_133948 ) ) ( not ( = ?auto_133946 ?auto_133949 ) ) ( not ( = ?auto_133946 ?auto_133950 ) ) ( not ( = ?auto_133946 ?auto_133951 ) ) ( not ( = ?auto_133946 ?auto_133952 ) ) ( not ( = ?auto_133946 ?auto_133953 ) ) ( not ( = ?auto_133947 ?auto_133948 ) ) ( not ( = ?auto_133947 ?auto_133949 ) ) ( not ( = ?auto_133947 ?auto_133950 ) ) ( not ( = ?auto_133947 ?auto_133951 ) ) ( not ( = ?auto_133947 ?auto_133952 ) ) ( not ( = ?auto_133947 ?auto_133953 ) ) ( not ( = ?auto_133948 ?auto_133949 ) ) ( not ( = ?auto_133948 ?auto_133950 ) ) ( not ( = ?auto_133948 ?auto_133951 ) ) ( not ( = ?auto_133948 ?auto_133952 ) ) ( not ( = ?auto_133948 ?auto_133953 ) ) ( not ( = ?auto_133949 ?auto_133950 ) ) ( not ( = ?auto_133949 ?auto_133951 ) ) ( not ( = ?auto_133949 ?auto_133952 ) ) ( not ( = ?auto_133949 ?auto_133953 ) ) ( not ( = ?auto_133950 ?auto_133951 ) ) ( not ( = ?auto_133950 ?auto_133952 ) ) ( not ( = ?auto_133950 ?auto_133953 ) ) ( not ( = ?auto_133951 ?auto_133952 ) ) ( not ( = ?auto_133951 ?auto_133953 ) ) ( not ( = ?auto_133952 ?auto_133953 ) ) ( ON ?auto_133953 ?auto_133954 ) ( not ( = ?auto_133946 ?auto_133954 ) ) ( not ( = ?auto_133947 ?auto_133954 ) ) ( not ( = ?auto_133948 ?auto_133954 ) ) ( not ( = ?auto_133949 ?auto_133954 ) ) ( not ( = ?auto_133950 ?auto_133954 ) ) ( not ( = ?auto_133951 ?auto_133954 ) ) ( not ( = ?auto_133952 ?auto_133954 ) ) ( not ( = ?auto_133953 ?auto_133954 ) ) ( ON ?auto_133952 ?auto_133953 ) ( ON-TABLE ?auto_133954 ) ( ON ?auto_133951 ?auto_133952 ) ( ON ?auto_133950 ?auto_133951 ) ( ON ?auto_133949 ?auto_133950 ) ( ON ?auto_133948 ?auto_133949 ) ( CLEAR ?auto_133946 ) ( ON ?auto_133947 ?auto_133948 ) ( CLEAR ?auto_133947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_133954 ?auto_133953 ?auto_133952 ?auto_133951 ?auto_133950 ?auto_133949 ?auto_133948 )
      ( MAKE-8PILE ?auto_133946 ?auto_133947 ?auto_133948 ?auto_133949 ?auto_133950 ?auto_133951 ?auto_133952 ?auto_133953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133955 - BLOCK
      ?auto_133956 - BLOCK
      ?auto_133957 - BLOCK
      ?auto_133958 - BLOCK
      ?auto_133959 - BLOCK
      ?auto_133960 - BLOCK
      ?auto_133961 - BLOCK
      ?auto_133962 - BLOCK
    )
    :vars
    (
      ?auto_133963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133955 ?auto_133956 ) ) ( not ( = ?auto_133955 ?auto_133957 ) ) ( not ( = ?auto_133955 ?auto_133958 ) ) ( not ( = ?auto_133955 ?auto_133959 ) ) ( not ( = ?auto_133955 ?auto_133960 ) ) ( not ( = ?auto_133955 ?auto_133961 ) ) ( not ( = ?auto_133955 ?auto_133962 ) ) ( not ( = ?auto_133956 ?auto_133957 ) ) ( not ( = ?auto_133956 ?auto_133958 ) ) ( not ( = ?auto_133956 ?auto_133959 ) ) ( not ( = ?auto_133956 ?auto_133960 ) ) ( not ( = ?auto_133956 ?auto_133961 ) ) ( not ( = ?auto_133956 ?auto_133962 ) ) ( not ( = ?auto_133957 ?auto_133958 ) ) ( not ( = ?auto_133957 ?auto_133959 ) ) ( not ( = ?auto_133957 ?auto_133960 ) ) ( not ( = ?auto_133957 ?auto_133961 ) ) ( not ( = ?auto_133957 ?auto_133962 ) ) ( not ( = ?auto_133958 ?auto_133959 ) ) ( not ( = ?auto_133958 ?auto_133960 ) ) ( not ( = ?auto_133958 ?auto_133961 ) ) ( not ( = ?auto_133958 ?auto_133962 ) ) ( not ( = ?auto_133959 ?auto_133960 ) ) ( not ( = ?auto_133959 ?auto_133961 ) ) ( not ( = ?auto_133959 ?auto_133962 ) ) ( not ( = ?auto_133960 ?auto_133961 ) ) ( not ( = ?auto_133960 ?auto_133962 ) ) ( not ( = ?auto_133961 ?auto_133962 ) ) ( ON ?auto_133962 ?auto_133963 ) ( not ( = ?auto_133955 ?auto_133963 ) ) ( not ( = ?auto_133956 ?auto_133963 ) ) ( not ( = ?auto_133957 ?auto_133963 ) ) ( not ( = ?auto_133958 ?auto_133963 ) ) ( not ( = ?auto_133959 ?auto_133963 ) ) ( not ( = ?auto_133960 ?auto_133963 ) ) ( not ( = ?auto_133961 ?auto_133963 ) ) ( not ( = ?auto_133962 ?auto_133963 ) ) ( ON ?auto_133961 ?auto_133962 ) ( ON-TABLE ?auto_133963 ) ( ON ?auto_133960 ?auto_133961 ) ( ON ?auto_133959 ?auto_133960 ) ( ON ?auto_133958 ?auto_133959 ) ( ON ?auto_133957 ?auto_133958 ) ( ON ?auto_133956 ?auto_133957 ) ( CLEAR ?auto_133956 ) ( HOLDING ?auto_133955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_133955 )
      ( MAKE-8PILE ?auto_133955 ?auto_133956 ?auto_133957 ?auto_133958 ?auto_133959 ?auto_133960 ?auto_133961 ?auto_133962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_133964 - BLOCK
      ?auto_133965 - BLOCK
      ?auto_133966 - BLOCK
      ?auto_133967 - BLOCK
      ?auto_133968 - BLOCK
      ?auto_133969 - BLOCK
      ?auto_133970 - BLOCK
      ?auto_133971 - BLOCK
    )
    :vars
    (
      ?auto_133972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_133964 ?auto_133965 ) ) ( not ( = ?auto_133964 ?auto_133966 ) ) ( not ( = ?auto_133964 ?auto_133967 ) ) ( not ( = ?auto_133964 ?auto_133968 ) ) ( not ( = ?auto_133964 ?auto_133969 ) ) ( not ( = ?auto_133964 ?auto_133970 ) ) ( not ( = ?auto_133964 ?auto_133971 ) ) ( not ( = ?auto_133965 ?auto_133966 ) ) ( not ( = ?auto_133965 ?auto_133967 ) ) ( not ( = ?auto_133965 ?auto_133968 ) ) ( not ( = ?auto_133965 ?auto_133969 ) ) ( not ( = ?auto_133965 ?auto_133970 ) ) ( not ( = ?auto_133965 ?auto_133971 ) ) ( not ( = ?auto_133966 ?auto_133967 ) ) ( not ( = ?auto_133966 ?auto_133968 ) ) ( not ( = ?auto_133966 ?auto_133969 ) ) ( not ( = ?auto_133966 ?auto_133970 ) ) ( not ( = ?auto_133966 ?auto_133971 ) ) ( not ( = ?auto_133967 ?auto_133968 ) ) ( not ( = ?auto_133967 ?auto_133969 ) ) ( not ( = ?auto_133967 ?auto_133970 ) ) ( not ( = ?auto_133967 ?auto_133971 ) ) ( not ( = ?auto_133968 ?auto_133969 ) ) ( not ( = ?auto_133968 ?auto_133970 ) ) ( not ( = ?auto_133968 ?auto_133971 ) ) ( not ( = ?auto_133969 ?auto_133970 ) ) ( not ( = ?auto_133969 ?auto_133971 ) ) ( not ( = ?auto_133970 ?auto_133971 ) ) ( ON ?auto_133971 ?auto_133972 ) ( not ( = ?auto_133964 ?auto_133972 ) ) ( not ( = ?auto_133965 ?auto_133972 ) ) ( not ( = ?auto_133966 ?auto_133972 ) ) ( not ( = ?auto_133967 ?auto_133972 ) ) ( not ( = ?auto_133968 ?auto_133972 ) ) ( not ( = ?auto_133969 ?auto_133972 ) ) ( not ( = ?auto_133970 ?auto_133972 ) ) ( not ( = ?auto_133971 ?auto_133972 ) ) ( ON ?auto_133970 ?auto_133971 ) ( ON-TABLE ?auto_133972 ) ( ON ?auto_133969 ?auto_133970 ) ( ON ?auto_133968 ?auto_133969 ) ( ON ?auto_133967 ?auto_133968 ) ( ON ?auto_133966 ?auto_133967 ) ( ON ?auto_133965 ?auto_133966 ) ( ON ?auto_133964 ?auto_133965 ) ( CLEAR ?auto_133964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_133972 ?auto_133971 ?auto_133970 ?auto_133969 ?auto_133968 ?auto_133967 ?auto_133966 ?auto_133965 )
      ( MAKE-8PILE ?auto_133964 ?auto_133965 ?auto_133966 ?auto_133967 ?auto_133968 ?auto_133969 ?auto_133970 ?auto_133971 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_133980 - BLOCK
      ?auto_133981 - BLOCK
      ?auto_133982 - BLOCK
      ?auto_133983 - BLOCK
      ?auto_133984 - BLOCK
      ?auto_133985 - BLOCK
      ?auto_133986 - BLOCK
    )
    :vars
    (
      ?auto_133987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_133987 ?auto_133986 ) ( CLEAR ?auto_133987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_133980 ) ( ON ?auto_133981 ?auto_133980 ) ( ON ?auto_133982 ?auto_133981 ) ( ON ?auto_133983 ?auto_133982 ) ( ON ?auto_133984 ?auto_133983 ) ( ON ?auto_133985 ?auto_133984 ) ( ON ?auto_133986 ?auto_133985 ) ( not ( = ?auto_133980 ?auto_133981 ) ) ( not ( = ?auto_133980 ?auto_133982 ) ) ( not ( = ?auto_133980 ?auto_133983 ) ) ( not ( = ?auto_133980 ?auto_133984 ) ) ( not ( = ?auto_133980 ?auto_133985 ) ) ( not ( = ?auto_133980 ?auto_133986 ) ) ( not ( = ?auto_133980 ?auto_133987 ) ) ( not ( = ?auto_133981 ?auto_133982 ) ) ( not ( = ?auto_133981 ?auto_133983 ) ) ( not ( = ?auto_133981 ?auto_133984 ) ) ( not ( = ?auto_133981 ?auto_133985 ) ) ( not ( = ?auto_133981 ?auto_133986 ) ) ( not ( = ?auto_133981 ?auto_133987 ) ) ( not ( = ?auto_133982 ?auto_133983 ) ) ( not ( = ?auto_133982 ?auto_133984 ) ) ( not ( = ?auto_133982 ?auto_133985 ) ) ( not ( = ?auto_133982 ?auto_133986 ) ) ( not ( = ?auto_133982 ?auto_133987 ) ) ( not ( = ?auto_133983 ?auto_133984 ) ) ( not ( = ?auto_133983 ?auto_133985 ) ) ( not ( = ?auto_133983 ?auto_133986 ) ) ( not ( = ?auto_133983 ?auto_133987 ) ) ( not ( = ?auto_133984 ?auto_133985 ) ) ( not ( = ?auto_133984 ?auto_133986 ) ) ( not ( = ?auto_133984 ?auto_133987 ) ) ( not ( = ?auto_133985 ?auto_133986 ) ) ( not ( = ?auto_133985 ?auto_133987 ) ) ( not ( = ?auto_133986 ?auto_133987 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_133987 ?auto_133986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134005 - BLOCK
      ?auto_134006 - BLOCK
      ?auto_134007 - BLOCK
      ?auto_134008 - BLOCK
      ?auto_134009 - BLOCK
      ?auto_134010 - BLOCK
      ?auto_134011 - BLOCK
    )
    :vars
    (
      ?auto_134012 - BLOCK
      ?auto_134013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134005 ) ( ON ?auto_134006 ?auto_134005 ) ( ON ?auto_134007 ?auto_134006 ) ( ON ?auto_134008 ?auto_134007 ) ( ON ?auto_134009 ?auto_134008 ) ( ON ?auto_134010 ?auto_134009 ) ( not ( = ?auto_134005 ?auto_134006 ) ) ( not ( = ?auto_134005 ?auto_134007 ) ) ( not ( = ?auto_134005 ?auto_134008 ) ) ( not ( = ?auto_134005 ?auto_134009 ) ) ( not ( = ?auto_134005 ?auto_134010 ) ) ( not ( = ?auto_134005 ?auto_134011 ) ) ( not ( = ?auto_134005 ?auto_134012 ) ) ( not ( = ?auto_134006 ?auto_134007 ) ) ( not ( = ?auto_134006 ?auto_134008 ) ) ( not ( = ?auto_134006 ?auto_134009 ) ) ( not ( = ?auto_134006 ?auto_134010 ) ) ( not ( = ?auto_134006 ?auto_134011 ) ) ( not ( = ?auto_134006 ?auto_134012 ) ) ( not ( = ?auto_134007 ?auto_134008 ) ) ( not ( = ?auto_134007 ?auto_134009 ) ) ( not ( = ?auto_134007 ?auto_134010 ) ) ( not ( = ?auto_134007 ?auto_134011 ) ) ( not ( = ?auto_134007 ?auto_134012 ) ) ( not ( = ?auto_134008 ?auto_134009 ) ) ( not ( = ?auto_134008 ?auto_134010 ) ) ( not ( = ?auto_134008 ?auto_134011 ) ) ( not ( = ?auto_134008 ?auto_134012 ) ) ( not ( = ?auto_134009 ?auto_134010 ) ) ( not ( = ?auto_134009 ?auto_134011 ) ) ( not ( = ?auto_134009 ?auto_134012 ) ) ( not ( = ?auto_134010 ?auto_134011 ) ) ( not ( = ?auto_134010 ?auto_134012 ) ) ( not ( = ?auto_134011 ?auto_134012 ) ) ( ON ?auto_134012 ?auto_134013 ) ( CLEAR ?auto_134012 ) ( not ( = ?auto_134005 ?auto_134013 ) ) ( not ( = ?auto_134006 ?auto_134013 ) ) ( not ( = ?auto_134007 ?auto_134013 ) ) ( not ( = ?auto_134008 ?auto_134013 ) ) ( not ( = ?auto_134009 ?auto_134013 ) ) ( not ( = ?auto_134010 ?auto_134013 ) ) ( not ( = ?auto_134011 ?auto_134013 ) ) ( not ( = ?auto_134012 ?auto_134013 ) ) ( HOLDING ?auto_134011 ) ( CLEAR ?auto_134010 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134005 ?auto_134006 ?auto_134007 ?auto_134008 ?auto_134009 ?auto_134010 ?auto_134011 ?auto_134012 )
      ( MAKE-7PILE ?auto_134005 ?auto_134006 ?auto_134007 ?auto_134008 ?auto_134009 ?auto_134010 ?auto_134011 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134014 - BLOCK
      ?auto_134015 - BLOCK
      ?auto_134016 - BLOCK
      ?auto_134017 - BLOCK
      ?auto_134018 - BLOCK
      ?auto_134019 - BLOCK
      ?auto_134020 - BLOCK
    )
    :vars
    (
      ?auto_134022 - BLOCK
      ?auto_134021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134014 ) ( ON ?auto_134015 ?auto_134014 ) ( ON ?auto_134016 ?auto_134015 ) ( ON ?auto_134017 ?auto_134016 ) ( ON ?auto_134018 ?auto_134017 ) ( ON ?auto_134019 ?auto_134018 ) ( not ( = ?auto_134014 ?auto_134015 ) ) ( not ( = ?auto_134014 ?auto_134016 ) ) ( not ( = ?auto_134014 ?auto_134017 ) ) ( not ( = ?auto_134014 ?auto_134018 ) ) ( not ( = ?auto_134014 ?auto_134019 ) ) ( not ( = ?auto_134014 ?auto_134020 ) ) ( not ( = ?auto_134014 ?auto_134022 ) ) ( not ( = ?auto_134015 ?auto_134016 ) ) ( not ( = ?auto_134015 ?auto_134017 ) ) ( not ( = ?auto_134015 ?auto_134018 ) ) ( not ( = ?auto_134015 ?auto_134019 ) ) ( not ( = ?auto_134015 ?auto_134020 ) ) ( not ( = ?auto_134015 ?auto_134022 ) ) ( not ( = ?auto_134016 ?auto_134017 ) ) ( not ( = ?auto_134016 ?auto_134018 ) ) ( not ( = ?auto_134016 ?auto_134019 ) ) ( not ( = ?auto_134016 ?auto_134020 ) ) ( not ( = ?auto_134016 ?auto_134022 ) ) ( not ( = ?auto_134017 ?auto_134018 ) ) ( not ( = ?auto_134017 ?auto_134019 ) ) ( not ( = ?auto_134017 ?auto_134020 ) ) ( not ( = ?auto_134017 ?auto_134022 ) ) ( not ( = ?auto_134018 ?auto_134019 ) ) ( not ( = ?auto_134018 ?auto_134020 ) ) ( not ( = ?auto_134018 ?auto_134022 ) ) ( not ( = ?auto_134019 ?auto_134020 ) ) ( not ( = ?auto_134019 ?auto_134022 ) ) ( not ( = ?auto_134020 ?auto_134022 ) ) ( ON ?auto_134022 ?auto_134021 ) ( not ( = ?auto_134014 ?auto_134021 ) ) ( not ( = ?auto_134015 ?auto_134021 ) ) ( not ( = ?auto_134016 ?auto_134021 ) ) ( not ( = ?auto_134017 ?auto_134021 ) ) ( not ( = ?auto_134018 ?auto_134021 ) ) ( not ( = ?auto_134019 ?auto_134021 ) ) ( not ( = ?auto_134020 ?auto_134021 ) ) ( not ( = ?auto_134022 ?auto_134021 ) ) ( CLEAR ?auto_134019 ) ( ON ?auto_134020 ?auto_134022 ) ( CLEAR ?auto_134020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134021 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134021 ?auto_134022 )
      ( MAKE-7PILE ?auto_134014 ?auto_134015 ?auto_134016 ?auto_134017 ?auto_134018 ?auto_134019 ?auto_134020 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134023 - BLOCK
      ?auto_134024 - BLOCK
      ?auto_134025 - BLOCK
      ?auto_134026 - BLOCK
      ?auto_134027 - BLOCK
      ?auto_134028 - BLOCK
      ?auto_134029 - BLOCK
    )
    :vars
    (
      ?auto_134030 - BLOCK
      ?auto_134031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134023 ) ( ON ?auto_134024 ?auto_134023 ) ( ON ?auto_134025 ?auto_134024 ) ( ON ?auto_134026 ?auto_134025 ) ( ON ?auto_134027 ?auto_134026 ) ( not ( = ?auto_134023 ?auto_134024 ) ) ( not ( = ?auto_134023 ?auto_134025 ) ) ( not ( = ?auto_134023 ?auto_134026 ) ) ( not ( = ?auto_134023 ?auto_134027 ) ) ( not ( = ?auto_134023 ?auto_134028 ) ) ( not ( = ?auto_134023 ?auto_134029 ) ) ( not ( = ?auto_134023 ?auto_134030 ) ) ( not ( = ?auto_134024 ?auto_134025 ) ) ( not ( = ?auto_134024 ?auto_134026 ) ) ( not ( = ?auto_134024 ?auto_134027 ) ) ( not ( = ?auto_134024 ?auto_134028 ) ) ( not ( = ?auto_134024 ?auto_134029 ) ) ( not ( = ?auto_134024 ?auto_134030 ) ) ( not ( = ?auto_134025 ?auto_134026 ) ) ( not ( = ?auto_134025 ?auto_134027 ) ) ( not ( = ?auto_134025 ?auto_134028 ) ) ( not ( = ?auto_134025 ?auto_134029 ) ) ( not ( = ?auto_134025 ?auto_134030 ) ) ( not ( = ?auto_134026 ?auto_134027 ) ) ( not ( = ?auto_134026 ?auto_134028 ) ) ( not ( = ?auto_134026 ?auto_134029 ) ) ( not ( = ?auto_134026 ?auto_134030 ) ) ( not ( = ?auto_134027 ?auto_134028 ) ) ( not ( = ?auto_134027 ?auto_134029 ) ) ( not ( = ?auto_134027 ?auto_134030 ) ) ( not ( = ?auto_134028 ?auto_134029 ) ) ( not ( = ?auto_134028 ?auto_134030 ) ) ( not ( = ?auto_134029 ?auto_134030 ) ) ( ON ?auto_134030 ?auto_134031 ) ( not ( = ?auto_134023 ?auto_134031 ) ) ( not ( = ?auto_134024 ?auto_134031 ) ) ( not ( = ?auto_134025 ?auto_134031 ) ) ( not ( = ?auto_134026 ?auto_134031 ) ) ( not ( = ?auto_134027 ?auto_134031 ) ) ( not ( = ?auto_134028 ?auto_134031 ) ) ( not ( = ?auto_134029 ?auto_134031 ) ) ( not ( = ?auto_134030 ?auto_134031 ) ) ( ON ?auto_134029 ?auto_134030 ) ( CLEAR ?auto_134029 ) ( ON-TABLE ?auto_134031 ) ( HOLDING ?auto_134028 ) ( CLEAR ?auto_134027 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134023 ?auto_134024 ?auto_134025 ?auto_134026 ?auto_134027 ?auto_134028 )
      ( MAKE-7PILE ?auto_134023 ?auto_134024 ?auto_134025 ?auto_134026 ?auto_134027 ?auto_134028 ?auto_134029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134032 - BLOCK
      ?auto_134033 - BLOCK
      ?auto_134034 - BLOCK
      ?auto_134035 - BLOCK
      ?auto_134036 - BLOCK
      ?auto_134037 - BLOCK
      ?auto_134038 - BLOCK
    )
    :vars
    (
      ?auto_134039 - BLOCK
      ?auto_134040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134032 ) ( ON ?auto_134033 ?auto_134032 ) ( ON ?auto_134034 ?auto_134033 ) ( ON ?auto_134035 ?auto_134034 ) ( ON ?auto_134036 ?auto_134035 ) ( not ( = ?auto_134032 ?auto_134033 ) ) ( not ( = ?auto_134032 ?auto_134034 ) ) ( not ( = ?auto_134032 ?auto_134035 ) ) ( not ( = ?auto_134032 ?auto_134036 ) ) ( not ( = ?auto_134032 ?auto_134037 ) ) ( not ( = ?auto_134032 ?auto_134038 ) ) ( not ( = ?auto_134032 ?auto_134039 ) ) ( not ( = ?auto_134033 ?auto_134034 ) ) ( not ( = ?auto_134033 ?auto_134035 ) ) ( not ( = ?auto_134033 ?auto_134036 ) ) ( not ( = ?auto_134033 ?auto_134037 ) ) ( not ( = ?auto_134033 ?auto_134038 ) ) ( not ( = ?auto_134033 ?auto_134039 ) ) ( not ( = ?auto_134034 ?auto_134035 ) ) ( not ( = ?auto_134034 ?auto_134036 ) ) ( not ( = ?auto_134034 ?auto_134037 ) ) ( not ( = ?auto_134034 ?auto_134038 ) ) ( not ( = ?auto_134034 ?auto_134039 ) ) ( not ( = ?auto_134035 ?auto_134036 ) ) ( not ( = ?auto_134035 ?auto_134037 ) ) ( not ( = ?auto_134035 ?auto_134038 ) ) ( not ( = ?auto_134035 ?auto_134039 ) ) ( not ( = ?auto_134036 ?auto_134037 ) ) ( not ( = ?auto_134036 ?auto_134038 ) ) ( not ( = ?auto_134036 ?auto_134039 ) ) ( not ( = ?auto_134037 ?auto_134038 ) ) ( not ( = ?auto_134037 ?auto_134039 ) ) ( not ( = ?auto_134038 ?auto_134039 ) ) ( ON ?auto_134039 ?auto_134040 ) ( not ( = ?auto_134032 ?auto_134040 ) ) ( not ( = ?auto_134033 ?auto_134040 ) ) ( not ( = ?auto_134034 ?auto_134040 ) ) ( not ( = ?auto_134035 ?auto_134040 ) ) ( not ( = ?auto_134036 ?auto_134040 ) ) ( not ( = ?auto_134037 ?auto_134040 ) ) ( not ( = ?auto_134038 ?auto_134040 ) ) ( not ( = ?auto_134039 ?auto_134040 ) ) ( ON ?auto_134038 ?auto_134039 ) ( ON-TABLE ?auto_134040 ) ( CLEAR ?auto_134036 ) ( ON ?auto_134037 ?auto_134038 ) ( CLEAR ?auto_134037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134040 ?auto_134039 ?auto_134038 )
      ( MAKE-7PILE ?auto_134032 ?auto_134033 ?auto_134034 ?auto_134035 ?auto_134036 ?auto_134037 ?auto_134038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134041 - BLOCK
      ?auto_134042 - BLOCK
      ?auto_134043 - BLOCK
      ?auto_134044 - BLOCK
      ?auto_134045 - BLOCK
      ?auto_134046 - BLOCK
      ?auto_134047 - BLOCK
    )
    :vars
    (
      ?auto_134049 - BLOCK
      ?auto_134048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134041 ) ( ON ?auto_134042 ?auto_134041 ) ( ON ?auto_134043 ?auto_134042 ) ( ON ?auto_134044 ?auto_134043 ) ( not ( = ?auto_134041 ?auto_134042 ) ) ( not ( = ?auto_134041 ?auto_134043 ) ) ( not ( = ?auto_134041 ?auto_134044 ) ) ( not ( = ?auto_134041 ?auto_134045 ) ) ( not ( = ?auto_134041 ?auto_134046 ) ) ( not ( = ?auto_134041 ?auto_134047 ) ) ( not ( = ?auto_134041 ?auto_134049 ) ) ( not ( = ?auto_134042 ?auto_134043 ) ) ( not ( = ?auto_134042 ?auto_134044 ) ) ( not ( = ?auto_134042 ?auto_134045 ) ) ( not ( = ?auto_134042 ?auto_134046 ) ) ( not ( = ?auto_134042 ?auto_134047 ) ) ( not ( = ?auto_134042 ?auto_134049 ) ) ( not ( = ?auto_134043 ?auto_134044 ) ) ( not ( = ?auto_134043 ?auto_134045 ) ) ( not ( = ?auto_134043 ?auto_134046 ) ) ( not ( = ?auto_134043 ?auto_134047 ) ) ( not ( = ?auto_134043 ?auto_134049 ) ) ( not ( = ?auto_134044 ?auto_134045 ) ) ( not ( = ?auto_134044 ?auto_134046 ) ) ( not ( = ?auto_134044 ?auto_134047 ) ) ( not ( = ?auto_134044 ?auto_134049 ) ) ( not ( = ?auto_134045 ?auto_134046 ) ) ( not ( = ?auto_134045 ?auto_134047 ) ) ( not ( = ?auto_134045 ?auto_134049 ) ) ( not ( = ?auto_134046 ?auto_134047 ) ) ( not ( = ?auto_134046 ?auto_134049 ) ) ( not ( = ?auto_134047 ?auto_134049 ) ) ( ON ?auto_134049 ?auto_134048 ) ( not ( = ?auto_134041 ?auto_134048 ) ) ( not ( = ?auto_134042 ?auto_134048 ) ) ( not ( = ?auto_134043 ?auto_134048 ) ) ( not ( = ?auto_134044 ?auto_134048 ) ) ( not ( = ?auto_134045 ?auto_134048 ) ) ( not ( = ?auto_134046 ?auto_134048 ) ) ( not ( = ?auto_134047 ?auto_134048 ) ) ( not ( = ?auto_134049 ?auto_134048 ) ) ( ON ?auto_134047 ?auto_134049 ) ( ON-TABLE ?auto_134048 ) ( ON ?auto_134046 ?auto_134047 ) ( CLEAR ?auto_134046 ) ( HOLDING ?auto_134045 ) ( CLEAR ?auto_134044 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134041 ?auto_134042 ?auto_134043 ?auto_134044 ?auto_134045 )
      ( MAKE-7PILE ?auto_134041 ?auto_134042 ?auto_134043 ?auto_134044 ?auto_134045 ?auto_134046 ?auto_134047 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134050 - BLOCK
      ?auto_134051 - BLOCK
      ?auto_134052 - BLOCK
      ?auto_134053 - BLOCK
      ?auto_134054 - BLOCK
      ?auto_134055 - BLOCK
      ?auto_134056 - BLOCK
    )
    :vars
    (
      ?auto_134058 - BLOCK
      ?auto_134057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134050 ) ( ON ?auto_134051 ?auto_134050 ) ( ON ?auto_134052 ?auto_134051 ) ( ON ?auto_134053 ?auto_134052 ) ( not ( = ?auto_134050 ?auto_134051 ) ) ( not ( = ?auto_134050 ?auto_134052 ) ) ( not ( = ?auto_134050 ?auto_134053 ) ) ( not ( = ?auto_134050 ?auto_134054 ) ) ( not ( = ?auto_134050 ?auto_134055 ) ) ( not ( = ?auto_134050 ?auto_134056 ) ) ( not ( = ?auto_134050 ?auto_134058 ) ) ( not ( = ?auto_134051 ?auto_134052 ) ) ( not ( = ?auto_134051 ?auto_134053 ) ) ( not ( = ?auto_134051 ?auto_134054 ) ) ( not ( = ?auto_134051 ?auto_134055 ) ) ( not ( = ?auto_134051 ?auto_134056 ) ) ( not ( = ?auto_134051 ?auto_134058 ) ) ( not ( = ?auto_134052 ?auto_134053 ) ) ( not ( = ?auto_134052 ?auto_134054 ) ) ( not ( = ?auto_134052 ?auto_134055 ) ) ( not ( = ?auto_134052 ?auto_134056 ) ) ( not ( = ?auto_134052 ?auto_134058 ) ) ( not ( = ?auto_134053 ?auto_134054 ) ) ( not ( = ?auto_134053 ?auto_134055 ) ) ( not ( = ?auto_134053 ?auto_134056 ) ) ( not ( = ?auto_134053 ?auto_134058 ) ) ( not ( = ?auto_134054 ?auto_134055 ) ) ( not ( = ?auto_134054 ?auto_134056 ) ) ( not ( = ?auto_134054 ?auto_134058 ) ) ( not ( = ?auto_134055 ?auto_134056 ) ) ( not ( = ?auto_134055 ?auto_134058 ) ) ( not ( = ?auto_134056 ?auto_134058 ) ) ( ON ?auto_134058 ?auto_134057 ) ( not ( = ?auto_134050 ?auto_134057 ) ) ( not ( = ?auto_134051 ?auto_134057 ) ) ( not ( = ?auto_134052 ?auto_134057 ) ) ( not ( = ?auto_134053 ?auto_134057 ) ) ( not ( = ?auto_134054 ?auto_134057 ) ) ( not ( = ?auto_134055 ?auto_134057 ) ) ( not ( = ?auto_134056 ?auto_134057 ) ) ( not ( = ?auto_134058 ?auto_134057 ) ) ( ON ?auto_134056 ?auto_134058 ) ( ON-TABLE ?auto_134057 ) ( ON ?auto_134055 ?auto_134056 ) ( CLEAR ?auto_134053 ) ( ON ?auto_134054 ?auto_134055 ) ( CLEAR ?auto_134054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134057 ?auto_134058 ?auto_134056 ?auto_134055 )
      ( MAKE-7PILE ?auto_134050 ?auto_134051 ?auto_134052 ?auto_134053 ?auto_134054 ?auto_134055 ?auto_134056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134059 - BLOCK
      ?auto_134060 - BLOCK
      ?auto_134061 - BLOCK
      ?auto_134062 - BLOCK
      ?auto_134063 - BLOCK
      ?auto_134064 - BLOCK
      ?auto_134065 - BLOCK
    )
    :vars
    (
      ?auto_134067 - BLOCK
      ?auto_134066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134059 ) ( ON ?auto_134060 ?auto_134059 ) ( ON ?auto_134061 ?auto_134060 ) ( not ( = ?auto_134059 ?auto_134060 ) ) ( not ( = ?auto_134059 ?auto_134061 ) ) ( not ( = ?auto_134059 ?auto_134062 ) ) ( not ( = ?auto_134059 ?auto_134063 ) ) ( not ( = ?auto_134059 ?auto_134064 ) ) ( not ( = ?auto_134059 ?auto_134065 ) ) ( not ( = ?auto_134059 ?auto_134067 ) ) ( not ( = ?auto_134060 ?auto_134061 ) ) ( not ( = ?auto_134060 ?auto_134062 ) ) ( not ( = ?auto_134060 ?auto_134063 ) ) ( not ( = ?auto_134060 ?auto_134064 ) ) ( not ( = ?auto_134060 ?auto_134065 ) ) ( not ( = ?auto_134060 ?auto_134067 ) ) ( not ( = ?auto_134061 ?auto_134062 ) ) ( not ( = ?auto_134061 ?auto_134063 ) ) ( not ( = ?auto_134061 ?auto_134064 ) ) ( not ( = ?auto_134061 ?auto_134065 ) ) ( not ( = ?auto_134061 ?auto_134067 ) ) ( not ( = ?auto_134062 ?auto_134063 ) ) ( not ( = ?auto_134062 ?auto_134064 ) ) ( not ( = ?auto_134062 ?auto_134065 ) ) ( not ( = ?auto_134062 ?auto_134067 ) ) ( not ( = ?auto_134063 ?auto_134064 ) ) ( not ( = ?auto_134063 ?auto_134065 ) ) ( not ( = ?auto_134063 ?auto_134067 ) ) ( not ( = ?auto_134064 ?auto_134065 ) ) ( not ( = ?auto_134064 ?auto_134067 ) ) ( not ( = ?auto_134065 ?auto_134067 ) ) ( ON ?auto_134067 ?auto_134066 ) ( not ( = ?auto_134059 ?auto_134066 ) ) ( not ( = ?auto_134060 ?auto_134066 ) ) ( not ( = ?auto_134061 ?auto_134066 ) ) ( not ( = ?auto_134062 ?auto_134066 ) ) ( not ( = ?auto_134063 ?auto_134066 ) ) ( not ( = ?auto_134064 ?auto_134066 ) ) ( not ( = ?auto_134065 ?auto_134066 ) ) ( not ( = ?auto_134067 ?auto_134066 ) ) ( ON ?auto_134065 ?auto_134067 ) ( ON-TABLE ?auto_134066 ) ( ON ?auto_134064 ?auto_134065 ) ( ON ?auto_134063 ?auto_134064 ) ( CLEAR ?auto_134063 ) ( HOLDING ?auto_134062 ) ( CLEAR ?auto_134061 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134059 ?auto_134060 ?auto_134061 ?auto_134062 )
      ( MAKE-7PILE ?auto_134059 ?auto_134060 ?auto_134061 ?auto_134062 ?auto_134063 ?auto_134064 ?auto_134065 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134068 - BLOCK
      ?auto_134069 - BLOCK
      ?auto_134070 - BLOCK
      ?auto_134071 - BLOCK
      ?auto_134072 - BLOCK
      ?auto_134073 - BLOCK
      ?auto_134074 - BLOCK
    )
    :vars
    (
      ?auto_134075 - BLOCK
      ?auto_134076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134068 ) ( ON ?auto_134069 ?auto_134068 ) ( ON ?auto_134070 ?auto_134069 ) ( not ( = ?auto_134068 ?auto_134069 ) ) ( not ( = ?auto_134068 ?auto_134070 ) ) ( not ( = ?auto_134068 ?auto_134071 ) ) ( not ( = ?auto_134068 ?auto_134072 ) ) ( not ( = ?auto_134068 ?auto_134073 ) ) ( not ( = ?auto_134068 ?auto_134074 ) ) ( not ( = ?auto_134068 ?auto_134075 ) ) ( not ( = ?auto_134069 ?auto_134070 ) ) ( not ( = ?auto_134069 ?auto_134071 ) ) ( not ( = ?auto_134069 ?auto_134072 ) ) ( not ( = ?auto_134069 ?auto_134073 ) ) ( not ( = ?auto_134069 ?auto_134074 ) ) ( not ( = ?auto_134069 ?auto_134075 ) ) ( not ( = ?auto_134070 ?auto_134071 ) ) ( not ( = ?auto_134070 ?auto_134072 ) ) ( not ( = ?auto_134070 ?auto_134073 ) ) ( not ( = ?auto_134070 ?auto_134074 ) ) ( not ( = ?auto_134070 ?auto_134075 ) ) ( not ( = ?auto_134071 ?auto_134072 ) ) ( not ( = ?auto_134071 ?auto_134073 ) ) ( not ( = ?auto_134071 ?auto_134074 ) ) ( not ( = ?auto_134071 ?auto_134075 ) ) ( not ( = ?auto_134072 ?auto_134073 ) ) ( not ( = ?auto_134072 ?auto_134074 ) ) ( not ( = ?auto_134072 ?auto_134075 ) ) ( not ( = ?auto_134073 ?auto_134074 ) ) ( not ( = ?auto_134073 ?auto_134075 ) ) ( not ( = ?auto_134074 ?auto_134075 ) ) ( ON ?auto_134075 ?auto_134076 ) ( not ( = ?auto_134068 ?auto_134076 ) ) ( not ( = ?auto_134069 ?auto_134076 ) ) ( not ( = ?auto_134070 ?auto_134076 ) ) ( not ( = ?auto_134071 ?auto_134076 ) ) ( not ( = ?auto_134072 ?auto_134076 ) ) ( not ( = ?auto_134073 ?auto_134076 ) ) ( not ( = ?auto_134074 ?auto_134076 ) ) ( not ( = ?auto_134075 ?auto_134076 ) ) ( ON ?auto_134074 ?auto_134075 ) ( ON-TABLE ?auto_134076 ) ( ON ?auto_134073 ?auto_134074 ) ( ON ?auto_134072 ?auto_134073 ) ( CLEAR ?auto_134070 ) ( ON ?auto_134071 ?auto_134072 ) ( CLEAR ?auto_134071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134076 ?auto_134075 ?auto_134074 ?auto_134073 ?auto_134072 )
      ( MAKE-7PILE ?auto_134068 ?auto_134069 ?auto_134070 ?auto_134071 ?auto_134072 ?auto_134073 ?auto_134074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134077 - BLOCK
      ?auto_134078 - BLOCK
      ?auto_134079 - BLOCK
      ?auto_134080 - BLOCK
      ?auto_134081 - BLOCK
      ?auto_134082 - BLOCK
      ?auto_134083 - BLOCK
    )
    :vars
    (
      ?auto_134085 - BLOCK
      ?auto_134084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134077 ) ( ON ?auto_134078 ?auto_134077 ) ( not ( = ?auto_134077 ?auto_134078 ) ) ( not ( = ?auto_134077 ?auto_134079 ) ) ( not ( = ?auto_134077 ?auto_134080 ) ) ( not ( = ?auto_134077 ?auto_134081 ) ) ( not ( = ?auto_134077 ?auto_134082 ) ) ( not ( = ?auto_134077 ?auto_134083 ) ) ( not ( = ?auto_134077 ?auto_134085 ) ) ( not ( = ?auto_134078 ?auto_134079 ) ) ( not ( = ?auto_134078 ?auto_134080 ) ) ( not ( = ?auto_134078 ?auto_134081 ) ) ( not ( = ?auto_134078 ?auto_134082 ) ) ( not ( = ?auto_134078 ?auto_134083 ) ) ( not ( = ?auto_134078 ?auto_134085 ) ) ( not ( = ?auto_134079 ?auto_134080 ) ) ( not ( = ?auto_134079 ?auto_134081 ) ) ( not ( = ?auto_134079 ?auto_134082 ) ) ( not ( = ?auto_134079 ?auto_134083 ) ) ( not ( = ?auto_134079 ?auto_134085 ) ) ( not ( = ?auto_134080 ?auto_134081 ) ) ( not ( = ?auto_134080 ?auto_134082 ) ) ( not ( = ?auto_134080 ?auto_134083 ) ) ( not ( = ?auto_134080 ?auto_134085 ) ) ( not ( = ?auto_134081 ?auto_134082 ) ) ( not ( = ?auto_134081 ?auto_134083 ) ) ( not ( = ?auto_134081 ?auto_134085 ) ) ( not ( = ?auto_134082 ?auto_134083 ) ) ( not ( = ?auto_134082 ?auto_134085 ) ) ( not ( = ?auto_134083 ?auto_134085 ) ) ( ON ?auto_134085 ?auto_134084 ) ( not ( = ?auto_134077 ?auto_134084 ) ) ( not ( = ?auto_134078 ?auto_134084 ) ) ( not ( = ?auto_134079 ?auto_134084 ) ) ( not ( = ?auto_134080 ?auto_134084 ) ) ( not ( = ?auto_134081 ?auto_134084 ) ) ( not ( = ?auto_134082 ?auto_134084 ) ) ( not ( = ?auto_134083 ?auto_134084 ) ) ( not ( = ?auto_134085 ?auto_134084 ) ) ( ON ?auto_134083 ?auto_134085 ) ( ON-TABLE ?auto_134084 ) ( ON ?auto_134082 ?auto_134083 ) ( ON ?auto_134081 ?auto_134082 ) ( ON ?auto_134080 ?auto_134081 ) ( CLEAR ?auto_134080 ) ( HOLDING ?auto_134079 ) ( CLEAR ?auto_134078 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134077 ?auto_134078 ?auto_134079 )
      ( MAKE-7PILE ?auto_134077 ?auto_134078 ?auto_134079 ?auto_134080 ?auto_134081 ?auto_134082 ?auto_134083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134086 - BLOCK
      ?auto_134087 - BLOCK
      ?auto_134088 - BLOCK
      ?auto_134089 - BLOCK
      ?auto_134090 - BLOCK
      ?auto_134091 - BLOCK
      ?auto_134092 - BLOCK
    )
    :vars
    (
      ?auto_134094 - BLOCK
      ?auto_134093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134086 ) ( ON ?auto_134087 ?auto_134086 ) ( not ( = ?auto_134086 ?auto_134087 ) ) ( not ( = ?auto_134086 ?auto_134088 ) ) ( not ( = ?auto_134086 ?auto_134089 ) ) ( not ( = ?auto_134086 ?auto_134090 ) ) ( not ( = ?auto_134086 ?auto_134091 ) ) ( not ( = ?auto_134086 ?auto_134092 ) ) ( not ( = ?auto_134086 ?auto_134094 ) ) ( not ( = ?auto_134087 ?auto_134088 ) ) ( not ( = ?auto_134087 ?auto_134089 ) ) ( not ( = ?auto_134087 ?auto_134090 ) ) ( not ( = ?auto_134087 ?auto_134091 ) ) ( not ( = ?auto_134087 ?auto_134092 ) ) ( not ( = ?auto_134087 ?auto_134094 ) ) ( not ( = ?auto_134088 ?auto_134089 ) ) ( not ( = ?auto_134088 ?auto_134090 ) ) ( not ( = ?auto_134088 ?auto_134091 ) ) ( not ( = ?auto_134088 ?auto_134092 ) ) ( not ( = ?auto_134088 ?auto_134094 ) ) ( not ( = ?auto_134089 ?auto_134090 ) ) ( not ( = ?auto_134089 ?auto_134091 ) ) ( not ( = ?auto_134089 ?auto_134092 ) ) ( not ( = ?auto_134089 ?auto_134094 ) ) ( not ( = ?auto_134090 ?auto_134091 ) ) ( not ( = ?auto_134090 ?auto_134092 ) ) ( not ( = ?auto_134090 ?auto_134094 ) ) ( not ( = ?auto_134091 ?auto_134092 ) ) ( not ( = ?auto_134091 ?auto_134094 ) ) ( not ( = ?auto_134092 ?auto_134094 ) ) ( ON ?auto_134094 ?auto_134093 ) ( not ( = ?auto_134086 ?auto_134093 ) ) ( not ( = ?auto_134087 ?auto_134093 ) ) ( not ( = ?auto_134088 ?auto_134093 ) ) ( not ( = ?auto_134089 ?auto_134093 ) ) ( not ( = ?auto_134090 ?auto_134093 ) ) ( not ( = ?auto_134091 ?auto_134093 ) ) ( not ( = ?auto_134092 ?auto_134093 ) ) ( not ( = ?auto_134094 ?auto_134093 ) ) ( ON ?auto_134092 ?auto_134094 ) ( ON-TABLE ?auto_134093 ) ( ON ?auto_134091 ?auto_134092 ) ( ON ?auto_134090 ?auto_134091 ) ( ON ?auto_134089 ?auto_134090 ) ( CLEAR ?auto_134087 ) ( ON ?auto_134088 ?auto_134089 ) ( CLEAR ?auto_134088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134093 ?auto_134094 ?auto_134092 ?auto_134091 ?auto_134090 ?auto_134089 )
      ( MAKE-7PILE ?auto_134086 ?auto_134087 ?auto_134088 ?auto_134089 ?auto_134090 ?auto_134091 ?auto_134092 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134095 - BLOCK
      ?auto_134096 - BLOCK
      ?auto_134097 - BLOCK
      ?auto_134098 - BLOCK
      ?auto_134099 - BLOCK
      ?auto_134100 - BLOCK
      ?auto_134101 - BLOCK
    )
    :vars
    (
      ?auto_134103 - BLOCK
      ?auto_134102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134095 ) ( not ( = ?auto_134095 ?auto_134096 ) ) ( not ( = ?auto_134095 ?auto_134097 ) ) ( not ( = ?auto_134095 ?auto_134098 ) ) ( not ( = ?auto_134095 ?auto_134099 ) ) ( not ( = ?auto_134095 ?auto_134100 ) ) ( not ( = ?auto_134095 ?auto_134101 ) ) ( not ( = ?auto_134095 ?auto_134103 ) ) ( not ( = ?auto_134096 ?auto_134097 ) ) ( not ( = ?auto_134096 ?auto_134098 ) ) ( not ( = ?auto_134096 ?auto_134099 ) ) ( not ( = ?auto_134096 ?auto_134100 ) ) ( not ( = ?auto_134096 ?auto_134101 ) ) ( not ( = ?auto_134096 ?auto_134103 ) ) ( not ( = ?auto_134097 ?auto_134098 ) ) ( not ( = ?auto_134097 ?auto_134099 ) ) ( not ( = ?auto_134097 ?auto_134100 ) ) ( not ( = ?auto_134097 ?auto_134101 ) ) ( not ( = ?auto_134097 ?auto_134103 ) ) ( not ( = ?auto_134098 ?auto_134099 ) ) ( not ( = ?auto_134098 ?auto_134100 ) ) ( not ( = ?auto_134098 ?auto_134101 ) ) ( not ( = ?auto_134098 ?auto_134103 ) ) ( not ( = ?auto_134099 ?auto_134100 ) ) ( not ( = ?auto_134099 ?auto_134101 ) ) ( not ( = ?auto_134099 ?auto_134103 ) ) ( not ( = ?auto_134100 ?auto_134101 ) ) ( not ( = ?auto_134100 ?auto_134103 ) ) ( not ( = ?auto_134101 ?auto_134103 ) ) ( ON ?auto_134103 ?auto_134102 ) ( not ( = ?auto_134095 ?auto_134102 ) ) ( not ( = ?auto_134096 ?auto_134102 ) ) ( not ( = ?auto_134097 ?auto_134102 ) ) ( not ( = ?auto_134098 ?auto_134102 ) ) ( not ( = ?auto_134099 ?auto_134102 ) ) ( not ( = ?auto_134100 ?auto_134102 ) ) ( not ( = ?auto_134101 ?auto_134102 ) ) ( not ( = ?auto_134103 ?auto_134102 ) ) ( ON ?auto_134101 ?auto_134103 ) ( ON-TABLE ?auto_134102 ) ( ON ?auto_134100 ?auto_134101 ) ( ON ?auto_134099 ?auto_134100 ) ( ON ?auto_134098 ?auto_134099 ) ( ON ?auto_134097 ?auto_134098 ) ( CLEAR ?auto_134097 ) ( HOLDING ?auto_134096 ) ( CLEAR ?auto_134095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134095 ?auto_134096 )
      ( MAKE-7PILE ?auto_134095 ?auto_134096 ?auto_134097 ?auto_134098 ?auto_134099 ?auto_134100 ?auto_134101 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134104 - BLOCK
      ?auto_134105 - BLOCK
      ?auto_134106 - BLOCK
      ?auto_134107 - BLOCK
      ?auto_134108 - BLOCK
      ?auto_134109 - BLOCK
      ?auto_134110 - BLOCK
    )
    :vars
    (
      ?auto_134112 - BLOCK
      ?auto_134111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134104 ) ( not ( = ?auto_134104 ?auto_134105 ) ) ( not ( = ?auto_134104 ?auto_134106 ) ) ( not ( = ?auto_134104 ?auto_134107 ) ) ( not ( = ?auto_134104 ?auto_134108 ) ) ( not ( = ?auto_134104 ?auto_134109 ) ) ( not ( = ?auto_134104 ?auto_134110 ) ) ( not ( = ?auto_134104 ?auto_134112 ) ) ( not ( = ?auto_134105 ?auto_134106 ) ) ( not ( = ?auto_134105 ?auto_134107 ) ) ( not ( = ?auto_134105 ?auto_134108 ) ) ( not ( = ?auto_134105 ?auto_134109 ) ) ( not ( = ?auto_134105 ?auto_134110 ) ) ( not ( = ?auto_134105 ?auto_134112 ) ) ( not ( = ?auto_134106 ?auto_134107 ) ) ( not ( = ?auto_134106 ?auto_134108 ) ) ( not ( = ?auto_134106 ?auto_134109 ) ) ( not ( = ?auto_134106 ?auto_134110 ) ) ( not ( = ?auto_134106 ?auto_134112 ) ) ( not ( = ?auto_134107 ?auto_134108 ) ) ( not ( = ?auto_134107 ?auto_134109 ) ) ( not ( = ?auto_134107 ?auto_134110 ) ) ( not ( = ?auto_134107 ?auto_134112 ) ) ( not ( = ?auto_134108 ?auto_134109 ) ) ( not ( = ?auto_134108 ?auto_134110 ) ) ( not ( = ?auto_134108 ?auto_134112 ) ) ( not ( = ?auto_134109 ?auto_134110 ) ) ( not ( = ?auto_134109 ?auto_134112 ) ) ( not ( = ?auto_134110 ?auto_134112 ) ) ( ON ?auto_134112 ?auto_134111 ) ( not ( = ?auto_134104 ?auto_134111 ) ) ( not ( = ?auto_134105 ?auto_134111 ) ) ( not ( = ?auto_134106 ?auto_134111 ) ) ( not ( = ?auto_134107 ?auto_134111 ) ) ( not ( = ?auto_134108 ?auto_134111 ) ) ( not ( = ?auto_134109 ?auto_134111 ) ) ( not ( = ?auto_134110 ?auto_134111 ) ) ( not ( = ?auto_134112 ?auto_134111 ) ) ( ON ?auto_134110 ?auto_134112 ) ( ON-TABLE ?auto_134111 ) ( ON ?auto_134109 ?auto_134110 ) ( ON ?auto_134108 ?auto_134109 ) ( ON ?auto_134107 ?auto_134108 ) ( ON ?auto_134106 ?auto_134107 ) ( CLEAR ?auto_134104 ) ( ON ?auto_134105 ?auto_134106 ) ( CLEAR ?auto_134105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134111 ?auto_134112 ?auto_134110 ?auto_134109 ?auto_134108 ?auto_134107 ?auto_134106 )
      ( MAKE-7PILE ?auto_134104 ?auto_134105 ?auto_134106 ?auto_134107 ?auto_134108 ?auto_134109 ?auto_134110 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134113 - BLOCK
      ?auto_134114 - BLOCK
      ?auto_134115 - BLOCK
      ?auto_134116 - BLOCK
      ?auto_134117 - BLOCK
      ?auto_134118 - BLOCK
      ?auto_134119 - BLOCK
    )
    :vars
    (
      ?auto_134121 - BLOCK
      ?auto_134120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134113 ?auto_134114 ) ) ( not ( = ?auto_134113 ?auto_134115 ) ) ( not ( = ?auto_134113 ?auto_134116 ) ) ( not ( = ?auto_134113 ?auto_134117 ) ) ( not ( = ?auto_134113 ?auto_134118 ) ) ( not ( = ?auto_134113 ?auto_134119 ) ) ( not ( = ?auto_134113 ?auto_134121 ) ) ( not ( = ?auto_134114 ?auto_134115 ) ) ( not ( = ?auto_134114 ?auto_134116 ) ) ( not ( = ?auto_134114 ?auto_134117 ) ) ( not ( = ?auto_134114 ?auto_134118 ) ) ( not ( = ?auto_134114 ?auto_134119 ) ) ( not ( = ?auto_134114 ?auto_134121 ) ) ( not ( = ?auto_134115 ?auto_134116 ) ) ( not ( = ?auto_134115 ?auto_134117 ) ) ( not ( = ?auto_134115 ?auto_134118 ) ) ( not ( = ?auto_134115 ?auto_134119 ) ) ( not ( = ?auto_134115 ?auto_134121 ) ) ( not ( = ?auto_134116 ?auto_134117 ) ) ( not ( = ?auto_134116 ?auto_134118 ) ) ( not ( = ?auto_134116 ?auto_134119 ) ) ( not ( = ?auto_134116 ?auto_134121 ) ) ( not ( = ?auto_134117 ?auto_134118 ) ) ( not ( = ?auto_134117 ?auto_134119 ) ) ( not ( = ?auto_134117 ?auto_134121 ) ) ( not ( = ?auto_134118 ?auto_134119 ) ) ( not ( = ?auto_134118 ?auto_134121 ) ) ( not ( = ?auto_134119 ?auto_134121 ) ) ( ON ?auto_134121 ?auto_134120 ) ( not ( = ?auto_134113 ?auto_134120 ) ) ( not ( = ?auto_134114 ?auto_134120 ) ) ( not ( = ?auto_134115 ?auto_134120 ) ) ( not ( = ?auto_134116 ?auto_134120 ) ) ( not ( = ?auto_134117 ?auto_134120 ) ) ( not ( = ?auto_134118 ?auto_134120 ) ) ( not ( = ?auto_134119 ?auto_134120 ) ) ( not ( = ?auto_134121 ?auto_134120 ) ) ( ON ?auto_134119 ?auto_134121 ) ( ON-TABLE ?auto_134120 ) ( ON ?auto_134118 ?auto_134119 ) ( ON ?auto_134117 ?auto_134118 ) ( ON ?auto_134116 ?auto_134117 ) ( ON ?auto_134115 ?auto_134116 ) ( ON ?auto_134114 ?auto_134115 ) ( CLEAR ?auto_134114 ) ( HOLDING ?auto_134113 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134113 )
      ( MAKE-7PILE ?auto_134113 ?auto_134114 ?auto_134115 ?auto_134116 ?auto_134117 ?auto_134118 ?auto_134119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_134122 - BLOCK
      ?auto_134123 - BLOCK
      ?auto_134124 - BLOCK
      ?auto_134125 - BLOCK
      ?auto_134126 - BLOCK
      ?auto_134127 - BLOCK
      ?auto_134128 - BLOCK
    )
    :vars
    (
      ?auto_134130 - BLOCK
      ?auto_134129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134122 ?auto_134123 ) ) ( not ( = ?auto_134122 ?auto_134124 ) ) ( not ( = ?auto_134122 ?auto_134125 ) ) ( not ( = ?auto_134122 ?auto_134126 ) ) ( not ( = ?auto_134122 ?auto_134127 ) ) ( not ( = ?auto_134122 ?auto_134128 ) ) ( not ( = ?auto_134122 ?auto_134130 ) ) ( not ( = ?auto_134123 ?auto_134124 ) ) ( not ( = ?auto_134123 ?auto_134125 ) ) ( not ( = ?auto_134123 ?auto_134126 ) ) ( not ( = ?auto_134123 ?auto_134127 ) ) ( not ( = ?auto_134123 ?auto_134128 ) ) ( not ( = ?auto_134123 ?auto_134130 ) ) ( not ( = ?auto_134124 ?auto_134125 ) ) ( not ( = ?auto_134124 ?auto_134126 ) ) ( not ( = ?auto_134124 ?auto_134127 ) ) ( not ( = ?auto_134124 ?auto_134128 ) ) ( not ( = ?auto_134124 ?auto_134130 ) ) ( not ( = ?auto_134125 ?auto_134126 ) ) ( not ( = ?auto_134125 ?auto_134127 ) ) ( not ( = ?auto_134125 ?auto_134128 ) ) ( not ( = ?auto_134125 ?auto_134130 ) ) ( not ( = ?auto_134126 ?auto_134127 ) ) ( not ( = ?auto_134126 ?auto_134128 ) ) ( not ( = ?auto_134126 ?auto_134130 ) ) ( not ( = ?auto_134127 ?auto_134128 ) ) ( not ( = ?auto_134127 ?auto_134130 ) ) ( not ( = ?auto_134128 ?auto_134130 ) ) ( ON ?auto_134130 ?auto_134129 ) ( not ( = ?auto_134122 ?auto_134129 ) ) ( not ( = ?auto_134123 ?auto_134129 ) ) ( not ( = ?auto_134124 ?auto_134129 ) ) ( not ( = ?auto_134125 ?auto_134129 ) ) ( not ( = ?auto_134126 ?auto_134129 ) ) ( not ( = ?auto_134127 ?auto_134129 ) ) ( not ( = ?auto_134128 ?auto_134129 ) ) ( not ( = ?auto_134130 ?auto_134129 ) ) ( ON ?auto_134128 ?auto_134130 ) ( ON-TABLE ?auto_134129 ) ( ON ?auto_134127 ?auto_134128 ) ( ON ?auto_134126 ?auto_134127 ) ( ON ?auto_134125 ?auto_134126 ) ( ON ?auto_134124 ?auto_134125 ) ( ON ?auto_134123 ?auto_134124 ) ( ON ?auto_134122 ?auto_134123 ) ( CLEAR ?auto_134122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134129 ?auto_134130 ?auto_134128 ?auto_134127 ?auto_134126 ?auto_134125 ?auto_134124 ?auto_134123 )
      ( MAKE-7PILE ?auto_134122 ?auto_134123 ?auto_134124 ?auto_134125 ?auto_134126 ?auto_134127 ?auto_134128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134132 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_134132 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_134132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134133 - BLOCK
    )
    :vars
    (
      ?auto_134134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134133 ?auto_134134 ) ( CLEAR ?auto_134133 ) ( HAND-EMPTY ) ( not ( = ?auto_134133 ?auto_134134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134133 ?auto_134134 )
      ( MAKE-1PILE ?auto_134133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134135 - BLOCK
    )
    :vars
    (
      ?auto_134136 - BLOCK
      ?auto_134137 - BLOCK
      ?auto_134141 - BLOCK
      ?auto_134139 - BLOCK
      ?auto_134142 - BLOCK
      ?auto_134140 - BLOCK
      ?auto_134138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134135 ?auto_134136 ) ) ( HOLDING ?auto_134135 ) ( CLEAR ?auto_134136 ) ( ON-TABLE ?auto_134137 ) ( ON ?auto_134141 ?auto_134137 ) ( ON ?auto_134139 ?auto_134141 ) ( ON ?auto_134142 ?auto_134139 ) ( ON ?auto_134140 ?auto_134142 ) ( ON ?auto_134138 ?auto_134140 ) ( ON ?auto_134136 ?auto_134138 ) ( not ( = ?auto_134137 ?auto_134141 ) ) ( not ( = ?auto_134137 ?auto_134139 ) ) ( not ( = ?auto_134137 ?auto_134142 ) ) ( not ( = ?auto_134137 ?auto_134140 ) ) ( not ( = ?auto_134137 ?auto_134138 ) ) ( not ( = ?auto_134137 ?auto_134136 ) ) ( not ( = ?auto_134137 ?auto_134135 ) ) ( not ( = ?auto_134141 ?auto_134139 ) ) ( not ( = ?auto_134141 ?auto_134142 ) ) ( not ( = ?auto_134141 ?auto_134140 ) ) ( not ( = ?auto_134141 ?auto_134138 ) ) ( not ( = ?auto_134141 ?auto_134136 ) ) ( not ( = ?auto_134141 ?auto_134135 ) ) ( not ( = ?auto_134139 ?auto_134142 ) ) ( not ( = ?auto_134139 ?auto_134140 ) ) ( not ( = ?auto_134139 ?auto_134138 ) ) ( not ( = ?auto_134139 ?auto_134136 ) ) ( not ( = ?auto_134139 ?auto_134135 ) ) ( not ( = ?auto_134142 ?auto_134140 ) ) ( not ( = ?auto_134142 ?auto_134138 ) ) ( not ( = ?auto_134142 ?auto_134136 ) ) ( not ( = ?auto_134142 ?auto_134135 ) ) ( not ( = ?auto_134140 ?auto_134138 ) ) ( not ( = ?auto_134140 ?auto_134136 ) ) ( not ( = ?auto_134140 ?auto_134135 ) ) ( not ( = ?auto_134138 ?auto_134136 ) ) ( not ( = ?auto_134138 ?auto_134135 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134137 ?auto_134141 ?auto_134139 ?auto_134142 ?auto_134140 ?auto_134138 ?auto_134136 ?auto_134135 )
      ( MAKE-1PILE ?auto_134135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134143 - BLOCK
    )
    :vars
    (
      ?auto_134148 - BLOCK
      ?auto_134144 - BLOCK
      ?auto_134146 - BLOCK
      ?auto_134149 - BLOCK
      ?auto_134147 - BLOCK
      ?auto_134145 - BLOCK
      ?auto_134150 - BLOCK
      ?auto_134151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134143 ?auto_134148 ) ) ( CLEAR ?auto_134148 ) ( ON-TABLE ?auto_134144 ) ( ON ?auto_134146 ?auto_134144 ) ( ON ?auto_134149 ?auto_134146 ) ( ON ?auto_134147 ?auto_134149 ) ( ON ?auto_134145 ?auto_134147 ) ( ON ?auto_134150 ?auto_134145 ) ( ON ?auto_134148 ?auto_134150 ) ( not ( = ?auto_134144 ?auto_134146 ) ) ( not ( = ?auto_134144 ?auto_134149 ) ) ( not ( = ?auto_134144 ?auto_134147 ) ) ( not ( = ?auto_134144 ?auto_134145 ) ) ( not ( = ?auto_134144 ?auto_134150 ) ) ( not ( = ?auto_134144 ?auto_134148 ) ) ( not ( = ?auto_134144 ?auto_134143 ) ) ( not ( = ?auto_134146 ?auto_134149 ) ) ( not ( = ?auto_134146 ?auto_134147 ) ) ( not ( = ?auto_134146 ?auto_134145 ) ) ( not ( = ?auto_134146 ?auto_134150 ) ) ( not ( = ?auto_134146 ?auto_134148 ) ) ( not ( = ?auto_134146 ?auto_134143 ) ) ( not ( = ?auto_134149 ?auto_134147 ) ) ( not ( = ?auto_134149 ?auto_134145 ) ) ( not ( = ?auto_134149 ?auto_134150 ) ) ( not ( = ?auto_134149 ?auto_134148 ) ) ( not ( = ?auto_134149 ?auto_134143 ) ) ( not ( = ?auto_134147 ?auto_134145 ) ) ( not ( = ?auto_134147 ?auto_134150 ) ) ( not ( = ?auto_134147 ?auto_134148 ) ) ( not ( = ?auto_134147 ?auto_134143 ) ) ( not ( = ?auto_134145 ?auto_134150 ) ) ( not ( = ?auto_134145 ?auto_134148 ) ) ( not ( = ?auto_134145 ?auto_134143 ) ) ( not ( = ?auto_134150 ?auto_134148 ) ) ( not ( = ?auto_134150 ?auto_134143 ) ) ( ON ?auto_134143 ?auto_134151 ) ( CLEAR ?auto_134143 ) ( HAND-EMPTY ) ( not ( = ?auto_134143 ?auto_134151 ) ) ( not ( = ?auto_134148 ?auto_134151 ) ) ( not ( = ?auto_134144 ?auto_134151 ) ) ( not ( = ?auto_134146 ?auto_134151 ) ) ( not ( = ?auto_134149 ?auto_134151 ) ) ( not ( = ?auto_134147 ?auto_134151 ) ) ( not ( = ?auto_134145 ?auto_134151 ) ) ( not ( = ?auto_134150 ?auto_134151 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134143 ?auto_134151 )
      ( MAKE-1PILE ?auto_134143 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134152 - BLOCK
    )
    :vars
    (
      ?auto_134154 - BLOCK
      ?auto_134157 - BLOCK
      ?auto_134160 - BLOCK
      ?auto_134159 - BLOCK
      ?auto_134153 - BLOCK
      ?auto_134158 - BLOCK
      ?auto_134156 - BLOCK
      ?auto_134155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134152 ?auto_134154 ) ) ( ON-TABLE ?auto_134157 ) ( ON ?auto_134160 ?auto_134157 ) ( ON ?auto_134159 ?auto_134160 ) ( ON ?auto_134153 ?auto_134159 ) ( ON ?auto_134158 ?auto_134153 ) ( ON ?auto_134156 ?auto_134158 ) ( not ( = ?auto_134157 ?auto_134160 ) ) ( not ( = ?auto_134157 ?auto_134159 ) ) ( not ( = ?auto_134157 ?auto_134153 ) ) ( not ( = ?auto_134157 ?auto_134158 ) ) ( not ( = ?auto_134157 ?auto_134156 ) ) ( not ( = ?auto_134157 ?auto_134154 ) ) ( not ( = ?auto_134157 ?auto_134152 ) ) ( not ( = ?auto_134160 ?auto_134159 ) ) ( not ( = ?auto_134160 ?auto_134153 ) ) ( not ( = ?auto_134160 ?auto_134158 ) ) ( not ( = ?auto_134160 ?auto_134156 ) ) ( not ( = ?auto_134160 ?auto_134154 ) ) ( not ( = ?auto_134160 ?auto_134152 ) ) ( not ( = ?auto_134159 ?auto_134153 ) ) ( not ( = ?auto_134159 ?auto_134158 ) ) ( not ( = ?auto_134159 ?auto_134156 ) ) ( not ( = ?auto_134159 ?auto_134154 ) ) ( not ( = ?auto_134159 ?auto_134152 ) ) ( not ( = ?auto_134153 ?auto_134158 ) ) ( not ( = ?auto_134153 ?auto_134156 ) ) ( not ( = ?auto_134153 ?auto_134154 ) ) ( not ( = ?auto_134153 ?auto_134152 ) ) ( not ( = ?auto_134158 ?auto_134156 ) ) ( not ( = ?auto_134158 ?auto_134154 ) ) ( not ( = ?auto_134158 ?auto_134152 ) ) ( not ( = ?auto_134156 ?auto_134154 ) ) ( not ( = ?auto_134156 ?auto_134152 ) ) ( ON ?auto_134152 ?auto_134155 ) ( CLEAR ?auto_134152 ) ( not ( = ?auto_134152 ?auto_134155 ) ) ( not ( = ?auto_134154 ?auto_134155 ) ) ( not ( = ?auto_134157 ?auto_134155 ) ) ( not ( = ?auto_134160 ?auto_134155 ) ) ( not ( = ?auto_134159 ?auto_134155 ) ) ( not ( = ?auto_134153 ?auto_134155 ) ) ( not ( = ?auto_134158 ?auto_134155 ) ) ( not ( = ?auto_134156 ?auto_134155 ) ) ( HOLDING ?auto_134154 ) ( CLEAR ?auto_134156 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134157 ?auto_134160 ?auto_134159 ?auto_134153 ?auto_134158 ?auto_134156 ?auto_134154 )
      ( MAKE-1PILE ?auto_134152 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134161 - BLOCK
    )
    :vars
    (
      ?auto_134166 - BLOCK
      ?auto_134162 - BLOCK
      ?auto_134165 - BLOCK
      ?auto_134169 - BLOCK
      ?auto_134163 - BLOCK
      ?auto_134168 - BLOCK
      ?auto_134167 - BLOCK
      ?auto_134164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134161 ?auto_134166 ) ) ( ON-TABLE ?auto_134162 ) ( ON ?auto_134165 ?auto_134162 ) ( ON ?auto_134169 ?auto_134165 ) ( ON ?auto_134163 ?auto_134169 ) ( ON ?auto_134168 ?auto_134163 ) ( ON ?auto_134167 ?auto_134168 ) ( not ( = ?auto_134162 ?auto_134165 ) ) ( not ( = ?auto_134162 ?auto_134169 ) ) ( not ( = ?auto_134162 ?auto_134163 ) ) ( not ( = ?auto_134162 ?auto_134168 ) ) ( not ( = ?auto_134162 ?auto_134167 ) ) ( not ( = ?auto_134162 ?auto_134166 ) ) ( not ( = ?auto_134162 ?auto_134161 ) ) ( not ( = ?auto_134165 ?auto_134169 ) ) ( not ( = ?auto_134165 ?auto_134163 ) ) ( not ( = ?auto_134165 ?auto_134168 ) ) ( not ( = ?auto_134165 ?auto_134167 ) ) ( not ( = ?auto_134165 ?auto_134166 ) ) ( not ( = ?auto_134165 ?auto_134161 ) ) ( not ( = ?auto_134169 ?auto_134163 ) ) ( not ( = ?auto_134169 ?auto_134168 ) ) ( not ( = ?auto_134169 ?auto_134167 ) ) ( not ( = ?auto_134169 ?auto_134166 ) ) ( not ( = ?auto_134169 ?auto_134161 ) ) ( not ( = ?auto_134163 ?auto_134168 ) ) ( not ( = ?auto_134163 ?auto_134167 ) ) ( not ( = ?auto_134163 ?auto_134166 ) ) ( not ( = ?auto_134163 ?auto_134161 ) ) ( not ( = ?auto_134168 ?auto_134167 ) ) ( not ( = ?auto_134168 ?auto_134166 ) ) ( not ( = ?auto_134168 ?auto_134161 ) ) ( not ( = ?auto_134167 ?auto_134166 ) ) ( not ( = ?auto_134167 ?auto_134161 ) ) ( ON ?auto_134161 ?auto_134164 ) ( not ( = ?auto_134161 ?auto_134164 ) ) ( not ( = ?auto_134166 ?auto_134164 ) ) ( not ( = ?auto_134162 ?auto_134164 ) ) ( not ( = ?auto_134165 ?auto_134164 ) ) ( not ( = ?auto_134169 ?auto_134164 ) ) ( not ( = ?auto_134163 ?auto_134164 ) ) ( not ( = ?auto_134168 ?auto_134164 ) ) ( not ( = ?auto_134167 ?auto_134164 ) ) ( CLEAR ?auto_134167 ) ( ON ?auto_134166 ?auto_134161 ) ( CLEAR ?auto_134166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134164 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134164 ?auto_134161 )
      ( MAKE-1PILE ?auto_134161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134170 - BLOCK
    )
    :vars
    (
      ?auto_134171 - BLOCK
      ?auto_134178 - BLOCK
      ?auto_134177 - BLOCK
      ?auto_134174 - BLOCK
      ?auto_134173 - BLOCK
      ?auto_134175 - BLOCK
      ?auto_134176 - BLOCK
      ?auto_134172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134170 ?auto_134171 ) ) ( ON-TABLE ?auto_134178 ) ( ON ?auto_134177 ?auto_134178 ) ( ON ?auto_134174 ?auto_134177 ) ( ON ?auto_134173 ?auto_134174 ) ( ON ?auto_134175 ?auto_134173 ) ( not ( = ?auto_134178 ?auto_134177 ) ) ( not ( = ?auto_134178 ?auto_134174 ) ) ( not ( = ?auto_134178 ?auto_134173 ) ) ( not ( = ?auto_134178 ?auto_134175 ) ) ( not ( = ?auto_134178 ?auto_134176 ) ) ( not ( = ?auto_134178 ?auto_134171 ) ) ( not ( = ?auto_134178 ?auto_134170 ) ) ( not ( = ?auto_134177 ?auto_134174 ) ) ( not ( = ?auto_134177 ?auto_134173 ) ) ( not ( = ?auto_134177 ?auto_134175 ) ) ( not ( = ?auto_134177 ?auto_134176 ) ) ( not ( = ?auto_134177 ?auto_134171 ) ) ( not ( = ?auto_134177 ?auto_134170 ) ) ( not ( = ?auto_134174 ?auto_134173 ) ) ( not ( = ?auto_134174 ?auto_134175 ) ) ( not ( = ?auto_134174 ?auto_134176 ) ) ( not ( = ?auto_134174 ?auto_134171 ) ) ( not ( = ?auto_134174 ?auto_134170 ) ) ( not ( = ?auto_134173 ?auto_134175 ) ) ( not ( = ?auto_134173 ?auto_134176 ) ) ( not ( = ?auto_134173 ?auto_134171 ) ) ( not ( = ?auto_134173 ?auto_134170 ) ) ( not ( = ?auto_134175 ?auto_134176 ) ) ( not ( = ?auto_134175 ?auto_134171 ) ) ( not ( = ?auto_134175 ?auto_134170 ) ) ( not ( = ?auto_134176 ?auto_134171 ) ) ( not ( = ?auto_134176 ?auto_134170 ) ) ( ON ?auto_134170 ?auto_134172 ) ( not ( = ?auto_134170 ?auto_134172 ) ) ( not ( = ?auto_134171 ?auto_134172 ) ) ( not ( = ?auto_134178 ?auto_134172 ) ) ( not ( = ?auto_134177 ?auto_134172 ) ) ( not ( = ?auto_134174 ?auto_134172 ) ) ( not ( = ?auto_134173 ?auto_134172 ) ) ( not ( = ?auto_134175 ?auto_134172 ) ) ( not ( = ?auto_134176 ?auto_134172 ) ) ( ON ?auto_134171 ?auto_134170 ) ( CLEAR ?auto_134171 ) ( ON-TABLE ?auto_134172 ) ( HOLDING ?auto_134176 ) ( CLEAR ?auto_134175 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134178 ?auto_134177 ?auto_134174 ?auto_134173 ?auto_134175 ?auto_134176 )
      ( MAKE-1PILE ?auto_134170 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134179 - BLOCK
    )
    :vars
    (
      ?auto_134182 - BLOCK
      ?auto_134183 - BLOCK
      ?auto_134186 - BLOCK
      ?auto_134180 - BLOCK
      ?auto_134185 - BLOCK
      ?auto_134187 - BLOCK
      ?auto_134184 - BLOCK
      ?auto_134181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134179 ?auto_134182 ) ) ( ON-TABLE ?auto_134183 ) ( ON ?auto_134186 ?auto_134183 ) ( ON ?auto_134180 ?auto_134186 ) ( ON ?auto_134185 ?auto_134180 ) ( ON ?auto_134187 ?auto_134185 ) ( not ( = ?auto_134183 ?auto_134186 ) ) ( not ( = ?auto_134183 ?auto_134180 ) ) ( not ( = ?auto_134183 ?auto_134185 ) ) ( not ( = ?auto_134183 ?auto_134187 ) ) ( not ( = ?auto_134183 ?auto_134184 ) ) ( not ( = ?auto_134183 ?auto_134182 ) ) ( not ( = ?auto_134183 ?auto_134179 ) ) ( not ( = ?auto_134186 ?auto_134180 ) ) ( not ( = ?auto_134186 ?auto_134185 ) ) ( not ( = ?auto_134186 ?auto_134187 ) ) ( not ( = ?auto_134186 ?auto_134184 ) ) ( not ( = ?auto_134186 ?auto_134182 ) ) ( not ( = ?auto_134186 ?auto_134179 ) ) ( not ( = ?auto_134180 ?auto_134185 ) ) ( not ( = ?auto_134180 ?auto_134187 ) ) ( not ( = ?auto_134180 ?auto_134184 ) ) ( not ( = ?auto_134180 ?auto_134182 ) ) ( not ( = ?auto_134180 ?auto_134179 ) ) ( not ( = ?auto_134185 ?auto_134187 ) ) ( not ( = ?auto_134185 ?auto_134184 ) ) ( not ( = ?auto_134185 ?auto_134182 ) ) ( not ( = ?auto_134185 ?auto_134179 ) ) ( not ( = ?auto_134187 ?auto_134184 ) ) ( not ( = ?auto_134187 ?auto_134182 ) ) ( not ( = ?auto_134187 ?auto_134179 ) ) ( not ( = ?auto_134184 ?auto_134182 ) ) ( not ( = ?auto_134184 ?auto_134179 ) ) ( ON ?auto_134179 ?auto_134181 ) ( not ( = ?auto_134179 ?auto_134181 ) ) ( not ( = ?auto_134182 ?auto_134181 ) ) ( not ( = ?auto_134183 ?auto_134181 ) ) ( not ( = ?auto_134186 ?auto_134181 ) ) ( not ( = ?auto_134180 ?auto_134181 ) ) ( not ( = ?auto_134185 ?auto_134181 ) ) ( not ( = ?auto_134187 ?auto_134181 ) ) ( not ( = ?auto_134184 ?auto_134181 ) ) ( ON ?auto_134182 ?auto_134179 ) ( ON-TABLE ?auto_134181 ) ( CLEAR ?auto_134187 ) ( ON ?auto_134184 ?auto_134182 ) ( CLEAR ?auto_134184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134181 ?auto_134179 ?auto_134182 )
      ( MAKE-1PILE ?auto_134179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134188 - BLOCK
    )
    :vars
    (
      ?auto_134191 - BLOCK
      ?auto_134195 - BLOCK
      ?auto_134189 - BLOCK
      ?auto_134196 - BLOCK
      ?auto_134192 - BLOCK
      ?auto_134190 - BLOCK
      ?auto_134194 - BLOCK
      ?auto_134193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134188 ?auto_134191 ) ) ( ON-TABLE ?auto_134195 ) ( ON ?auto_134189 ?auto_134195 ) ( ON ?auto_134196 ?auto_134189 ) ( ON ?auto_134192 ?auto_134196 ) ( not ( = ?auto_134195 ?auto_134189 ) ) ( not ( = ?auto_134195 ?auto_134196 ) ) ( not ( = ?auto_134195 ?auto_134192 ) ) ( not ( = ?auto_134195 ?auto_134190 ) ) ( not ( = ?auto_134195 ?auto_134194 ) ) ( not ( = ?auto_134195 ?auto_134191 ) ) ( not ( = ?auto_134195 ?auto_134188 ) ) ( not ( = ?auto_134189 ?auto_134196 ) ) ( not ( = ?auto_134189 ?auto_134192 ) ) ( not ( = ?auto_134189 ?auto_134190 ) ) ( not ( = ?auto_134189 ?auto_134194 ) ) ( not ( = ?auto_134189 ?auto_134191 ) ) ( not ( = ?auto_134189 ?auto_134188 ) ) ( not ( = ?auto_134196 ?auto_134192 ) ) ( not ( = ?auto_134196 ?auto_134190 ) ) ( not ( = ?auto_134196 ?auto_134194 ) ) ( not ( = ?auto_134196 ?auto_134191 ) ) ( not ( = ?auto_134196 ?auto_134188 ) ) ( not ( = ?auto_134192 ?auto_134190 ) ) ( not ( = ?auto_134192 ?auto_134194 ) ) ( not ( = ?auto_134192 ?auto_134191 ) ) ( not ( = ?auto_134192 ?auto_134188 ) ) ( not ( = ?auto_134190 ?auto_134194 ) ) ( not ( = ?auto_134190 ?auto_134191 ) ) ( not ( = ?auto_134190 ?auto_134188 ) ) ( not ( = ?auto_134194 ?auto_134191 ) ) ( not ( = ?auto_134194 ?auto_134188 ) ) ( ON ?auto_134188 ?auto_134193 ) ( not ( = ?auto_134188 ?auto_134193 ) ) ( not ( = ?auto_134191 ?auto_134193 ) ) ( not ( = ?auto_134195 ?auto_134193 ) ) ( not ( = ?auto_134189 ?auto_134193 ) ) ( not ( = ?auto_134196 ?auto_134193 ) ) ( not ( = ?auto_134192 ?auto_134193 ) ) ( not ( = ?auto_134190 ?auto_134193 ) ) ( not ( = ?auto_134194 ?auto_134193 ) ) ( ON ?auto_134191 ?auto_134188 ) ( ON-TABLE ?auto_134193 ) ( ON ?auto_134194 ?auto_134191 ) ( CLEAR ?auto_134194 ) ( HOLDING ?auto_134190 ) ( CLEAR ?auto_134192 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134195 ?auto_134189 ?auto_134196 ?auto_134192 ?auto_134190 )
      ( MAKE-1PILE ?auto_134188 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134197 - BLOCK
    )
    :vars
    (
      ?auto_134204 - BLOCK
      ?auto_134205 - BLOCK
      ?auto_134200 - BLOCK
      ?auto_134201 - BLOCK
      ?auto_134203 - BLOCK
      ?auto_134202 - BLOCK
      ?auto_134199 - BLOCK
      ?auto_134198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134197 ?auto_134204 ) ) ( ON-TABLE ?auto_134205 ) ( ON ?auto_134200 ?auto_134205 ) ( ON ?auto_134201 ?auto_134200 ) ( ON ?auto_134203 ?auto_134201 ) ( not ( = ?auto_134205 ?auto_134200 ) ) ( not ( = ?auto_134205 ?auto_134201 ) ) ( not ( = ?auto_134205 ?auto_134203 ) ) ( not ( = ?auto_134205 ?auto_134202 ) ) ( not ( = ?auto_134205 ?auto_134199 ) ) ( not ( = ?auto_134205 ?auto_134204 ) ) ( not ( = ?auto_134205 ?auto_134197 ) ) ( not ( = ?auto_134200 ?auto_134201 ) ) ( not ( = ?auto_134200 ?auto_134203 ) ) ( not ( = ?auto_134200 ?auto_134202 ) ) ( not ( = ?auto_134200 ?auto_134199 ) ) ( not ( = ?auto_134200 ?auto_134204 ) ) ( not ( = ?auto_134200 ?auto_134197 ) ) ( not ( = ?auto_134201 ?auto_134203 ) ) ( not ( = ?auto_134201 ?auto_134202 ) ) ( not ( = ?auto_134201 ?auto_134199 ) ) ( not ( = ?auto_134201 ?auto_134204 ) ) ( not ( = ?auto_134201 ?auto_134197 ) ) ( not ( = ?auto_134203 ?auto_134202 ) ) ( not ( = ?auto_134203 ?auto_134199 ) ) ( not ( = ?auto_134203 ?auto_134204 ) ) ( not ( = ?auto_134203 ?auto_134197 ) ) ( not ( = ?auto_134202 ?auto_134199 ) ) ( not ( = ?auto_134202 ?auto_134204 ) ) ( not ( = ?auto_134202 ?auto_134197 ) ) ( not ( = ?auto_134199 ?auto_134204 ) ) ( not ( = ?auto_134199 ?auto_134197 ) ) ( ON ?auto_134197 ?auto_134198 ) ( not ( = ?auto_134197 ?auto_134198 ) ) ( not ( = ?auto_134204 ?auto_134198 ) ) ( not ( = ?auto_134205 ?auto_134198 ) ) ( not ( = ?auto_134200 ?auto_134198 ) ) ( not ( = ?auto_134201 ?auto_134198 ) ) ( not ( = ?auto_134203 ?auto_134198 ) ) ( not ( = ?auto_134202 ?auto_134198 ) ) ( not ( = ?auto_134199 ?auto_134198 ) ) ( ON ?auto_134204 ?auto_134197 ) ( ON-TABLE ?auto_134198 ) ( ON ?auto_134199 ?auto_134204 ) ( CLEAR ?auto_134203 ) ( ON ?auto_134202 ?auto_134199 ) ( CLEAR ?auto_134202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134198 ?auto_134197 ?auto_134204 ?auto_134199 )
      ( MAKE-1PILE ?auto_134197 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134206 - BLOCK
    )
    :vars
    (
      ?auto_134209 - BLOCK
      ?auto_134208 - BLOCK
      ?auto_134210 - BLOCK
      ?auto_134207 - BLOCK
      ?auto_134213 - BLOCK
      ?auto_134214 - BLOCK
      ?auto_134212 - BLOCK
      ?auto_134211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134206 ?auto_134209 ) ) ( ON-TABLE ?auto_134208 ) ( ON ?auto_134210 ?auto_134208 ) ( ON ?auto_134207 ?auto_134210 ) ( not ( = ?auto_134208 ?auto_134210 ) ) ( not ( = ?auto_134208 ?auto_134207 ) ) ( not ( = ?auto_134208 ?auto_134213 ) ) ( not ( = ?auto_134208 ?auto_134214 ) ) ( not ( = ?auto_134208 ?auto_134212 ) ) ( not ( = ?auto_134208 ?auto_134209 ) ) ( not ( = ?auto_134208 ?auto_134206 ) ) ( not ( = ?auto_134210 ?auto_134207 ) ) ( not ( = ?auto_134210 ?auto_134213 ) ) ( not ( = ?auto_134210 ?auto_134214 ) ) ( not ( = ?auto_134210 ?auto_134212 ) ) ( not ( = ?auto_134210 ?auto_134209 ) ) ( not ( = ?auto_134210 ?auto_134206 ) ) ( not ( = ?auto_134207 ?auto_134213 ) ) ( not ( = ?auto_134207 ?auto_134214 ) ) ( not ( = ?auto_134207 ?auto_134212 ) ) ( not ( = ?auto_134207 ?auto_134209 ) ) ( not ( = ?auto_134207 ?auto_134206 ) ) ( not ( = ?auto_134213 ?auto_134214 ) ) ( not ( = ?auto_134213 ?auto_134212 ) ) ( not ( = ?auto_134213 ?auto_134209 ) ) ( not ( = ?auto_134213 ?auto_134206 ) ) ( not ( = ?auto_134214 ?auto_134212 ) ) ( not ( = ?auto_134214 ?auto_134209 ) ) ( not ( = ?auto_134214 ?auto_134206 ) ) ( not ( = ?auto_134212 ?auto_134209 ) ) ( not ( = ?auto_134212 ?auto_134206 ) ) ( ON ?auto_134206 ?auto_134211 ) ( not ( = ?auto_134206 ?auto_134211 ) ) ( not ( = ?auto_134209 ?auto_134211 ) ) ( not ( = ?auto_134208 ?auto_134211 ) ) ( not ( = ?auto_134210 ?auto_134211 ) ) ( not ( = ?auto_134207 ?auto_134211 ) ) ( not ( = ?auto_134213 ?auto_134211 ) ) ( not ( = ?auto_134214 ?auto_134211 ) ) ( not ( = ?auto_134212 ?auto_134211 ) ) ( ON ?auto_134209 ?auto_134206 ) ( ON-TABLE ?auto_134211 ) ( ON ?auto_134212 ?auto_134209 ) ( ON ?auto_134214 ?auto_134212 ) ( CLEAR ?auto_134214 ) ( HOLDING ?auto_134213 ) ( CLEAR ?auto_134207 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134208 ?auto_134210 ?auto_134207 ?auto_134213 )
      ( MAKE-1PILE ?auto_134206 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134215 - BLOCK
    )
    :vars
    (
      ?auto_134219 - BLOCK
      ?auto_134220 - BLOCK
      ?auto_134223 - BLOCK
      ?auto_134216 - BLOCK
      ?auto_134221 - BLOCK
      ?auto_134218 - BLOCK
      ?auto_134217 - BLOCK
      ?auto_134222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134215 ?auto_134219 ) ) ( ON-TABLE ?auto_134220 ) ( ON ?auto_134223 ?auto_134220 ) ( ON ?auto_134216 ?auto_134223 ) ( not ( = ?auto_134220 ?auto_134223 ) ) ( not ( = ?auto_134220 ?auto_134216 ) ) ( not ( = ?auto_134220 ?auto_134221 ) ) ( not ( = ?auto_134220 ?auto_134218 ) ) ( not ( = ?auto_134220 ?auto_134217 ) ) ( not ( = ?auto_134220 ?auto_134219 ) ) ( not ( = ?auto_134220 ?auto_134215 ) ) ( not ( = ?auto_134223 ?auto_134216 ) ) ( not ( = ?auto_134223 ?auto_134221 ) ) ( not ( = ?auto_134223 ?auto_134218 ) ) ( not ( = ?auto_134223 ?auto_134217 ) ) ( not ( = ?auto_134223 ?auto_134219 ) ) ( not ( = ?auto_134223 ?auto_134215 ) ) ( not ( = ?auto_134216 ?auto_134221 ) ) ( not ( = ?auto_134216 ?auto_134218 ) ) ( not ( = ?auto_134216 ?auto_134217 ) ) ( not ( = ?auto_134216 ?auto_134219 ) ) ( not ( = ?auto_134216 ?auto_134215 ) ) ( not ( = ?auto_134221 ?auto_134218 ) ) ( not ( = ?auto_134221 ?auto_134217 ) ) ( not ( = ?auto_134221 ?auto_134219 ) ) ( not ( = ?auto_134221 ?auto_134215 ) ) ( not ( = ?auto_134218 ?auto_134217 ) ) ( not ( = ?auto_134218 ?auto_134219 ) ) ( not ( = ?auto_134218 ?auto_134215 ) ) ( not ( = ?auto_134217 ?auto_134219 ) ) ( not ( = ?auto_134217 ?auto_134215 ) ) ( ON ?auto_134215 ?auto_134222 ) ( not ( = ?auto_134215 ?auto_134222 ) ) ( not ( = ?auto_134219 ?auto_134222 ) ) ( not ( = ?auto_134220 ?auto_134222 ) ) ( not ( = ?auto_134223 ?auto_134222 ) ) ( not ( = ?auto_134216 ?auto_134222 ) ) ( not ( = ?auto_134221 ?auto_134222 ) ) ( not ( = ?auto_134218 ?auto_134222 ) ) ( not ( = ?auto_134217 ?auto_134222 ) ) ( ON ?auto_134219 ?auto_134215 ) ( ON-TABLE ?auto_134222 ) ( ON ?auto_134217 ?auto_134219 ) ( ON ?auto_134218 ?auto_134217 ) ( CLEAR ?auto_134216 ) ( ON ?auto_134221 ?auto_134218 ) ( CLEAR ?auto_134221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134222 ?auto_134215 ?auto_134219 ?auto_134217 ?auto_134218 )
      ( MAKE-1PILE ?auto_134215 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134224 - BLOCK
    )
    :vars
    (
      ?auto_134229 - BLOCK
      ?auto_134228 - BLOCK
      ?auto_134230 - BLOCK
      ?auto_134232 - BLOCK
      ?auto_134231 - BLOCK
      ?auto_134226 - BLOCK
      ?auto_134227 - BLOCK
      ?auto_134225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134224 ?auto_134229 ) ) ( ON-TABLE ?auto_134228 ) ( ON ?auto_134230 ?auto_134228 ) ( not ( = ?auto_134228 ?auto_134230 ) ) ( not ( = ?auto_134228 ?auto_134232 ) ) ( not ( = ?auto_134228 ?auto_134231 ) ) ( not ( = ?auto_134228 ?auto_134226 ) ) ( not ( = ?auto_134228 ?auto_134227 ) ) ( not ( = ?auto_134228 ?auto_134229 ) ) ( not ( = ?auto_134228 ?auto_134224 ) ) ( not ( = ?auto_134230 ?auto_134232 ) ) ( not ( = ?auto_134230 ?auto_134231 ) ) ( not ( = ?auto_134230 ?auto_134226 ) ) ( not ( = ?auto_134230 ?auto_134227 ) ) ( not ( = ?auto_134230 ?auto_134229 ) ) ( not ( = ?auto_134230 ?auto_134224 ) ) ( not ( = ?auto_134232 ?auto_134231 ) ) ( not ( = ?auto_134232 ?auto_134226 ) ) ( not ( = ?auto_134232 ?auto_134227 ) ) ( not ( = ?auto_134232 ?auto_134229 ) ) ( not ( = ?auto_134232 ?auto_134224 ) ) ( not ( = ?auto_134231 ?auto_134226 ) ) ( not ( = ?auto_134231 ?auto_134227 ) ) ( not ( = ?auto_134231 ?auto_134229 ) ) ( not ( = ?auto_134231 ?auto_134224 ) ) ( not ( = ?auto_134226 ?auto_134227 ) ) ( not ( = ?auto_134226 ?auto_134229 ) ) ( not ( = ?auto_134226 ?auto_134224 ) ) ( not ( = ?auto_134227 ?auto_134229 ) ) ( not ( = ?auto_134227 ?auto_134224 ) ) ( ON ?auto_134224 ?auto_134225 ) ( not ( = ?auto_134224 ?auto_134225 ) ) ( not ( = ?auto_134229 ?auto_134225 ) ) ( not ( = ?auto_134228 ?auto_134225 ) ) ( not ( = ?auto_134230 ?auto_134225 ) ) ( not ( = ?auto_134232 ?auto_134225 ) ) ( not ( = ?auto_134231 ?auto_134225 ) ) ( not ( = ?auto_134226 ?auto_134225 ) ) ( not ( = ?auto_134227 ?auto_134225 ) ) ( ON ?auto_134229 ?auto_134224 ) ( ON-TABLE ?auto_134225 ) ( ON ?auto_134227 ?auto_134229 ) ( ON ?auto_134226 ?auto_134227 ) ( ON ?auto_134231 ?auto_134226 ) ( CLEAR ?auto_134231 ) ( HOLDING ?auto_134232 ) ( CLEAR ?auto_134230 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134228 ?auto_134230 ?auto_134232 )
      ( MAKE-1PILE ?auto_134224 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134233 - BLOCK
    )
    :vars
    (
      ?auto_134239 - BLOCK
      ?auto_134241 - BLOCK
      ?auto_134238 - BLOCK
      ?auto_134240 - BLOCK
      ?auto_134237 - BLOCK
      ?auto_134235 - BLOCK
      ?auto_134236 - BLOCK
      ?auto_134234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134233 ?auto_134239 ) ) ( ON-TABLE ?auto_134241 ) ( ON ?auto_134238 ?auto_134241 ) ( not ( = ?auto_134241 ?auto_134238 ) ) ( not ( = ?auto_134241 ?auto_134240 ) ) ( not ( = ?auto_134241 ?auto_134237 ) ) ( not ( = ?auto_134241 ?auto_134235 ) ) ( not ( = ?auto_134241 ?auto_134236 ) ) ( not ( = ?auto_134241 ?auto_134239 ) ) ( not ( = ?auto_134241 ?auto_134233 ) ) ( not ( = ?auto_134238 ?auto_134240 ) ) ( not ( = ?auto_134238 ?auto_134237 ) ) ( not ( = ?auto_134238 ?auto_134235 ) ) ( not ( = ?auto_134238 ?auto_134236 ) ) ( not ( = ?auto_134238 ?auto_134239 ) ) ( not ( = ?auto_134238 ?auto_134233 ) ) ( not ( = ?auto_134240 ?auto_134237 ) ) ( not ( = ?auto_134240 ?auto_134235 ) ) ( not ( = ?auto_134240 ?auto_134236 ) ) ( not ( = ?auto_134240 ?auto_134239 ) ) ( not ( = ?auto_134240 ?auto_134233 ) ) ( not ( = ?auto_134237 ?auto_134235 ) ) ( not ( = ?auto_134237 ?auto_134236 ) ) ( not ( = ?auto_134237 ?auto_134239 ) ) ( not ( = ?auto_134237 ?auto_134233 ) ) ( not ( = ?auto_134235 ?auto_134236 ) ) ( not ( = ?auto_134235 ?auto_134239 ) ) ( not ( = ?auto_134235 ?auto_134233 ) ) ( not ( = ?auto_134236 ?auto_134239 ) ) ( not ( = ?auto_134236 ?auto_134233 ) ) ( ON ?auto_134233 ?auto_134234 ) ( not ( = ?auto_134233 ?auto_134234 ) ) ( not ( = ?auto_134239 ?auto_134234 ) ) ( not ( = ?auto_134241 ?auto_134234 ) ) ( not ( = ?auto_134238 ?auto_134234 ) ) ( not ( = ?auto_134240 ?auto_134234 ) ) ( not ( = ?auto_134237 ?auto_134234 ) ) ( not ( = ?auto_134235 ?auto_134234 ) ) ( not ( = ?auto_134236 ?auto_134234 ) ) ( ON ?auto_134239 ?auto_134233 ) ( ON-TABLE ?auto_134234 ) ( ON ?auto_134236 ?auto_134239 ) ( ON ?auto_134235 ?auto_134236 ) ( ON ?auto_134237 ?auto_134235 ) ( CLEAR ?auto_134238 ) ( ON ?auto_134240 ?auto_134237 ) ( CLEAR ?auto_134240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134234 ?auto_134233 ?auto_134239 ?auto_134236 ?auto_134235 ?auto_134237 )
      ( MAKE-1PILE ?auto_134233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134242 - BLOCK
    )
    :vars
    (
      ?auto_134247 - BLOCK
      ?auto_134249 - BLOCK
      ?auto_134243 - BLOCK
      ?auto_134248 - BLOCK
      ?auto_134250 - BLOCK
      ?auto_134245 - BLOCK
      ?auto_134246 - BLOCK
      ?auto_134244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134242 ?auto_134247 ) ) ( ON-TABLE ?auto_134249 ) ( not ( = ?auto_134249 ?auto_134243 ) ) ( not ( = ?auto_134249 ?auto_134248 ) ) ( not ( = ?auto_134249 ?auto_134250 ) ) ( not ( = ?auto_134249 ?auto_134245 ) ) ( not ( = ?auto_134249 ?auto_134246 ) ) ( not ( = ?auto_134249 ?auto_134247 ) ) ( not ( = ?auto_134249 ?auto_134242 ) ) ( not ( = ?auto_134243 ?auto_134248 ) ) ( not ( = ?auto_134243 ?auto_134250 ) ) ( not ( = ?auto_134243 ?auto_134245 ) ) ( not ( = ?auto_134243 ?auto_134246 ) ) ( not ( = ?auto_134243 ?auto_134247 ) ) ( not ( = ?auto_134243 ?auto_134242 ) ) ( not ( = ?auto_134248 ?auto_134250 ) ) ( not ( = ?auto_134248 ?auto_134245 ) ) ( not ( = ?auto_134248 ?auto_134246 ) ) ( not ( = ?auto_134248 ?auto_134247 ) ) ( not ( = ?auto_134248 ?auto_134242 ) ) ( not ( = ?auto_134250 ?auto_134245 ) ) ( not ( = ?auto_134250 ?auto_134246 ) ) ( not ( = ?auto_134250 ?auto_134247 ) ) ( not ( = ?auto_134250 ?auto_134242 ) ) ( not ( = ?auto_134245 ?auto_134246 ) ) ( not ( = ?auto_134245 ?auto_134247 ) ) ( not ( = ?auto_134245 ?auto_134242 ) ) ( not ( = ?auto_134246 ?auto_134247 ) ) ( not ( = ?auto_134246 ?auto_134242 ) ) ( ON ?auto_134242 ?auto_134244 ) ( not ( = ?auto_134242 ?auto_134244 ) ) ( not ( = ?auto_134247 ?auto_134244 ) ) ( not ( = ?auto_134249 ?auto_134244 ) ) ( not ( = ?auto_134243 ?auto_134244 ) ) ( not ( = ?auto_134248 ?auto_134244 ) ) ( not ( = ?auto_134250 ?auto_134244 ) ) ( not ( = ?auto_134245 ?auto_134244 ) ) ( not ( = ?auto_134246 ?auto_134244 ) ) ( ON ?auto_134247 ?auto_134242 ) ( ON-TABLE ?auto_134244 ) ( ON ?auto_134246 ?auto_134247 ) ( ON ?auto_134245 ?auto_134246 ) ( ON ?auto_134250 ?auto_134245 ) ( ON ?auto_134248 ?auto_134250 ) ( CLEAR ?auto_134248 ) ( HOLDING ?auto_134243 ) ( CLEAR ?auto_134249 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134249 ?auto_134243 )
      ( MAKE-1PILE ?auto_134242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134251 - BLOCK
    )
    :vars
    (
      ?auto_134257 - BLOCK
      ?auto_134252 - BLOCK
      ?auto_134259 - BLOCK
      ?auto_134254 - BLOCK
      ?auto_134255 - BLOCK
      ?auto_134253 - BLOCK
      ?auto_134258 - BLOCK
      ?auto_134256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134251 ?auto_134257 ) ) ( ON-TABLE ?auto_134252 ) ( not ( = ?auto_134252 ?auto_134259 ) ) ( not ( = ?auto_134252 ?auto_134254 ) ) ( not ( = ?auto_134252 ?auto_134255 ) ) ( not ( = ?auto_134252 ?auto_134253 ) ) ( not ( = ?auto_134252 ?auto_134258 ) ) ( not ( = ?auto_134252 ?auto_134257 ) ) ( not ( = ?auto_134252 ?auto_134251 ) ) ( not ( = ?auto_134259 ?auto_134254 ) ) ( not ( = ?auto_134259 ?auto_134255 ) ) ( not ( = ?auto_134259 ?auto_134253 ) ) ( not ( = ?auto_134259 ?auto_134258 ) ) ( not ( = ?auto_134259 ?auto_134257 ) ) ( not ( = ?auto_134259 ?auto_134251 ) ) ( not ( = ?auto_134254 ?auto_134255 ) ) ( not ( = ?auto_134254 ?auto_134253 ) ) ( not ( = ?auto_134254 ?auto_134258 ) ) ( not ( = ?auto_134254 ?auto_134257 ) ) ( not ( = ?auto_134254 ?auto_134251 ) ) ( not ( = ?auto_134255 ?auto_134253 ) ) ( not ( = ?auto_134255 ?auto_134258 ) ) ( not ( = ?auto_134255 ?auto_134257 ) ) ( not ( = ?auto_134255 ?auto_134251 ) ) ( not ( = ?auto_134253 ?auto_134258 ) ) ( not ( = ?auto_134253 ?auto_134257 ) ) ( not ( = ?auto_134253 ?auto_134251 ) ) ( not ( = ?auto_134258 ?auto_134257 ) ) ( not ( = ?auto_134258 ?auto_134251 ) ) ( ON ?auto_134251 ?auto_134256 ) ( not ( = ?auto_134251 ?auto_134256 ) ) ( not ( = ?auto_134257 ?auto_134256 ) ) ( not ( = ?auto_134252 ?auto_134256 ) ) ( not ( = ?auto_134259 ?auto_134256 ) ) ( not ( = ?auto_134254 ?auto_134256 ) ) ( not ( = ?auto_134255 ?auto_134256 ) ) ( not ( = ?auto_134253 ?auto_134256 ) ) ( not ( = ?auto_134258 ?auto_134256 ) ) ( ON ?auto_134257 ?auto_134251 ) ( ON-TABLE ?auto_134256 ) ( ON ?auto_134258 ?auto_134257 ) ( ON ?auto_134253 ?auto_134258 ) ( ON ?auto_134255 ?auto_134253 ) ( ON ?auto_134254 ?auto_134255 ) ( CLEAR ?auto_134252 ) ( ON ?auto_134259 ?auto_134254 ) ( CLEAR ?auto_134259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134256 ?auto_134251 ?auto_134257 ?auto_134258 ?auto_134253 ?auto_134255 ?auto_134254 )
      ( MAKE-1PILE ?auto_134251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134260 - BLOCK
    )
    :vars
    (
      ?auto_134263 - BLOCK
      ?auto_134266 - BLOCK
      ?auto_134261 - BLOCK
      ?auto_134264 - BLOCK
      ?auto_134268 - BLOCK
      ?auto_134267 - BLOCK
      ?auto_134262 - BLOCK
      ?auto_134265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134260 ?auto_134263 ) ) ( not ( = ?auto_134266 ?auto_134261 ) ) ( not ( = ?auto_134266 ?auto_134264 ) ) ( not ( = ?auto_134266 ?auto_134268 ) ) ( not ( = ?auto_134266 ?auto_134267 ) ) ( not ( = ?auto_134266 ?auto_134262 ) ) ( not ( = ?auto_134266 ?auto_134263 ) ) ( not ( = ?auto_134266 ?auto_134260 ) ) ( not ( = ?auto_134261 ?auto_134264 ) ) ( not ( = ?auto_134261 ?auto_134268 ) ) ( not ( = ?auto_134261 ?auto_134267 ) ) ( not ( = ?auto_134261 ?auto_134262 ) ) ( not ( = ?auto_134261 ?auto_134263 ) ) ( not ( = ?auto_134261 ?auto_134260 ) ) ( not ( = ?auto_134264 ?auto_134268 ) ) ( not ( = ?auto_134264 ?auto_134267 ) ) ( not ( = ?auto_134264 ?auto_134262 ) ) ( not ( = ?auto_134264 ?auto_134263 ) ) ( not ( = ?auto_134264 ?auto_134260 ) ) ( not ( = ?auto_134268 ?auto_134267 ) ) ( not ( = ?auto_134268 ?auto_134262 ) ) ( not ( = ?auto_134268 ?auto_134263 ) ) ( not ( = ?auto_134268 ?auto_134260 ) ) ( not ( = ?auto_134267 ?auto_134262 ) ) ( not ( = ?auto_134267 ?auto_134263 ) ) ( not ( = ?auto_134267 ?auto_134260 ) ) ( not ( = ?auto_134262 ?auto_134263 ) ) ( not ( = ?auto_134262 ?auto_134260 ) ) ( ON ?auto_134260 ?auto_134265 ) ( not ( = ?auto_134260 ?auto_134265 ) ) ( not ( = ?auto_134263 ?auto_134265 ) ) ( not ( = ?auto_134266 ?auto_134265 ) ) ( not ( = ?auto_134261 ?auto_134265 ) ) ( not ( = ?auto_134264 ?auto_134265 ) ) ( not ( = ?auto_134268 ?auto_134265 ) ) ( not ( = ?auto_134267 ?auto_134265 ) ) ( not ( = ?auto_134262 ?auto_134265 ) ) ( ON ?auto_134263 ?auto_134260 ) ( ON-TABLE ?auto_134265 ) ( ON ?auto_134262 ?auto_134263 ) ( ON ?auto_134267 ?auto_134262 ) ( ON ?auto_134268 ?auto_134267 ) ( ON ?auto_134264 ?auto_134268 ) ( ON ?auto_134261 ?auto_134264 ) ( CLEAR ?auto_134261 ) ( HOLDING ?auto_134266 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134266 )
      ( MAKE-1PILE ?auto_134260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_134269 - BLOCK
    )
    :vars
    (
      ?auto_134270 - BLOCK
      ?auto_134271 - BLOCK
      ?auto_134277 - BLOCK
      ?auto_134275 - BLOCK
      ?auto_134276 - BLOCK
      ?auto_134273 - BLOCK
      ?auto_134274 - BLOCK
      ?auto_134272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134269 ?auto_134270 ) ) ( not ( = ?auto_134271 ?auto_134277 ) ) ( not ( = ?auto_134271 ?auto_134275 ) ) ( not ( = ?auto_134271 ?auto_134276 ) ) ( not ( = ?auto_134271 ?auto_134273 ) ) ( not ( = ?auto_134271 ?auto_134274 ) ) ( not ( = ?auto_134271 ?auto_134270 ) ) ( not ( = ?auto_134271 ?auto_134269 ) ) ( not ( = ?auto_134277 ?auto_134275 ) ) ( not ( = ?auto_134277 ?auto_134276 ) ) ( not ( = ?auto_134277 ?auto_134273 ) ) ( not ( = ?auto_134277 ?auto_134274 ) ) ( not ( = ?auto_134277 ?auto_134270 ) ) ( not ( = ?auto_134277 ?auto_134269 ) ) ( not ( = ?auto_134275 ?auto_134276 ) ) ( not ( = ?auto_134275 ?auto_134273 ) ) ( not ( = ?auto_134275 ?auto_134274 ) ) ( not ( = ?auto_134275 ?auto_134270 ) ) ( not ( = ?auto_134275 ?auto_134269 ) ) ( not ( = ?auto_134276 ?auto_134273 ) ) ( not ( = ?auto_134276 ?auto_134274 ) ) ( not ( = ?auto_134276 ?auto_134270 ) ) ( not ( = ?auto_134276 ?auto_134269 ) ) ( not ( = ?auto_134273 ?auto_134274 ) ) ( not ( = ?auto_134273 ?auto_134270 ) ) ( not ( = ?auto_134273 ?auto_134269 ) ) ( not ( = ?auto_134274 ?auto_134270 ) ) ( not ( = ?auto_134274 ?auto_134269 ) ) ( ON ?auto_134269 ?auto_134272 ) ( not ( = ?auto_134269 ?auto_134272 ) ) ( not ( = ?auto_134270 ?auto_134272 ) ) ( not ( = ?auto_134271 ?auto_134272 ) ) ( not ( = ?auto_134277 ?auto_134272 ) ) ( not ( = ?auto_134275 ?auto_134272 ) ) ( not ( = ?auto_134276 ?auto_134272 ) ) ( not ( = ?auto_134273 ?auto_134272 ) ) ( not ( = ?auto_134274 ?auto_134272 ) ) ( ON ?auto_134270 ?auto_134269 ) ( ON-TABLE ?auto_134272 ) ( ON ?auto_134274 ?auto_134270 ) ( ON ?auto_134273 ?auto_134274 ) ( ON ?auto_134276 ?auto_134273 ) ( ON ?auto_134275 ?auto_134276 ) ( ON ?auto_134277 ?auto_134275 ) ( ON ?auto_134271 ?auto_134277 ) ( CLEAR ?auto_134271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134272 ?auto_134269 ?auto_134270 ?auto_134274 ?auto_134273 ?auto_134276 ?auto_134275 ?auto_134277 )
      ( MAKE-1PILE ?auto_134269 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134284 - BLOCK
      ?auto_134285 - BLOCK
      ?auto_134286 - BLOCK
      ?auto_134287 - BLOCK
      ?auto_134288 - BLOCK
      ?auto_134289 - BLOCK
    )
    :vars
    (
      ?auto_134290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134290 ?auto_134289 ) ( CLEAR ?auto_134290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134284 ) ( ON ?auto_134285 ?auto_134284 ) ( ON ?auto_134286 ?auto_134285 ) ( ON ?auto_134287 ?auto_134286 ) ( ON ?auto_134288 ?auto_134287 ) ( ON ?auto_134289 ?auto_134288 ) ( not ( = ?auto_134284 ?auto_134285 ) ) ( not ( = ?auto_134284 ?auto_134286 ) ) ( not ( = ?auto_134284 ?auto_134287 ) ) ( not ( = ?auto_134284 ?auto_134288 ) ) ( not ( = ?auto_134284 ?auto_134289 ) ) ( not ( = ?auto_134284 ?auto_134290 ) ) ( not ( = ?auto_134285 ?auto_134286 ) ) ( not ( = ?auto_134285 ?auto_134287 ) ) ( not ( = ?auto_134285 ?auto_134288 ) ) ( not ( = ?auto_134285 ?auto_134289 ) ) ( not ( = ?auto_134285 ?auto_134290 ) ) ( not ( = ?auto_134286 ?auto_134287 ) ) ( not ( = ?auto_134286 ?auto_134288 ) ) ( not ( = ?auto_134286 ?auto_134289 ) ) ( not ( = ?auto_134286 ?auto_134290 ) ) ( not ( = ?auto_134287 ?auto_134288 ) ) ( not ( = ?auto_134287 ?auto_134289 ) ) ( not ( = ?auto_134287 ?auto_134290 ) ) ( not ( = ?auto_134288 ?auto_134289 ) ) ( not ( = ?auto_134288 ?auto_134290 ) ) ( not ( = ?auto_134289 ?auto_134290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134290 ?auto_134289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134291 - BLOCK
      ?auto_134292 - BLOCK
      ?auto_134293 - BLOCK
      ?auto_134294 - BLOCK
      ?auto_134295 - BLOCK
      ?auto_134296 - BLOCK
    )
    :vars
    (
      ?auto_134297 - BLOCK
      ?auto_134298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134297 ?auto_134296 ) ( CLEAR ?auto_134297 ) ( ON-TABLE ?auto_134291 ) ( ON ?auto_134292 ?auto_134291 ) ( ON ?auto_134293 ?auto_134292 ) ( ON ?auto_134294 ?auto_134293 ) ( ON ?auto_134295 ?auto_134294 ) ( ON ?auto_134296 ?auto_134295 ) ( not ( = ?auto_134291 ?auto_134292 ) ) ( not ( = ?auto_134291 ?auto_134293 ) ) ( not ( = ?auto_134291 ?auto_134294 ) ) ( not ( = ?auto_134291 ?auto_134295 ) ) ( not ( = ?auto_134291 ?auto_134296 ) ) ( not ( = ?auto_134291 ?auto_134297 ) ) ( not ( = ?auto_134292 ?auto_134293 ) ) ( not ( = ?auto_134292 ?auto_134294 ) ) ( not ( = ?auto_134292 ?auto_134295 ) ) ( not ( = ?auto_134292 ?auto_134296 ) ) ( not ( = ?auto_134292 ?auto_134297 ) ) ( not ( = ?auto_134293 ?auto_134294 ) ) ( not ( = ?auto_134293 ?auto_134295 ) ) ( not ( = ?auto_134293 ?auto_134296 ) ) ( not ( = ?auto_134293 ?auto_134297 ) ) ( not ( = ?auto_134294 ?auto_134295 ) ) ( not ( = ?auto_134294 ?auto_134296 ) ) ( not ( = ?auto_134294 ?auto_134297 ) ) ( not ( = ?auto_134295 ?auto_134296 ) ) ( not ( = ?auto_134295 ?auto_134297 ) ) ( not ( = ?auto_134296 ?auto_134297 ) ) ( HOLDING ?auto_134298 ) ( not ( = ?auto_134291 ?auto_134298 ) ) ( not ( = ?auto_134292 ?auto_134298 ) ) ( not ( = ?auto_134293 ?auto_134298 ) ) ( not ( = ?auto_134294 ?auto_134298 ) ) ( not ( = ?auto_134295 ?auto_134298 ) ) ( not ( = ?auto_134296 ?auto_134298 ) ) ( not ( = ?auto_134297 ?auto_134298 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_134298 )
      ( MAKE-6PILE ?auto_134291 ?auto_134292 ?auto_134293 ?auto_134294 ?auto_134295 ?auto_134296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134299 - BLOCK
      ?auto_134300 - BLOCK
      ?auto_134301 - BLOCK
      ?auto_134302 - BLOCK
      ?auto_134303 - BLOCK
      ?auto_134304 - BLOCK
    )
    :vars
    (
      ?auto_134305 - BLOCK
      ?auto_134306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134305 ?auto_134304 ) ( ON-TABLE ?auto_134299 ) ( ON ?auto_134300 ?auto_134299 ) ( ON ?auto_134301 ?auto_134300 ) ( ON ?auto_134302 ?auto_134301 ) ( ON ?auto_134303 ?auto_134302 ) ( ON ?auto_134304 ?auto_134303 ) ( not ( = ?auto_134299 ?auto_134300 ) ) ( not ( = ?auto_134299 ?auto_134301 ) ) ( not ( = ?auto_134299 ?auto_134302 ) ) ( not ( = ?auto_134299 ?auto_134303 ) ) ( not ( = ?auto_134299 ?auto_134304 ) ) ( not ( = ?auto_134299 ?auto_134305 ) ) ( not ( = ?auto_134300 ?auto_134301 ) ) ( not ( = ?auto_134300 ?auto_134302 ) ) ( not ( = ?auto_134300 ?auto_134303 ) ) ( not ( = ?auto_134300 ?auto_134304 ) ) ( not ( = ?auto_134300 ?auto_134305 ) ) ( not ( = ?auto_134301 ?auto_134302 ) ) ( not ( = ?auto_134301 ?auto_134303 ) ) ( not ( = ?auto_134301 ?auto_134304 ) ) ( not ( = ?auto_134301 ?auto_134305 ) ) ( not ( = ?auto_134302 ?auto_134303 ) ) ( not ( = ?auto_134302 ?auto_134304 ) ) ( not ( = ?auto_134302 ?auto_134305 ) ) ( not ( = ?auto_134303 ?auto_134304 ) ) ( not ( = ?auto_134303 ?auto_134305 ) ) ( not ( = ?auto_134304 ?auto_134305 ) ) ( not ( = ?auto_134299 ?auto_134306 ) ) ( not ( = ?auto_134300 ?auto_134306 ) ) ( not ( = ?auto_134301 ?auto_134306 ) ) ( not ( = ?auto_134302 ?auto_134306 ) ) ( not ( = ?auto_134303 ?auto_134306 ) ) ( not ( = ?auto_134304 ?auto_134306 ) ) ( not ( = ?auto_134305 ?auto_134306 ) ) ( ON ?auto_134306 ?auto_134305 ) ( CLEAR ?auto_134306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134299 ?auto_134300 ?auto_134301 ?auto_134302 ?auto_134303 ?auto_134304 ?auto_134305 )
      ( MAKE-6PILE ?auto_134299 ?auto_134300 ?auto_134301 ?auto_134302 ?auto_134303 ?auto_134304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134307 - BLOCK
      ?auto_134308 - BLOCK
      ?auto_134309 - BLOCK
      ?auto_134310 - BLOCK
      ?auto_134311 - BLOCK
      ?auto_134312 - BLOCK
    )
    :vars
    (
      ?auto_134314 - BLOCK
      ?auto_134313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134314 ?auto_134312 ) ( ON-TABLE ?auto_134307 ) ( ON ?auto_134308 ?auto_134307 ) ( ON ?auto_134309 ?auto_134308 ) ( ON ?auto_134310 ?auto_134309 ) ( ON ?auto_134311 ?auto_134310 ) ( ON ?auto_134312 ?auto_134311 ) ( not ( = ?auto_134307 ?auto_134308 ) ) ( not ( = ?auto_134307 ?auto_134309 ) ) ( not ( = ?auto_134307 ?auto_134310 ) ) ( not ( = ?auto_134307 ?auto_134311 ) ) ( not ( = ?auto_134307 ?auto_134312 ) ) ( not ( = ?auto_134307 ?auto_134314 ) ) ( not ( = ?auto_134308 ?auto_134309 ) ) ( not ( = ?auto_134308 ?auto_134310 ) ) ( not ( = ?auto_134308 ?auto_134311 ) ) ( not ( = ?auto_134308 ?auto_134312 ) ) ( not ( = ?auto_134308 ?auto_134314 ) ) ( not ( = ?auto_134309 ?auto_134310 ) ) ( not ( = ?auto_134309 ?auto_134311 ) ) ( not ( = ?auto_134309 ?auto_134312 ) ) ( not ( = ?auto_134309 ?auto_134314 ) ) ( not ( = ?auto_134310 ?auto_134311 ) ) ( not ( = ?auto_134310 ?auto_134312 ) ) ( not ( = ?auto_134310 ?auto_134314 ) ) ( not ( = ?auto_134311 ?auto_134312 ) ) ( not ( = ?auto_134311 ?auto_134314 ) ) ( not ( = ?auto_134312 ?auto_134314 ) ) ( not ( = ?auto_134307 ?auto_134313 ) ) ( not ( = ?auto_134308 ?auto_134313 ) ) ( not ( = ?auto_134309 ?auto_134313 ) ) ( not ( = ?auto_134310 ?auto_134313 ) ) ( not ( = ?auto_134311 ?auto_134313 ) ) ( not ( = ?auto_134312 ?auto_134313 ) ) ( not ( = ?auto_134314 ?auto_134313 ) ) ( HOLDING ?auto_134313 ) ( CLEAR ?auto_134314 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134307 ?auto_134308 ?auto_134309 ?auto_134310 ?auto_134311 ?auto_134312 ?auto_134314 ?auto_134313 )
      ( MAKE-6PILE ?auto_134307 ?auto_134308 ?auto_134309 ?auto_134310 ?auto_134311 ?auto_134312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134315 - BLOCK
      ?auto_134316 - BLOCK
      ?auto_134317 - BLOCK
      ?auto_134318 - BLOCK
      ?auto_134319 - BLOCK
      ?auto_134320 - BLOCK
    )
    :vars
    (
      ?auto_134321 - BLOCK
      ?auto_134322 - BLOCK
      ?auto_134323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134321 ?auto_134320 ) ( ON-TABLE ?auto_134315 ) ( ON ?auto_134316 ?auto_134315 ) ( ON ?auto_134317 ?auto_134316 ) ( ON ?auto_134318 ?auto_134317 ) ( ON ?auto_134319 ?auto_134318 ) ( ON ?auto_134320 ?auto_134319 ) ( not ( = ?auto_134315 ?auto_134316 ) ) ( not ( = ?auto_134315 ?auto_134317 ) ) ( not ( = ?auto_134315 ?auto_134318 ) ) ( not ( = ?auto_134315 ?auto_134319 ) ) ( not ( = ?auto_134315 ?auto_134320 ) ) ( not ( = ?auto_134315 ?auto_134321 ) ) ( not ( = ?auto_134316 ?auto_134317 ) ) ( not ( = ?auto_134316 ?auto_134318 ) ) ( not ( = ?auto_134316 ?auto_134319 ) ) ( not ( = ?auto_134316 ?auto_134320 ) ) ( not ( = ?auto_134316 ?auto_134321 ) ) ( not ( = ?auto_134317 ?auto_134318 ) ) ( not ( = ?auto_134317 ?auto_134319 ) ) ( not ( = ?auto_134317 ?auto_134320 ) ) ( not ( = ?auto_134317 ?auto_134321 ) ) ( not ( = ?auto_134318 ?auto_134319 ) ) ( not ( = ?auto_134318 ?auto_134320 ) ) ( not ( = ?auto_134318 ?auto_134321 ) ) ( not ( = ?auto_134319 ?auto_134320 ) ) ( not ( = ?auto_134319 ?auto_134321 ) ) ( not ( = ?auto_134320 ?auto_134321 ) ) ( not ( = ?auto_134315 ?auto_134322 ) ) ( not ( = ?auto_134316 ?auto_134322 ) ) ( not ( = ?auto_134317 ?auto_134322 ) ) ( not ( = ?auto_134318 ?auto_134322 ) ) ( not ( = ?auto_134319 ?auto_134322 ) ) ( not ( = ?auto_134320 ?auto_134322 ) ) ( not ( = ?auto_134321 ?auto_134322 ) ) ( CLEAR ?auto_134321 ) ( ON ?auto_134322 ?auto_134323 ) ( CLEAR ?auto_134322 ) ( HAND-EMPTY ) ( not ( = ?auto_134315 ?auto_134323 ) ) ( not ( = ?auto_134316 ?auto_134323 ) ) ( not ( = ?auto_134317 ?auto_134323 ) ) ( not ( = ?auto_134318 ?auto_134323 ) ) ( not ( = ?auto_134319 ?auto_134323 ) ) ( not ( = ?auto_134320 ?auto_134323 ) ) ( not ( = ?auto_134321 ?auto_134323 ) ) ( not ( = ?auto_134322 ?auto_134323 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134322 ?auto_134323 )
      ( MAKE-6PILE ?auto_134315 ?auto_134316 ?auto_134317 ?auto_134318 ?auto_134319 ?auto_134320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134342 - BLOCK
      ?auto_134343 - BLOCK
      ?auto_134344 - BLOCK
      ?auto_134345 - BLOCK
      ?auto_134346 - BLOCK
      ?auto_134347 - BLOCK
    )
    :vars
    (
      ?auto_134348 - BLOCK
      ?auto_134350 - BLOCK
      ?auto_134349 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134342 ) ( ON ?auto_134343 ?auto_134342 ) ( ON ?auto_134344 ?auto_134343 ) ( ON ?auto_134345 ?auto_134344 ) ( ON ?auto_134346 ?auto_134345 ) ( not ( = ?auto_134342 ?auto_134343 ) ) ( not ( = ?auto_134342 ?auto_134344 ) ) ( not ( = ?auto_134342 ?auto_134345 ) ) ( not ( = ?auto_134342 ?auto_134346 ) ) ( not ( = ?auto_134342 ?auto_134347 ) ) ( not ( = ?auto_134342 ?auto_134348 ) ) ( not ( = ?auto_134343 ?auto_134344 ) ) ( not ( = ?auto_134343 ?auto_134345 ) ) ( not ( = ?auto_134343 ?auto_134346 ) ) ( not ( = ?auto_134343 ?auto_134347 ) ) ( not ( = ?auto_134343 ?auto_134348 ) ) ( not ( = ?auto_134344 ?auto_134345 ) ) ( not ( = ?auto_134344 ?auto_134346 ) ) ( not ( = ?auto_134344 ?auto_134347 ) ) ( not ( = ?auto_134344 ?auto_134348 ) ) ( not ( = ?auto_134345 ?auto_134346 ) ) ( not ( = ?auto_134345 ?auto_134347 ) ) ( not ( = ?auto_134345 ?auto_134348 ) ) ( not ( = ?auto_134346 ?auto_134347 ) ) ( not ( = ?auto_134346 ?auto_134348 ) ) ( not ( = ?auto_134347 ?auto_134348 ) ) ( not ( = ?auto_134342 ?auto_134350 ) ) ( not ( = ?auto_134343 ?auto_134350 ) ) ( not ( = ?auto_134344 ?auto_134350 ) ) ( not ( = ?auto_134345 ?auto_134350 ) ) ( not ( = ?auto_134346 ?auto_134350 ) ) ( not ( = ?auto_134347 ?auto_134350 ) ) ( not ( = ?auto_134348 ?auto_134350 ) ) ( ON ?auto_134350 ?auto_134349 ) ( not ( = ?auto_134342 ?auto_134349 ) ) ( not ( = ?auto_134343 ?auto_134349 ) ) ( not ( = ?auto_134344 ?auto_134349 ) ) ( not ( = ?auto_134345 ?auto_134349 ) ) ( not ( = ?auto_134346 ?auto_134349 ) ) ( not ( = ?auto_134347 ?auto_134349 ) ) ( not ( = ?auto_134348 ?auto_134349 ) ) ( not ( = ?auto_134350 ?auto_134349 ) ) ( ON ?auto_134348 ?auto_134350 ) ( CLEAR ?auto_134348 ) ( HOLDING ?auto_134347 ) ( CLEAR ?auto_134346 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134342 ?auto_134343 ?auto_134344 ?auto_134345 ?auto_134346 ?auto_134347 ?auto_134348 )
      ( MAKE-6PILE ?auto_134342 ?auto_134343 ?auto_134344 ?auto_134345 ?auto_134346 ?auto_134347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134351 - BLOCK
      ?auto_134352 - BLOCK
      ?auto_134353 - BLOCK
      ?auto_134354 - BLOCK
      ?auto_134355 - BLOCK
      ?auto_134356 - BLOCK
    )
    :vars
    (
      ?auto_134357 - BLOCK
      ?auto_134359 - BLOCK
      ?auto_134358 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134351 ) ( ON ?auto_134352 ?auto_134351 ) ( ON ?auto_134353 ?auto_134352 ) ( ON ?auto_134354 ?auto_134353 ) ( ON ?auto_134355 ?auto_134354 ) ( not ( = ?auto_134351 ?auto_134352 ) ) ( not ( = ?auto_134351 ?auto_134353 ) ) ( not ( = ?auto_134351 ?auto_134354 ) ) ( not ( = ?auto_134351 ?auto_134355 ) ) ( not ( = ?auto_134351 ?auto_134356 ) ) ( not ( = ?auto_134351 ?auto_134357 ) ) ( not ( = ?auto_134352 ?auto_134353 ) ) ( not ( = ?auto_134352 ?auto_134354 ) ) ( not ( = ?auto_134352 ?auto_134355 ) ) ( not ( = ?auto_134352 ?auto_134356 ) ) ( not ( = ?auto_134352 ?auto_134357 ) ) ( not ( = ?auto_134353 ?auto_134354 ) ) ( not ( = ?auto_134353 ?auto_134355 ) ) ( not ( = ?auto_134353 ?auto_134356 ) ) ( not ( = ?auto_134353 ?auto_134357 ) ) ( not ( = ?auto_134354 ?auto_134355 ) ) ( not ( = ?auto_134354 ?auto_134356 ) ) ( not ( = ?auto_134354 ?auto_134357 ) ) ( not ( = ?auto_134355 ?auto_134356 ) ) ( not ( = ?auto_134355 ?auto_134357 ) ) ( not ( = ?auto_134356 ?auto_134357 ) ) ( not ( = ?auto_134351 ?auto_134359 ) ) ( not ( = ?auto_134352 ?auto_134359 ) ) ( not ( = ?auto_134353 ?auto_134359 ) ) ( not ( = ?auto_134354 ?auto_134359 ) ) ( not ( = ?auto_134355 ?auto_134359 ) ) ( not ( = ?auto_134356 ?auto_134359 ) ) ( not ( = ?auto_134357 ?auto_134359 ) ) ( ON ?auto_134359 ?auto_134358 ) ( not ( = ?auto_134351 ?auto_134358 ) ) ( not ( = ?auto_134352 ?auto_134358 ) ) ( not ( = ?auto_134353 ?auto_134358 ) ) ( not ( = ?auto_134354 ?auto_134358 ) ) ( not ( = ?auto_134355 ?auto_134358 ) ) ( not ( = ?auto_134356 ?auto_134358 ) ) ( not ( = ?auto_134357 ?auto_134358 ) ) ( not ( = ?auto_134359 ?auto_134358 ) ) ( ON ?auto_134357 ?auto_134359 ) ( CLEAR ?auto_134355 ) ( ON ?auto_134356 ?auto_134357 ) ( CLEAR ?auto_134356 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134358 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134358 ?auto_134359 ?auto_134357 )
      ( MAKE-6PILE ?auto_134351 ?auto_134352 ?auto_134353 ?auto_134354 ?auto_134355 ?auto_134356 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134360 - BLOCK
      ?auto_134361 - BLOCK
      ?auto_134362 - BLOCK
      ?auto_134363 - BLOCK
      ?auto_134364 - BLOCK
      ?auto_134365 - BLOCK
    )
    :vars
    (
      ?auto_134368 - BLOCK
      ?auto_134366 - BLOCK
      ?auto_134367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134360 ) ( ON ?auto_134361 ?auto_134360 ) ( ON ?auto_134362 ?auto_134361 ) ( ON ?auto_134363 ?auto_134362 ) ( not ( = ?auto_134360 ?auto_134361 ) ) ( not ( = ?auto_134360 ?auto_134362 ) ) ( not ( = ?auto_134360 ?auto_134363 ) ) ( not ( = ?auto_134360 ?auto_134364 ) ) ( not ( = ?auto_134360 ?auto_134365 ) ) ( not ( = ?auto_134360 ?auto_134368 ) ) ( not ( = ?auto_134361 ?auto_134362 ) ) ( not ( = ?auto_134361 ?auto_134363 ) ) ( not ( = ?auto_134361 ?auto_134364 ) ) ( not ( = ?auto_134361 ?auto_134365 ) ) ( not ( = ?auto_134361 ?auto_134368 ) ) ( not ( = ?auto_134362 ?auto_134363 ) ) ( not ( = ?auto_134362 ?auto_134364 ) ) ( not ( = ?auto_134362 ?auto_134365 ) ) ( not ( = ?auto_134362 ?auto_134368 ) ) ( not ( = ?auto_134363 ?auto_134364 ) ) ( not ( = ?auto_134363 ?auto_134365 ) ) ( not ( = ?auto_134363 ?auto_134368 ) ) ( not ( = ?auto_134364 ?auto_134365 ) ) ( not ( = ?auto_134364 ?auto_134368 ) ) ( not ( = ?auto_134365 ?auto_134368 ) ) ( not ( = ?auto_134360 ?auto_134366 ) ) ( not ( = ?auto_134361 ?auto_134366 ) ) ( not ( = ?auto_134362 ?auto_134366 ) ) ( not ( = ?auto_134363 ?auto_134366 ) ) ( not ( = ?auto_134364 ?auto_134366 ) ) ( not ( = ?auto_134365 ?auto_134366 ) ) ( not ( = ?auto_134368 ?auto_134366 ) ) ( ON ?auto_134366 ?auto_134367 ) ( not ( = ?auto_134360 ?auto_134367 ) ) ( not ( = ?auto_134361 ?auto_134367 ) ) ( not ( = ?auto_134362 ?auto_134367 ) ) ( not ( = ?auto_134363 ?auto_134367 ) ) ( not ( = ?auto_134364 ?auto_134367 ) ) ( not ( = ?auto_134365 ?auto_134367 ) ) ( not ( = ?auto_134368 ?auto_134367 ) ) ( not ( = ?auto_134366 ?auto_134367 ) ) ( ON ?auto_134368 ?auto_134366 ) ( ON ?auto_134365 ?auto_134368 ) ( CLEAR ?auto_134365 ) ( ON-TABLE ?auto_134367 ) ( HOLDING ?auto_134364 ) ( CLEAR ?auto_134363 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134360 ?auto_134361 ?auto_134362 ?auto_134363 ?auto_134364 )
      ( MAKE-6PILE ?auto_134360 ?auto_134361 ?auto_134362 ?auto_134363 ?auto_134364 ?auto_134365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134369 - BLOCK
      ?auto_134370 - BLOCK
      ?auto_134371 - BLOCK
      ?auto_134372 - BLOCK
      ?auto_134373 - BLOCK
      ?auto_134374 - BLOCK
    )
    :vars
    (
      ?auto_134377 - BLOCK
      ?auto_134375 - BLOCK
      ?auto_134376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134369 ) ( ON ?auto_134370 ?auto_134369 ) ( ON ?auto_134371 ?auto_134370 ) ( ON ?auto_134372 ?auto_134371 ) ( not ( = ?auto_134369 ?auto_134370 ) ) ( not ( = ?auto_134369 ?auto_134371 ) ) ( not ( = ?auto_134369 ?auto_134372 ) ) ( not ( = ?auto_134369 ?auto_134373 ) ) ( not ( = ?auto_134369 ?auto_134374 ) ) ( not ( = ?auto_134369 ?auto_134377 ) ) ( not ( = ?auto_134370 ?auto_134371 ) ) ( not ( = ?auto_134370 ?auto_134372 ) ) ( not ( = ?auto_134370 ?auto_134373 ) ) ( not ( = ?auto_134370 ?auto_134374 ) ) ( not ( = ?auto_134370 ?auto_134377 ) ) ( not ( = ?auto_134371 ?auto_134372 ) ) ( not ( = ?auto_134371 ?auto_134373 ) ) ( not ( = ?auto_134371 ?auto_134374 ) ) ( not ( = ?auto_134371 ?auto_134377 ) ) ( not ( = ?auto_134372 ?auto_134373 ) ) ( not ( = ?auto_134372 ?auto_134374 ) ) ( not ( = ?auto_134372 ?auto_134377 ) ) ( not ( = ?auto_134373 ?auto_134374 ) ) ( not ( = ?auto_134373 ?auto_134377 ) ) ( not ( = ?auto_134374 ?auto_134377 ) ) ( not ( = ?auto_134369 ?auto_134375 ) ) ( not ( = ?auto_134370 ?auto_134375 ) ) ( not ( = ?auto_134371 ?auto_134375 ) ) ( not ( = ?auto_134372 ?auto_134375 ) ) ( not ( = ?auto_134373 ?auto_134375 ) ) ( not ( = ?auto_134374 ?auto_134375 ) ) ( not ( = ?auto_134377 ?auto_134375 ) ) ( ON ?auto_134375 ?auto_134376 ) ( not ( = ?auto_134369 ?auto_134376 ) ) ( not ( = ?auto_134370 ?auto_134376 ) ) ( not ( = ?auto_134371 ?auto_134376 ) ) ( not ( = ?auto_134372 ?auto_134376 ) ) ( not ( = ?auto_134373 ?auto_134376 ) ) ( not ( = ?auto_134374 ?auto_134376 ) ) ( not ( = ?auto_134377 ?auto_134376 ) ) ( not ( = ?auto_134375 ?auto_134376 ) ) ( ON ?auto_134377 ?auto_134375 ) ( ON ?auto_134374 ?auto_134377 ) ( ON-TABLE ?auto_134376 ) ( CLEAR ?auto_134372 ) ( ON ?auto_134373 ?auto_134374 ) ( CLEAR ?auto_134373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134376 ?auto_134375 ?auto_134377 ?auto_134374 )
      ( MAKE-6PILE ?auto_134369 ?auto_134370 ?auto_134371 ?auto_134372 ?auto_134373 ?auto_134374 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134378 - BLOCK
      ?auto_134379 - BLOCK
      ?auto_134380 - BLOCK
      ?auto_134381 - BLOCK
      ?auto_134382 - BLOCK
      ?auto_134383 - BLOCK
    )
    :vars
    (
      ?auto_134384 - BLOCK
      ?auto_134385 - BLOCK
      ?auto_134386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134378 ) ( ON ?auto_134379 ?auto_134378 ) ( ON ?auto_134380 ?auto_134379 ) ( not ( = ?auto_134378 ?auto_134379 ) ) ( not ( = ?auto_134378 ?auto_134380 ) ) ( not ( = ?auto_134378 ?auto_134381 ) ) ( not ( = ?auto_134378 ?auto_134382 ) ) ( not ( = ?auto_134378 ?auto_134383 ) ) ( not ( = ?auto_134378 ?auto_134384 ) ) ( not ( = ?auto_134379 ?auto_134380 ) ) ( not ( = ?auto_134379 ?auto_134381 ) ) ( not ( = ?auto_134379 ?auto_134382 ) ) ( not ( = ?auto_134379 ?auto_134383 ) ) ( not ( = ?auto_134379 ?auto_134384 ) ) ( not ( = ?auto_134380 ?auto_134381 ) ) ( not ( = ?auto_134380 ?auto_134382 ) ) ( not ( = ?auto_134380 ?auto_134383 ) ) ( not ( = ?auto_134380 ?auto_134384 ) ) ( not ( = ?auto_134381 ?auto_134382 ) ) ( not ( = ?auto_134381 ?auto_134383 ) ) ( not ( = ?auto_134381 ?auto_134384 ) ) ( not ( = ?auto_134382 ?auto_134383 ) ) ( not ( = ?auto_134382 ?auto_134384 ) ) ( not ( = ?auto_134383 ?auto_134384 ) ) ( not ( = ?auto_134378 ?auto_134385 ) ) ( not ( = ?auto_134379 ?auto_134385 ) ) ( not ( = ?auto_134380 ?auto_134385 ) ) ( not ( = ?auto_134381 ?auto_134385 ) ) ( not ( = ?auto_134382 ?auto_134385 ) ) ( not ( = ?auto_134383 ?auto_134385 ) ) ( not ( = ?auto_134384 ?auto_134385 ) ) ( ON ?auto_134385 ?auto_134386 ) ( not ( = ?auto_134378 ?auto_134386 ) ) ( not ( = ?auto_134379 ?auto_134386 ) ) ( not ( = ?auto_134380 ?auto_134386 ) ) ( not ( = ?auto_134381 ?auto_134386 ) ) ( not ( = ?auto_134382 ?auto_134386 ) ) ( not ( = ?auto_134383 ?auto_134386 ) ) ( not ( = ?auto_134384 ?auto_134386 ) ) ( not ( = ?auto_134385 ?auto_134386 ) ) ( ON ?auto_134384 ?auto_134385 ) ( ON ?auto_134383 ?auto_134384 ) ( ON-TABLE ?auto_134386 ) ( ON ?auto_134382 ?auto_134383 ) ( CLEAR ?auto_134382 ) ( HOLDING ?auto_134381 ) ( CLEAR ?auto_134380 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134378 ?auto_134379 ?auto_134380 ?auto_134381 )
      ( MAKE-6PILE ?auto_134378 ?auto_134379 ?auto_134380 ?auto_134381 ?auto_134382 ?auto_134383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134387 - BLOCK
      ?auto_134388 - BLOCK
      ?auto_134389 - BLOCK
      ?auto_134390 - BLOCK
      ?auto_134391 - BLOCK
      ?auto_134392 - BLOCK
    )
    :vars
    (
      ?auto_134394 - BLOCK
      ?auto_134395 - BLOCK
      ?auto_134393 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134387 ) ( ON ?auto_134388 ?auto_134387 ) ( ON ?auto_134389 ?auto_134388 ) ( not ( = ?auto_134387 ?auto_134388 ) ) ( not ( = ?auto_134387 ?auto_134389 ) ) ( not ( = ?auto_134387 ?auto_134390 ) ) ( not ( = ?auto_134387 ?auto_134391 ) ) ( not ( = ?auto_134387 ?auto_134392 ) ) ( not ( = ?auto_134387 ?auto_134394 ) ) ( not ( = ?auto_134388 ?auto_134389 ) ) ( not ( = ?auto_134388 ?auto_134390 ) ) ( not ( = ?auto_134388 ?auto_134391 ) ) ( not ( = ?auto_134388 ?auto_134392 ) ) ( not ( = ?auto_134388 ?auto_134394 ) ) ( not ( = ?auto_134389 ?auto_134390 ) ) ( not ( = ?auto_134389 ?auto_134391 ) ) ( not ( = ?auto_134389 ?auto_134392 ) ) ( not ( = ?auto_134389 ?auto_134394 ) ) ( not ( = ?auto_134390 ?auto_134391 ) ) ( not ( = ?auto_134390 ?auto_134392 ) ) ( not ( = ?auto_134390 ?auto_134394 ) ) ( not ( = ?auto_134391 ?auto_134392 ) ) ( not ( = ?auto_134391 ?auto_134394 ) ) ( not ( = ?auto_134392 ?auto_134394 ) ) ( not ( = ?auto_134387 ?auto_134395 ) ) ( not ( = ?auto_134388 ?auto_134395 ) ) ( not ( = ?auto_134389 ?auto_134395 ) ) ( not ( = ?auto_134390 ?auto_134395 ) ) ( not ( = ?auto_134391 ?auto_134395 ) ) ( not ( = ?auto_134392 ?auto_134395 ) ) ( not ( = ?auto_134394 ?auto_134395 ) ) ( ON ?auto_134395 ?auto_134393 ) ( not ( = ?auto_134387 ?auto_134393 ) ) ( not ( = ?auto_134388 ?auto_134393 ) ) ( not ( = ?auto_134389 ?auto_134393 ) ) ( not ( = ?auto_134390 ?auto_134393 ) ) ( not ( = ?auto_134391 ?auto_134393 ) ) ( not ( = ?auto_134392 ?auto_134393 ) ) ( not ( = ?auto_134394 ?auto_134393 ) ) ( not ( = ?auto_134395 ?auto_134393 ) ) ( ON ?auto_134394 ?auto_134395 ) ( ON ?auto_134392 ?auto_134394 ) ( ON-TABLE ?auto_134393 ) ( ON ?auto_134391 ?auto_134392 ) ( CLEAR ?auto_134389 ) ( ON ?auto_134390 ?auto_134391 ) ( CLEAR ?auto_134390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134393 ?auto_134395 ?auto_134394 ?auto_134392 ?auto_134391 )
      ( MAKE-6PILE ?auto_134387 ?auto_134388 ?auto_134389 ?auto_134390 ?auto_134391 ?auto_134392 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134396 - BLOCK
      ?auto_134397 - BLOCK
      ?auto_134398 - BLOCK
      ?auto_134399 - BLOCK
      ?auto_134400 - BLOCK
      ?auto_134401 - BLOCK
    )
    :vars
    (
      ?auto_134402 - BLOCK
      ?auto_134403 - BLOCK
      ?auto_134404 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134396 ) ( ON ?auto_134397 ?auto_134396 ) ( not ( = ?auto_134396 ?auto_134397 ) ) ( not ( = ?auto_134396 ?auto_134398 ) ) ( not ( = ?auto_134396 ?auto_134399 ) ) ( not ( = ?auto_134396 ?auto_134400 ) ) ( not ( = ?auto_134396 ?auto_134401 ) ) ( not ( = ?auto_134396 ?auto_134402 ) ) ( not ( = ?auto_134397 ?auto_134398 ) ) ( not ( = ?auto_134397 ?auto_134399 ) ) ( not ( = ?auto_134397 ?auto_134400 ) ) ( not ( = ?auto_134397 ?auto_134401 ) ) ( not ( = ?auto_134397 ?auto_134402 ) ) ( not ( = ?auto_134398 ?auto_134399 ) ) ( not ( = ?auto_134398 ?auto_134400 ) ) ( not ( = ?auto_134398 ?auto_134401 ) ) ( not ( = ?auto_134398 ?auto_134402 ) ) ( not ( = ?auto_134399 ?auto_134400 ) ) ( not ( = ?auto_134399 ?auto_134401 ) ) ( not ( = ?auto_134399 ?auto_134402 ) ) ( not ( = ?auto_134400 ?auto_134401 ) ) ( not ( = ?auto_134400 ?auto_134402 ) ) ( not ( = ?auto_134401 ?auto_134402 ) ) ( not ( = ?auto_134396 ?auto_134403 ) ) ( not ( = ?auto_134397 ?auto_134403 ) ) ( not ( = ?auto_134398 ?auto_134403 ) ) ( not ( = ?auto_134399 ?auto_134403 ) ) ( not ( = ?auto_134400 ?auto_134403 ) ) ( not ( = ?auto_134401 ?auto_134403 ) ) ( not ( = ?auto_134402 ?auto_134403 ) ) ( ON ?auto_134403 ?auto_134404 ) ( not ( = ?auto_134396 ?auto_134404 ) ) ( not ( = ?auto_134397 ?auto_134404 ) ) ( not ( = ?auto_134398 ?auto_134404 ) ) ( not ( = ?auto_134399 ?auto_134404 ) ) ( not ( = ?auto_134400 ?auto_134404 ) ) ( not ( = ?auto_134401 ?auto_134404 ) ) ( not ( = ?auto_134402 ?auto_134404 ) ) ( not ( = ?auto_134403 ?auto_134404 ) ) ( ON ?auto_134402 ?auto_134403 ) ( ON ?auto_134401 ?auto_134402 ) ( ON-TABLE ?auto_134404 ) ( ON ?auto_134400 ?auto_134401 ) ( ON ?auto_134399 ?auto_134400 ) ( CLEAR ?auto_134399 ) ( HOLDING ?auto_134398 ) ( CLEAR ?auto_134397 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134396 ?auto_134397 ?auto_134398 )
      ( MAKE-6PILE ?auto_134396 ?auto_134397 ?auto_134398 ?auto_134399 ?auto_134400 ?auto_134401 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134405 - BLOCK
      ?auto_134406 - BLOCK
      ?auto_134407 - BLOCK
      ?auto_134408 - BLOCK
      ?auto_134409 - BLOCK
      ?auto_134410 - BLOCK
    )
    :vars
    (
      ?auto_134413 - BLOCK
      ?auto_134412 - BLOCK
      ?auto_134411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134405 ) ( ON ?auto_134406 ?auto_134405 ) ( not ( = ?auto_134405 ?auto_134406 ) ) ( not ( = ?auto_134405 ?auto_134407 ) ) ( not ( = ?auto_134405 ?auto_134408 ) ) ( not ( = ?auto_134405 ?auto_134409 ) ) ( not ( = ?auto_134405 ?auto_134410 ) ) ( not ( = ?auto_134405 ?auto_134413 ) ) ( not ( = ?auto_134406 ?auto_134407 ) ) ( not ( = ?auto_134406 ?auto_134408 ) ) ( not ( = ?auto_134406 ?auto_134409 ) ) ( not ( = ?auto_134406 ?auto_134410 ) ) ( not ( = ?auto_134406 ?auto_134413 ) ) ( not ( = ?auto_134407 ?auto_134408 ) ) ( not ( = ?auto_134407 ?auto_134409 ) ) ( not ( = ?auto_134407 ?auto_134410 ) ) ( not ( = ?auto_134407 ?auto_134413 ) ) ( not ( = ?auto_134408 ?auto_134409 ) ) ( not ( = ?auto_134408 ?auto_134410 ) ) ( not ( = ?auto_134408 ?auto_134413 ) ) ( not ( = ?auto_134409 ?auto_134410 ) ) ( not ( = ?auto_134409 ?auto_134413 ) ) ( not ( = ?auto_134410 ?auto_134413 ) ) ( not ( = ?auto_134405 ?auto_134412 ) ) ( not ( = ?auto_134406 ?auto_134412 ) ) ( not ( = ?auto_134407 ?auto_134412 ) ) ( not ( = ?auto_134408 ?auto_134412 ) ) ( not ( = ?auto_134409 ?auto_134412 ) ) ( not ( = ?auto_134410 ?auto_134412 ) ) ( not ( = ?auto_134413 ?auto_134412 ) ) ( ON ?auto_134412 ?auto_134411 ) ( not ( = ?auto_134405 ?auto_134411 ) ) ( not ( = ?auto_134406 ?auto_134411 ) ) ( not ( = ?auto_134407 ?auto_134411 ) ) ( not ( = ?auto_134408 ?auto_134411 ) ) ( not ( = ?auto_134409 ?auto_134411 ) ) ( not ( = ?auto_134410 ?auto_134411 ) ) ( not ( = ?auto_134413 ?auto_134411 ) ) ( not ( = ?auto_134412 ?auto_134411 ) ) ( ON ?auto_134413 ?auto_134412 ) ( ON ?auto_134410 ?auto_134413 ) ( ON-TABLE ?auto_134411 ) ( ON ?auto_134409 ?auto_134410 ) ( ON ?auto_134408 ?auto_134409 ) ( CLEAR ?auto_134406 ) ( ON ?auto_134407 ?auto_134408 ) ( CLEAR ?auto_134407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134411 ?auto_134412 ?auto_134413 ?auto_134410 ?auto_134409 ?auto_134408 )
      ( MAKE-6PILE ?auto_134405 ?auto_134406 ?auto_134407 ?auto_134408 ?auto_134409 ?auto_134410 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134414 - BLOCK
      ?auto_134415 - BLOCK
      ?auto_134416 - BLOCK
      ?auto_134417 - BLOCK
      ?auto_134418 - BLOCK
      ?auto_134419 - BLOCK
    )
    :vars
    (
      ?auto_134421 - BLOCK
      ?auto_134422 - BLOCK
      ?auto_134420 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134414 ) ( not ( = ?auto_134414 ?auto_134415 ) ) ( not ( = ?auto_134414 ?auto_134416 ) ) ( not ( = ?auto_134414 ?auto_134417 ) ) ( not ( = ?auto_134414 ?auto_134418 ) ) ( not ( = ?auto_134414 ?auto_134419 ) ) ( not ( = ?auto_134414 ?auto_134421 ) ) ( not ( = ?auto_134415 ?auto_134416 ) ) ( not ( = ?auto_134415 ?auto_134417 ) ) ( not ( = ?auto_134415 ?auto_134418 ) ) ( not ( = ?auto_134415 ?auto_134419 ) ) ( not ( = ?auto_134415 ?auto_134421 ) ) ( not ( = ?auto_134416 ?auto_134417 ) ) ( not ( = ?auto_134416 ?auto_134418 ) ) ( not ( = ?auto_134416 ?auto_134419 ) ) ( not ( = ?auto_134416 ?auto_134421 ) ) ( not ( = ?auto_134417 ?auto_134418 ) ) ( not ( = ?auto_134417 ?auto_134419 ) ) ( not ( = ?auto_134417 ?auto_134421 ) ) ( not ( = ?auto_134418 ?auto_134419 ) ) ( not ( = ?auto_134418 ?auto_134421 ) ) ( not ( = ?auto_134419 ?auto_134421 ) ) ( not ( = ?auto_134414 ?auto_134422 ) ) ( not ( = ?auto_134415 ?auto_134422 ) ) ( not ( = ?auto_134416 ?auto_134422 ) ) ( not ( = ?auto_134417 ?auto_134422 ) ) ( not ( = ?auto_134418 ?auto_134422 ) ) ( not ( = ?auto_134419 ?auto_134422 ) ) ( not ( = ?auto_134421 ?auto_134422 ) ) ( ON ?auto_134422 ?auto_134420 ) ( not ( = ?auto_134414 ?auto_134420 ) ) ( not ( = ?auto_134415 ?auto_134420 ) ) ( not ( = ?auto_134416 ?auto_134420 ) ) ( not ( = ?auto_134417 ?auto_134420 ) ) ( not ( = ?auto_134418 ?auto_134420 ) ) ( not ( = ?auto_134419 ?auto_134420 ) ) ( not ( = ?auto_134421 ?auto_134420 ) ) ( not ( = ?auto_134422 ?auto_134420 ) ) ( ON ?auto_134421 ?auto_134422 ) ( ON ?auto_134419 ?auto_134421 ) ( ON-TABLE ?auto_134420 ) ( ON ?auto_134418 ?auto_134419 ) ( ON ?auto_134417 ?auto_134418 ) ( ON ?auto_134416 ?auto_134417 ) ( CLEAR ?auto_134416 ) ( HOLDING ?auto_134415 ) ( CLEAR ?auto_134414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134414 ?auto_134415 )
      ( MAKE-6PILE ?auto_134414 ?auto_134415 ?auto_134416 ?auto_134417 ?auto_134418 ?auto_134419 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134423 - BLOCK
      ?auto_134424 - BLOCK
      ?auto_134425 - BLOCK
      ?auto_134426 - BLOCK
      ?auto_134427 - BLOCK
      ?auto_134428 - BLOCK
    )
    :vars
    (
      ?auto_134430 - BLOCK
      ?auto_134429 - BLOCK
      ?auto_134431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134423 ) ( not ( = ?auto_134423 ?auto_134424 ) ) ( not ( = ?auto_134423 ?auto_134425 ) ) ( not ( = ?auto_134423 ?auto_134426 ) ) ( not ( = ?auto_134423 ?auto_134427 ) ) ( not ( = ?auto_134423 ?auto_134428 ) ) ( not ( = ?auto_134423 ?auto_134430 ) ) ( not ( = ?auto_134424 ?auto_134425 ) ) ( not ( = ?auto_134424 ?auto_134426 ) ) ( not ( = ?auto_134424 ?auto_134427 ) ) ( not ( = ?auto_134424 ?auto_134428 ) ) ( not ( = ?auto_134424 ?auto_134430 ) ) ( not ( = ?auto_134425 ?auto_134426 ) ) ( not ( = ?auto_134425 ?auto_134427 ) ) ( not ( = ?auto_134425 ?auto_134428 ) ) ( not ( = ?auto_134425 ?auto_134430 ) ) ( not ( = ?auto_134426 ?auto_134427 ) ) ( not ( = ?auto_134426 ?auto_134428 ) ) ( not ( = ?auto_134426 ?auto_134430 ) ) ( not ( = ?auto_134427 ?auto_134428 ) ) ( not ( = ?auto_134427 ?auto_134430 ) ) ( not ( = ?auto_134428 ?auto_134430 ) ) ( not ( = ?auto_134423 ?auto_134429 ) ) ( not ( = ?auto_134424 ?auto_134429 ) ) ( not ( = ?auto_134425 ?auto_134429 ) ) ( not ( = ?auto_134426 ?auto_134429 ) ) ( not ( = ?auto_134427 ?auto_134429 ) ) ( not ( = ?auto_134428 ?auto_134429 ) ) ( not ( = ?auto_134430 ?auto_134429 ) ) ( ON ?auto_134429 ?auto_134431 ) ( not ( = ?auto_134423 ?auto_134431 ) ) ( not ( = ?auto_134424 ?auto_134431 ) ) ( not ( = ?auto_134425 ?auto_134431 ) ) ( not ( = ?auto_134426 ?auto_134431 ) ) ( not ( = ?auto_134427 ?auto_134431 ) ) ( not ( = ?auto_134428 ?auto_134431 ) ) ( not ( = ?auto_134430 ?auto_134431 ) ) ( not ( = ?auto_134429 ?auto_134431 ) ) ( ON ?auto_134430 ?auto_134429 ) ( ON ?auto_134428 ?auto_134430 ) ( ON-TABLE ?auto_134431 ) ( ON ?auto_134427 ?auto_134428 ) ( ON ?auto_134426 ?auto_134427 ) ( ON ?auto_134425 ?auto_134426 ) ( CLEAR ?auto_134423 ) ( ON ?auto_134424 ?auto_134425 ) ( CLEAR ?auto_134424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134431 ?auto_134429 ?auto_134430 ?auto_134428 ?auto_134427 ?auto_134426 ?auto_134425 )
      ( MAKE-6PILE ?auto_134423 ?auto_134424 ?auto_134425 ?auto_134426 ?auto_134427 ?auto_134428 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134432 - BLOCK
      ?auto_134433 - BLOCK
      ?auto_134434 - BLOCK
      ?auto_134435 - BLOCK
      ?auto_134436 - BLOCK
      ?auto_134437 - BLOCK
    )
    :vars
    (
      ?auto_134438 - BLOCK
      ?auto_134440 - BLOCK
      ?auto_134439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134432 ?auto_134433 ) ) ( not ( = ?auto_134432 ?auto_134434 ) ) ( not ( = ?auto_134432 ?auto_134435 ) ) ( not ( = ?auto_134432 ?auto_134436 ) ) ( not ( = ?auto_134432 ?auto_134437 ) ) ( not ( = ?auto_134432 ?auto_134438 ) ) ( not ( = ?auto_134433 ?auto_134434 ) ) ( not ( = ?auto_134433 ?auto_134435 ) ) ( not ( = ?auto_134433 ?auto_134436 ) ) ( not ( = ?auto_134433 ?auto_134437 ) ) ( not ( = ?auto_134433 ?auto_134438 ) ) ( not ( = ?auto_134434 ?auto_134435 ) ) ( not ( = ?auto_134434 ?auto_134436 ) ) ( not ( = ?auto_134434 ?auto_134437 ) ) ( not ( = ?auto_134434 ?auto_134438 ) ) ( not ( = ?auto_134435 ?auto_134436 ) ) ( not ( = ?auto_134435 ?auto_134437 ) ) ( not ( = ?auto_134435 ?auto_134438 ) ) ( not ( = ?auto_134436 ?auto_134437 ) ) ( not ( = ?auto_134436 ?auto_134438 ) ) ( not ( = ?auto_134437 ?auto_134438 ) ) ( not ( = ?auto_134432 ?auto_134440 ) ) ( not ( = ?auto_134433 ?auto_134440 ) ) ( not ( = ?auto_134434 ?auto_134440 ) ) ( not ( = ?auto_134435 ?auto_134440 ) ) ( not ( = ?auto_134436 ?auto_134440 ) ) ( not ( = ?auto_134437 ?auto_134440 ) ) ( not ( = ?auto_134438 ?auto_134440 ) ) ( ON ?auto_134440 ?auto_134439 ) ( not ( = ?auto_134432 ?auto_134439 ) ) ( not ( = ?auto_134433 ?auto_134439 ) ) ( not ( = ?auto_134434 ?auto_134439 ) ) ( not ( = ?auto_134435 ?auto_134439 ) ) ( not ( = ?auto_134436 ?auto_134439 ) ) ( not ( = ?auto_134437 ?auto_134439 ) ) ( not ( = ?auto_134438 ?auto_134439 ) ) ( not ( = ?auto_134440 ?auto_134439 ) ) ( ON ?auto_134438 ?auto_134440 ) ( ON ?auto_134437 ?auto_134438 ) ( ON-TABLE ?auto_134439 ) ( ON ?auto_134436 ?auto_134437 ) ( ON ?auto_134435 ?auto_134436 ) ( ON ?auto_134434 ?auto_134435 ) ( ON ?auto_134433 ?auto_134434 ) ( CLEAR ?auto_134433 ) ( HOLDING ?auto_134432 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134432 )
      ( MAKE-6PILE ?auto_134432 ?auto_134433 ?auto_134434 ?auto_134435 ?auto_134436 ?auto_134437 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_134441 - BLOCK
      ?auto_134442 - BLOCK
      ?auto_134443 - BLOCK
      ?auto_134444 - BLOCK
      ?auto_134445 - BLOCK
      ?auto_134446 - BLOCK
    )
    :vars
    (
      ?auto_134448 - BLOCK
      ?auto_134447 - BLOCK
      ?auto_134449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134441 ?auto_134442 ) ) ( not ( = ?auto_134441 ?auto_134443 ) ) ( not ( = ?auto_134441 ?auto_134444 ) ) ( not ( = ?auto_134441 ?auto_134445 ) ) ( not ( = ?auto_134441 ?auto_134446 ) ) ( not ( = ?auto_134441 ?auto_134448 ) ) ( not ( = ?auto_134442 ?auto_134443 ) ) ( not ( = ?auto_134442 ?auto_134444 ) ) ( not ( = ?auto_134442 ?auto_134445 ) ) ( not ( = ?auto_134442 ?auto_134446 ) ) ( not ( = ?auto_134442 ?auto_134448 ) ) ( not ( = ?auto_134443 ?auto_134444 ) ) ( not ( = ?auto_134443 ?auto_134445 ) ) ( not ( = ?auto_134443 ?auto_134446 ) ) ( not ( = ?auto_134443 ?auto_134448 ) ) ( not ( = ?auto_134444 ?auto_134445 ) ) ( not ( = ?auto_134444 ?auto_134446 ) ) ( not ( = ?auto_134444 ?auto_134448 ) ) ( not ( = ?auto_134445 ?auto_134446 ) ) ( not ( = ?auto_134445 ?auto_134448 ) ) ( not ( = ?auto_134446 ?auto_134448 ) ) ( not ( = ?auto_134441 ?auto_134447 ) ) ( not ( = ?auto_134442 ?auto_134447 ) ) ( not ( = ?auto_134443 ?auto_134447 ) ) ( not ( = ?auto_134444 ?auto_134447 ) ) ( not ( = ?auto_134445 ?auto_134447 ) ) ( not ( = ?auto_134446 ?auto_134447 ) ) ( not ( = ?auto_134448 ?auto_134447 ) ) ( ON ?auto_134447 ?auto_134449 ) ( not ( = ?auto_134441 ?auto_134449 ) ) ( not ( = ?auto_134442 ?auto_134449 ) ) ( not ( = ?auto_134443 ?auto_134449 ) ) ( not ( = ?auto_134444 ?auto_134449 ) ) ( not ( = ?auto_134445 ?auto_134449 ) ) ( not ( = ?auto_134446 ?auto_134449 ) ) ( not ( = ?auto_134448 ?auto_134449 ) ) ( not ( = ?auto_134447 ?auto_134449 ) ) ( ON ?auto_134448 ?auto_134447 ) ( ON ?auto_134446 ?auto_134448 ) ( ON-TABLE ?auto_134449 ) ( ON ?auto_134445 ?auto_134446 ) ( ON ?auto_134444 ?auto_134445 ) ( ON ?auto_134443 ?auto_134444 ) ( ON ?auto_134442 ?auto_134443 ) ( ON ?auto_134441 ?auto_134442 ) ( CLEAR ?auto_134441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134449 ?auto_134447 ?auto_134448 ?auto_134446 ?auto_134445 ?auto_134444 ?auto_134443 ?auto_134442 )
      ( MAKE-6PILE ?auto_134441 ?auto_134442 ?auto_134443 ?auto_134444 ?auto_134445 ?auto_134446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134452 - BLOCK
      ?auto_134453 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_134453 ) ( CLEAR ?auto_134452 ) ( ON-TABLE ?auto_134452 ) ( not ( = ?auto_134452 ?auto_134453 ) ) )
    :subtasks
    ( ( !STACK ?auto_134453 ?auto_134452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134454 - BLOCK
      ?auto_134455 - BLOCK
    )
    :vars
    (
      ?auto_134456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134454 ) ( ON-TABLE ?auto_134454 ) ( not ( = ?auto_134454 ?auto_134455 ) ) ( ON ?auto_134455 ?auto_134456 ) ( CLEAR ?auto_134455 ) ( HAND-EMPTY ) ( not ( = ?auto_134454 ?auto_134456 ) ) ( not ( = ?auto_134455 ?auto_134456 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134455 ?auto_134456 )
      ( MAKE-2PILE ?auto_134454 ?auto_134455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134457 - BLOCK
      ?auto_134458 - BLOCK
    )
    :vars
    (
      ?auto_134459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134457 ?auto_134458 ) ) ( ON ?auto_134458 ?auto_134459 ) ( CLEAR ?auto_134458 ) ( not ( = ?auto_134457 ?auto_134459 ) ) ( not ( = ?auto_134458 ?auto_134459 ) ) ( HOLDING ?auto_134457 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134457 )
      ( MAKE-2PILE ?auto_134457 ?auto_134458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134460 - BLOCK
      ?auto_134461 - BLOCK
    )
    :vars
    (
      ?auto_134462 - BLOCK
      ?auto_134465 - BLOCK
      ?auto_134466 - BLOCK
      ?auto_134464 - BLOCK
      ?auto_134463 - BLOCK
      ?auto_134467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134460 ?auto_134461 ) ) ( ON ?auto_134461 ?auto_134462 ) ( not ( = ?auto_134460 ?auto_134462 ) ) ( not ( = ?auto_134461 ?auto_134462 ) ) ( ON ?auto_134460 ?auto_134461 ) ( CLEAR ?auto_134460 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134465 ) ( ON ?auto_134466 ?auto_134465 ) ( ON ?auto_134464 ?auto_134466 ) ( ON ?auto_134463 ?auto_134464 ) ( ON ?auto_134467 ?auto_134463 ) ( ON ?auto_134462 ?auto_134467 ) ( not ( = ?auto_134465 ?auto_134466 ) ) ( not ( = ?auto_134465 ?auto_134464 ) ) ( not ( = ?auto_134465 ?auto_134463 ) ) ( not ( = ?auto_134465 ?auto_134467 ) ) ( not ( = ?auto_134465 ?auto_134462 ) ) ( not ( = ?auto_134465 ?auto_134461 ) ) ( not ( = ?auto_134465 ?auto_134460 ) ) ( not ( = ?auto_134466 ?auto_134464 ) ) ( not ( = ?auto_134466 ?auto_134463 ) ) ( not ( = ?auto_134466 ?auto_134467 ) ) ( not ( = ?auto_134466 ?auto_134462 ) ) ( not ( = ?auto_134466 ?auto_134461 ) ) ( not ( = ?auto_134466 ?auto_134460 ) ) ( not ( = ?auto_134464 ?auto_134463 ) ) ( not ( = ?auto_134464 ?auto_134467 ) ) ( not ( = ?auto_134464 ?auto_134462 ) ) ( not ( = ?auto_134464 ?auto_134461 ) ) ( not ( = ?auto_134464 ?auto_134460 ) ) ( not ( = ?auto_134463 ?auto_134467 ) ) ( not ( = ?auto_134463 ?auto_134462 ) ) ( not ( = ?auto_134463 ?auto_134461 ) ) ( not ( = ?auto_134463 ?auto_134460 ) ) ( not ( = ?auto_134467 ?auto_134462 ) ) ( not ( = ?auto_134467 ?auto_134461 ) ) ( not ( = ?auto_134467 ?auto_134460 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134465 ?auto_134466 ?auto_134464 ?auto_134463 ?auto_134467 ?auto_134462 ?auto_134461 )
      ( MAKE-2PILE ?auto_134460 ?auto_134461 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134468 - BLOCK
      ?auto_134469 - BLOCK
    )
    :vars
    (
      ?auto_134473 - BLOCK
      ?auto_134474 - BLOCK
      ?auto_134471 - BLOCK
      ?auto_134470 - BLOCK
      ?auto_134472 - BLOCK
      ?auto_134475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134468 ?auto_134469 ) ) ( ON ?auto_134469 ?auto_134473 ) ( not ( = ?auto_134468 ?auto_134473 ) ) ( not ( = ?auto_134469 ?auto_134473 ) ) ( ON-TABLE ?auto_134474 ) ( ON ?auto_134471 ?auto_134474 ) ( ON ?auto_134470 ?auto_134471 ) ( ON ?auto_134472 ?auto_134470 ) ( ON ?auto_134475 ?auto_134472 ) ( ON ?auto_134473 ?auto_134475 ) ( not ( = ?auto_134474 ?auto_134471 ) ) ( not ( = ?auto_134474 ?auto_134470 ) ) ( not ( = ?auto_134474 ?auto_134472 ) ) ( not ( = ?auto_134474 ?auto_134475 ) ) ( not ( = ?auto_134474 ?auto_134473 ) ) ( not ( = ?auto_134474 ?auto_134469 ) ) ( not ( = ?auto_134474 ?auto_134468 ) ) ( not ( = ?auto_134471 ?auto_134470 ) ) ( not ( = ?auto_134471 ?auto_134472 ) ) ( not ( = ?auto_134471 ?auto_134475 ) ) ( not ( = ?auto_134471 ?auto_134473 ) ) ( not ( = ?auto_134471 ?auto_134469 ) ) ( not ( = ?auto_134471 ?auto_134468 ) ) ( not ( = ?auto_134470 ?auto_134472 ) ) ( not ( = ?auto_134470 ?auto_134475 ) ) ( not ( = ?auto_134470 ?auto_134473 ) ) ( not ( = ?auto_134470 ?auto_134469 ) ) ( not ( = ?auto_134470 ?auto_134468 ) ) ( not ( = ?auto_134472 ?auto_134475 ) ) ( not ( = ?auto_134472 ?auto_134473 ) ) ( not ( = ?auto_134472 ?auto_134469 ) ) ( not ( = ?auto_134472 ?auto_134468 ) ) ( not ( = ?auto_134475 ?auto_134473 ) ) ( not ( = ?auto_134475 ?auto_134469 ) ) ( not ( = ?auto_134475 ?auto_134468 ) ) ( HOLDING ?auto_134468 ) ( CLEAR ?auto_134469 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134474 ?auto_134471 ?auto_134470 ?auto_134472 ?auto_134475 ?auto_134473 ?auto_134469 ?auto_134468 )
      ( MAKE-2PILE ?auto_134468 ?auto_134469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134476 - BLOCK
      ?auto_134477 - BLOCK
    )
    :vars
    (
      ?auto_134478 - BLOCK
      ?auto_134480 - BLOCK
      ?auto_134481 - BLOCK
      ?auto_134483 - BLOCK
      ?auto_134479 - BLOCK
      ?auto_134482 - BLOCK
      ?auto_134484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134476 ?auto_134477 ) ) ( ON ?auto_134477 ?auto_134478 ) ( not ( = ?auto_134476 ?auto_134478 ) ) ( not ( = ?auto_134477 ?auto_134478 ) ) ( ON-TABLE ?auto_134480 ) ( ON ?auto_134481 ?auto_134480 ) ( ON ?auto_134483 ?auto_134481 ) ( ON ?auto_134479 ?auto_134483 ) ( ON ?auto_134482 ?auto_134479 ) ( ON ?auto_134478 ?auto_134482 ) ( not ( = ?auto_134480 ?auto_134481 ) ) ( not ( = ?auto_134480 ?auto_134483 ) ) ( not ( = ?auto_134480 ?auto_134479 ) ) ( not ( = ?auto_134480 ?auto_134482 ) ) ( not ( = ?auto_134480 ?auto_134478 ) ) ( not ( = ?auto_134480 ?auto_134477 ) ) ( not ( = ?auto_134480 ?auto_134476 ) ) ( not ( = ?auto_134481 ?auto_134483 ) ) ( not ( = ?auto_134481 ?auto_134479 ) ) ( not ( = ?auto_134481 ?auto_134482 ) ) ( not ( = ?auto_134481 ?auto_134478 ) ) ( not ( = ?auto_134481 ?auto_134477 ) ) ( not ( = ?auto_134481 ?auto_134476 ) ) ( not ( = ?auto_134483 ?auto_134479 ) ) ( not ( = ?auto_134483 ?auto_134482 ) ) ( not ( = ?auto_134483 ?auto_134478 ) ) ( not ( = ?auto_134483 ?auto_134477 ) ) ( not ( = ?auto_134483 ?auto_134476 ) ) ( not ( = ?auto_134479 ?auto_134482 ) ) ( not ( = ?auto_134479 ?auto_134478 ) ) ( not ( = ?auto_134479 ?auto_134477 ) ) ( not ( = ?auto_134479 ?auto_134476 ) ) ( not ( = ?auto_134482 ?auto_134478 ) ) ( not ( = ?auto_134482 ?auto_134477 ) ) ( not ( = ?auto_134482 ?auto_134476 ) ) ( CLEAR ?auto_134477 ) ( ON ?auto_134476 ?auto_134484 ) ( CLEAR ?auto_134476 ) ( HAND-EMPTY ) ( not ( = ?auto_134476 ?auto_134484 ) ) ( not ( = ?auto_134477 ?auto_134484 ) ) ( not ( = ?auto_134478 ?auto_134484 ) ) ( not ( = ?auto_134480 ?auto_134484 ) ) ( not ( = ?auto_134481 ?auto_134484 ) ) ( not ( = ?auto_134483 ?auto_134484 ) ) ( not ( = ?auto_134479 ?auto_134484 ) ) ( not ( = ?auto_134482 ?auto_134484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134476 ?auto_134484 )
      ( MAKE-2PILE ?auto_134476 ?auto_134477 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134485 - BLOCK
      ?auto_134486 - BLOCK
    )
    :vars
    (
      ?auto_134491 - BLOCK
      ?auto_134487 - BLOCK
      ?auto_134488 - BLOCK
      ?auto_134489 - BLOCK
      ?auto_134490 - BLOCK
      ?auto_134493 - BLOCK
      ?auto_134492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134485 ?auto_134486 ) ) ( not ( = ?auto_134485 ?auto_134491 ) ) ( not ( = ?auto_134486 ?auto_134491 ) ) ( ON-TABLE ?auto_134487 ) ( ON ?auto_134488 ?auto_134487 ) ( ON ?auto_134489 ?auto_134488 ) ( ON ?auto_134490 ?auto_134489 ) ( ON ?auto_134493 ?auto_134490 ) ( ON ?auto_134491 ?auto_134493 ) ( not ( = ?auto_134487 ?auto_134488 ) ) ( not ( = ?auto_134487 ?auto_134489 ) ) ( not ( = ?auto_134487 ?auto_134490 ) ) ( not ( = ?auto_134487 ?auto_134493 ) ) ( not ( = ?auto_134487 ?auto_134491 ) ) ( not ( = ?auto_134487 ?auto_134486 ) ) ( not ( = ?auto_134487 ?auto_134485 ) ) ( not ( = ?auto_134488 ?auto_134489 ) ) ( not ( = ?auto_134488 ?auto_134490 ) ) ( not ( = ?auto_134488 ?auto_134493 ) ) ( not ( = ?auto_134488 ?auto_134491 ) ) ( not ( = ?auto_134488 ?auto_134486 ) ) ( not ( = ?auto_134488 ?auto_134485 ) ) ( not ( = ?auto_134489 ?auto_134490 ) ) ( not ( = ?auto_134489 ?auto_134493 ) ) ( not ( = ?auto_134489 ?auto_134491 ) ) ( not ( = ?auto_134489 ?auto_134486 ) ) ( not ( = ?auto_134489 ?auto_134485 ) ) ( not ( = ?auto_134490 ?auto_134493 ) ) ( not ( = ?auto_134490 ?auto_134491 ) ) ( not ( = ?auto_134490 ?auto_134486 ) ) ( not ( = ?auto_134490 ?auto_134485 ) ) ( not ( = ?auto_134493 ?auto_134491 ) ) ( not ( = ?auto_134493 ?auto_134486 ) ) ( not ( = ?auto_134493 ?auto_134485 ) ) ( ON ?auto_134485 ?auto_134492 ) ( CLEAR ?auto_134485 ) ( not ( = ?auto_134485 ?auto_134492 ) ) ( not ( = ?auto_134486 ?auto_134492 ) ) ( not ( = ?auto_134491 ?auto_134492 ) ) ( not ( = ?auto_134487 ?auto_134492 ) ) ( not ( = ?auto_134488 ?auto_134492 ) ) ( not ( = ?auto_134489 ?auto_134492 ) ) ( not ( = ?auto_134490 ?auto_134492 ) ) ( not ( = ?auto_134493 ?auto_134492 ) ) ( HOLDING ?auto_134486 ) ( CLEAR ?auto_134491 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134487 ?auto_134488 ?auto_134489 ?auto_134490 ?auto_134493 ?auto_134491 ?auto_134486 )
      ( MAKE-2PILE ?auto_134485 ?auto_134486 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134494 - BLOCK
      ?auto_134495 - BLOCK
    )
    :vars
    (
      ?auto_134498 - BLOCK
      ?auto_134496 - BLOCK
      ?auto_134499 - BLOCK
      ?auto_134497 - BLOCK
      ?auto_134502 - BLOCK
      ?auto_134500 - BLOCK
      ?auto_134501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134494 ?auto_134495 ) ) ( not ( = ?auto_134494 ?auto_134498 ) ) ( not ( = ?auto_134495 ?auto_134498 ) ) ( ON-TABLE ?auto_134496 ) ( ON ?auto_134499 ?auto_134496 ) ( ON ?auto_134497 ?auto_134499 ) ( ON ?auto_134502 ?auto_134497 ) ( ON ?auto_134500 ?auto_134502 ) ( ON ?auto_134498 ?auto_134500 ) ( not ( = ?auto_134496 ?auto_134499 ) ) ( not ( = ?auto_134496 ?auto_134497 ) ) ( not ( = ?auto_134496 ?auto_134502 ) ) ( not ( = ?auto_134496 ?auto_134500 ) ) ( not ( = ?auto_134496 ?auto_134498 ) ) ( not ( = ?auto_134496 ?auto_134495 ) ) ( not ( = ?auto_134496 ?auto_134494 ) ) ( not ( = ?auto_134499 ?auto_134497 ) ) ( not ( = ?auto_134499 ?auto_134502 ) ) ( not ( = ?auto_134499 ?auto_134500 ) ) ( not ( = ?auto_134499 ?auto_134498 ) ) ( not ( = ?auto_134499 ?auto_134495 ) ) ( not ( = ?auto_134499 ?auto_134494 ) ) ( not ( = ?auto_134497 ?auto_134502 ) ) ( not ( = ?auto_134497 ?auto_134500 ) ) ( not ( = ?auto_134497 ?auto_134498 ) ) ( not ( = ?auto_134497 ?auto_134495 ) ) ( not ( = ?auto_134497 ?auto_134494 ) ) ( not ( = ?auto_134502 ?auto_134500 ) ) ( not ( = ?auto_134502 ?auto_134498 ) ) ( not ( = ?auto_134502 ?auto_134495 ) ) ( not ( = ?auto_134502 ?auto_134494 ) ) ( not ( = ?auto_134500 ?auto_134498 ) ) ( not ( = ?auto_134500 ?auto_134495 ) ) ( not ( = ?auto_134500 ?auto_134494 ) ) ( ON ?auto_134494 ?auto_134501 ) ( not ( = ?auto_134494 ?auto_134501 ) ) ( not ( = ?auto_134495 ?auto_134501 ) ) ( not ( = ?auto_134498 ?auto_134501 ) ) ( not ( = ?auto_134496 ?auto_134501 ) ) ( not ( = ?auto_134499 ?auto_134501 ) ) ( not ( = ?auto_134497 ?auto_134501 ) ) ( not ( = ?auto_134502 ?auto_134501 ) ) ( not ( = ?auto_134500 ?auto_134501 ) ) ( CLEAR ?auto_134498 ) ( ON ?auto_134495 ?auto_134494 ) ( CLEAR ?auto_134495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134501 ?auto_134494 )
      ( MAKE-2PILE ?auto_134494 ?auto_134495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134503 - BLOCK
      ?auto_134504 - BLOCK
    )
    :vars
    (
      ?auto_134511 - BLOCK
      ?auto_134506 - BLOCK
      ?auto_134510 - BLOCK
      ?auto_134508 - BLOCK
      ?auto_134509 - BLOCK
      ?auto_134505 - BLOCK
      ?auto_134507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134503 ?auto_134504 ) ) ( not ( = ?auto_134503 ?auto_134511 ) ) ( not ( = ?auto_134504 ?auto_134511 ) ) ( ON-TABLE ?auto_134506 ) ( ON ?auto_134510 ?auto_134506 ) ( ON ?auto_134508 ?auto_134510 ) ( ON ?auto_134509 ?auto_134508 ) ( ON ?auto_134505 ?auto_134509 ) ( not ( = ?auto_134506 ?auto_134510 ) ) ( not ( = ?auto_134506 ?auto_134508 ) ) ( not ( = ?auto_134506 ?auto_134509 ) ) ( not ( = ?auto_134506 ?auto_134505 ) ) ( not ( = ?auto_134506 ?auto_134511 ) ) ( not ( = ?auto_134506 ?auto_134504 ) ) ( not ( = ?auto_134506 ?auto_134503 ) ) ( not ( = ?auto_134510 ?auto_134508 ) ) ( not ( = ?auto_134510 ?auto_134509 ) ) ( not ( = ?auto_134510 ?auto_134505 ) ) ( not ( = ?auto_134510 ?auto_134511 ) ) ( not ( = ?auto_134510 ?auto_134504 ) ) ( not ( = ?auto_134510 ?auto_134503 ) ) ( not ( = ?auto_134508 ?auto_134509 ) ) ( not ( = ?auto_134508 ?auto_134505 ) ) ( not ( = ?auto_134508 ?auto_134511 ) ) ( not ( = ?auto_134508 ?auto_134504 ) ) ( not ( = ?auto_134508 ?auto_134503 ) ) ( not ( = ?auto_134509 ?auto_134505 ) ) ( not ( = ?auto_134509 ?auto_134511 ) ) ( not ( = ?auto_134509 ?auto_134504 ) ) ( not ( = ?auto_134509 ?auto_134503 ) ) ( not ( = ?auto_134505 ?auto_134511 ) ) ( not ( = ?auto_134505 ?auto_134504 ) ) ( not ( = ?auto_134505 ?auto_134503 ) ) ( ON ?auto_134503 ?auto_134507 ) ( not ( = ?auto_134503 ?auto_134507 ) ) ( not ( = ?auto_134504 ?auto_134507 ) ) ( not ( = ?auto_134511 ?auto_134507 ) ) ( not ( = ?auto_134506 ?auto_134507 ) ) ( not ( = ?auto_134510 ?auto_134507 ) ) ( not ( = ?auto_134508 ?auto_134507 ) ) ( not ( = ?auto_134509 ?auto_134507 ) ) ( not ( = ?auto_134505 ?auto_134507 ) ) ( ON ?auto_134504 ?auto_134503 ) ( CLEAR ?auto_134504 ) ( ON-TABLE ?auto_134507 ) ( HOLDING ?auto_134511 ) ( CLEAR ?auto_134505 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134506 ?auto_134510 ?auto_134508 ?auto_134509 ?auto_134505 ?auto_134511 )
      ( MAKE-2PILE ?auto_134503 ?auto_134504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134512 - BLOCK
      ?auto_134513 - BLOCK
    )
    :vars
    (
      ?auto_134515 - BLOCK
      ?auto_134514 - BLOCK
      ?auto_134519 - BLOCK
      ?auto_134518 - BLOCK
      ?auto_134516 - BLOCK
      ?auto_134520 - BLOCK
      ?auto_134517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134512 ?auto_134513 ) ) ( not ( = ?auto_134512 ?auto_134515 ) ) ( not ( = ?auto_134513 ?auto_134515 ) ) ( ON-TABLE ?auto_134514 ) ( ON ?auto_134519 ?auto_134514 ) ( ON ?auto_134518 ?auto_134519 ) ( ON ?auto_134516 ?auto_134518 ) ( ON ?auto_134520 ?auto_134516 ) ( not ( = ?auto_134514 ?auto_134519 ) ) ( not ( = ?auto_134514 ?auto_134518 ) ) ( not ( = ?auto_134514 ?auto_134516 ) ) ( not ( = ?auto_134514 ?auto_134520 ) ) ( not ( = ?auto_134514 ?auto_134515 ) ) ( not ( = ?auto_134514 ?auto_134513 ) ) ( not ( = ?auto_134514 ?auto_134512 ) ) ( not ( = ?auto_134519 ?auto_134518 ) ) ( not ( = ?auto_134519 ?auto_134516 ) ) ( not ( = ?auto_134519 ?auto_134520 ) ) ( not ( = ?auto_134519 ?auto_134515 ) ) ( not ( = ?auto_134519 ?auto_134513 ) ) ( not ( = ?auto_134519 ?auto_134512 ) ) ( not ( = ?auto_134518 ?auto_134516 ) ) ( not ( = ?auto_134518 ?auto_134520 ) ) ( not ( = ?auto_134518 ?auto_134515 ) ) ( not ( = ?auto_134518 ?auto_134513 ) ) ( not ( = ?auto_134518 ?auto_134512 ) ) ( not ( = ?auto_134516 ?auto_134520 ) ) ( not ( = ?auto_134516 ?auto_134515 ) ) ( not ( = ?auto_134516 ?auto_134513 ) ) ( not ( = ?auto_134516 ?auto_134512 ) ) ( not ( = ?auto_134520 ?auto_134515 ) ) ( not ( = ?auto_134520 ?auto_134513 ) ) ( not ( = ?auto_134520 ?auto_134512 ) ) ( ON ?auto_134512 ?auto_134517 ) ( not ( = ?auto_134512 ?auto_134517 ) ) ( not ( = ?auto_134513 ?auto_134517 ) ) ( not ( = ?auto_134515 ?auto_134517 ) ) ( not ( = ?auto_134514 ?auto_134517 ) ) ( not ( = ?auto_134519 ?auto_134517 ) ) ( not ( = ?auto_134518 ?auto_134517 ) ) ( not ( = ?auto_134516 ?auto_134517 ) ) ( not ( = ?auto_134520 ?auto_134517 ) ) ( ON ?auto_134513 ?auto_134512 ) ( ON-TABLE ?auto_134517 ) ( CLEAR ?auto_134520 ) ( ON ?auto_134515 ?auto_134513 ) ( CLEAR ?auto_134515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134517 ?auto_134512 ?auto_134513 )
      ( MAKE-2PILE ?auto_134512 ?auto_134513 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134521 - BLOCK
      ?auto_134522 - BLOCK
    )
    :vars
    (
      ?auto_134529 - BLOCK
      ?auto_134524 - BLOCK
      ?auto_134526 - BLOCK
      ?auto_134523 - BLOCK
      ?auto_134527 - BLOCK
      ?auto_134528 - BLOCK
      ?auto_134525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134521 ?auto_134522 ) ) ( not ( = ?auto_134521 ?auto_134529 ) ) ( not ( = ?auto_134522 ?auto_134529 ) ) ( ON-TABLE ?auto_134524 ) ( ON ?auto_134526 ?auto_134524 ) ( ON ?auto_134523 ?auto_134526 ) ( ON ?auto_134527 ?auto_134523 ) ( not ( = ?auto_134524 ?auto_134526 ) ) ( not ( = ?auto_134524 ?auto_134523 ) ) ( not ( = ?auto_134524 ?auto_134527 ) ) ( not ( = ?auto_134524 ?auto_134528 ) ) ( not ( = ?auto_134524 ?auto_134529 ) ) ( not ( = ?auto_134524 ?auto_134522 ) ) ( not ( = ?auto_134524 ?auto_134521 ) ) ( not ( = ?auto_134526 ?auto_134523 ) ) ( not ( = ?auto_134526 ?auto_134527 ) ) ( not ( = ?auto_134526 ?auto_134528 ) ) ( not ( = ?auto_134526 ?auto_134529 ) ) ( not ( = ?auto_134526 ?auto_134522 ) ) ( not ( = ?auto_134526 ?auto_134521 ) ) ( not ( = ?auto_134523 ?auto_134527 ) ) ( not ( = ?auto_134523 ?auto_134528 ) ) ( not ( = ?auto_134523 ?auto_134529 ) ) ( not ( = ?auto_134523 ?auto_134522 ) ) ( not ( = ?auto_134523 ?auto_134521 ) ) ( not ( = ?auto_134527 ?auto_134528 ) ) ( not ( = ?auto_134527 ?auto_134529 ) ) ( not ( = ?auto_134527 ?auto_134522 ) ) ( not ( = ?auto_134527 ?auto_134521 ) ) ( not ( = ?auto_134528 ?auto_134529 ) ) ( not ( = ?auto_134528 ?auto_134522 ) ) ( not ( = ?auto_134528 ?auto_134521 ) ) ( ON ?auto_134521 ?auto_134525 ) ( not ( = ?auto_134521 ?auto_134525 ) ) ( not ( = ?auto_134522 ?auto_134525 ) ) ( not ( = ?auto_134529 ?auto_134525 ) ) ( not ( = ?auto_134524 ?auto_134525 ) ) ( not ( = ?auto_134526 ?auto_134525 ) ) ( not ( = ?auto_134523 ?auto_134525 ) ) ( not ( = ?auto_134527 ?auto_134525 ) ) ( not ( = ?auto_134528 ?auto_134525 ) ) ( ON ?auto_134522 ?auto_134521 ) ( ON-TABLE ?auto_134525 ) ( ON ?auto_134529 ?auto_134522 ) ( CLEAR ?auto_134529 ) ( HOLDING ?auto_134528 ) ( CLEAR ?auto_134527 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134524 ?auto_134526 ?auto_134523 ?auto_134527 ?auto_134528 )
      ( MAKE-2PILE ?auto_134521 ?auto_134522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134530 - BLOCK
      ?auto_134531 - BLOCK
    )
    :vars
    (
      ?auto_134533 - BLOCK
      ?auto_134534 - BLOCK
      ?auto_134532 - BLOCK
      ?auto_134538 - BLOCK
      ?auto_134537 - BLOCK
      ?auto_134535 - BLOCK
      ?auto_134536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134530 ?auto_134531 ) ) ( not ( = ?auto_134530 ?auto_134533 ) ) ( not ( = ?auto_134531 ?auto_134533 ) ) ( ON-TABLE ?auto_134534 ) ( ON ?auto_134532 ?auto_134534 ) ( ON ?auto_134538 ?auto_134532 ) ( ON ?auto_134537 ?auto_134538 ) ( not ( = ?auto_134534 ?auto_134532 ) ) ( not ( = ?auto_134534 ?auto_134538 ) ) ( not ( = ?auto_134534 ?auto_134537 ) ) ( not ( = ?auto_134534 ?auto_134535 ) ) ( not ( = ?auto_134534 ?auto_134533 ) ) ( not ( = ?auto_134534 ?auto_134531 ) ) ( not ( = ?auto_134534 ?auto_134530 ) ) ( not ( = ?auto_134532 ?auto_134538 ) ) ( not ( = ?auto_134532 ?auto_134537 ) ) ( not ( = ?auto_134532 ?auto_134535 ) ) ( not ( = ?auto_134532 ?auto_134533 ) ) ( not ( = ?auto_134532 ?auto_134531 ) ) ( not ( = ?auto_134532 ?auto_134530 ) ) ( not ( = ?auto_134538 ?auto_134537 ) ) ( not ( = ?auto_134538 ?auto_134535 ) ) ( not ( = ?auto_134538 ?auto_134533 ) ) ( not ( = ?auto_134538 ?auto_134531 ) ) ( not ( = ?auto_134538 ?auto_134530 ) ) ( not ( = ?auto_134537 ?auto_134535 ) ) ( not ( = ?auto_134537 ?auto_134533 ) ) ( not ( = ?auto_134537 ?auto_134531 ) ) ( not ( = ?auto_134537 ?auto_134530 ) ) ( not ( = ?auto_134535 ?auto_134533 ) ) ( not ( = ?auto_134535 ?auto_134531 ) ) ( not ( = ?auto_134535 ?auto_134530 ) ) ( ON ?auto_134530 ?auto_134536 ) ( not ( = ?auto_134530 ?auto_134536 ) ) ( not ( = ?auto_134531 ?auto_134536 ) ) ( not ( = ?auto_134533 ?auto_134536 ) ) ( not ( = ?auto_134534 ?auto_134536 ) ) ( not ( = ?auto_134532 ?auto_134536 ) ) ( not ( = ?auto_134538 ?auto_134536 ) ) ( not ( = ?auto_134537 ?auto_134536 ) ) ( not ( = ?auto_134535 ?auto_134536 ) ) ( ON ?auto_134531 ?auto_134530 ) ( ON-TABLE ?auto_134536 ) ( ON ?auto_134533 ?auto_134531 ) ( CLEAR ?auto_134537 ) ( ON ?auto_134535 ?auto_134533 ) ( CLEAR ?auto_134535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134536 ?auto_134530 ?auto_134531 ?auto_134533 )
      ( MAKE-2PILE ?auto_134530 ?auto_134531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134539 - BLOCK
      ?auto_134540 - BLOCK
    )
    :vars
    (
      ?auto_134546 - BLOCK
      ?auto_134543 - BLOCK
      ?auto_134547 - BLOCK
      ?auto_134542 - BLOCK
      ?auto_134541 - BLOCK
      ?auto_134544 - BLOCK
      ?auto_134545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134539 ?auto_134540 ) ) ( not ( = ?auto_134539 ?auto_134546 ) ) ( not ( = ?auto_134540 ?auto_134546 ) ) ( ON-TABLE ?auto_134543 ) ( ON ?auto_134547 ?auto_134543 ) ( ON ?auto_134542 ?auto_134547 ) ( not ( = ?auto_134543 ?auto_134547 ) ) ( not ( = ?auto_134543 ?auto_134542 ) ) ( not ( = ?auto_134543 ?auto_134541 ) ) ( not ( = ?auto_134543 ?auto_134544 ) ) ( not ( = ?auto_134543 ?auto_134546 ) ) ( not ( = ?auto_134543 ?auto_134540 ) ) ( not ( = ?auto_134543 ?auto_134539 ) ) ( not ( = ?auto_134547 ?auto_134542 ) ) ( not ( = ?auto_134547 ?auto_134541 ) ) ( not ( = ?auto_134547 ?auto_134544 ) ) ( not ( = ?auto_134547 ?auto_134546 ) ) ( not ( = ?auto_134547 ?auto_134540 ) ) ( not ( = ?auto_134547 ?auto_134539 ) ) ( not ( = ?auto_134542 ?auto_134541 ) ) ( not ( = ?auto_134542 ?auto_134544 ) ) ( not ( = ?auto_134542 ?auto_134546 ) ) ( not ( = ?auto_134542 ?auto_134540 ) ) ( not ( = ?auto_134542 ?auto_134539 ) ) ( not ( = ?auto_134541 ?auto_134544 ) ) ( not ( = ?auto_134541 ?auto_134546 ) ) ( not ( = ?auto_134541 ?auto_134540 ) ) ( not ( = ?auto_134541 ?auto_134539 ) ) ( not ( = ?auto_134544 ?auto_134546 ) ) ( not ( = ?auto_134544 ?auto_134540 ) ) ( not ( = ?auto_134544 ?auto_134539 ) ) ( ON ?auto_134539 ?auto_134545 ) ( not ( = ?auto_134539 ?auto_134545 ) ) ( not ( = ?auto_134540 ?auto_134545 ) ) ( not ( = ?auto_134546 ?auto_134545 ) ) ( not ( = ?auto_134543 ?auto_134545 ) ) ( not ( = ?auto_134547 ?auto_134545 ) ) ( not ( = ?auto_134542 ?auto_134545 ) ) ( not ( = ?auto_134541 ?auto_134545 ) ) ( not ( = ?auto_134544 ?auto_134545 ) ) ( ON ?auto_134540 ?auto_134539 ) ( ON-TABLE ?auto_134545 ) ( ON ?auto_134546 ?auto_134540 ) ( ON ?auto_134544 ?auto_134546 ) ( CLEAR ?auto_134544 ) ( HOLDING ?auto_134541 ) ( CLEAR ?auto_134542 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134543 ?auto_134547 ?auto_134542 ?auto_134541 )
      ( MAKE-2PILE ?auto_134539 ?auto_134540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134548 - BLOCK
      ?auto_134549 - BLOCK
    )
    :vars
    (
      ?auto_134556 - BLOCK
      ?auto_134550 - BLOCK
      ?auto_134551 - BLOCK
      ?auto_134553 - BLOCK
      ?auto_134555 - BLOCK
      ?auto_134552 - BLOCK
      ?auto_134554 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134548 ?auto_134549 ) ) ( not ( = ?auto_134548 ?auto_134556 ) ) ( not ( = ?auto_134549 ?auto_134556 ) ) ( ON-TABLE ?auto_134550 ) ( ON ?auto_134551 ?auto_134550 ) ( ON ?auto_134553 ?auto_134551 ) ( not ( = ?auto_134550 ?auto_134551 ) ) ( not ( = ?auto_134550 ?auto_134553 ) ) ( not ( = ?auto_134550 ?auto_134555 ) ) ( not ( = ?auto_134550 ?auto_134552 ) ) ( not ( = ?auto_134550 ?auto_134556 ) ) ( not ( = ?auto_134550 ?auto_134549 ) ) ( not ( = ?auto_134550 ?auto_134548 ) ) ( not ( = ?auto_134551 ?auto_134553 ) ) ( not ( = ?auto_134551 ?auto_134555 ) ) ( not ( = ?auto_134551 ?auto_134552 ) ) ( not ( = ?auto_134551 ?auto_134556 ) ) ( not ( = ?auto_134551 ?auto_134549 ) ) ( not ( = ?auto_134551 ?auto_134548 ) ) ( not ( = ?auto_134553 ?auto_134555 ) ) ( not ( = ?auto_134553 ?auto_134552 ) ) ( not ( = ?auto_134553 ?auto_134556 ) ) ( not ( = ?auto_134553 ?auto_134549 ) ) ( not ( = ?auto_134553 ?auto_134548 ) ) ( not ( = ?auto_134555 ?auto_134552 ) ) ( not ( = ?auto_134555 ?auto_134556 ) ) ( not ( = ?auto_134555 ?auto_134549 ) ) ( not ( = ?auto_134555 ?auto_134548 ) ) ( not ( = ?auto_134552 ?auto_134556 ) ) ( not ( = ?auto_134552 ?auto_134549 ) ) ( not ( = ?auto_134552 ?auto_134548 ) ) ( ON ?auto_134548 ?auto_134554 ) ( not ( = ?auto_134548 ?auto_134554 ) ) ( not ( = ?auto_134549 ?auto_134554 ) ) ( not ( = ?auto_134556 ?auto_134554 ) ) ( not ( = ?auto_134550 ?auto_134554 ) ) ( not ( = ?auto_134551 ?auto_134554 ) ) ( not ( = ?auto_134553 ?auto_134554 ) ) ( not ( = ?auto_134555 ?auto_134554 ) ) ( not ( = ?auto_134552 ?auto_134554 ) ) ( ON ?auto_134549 ?auto_134548 ) ( ON-TABLE ?auto_134554 ) ( ON ?auto_134556 ?auto_134549 ) ( ON ?auto_134552 ?auto_134556 ) ( CLEAR ?auto_134553 ) ( ON ?auto_134555 ?auto_134552 ) ( CLEAR ?auto_134555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134554 ?auto_134548 ?auto_134549 ?auto_134556 ?auto_134552 )
      ( MAKE-2PILE ?auto_134548 ?auto_134549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134557 - BLOCK
      ?auto_134558 - BLOCK
    )
    :vars
    (
      ?auto_134560 - BLOCK
      ?auto_134563 - BLOCK
      ?auto_134561 - BLOCK
      ?auto_134565 - BLOCK
      ?auto_134564 - BLOCK
      ?auto_134562 - BLOCK
      ?auto_134559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134557 ?auto_134558 ) ) ( not ( = ?auto_134557 ?auto_134560 ) ) ( not ( = ?auto_134558 ?auto_134560 ) ) ( ON-TABLE ?auto_134563 ) ( ON ?auto_134561 ?auto_134563 ) ( not ( = ?auto_134563 ?auto_134561 ) ) ( not ( = ?auto_134563 ?auto_134565 ) ) ( not ( = ?auto_134563 ?auto_134564 ) ) ( not ( = ?auto_134563 ?auto_134562 ) ) ( not ( = ?auto_134563 ?auto_134560 ) ) ( not ( = ?auto_134563 ?auto_134558 ) ) ( not ( = ?auto_134563 ?auto_134557 ) ) ( not ( = ?auto_134561 ?auto_134565 ) ) ( not ( = ?auto_134561 ?auto_134564 ) ) ( not ( = ?auto_134561 ?auto_134562 ) ) ( not ( = ?auto_134561 ?auto_134560 ) ) ( not ( = ?auto_134561 ?auto_134558 ) ) ( not ( = ?auto_134561 ?auto_134557 ) ) ( not ( = ?auto_134565 ?auto_134564 ) ) ( not ( = ?auto_134565 ?auto_134562 ) ) ( not ( = ?auto_134565 ?auto_134560 ) ) ( not ( = ?auto_134565 ?auto_134558 ) ) ( not ( = ?auto_134565 ?auto_134557 ) ) ( not ( = ?auto_134564 ?auto_134562 ) ) ( not ( = ?auto_134564 ?auto_134560 ) ) ( not ( = ?auto_134564 ?auto_134558 ) ) ( not ( = ?auto_134564 ?auto_134557 ) ) ( not ( = ?auto_134562 ?auto_134560 ) ) ( not ( = ?auto_134562 ?auto_134558 ) ) ( not ( = ?auto_134562 ?auto_134557 ) ) ( ON ?auto_134557 ?auto_134559 ) ( not ( = ?auto_134557 ?auto_134559 ) ) ( not ( = ?auto_134558 ?auto_134559 ) ) ( not ( = ?auto_134560 ?auto_134559 ) ) ( not ( = ?auto_134563 ?auto_134559 ) ) ( not ( = ?auto_134561 ?auto_134559 ) ) ( not ( = ?auto_134565 ?auto_134559 ) ) ( not ( = ?auto_134564 ?auto_134559 ) ) ( not ( = ?auto_134562 ?auto_134559 ) ) ( ON ?auto_134558 ?auto_134557 ) ( ON-TABLE ?auto_134559 ) ( ON ?auto_134560 ?auto_134558 ) ( ON ?auto_134562 ?auto_134560 ) ( ON ?auto_134564 ?auto_134562 ) ( CLEAR ?auto_134564 ) ( HOLDING ?auto_134565 ) ( CLEAR ?auto_134561 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134563 ?auto_134561 ?auto_134565 )
      ( MAKE-2PILE ?auto_134557 ?auto_134558 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134566 - BLOCK
      ?auto_134567 - BLOCK
    )
    :vars
    (
      ?auto_134568 - BLOCK
      ?auto_134569 - BLOCK
      ?auto_134574 - BLOCK
      ?auto_134571 - BLOCK
      ?auto_134573 - BLOCK
      ?auto_134572 - BLOCK
      ?auto_134570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134566 ?auto_134567 ) ) ( not ( = ?auto_134566 ?auto_134568 ) ) ( not ( = ?auto_134567 ?auto_134568 ) ) ( ON-TABLE ?auto_134569 ) ( ON ?auto_134574 ?auto_134569 ) ( not ( = ?auto_134569 ?auto_134574 ) ) ( not ( = ?auto_134569 ?auto_134571 ) ) ( not ( = ?auto_134569 ?auto_134573 ) ) ( not ( = ?auto_134569 ?auto_134572 ) ) ( not ( = ?auto_134569 ?auto_134568 ) ) ( not ( = ?auto_134569 ?auto_134567 ) ) ( not ( = ?auto_134569 ?auto_134566 ) ) ( not ( = ?auto_134574 ?auto_134571 ) ) ( not ( = ?auto_134574 ?auto_134573 ) ) ( not ( = ?auto_134574 ?auto_134572 ) ) ( not ( = ?auto_134574 ?auto_134568 ) ) ( not ( = ?auto_134574 ?auto_134567 ) ) ( not ( = ?auto_134574 ?auto_134566 ) ) ( not ( = ?auto_134571 ?auto_134573 ) ) ( not ( = ?auto_134571 ?auto_134572 ) ) ( not ( = ?auto_134571 ?auto_134568 ) ) ( not ( = ?auto_134571 ?auto_134567 ) ) ( not ( = ?auto_134571 ?auto_134566 ) ) ( not ( = ?auto_134573 ?auto_134572 ) ) ( not ( = ?auto_134573 ?auto_134568 ) ) ( not ( = ?auto_134573 ?auto_134567 ) ) ( not ( = ?auto_134573 ?auto_134566 ) ) ( not ( = ?auto_134572 ?auto_134568 ) ) ( not ( = ?auto_134572 ?auto_134567 ) ) ( not ( = ?auto_134572 ?auto_134566 ) ) ( ON ?auto_134566 ?auto_134570 ) ( not ( = ?auto_134566 ?auto_134570 ) ) ( not ( = ?auto_134567 ?auto_134570 ) ) ( not ( = ?auto_134568 ?auto_134570 ) ) ( not ( = ?auto_134569 ?auto_134570 ) ) ( not ( = ?auto_134574 ?auto_134570 ) ) ( not ( = ?auto_134571 ?auto_134570 ) ) ( not ( = ?auto_134573 ?auto_134570 ) ) ( not ( = ?auto_134572 ?auto_134570 ) ) ( ON ?auto_134567 ?auto_134566 ) ( ON-TABLE ?auto_134570 ) ( ON ?auto_134568 ?auto_134567 ) ( ON ?auto_134572 ?auto_134568 ) ( ON ?auto_134573 ?auto_134572 ) ( CLEAR ?auto_134574 ) ( ON ?auto_134571 ?auto_134573 ) ( CLEAR ?auto_134571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134570 ?auto_134566 ?auto_134567 ?auto_134568 ?auto_134572 ?auto_134573 )
      ( MAKE-2PILE ?auto_134566 ?auto_134567 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134575 - BLOCK
      ?auto_134576 - BLOCK
    )
    :vars
    (
      ?auto_134578 - BLOCK
      ?auto_134581 - BLOCK
      ?auto_134582 - BLOCK
      ?auto_134583 - BLOCK
      ?auto_134577 - BLOCK
      ?auto_134580 - BLOCK
      ?auto_134579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134575 ?auto_134576 ) ) ( not ( = ?auto_134575 ?auto_134578 ) ) ( not ( = ?auto_134576 ?auto_134578 ) ) ( ON-TABLE ?auto_134581 ) ( not ( = ?auto_134581 ?auto_134582 ) ) ( not ( = ?auto_134581 ?auto_134583 ) ) ( not ( = ?auto_134581 ?auto_134577 ) ) ( not ( = ?auto_134581 ?auto_134580 ) ) ( not ( = ?auto_134581 ?auto_134578 ) ) ( not ( = ?auto_134581 ?auto_134576 ) ) ( not ( = ?auto_134581 ?auto_134575 ) ) ( not ( = ?auto_134582 ?auto_134583 ) ) ( not ( = ?auto_134582 ?auto_134577 ) ) ( not ( = ?auto_134582 ?auto_134580 ) ) ( not ( = ?auto_134582 ?auto_134578 ) ) ( not ( = ?auto_134582 ?auto_134576 ) ) ( not ( = ?auto_134582 ?auto_134575 ) ) ( not ( = ?auto_134583 ?auto_134577 ) ) ( not ( = ?auto_134583 ?auto_134580 ) ) ( not ( = ?auto_134583 ?auto_134578 ) ) ( not ( = ?auto_134583 ?auto_134576 ) ) ( not ( = ?auto_134583 ?auto_134575 ) ) ( not ( = ?auto_134577 ?auto_134580 ) ) ( not ( = ?auto_134577 ?auto_134578 ) ) ( not ( = ?auto_134577 ?auto_134576 ) ) ( not ( = ?auto_134577 ?auto_134575 ) ) ( not ( = ?auto_134580 ?auto_134578 ) ) ( not ( = ?auto_134580 ?auto_134576 ) ) ( not ( = ?auto_134580 ?auto_134575 ) ) ( ON ?auto_134575 ?auto_134579 ) ( not ( = ?auto_134575 ?auto_134579 ) ) ( not ( = ?auto_134576 ?auto_134579 ) ) ( not ( = ?auto_134578 ?auto_134579 ) ) ( not ( = ?auto_134581 ?auto_134579 ) ) ( not ( = ?auto_134582 ?auto_134579 ) ) ( not ( = ?auto_134583 ?auto_134579 ) ) ( not ( = ?auto_134577 ?auto_134579 ) ) ( not ( = ?auto_134580 ?auto_134579 ) ) ( ON ?auto_134576 ?auto_134575 ) ( ON-TABLE ?auto_134579 ) ( ON ?auto_134578 ?auto_134576 ) ( ON ?auto_134580 ?auto_134578 ) ( ON ?auto_134577 ?auto_134580 ) ( ON ?auto_134583 ?auto_134577 ) ( CLEAR ?auto_134583 ) ( HOLDING ?auto_134582 ) ( CLEAR ?auto_134581 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134581 ?auto_134582 )
      ( MAKE-2PILE ?auto_134575 ?auto_134576 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134584 - BLOCK
      ?auto_134585 - BLOCK
    )
    :vars
    (
      ?auto_134587 - BLOCK
      ?auto_134591 - BLOCK
      ?auto_134589 - BLOCK
      ?auto_134586 - BLOCK
      ?auto_134592 - BLOCK
      ?auto_134588 - BLOCK
      ?auto_134590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134584 ?auto_134585 ) ) ( not ( = ?auto_134584 ?auto_134587 ) ) ( not ( = ?auto_134585 ?auto_134587 ) ) ( ON-TABLE ?auto_134591 ) ( not ( = ?auto_134591 ?auto_134589 ) ) ( not ( = ?auto_134591 ?auto_134586 ) ) ( not ( = ?auto_134591 ?auto_134592 ) ) ( not ( = ?auto_134591 ?auto_134588 ) ) ( not ( = ?auto_134591 ?auto_134587 ) ) ( not ( = ?auto_134591 ?auto_134585 ) ) ( not ( = ?auto_134591 ?auto_134584 ) ) ( not ( = ?auto_134589 ?auto_134586 ) ) ( not ( = ?auto_134589 ?auto_134592 ) ) ( not ( = ?auto_134589 ?auto_134588 ) ) ( not ( = ?auto_134589 ?auto_134587 ) ) ( not ( = ?auto_134589 ?auto_134585 ) ) ( not ( = ?auto_134589 ?auto_134584 ) ) ( not ( = ?auto_134586 ?auto_134592 ) ) ( not ( = ?auto_134586 ?auto_134588 ) ) ( not ( = ?auto_134586 ?auto_134587 ) ) ( not ( = ?auto_134586 ?auto_134585 ) ) ( not ( = ?auto_134586 ?auto_134584 ) ) ( not ( = ?auto_134592 ?auto_134588 ) ) ( not ( = ?auto_134592 ?auto_134587 ) ) ( not ( = ?auto_134592 ?auto_134585 ) ) ( not ( = ?auto_134592 ?auto_134584 ) ) ( not ( = ?auto_134588 ?auto_134587 ) ) ( not ( = ?auto_134588 ?auto_134585 ) ) ( not ( = ?auto_134588 ?auto_134584 ) ) ( ON ?auto_134584 ?auto_134590 ) ( not ( = ?auto_134584 ?auto_134590 ) ) ( not ( = ?auto_134585 ?auto_134590 ) ) ( not ( = ?auto_134587 ?auto_134590 ) ) ( not ( = ?auto_134591 ?auto_134590 ) ) ( not ( = ?auto_134589 ?auto_134590 ) ) ( not ( = ?auto_134586 ?auto_134590 ) ) ( not ( = ?auto_134592 ?auto_134590 ) ) ( not ( = ?auto_134588 ?auto_134590 ) ) ( ON ?auto_134585 ?auto_134584 ) ( ON-TABLE ?auto_134590 ) ( ON ?auto_134587 ?auto_134585 ) ( ON ?auto_134588 ?auto_134587 ) ( ON ?auto_134592 ?auto_134588 ) ( ON ?auto_134586 ?auto_134592 ) ( CLEAR ?auto_134591 ) ( ON ?auto_134589 ?auto_134586 ) ( CLEAR ?auto_134589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134590 ?auto_134584 ?auto_134585 ?auto_134587 ?auto_134588 ?auto_134592 ?auto_134586 )
      ( MAKE-2PILE ?auto_134584 ?auto_134585 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134593 - BLOCK
      ?auto_134594 - BLOCK
    )
    :vars
    (
      ?auto_134595 - BLOCK
      ?auto_134599 - BLOCK
      ?auto_134598 - BLOCK
      ?auto_134596 - BLOCK
      ?auto_134601 - BLOCK
      ?auto_134600 - BLOCK
      ?auto_134597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134593 ?auto_134594 ) ) ( not ( = ?auto_134593 ?auto_134595 ) ) ( not ( = ?auto_134594 ?auto_134595 ) ) ( not ( = ?auto_134599 ?auto_134598 ) ) ( not ( = ?auto_134599 ?auto_134596 ) ) ( not ( = ?auto_134599 ?auto_134601 ) ) ( not ( = ?auto_134599 ?auto_134600 ) ) ( not ( = ?auto_134599 ?auto_134595 ) ) ( not ( = ?auto_134599 ?auto_134594 ) ) ( not ( = ?auto_134599 ?auto_134593 ) ) ( not ( = ?auto_134598 ?auto_134596 ) ) ( not ( = ?auto_134598 ?auto_134601 ) ) ( not ( = ?auto_134598 ?auto_134600 ) ) ( not ( = ?auto_134598 ?auto_134595 ) ) ( not ( = ?auto_134598 ?auto_134594 ) ) ( not ( = ?auto_134598 ?auto_134593 ) ) ( not ( = ?auto_134596 ?auto_134601 ) ) ( not ( = ?auto_134596 ?auto_134600 ) ) ( not ( = ?auto_134596 ?auto_134595 ) ) ( not ( = ?auto_134596 ?auto_134594 ) ) ( not ( = ?auto_134596 ?auto_134593 ) ) ( not ( = ?auto_134601 ?auto_134600 ) ) ( not ( = ?auto_134601 ?auto_134595 ) ) ( not ( = ?auto_134601 ?auto_134594 ) ) ( not ( = ?auto_134601 ?auto_134593 ) ) ( not ( = ?auto_134600 ?auto_134595 ) ) ( not ( = ?auto_134600 ?auto_134594 ) ) ( not ( = ?auto_134600 ?auto_134593 ) ) ( ON ?auto_134593 ?auto_134597 ) ( not ( = ?auto_134593 ?auto_134597 ) ) ( not ( = ?auto_134594 ?auto_134597 ) ) ( not ( = ?auto_134595 ?auto_134597 ) ) ( not ( = ?auto_134599 ?auto_134597 ) ) ( not ( = ?auto_134598 ?auto_134597 ) ) ( not ( = ?auto_134596 ?auto_134597 ) ) ( not ( = ?auto_134601 ?auto_134597 ) ) ( not ( = ?auto_134600 ?auto_134597 ) ) ( ON ?auto_134594 ?auto_134593 ) ( ON-TABLE ?auto_134597 ) ( ON ?auto_134595 ?auto_134594 ) ( ON ?auto_134600 ?auto_134595 ) ( ON ?auto_134601 ?auto_134600 ) ( ON ?auto_134596 ?auto_134601 ) ( ON ?auto_134598 ?auto_134596 ) ( CLEAR ?auto_134598 ) ( HOLDING ?auto_134599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134599 )
      ( MAKE-2PILE ?auto_134593 ?auto_134594 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134602 - BLOCK
      ?auto_134603 - BLOCK
    )
    :vars
    (
      ?auto_134608 - BLOCK
      ?auto_134605 - BLOCK
      ?auto_134606 - BLOCK
      ?auto_134604 - BLOCK
      ?auto_134609 - BLOCK
      ?auto_134607 - BLOCK
      ?auto_134610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134602 ?auto_134603 ) ) ( not ( = ?auto_134602 ?auto_134608 ) ) ( not ( = ?auto_134603 ?auto_134608 ) ) ( not ( = ?auto_134605 ?auto_134606 ) ) ( not ( = ?auto_134605 ?auto_134604 ) ) ( not ( = ?auto_134605 ?auto_134609 ) ) ( not ( = ?auto_134605 ?auto_134607 ) ) ( not ( = ?auto_134605 ?auto_134608 ) ) ( not ( = ?auto_134605 ?auto_134603 ) ) ( not ( = ?auto_134605 ?auto_134602 ) ) ( not ( = ?auto_134606 ?auto_134604 ) ) ( not ( = ?auto_134606 ?auto_134609 ) ) ( not ( = ?auto_134606 ?auto_134607 ) ) ( not ( = ?auto_134606 ?auto_134608 ) ) ( not ( = ?auto_134606 ?auto_134603 ) ) ( not ( = ?auto_134606 ?auto_134602 ) ) ( not ( = ?auto_134604 ?auto_134609 ) ) ( not ( = ?auto_134604 ?auto_134607 ) ) ( not ( = ?auto_134604 ?auto_134608 ) ) ( not ( = ?auto_134604 ?auto_134603 ) ) ( not ( = ?auto_134604 ?auto_134602 ) ) ( not ( = ?auto_134609 ?auto_134607 ) ) ( not ( = ?auto_134609 ?auto_134608 ) ) ( not ( = ?auto_134609 ?auto_134603 ) ) ( not ( = ?auto_134609 ?auto_134602 ) ) ( not ( = ?auto_134607 ?auto_134608 ) ) ( not ( = ?auto_134607 ?auto_134603 ) ) ( not ( = ?auto_134607 ?auto_134602 ) ) ( ON ?auto_134602 ?auto_134610 ) ( not ( = ?auto_134602 ?auto_134610 ) ) ( not ( = ?auto_134603 ?auto_134610 ) ) ( not ( = ?auto_134608 ?auto_134610 ) ) ( not ( = ?auto_134605 ?auto_134610 ) ) ( not ( = ?auto_134606 ?auto_134610 ) ) ( not ( = ?auto_134604 ?auto_134610 ) ) ( not ( = ?auto_134609 ?auto_134610 ) ) ( not ( = ?auto_134607 ?auto_134610 ) ) ( ON ?auto_134603 ?auto_134602 ) ( ON-TABLE ?auto_134610 ) ( ON ?auto_134608 ?auto_134603 ) ( ON ?auto_134607 ?auto_134608 ) ( ON ?auto_134609 ?auto_134607 ) ( ON ?auto_134604 ?auto_134609 ) ( ON ?auto_134606 ?auto_134604 ) ( ON ?auto_134605 ?auto_134606 ) ( CLEAR ?auto_134605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134610 ?auto_134602 ?auto_134603 ?auto_134608 ?auto_134607 ?auto_134609 ?auto_134604 ?auto_134606 )
      ( MAKE-2PILE ?auto_134602 ?auto_134603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134616 - BLOCK
      ?auto_134617 - BLOCK
      ?auto_134618 - BLOCK
      ?auto_134619 - BLOCK
      ?auto_134620 - BLOCK
    )
    :vars
    (
      ?auto_134621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134621 ?auto_134620 ) ( CLEAR ?auto_134621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134616 ) ( ON ?auto_134617 ?auto_134616 ) ( ON ?auto_134618 ?auto_134617 ) ( ON ?auto_134619 ?auto_134618 ) ( ON ?auto_134620 ?auto_134619 ) ( not ( = ?auto_134616 ?auto_134617 ) ) ( not ( = ?auto_134616 ?auto_134618 ) ) ( not ( = ?auto_134616 ?auto_134619 ) ) ( not ( = ?auto_134616 ?auto_134620 ) ) ( not ( = ?auto_134616 ?auto_134621 ) ) ( not ( = ?auto_134617 ?auto_134618 ) ) ( not ( = ?auto_134617 ?auto_134619 ) ) ( not ( = ?auto_134617 ?auto_134620 ) ) ( not ( = ?auto_134617 ?auto_134621 ) ) ( not ( = ?auto_134618 ?auto_134619 ) ) ( not ( = ?auto_134618 ?auto_134620 ) ) ( not ( = ?auto_134618 ?auto_134621 ) ) ( not ( = ?auto_134619 ?auto_134620 ) ) ( not ( = ?auto_134619 ?auto_134621 ) ) ( not ( = ?auto_134620 ?auto_134621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134621 ?auto_134620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134622 - BLOCK
      ?auto_134623 - BLOCK
      ?auto_134624 - BLOCK
      ?auto_134625 - BLOCK
      ?auto_134626 - BLOCK
    )
    :vars
    (
      ?auto_134627 - BLOCK
      ?auto_134628 - BLOCK
      ?auto_134629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134627 ?auto_134626 ) ( CLEAR ?auto_134627 ) ( ON-TABLE ?auto_134622 ) ( ON ?auto_134623 ?auto_134622 ) ( ON ?auto_134624 ?auto_134623 ) ( ON ?auto_134625 ?auto_134624 ) ( ON ?auto_134626 ?auto_134625 ) ( not ( = ?auto_134622 ?auto_134623 ) ) ( not ( = ?auto_134622 ?auto_134624 ) ) ( not ( = ?auto_134622 ?auto_134625 ) ) ( not ( = ?auto_134622 ?auto_134626 ) ) ( not ( = ?auto_134622 ?auto_134627 ) ) ( not ( = ?auto_134623 ?auto_134624 ) ) ( not ( = ?auto_134623 ?auto_134625 ) ) ( not ( = ?auto_134623 ?auto_134626 ) ) ( not ( = ?auto_134623 ?auto_134627 ) ) ( not ( = ?auto_134624 ?auto_134625 ) ) ( not ( = ?auto_134624 ?auto_134626 ) ) ( not ( = ?auto_134624 ?auto_134627 ) ) ( not ( = ?auto_134625 ?auto_134626 ) ) ( not ( = ?auto_134625 ?auto_134627 ) ) ( not ( = ?auto_134626 ?auto_134627 ) ) ( HOLDING ?auto_134628 ) ( CLEAR ?auto_134629 ) ( not ( = ?auto_134622 ?auto_134628 ) ) ( not ( = ?auto_134622 ?auto_134629 ) ) ( not ( = ?auto_134623 ?auto_134628 ) ) ( not ( = ?auto_134623 ?auto_134629 ) ) ( not ( = ?auto_134624 ?auto_134628 ) ) ( not ( = ?auto_134624 ?auto_134629 ) ) ( not ( = ?auto_134625 ?auto_134628 ) ) ( not ( = ?auto_134625 ?auto_134629 ) ) ( not ( = ?auto_134626 ?auto_134628 ) ) ( not ( = ?auto_134626 ?auto_134629 ) ) ( not ( = ?auto_134627 ?auto_134628 ) ) ( not ( = ?auto_134627 ?auto_134629 ) ) ( not ( = ?auto_134628 ?auto_134629 ) ) )
    :subtasks
    ( ( !STACK ?auto_134628 ?auto_134629 )
      ( MAKE-5PILE ?auto_134622 ?auto_134623 ?auto_134624 ?auto_134625 ?auto_134626 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134630 - BLOCK
      ?auto_134631 - BLOCK
      ?auto_134632 - BLOCK
      ?auto_134633 - BLOCK
      ?auto_134634 - BLOCK
    )
    :vars
    (
      ?auto_134637 - BLOCK
      ?auto_134635 - BLOCK
      ?auto_134636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134637 ?auto_134634 ) ( ON-TABLE ?auto_134630 ) ( ON ?auto_134631 ?auto_134630 ) ( ON ?auto_134632 ?auto_134631 ) ( ON ?auto_134633 ?auto_134632 ) ( ON ?auto_134634 ?auto_134633 ) ( not ( = ?auto_134630 ?auto_134631 ) ) ( not ( = ?auto_134630 ?auto_134632 ) ) ( not ( = ?auto_134630 ?auto_134633 ) ) ( not ( = ?auto_134630 ?auto_134634 ) ) ( not ( = ?auto_134630 ?auto_134637 ) ) ( not ( = ?auto_134631 ?auto_134632 ) ) ( not ( = ?auto_134631 ?auto_134633 ) ) ( not ( = ?auto_134631 ?auto_134634 ) ) ( not ( = ?auto_134631 ?auto_134637 ) ) ( not ( = ?auto_134632 ?auto_134633 ) ) ( not ( = ?auto_134632 ?auto_134634 ) ) ( not ( = ?auto_134632 ?auto_134637 ) ) ( not ( = ?auto_134633 ?auto_134634 ) ) ( not ( = ?auto_134633 ?auto_134637 ) ) ( not ( = ?auto_134634 ?auto_134637 ) ) ( CLEAR ?auto_134635 ) ( not ( = ?auto_134630 ?auto_134636 ) ) ( not ( = ?auto_134630 ?auto_134635 ) ) ( not ( = ?auto_134631 ?auto_134636 ) ) ( not ( = ?auto_134631 ?auto_134635 ) ) ( not ( = ?auto_134632 ?auto_134636 ) ) ( not ( = ?auto_134632 ?auto_134635 ) ) ( not ( = ?auto_134633 ?auto_134636 ) ) ( not ( = ?auto_134633 ?auto_134635 ) ) ( not ( = ?auto_134634 ?auto_134636 ) ) ( not ( = ?auto_134634 ?auto_134635 ) ) ( not ( = ?auto_134637 ?auto_134636 ) ) ( not ( = ?auto_134637 ?auto_134635 ) ) ( not ( = ?auto_134636 ?auto_134635 ) ) ( ON ?auto_134636 ?auto_134637 ) ( CLEAR ?auto_134636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134630 ?auto_134631 ?auto_134632 ?auto_134633 ?auto_134634 ?auto_134637 )
      ( MAKE-5PILE ?auto_134630 ?auto_134631 ?auto_134632 ?auto_134633 ?auto_134634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134638 - BLOCK
      ?auto_134639 - BLOCK
      ?auto_134640 - BLOCK
      ?auto_134641 - BLOCK
      ?auto_134642 - BLOCK
    )
    :vars
    (
      ?auto_134643 - BLOCK
      ?auto_134644 - BLOCK
      ?auto_134645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134643 ?auto_134642 ) ( ON-TABLE ?auto_134638 ) ( ON ?auto_134639 ?auto_134638 ) ( ON ?auto_134640 ?auto_134639 ) ( ON ?auto_134641 ?auto_134640 ) ( ON ?auto_134642 ?auto_134641 ) ( not ( = ?auto_134638 ?auto_134639 ) ) ( not ( = ?auto_134638 ?auto_134640 ) ) ( not ( = ?auto_134638 ?auto_134641 ) ) ( not ( = ?auto_134638 ?auto_134642 ) ) ( not ( = ?auto_134638 ?auto_134643 ) ) ( not ( = ?auto_134639 ?auto_134640 ) ) ( not ( = ?auto_134639 ?auto_134641 ) ) ( not ( = ?auto_134639 ?auto_134642 ) ) ( not ( = ?auto_134639 ?auto_134643 ) ) ( not ( = ?auto_134640 ?auto_134641 ) ) ( not ( = ?auto_134640 ?auto_134642 ) ) ( not ( = ?auto_134640 ?auto_134643 ) ) ( not ( = ?auto_134641 ?auto_134642 ) ) ( not ( = ?auto_134641 ?auto_134643 ) ) ( not ( = ?auto_134642 ?auto_134643 ) ) ( not ( = ?auto_134638 ?auto_134644 ) ) ( not ( = ?auto_134638 ?auto_134645 ) ) ( not ( = ?auto_134639 ?auto_134644 ) ) ( not ( = ?auto_134639 ?auto_134645 ) ) ( not ( = ?auto_134640 ?auto_134644 ) ) ( not ( = ?auto_134640 ?auto_134645 ) ) ( not ( = ?auto_134641 ?auto_134644 ) ) ( not ( = ?auto_134641 ?auto_134645 ) ) ( not ( = ?auto_134642 ?auto_134644 ) ) ( not ( = ?auto_134642 ?auto_134645 ) ) ( not ( = ?auto_134643 ?auto_134644 ) ) ( not ( = ?auto_134643 ?auto_134645 ) ) ( not ( = ?auto_134644 ?auto_134645 ) ) ( ON ?auto_134644 ?auto_134643 ) ( CLEAR ?auto_134644 ) ( HOLDING ?auto_134645 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134645 )
      ( MAKE-5PILE ?auto_134638 ?auto_134639 ?auto_134640 ?auto_134641 ?auto_134642 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134646 - BLOCK
      ?auto_134647 - BLOCK
      ?auto_134648 - BLOCK
      ?auto_134649 - BLOCK
      ?auto_134650 - BLOCK
    )
    :vars
    (
      ?auto_134653 - BLOCK
      ?auto_134652 - BLOCK
      ?auto_134651 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134653 ?auto_134650 ) ( ON-TABLE ?auto_134646 ) ( ON ?auto_134647 ?auto_134646 ) ( ON ?auto_134648 ?auto_134647 ) ( ON ?auto_134649 ?auto_134648 ) ( ON ?auto_134650 ?auto_134649 ) ( not ( = ?auto_134646 ?auto_134647 ) ) ( not ( = ?auto_134646 ?auto_134648 ) ) ( not ( = ?auto_134646 ?auto_134649 ) ) ( not ( = ?auto_134646 ?auto_134650 ) ) ( not ( = ?auto_134646 ?auto_134653 ) ) ( not ( = ?auto_134647 ?auto_134648 ) ) ( not ( = ?auto_134647 ?auto_134649 ) ) ( not ( = ?auto_134647 ?auto_134650 ) ) ( not ( = ?auto_134647 ?auto_134653 ) ) ( not ( = ?auto_134648 ?auto_134649 ) ) ( not ( = ?auto_134648 ?auto_134650 ) ) ( not ( = ?auto_134648 ?auto_134653 ) ) ( not ( = ?auto_134649 ?auto_134650 ) ) ( not ( = ?auto_134649 ?auto_134653 ) ) ( not ( = ?auto_134650 ?auto_134653 ) ) ( not ( = ?auto_134646 ?auto_134652 ) ) ( not ( = ?auto_134646 ?auto_134651 ) ) ( not ( = ?auto_134647 ?auto_134652 ) ) ( not ( = ?auto_134647 ?auto_134651 ) ) ( not ( = ?auto_134648 ?auto_134652 ) ) ( not ( = ?auto_134648 ?auto_134651 ) ) ( not ( = ?auto_134649 ?auto_134652 ) ) ( not ( = ?auto_134649 ?auto_134651 ) ) ( not ( = ?auto_134650 ?auto_134652 ) ) ( not ( = ?auto_134650 ?auto_134651 ) ) ( not ( = ?auto_134653 ?auto_134652 ) ) ( not ( = ?auto_134653 ?auto_134651 ) ) ( not ( = ?auto_134652 ?auto_134651 ) ) ( ON ?auto_134652 ?auto_134653 ) ( ON ?auto_134651 ?auto_134652 ) ( CLEAR ?auto_134651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134646 ?auto_134647 ?auto_134648 ?auto_134649 ?auto_134650 ?auto_134653 ?auto_134652 )
      ( MAKE-5PILE ?auto_134646 ?auto_134647 ?auto_134648 ?auto_134649 ?auto_134650 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134654 - BLOCK
      ?auto_134655 - BLOCK
      ?auto_134656 - BLOCK
      ?auto_134657 - BLOCK
      ?auto_134658 - BLOCK
    )
    :vars
    (
      ?auto_134660 - BLOCK
      ?auto_134661 - BLOCK
      ?auto_134659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134660 ?auto_134658 ) ( ON-TABLE ?auto_134654 ) ( ON ?auto_134655 ?auto_134654 ) ( ON ?auto_134656 ?auto_134655 ) ( ON ?auto_134657 ?auto_134656 ) ( ON ?auto_134658 ?auto_134657 ) ( not ( = ?auto_134654 ?auto_134655 ) ) ( not ( = ?auto_134654 ?auto_134656 ) ) ( not ( = ?auto_134654 ?auto_134657 ) ) ( not ( = ?auto_134654 ?auto_134658 ) ) ( not ( = ?auto_134654 ?auto_134660 ) ) ( not ( = ?auto_134655 ?auto_134656 ) ) ( not ( = ?auto_134655 ?auto_134657 ) ) ( not ( = ?auto_134655 ?auto_134658 ) ) ( not ( = ?auto_134655 ?auto_134660 ) ) ( not ( = ?auto_134656 ?auto_134657 ) ) ( not ( = ?auto_134656 ?auto_134658 ) ) ( not ( = ?auto_134656 ?auto_134660 ) ) ( not ( = ?auto_134657 ?auto_134658 ) ) ( not ( = ?auto_134657 ?auto_134660 ) ) ( not ( = ?auto_134658 ?auto_134660 ) ) ( not ( = ?auto_134654 ?auto_134661 ) ) ( not ( = ?auto_134654 ?auto_134659 ) ) ( not ( = ?auto_134655 ?auto_134661 ) ) ( not ( = ?auto_134655 ?auto_134659 ) ) ( not ( = ?auto_134656 ?auto_134661 ) ) ( not ( = ?auto_134656 ?auto_134659 ) ) ( not ( = ?auto_134657 ?auto_134661 ) ) ( not ( = ?auto_134657 ?auto_134659 ) ) ( not ( = ?auto_134658 ?auto_134661 ) ) ( not ( = ?auto_134658 ?auto_134659 ) ) ( not ( = ?auto_134660 ?auto_134661 ) ) ( not ( = ?auto_134660 ?auto_134659 ) ) ( not ( = ?auto_134661 ?auto_134659 ) ) ( ON ?auto_134661 ?auto_134660 ) ( HOLDING ?auto_134659 ) ( CLEAR ?auto_134661 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134654 ?auto_134655 ?auto_134656 ?auto_134657 ?auto_134658 ?auto_134660 ?auto_134661 ?auto_134659 )
      ( MAKE-5PILE ?auto_134654 ?auto_134655 ?auto_134656 ?auto_134657 ?auto_134658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134662 - BLOCK
      ?auto_134663 - BLOCK
      ?auto_134664 - BLOCK
      ?auto_134665 - BLOCK
      ?auto_134666 - BLOCK
    )
    :vars
    (
      ?auto_134667 - BLOCK
      ?auto_134668 - BLOCK
      ?auto_134669 - BLOCK
      ?auto_134670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134667 ?auto_134666 ) ( ON-TABLE ?auto_134662 ) ( ON ?auto_134663 ?auto_134662 ) ( ON ?auto_134664 ?auto_134663 ) ( ON ?auto_134665 ?auto_134664 ) ( ON ?auto_134666 ?auto_134665 ) ( not ( = ?auto_134662 ?auto_134663 ) ) ( not ( = ?auto_134662 ?auto_134664 ) ) ( not ( = ?auto_134662 ?auto_134665 ) ) ( not ( = ?auto_134662 ?auto_134666 ) ) ( not ( = ?auto_134662 ?auto_134667 ) ) ( not ( = ?auto_134663 ?auto_134664 ) ) ( not ( = ?auto_134663 ?auto_134665 ) ) ( not ( = ?auto_134663 ?auto_134666 ) ) ( not ( = ?auto_134663 ?auto_134667 ) ) ( not ( = ?auto_134664 ?auto_134665 ) ) ( not ( = ?auto_134664 ?auto_134666 ) ) ( not ( = ?auto_134664 ?auto_134667 ) ) ( not ( = ?auto_134665 ?auto_134666 ) ) ( not ( = ?auto_134665 ?auto_134667 ) ) ( not ( = ?auto_134666 ?auto_134667 ) ) ( not ( = ?auto_134662 ?auto_134668 ) ) ( not ( = ?auto_134662 ?auto_134669 ) ) ( not ( = ?auto_134663 ?auto_134668 ) ) ( not ( = ?auto_134663 ?auto_134669 ) ) ( not ( = ?auto_134664 ?auto_134668 ) ) ( not ( = ?auto_134664 ?auto_134669 ) ) ( not ( = ?auto_134665 ?auto_134668 ) ) ( not ( = ?auto_134665 ?auto_134669 ) ) ( not ( = ?auto_134666 ?auto_134668 ) ) ( not ( = ?auto_134666 ?auto_134669 ) ) ( not ( = ?auto_134667 ?auto_134668 ) ) ( not ( = ?auto_134667 ?auto_134669 ) ) ( not ( = ?auto_134668 ?auto_134669 ) ) ( ON ?auto_134668 ?auto_134667 ) ( CLEAR ?auto_134668 ) ( ON ?auto_134669 ?auto_134670 ) ( CLEAR ?auto_134669 ) ( HAND-EMPTY ) ( not ( = ?auto_134662 ?auto_134670 ) ) ( not ( = ?auto_134663 ?auto_134670 ) ) ( not ( = ?auto_134664 ?auto_134670 ) ) ( not ( = ?auto_134665 ?auto_134670 ) ) ( not ( = ?auto_134666 ?auto_134670 ) ) ( not ( = ?auto_134667 ?auto_134670 ) ) ( not ( = ?auto_134668 ?auto_134670 ) ) ( not ( = ?auto_134669 ?auto_134670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134669 ?auto_134670 )
      ( MAKE-5PILE ?auto_134662 ?auto_134663 ?auto_134664 ?auto_134665 ?auto_134666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134671 - BLOCK
      ?auto_134672 - BLOCK
      ?auto_134673 - BLOCK
      ?auto_134674 - BLOCK
      ?auto_134675 - BLOCK
    )
    :vars
    (
      ?auto_134676 - BLOCK
      ?auto_134679 - BLOCK
      ?auto_134677 - BLOCK
      ?auto_134678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134676 ?auto_134675 ) ( ON-TABLE ?auto_134671 ) ( ON ?auto_134672 ?auto_134671 ) ( ON ?auto_134673 ?auto_134672 ) ( ON ?auto_134674 ?auto_134673 ) ( ON ?auto_134675 ?auto_134674 ) ( not ( = ?auto_134671 ?auto_134672 ) ) ( not ( = ?auto_134671 ?auto_134673 ) ) ( not ( = ?auto_134671 ?auto_134674 ) ) ( not ( = ?auto_134671 ?auto_134675 ) ) ( not ( = ?auto_134671 ?auto_134676 ) ) ( not ( = ?auto_134672 ?auto_134673 ) ) ( not ( = ?auto_134672 ?auto_134674 ) ) ( not ( = ?auto_134672 ?auto_134675 ) ) ( not ( = ?auto_134672 ?auto_134676 ) ) ( not ( = ?auto_134673 ?auto_134674 ) ) ( not ( = ?auto_134673 ?auto_134675 ) ) ( not ( = ?auto_134673 ?auto_134676 ) ) ( not ( = ?auto_134674 ?auto_134675 ) ) ( not ( = ?auto_134674 ?auto_134676 ) ) ( not ( = ?auto_134675 ?auto_134676 ) ) ( not ( = ?auto_134671 ?auto_134679 ) ) ( not ( = ?auto_134671 ?auto_134677 ) ) ( not ( = ?auto_134672 ?auto_134679 ) ) ( not ( = ?auto_134672 ?auto_134677 ) ) ( not ( = ?auto_134673 ?auto_134679 ) ) ( not ( = ?auto_134673 ?auto_134677 ) ) ( not ( = ?auto_134674 ?auto_134679 ) ) ( not ( = ?auto_134674 ?auto_134677 ) ) ( not ( = ?auto_134675 ?auto_134679 ) ) ( not ( = ?auto_134675 ?auto_134677 ) ) ( not ( = ?auto_134676 ?auto_134679 ) ) ( not ( = ?auto_134676 ?auto_134677 ) ) ( not ( = ?auto_134679 ?auto_134677 ) ) ( ON ?auto_134677 ?auto_134678 ) ( CLEAR ?auto_134677 ) ( not ( = ?auto_134671 ?auto_134678 ) ) ( not ( = ?auto_134672 ?auto_134678 ) ) ( not ( = ?auto_134673 ?auto_134678 ) ) ( not ( = ?auto_134674 ?auto_134678 ) ) ( not ( = ?auto_134675 ?auto_134678 ) ) ( not ( = ?auto_134676 ?auto_134678 ) ) ( not ( = ?auto_134679 ?auto_134678 ) ) ( not ( = ?auto_134677 ?auto_134678 ) ) ( HOLDING ?auto_134679 ) ( CLEAR ?auto_134676 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134671 ?auto_134672 ?auto_134673 ?auto_134674 ?auto_134675 ?auto_134676 ?auto_134679 )
      ( MAKE-5PILE ?auto_134671 ?auto_134672 ?auto_134673 ?auto_134674 ?auto_134675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134680 - BLOCK
      ?auto_134681 - BLOCK
      ?auto_134682 - BLOCK
      ?auto_134683 - BLOCK
      ?auto_134684 - BLOCK
    )
    :vars
    (
      ?auto_134687 - BLOCK
      ?auto_134685 - BLOCK
      ?auto_134686 - BLOCK
      ?auto_134688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134687 ?auto_134684 ) ( ON-TABLE ?auto_134680 ) ( ON ?auto_134681 ?auto_134680 ) ( ON ?auto_134682 ?auto_134681 ) ( ON ?auto_134683 ?auto_134682 ) ( ON ?auto_134684 ?auto_134683 ) ( not ( = ?auto_134680 ?auto_134681 ) ) ( not ( = ?auto_134680 ?auto_134682 ) ) ( not ( = ?auto_134680 ?auto_134683 ) ) ( not ( = ?auto_134680 ?auto_134684 ) ) ( not ( = ?auto_134680 ?auto_134687 ) ) ( not ( = ?auto_134681 ?auto_134682 ) ) ( not ( = ?auto_134681 ?auto_134683 ) ) ( not ( = ?auto_134681 ?auto_134684 ) ) ( not ( = ?auto_134681 ?auto_134687 ) ) ( not ( = ?auto_134682 ?auto_134683 ) ) ( not ( = ?auto_134682 ?auto_134684 ) ) ( not ( = ?auto_134682 ?auto_134687 ) ) ( not ( = ?auto_134683 ?auto_134684 ) ) ( not ( = ?auto_134683 ?auto_134687 ) ) ( not ( = ?auto_134684 ?auto_134687 ) ) ( not ( = ?auto_134680 ?auto_134685 ) ) ( not ( = ?auto_134680 ?auto_134686 ) ) ( not ( = ?auto_134681 ?auto_134685 ) ) ( not ( = ?auto_134681 ?auto_134686 ) ) ( not ( = ?auto_134682 ?auto_134685 ) ) ( not ( = ?auto_134682 ?auto_134686 ) ) ( not ( = ?auto_134683 ?auto_134685 ) ) ( not ( = ?auto_134683 ?auto_134686 ) ) ( not ( = ?auto_134684 ?auto_134685 ) ) ( not ( = ?auto_134684 ?auto_134686 ) ) ( not ( = ?auto_134687 ?auto_134685 ) ) ( not ( = ?auto_134687 ?auto_134686 ) ) ( not ( = ?auto_134685 ?auto_134686 ) ) ( ON ?auto_134686 ?auto_134688 ) ( not ( = ?auto_134680 ?auto_134688 ) ) ( not ( = ?auto_134681 ?auto_134688 ) ) ( not ( = ?auto_134682 ?auto_134688 ) ) ( not ( = ?auto_134683 ?auto_134688 ) ) ( not ( = ?auto_134684 ?auto_134688 ) ) ( not ( = ?auto_134687 ?auto_134688 ) ) ( not ( = ?auto_134685 ?auto_134688 ) ) ( not ( = ?auto_134686 ?auto_134688 ) ) ( CLEAR ?auto_134687 ) ( ON ?auto_134685 ?auto_134686 ) ( CLEAR ?auto_134685 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134688 ?auto_134686 )
      ( MAKE-5PILE ?auto_134680 ?auto_134681 ?auto_134682 ?auto_134683 ?auto_134684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134707 - BLOCK
      ?auto_134708 - BLOCK
      ?auto_134709 - BLOCK
      ?auto_134710 - BLOCK
      ?auto_134711 - BLOCK
    )
    :vars
    (
      ?auto_134715 - BLOCK
      ?auto_134714 - BLOCK
      ?auto_134713 - BLOCK
      ?auto_134712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134707 ) ( ON ?auto_134708 ?auto_134707 ) ( ON ?auto_134709 ?auto_134708 ) ( ON ?auto_134710 ?auto_134709 ) ( not ( = ?auto_134707 ?auto_134708 ) ) ( not ( = ?auto_134707 ?auto_134709 ) ) ( not ( = ?auto_134707 ?auto_134710 ) ) ( not ( = ?auto_134707 ?auto_134711 ) ) ( not ( = ?auto_134707 ?auto_134715 ) ) ( not ( = ?auto_134708 ?auto_134709 ) ) ( not ( = ?auto_134708 ?auto_134710 ) ) ( not ( = ?auto_134708 ?auto_134711 ) ) ( not ( = ?auto_134708 ?auto_134715 ) ) ( not ( = ?auto_134709 ?auto_134710 ) ) ( not ( = ?auto_134709 ?auto_134711 ) ) ( not ( = ?auto_134709 ?auto_134715 ) ) ( not ( = ?auto_134710 ?auto_134711 ) ) ( not ( = ?auto_134710 ?auto_134715 ) ) ( not ( = ?auto_134711 ?auto_134715 ) ) ( not ( = ?auto_134707 ?auto_134714 ) ) ( not ( = ?auto_134707 ?auto_134713 ) ) ( not ( = ?auto_134708 ?auto_134714 ) ) ( not ( = ?auto_134708 ?auto_134713 ) ) ( not ( = ?auto_134709 ?auto_134714 ) ) ( not ( = ?auto_134709 ?auto_134713 ) ) ( not ( = ?auto_134710 ?auto_134714 ) ) ( not ( = ?auto_134710 ?auto_134713 ) ) ( not ( = ?auto_134711 ?auto_134714 ) ) ( not ( = ?auto_134711 ?auto_134713 ) ) ( not ( = ?auto_134715 ?auto_134714 ) ) ( not ( = ?auto_134715 ?auto_134713 ) ) ( not ( = ?auto_134714 ?auto_134713 ) ) ( ON ?auto_134713 ?auto_134712 ) ( not ( = ?auto_134707 ?auto_134712 ) ) ( not ( = ?auto_134708 ?auto_134712 ) ) ( not ( = ?auto_134709 ?auto_134712 ) ) ( not ( = ?auto_134710 ?auto_134712 ) ) ( not ( = ?auto_134711 ?auto_134712 ) ) ( not ( = ?auto_134715 ?auto_134712 ) ) ( not ( = ?auto_134714 ?auto_134712 ) ) ( not ( = ?auto_134713 ?auto_134712 ) ) ( ON ?auto_134714 ?auto_134713 ) ( ON-TABLE ?auto_134712 ) ( ON ?auto_134715 ?auto_134714 ) ( CLEAR ?auto_134715 ) ( HOLDING ?auto_134711 ) ( CLEAR ?auto_134710 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134707 ?auto_134708 ?auto_134709 ?auto_134710 ?auto_134711 ?auto_134715 )
      ( MAKE-5PILE ?auto_134707 ?auto_134708 ?auto_134709 ?auto_134710 ?auto_134711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134716 - BLOCK
      ?auto_134717 - BLOCK
      ?auto_134718 - BLOCK
      ?auto_134719 - BLOCK
      ?auto_134720 - BLOCK
    )
    :vars
    (
      ?auto_134721 - BLOCK
      ?auto_134724 - BLOCK
      ?auto_134722 - BLOCK
      ?auto_134723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134716 ) ( ON ?auto_134717 ?auto_134716 ) ( ON ?auto_134718 ?auto_134717 ) ( ON ?auto_134719 ?auto_134718 ) ( not ( = ?auto_134716 ?auto_134717 ) ) ( not ( = ?auto_134716 ?auto_134718 ) ) ( not ( = ?auto_134716 ?auto_134719 ) ) ( not ( = ?auto_134716 ?auto_134720 ) ) ( not ( = ?auto_134716 ?auto_134721 ) ) ( not ( = ?auto_134717 ?auto_134718 ) ) ( not ( = ?auto_134717 ?auto_134719 ) ) ( not ( = ?auto_134717 ?auto_134720 ) ) ( not ( = ?auto_134717 ?auto_134721 ) ) ( not ( = ?auto_134718 ?auto_134719 ) ) ( not ( = ?auto_134718 ?auto_134720 ) ) ( not ( = ?auto_134718 ?auto_134721 ) ) ( not ( = ?auto_134719 ?auto_134720 ) ) ( not ( = ?auto_134719 ?auto_134721 ) ) ( not ( = ?auto_134720 ?auto_134721 ) ) ( not ( = ?auto_134716 ?auto_134724 ) ) ( not ( = ?auto_134716 ?auto_134722 ) ) ( not ( = ?auto_134717 ?auto_134724 ) ) ( not ( = ?auto_134717 ?auto_134722 ) ) ( not ( = ?auto_134718 ?auto_134724 ) ) ( not ( = ?auto_134718 ?auto_134722 ) ) ( not ( = ?auto_134719 ?auto_134724 ) ) ( not ( = ?auto_134719 ?auto_134722 ) ) ( not ( = ?auto_134720 ?auto_134724 ) ) ( not ( = ?auto_134720 ?auto_134722 ) ) ( not ( = ?auto_134721 ?auto_134724 ) ) ( not ( = ?auto_134721 ?auto_134722 ) ) ( not ( = ?auto_134724 ?auto_134722 ) ) ( ON ?auto_134722 ?auto_134723 ) ( not ( = ?auto_134716 ?auto_134723 ) ) ( not ( = ?auto_134717 ?auto_134723 ) ) ( not ( = ?auto_134718 ?auto_134723 ) ) ( not ( = ?auto_134719 ?auto_134723 ) ) ( not ( = ?auto_134720 ?auto_134723 ) ) ( not ( = ?auto_134721 ?auto_134723 ) ) ( not ( = ?auto_134724 ?auto_134723 ) ) ( not ( = ?auto_134722 ?auto_134723 ) ) ( ON ?auto_134724 ?auto_134722 ) ( ON-TABLE ?auto_134723 ) ( ON ?auto_134721 ?auto_134724 ) ( CLEAR ?auto_134719 ) ( ON ?auto_134720 ?auto_134721 ) ( CLEAR ?auto_134720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134723 ?auto_134722 ?auto_134724 ?auto_134721 )
      ( MAKE-5PILE ?auto_134716 ?auto_134717 ?auto_134718 ?auto_134719 ?auto_134720 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134725 - BLOCK
      ?auto_134726 - BLOCK
      ?auto_134727 - BLOCK
      ?auto_134728 - BLOCK
      ?auto_134729 - BLOCK
    )
    :vars
    (
      ?auto_134733 - BLOCK
      ?auto_134732 - BLOCK
      ?auto_134730 - BLOCK
      ?auto_134731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134725 ) ( ON ?auto_134726 ?auto_134725 ) ( ON ?auto_134727 ?auto_134726 ) ( not ( = ?auto_134725 ?auto_134726 ) ) ( not ( = ?auto_134725 ?auto_134727 ) ) ( not ( = ?auto_134725 ?auto_134728 ) ) ( not ( = ?auto_134725 ?auto_134729 ) ) ( not ( = ?auto_134725 ?auto_134733 ) ) ( not ( = ?auto_134726 ?auto_134727 ) ) ( not ( = ?auto_134726 ?auto_134728 ) ) ( not ( = ?auto_134726 ?auto_134729 ) ) ( not ( = ?auto_134726 ?auto_134733 ) ) ( not ( = ?auto_134727 ?auto_134728 ) ) ( not ( = ?auto_134727 ?auto_134729 ) ) ( not ( = ?auto_134727 ?auto_134733 ) ) ( not ( = ?auto_134728 ?auto_134729 ) ) ( not ( = ?auto_134728 ?auto_134733 ) ) ( not ( = ?auto_134729 ?auto_134733 ) ) ( not ( = ?auto_134725 ?auto_134732 ) ) ( not ( = ?auto_134725 ?auto_134730 ) ) ( not ( = ?auto_134726 ?auto_134732 ) ) ( not ( = ?auto_134726 ?auto_134730 ) ) ( not ( = ?auto_134727 ?auto_134732 ) ) ( not ( = ?auto_134727 ?auto_134730 ) ) ( not ( = ?auto_134728 ?auto_134732 ) ) ( not ( = ?auto_134728 ?auto_134730 ) ) ( not ( = ?auto_134729 ?auto_134732 ) ) ( not ( = ?auto_134729 ?auto_134730 ) ) ( not ( = ?auto_134733 ?auto_134732 ) ) ( not ( = ?auto_134733 ?auto_134730 ) ) ( not ( = ?auto_134732 ?auto_134730 ) ) ( ON ?auto_134730 ?auto_134731 ) ( not ( = ?auto_134725 ?auto_134731 ) ) ( not ( = ?auto_134726 ?auto_134731 ) ) ( not ( = ?auto_134727 ?auto_134731 ) ) ( not ( = ?auto_134728 ?auto_134731 ) ) ( not ( = ?auto_134729 ?auto_134731 ) ) ( not ( = ?auto_134733 ?auto_134731 ) ) ( not ( = ?auto_134732 ?auto_134731 ) ) ( not ( = ?auto_134730 ?auto_134731 ) ) ( ON ?auto_134732 ?auto_134730 ) ( ON-TABLE ?auto_134731 ) ( ON ?auto_134733 ?auto_134732 ) ( ON ?auto_134729 ?auto_134733 ) ( CLEAR ?auto_134729 ) ( HOLDING ?auto_134728 ) ( CLEAR ?auto_134727 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134725 ?auto_134726 ?auto_134727 ?auto_134728 )
      ( MAKE-5PILE ?auto_134725 ?auto_134726 ?auto_134727 ?auto_134728 ?auto_134729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134734 - BLOCK
      ?auto_134735 - BLOCK
      ?auto_134736 - BLOCK
      ?auto_134737 - BLOCK
      ?auto_134738 - BLOCK
    )
    :vars
    (
      ?auto_134739 - BLOCK
      ?auto_134740 - BLOCK
      ?auto_134741 - BLOCK
      ?auto_134742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134734 ) ( ON ?auto_134735 ?auto_134734 ) ( ON ?auto_134736 ?auto_134735 ) ( not ( = ?auto_134734 ?auto_134735 ) ) ( not ( = ?auto_134734 ?auto_134736 ) ) ( not ( = ?auto_134734 ?auto_134737 ) ) ( not ( = ?auto_134734 ?auto_134738 ) ) ( not ( = ?auto_134734 ?auto_134739 ) ) ( not ( = ?auto_134735 ?auto_134736 ) ) ( not ( = ?auto_134735 ?auto_134737 ) ) ( not ( = ?auto_134735 ?auto_134738 ) ) ( not ( = ?auto_134735 ?auto_134739 ) ) ( not ( = ?auto_134736 ?auto_134737 ) ) ( not ( = ?auto_134736 ?auto_134738 ) ) ( not ( = ?auto_134736 ?auto_134739 ) ) ( not ( = ?auto_134737 ?auto_134738 ) ) ( not ( = ?auto_134737 ?auto_134739 ) ) ( not ( = ?auto_134738 ?auto_134739 ) ) ( not ( = ?auto_134734 ?auto_134740 ) ) ( not ( = ?auto_134734 ?auto_134741 ) ) ( not ( = ?auto_134735 ?auto_134740 ) ) ( not ( = ?auto_134735 ?auto_134741 ) ) ( not ( = ?auto_134736 ?auto_134740 ) ) ( not ( = ?auto_134736 ?auto_134741 ) ) ( not ( = ?auto_134737 ?auto_134740 ) ) ( not ( = ?auto_134737 ?auto_134741 ) ) ( not ( = ?auto_134738 ?auto_134740 ) ) ( not ( = ?auto_134738 ?auto_134741 ) ) ( not ( = ?auto_134739 ?auto_134740 ) ) ( not ( = ?auto_134739 ?auto_134741 ) ) ( not ( = ?auto_134740 ?auto_134741 ) ) ( ON ?auto_134741 ?auto_134742 ) ( not ( = ?auto_134734 ?auto_134742 ) ) ( not ( = ?auto_134735 ?auto_134742 ) ) ( not ( = ?auto_134736 ?auto_134742 ) ) ( not ( = ?auto_134737 ?auto_134742 ) ) ( not ( = ?auto_134738 ?auto_134742 ) ) ( not ( = ?auto_134739 ?auto_134742 ) ) ( not ( = ?auto_134740 ?auto_134742 ) ) ( not ( = ?auto_134741 ?auto_134742 ) ) ( ON ?auto_134740 ?auto_134741 ) ( ON-TABLE ?auto_134742 ) ( ON ?auto_134739 ?auto_134740 ) ( ON ?auto_134738 ?auto_134739 ) ( CLEAR ?auto_134736 ) ( ON ?auto_134737 ?auto_134738 ) ( CLEAR ?auto_134737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134742 ?auto_134741 ?auto_134740 ?auto_134739 ?auto_134738 )
      ( MAKE-5PILE ?auto_134734 ?auto_134735 ?auto_134736 ?auto_134737 ?auto_134738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134743 - BLOCK
      ?auto_134744 - BLOCK
      ?auto_134745 - BLOCK
      ?auto_134746 - BLOCK
      ?auto_134747 - BLOCK
    )
    :vars
    (
      ?auto_134750 - BLOCK
      ?auto_134748 - BLOCK
      ?auto_134751 - BLOCK
      ?auto_134749 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134743 ) ( ON ?auto_134744 ?auto_134743 ) ( not ( = ?auto_134743 ?auto_134744 ) ) ( not ( = ?auto_134743 ?auto_134745 ) ) ( not ( = ?auto_134743 ?auto_134746 ) ) ( not ( = ?auto_134743 ?auto_134747 ) ) ( not ( = ?auto_134743 ?auto_134750 ) ) ( not ( = ?auto_134744 ?auto_134745 ) ) ( not ( = ?auto_134744 ?auto_134746 ) ) ( not ( = ?auto_134744 ?auto_134747 ) ) ( not ( = ?auto_134744 ?auto_134750 ) ) ( not ( = ?auto_134745 ?auto_134746 ) ) ( not ( = ?auto_134745 ?auto_134747 ) ) ( not ( = ?auto_134745 ?auto_134750 ) ) ( not ( = ?auto_134746 ?auto_134747 ) ) ( not ( = ?auto_134746 ?auto_134750 ) ) ( not ( = ?auto_134747 ?auto_134750 ) ) ( not ( = ?auto_134743 ?auto_134748 ) ) ( not ( = ?auto_134743 ?auto_134751 ) ) ( not ( = ?auto_134744 ?auto_134748 ) ) ( not ( = ?auto_134744 ?auto_134751 ) ) ( not ( = ?auto_134745 ?auto_134748 ) ) ( not ( = ?auto_134745 ?auto_134751 ) ) ( not ( = ?auto_134746 ?auto_134748 ) ) ( not ( = ?auto_134746 ?auto_134751 ) ) ( not ( = ?auto_134747 ?auto_134748 ) ) ( not ( = ?auto_134747 ?auto_134751 ) ) ( not ( = ?auto_134750 ?auto_134748 ) ) ( not ( = ?auto_134750 ?auto_134751 ) ) ( not ( = ?auto_134748 ?auto_134751 ) ) ( ON ?auto_134751 ?auto_134749 ) ( not ( = ?auto_134743 ?auto_134749 ) ) ( not ( = ?auto_134744 ?auto_134749 ) ) ( not ( = ?auto_134745 ?auto_134749 ) ) ( not ( = ?auto_134746 ?auto_134749 ) ) ( not ( = ?auto_134747 ?auto_134749 ) ) ( not ( = ?auto_134750 ?auto_134749 ) ) ( not ( = ?auto_134748 ?auto_134749 ) ) ( not ( = ?auto_134751 ?auto_134749 ) ) ( ON ?auto_134748 ?auto_134751 ) ( ON-TABLE ?auto_134749 ) ( ON ?auto_134750 ?auto_134748 ) ( ON ?auto_134747 ?auto_134750 ) ( ON ?auto_134746 ?auto_134747 ) ( CLEAR ?auto_134746 ) ( HOLDING ?auto_134745 ) ( CLEAR ?auto_134744 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134743 ?auto_134744 ?auto_134745 )
      ( MAKE-5PILE ?auto_134743 ?auto_134744 ?auto_134745 ?auto_134746 ?auto_134747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134752 - BLOCK
      ?auto_134753 - BLOCK
      ?auto_134754 - BLOCK
      ?auto_134755 - BLOCK
      ?auto_134756 - BLOCK
    )
    :vars
    (
      ?auto_134758 - BLOCK
      ?auto_134760 - BLOCK
      ?auto_134757 - BLOCK
      ?auto_134759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134752 ) ( ON ?auto_134753 ?auto_134752 ) ( not ( = ?auto_134752 ?auto_134753 ) ) ( not ( = ?auto_134752 ?auto_134754 ) ) ( not ( = ?auto_134752 ?auto_134755 ) ) ( not ( = ?auto_134752 ?auto_134756 ) ) ( not ( = ?auto_134752 ?auto_134758 ) ) ( not ( = ?auto_134753 ?auto_134754 ) ) ( not ( = ?auto_134753 ?auto_134755 ) ) ( not ( = ?auto_134753 ?auto_134756 ) ) ( not ( = ?auto_134753 ?auto_134758 ) ) ( not ( = ?auto_134754 ?auto_134755 ) ) ( not ( = ?auto_134754 ?auto_134756 ) ) ( not ( = ?auto_134754 ?auto_134758 ) ) ( not ( = ?auto_134755 ?auto_134756 ) ) ( not ( = ?auto_134755 ?auto_134758 ) ) ( not ( = ?auto_134756 ?auto_134758 ) ) ( not ( = ?auto_134752 ?auto_134760 ) ) ( not ( = ?auto_134752 ?auto_134757 ) ) ( not ( = ?auto_134753 ?auto_134760 ) ) ( not ( = ?auto_134753 ?auto_134757 ) ) ( not ( = ?auto_134754 ?auto_134760 ) ) ( not ( = ?auto_134754 ?auto_134757 ) ) ( not ( = ?auto_134755 ?auto_134760 ) ) ( not ( = ?auto_134755 ?auto_134757 ) ) ( not ( = ?auto_134756 ?auto_134760 ) ) ( not ( = ?auto_134756 ?auto_134757 ) ) ( not ( = ?auto_134758 ?auto_134760 ) ) ( not ( = ?auto_134758 ?auto_134757 ) ) ( not ( = ?auto_134760 ?auto_134757 ) ) ( ON ?auto_134757 ?auto_134759 ) ( not ( = ?auto_134752 ?auto_134759 ) ) ( not ( = ?auto_134753 ?auto_134759 ) ) ( not ( = ?auto_134754 ?auto_134759 ) ) ( not ( = ?auto_134755 ?auto_134759 ) ) ( not ( = ?auto_134756 ?auto_134759 ) ) ( not ( = ?auto_134758 ?auto_134759 ) ) ( not ( = ?auto_134760 ?auto_134759 ) ) ( not ( = ?auto_134757 ?auto_134759 ) ) ( ON ?auto_134760 ?auto_134757 ) ( ON-TABLE ?auto_134759 ) ( ON ?auto_134758 ?auto_134760 ) ( ON ?auto_134756 ?auto_134758 ) ( ON ?auto_134755 ?auto_134756 ) ( CLEAR ?auto_134753 ) ( ON ?auto_134754 ?auto_134755 ) ( CLEAR ?auto_134754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134759 ?auto_134757 ?auto_134760 ?auto_134758 ?auto_134756 ?auto_134755 )
      ( MAKE-5PILE ?auto_134752 ?auto_134753 ?auto_134754 ?auto_134755 ?auto_134756 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134761 - BLOCK
      ?auto_134762 - BLOCK
      ?auto_134763 - BLOCK
      ?auto_134764 - BLOCK
      ?auto_134765 - BLOCK
    )
    :vars
    (
      ?auto_134769 - BLOCK
      ?auto_134768 - BLOCK
      ?auto_134767 - BLOCK
      ?auto_134766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134761 ) ( not ( = ?auto_134761 ?auto_134762 ) ) ( not ( = ?auto_134761 ?auto_134763 ) ) ( not ( = ?auto_134761 ?auto_134764 ) ) ( not ( = ?auto_134761 ?auto_134765 ) ) ( not ( = ?auto_134761 ?auto_134769 ) ) ( not ( = ?auto_134762 ?auto_134763 ) ) ( not ( = ?auto_134762 ?auto_134764 ) ) ( not ( = ?auto_134762 ?auto_134765 ) ) ( not ( = ?auto_134762 ?auto_134769 ) ) ( not ( = ?auto_134763 ?auto_134764 ) ) ( not ( = ?auto_134763 ?auto_134765 ) ) ( not ( = ?auto_134763 ?auto_134769 ) ) ( not ( = ?auto_134764 ?auto_134765 ) ) ( not ( = ?auto_134764 ?auto_134769 ) ) ( not ( = ?auto_134765 ?auto_134769 ) ) ( not ( = ?auto_134761 ?auto_134768 ) ) ( not ( = ?auto_134761 ?auto_134767 ) ) ( not ( = ?auto_134762 ?auto_134768 ) ) ( not ( = ?auto_134762 ?auto_134767 ) ) ( not ( = ?auto_134763 ?auto_134768 ) ) ( not ( = ?auto_134763 ?auto_134767 ) ) ( not ( = ?auto_134764 ?auto_134768 ) ) ( not ( = ?auto_134764 ?auto_134767 ) ) ( not ( = ?auto_134765 ?auto_134768 ) ) ( not ( = ?auto_134765 ?auto_134767 ) ) ( not ( = ?auto_134769 ?auto_134768 ) ) ( not ( = ?auto_134769 ?auto_134767 ) ) ( not ( = ?auto_134768 ?auto_134767 ) ) ( ON ?auto_134767 ?auto_134766 ) ( not ( = ?auto_134761 ?auto_134766 ) ) ( not ( = ?auto_134762 ?auto_134766 ) ) ( not ( = ?auto_134763 ?auto_134766 ) ) ( not ( = ?auto_134764 ?auto_134766 ) ) ( not ( = ?auto_134765 ?auto_134766 ) ) ( not ( = ?auto_134769 ?auto_134766 ) ) ( not ( = ?auto_134768 ?auto_134766 ) ) ( not ( = ?auto_134767 ?auto_134766 ) ) ( ON ?auto_134768 ?auto_134767 ) ( ON-TABLE ?auto_134766 ) ( ON ?auto_134769 ?auto_134768 ) ( ON ?auto_134765 ?auto_134769 ) ( ON ?auto_134764 ?auto_134765 ) ( ON ?auto_134763 ?auto_134764 ) ( CLEAR ?auto_134763 ) ( HOLDING ?auto_134762 ) ( CLEAR ?auto_134761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134761 ?auto_134762 )
      ( MAKE-5PILE ?auto_134761 ?auto_134762 ?auto_134763 ?auto_134764 ?auto_134765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134770 - BLOCK
      ?auto_134771 - BLOCK
      ?auto_134772 - BLOCK
      ?auto_134773 - BLOCK
      ?auto_134774 - BLOCK
    )
    :vars
    (
      ?auto_134778 - BLOCK
      ?auto_134775 - BLOCK
      ?auto_134776 - BLOCK
      ?auto_134777 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134770 ) ( not ( = ?auto_134770 ?auto_134771 ) ) ( not ( = ?auto_134770 ?auto_134772 ) ) ( not ( = ?auto_134770 ?auto_134773 ) ) ( not ( = ?auto_134770 ?auto_134774 ) ) ( not ( = ?auto_134770 ?auto_134778 ) ) ( not ( = ?auto_134771 ?auto_134772 ) ) ( not ( = ?auto_134771 ?auto_134773 ) ) ( not ( = ?auto_134771 ?auto_134774 ) ) ( not ( = ?auto_134771 ?auto_134778 ) ) ( not ( = ?auto_134772 ?auto_134773 ) ) ( not ( = ?auto_134772 ?auto_134774 ) ) ( not ( = ?auto_134772 ?auto_134778 ) ) ( not ( = ?auto_134773 ?auto_134774 ) ) ( not ( = ?auto_134773 ?auto_134778 ) ) ( not ( = ?auto_134774 ?auto_134778 ) ) ( not ( = ?auto_134770 ?auto_134775 ) ) ( not ( = ?auto_134770 ?auto_134776 ) ) ( not ( = ?auto_134771 ?auto_134775 ) ) ( not ( = ?auto_134771 ?auto_134776 ) ) ( not ( = ?auto_134772 ?auto_134775 ) ) ( not ( = ?auto_134772 ?auto_134776 ) ) ( not ( = ?auto_134773 ?auto_134775 ) ) ( not ( = ?auto_134773 ?auto_134776 ) ) ( not ( = ?auto_134774 ?auto_134775 ) ) ( not ( = ?auto_134774 ?auto_134776 ) ) ( not ( = ?auto_134778 ?auto_134775 ) ) ( not ( = ?auto_134778 ?auto_134776 ) ) ( not ( = ?auto_134775 ?auto_134776 ) ) ( ON ?auto_134776 ?auto_134777 ) ( not ( = ?auto_134770 ?auto_134777 ) ) ( not ( = ?auto_134771 ?auto_134777 ) ) ( not ( = ?auto_134772 ?auto_134777 ) ) ( not ( = ?auto_134773 ?auto_134777 ) ) ( not ( = ?auto_134774 ?auto_134777 ) ) ( not ( = ?auto_134778 ?auto_134777 ) ) ( not ( = ?auto_134775 ?auto_134777 ) ) ( not ( = ?auto_134776 ?auto_134777 ) ) ( ON ?auto_134775 ?auto_134776 ) ( ON-TABLE ?auto_134777 ) ( ON ?auto_134778 ?auto_134775 ) ( ON ?auto_134774 ?auto_134778 ) ( ON ?auto_134773 ?auto_134774 ) ( ON ?auto_134772 ?auto_134773 ) ( CLEAR ?auto_134770 ) ( ON ?auto_134771 ?auto_134772 ) ( CLEAR ?auto_134771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134777 ?auto_134776 ?auto_134775 ?auto_134778 ?auto_134774 ?auto_134773 ?auto_134772 )
      ( MAKE-5PILE ?auto_134770 ?auto_134771 ?auto_134772 ?auto_134773 ?auto_134774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134779 - BLOCK
      ?auto_134780 - BLOCK
      ?auto_134781 - BLOCK
      ?auto_134782 - BLOCK
      ?auto_134783 - BLOCK
    )
    :vars
    (
      ?auto_134784 - BLOCK
      ?auto_134785 - BLOCK
      ?auto_134787 - BLOCK
      ?auto_134786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134779 ?auto_134780 ) ) ( not ( = ?auto_134779 ?auto_134781 ) ) ( not ( = ?auto_134779 ?auto_134782 ) ) ( not ( = ?auto_134779 ?auto_134783 ) ) ( not ( = ?auto_134779 ?auto_134784 ) ) ( not ( = ?auto_134780 ?auto_134781 ) ) ( not ( = ?auto_134780 ?auto_134782 ) ) ( not ( = ?auto_134780 ?auto_134783 ) ) ( not ( = ?auto_134780 ?auto_134784 ) ) ( not ( = ?auto_134781 ?auto_134782 ) ) ( not ( = ?auto_134781 ?auto_134783 ) ) ( not ( = ?auto_134781 ?auto_134784 ) ) ( not ( = ?auto_134782 ?auto_134783 ) ) ( not ( = ?auto_134782 ?auto_134784 ) ) ( not ( = ?auto_134783 ?auto_134784 ) ) ( not ( = ?auto_134779 ?auto_134785 ) ) ( not ( = ?auto_134779 ?auto_134787 ) ) ( not ( = ?auto_134780 ?auto_134785 ) ) ( not ( = ?auto_134780 ?auto_134787 ) ) ( not ( = ?auto_134781 ?auto_134785 ) ) ( not ( = ?auto_134781 ?auto_134787 ) ) ( not ( = ?auto_134782 ?auto_134785 ) ) ( not ( = ?auto_134782 ?auto_134787 ) ) ( not ( = ?auto_134783 ?auto_134785 ) ) ( not ( = ?auto_134783 ?auto_134787 ) ) ( not ( = ?auto_134784 ?auto_134785 ) ) ( not ( = ?auto_134784 ?auto_134787 ) ) ( not ( = ?auto_134785 ?auto_134787 ) ) ( ON ?auto_134787 ?auto_134786 ) ( not ( = ?auto_134779 ?auto_134786 ) ) ( not ( = ?auto_134780 ?auto_134786 ) ) ( not ( = ?auto_134781 ?auto_134786 ) ) ( not ( = ?auto_134782 ?auto_134786 ) ) ( not ( = ?auto_134783 ?auto_134786 ) ) ( not ( = ?auto_134784 ?auto_134786 ) ) ( not ( = ?auto_134785 ?auto_134786 ) ) ( not ( = ?auto_134787 ?auto_134786 ) ) ( ON ?auto_134785 ?auto_134787 ) ( ON-TABLE ?auto_134786 ) ( ON ?auto_134784 ?auto_134785 ) ( ON ?auto_134783 ?auto_134784 ) ( ON ?auto_134782 ?auto_134783 ) ( ON ?auto_134781 ?auto_134782 ) ( ON ?auto_134780 ?auto_134781 ) ( CLEAR ?auto_134780 ) ( HOLDING ?auto_134779 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134779 )
      ( MAKE-5PILE ?auto_134779 ?auto_134780 ?auto_134781 ?auto_134782 ?auto_134783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_134788 - BLOCK
      ?auto_134789 - BLOCK
      ?auto_134790 - BLOCK
      ?auto_134791 - BLOCK
      ?auto_134792 - BLOCK
    )
    :vars
    (
      ?auto_134795 - BLOCK
      ?auto_134793 - BLOCK
      ?auto_134794 - BLOCK
      ?auto_134796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134788 ?auto_134789 ) ) ( not ( = ?auto_134788 ?auto_134790 ) ) ( not ( = ?auto_134788 ?auto_134791 ) ) ( not ( = ?auto_134788 ?auto_134792 ) ) ( not ( = ?auto_134788 ?auto_134795 ) ) ( not ( = ?auto_134789 ?auto_134790 ) ) ( not ( = ?auto_134789 ?auto_134791 ) ) ( not ( = ?auto_134789 ?auto_134792 ) ) ( not ( = ?auto_134789 ?auto_134795 ) ) ( not ( = ?auto_134790 ?auto_134791 ) ) ( not ( = ?auto_134790 ?auto_134792 ) ) ( not ( = ?auto_134790 ?auto_134795 ) ) ( not ( = ?auto_134791 ?auto_134792 ) ) ( not ( = ?auto_134791 ?auto_134795 ) ) ( not ( = ?auto_134792 ?auto_134795 ) ) ( not ( = ?auto_134788 ?auto_134793 ) ) ( not ( = ?auto_134788 ?auto_134794 ) ) ( not ( = ?auto_134789 ?auto_134793 ) ) ( not ( = ?auto_134789 ?auto_134794 ) ) ( not ( = ?auto_134790 ?auto_134793 ) ) ( not ( = ?auto_134790 ?auto_134794 ) ) ( not ( = ?auto_134791 ?auto_134793 ) ) ( not ( = ?auto_134791 ?auto_134794 ) ) ( not ( = ?auto_134792 ?auto_134793 ) ) ( not ( = ?auto_134792 ?auto_134794 ) ) ( not ( = ?auto_134795 ?auto_134793 ) ) ( not ( = ?auto_134795 ?auto_134794 ) ) ( not ( = ?auto_134793 ?auto_134794 ) ) ( ON ?auto_134794 ?auto_134796 ) ( not ( = ?auto_134788 ?auto_134796 ) ) ( not ( = ?auto_134789 ?auto_134796 ) ) ( not ( = ?auto_134790 ?auto_134796 ) ) ( not ( = ?auto_134791 ?auto_134796 ) ) ( not ( = ?auto_134792 ?auto_134796 ) ) ( not ( = ?auto_134795 ?auto_134796 ) ) ( not ( = ?auto_134793 ?auto_134796 ) ) ( not ( = ?auto_134794 ?auto_134796 ) ) ( ON ?auto_134793 ?auto_134794 ) ( ON-TABLE ?auto_134796 ) ( ON ?auto_134795 ?auto_134793 ) ( ON ?auto_134792 ?auto_134795 ) ( ON ?auto_134791 ?auto_134792 ) ( ON ?auto_134790 ?auto_134791 ) ( ON ?auto_134789 ?auto_134790 ) ( ON ?auto_134788 ?auto_134789 ) ( CLEAR ?auto_134788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134796 ?auto_134794 ?auto_134793 ?auto_134795 ?auto_134792 ?auto_134791 ?auto_134790 ?auto_134789 )
      ( MAKE-5PILE ?auto_134788 ?auto_134789 ?auto_134790 ?auto_134791 ?auto_134792 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134800 - BLOCK
      ?auto_134801 - BLOCK
      ?auto_134802 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_134802 ) ( CLEAR ?auto_134801 ) ( ON-TABLE ?auto_134800 ) ( ON ?auto_134801 ?auto_134800 ) ( not ( = ?auto_134800 ?auto_134801 ) ) ( not ( = ?auto_134800 ?auto_134802 ) ) ( not ( = ?auto_134801 ?auto_134802 ) ) )
    :subtasks
    ( ( !STACK ?auto_134802 ?auto_134801 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134803 - BLOCK
      ?auto_134804 - BLOCK
      ?auto_134805 - BLOCK
    )
    :vars
    (
      ?auto_134806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134804 ) ( ON-TABLE ?auto_134803 ) ( ON ?auto_134804 ?auto_134803 ) ( not ( = ?auto_134803 ?auto_134804 ) ) ( not ( = ?auto_134803 ?auto_134805 ) ) ( not ( = ?auto_134804 ?auto_134805 ) ) ( ON ?auto_134805 ?auto_134806 ) ( CLEAR ?auto_134805 ) ( HAND-EMPTY ) ( not ( = ?auto_134803 ?auto_134806 ) ) ( not ( = ?auto_134804 ?auto_134806 ) ) ( not ( = ?auto_134805 ?auto_134806 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134805 ?auto_134806 )
      ( MAKE-3PILE ?auto_134803 ?auto_134804 ?auto_134805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134807 - BLOCK
      ?auto_134808 - BLOCK
      ?auto_134809 - BLOCK
    )
    :vars
    (
      ?auto_134810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134807 ) ( not ( = ?auto_134807 ?auto_134808 ) ) ( not ( = ?auto_134807 ?auto_134809 ) ) ( not ( = ?auto_134808 ?auto_134809 ) ) ( ON ?auto_134809 ?auto_134810 ) ( CLEAR ?auto_134809 ) ( not ( = ?auto_134807 ?auto_134810 ) ) ( not ( = ?auto_134808 ?auto_134810 ) ) ( not ( = ?auto_134809 ?auto_134810 ) ) ( HOLDING ?auto_134808 ) ( CLEAR ?auto_134807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134807 ?auto_134808 )
      ( MAKE-3PILE ?auto_134807 ?auto_134808 ?auto_134809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134811 - BLOCK
      ?auto_134812 - BLOCK
      ?auto_134813 - BLOCK
    )
    :vars
    (
      ?auto_134814 - BLOCK
      ?auto_134817 - BLOCK
      ?auto_134815 - BLOCK
      ?auto_134818 - BLOCK
      ?auto_134816 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_134811 ) ( not ( = ?auto_134811 ?auto_134812 ) ) ( not ( = ?auto_134811 ?auto_134813 ) ) ( not ( = ?auto_134812 ?auto_134813 ) ) ( ON ?auto_134813 ?auto_134814 ) ( not ( = ?auto_134811 ?auto_134814 ) ) ( not ( = ?auto_134812 ?auto_134814 ) ) ( not ( = ?auto_134813 ?auto_134814 ) ) ( CLEAR ?auto_134811 ) ( ON ?auto_134812 ?auto_134813 ) ( CLEAR ?auto_134812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134817 ) ( ON ?auto_134815 ?auto_134817 ) ( ON ?auto_134818 ?auto_134815 ) ( ON ?auto_134816 ?auto_134818 ) ( ON ?auto_134814 ?auto_134816 ) ( not ( = ?auto_134817 ?auto_134815 ) ) ( not ( = ?auto_134817 ?auto_134818 ) ) ( not ( = ?auto_134817 ?auto_134816 ) ) ( not ( = ?auto_134817 ?auto_134814 ) ) ( not ( = ?auto_134817 ?auto_134813 ) ) ( not ( = ?auto_134817 ?auto_134812 ) ) ( not ( = ?auto_134815 ?auto_134818 ) ) ( not ( = ?auto_134815 ?auto_134816 ) ) ( not ( = ?auto_134815 ?auto_134814 ) ) ( not ( = ?auto_134815 ?auto_134813 ) ) ( not ( = ?auto_134815 ?auto_134812 ) ) ( not ( = ?auto_134818 ?auto_134816 ) ) ( not ( = ?auto_134818 ?auto_134814 ) ) ( not ( = ?auto_134818 ?auto_134813 ) ) ( not ( = ?auto_134818 ?auto_134812 ) ) ( not ( = ?auto_134816 ?auto_134814 ) ) ( not ( = ?auto_134816 ?auto_134813 ) ) ( not ( = ?auto_134816 ?auto_134812 ) ) ( not ( = ?auto_134811 ?auto_134817 ) ) ( not ( = ?auto_134811 ?auto_134815 ) ) ( not ( = ?auto_134811 ?auto_134818 ) ) ( not ( = ?auto_134811 ?auto_134816 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134817 ?auto_134815 ?auto_134818 ?auto_134816 ?auto_134814 ?auto_134813 )
      ( MAKE-3PILE ?auto_134811 ?auto_134812 ?auto_134813 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134819 - BLOCK
      ?auto_134820 - BLOCK
      ?auto_134821 - BLOCK
    )
    :vars
    (
      ?auto_134825 - BLOCK
      ?auto_134823 - BLOCK
      ?auto_134826 - BLOCK
      ?auto_134824 - BLOCK
      ?auto_134822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134819 ?auto_134820 ) ) ( not ( = ?auto_134819 ?auto_134821 ) ) ( not ( = ?auto_134820 ?auto_134821 ) ) ( ON ?auto_134821 ?auto_134825 ) ( not ( = ?auto_134819 ?auto_134825 ) ) ( not ( = ?auto_134820 ?auto_134825 ) ) ( not ( = ?auto_134821 ?auto_134825 ) ) ( ON ?auto_134820 ?auto_134821 ) ( CLEAR ?auto_134820 ) ( ON-TABLE ?auto_134823 ) ( ON ?auto_134826 ?auto_134823 ) ( ON ?auto_134824 ?auto_134826 ) ( ON ?auto_134822 ?auto_134824 ) ( ON ?auto_134825 ?auto_134822 ) ( not ( = ?auto_134823 ?auto_134826 ) ) ( not ( = ?auto_134823 ?auto_134824 ) ) ( not ( = ?auto_134823 ?auto_134822 ) ) ( not ( = ?auto_134823 ?auto_134825 ) ) ( not ( = ?auto_134823 ?auto_134821 ) ) ( not ( = ?auto_134823 ?auto_134820 ) ) ( not ( = ?auto_134826 ?auto_134824 ) ) ( not ( = ?auto_134826 ?auto_134822 ) ) ( not ( = ?auto_134826 ?auto_134825 ) ) ( not ( = ?auto_134826 ?auto_134821 ) ) ( not ( = ?auto_134826 ?auto_134820 ) ) ( not ( = ?auto_134824 ?auto_134822 ) ) ( not ( = ?auto_134824 ?auto_134825 ) ) ( not ( = ?auto_134824 ?auto_134821 ) ) ( not ( = ?auto_134824 ?auto_134820 ) ) ( not ( = ?auto_134822 ?auto_134825 ) ) ( not ( = ?auto_134822 ?auto_134821 ) ) ( not ( = ?auto_134822 ?auto_134820 ) ) ( not ( = ?auto_134819 ?auto_134823 ) ) ( not ( = ?auto_134819 ?auto_134826 ) ) ( not ( = ?auto_134819 ?auto_134824 ) ) ( not ( = ?auto_134819 ?auto_134822 ) ) ( HOLDING ?auto_134819 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134819 )
      ( MAKE-3PILE ?auto_134819 ?auto_134820 ?auto_134821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134827 - BLOCK
      ?auto_134828 - BLOCK
      ?auto_134829 - BLOCK
    )
    :vars
    (
      ?auto_134832 - BLOCK
      ?auto_134833 - BLOCK
      ?auto_134830 - BLOCK
      ?auto_134834 - BLOCK
      ?auto_134831 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134827 ?auto_134828 ) ) ( not ( = ?auto_134827 ?auto_134829 ) ) ( not ( = ?auto_134828 ?auto_134829 ) ) ( ON ?auto_134829 ?auto_134832 ) ( not ( = ?auto_134827 ?auto_134832 ) ) ( not ( = ?auto_134828 ?auto_134832 ) ) ( not ( = ?auto_134829 ?auto_134832 ) ) ( ON ?auto_134828 ?auto_134829 ) ( ON-TABLE ?auto_134833 ) ( ON ?auto_134830 ?auto_134833 ) ( ON ?auto_134834 ?auto_134830 ) ( ON ?auto_134831 ?auto_134834 ) ( ON ?auto_134832 ?auto_134831 ) ( not ( = ?auto_134833 ?auto_134830 ) ) ( not ( = ?auto_134833 ?auto_134834 ) ) ( not ( = ?auto_134833 ?auto_134831 ) ) ( not ( = ?auto_134833 ?auto_134832 ) ) ( not ( = ?auto_134833 ?auto_134829 ) ) ( not ( = ?auto_134833 ?auto_134828 ) ) ( not ( = ?auto_134830 ?auto_134834 ) ) ( not ( = ?auto_134830 ?auto_134831 ) ) ( not ( = ?auto_134830 ?auto_134832 ) ) ( not ( = ?auto_134830 ?auto_134829 ) ) ( not ( = ?auto_134830 ?auto_134828 ) ) ( not ( = ?auto_134834 ?auto_134831 ) ) ( not ( = ?auto_134834 ?auto_134832 ) ) ( not ( = ?auto_134834 ?auto_134829 ) ) ( not ( = ?auto_134834 ?auto_134828 ) ) ( not ( = ?auto_134831 ?auto_134832 ) ) ( not ( = ?auto_134831 ?auto_134829 ) ) ( not ( = ?auto_134831 ?auto_134828 ) ) ( not ( = ?auto_134827 ?auto_134833 ) ) ( not ( = ?auto_134827 ?auto_134830 ) ) ( not ( = ?auto_134827 ?auto_134834 ) ) ( not ( = ?auto_134827 ?auto_134831 ) ) ( ON ?auto_134827 ?auto_134828 ) ( CLEAR ?auto_134827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134833 ?auto_134830 ?auto_134834 ?auto_134831 ?auto_134832 ?auto_134829 ?auto_134828 )
      ( MAKE-3PILE ?auto_134827 ?auto_134828 ?auto_134829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134835 - BLOCK
      ?auto_134836 - BLOCK
      ?auto_134837 - BLOCK
    )
    :vars
    (
      ?auto_134839 - BLOCK
      ?auto_134842 - BLOCK
      ?auto_134841 - BLOCK
      ?auto_134838 - BLOCK
      ?auto_134840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134835 ?auto_134836 ) ) ( not ( = ?auto_134835 ?auto_134837 ) ) ( not ( = ?auto_134836 ?auto_134837 ) ) ( ON ?auto_134837 ?auto_134839 ) ( not ( = ?auto_134835 ?auto_134839 ) ) ( not ( = ?auto_134836 ?auto_134839 ) ) ( not ( = ?auto_134837 ?auto_134839 ) ) ( ON ?auto_134836 ?auto_134837 ) ( ON-TABLE ?auto_134842 ) ( ON ?auto_134841 ?auto_134842 ) ( ON ?auto_134838 ?auto_134841 ) ( ON ?auto_134840 ?auto_134838 ) ( ON ?auto_134839 ?auto_134840 ) ( not ( = ?auto_134842 ?auto_134841 ) ) ( not ( = ?auto_134842 ?auto_134838 ) ) ( not ( = ?auto_134842 ?auto_134840 ) ) ( not ( = ?auto_134842 ?auto_134839 ) ) ( not ( = ?auto_134842 ?auto_134837 ) ) ( not ( = ?auto_134842 ?auto_134836 ) ) ( not ( = ?auto_134841 ?auto_134838 ) ) ( not ( = ?auto_134841 ?auto_134840 ) ) ( not ( = ?auto_134841 ?auto_134839 ) ) ( not ( = ?auto_134841 ?auto_134837 ) ) ( not ( = ?auto_134841 ?auto_134836 ) ) ( not ( = ?auto_134838 ?auto_134840 ) ) ( not ( = ?auto_134838 ?auto_134839 ) ) ( not ( = ?auto_134838 ?auto_134837 ) ) ( not ( = ?auto_134838 ?auto_134836 ) ) ( not ( = ?auto_134840 ?auto_134839 ) ) ( not ( = ?auto_134840 ?auto_134837 ) ) ( not ( = ?auto_134840 ?auto_134836 ) ) ( not ( = ?auto_134835 ?auto_134842 ) ) ( not ( = ?auto_134835 ?auto_134841 ) ) ( not ( = ?auto_134835 ?auto_134838 ) ) ( not ( = ?auto_134835 ?auto_134840 ) ) ( HOLDING ?auto_134835 ) ( CLEAR ?auto_134836 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134842 ?auto_134841 ?auto_134838 ?auto_134840 ?auto_134839 ?auto_134837 ?auto_134836 ?auto_134835 )
      ( MAKE-3PILE ?auto_134835 ?auto_134836 ?auto_134837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134843 - BLOCK
      ?auto_134844 - BLOCK
      ?auto_134845 - BLOCK
    )
    :vars
    (
      ?auto_134849 - BLOCK
      ?auto_134848 - BLOCK
      ?auto_134850 - BLOCK
      ?auto_134846 - BLOCK
      ?auto_134847 - BLOCK
      ?auto_134851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134843 ?auto_134844 ) ) ( not ( = ?auto_134843 ?auto_134845 ) ) ( not ( = ?auto_134844 ?auto_134845 ) ) ( ON ?auto_134845 ?auto_134849 ) ( not ( = ?auto_134843 ?auto_134849 ) ) ( not ( = ?auto_134844 ?auto_134849 ) ) ( not ( = ?auto_134845 ?auto_134849 ) ) ( ON ?auto_134844 ?auto_134845 ) ( ON-TABLE ?auto_134848 ) ( ON ?auto_134850 ?auto_134848 ) ( ON ?auto_134846 ?auto_134850 ) ( ON ?auto_134847 ?auto_134846 ) ( ON ?auto_134849 ?auto_134847 ) ( not ( = ?auto_134848 ?auto_134850 ) ) ( not ( = ?auto_134848 ?auto_134846 ) ) ( not ( = ?auto_134848 ?auto_134847 ) ) ( not ( = ?auto_134848 ?auto_134849 ) ) ( not ( = ?auto_134848 ?auto_134845 ) ) ( not ( = ?auto_134848 ?auto_134844 ) ) ( not ( = ?auto_134850 ?auto_134846 ) ) ( not ( = ?auto_134850 ?auto_134847 ) ) ( not ( = ?auto_134850 ?auto_134849 ) ) ( not ( = ?auto_134850 ?auto_134845 ) ) ( not ( = ?auto_134850 ?auto_134844 ) ) ( not ( = ?auto_134846 ?auto_134847 ) ) ( not ( = ?auto_134846 ?auto_134849 ) ) ( not ( = ?auto_134846 ?auto_134845 ) ) ( not ( = ?auto_134846 ?auto_134844 ) ) ( not ( = ?auto_134847 ?auto_134849 ) ) ( not ( = ?auto_134847 ?auto_134845 ) ) ( not ( = ?auto_134847 ?auto_134844 ) ) ( not ( = ?auto_134843 ?auto_134848 ) ) ( not ( = ?auto_134843 ?auto_134850 ) ) ( not ( = ?auto_134843 ?auto_134846 ) ) ( not ( = ?auto_134843 ?auto_134847 ) ) ( CLEAR ?auto_134844 ) ( ON ?auto_134843 ?auto_134851 ) ( CLEAR ?auto_134843 ) ( HAND-EMPTY ) ( not ( = ?auto_134843 ?auto_134851 ) ) ( not ( = ?auto_134844 ?auto_134851 ) ) ( not ( = ?auto_134845 ?auto_134851 ) ) ( not ( = ?auto_134849 ?auto_134851 ) ) ( not ( = ?auto_134848 ?auto_134851 ) ) ( not ( = ?auto_134850 ?auto_134851 ) ) ( not ( = ?auto_134846 ?auto_134851 ) ) ( not ( = ?auto_134847 ?auto_134851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134843 ?auto_134851 )
      ( MAKE-3PILE ?auto_134843 ?auto_134844 ?auto_134845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134852 - BLOCK
      ?auto_134853 - BLOCK
      ?auto_134854 - BLOCK
    )
    :vars
    (
      ?auto_134859 - BLOCK
      ?auto_134855 - BLOCK
      ?auto_134860 - BLOCK
      ?auto_134856 - BLOCK
      ?auto_134858 - BLOCK
      ?auto_134857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134852 ?auto_134853 ) ) ( not ( = ?auto_134852 ?auto_134854 ) ) ( not ( = ?auto_134853 ?auto_134854 ) ) ( ON ?auto_134854 ?auto_134859 ) ( not ( = ?auto_134852 ?auto_134859 ) ) ( not ( = ?auto_134853 ?auto_134859 ) ) ( not ( = ?auto_134854 ?auto_134859 ) ) ( ON-TABLE ?auto_134855 ) ( ON ?auto_134860 ?auto_134855 ) ( ON ?auto_134856 ?auto_134860 ) ( ON ?auto_134858 ?auto_134856 ) ( ON ?auto_134859 ?auto_134858 ) ( not ( = ?auto_134855 ?auto_134860 ) ) ( not ( = ?auto_134855 ?auto_134856 ) ) ( not ( = ?auto_134855 ?auto_134858 ) ) ( not ( = ?auto_134855 ?auto_134859 ) ) ( not ( = ?auto_134855 ?auto_134854 ) ) ( not ( = ?auto_134855 ?auto_134853 ) ) ( not ( = ?auto_134860 ?auto_134856 ) ) ( not ( = ?auto_134860 ?auto_134858 ) ) ( not ( = ?auto_134860 ?auto_134859 ) ) ( not ( = ?auto_134860 ?auto_134854 ) ) ( not ( = ?auto_134860 ?auto_134853 ) ) ( not ( = ?auto_134856 ?auto_134858 ) ) ( not ( = ?auto_134856 ?auto_134859 ) ) ( not ( = ?auto_134856 ?auto_134854 ) ) ( not ( = ?auto_134856 ?auto_134853 ) ) ( not ( = ?auto_134858 ?auto_134859 ) ) ( not ( = ?auto_134858 ?auto_134854 ) ) ( not ( = ?auto_134858 ?auto_134853 ) ) ( not ( = ?auto_134852 ?auto_134855 ) ) ( not ( = ?auto_134852 ?auto_134860 ) ) ( not ( = ?auto_134852 ?auto_134856 ) ) ( not ( = ?auto_134852 ?auto_134858 ) ) ( ON ?auto_134852 ?auto_134857 ) ( CLEAR ?auto_134852 ) ( not ( = ?auto_134852 ?auto_134857 ) ) ( not ( = ?auto_134853 ?auto_134857 ) ) ( not ( = ?auto_134854 ?auto_134857 ) ) ( not ( = ?auto_134859 ?auto_134857 ) ) ( not ( = ?auto_134855 ?auto_134857 ) ) ( not ( = ?auto_134860 ?auto_134857 ) ) ( not ( = ?auto_134856 ?auto_134857 ) ) ( not ( = ?auto_134858 ?auto_134857 ) ) ( HOLDING ?auto_134853 ) ( CLEAR ?auto_134854 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134855 ?auto_134860 ?auto_134856 ?auto_134858 ?auto_134859 ?auto_134854 ?auto_134853 )
      ( MAKE-3PILE ?auto_134852 ?auto_134853 ?auto_134854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134861 - BLOCK
      ?auto_134862 - BLOCK
      ?auto_134863 - BLOCK
    )
    :vars
    (
      ?auto_134867 - BLOCK
      ?auto_134866 - BLOCK
      ?auto_134865 - BLOCK
      ?auto_134869 - BLOCK
      ?auto_134868 - BLOCK
      ?auto_134864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134861 ?auto_134862 ) ) ( not ( = ?auto_134861 ?auto_134863 ) ) ( not ( = ?auto_134862 ?auto_134863 ) ) ( ON ?auto_134863 ?auto_134867 ) ( not ( = ?auto_134861 ?auto_134867 ) ) ( not ( = ?auto_134862 ?auto_134867 ) ) ( not ( = ?auto_134863 ?auto_134867 ) ) ( ON-TABLE ?auto_134866 ) ( ON ?auto_134865 ?auto_134866 ) ( ON ?auto_134869 ?auto_134865 ) ( ON ?auto_134868 ?auto_134869 ) ( ON ?auto_134867 ?auto_134868 ) ( not ( = ?auto_134866 ?auto_134865 ) ) ( not ( = ?auto_134866 ?auto_134869 ) ) ( not ( = ?auto_134866 ?auto_134868 ) ) ( not ( = ?auto_134866 ?auto_134867 ) ) ( not ( = ?auto_134866 ?auto_134863 ) ) ( not ( = ?auto_134866 ?auto_134862 ) ) ( not ( = ?auto_134865 ?auto_134869 ) ) ( not ( = ?auto_134865 ?auto_134868 ) ) ( not ( = ?auto_134865 ?auto_134867 ) ) ( not ( = ?auto_134865 ?auto_134863 ) ) ( not ( = ?auto_134865 ?auto_134862 ) ) ( not ( = ?auto_134869 ?auto_134868 ) ) ( not ( = ?auto_134869 ?auto_134867 ) ) ( not ( = ?auto_134869 ?auto_134863 ) ) ( not ( = ?auto_134869 ?auto_134862 ) ) ( not ( = ?auto_134868 ?auto_134867 ) ) ( not ( = ?auto_134868 ?auto_134863 ) ) ( not ( = ?auto_134868 ?auto_134862 ) ) ( not ( = ?auto_134861 ?auto_134866 ) ) ( not ( = ?auto_134861 ?auto_134865 ) ) ( not ( = ?auto_134861 ?auto_134869 ) ) ( not ( = ?auto_134861 ?auto_134868 ) ) ( ON ?auto_134861 ?auto_134864 ) ( not ( = ?auto_134861 ?auto_134864 ) ) ( not ( = ?auto_134862 ?auto_134864 ) ) ( not ( = ?auto_134863 ?auto_134864 ) ) ( not ( = ?auto_134867 ?auto_134864 ) ) ( not ( = ?auto_134866 ?auto_134864 ) ) ( not ( = ?auto_134865 ?auto_134864 ) ) ( not ( = ?auto_134869 ?auto_134864 ) ) ( not ( = ?auto_134868 ?auto_134864 ) ) ( CLEAR ?auto_134863 ) ( ON ?auto_134862 ?auto_134861 ) ( CLEAR ?auto_134862 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134864 ?auto_134861 )
      ( MAKE-3PILE ?auto_134861 ?auto_134862 ?auto_134863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134870 - BLOCK
      ?auto_134871 - BLOCK
      ?auto_134872 - BLOCK
    )
    :vars
    (
      ?auto_134876 - BLOCK
      ?auto_134874 - BLOCK
      ?auto_134878 - BLOCK
      ?auto_134877 - BLOCK
      ?auto_134873 - BLOCK
      ?auto_134875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134870 ?auto_134871 ) ) ( not ( = ?auto_134870 ?auto_134872 ) ) ( not ( = ?auto_134871 ?auto_134872 ) ) ( not ( = ?auto_134870 ?auto_134876 ) ) ( not ( = ?auto_134871 ?auto_134876 ) ) ( not ( = ?auto_134872 ?auto_134876 ) ) ( ON-TABLE ?auto_134874 ) ( ON ?auto_134878 ?auto_134874 ) ( ON ?auto_134877 ?auto_134878 ) ( ON ?auto_134873 ?auto_134877 ) ( ON ?auto_134876 ?auto_134873 ) ( not ( = ?auto_134874 ?auto_134878 ) ) ( not ( = ?auto_134874 ?auto_134877 ) ) ( not ( = ?auto_134874 ?auto_134873 ) ) ( not ( = ?auto_134874 ?auto_134876 ) ) ( not ( = ?auto_134874 ?auto_134872 ) ) ( not ( = ?auto_134874 ?auto_134871 ) ) ( not ( = ?auto_134878 ?auto_134877 ) ) ( not ( = ?auto_134878 ?auto_134873 ) ) ( not ( = ?auto_134878 ?auto_134876 ) ) ( not ( = ?auto_134878 ?auto_134872 ) ) ( not ( = ?auto_134878 ?auto_134871 ) ) ( not ( = ?auto_134877 ?auto_134873 ) ) ( not ( = ?auto_134877 ?auto_134876 ) ) ( not ( = ?auto_134877 ?auto_134872 ) ) ( not ( = ?auto_134877 ?auto_134871 ) ) ( not ( = ?auto_134873 ?auto_134876 ) ) ( not ( = ?auto_134873 ?auto_134872 ) ) ( not ( = ?auto_134873 ?auto_134871 ) ) ( not ( = ?auto_134870 ?auto_134874 ) ) ( not ( = ?auto_134870 ?auto_134878 ) ) ( not ( = ?auto_134870 ?auto_134877 ) ) ( not ( = ?auto_134870 ?auto_134873 ) ) ( ON ?auto_134870 ?auto_134875 ) ( not ( = ?auto_134870 ?auto_134875 ) ) ( not ( = ?auto_134871 ?auto_134875 ) ) ( not ( = ?auto_134872 ?auto_134875 ) ) ( not ( = ?auto_134876 ?auto_134875 ) ) ( not ( = ?auto_134874 ?auto_134875 ) ) ( not ( = ?auto_134878 ?auto_134875 ) ) ( not ( = ?auto_134877 ?auto_134875 ) ) ( not ( = ?auto_134873 ?auto_134875 ) ) ( ON ?auto_134871 ?auto_134870 ) ( CLEAR ?auto_134871 ) ( ON-TABLE ?auto_134875 ) ( HOLDING ?auto_134872 ) ( CLEAR ?auto_134876 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134874 ?auto_134878 ?auto_134877 ?auto_134873 ?auto_134876 ?auto_134872 )
      ( MAKE-3PILE ?auto_134870 ?auto_134871 ?auto_134872 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134879 - BLOCK
      ?auto_134880 - BLOCK
      ?auto_134881 - BLOCK
    )
    :vars
    (
      ?auto_134882 - BLOCK
      ?auto_134884 - BLOCK
      ?auto_134885 - BLOCK
      ?auto_134883 - BLOCK
      ?auto_134887 - BLOCK
      ?auto_134886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134879 ?auto_134880 ) ) ( not ( = ?auto_134879 ?auto_134881 ) ) ( not ( = ?auto_134880 ?auto_134881 ) ) ( not ( = ?auto_134879 ?auto_134882 ) ) ( not ( = ?auto_134880 ?auto_134882 ) ) ( not ( = ?auto_134881 ?auto_134882 ) ) ( ON-TABLE ?auto_134884 ) ( ON ?auto_134885 ?auto_134884 ) ( ON ?auto_134883 ?auto_134885 ) ( ON ?auto_134887 ?auto_134883 ) ( ON ?auto_134882 ?auto_134887 ) ( not ( = ?auto_134884 ?auto_134885 ) ) ( not ( = ?auto_134884 ?auto_134883 ) ) ( not ( = ?auto_134884 ?auto_134887 ) ) ( not ( = ?auto_134884 ?auto_134882 ) ) ( not ( = ?auto_134884 ?auto_134881 ) ) ( not ( = ?auto_134884 ?auto_134880 ) ) ( not ( = ?auto_134885 ?auto_134883 ) ) ( not ( = ?auto_134885 ?auto_134887 ) ) ( not ( = ?auto_134885 ?auto_134882 ) ) ( not ( = ?auto_134885 ?auto_134881 ) ) ( not ( = ?auto_134885 ?auto_134880 ) ) ( not ( = ?auto_134883 ?auto_134887 ) ) ( not ( = ?auto_134883 ?auto_134882 ) ) ( not ( = ?auto_134883 ?auto_134881 ) ) ( not ( = ?auto_134883 ?auto_134880 ) ) ( not ( = ?auto_134887 ?auto_134882 ) ) ( not ( = ?auto_134887 ?auto_134881 ) ) ( not ( = ?auto_134887 ?auto_134880 ) ) ( not ( = ?auto_134879 ?auto_134884 ) ) ( not ( = ?auto_134879 ?auto_134885 ) ) ( not ( = ?auto_134879 ?auto_134883 ) ) ( not ( = ?auto_134879 ?auto_134887 ) ) ( ON ?auto_134879 ?auto_134886 ) ( not ( = ?auto_134879 ?auto_134886 ) ) ( not ( = ?auto_134880 ?auto_134886 ) ) ( not ( = ?auto_134881 ?auto_134886 ) ) ( not ( = ?auto_134882 ?auto_134886 ) ) ( not ( = ?auto_134884 ?auto_134886 ) ) ( not ( = ?auto_134885 ?auto_134886 ) ) ( not ( = ?auto_134883 ?auto_134886 ) ) ( not ( = ?auto_134887 ?auto_134886 ) ) ( ON ?auto_134880 ?auto_134879 ) ( ON-TABLE ?auto_134886 ) ( CLEAR ?auto_134882 ) ( ON ?auto_134881 ?auto_134880 ) ( CLEAR ?auto_134881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134886 ?auto_134879 ?auto_134880 )
      ( MAKE-3PILE ?auto_134879 ?auto_134880 ?auto_134881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134888 - BLOCK
      ?auto_134889 - BLOCK
      ?auto_134890 - BLOCK
    )
    :vars
    (
      ?auto_134895 - BLOCK
      ?auto_134894 - BLOCK
      ?auto_134892 - BLOCK
      ?auto_134893 - BLOCK
      ?auto_134891 - BLOCK
      ?auto_134896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134888 ?auto_134889 ) ) ( not ( = ?auto_134888 ?auto_134890 ) ) ( not ( = ?auto_134889 ?auto_134890 ) ) ( not ( = ?auto_134888 ?auto_134895 ) ) ( not ( = ?auto_134889 ?auto_134895 ) ) ( not ( = ?auto_134890 ?auto_134895 ) ) ( ON-TABLE ?auto_134894 ) ( ON ?auto_134892 ?auto_134894 ) ( ON ?auto_134893 ?auto_134892 ) ( ON ?auto_134891 ?auto_134893 ) ( not ( = ?auto_134894 ?auto_134892 ) ) ( not ( = ?auto_134894 ?auto_134893 ) ) ( not ( = ?auto_134894 ?auto_134891 ) ) ( not ( = ?auto_134894 ?auto_134895 ) ) ( not ( = ?auto_134894 ?auto_134890 ) ) ( not ( = ?auto_134894 ?auto_134889 ) ) ( not ( = ?auto_134892 ?auto_134893 ) ) ( not ( = ?auto_134892 ?auto_134891 ) ) ( not ( = ?auto_134892 ?auto_134895 ) ) ( not ( = ?auto_134892 ?auto_134890 ) ) ( not ( = ?auto_134892 ?auto_134889 ) ) ( not ( = ?auto_134893 ?auto_134891 ) ) ( not ( = ?auto_134893 ?auto_134895 ) ) ( not ( = ?auto_134893 ?auto_134890 ) ) ( not ( = ?auto_134893 ?auto_134889 ) ) ( not ( = ?auto_134891 ?auto_134895 ) ) ( not ( = ?auto_134891 ?auto_134890 ) ) ( not ( = ?auto_134891 ?auto_134889 ) ) ( not ( = ?auto_134888 ?auto_134894 ) ) ( not ( = ?auto_134888 ?auto_134892 ) ) ( not ( = ?auto_134888 ?auto_134893 ) ) ( not ( = ?auto_134888 ?auto_134891 ) ) ( ON ?auto_134888 ?auto_134896 ) ( not ( = ?auto_134888 ?auto_134896 ) ) ( not ( = ?auto_134889 ?auto_134896 ) ) ( not ( = ?auto_134890 ?auto_134896 ) ) ( not ( = ?auto_134895 ?auto_134896 ) ) ( not ( = ?auto_134894 ?auto_134896 ) ) ( not ( = ?auto_134892 ?auto_134896 ) ) ( not ( = ?auto_134893 ?auto_134896 ) ) ( not ( = ?auto_134891 ?auto_134896 ) ) ( ON ?auto_134889 ?auto_134888 ) ( ON-TABLE ?auto_134896 ) ( ON ?auto_134890 ?auto_134889 ) ( CLEAR ?auto_134890 ) ( HOLDING ?auto_134895 ) ( CLEAR ?auto_134891 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134894 ?auto_134892 ?auto_134893 ?auto_134891 ?auto_134895 )
      ( MAKE-3PILE ?auto_134888 ?auto_134889 ?auto_134890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134897 - BLOCK
      ?auto_134898 - BLOCK
      ?auto_134899 - BLOCK
    )
    :vars
    (
      ?auto_134903 - BLOCK
      ?auto_134900 - BLOCK
      ?auto_134902 - BLOCK
      ?auto_134901 - BLOCK
      ?auto_134905 - BLOCK
      ?auto_134904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134897 ?auto_134898 ) ) ( not ( = ?auto_134897 ?auto_134899 ) ) ( not ( = ?auto_134898 ?auto_134899 ) ) ( not ( = ?auto_134897 ?auto_134903 ) ) ( not ( = ?auto_134898 ?auto_134903 ) ) ( not ( = ?auto_134899 ?auto_134903 ) ) ( ON-TABLE ?auto_134900 ) ( ON ?auto_134902 ?auto_134900 ) ( ON ?auto_134901 ?auto_134902 ) ( ON ?auto_134905 ?auto_134901 ) ( not ( = ?auto_134900 ?auto_134902 ) ) ( not ( = ?auto_134900 ?auto_134901 ) ) ( not ( = ?auto_134900 ?auto_134905 ) ) ( not ( = ?auto_134900 ?auto_134903 ) ) ( not ( = ?auto_134900 ?auto_134899 ) ) ( not ( = ?auto_134900 ?auto_134898 ) ) ( not ( = ?auto_134902 ?auto_134901 ) ) ( not ( = ?auto_134902 ?auto_134905 ) ) ( not ( = ?auto_134902 ?auto_134903 ) ) ( not ( = ?auto_134902 ?auto_134899 ) ) ( not ( = ?auto_134902 ?auto_134898 ) ) ( not ( = ?auto_134901 ?auto_134905 ) ) ( not ( = ?auto_134901 ?auto_134903 ) ) ( not ( = ?auto_134901 ?auto_134899 ) ) ( not ( = ?auto_134901 ?auto_134898 ) ) ( not ( = ?auto_134905 ?auto_134903 ) ) ( not ( = ?auto_134905 ?auto_134899 ) ) ( not ( = ?auto_134905 ?auto_134898 ) ) ( not ( = ?auto_134897 ?auto_134900 ) ) ( not ( = ?auto_134897 ?auto_134902 ) ) ( not ( = ?auto_134897 ?auto_134901 ) ) ( not ( = ?auto_134897 ?auto_134905 ) ) ( ON ?auto_134897 ?auto_134904 ) ( not ( = ?auto_134897 ?auto_134904 ) ) ( not ( = ?auto_134898 ?auto_134904 ) ) ( not ( = ?auto_134899 ?auto_134904 ) ) ( not ( = ?auto_134903 ?auto_134904 ) ) ( not ( = ?auto_134900 ?auto_134904 ) ) ( not ( = ?auto_134902 ?auto_134904 ) ) ( not ( = ?auto_134901 ?auto_134904 ) ) ( not ( = ?auto_134905 ?auto_134904 ) ) ( ON ?auto_134898 ?auto_134897 ) ( ON-TABLE ?auto_134904 ) ( ON ?auto_134899 ?auto_134898 ) ( CLEAR ?auto_134905 ) ( ON ?auto_134903 ?auto_134899 ) ( CLEAR ?auto_134903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134904 ?auto_134897 ?auto_134898 ?auto_134899 )
      ( MAKE-3PILE ?auto_134897 ?auto_134898 ?auto_134899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134906 - BLOCK
      ?auto_134907 - BLOCK
      ?auto_134908 - BLOCK
    )
    :vars
    (
      ?auto_134909 - BLOCK
      ?auto_134914 - BLOCK
      ?auto_134912 - BLOCK
      ?auto_134910 - BLOCK
      ?auto_134911 - BLOCK
      ?auto_134913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134906 ?auto_134907 ) ) ( not ( = ?auto_134906 ?auto_134908 ) ) ( not ( = ?auto_134907 ?auto_134908 ) ) ( not ( = ?auto_134906 ?auto_134909 ) ) ( not ( = ?auto_134907 ?auto_134909 ) ) ( not ( = ?auto_134908 ?auto_134909 ) ) ( ON-TABLE ?auto_134914 ) ( ON ?auto_134912 ?auto_134914 ) ( ON ?auto_134910 ?auto_134912 ) ( not ( = ?auto_134914 ?auto_134912 ) ) ( not ( = ?auto_134914 ?auto_134910 ) ) ( not ( = ?auto_134914 ?auto_134911 ) ) ( not ( = ?auto_134914 ?auto_134909 ) ) ( not ( = ?auto_134914 ?auto_134908 ) ) ( not ( = ?auto_134914 ?auto_134907 ) ) ( not ( = ?auto_134912 ?auto_134910 ) ) ( not ( = ?auto_134912 ?auto_134911 ) ) ( not ( = ?auto_134912 ?auto_134909 ) ) ( not ( = ?auto_134912 ?auto_134908 ) ) ( not ( = ?auto_134912 ?auto_134907 ) ) ( not ( = ?auto_134910 ?auto_134911 ) ) ( not ( = ?auto_134910 ?auto_134909 ) ) ( not ( = ?auto_134910 ?auto_134908 ) ) ( not ( = ?auto_134910 ?auto_134907 ) ) ( not ( = ?auto_134911 ?auto_134909 ) ) ( not ( = ?auto_134911 ?auto_134908 ) ) ( not ( = ?auto_134911 ?auto_134907 ) ) ( not ( = ?auto_134906 ?auto_134914 ) ) ( not ( = ?auto_134906 ?auto_134912 ) ) ( not ( = ?auto_134906 ?auto_134910 ) ) ( not ( = ?auto_134906 ?auto_134911 ) ) ( ON ?auto_134906 ?auto_134913 ) ( not ( = ?auto_134906 ?auto_134913 ) ) ( not ( = ?auto_134907 ?auto_134913 ) ) ( not ( = ?auto_134908 ?auto_134913 ) ) ( not ( = ?auto_134909 ?auto_134913 ) ) ( not ( = ?auto_134914 ?auto_134913 ) ) ( not ( = ?auto_134912 ?auto_134913 ) ) ( not ( = ?auto_134910 ?auto_134913 ) ) ( not ( = ?auto_134911 ?auto_134913 ) ) ( ON ?auto_134907 ?auto_134906 ) ( ON-TABLE ?auto_134913 ) ( ON ?auto_134908 ?auto_134907 ) ( ON ?auto_134909 ?auto_134908 ) ( CLEAR ?auto_134909 ) ( HOLDING ?auto_134911 ) ( CLEAR ?auto_134910 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_134914 ?auto_134912 ?auto_134910 ?auto_134911 )
      ( MAKE-3PILE ?auto_134906 ?auto_134907 ?auto_134908 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134915 - BLOCK
      ?auto_134916 - BLOCK
      ?auto_134917 - BLOCK
    )
    :vars
    (
      ?auto_134923 - BLOCK
      ?auto_134919 - BLOCK
      ?auto_134922 - BLOCK
      ?auto_134918 - BLOCK
      ?auto_134921 - BLOCK
      ?auto_134920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134915 ?auto_134916 ) ) ( not ( = ?auto_134915 ?auto_134917 ) ) ( not ( = ?auto_134916 ?auto_134917 ) ) ( not ( = ?auto_134915 ?auto_134923 ) ) ( not ( = ?auto_134916 ?auto_134923 ) ) ( not ( = ?auto_134917 ?auto_134923 ) ) ( ON-TABLE ?auto_134919 ) ( ON ?auto_134922 ?auto_134919 ) ( ON ?auto_134918 ?auto_134922 ) ( not ( = ?auto_134919 ?auto_134922 ) ) ( not ( = ?auto_134919 ?auto_134918 ) ) ( not ( = ?auto_134919 ?auto_134921 ) ) ( not ( = ?auto_134919 ?auto_134923 ) ) ( not ( = ?auto_134919 ?auto_134917 ) ) ( not ( = ?auto_134919 ?auto_134916 ) ) ( not ( = ?auto_134922 ?auto_134918 ) ) ( not ( = ?auto_134922 ?auto_134921 ) ) ( not ( = ?auto_134922 ?auto_134923 ) ) ( not ( = ?auto_134922 ?auto_134917 ) ) ( not ( = ?auto_134922 ?auto_134916 ) ) ( not ( = ?auto_134918 ?auto_134921 ) ) ( not ( = ?auto_134918 ?auto_134923 ) ) ( not ( = ?auto_134918 ?auto_134917 ) ) ( not ( = ?auto_134918 ?auto_134916 ) ) ( not ( = ?auto_134921 ?auto_134923 ) ) ( not ( = ?auto_134921 ?auto_134917 ) ) ( not ( = ?auto_134921 ?auto_134916 ) ) ( not ( = ?auto_134915 ?auto_134919 ) ) ( not ( = ?auto_134915 ?auto_134922 ) ) ( not ( = ?auto_134915 ?auto_134918 ) ) ( not ( = ?auto_134915 ?auto_134921 ) ) ( ON ?auto_134915 ?auto_134920 ) ( not ( = ?auto_134915 ?auto_134920 ) ) ( not ( = ?auto_134916 ?auto_134920 ) ) ( not ( = ?auto_134917 ?auto_134920 ) ) ( not ( = ?auto_134923 ?auto_134920 ) ) ( not ( = ?auto_134919 ?auto_134920 ) ) ( not ( = ?auto_134922 ?auto_134920 ) ) ( not ( = ?auto_134918 ?auto_134920 ) ) ( not ( = ?auto_134921 ?auto_134920 ) ) ( ON ?auto_134916 ?auto_134915 ) ( ON-TABLE ?auto_134920 ) ( ON ?auto_134917 ?auto_134916 ) ( ON ?auto_134923 ?auto_134917 ) ( CLEAR ?auto_134918 ) ( ON ?auto_134921 ?auto_134923 ) ( CLEAR ?auto_134921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134920 ?auto_134915 ?auto_134916 ?auto_134917 ?auto_134923 )
      ( MAKE-3PILE ?auto_134915 ?auto_134916 ?auto_134917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134924 - BLOCK
      ?auto_134925 - BLOCK
      ?auto_134926 - BLOCK
    )
    :vars
    (
      ?auto_134928 - BLOCK
      ?auto_134927 - BLOCK
      ?auto_134931 - BLOCK
      ?auto_134932 - BLOCK
      ?auto_134929 - BLOCK
      ?auto_134930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134924 ?auto_134925 ) ) ( not ( = ?auto_134924 ?auto_134926 ) ) ( not ( = ?auto_134925 ?auto_134926 ) ) ( not ( = ?auto_134924 ?auto_134928 ) ) ( not ( = ?auto_134925 ?auto_134928 ) ) ( not ( = ?auto_134926 ?auto_134928 ) ) ( ON-TABLE ?auto_134927 ) ( ON ?auto_134931 ?auto_134927 ) ( not ( = ?auto_134927 ?auto_134931 ) ) ( not ( = ?auto_134927 ?auto_134932 ) ) ( not ( = ?auto_134927 ?auto_134929 ) ) ( not ( = ?auto_134927 ?auto_134928 ) ) ( not ( = ?auto_134927 ?auto_134926 ) ) ( not ( = ?auto_134927 ?auto_134925 ) ) ( not ( = ?auto_134931 ?auto_134932 ) ) ( not ( = ?auto_134931 ?auto_134929 ) ) ( not ( = ?auto_134931 ?auto_134928 ) ) ( not ( = ?auto_134931 ?auto_134926 ) ) ( not ( = ?auto_134931 ?auto_134925 ) ) ( not ( = ?auto_134932 ?auto_134929 ) ) ( not ( = ?auto_134932 ?auto_134928 ) ) ( not ( = ?auto_134932 ?auto_134926 ) ) ( not ( = ?auto_134932 ?auto_134925 ) ) ( not ( = ?auto_134929 ?auto_134928 ) ) ( not ( = ?auto_134929 ?auto_134926 ) ) ( not ( = ?auto_134929 ?auto_134925 ) ) ( not ( = ?auto_134924 ?auto_134927 ) ) ( not ( = ?auto_134924 ?auto_134931 ) ) ( not ( = ?auto_134924 ?auto_134932 ) ) ( not ( = ?auto_134924 ?auto_134929 ) ) ( ON ?auto_134924 ?auto_134930 ) ( not ( = ?auto_134924 ?auto_134930 ) ) ( not ( = ?auto_134925 ?auto_134930 ) ) ( not ( = ?auto_134926 ?auto_134930 ) ) ( not ( = ?auto_134928 ?auto_134930 ) ) ( not ( = ?auto_134927 ?auto_134930 ) ) ( not ( = ?auto_134931 ?auto_134930 ) ) ( not ( = ?auto_134932 ?auto_134930 ) ) ( not ( = ?auto_134929 ?auto_134930 ) ) ( ON ?auto_134925 ?auto_134924 ) ( ON-TABLE ?auto_134930 ) ( ON ?auto_134926 ?auto_134925 ) ( ON ?auto_134928 ?auto_134926 ) ( ON ?auto_134929 ?auto_134928 ) ( CLEAR ?auto_134929 ) ( HOLDING ?auto_134932 ) ( CLEAR ?auto_134931 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_134927 ?auto_134931 ?auto_134932 )
      ( MAKE-3PILE ?auto_134924 ?auto_134925 ?auto_134926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134933 - BLOCK
      ?auto_134934 - BLOCK
      ?auto_134935 - BLOCK
    )
    :vars
    (
      ?auto_134936 - BLOCK
      ?auto_134939 - BLOCK
      ?auto_134940 - BLOCK
      ?auto_134937 - BLOCK
      ?auto_134938 - BLOCK
      ?auto_134941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134933 ?auto_134934 ) ) ( not ( = ?auto_134933 ?auto_134935 ) ) ( not ( = ?auto_134934 ?auto_134935 ) ) ( not ( = ?auto_134933 ?auto_134936 ) ) ( not ( = ?auto_134934 ?auto_134936 ) ) ( not ( = ?auto_134935 ?auto_134936 ) ) ( ON-TABLE ?auto_134939 ) ( ON ?auto_134940 ?auto_134939 ) ( not ( = ?auto_134939 ?auto_134940 ) ) ( not ( = ?auto_134939 ?auto_134937 ) ) ( not ( = ?auto_134939 ?auto_134938 ) ) ( not ( = ?auto_134939 ?auto_134936 ) ) ( not ( = ?auto_134939 ?auto_134935 ) ) ( not ( = ?auto_134939 ?auto_134934 ) ) ( not ( = ?auto_134940 ?auto_134937 ) ) ( not ( = ?auto_134940 ?auto_134938 ) ) ( not ( = ?auto_134940 ?auto_134936 ) ) ( not ( = ?auto_134940 ?auto_134935 ) ) ( not ( = ?auto_134940 ?auto_134934 ) ) ( not ( = ?auto_134937 ?auto_134938 ) ) ( not ( = ?auto_134937 ?auto_134936 ) ) ( not ( = ?auto_134937 ?auto_134935 ) ) ( not ( = ?auto_134937 ?auto_134934 ) ) ( not ( = ?auto_134938 ?auto_134936 ) ) ( not ( = ?auto_134938 ?auto_134935 ) ) ( not ( = ?auto_134938 ?auto_134934 ) ) ( not ( = ?auto_134933 ?auto_134939 ) ) ( not ( = ?auto_134933 ?auto_134940 ) ) ( not ( = ?auto_134933 ?auto_134937 ) ) ( not ( = ?auto_134933 ?auto_134938 ) ) ( ON ?auto_134933 ?auto_134941 ) ( not ( = ?auto_134933 ?auto_134941 ) ) ( not ( = ?auto_134934 ?auto_134941 ) ) ( not ( = ?auto_134935 ?auto_134941 ) ) ( not ( = ?auto_134936 ?auto_134941 ) ) ( not ( = ?auto_134939 ?auto_134941 ) ) ( not ( = ?auto_134940 ?auto_134941 ) ) ( not ( = ?auto_134937 ?auto_134941 ) ) ( not ( = ?auto_134938 ?auto_134941 ) ) ( ON ?auto_134934 ?auto_134933 ) ( ON-TABLE ?auto_134941 ) ( ON ?auto_134935 ?auto_134934 ) ( ON ?auto_134936 ?auto_134935 ) ( ON ?auto_134938 ?auto_134936 ) ( CLEAR ?auto_134940 ) ( ON ?auto_134937 ?auto_134938 ) ( CLEAR ?auto_134937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_134941 ?auto_134933 ?auto_134934 ?auto_134935 ?auto_134936 ?auto_134938 )
      ( MAKE-3PILE ?auto_134933 ?auto_134934 ?auto_134935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134942 - BLOCK
      ?auto_134943 - BLOCK
      ?auto_134944 - BLOCK
    )
    :vars
    (
      ?auto_134945 - BLOCK
      ?auto_134947 - BLOCK
      ?auto_134948 - BLOCK
      ?auto_134946 - BLOCK
      ?auto_134949 - BLOCK
      ?auto_134950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134942 ?auto_134943 ) ) ( not ( = ?auto_134942 ?auto_134944 ) ) ( not ( = ?auto_134943 ?auto_134944 ) ) ( not ( = ?auto_134942 ?auto_134945 ) ) ( not ( = ?auto_134943 ?auto_134945 ) ) ( not ( = ?auto_134944 ?auto_134945 ) ) ( ON-TABLE ?auto_134947 ) ( not ( = ?auto_134947 ?auto_134948 ) ) ( not ( = ?auto_134947 ?auto_134946 ) ) ( not ( = ?auto_134947 ?auto_134949 ) ) ( not ( = ?auto_134947 ?auto_134945 ) ) ( not ( = ?auto_134947 ?auto_134944 ) ) ( not ( = ?auto_134947 ?auto_134943 ) ) ( not ( = ?auto_134948 ?auto_134946 ) ) ( not ( = ?auto_134948 ?auto_134949 ) ) ( not ( = ?auto_134948 ?auto_134945 ) ) ( not ( = ?auto_134948 ?auto_134944 ) ) ( not ( = ?auto_134948 ?auto_134943 ) ) ( not ( = ?auto_134946 ?auto_134949 ) ) ( not ( = ?auto_134946 ?auto_134945 ) ) ( not ( = ?auto_134946 ?auto_134944 ) ) ( not ( = ?auto_134946 ?auto_134943 ) ) ( not ( = ?auto_134949 ?auto_134945 ) ) ( not ( = ?auto_134949 ?auto_134944 ) ) ( not ( = ?auto_134949 ?auto_134943 ) ) ( not ( = ?auto_134942 ?auto_134947 ) ) ( not ( = ?auto_134942 ?auto_134948 ) ) ( not ( = ?auto_134942 ?auto_134946 ) ) ( not ( = ?auto_134942 ?auto_134949 ) ) ( ON ?auto_134942 ?auto_134950 ) ( not ( = ?auto_134942 ?auto_134950 ) ) ( not ( = ?auto_134943 ?auto_134950 ) ) ( not ( = ?auto_134944 ?auto_134950 ) ) ( not ( = ?auto_134945 ?auto_134950 ) ) ( not ( = ?auto_134947 ?auto_134950 ) ) ( not ( = ?auto_134948 ?auto_134950 ) ) ( not ( = ?auto_134946 ?auto_134950 ) ) ( not ( = ?auto_134949 ?auto_134950 ) ) ( ON ?auto_134943 ?auto_134942 ) ( ON-TABLE ?auto_134950 ) ( ON ?auto_134944 ?auto_134943 ) ( ON ?auto_134945 ?auto_134944 ) ( ON ?auto_134949 ?auto_134945 ) ( ON ?auto_134946 ?auto_134949 ) ( CLEAR ?auto_134946 ) ( HOLDING ?auto_134948 ) ( CLEAR ?auto_134947 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134947 ?auto_134948 )
      ( MAKE-3PILE ?auto_134942 ?auto_134943 ?auto_134944 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134951 - BLOCK
      ?auto_134952 - BLOCK
      ?auto_134953 - BLOCK
    )
    :vars
    (
      ?auto_134958 - BLOCK
      ?auto_134956 - BLOCK
      ?auto_134957 - BLOCK
      ?auto_134959 - BLOCK
      ?auto_134954 - BLOCK
      ?auto_134955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134951 ?auto_134952 ) ) ( not ( = ?auto_134951 ?auto_134953 ) ) ( not ( = ?auto_134952 ?auto_134953 ) ) ( not ( = ?auto_134951 ?auto_134958 ) ) ( not ( = ?auto_134952 ?auto_134958 ) ) ( not ( = ?auto_134953 ?auto_134958 ) ) ( ON-TABLE ?auto_134956 ) ( not ( = ?auto_134956 ?auto_134957 ) ) ( not ( = ?auto_134956 ?auto_134959 ) ) ( not ( = ?auto_134956 ?auto_134954 ) ) ( not ( = ?auto_134956 ?auto_134958 ) ) ( not ( = ?auto_134956 ?auto_134953 ) ) ( not ( = ?auto_134956 ?auto_134952 ) ) ( not ( = ?auto_134957 ?auto_134959 ) ) ( not ( = ?auto_134957 ?auto_134954 ) ) ( not ( = ?auto_134957 ?auto_134958 ) ) ( not ( = ?auto_134957 ?auto_134953 ) ) ( not ( = ?auto_134957 ?auto_134952 ) ) ( not ( = ?auto_134959 ?auto_134954 ) ) ( not ( = ?auto_134959 ?auto_134958 ) ) ( not ( = ?auto_134959 ?auto_134953 ) ) ( not ( = ?auto_134959 ?auto_134952 ) ) ( not ( = ?auto_134954 ?auto_134958 ) ) ( not ( = ?auto_134954 ?auto_134953 ) ) ( not ( = ?auto_134954 ?auto_134952 ) ) ( not ( = ?auto_134951 ?auto_134956 ) ) ( not ( = ?auto_134951 ?auto_134957 ) ) ( not ( = ?auto_134951 ?auto_134959 ) ) ( not ( = ?auto_134951 ?auto_134954 ) ) ( ON ?auto_134951 ?auto_134955 ) ( not ( = ?auto_134951 ?auto_134955 ) ) ( not ( = ?auto_134952 ?auto_134955 ) ) ( not ( = ?auto_134953 ?auto_134955 ) ) ( not ( = ?auto_134958 ?auto_134955 ) ) ( not ( = ?auto_134956 ?auto_134955 ) ) ( not ( = ?auto_134957 ?auto_134955 ) ) ( not ( = ?auto_134959 ?auto_134955 ) ) ( not ( = ?auto_134954 ?auto_134955 ) ) ( ON ?auto_134952 ?auto_134951 ) ( ON-TABLE ?auto_134955 ) ( ON ?auto_134953 ?auto_134952 ) ( ON ?auto_134958 ?auto_134953 ) ( ON ?auto_134954 ?auto_134958 ) ( ON ?auto_134959 ?auto_134954 ) ( CLEAR ?auto_134956 ) ( ON ?auto_134957 ?auto_134959 ) ( CLEAR ?auto_134957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_134955 ?auto_134951 ?auto_134952 ?auto_134953 ?auto_134958 ?auto_134954 ?auto_134959 )
      ( MAKE-3PILE ?auto_134951 ?auto_134952 ?auto_134953 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134960 - BLOCK
      ?auto_134961 - BLOCK
      ?auto_134962 - BLOCK
    )
    :vars
    (
      ?auto_134968 - BLOCK
      ?auto_134964 - BLOCK
      ?auto_134967 - BLOCK
      ?auto_134966 - BLOCK
      ?auto_134965 - BLOCK
      ?auto_134963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134960 ?auto_134961 ) ) ( not ( = ?auto_134960 ?auto_134962 ) ) ( not ( = ?auto_134961 ?auto_134962 ) ) ( not ( = ?auto_134960 ?auto_134968 ) ) ( not ( = ?auto_134961 ?auto_134968 ) ) ( not ( = ?auto_134962 ?auto_134968 ) ) ( not ( = ?auto_134964 ?auto_134967 ) ) ( not ( = ?auto_134964 ?auto_134966 ) ) ( not ( = ?auto_134964 ?auto_134965 ) ) ( not ( = ?auto_134964 ?auto_134968 ) ) ( not ( = ?auto_134964 ?auto_134962 ) ) ( not ( = ?auto_134964 ?auto_134961 ) ) ( not ( = ?auto_134967 ?auto_134966 ) ) ( not ( = ?auto_134967 ?auto_134965 ) ) ( not ( = ?auto_134967 ?auto_134968 ) ) ( not ( = ?auto_134967 ?auto_134962 ) ) ( not ( = ?auto_134967 ?auto_134961 ) ) ( not ( = ?auto_134966 ?auto_134965 ) ) ( not ( = ?auto_134966 ?auto_134968 ) ) ( not ( = ?auto_134966 ?auto_134962 ) ) ( not ( = ?auto_134966 ?auto_134961 ) ) ( not ( = ?auto_134965 ?auto_134968 ) ) ( not ( = ?auto_134965 ?auto_134962 ) ) ( not ( = ?auto_134965 ?auto_134961 ) ) ( not ( = ?auto_134960 ?auto_134964 ) ) ( not ( = ?auto_134960 ?auto_134967 ) ) ( not ( = ?auto_134960 ?auto_134966 ) ) ( not ( = ?auto_134960 ?auto_134965 ) ) ( ON ?auto_134960 ?auto_134963 ) ( not ( = ?auto_134960 ?auto_134963 ) ) ( not ( = ?auto_134961 ?auto_134963 ) ) ( not ( = ?auto_134962 ?auto_134963 ) ) ( not ( = ?auto_134968 ?auto_134963 ) ) ( not ( = ?auto_134964 ?auto_134963 ) ) ( not ( = ?auto_134967 ?auto_134963 ) ) ( not ( = ?auto_134966 ?auto_134963 ) ) ( not ( = ?auto_134965 ?auto_134963 ) ) ( ON ?auto_134961 ?auto_134960 ) ( ON-TABLE ?auto_134963 ) ( ON ?auto_134962 ?auto_134961 ) ( ON ?auto_134968 ?auto_134962 ) ( ON ?auto_134965 ?auto_134968 ) ( ON ?auto_134966 ?auto_134965 ) ( ON ?auto_134967 ?auto_134966 ) ( CLEAR ?auto_134967 ) ( HOLDING ?auto_134964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134964 )
      ( MAKE-3PILE ?auto_134960 ?auto_134961 ?auto_134962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134969 - BLOCK
      ?auto_134970 - BLOCK
      ?auto_134971 - BLOCK
    )
    :vars
    (
      ?auto_134974 - BLOCK
      ?auto_134977 - BLOCK
      ?auto_134976 - BLOCK
      ?auto_134972 - BLOCK
      ?auto_134973 - BLOCK
      ?auto_134975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_134969 ?auto_134970 ) ) ( not ( = ?auto_134969 ?auto_134971 ) ) ( not ( = ?auto_134970 ?auto_134971 ) ) ( not ( = ?auto_134969 ?auto_134974 ) ) ( not ( = ?auto_134970 ?auto_134974 ) ) ( not ( = ?auto_134971 ?auto_134974 ) ) ( not ( = ?auto_134977 ?auto_134976 ) ) ( not ( = ?auto_134977 ?auto_134972 ) ) ( not ( = ?auto_134977 ?auto_134973 ) ) ( not ( = ?auto_134977 ?auto_134974 ) ) ( not ( = ?auto_134977 ?auto_134971 ) ) ( not ( = ?auto_134977 ?auto_134970 ) ) ( not ( = ?auto_134976 ?auto_134972 ) ) ( not ( = ?auto_134976 ?auto_134973 ) ) ( not ( = ?auto_134976 ?auto_134974 ) ) ( not ( = ?auto_134976 ?auto_134971 ) ) ( not ( = ?auto_134976 ?auto_134970 ) ) ( not ( = ?auto_134972 ?auto_134973 ) ) ( not ( = ?auto_134972 ?auto_134974 ) ) ( not ( = ?auto_134972 ?auto_134971 ) ) ( not ( = ?auto_134972 ?auto_134970 ) ) ( not ( = ?auto_134973 ?auto_134974 ) ) ( not ( = ?auto_134973 ?auto_134971 ) ) ( not ( = ?auto_134973 ?auto_134970 ) ) ( not ( = ?auto_134969 ?auto_134977 ) ) ( not ( = ?auto_134969 ?auto_134976 ) ) ( not ( = ?auto_134969 ?auto_134972 ) ) ( not ( = ?auto_134969 ?auto_134973 ) ) ( ON ?auto_134969 ?auto_134975 ) ( not ( = ?auto_134969 ?auto_134975 ) ) ( not ( = ?auto_134970 ?auto_134975 ) ) ( not ( = ?auto_134971 ?auto_134975 ) ) ( not ( = ?auto_134974 ?auto_134975 ) ) ( not ( = ?auto_134977 ?auto_134975 ) ) ( not ( = ?auto_134976 ?auto_134975 ) ) ( not ( = ?auto_134972 ?auto_134975 ) ) ( not ( = ?auto_134973 ?auto_134975 ) ) ( ON ?auto_134970 ?auto_134969 ) ( ON-TABLE ?auto_134975 ) ( ON ?auto_134971 ?auto_134970 ) ( ON ?auto_134974 ?auto_134971 ) ( ON ?auto_134973 ?auto_134974 ) ( ON ?auto_134972 ?auto_134973 ) ( ON ?auto_134976 ?auto_134972 ) ( ON ?auto_134977 ?auto_134976 ) ( CLEAR ?auto_134977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_134975 ?auto_134969 ?auto_134970 ?auto_134971 ?auto_134974 ?auto_134973 ?auto_134972 ?auto_134976 )
      ( MAKE-3PILE ?auto_134969 ?auto_134970 ?auto_134971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134982 - BLOCK
      ?auto_134983 - BLOCK
      ?auto_134984 - BLOCK
      ?auto_134985 - BLOCK
    )
    :vars
    (
      ?auto_134986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134986 ?auto_134985 ) ( CLEAR ?auto_134986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134982 ) ( ON ?auto_134983 ?auto_134982 ) ( ON ?auto_134984 ?auto_134983 ) ( ON ?auto_134985 ?auto_134984 ) ( not ( = ?auto_134982 ?auto_134983 ) ) ( not ( = ?auto_134982 ?auto_134984 ) ) ( not ( = ?auto_134982 ?auto_134985 ) ) ( not ( = ?auto_134982 ?auto_134986 ) ) ( not ( = ?auto_134983 ?auto_134984 ) ) ( not ( = ?auto_134983 ?auto_134985 ) ) ( not ( = ?auto_134983 ?auto_134986 ) ) ( not ( = ?auto_134984 ?auto_134985 ) ) ( not ( = ?auto_134984 ?auto_134986 ) ) ( not ( = ?auto_134985 ?auto_134986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134986 ?auto_134985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134987 - BLOCK
      ?auto_134988 - BLOCK
      ?auto_134989 - BLOCK
      ?auto_134990 - BLOCK
    )
    :vars
    (
      ?auto_134991 - BLOCK
      ?auto_134992 - BLOCK
      ?auto_134993 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134991 ?auto_134990 ) ( CLEAR ?auto_134991 ) ( ON-TABLE ?auto_134987 ) ( ON ?auto_134988 ?auto_134987 ) ( ON ?auto_134989 ?auto_134988 ) ( ON ?auto_134990 ?auto_134989 ) ( not ( = ?auto_134987 ?auto_134988 ) ) ( not ( = ?auto_134987 ?auto_134989 ) ) ( not ( = ?auto_134987 ?auto_134990 ) ) ( not ( = ?auto_134987 ?auto_134991 ) ) ( not ( = ?auto_134988 ?auto_134989 ) ) ( not ( = ?auto_134988 ?auto_134990 ) ) ( not ( = ?auto_134988 ?auto_134991 ) ) ( not ( = ?auto_134989 ?auto_134990 ) ) ( not ( = ?auto_134989 ?auto_134991 ) ) ( not ( = ?auto_134990 ?auto_134991 ) ) ( HOLDING ?auto_134992 ) ( CLEAR ?auto_134993 ) ( not ( = ?auto_134987 ?auto_134992 ) ) ( not ( = ?auto_134987 ?auto_134993 ) ) ( not ( = ?auto_134988 ?auto_134992 ) ) ( not ( = ?auto_134988 ?auto_134993 ) ) ( not ( = ?auto_134989 ?auto_134992 ) ) ( not ( = ?auto_134989 ?auto_134993 ) ) ( not ( = ?auto_134990 ?auto_134992 ) ) ( not ( = ?auto_134990 ?auto_134993 ) ) ( not ( = ?auto_134991 ?auto_134992 ) ) ( not ( = ?auto_134991 ?auto_134993 ) ) ( not ( = ?auto_134992 ?auto_134993 ) ) )
    :subtasks
    ( ( !STACK ?auto_134992 ?auto_134993 )
      ( MAKE-4PILE ?auto_134987 ?auto_134988 ?auto_134989 ?auto_134990 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134994 - BLOCK
      ?auto_134995 - BLOCK
      ?auto_134996 - BLOCK
      ?auto_134997 - BLOCK
    )
    :vars
    (
      ?auto_134998 - BLOCK
      ?auto_134999 - BLOCK
      ?auto_135000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134998 ?auto_134997 ) ( ON-TABLE ?auto_134994 ) ( ON ?auto_134995 ?auto_134994 ) ( ON ?auto_134996 ?auto_134995 ) ( ON ?auto_134997 ?auto_134996 ) ( not ( = ?auto_134994 ?auto_134995 ) ) ( not ( = ?auto_134994 ?auto_134996 ) ) ( not ( = ?auto_134994 ?auto_134997 ) ) ( not ( = ?auto_134994 ?auto_134998 ) ) ( not ( = ?auto_134995 ?auto_134996 ) ) ( not ( = ?auto_134995 ?auto_134997 ) ) ( not ( = ?auto_134995 ?auto_134998 ) ) ( not ( = ?auto_134996 ?auto_134997 ) ) ( not ( = ?auto_134996 ?auto_134998 ) ) ( not ( = ?auto_134997 ?auto_134998 ) ) ( CLEAR ?auto_134999 ) ( not ( = ?auto_134994 ?auto_135000 ) ) ( not ( = ?auto_134994 ?auto_134999 ) ) ( not ( = ?auto_134995 ?auto_135000 ) ) ( not ( = ?auto_134995 ?auto_134999 ) ) ( not ( = ?auto_134996 ?auto_135000 ) ) ( not ( = ?auto_134996 ?auto_134999 ) ) ( not ( = ?auto_134997 ?auto_135000 ) ) ( not ( = ?auto_134997 ?auto_134999 ) ) ( not ( = ?auto_134998 ?auto_135000 ) ) ( not ( = ?auto_134998 ?auto_134999 ) ) ( not ( = ?auto_135000 ?auto_134999 ) ) ( ON ?auto_135000 ?auto_134998 ) ( CLEAR ?auto_135000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_134994 ?auto_134995 ?auto_134996 ?auto_134997 ?auto_134998 )
      ( MAKE-4PILE ?auto_134994 ?auto_134995 ?auto_134996 ?auto_134997 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135001 - BLOCK
      ?auto_135002 - BLOCK
      ?auto_135003 - BLOCK
      ?auto_135004 - BLOCK
    )
    :vars
    (
      ?auto_135006 - BLOCK
      ?auto_135007 - BLOCK
      ?auto_135005 - BLOCK
      ?auto_135008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135006 ?auto_135004 ) ( ON-TABLE ?auto_135001 ) ( ON ?auto_135002 ?auto_135001 ) ( ON ?auto_135003 ?auto_135002 ) ( ON ?auto_135004 ?auto_135003 ) ( not ( = ?auto_135001 ?auto_135002 ) ) ( not ( = ?auto_135001 ?auto_135003 ) ) ( not ( = ?auto_135001 ?auto_135004 ) ) ( not ( = ?auto_135001 ?auto_135006 ) ) ( not ( = ?auto_135002 ?auto_135003 ) ) ( not ( = ?auto_135002 ?auto_135004 ) ) ( not ( = ?auto_135002 ?auto_135006 ) ) ( not ( = ?auto_135003 ?auto_135004 ) ) ( not ( = ?auto_135003 ?auto_135006 ) ) ( not ( = ?auto_135004 ?auto_135006 ) ) ( not ( = ?auto_135001 ?auto_135007 ) ) ( not ( = ?auto_135001 ?auto_135005 ) ) ( not ( = ?auto_135002 ?auto_135007 ) ) ( not ( = ?auto_135002 ?auto_135005 ) ) ( not ( = ?auto_135003 ?auto_135007 ) ) ( not ( = ?auto_135003 ?auto_135005 ) ) ( not ( = ?auto_135004 ?auto_135007 ) ) ( not ( = ?auto_135004 ?auto_135005 ) ) ( not ( = ?auto_135006 ?auto_135007 ) ) ( not ( = ?auto_135006 ?auto_135005 ) ) ( not ( = ?auto_135007 ?auto_135005 ) ) ( ON ?auto_135007 ?auto_135006 ) ( CLEAR ?auto_135007 ) ( HOLDING ?auto_135005 ) ( CLEAR ?auto_135008 ) ( ON-TABLE ?auto_135008 ) ( not ( = ?auto_135008 ?auto_135005 ) ) ( not ( = ?auto_135001 ?auto_135008 ) ) ( not ( = ?auto_135002 ?auto_135008 ) ) ( not ( = ?auto_135003 ?auto_135008 ) ) ( not ( = ?auto_135004 ?auto_135008 ) ) ( not ( = ?auto_135006 ?auto_135008 ) ) ( not ( = ?auto_135007 ?auto_135008 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135008 ?auto_135005 )
      ( MAKE-4PILE ?auto_135001 ?auto_135002 ?auto_135003 ?auto_135004 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135009 - BLOCK
      ?auto_135010 - BLOCK
      ?auto_135011 - BLOCK
      ?auto_135012 - BLOCK
    )
    :vars
    (
      ?auto_135016 - BLOCK
      ?auto_135014 - BLOCK
      ?auto_135015 - BLOCK
      ?auto_135013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135016 ?auto_135012 ) ( ON-TABLE ?auto_135009 ) ( ON ?auto_135010 ?auto_135009 ) ( ON ?auto_135011 ?auto_135010 ) ( ON ?auto_135012 ?auto_135011 ) ( not ( = ?auto_135009 ?auto_135010 ) ) ( not ( = ?auto_135009 ?auto_135011 ) ) ( not ( = ?auto_135009 ?auto_135012 ) ) ( not ( = ?auto_135009 ?auto_135016 ) ) ( not ( = ?auto_135010 ?auto_135011 ) ) ( not ( = ?auto_135010 ?auto_135012 ) ) ( not ( = ?auto_135010 ?auto_135016 ) ) ( not ( = ?auto_135011 ?auto_135012 ) ) ( not ( = ?auto_135011 ?auto_135016 ) ) ( not ( = ?auto_135012 ?auto_135016 ) ) ( not ( = ?auto_135009 ?auto_135014 ) ) ( not ( = ?auto_135009 ?auto_135015 ) ) ( not ( = ?auto_135010 ?auto_135014 ) ) ( not ( = ?auto_135010 ?auto_135015 ) ) ( not ( = ?auto_135011 ?auto_135014 ) ) ( not ( = ?auto_135011 ?auto_135015 ) ) ( not ( = ?auto_135012 ?auto_135014 ) ) ( not ( = ?auto_135012 ?auto_135015 ) ) ( not ( = ?auto_135016 ?auto_135014 ) ) ( not ( = ?auto_135016 ?auto_135015 ) ) ( not ( = ?auto_135014 ?auto_135015 ) ) ( ON ?auto_135014 ?auto_135016 ) ( CLEAR ?auto_135013 ) ( ON-TABLE ?auto_135013 ) ( not ( = ?auto_135013 ?auto_135015 ) ) ( not ( = ?auto_135009 ?auto_135013 ) ) ( not ( = ?auto_135010 ?auto_135013 ) ) ( not ( = ?auto_135011 ?auto_135013 ) ) ( not ( = ?auto_135012 ?auto_135013 ) ) ( not ( = ?auto_135016 ?auto_135013 ) ) ( not ( = ?auto_135014 ?auto_135013 ) ) ( ON ?auto_135015 ?auto_135014 ) ( CLEAR ?auto_135015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135009 ?auto_135010 ?auto_135011 ?auto_135012 ?auto_135016 ?auto_135014 )
      ( MAKE-4PILE ?auto_135009 ?auto_135010 ?auto_135011 ?auto_135012 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135017 - BLOCK
      ?auto_135018 - BLOCK
      ?auto_135019 - BLOCK
      ?auto_135020 - BLOCK
    )
    :vars
    (
      ?auto_135023 - BLOCK
      ?auto_135021 - BLOCK
      ?auto_135024 - BLOCK
      ?auto_135022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135023 ?auto_135020 ) ( ON-TABLE ?auto_135017 ) ( ON ?auto_135018 ?auto_135017 ) ( ON ?auto_135019 ?auto_135018 ) ( ON ?auto_135020 ?auto_135019 ) ( not ( = ?auto_135017 ?auto_135018 ) ) ( not ( = ?auto_135017 ?auto_135019 ) ) ( not ( = ?auto_135017 ?auto_135020 ) ) ( not ( = ?auto_135017 ?auto_135023 ) ) ( not ( = ?auto_135018 ?auto_135019 ) ) ( not ( = ?auto_135018 ?auto_135020 ) ) ( not ( = ?auto_135018 ?auto_135023 ) ) ( not ( = ?auto_135019 ?auto_135020 ) ) ( not ( = ?auto_135019 ?auto_135023 ) ) ( not ( = ?auto_135020 ?auto_135023 ) ) ( not ( = ?auto_135017 ?auto_135021 ) ) ( not ( = ?auto_135017 ?auto_135024 ) ) ( not ( = ?auto_135018 ?auto_135021 ) ) ( not ( = ?auto_135018 ?auto_135024 ) ) ( not ( = ?auto_135019 ?auto_135021 ) ) ( not ( = ?auto_135019 ?auto_135024 ) ) ( not ( = ?auto_135020 ?auto_135021 ) ) ( not ( = ?auto_135020 ?auto_135024 ) ) ( not ( = ?auto_135023 ?auto_135021 ) ) ( not ( = ?auto_135023 ?auto_135024 ) ) ( not ( = ?auto_135021 ?auto_135024 ) ) ( ON ?auto_135021 ?auto_135023 ) ( not ( = ?auto_135022 ?auto_135024 ) ) ( not ( = ?auto_135017 ?auto_135022 ) ) ( not ( = ?auto_135018 ?auto_135022 ) ) ( not ( = ?auto_135019 ?auto_135022 ) ) ( not ( = ?auto_135020 ?auto_135022 ) ) ( not ( = ?auto_135023 ?auto_135022 ) ) ( not ( = ?auto_135021 ?auto_135022 ) ) ( ON ?auto_135024 ?auto_135021 ) ( CLEAR ?auto_135024 ) ( HOLDING ?auto_135022 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135022 )
      ( MAKE-4PILE ?auto_135017 ?auto_135018 ?auto_135019 ?auto_135020 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135025 - BLOCK
      ?auto_135026 - BLOCK
      ?auto_135027 - BLOCK
      ?auto_135028 - BLOCK
    )
    :vars
    (
      ?auto_135031 - BLOCK
      ?auto_135030 - BLOCK
      ?auto_135032 - BLOCK
      ?auto_135029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135031 ?auto_135028 ) ( ON-TABLE ?auto_135025 ) ( ON ?auto_135026 ?auto_135025 ) ( ON ?auto_135027 ?auto_135026 ) ( ON ?auto_135028 ?auto_135027 ) ( not ( = ?auto_135025 ?auto_135026 ) ) ( not ( = ?auto_135025 ?auto_135027 ) ) ( not ( = ?auto_135025 ?auto_135028 ) ) ( not ( = ?auto_135025 ?auto_135031 ) ) ( not ( = ?auto_135026 ?auto_135027 ) ) ( not ( = ?auto_135026 ?auto_135028 ) ) ( not ( = ?auto_135026 ?auto_135031 ) ) ( not ( = ?auto_135027 ?auto_135028 ) ) ( not ( = ?auto_135027 ?auto_135031 ) ) ( not ( = ?auto_135028 ?auto_135031 ) ) ( not ( = ?auto_135025 ?auto_135030 ) ) ( not ( = ?auto_135025 ?auto_135032 ) ) ( not ( = ?auto_135026 ?auto_135030 ) ) ( not ( = ?auto_135026 ?auto_135032 ) ) ( not ( = ?auto_135027 ?auto_135030 ) ) ( not ( = ?auto_135027 ?auto_135032 ) ) ( not ( = ?auto_135028 ?auto_135030 ) ) ( not ( = ?auto_135028 ?auto_135032 ) ) ( not ( = ?auto_135031 ?auto_135030 ) ) ( not ( = ?auto_135031 ?auto_135032 ) ) ( not ( = ?auto_135030 ?auto_135032 ) ) ( ON ?auto_135030 ?auto_135031 ) ( not ( = ?auto_135029 ?auto_135032 ) ) ( not ( = ?auto_135025 ?auto_135029 ) ) ( not ( = ?auto_135026 ?auto_135029 ) ) ( not ( = ?auto_135027 ?auto_135029 ) ) ( not ( = ?auto_135028 ?auto_135029 ) ) ( not ( = ?auto_135031 ?auto_135029 ) ) ( not ( = ?auto_135030 ?auto_135029 ) ) ( ON ?auto_135032 ?auto_135030 ) ( ON ?auto_135029 ?auto_135032 ) ( CLEAR ?auto_135029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135025 ?auto_135026 ?auto_135027 ?auto_135028 ?auto_135031 ?auto_135030 ?auto_135032 )
      ( MAKE-4PILE ?auto_135025 ?auto_135026 ?auto_135027 ?auto_135028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135033 - BLOCK
      ?auto_135034 - BLOCK
      ?auto_135035 - BLOCK
      ?auto_135036 - BLOCK
    )
    :vars
    (
      ?auto_135038 - BLOCK
      ?auto_135040 - BLOCK
      ?auto_135037 - BLOCK
      ?auto_135039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135038 ?auto_135036 ) ( ON-TABLE ?auto_135033 ) ( ON ?auto_135034 ?auto_135033 ) ( ON ?auto_135035 ?auto_135034 ) ( ON ?auto_135036 ?auto_135035 ) ( not ( = ?auto_135033 ?auto_135034 ) ) ( not ( = ?auto_135033 ?auto_135035 ) ) ( not ( = ?auto_135033 ?auto_135036 ) ) ( not ( = ?auto_135033 ?auto_135038 ) ) ( not ( = ?auto_135034 ?auto_135035 ) ) ( not ( = ?auto_135034 ?auto_135036 ) ) ( not ( = ?auto_135034 ?auto_135038 ) ) ( not ( = ?auto_135035 ?auto_135036 ) ) ( not ( = ?auto_135035 ?auto_135038 ) ) ( not ( = ?auto_135036 ?auto_135038 ) ) ( not ( = ?auto_135033 ?auto_135040 ) ) ( not ( = ?auto_135033 ?auto_135037 ) ) ( not ( = ?auto_135034 ?auto_135040 ) ) ( not ( = ?auto_135034 ?auto_135037 ) ) ( not ( = ?auto_135035 ?auto_135040 ) ) ( not ( = ?auto_135035 ?auto_135037 ) ) ( not ( = ?auto_135036 ?auto_135040 ) ) ( not ( = ?auto_135036 ?auto_135037 ) ) ( not ( = ?auto_135038 ?auto_135040 ) ) ( not ( = ?auto_135038 ?auto_135037 ) ) ( not ( = ?auto_135040 ?auto_135037 ) ) ( ON ?auto_135040 ?auto_135038 ) ( not ( = ?auto_135039 ?auto_135037 ) ) ( not ( = ?auto_135033 ?auto_135039 ) ) ( not ( = ?auto_135034 ?auto_135039 ) ) ( not ( = ?auto_135035 ?auto_135039 ) ) ( not ( = ?auto_135036 ?auto_135039 ) ) ( not ( = ?auto_135038 ?auto_135039 ) ) ( not ( = ?auto_135040 ?auto_135039 ) ) ( ON ?auto_135037 ?auto_135040 ) ( HOLDING ?auto_135039 ) ( CLEAR ?auto_135037 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135033 ?auto_135034 ?auto_135035 ?auto_135036 ?auto_135038 ?auto_135040 ?auto_135037 ?auto_135039 )
      ( MAKE-4PILE ?auto_135033 ?auto_135034 ?auto_135035 ?auto_135036 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135041 - BLOCK
      ?auto_135042 - BLOCK
      ?auto_135043 - BLOCK
      ?auto_135044 - BLOCK
    )
    :vars
    (
      ?auto_135048 - BLOCK
      ?auto_135047 - BLOCK
      ?auto_135046 - BLOCK
      ?auto_135045 - BLOCK
      ?auto_135049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135048 ?auto_135044 ) ( ON-TABLE ?auto_135041 ) ( ON ?auto_135042 ?auto_135041 ) ( ON ?auto_135043 ?auto_135042 ) ( ON ?auto_135044 ?auto_135043 ) ( not ( = ?auto_135041 ?auto_135042 ) ) ( not ( = ?auto_135041 ?auto_135043 ) ) ( not ( = ?auto_135041 ?auto_135044 ) ) ( not ( = ?auto_135041 ?auto_135048 ) ) ( not ( = ?auto_135042 ?auto_135043 ) ) ( not ( = ?auto_135042 ?auto_135044 ) ) ( not ( = ?auto_135042 ?auto_135048 ) ) ( not ( = ?auto_135043 ?auto_135044 ) ) ( not ( = ?auto_135043 ?auto_135048 ) ) ( not ( = ?auto_135044 ?auto_135048 ) ) ( not ( = ?auto_135041 ?auto_135047 ) ) ( not ( = ?auto_135041 ?auto_135046 ) ) ( not ( = ?auto_135042 ?auto_135047 ) ) ( not ( = ?auto_135042 ?auto_135046 ) ) ( not ( = ?auto_135043 ?auto_135047 ) ) ( not ( = ?auto_135043 ?auto_135046 ) ) ( not ( = ?auto_135044 ?auto_135047 ) ) ( not ( = ?auto_135044 ?auto_135046 ) ) ( not ( = ?auto_135048 ?auto_135047 ) ) ( not ( = ?auto_135048 ?auto_135046 ) ) ( not ( = ?auto_135047 ?auto_135046 ) ) ( ON ?auto_135047 ?auto_135048 ) ( not ( = ?auto_135045 ?auto_135046 ) ) ( not ( = ?auto_135041 ?auto_135045 ) ) ( not ( = ?auto_135042 ?auto_135045 ) ) ( not ( = ?auto_135043 ?auto_135045 ) ) ( not ( = ?auto_135044 ?auto_135045 ) ) ( not ( = ?auto_135048 ?auto_135045 ) ) ( not ( = ?auto_135047 ?auto_135045 ) ) ( ON ?auto_135046 ?auto_135047 ) ( CLEAR ?auto_135046 ) ( ON ?auto_135045 ?auto_135049 ) ( CLEAR ?auto_135045 ) ( HAND-EMPTY ) ( not ( = ?auto_135041 ?auto_135049 ) ) ( not ( = ?auto_135042 ?auto_135049 ) ) ( not ( = ?auto_135043 ?auto_135049 ) ) ( not ( = ?auto_135044 ?auto_135049 ) ) ( not ( = ?auto_135048 ?auto_135049 ) ) ( not ( = ?auto_135047 ?auto_135049 ) ) ( not ( = ?auto_135046 ?auto_135049 ) ) ( not ( = ?auto_135045 ?auto_135049 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135045 ?auto_135049 )
      ( MAKE-4PILE ?auto_135041 ?auto_135042 ?auto_135043 ?auto_135044 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135050 - BLOCK
      ?auto_135051 - BLOCK
      ?auto_135052 - BLOCK
      ?auto_135053 - BLOCK
    )
    :vars
    (
      ?auto_135055 - BLOCK
      ?auto_135056 - BLOCK
      ?auto_135054 - BLOCK
      ?auto_135058 - BLOCK
      ?auto_135057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135055 ?auto_135053 ) ( ON-TABLE ?auto_135050 ) ( ON ?auto_135051 ?auto_135050 ) ( ON ?auto_135052 ?auto_135051 ) ( ON ?auto_135053 ?auto_135052 ) ( not ( = ?auto_135050 ?auto_135051 ) ) ( not ( = ?auto_135050 ?auto_135052 ) ) ( not ( = ?auto_135050 ?auto_135053 ) ) ( not ( = ?auto_135050 ?auto_135055 ) ) ( not ( = ?auto_135051 ?auto_135052 ) ) ( not ( = ?auto_135051 ?auto_135053 ) ) ( not ( = ?auto_135051 ?auto_135055 ) ) ( not ( = ?auto_135052 ?auto_135053 ) ) ( not ( = ?auto_135052 ?auto_135055 ) ) ( not ( = ?auto_135053 ?auto_135055 ) ) ( not ( = ?auto_135050 ?auto_135056 ) ) ( not ( = ?auto_135050 ?auto_135054 ) ) ( not ( = ?auto_135051 ?auto_135056 ) ) ( not ( = ?auto_135051 ?auto_135054 ) ) ( not ( = ?auto_135052 ?auto_135056 ) ) ( not ( = ?auto_135052 ?auto_135054 ) ) ( not ( = ?auto_135053 ?auto_135056 ) ) ( not ( = ?auto_135053 ?auto_135054 ) ) ( not ( = ?auto_135055 ?auto_135056 ) ) ( not ( = ?auto_135055 ?auto_135054 ) ) ( not ( = ?auto_135056 ?auto_135054 ) ) ( ON ?auto_135056 ?auto_135055 ) ( not ( = ?auto_135058 ?auto_135054 ) ) ( not ( = ?auto_135050 ?auto_135058 ) ) ( not ( = ?auto_135051 ?auto_135058 ) ) ( not ( = ?auto_135052 ?auto_135058 ) ) ( not ( = ?auto_135053 ?auto_135058 ) ) ( not ( = ?auto_135055 ?auto_135058 ) ) ( not ( = ?auto_135056 ?auto_135058 ) ) ( ON ?auto_135058 ?auto_135057 ) ( CLEAR ?auto_135058 ) ( not ( = ?auto_135050 ?auto_135057 ) ) ( not ( = ?auto_135051 ?auto_135057 ) ) ( not ( = ?auto_135052 ?auto_135057 ) ) ( not ( = ?auto_135053 ?auto_135057 ) ) ( not ( = ?auto_135055 ?auto_135057 ) ) ( not ( = ?auto_135056 ?auto_135057 ) ) ( not ( = ?auto_135054 ?auto_135057 ) ) ( not ( = ?auto_135058 ?auto_135057 ) ) ( HOLDING ?auto_135054 ) ( CLEAR ?auto_135056 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135050 ?auto_135051 ?auto_135052 ?auto_135053 ?auto_135055 ?auto_135056 ?auto_135054 )
      ( MAKE-4PILE ?auto_135050 ?auto_135051 ?auto_135052 ?auto_135053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135059 - BLOCK
      ?auto_135060 - BLOCK
      ?auto_135061 - BLOCK
      ?auto_135062 - BLOCK
    )
    :vars
    (
      ?auto_135066 - BLOCK
      ?auto_135063 - BLOCK
      ?auto_135064 - BLOCK
      ?auto_135067 - BLOCK
      ?auto_135065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135066 ?auto_135062 ) ( ON-TABLE ?auto_135059 ) ( ON ?auto_135060 ?auto_135059 ) ( ON ?auto_135061 ?auto_135060 ) ( ON ?auto_135062 ?auto_135061 ) ( not ( = ?auto_135059 ?auto_135060 ) ) ( not ( = ?auto_135059 ?auto_135061 ) ) ( not ( = ?auto_135059 ?auto_135062 ) ) ( not ( = ?auto_135059 ?auto_135066 ) ) ( not ( = ?auto_135060 ?auto_135061 ) ) ( not ( = ?auto_135060 ?auto_135062 ) ) ( not ( = ?auto_135060 ?auto_135066 ) ) ( not ( = ?auto_135061 ?auto_135062 ) ) ( not ( = ?auto_135061 ?auto_135066 ) ) ( not ( = ?auto_135062 ?auto_135066 ) ) ( not ( = ?auto_135059 ?auto_135063 ) ) ( not ( = ?auto_135059 ?auto_135064 ) ) ( not ( = ?auto_135060 ?auto_135063 ) ) ( not ( = ?auto_135060 ?auto_135064 ) ) ( not ( = ?auto_135061 ?auto_135063 ) ) ( not ( = ?auto_135061 ?auto_135064 ) ) ( not ( = ?auto_135062 ?auto_135063 ) ) ( not ( = ?auto_135062 ?auto_135064 ) ) ( not ( = ?auto_135066 ?auto_135063 ) ) ( not ( = ?auto_135066 ?auto_135064 ) ) ( not ( = ?auto_135063 ?auto_135064 ) ) ( ON ?auto_135063 ?auto_135066 ) ( not ( = ?auto_135067 ?auto_135064 ) ) ( not ( = ?auto_135059 ?auto_135067 ) ) ( not ( = ?auto_135060 ?auto_135067 ) ) ( not ( = ?auto_135061 ?auto_135067 ) ) ( not ( = ?auto_135062 ?auto_135067 ) ) ( not ( = ?auto_135066 ?auto_135067 ) ) ( not ( = ?auto_135063 ?auto_135067 ) ) ( ON ?auto_135067 ?auto_135065 ) ( not ( = ?auto_135059 ?auto_135065 ) ) ( not ( = ?auto_135060 ?auto_135065 ) ) ( not ( = ?auto_135061 ?auto_135065 ) ) ( not ( = ?auto_135062 ?auto_135065 ) ) ( not ( = ?auto_135066 ?auto_135065 ) ) ( not ( = ?auto_135063 ?auto_135065 ) ) ( not ( = ?auto_135064 ?auto_135065 ) ) ( not ( = ?auto_135067 ?auto_135065 ) ) ( CLEAR ?auto_135063 ) ( ON ?auto_135064 ?auto_135067 ) ( CLEAR ?auto_135064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135065 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135065 ?auto_135067 )
      ( MAKE-4PILE ?auto_135059 ?auto_135060 ?auto_135061 ?auto_135062 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135068 - BLOCK
      ?auto_135069 - BLOCK
      ?auto_135070 - BLOCK
      ?auto_135071 - BLOCK
    )
    :vars
    (
      ?auto_135076 - BLOCK
      ?auto_135074 - BLOCK
      ?auto_135073 - BLOCK
      ?auto_135075 - BLOCK
      ?auto_135072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135076 ?auto_135071 ) ( ON-TABLE ?auto_135068 ) ( ON ?auto_135069 ?auto_135068 ) ( ON ?auto_135070 ?auto_135069 ) ( ON ?auto_135071 ?auto_135070 ) ( not ( = ?auto_135068 ?auto_135069 ) ) ( not ( = ?auto_135068 ?auto_135070 ) ) ( not ( = ?auto_135068 ?auto_135071 ) ) ( not ( = ?auto_135068 ?auto_135076 ) ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( not ( = ?auto_135069 ?auto_135071 ) ) ( not ( = ?auto_135069 ?auto_135076 ) ) ( not ( = ?auto_135070 ?auto_135071 ) ) ( not ( = ?auto_135070 ?auto_135076 ) ) ( not ( = ?auto_135071 ?auto_135076 ) ) ( not ( = ?auto_135068 ?auto_135074 ) ) ( not ( = ?auto_135068 ?auto_135073 ) ) ( not ( = ?auto_135069 ?auto_135074 ) ) ( not ( = ?auto_135069 ?auto_135073 ) ) ( not ( = ?auto_135070 ?auto_135074 ) ) ( not ( = ?auto_135070 ?auto_135073 ) ) ( not ( = ?auto_135071 ?auto_135074 ) ) ( not ( = ?auto_135071 ?auto_135073 ) ) ( not ( = ?auto_135076 ?auto_135074 ) ) ( not ( = ?auto_135076 ?auto_135073 ) ) ( not ( = ?auto_135074 ?auto_135073 ) ) ( not ( = ?auto_135075 ?auto_135073 ) ) ( not ( = ?auto_135068 ?auto_135075 ) ) ( not ( = ?auto_135069 ?auto_135075 ) ) ( not ( = ?auto_135070 ?auto_135075 ) ) ( not ( = ?auto_135071 ?auto_135075 ) ) ( not ( = ?auto_135076 ?auto_135075 ) ) ( not ( = ?auto_135074 ?auto_135075 ) ) ( ON ?auto_135075 ?auto_135072 ) ( not ( = ?auto_135068 ?auto_135072 ) ) ( not ( = ?auto_135069 ?auto_135072 ) ) ( not ( = ?auto_135070 ?auto_135072 ) ) ( not ( = ?auto_135071 ?auto_135072 ) ) ( not ( = ?auto_135076 ?auto_135072 ) ) ( not ( = ?auto_135074 ?auto_135072 ) ) ( not ( = ?auto_135073 ?auto_135072 ) ) ( not ( = ?auto_135075 ?auto_135072 ) ) ( ON ?auto_135073 ?auto_135075 ) ( CLEAR ?auto_135073 ) ( ON-TABLE ?auto_135072 ) ( HOLDING ?auto_135074 ) ( CLEAR ?auto_135076 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135068 ?auto_135069 ?auto_135070 ?auto_135071 ?auto_135076 ?auto_135074 )
      ( MAKE-4PILE ?auto_135068 ?auto_135069 ?auto_135070 ?auto_135071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135077 - BLOCK
      ?auto_135078 - BLOCK
      ?auto_135079 - BLOCK
      ?auto_135080 - BLOCK
    )
    :vars
    (
      ?auto_135085 - BLOCK
      ?auto_135083 - BLOCK
      ?auto_135084 - BLOCK
      ?auto_135082 - BLOCK
      ?auto_135081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135085 ?auto_135080 ) ( ON-TABLE ?auto_135077 ) ( ON ?auto_135078 ?auto_135077 ) ( ON ?auto_135079 ?auto_135078 ) ( ON ?auto_135080 ?auto_135079 ) ( not ( = ?auto_135077 ?auto_135078 ) ) ( not ( = ?auto_135077 ?auto_135079 ) ) ( not ( = ?auto_135077 ?auto_135080 ) ) ( not ( = ?auto_135077 ?auto_135085 ) ) ( not ( = ?auto_135078 ?auto_135079 ) ) ( not ( = ?auto_135078 ?auto_135080 ) ) ( not ( = ?auto_135078 ?auto_135085 ) ) ( not ( = ?auto_135079 ?auto_135080 ) ) ( not ( = ?auto_135079 ?auto_135085 ) ) ( not ( = ?auto_135080 ?auto_135085 ) ) ( not ( = ?auto_135077 ?auto_135083 ) ) ( not ( = ?auto_135077 ?auto_135084 ) ) ( not ( = ?auto_135078 ?auto_135083 ) ) ( not ( = ?auto_135078 ?auto_135084 ) ) ( not ( = ?auto_135079 ?auto_135083 ) ) ( not ( = ?auto_135079 ?auto_135084 ) ) ( not ( = ?auto_135080 ?auto_135083 ) ) ( not ( = ?auto_135080 ?auto_135084 ) ) ( not ( = ?auto_135085 ?auto_135083 ) ) ( not ( = ?auto_135085 ?auto_135084 ) ) ( not ( = ?auto_135083 ?auto_135084 ) ) ( not ( = ?auto_135082 ?auto_135084 ) ) ( not ( = ?auto_135077 ?auto_135082 ) ) ( not ( = ?auto_135078 ?auto_135082 ) ) ( not ( = ?auto_135079 ?auto_135082 ) ) ( not ( = ?auto_135080 ?auto_135082 ) ) ( not ( = ?auto_135085 ?auto_135082 ) ) ( not ( = ?auto_135083 ?auto_135082 ) ) ( ON ?auto_135082 ?auto_135081 ) ( not ( = ?auto_135077 ?auto_135081 ) ) ( not ( = ?auto_135078 ?auto_135081 ) ) ( not ( = ?auto_135079 ?auto_135081 ) ) ( not ( = ?auto_135080 ?auto_135081 ) ) ( not ( = ?auto_135085 ?auto_135081 ) ) ( not ( = ?auto_135083 ?auto_135081 ) ) ( not ( = ?auto_135084 ?auto_135081 ) ) ( not ( = ?auto_135082 ?auto_135081 ) ) ( ON ?auto_135084 ?auto_135082 ) ( ON-TABLE ?auto_135081 ) ( CLEAR ?auto_135085 ) ( ON ?auto_135083 ?auto_135084 ) ( CLEAR ?auto_135083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135081 ?auto_135082 ?auto_135084 )
      ( MAKE-4PILE ?auto_135077 ?auto_135078 ?auto_135079 ?auto_135080 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135104 - BLOCK
      ?auto_135105 - BLOCK
      ?auto_135106 - BLOCK
      ?auto_135107 - BLOCK
    )
    :vars
    (
      ?auto_135111 - BLOCK
      ?auto_135108 - BLOCK
      ?auto_135110 - BLOCK
      ?auto_135112 - BLOCK
      ?auto_135109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135104 ) ( ON ?auto_135105 ?auto_135104 ) ( ON ?auto_135106 ?auto_135105 ) ( not ( = ?auto_135104 ?auto_135105 ) ) ( not ( = ?auto_135104 ?auto_135106 ) ) ( not ( = ?auto_135104 ?auto_135107 ) ) ( not ( = ?auto_135104 ?auto_135111 ) ) ( not ( = ?auto_135105 ?auto_135106 ) ) ( not ( = ?auto_135105 ?auto_135107 ) ) ( not ( = ?auto_135105 ?auto_135111 ) ) ( not ( = ?auto_135106 ?auto_135107 ) ) ( not ( = ?auto_135106 ?auto_135111 ) ) ( not ( = ?auto_135107 ?auto_135111 ) ) ( not ( = ?auto_135104 ?auto_135108 ) ) ( not ( = ?auto_135104 ?auto_135110 ) ) ( not ( = ?auto_135105 ?auto_135108 ) ) ( not ( = ?auto_135105 ?auto_135110 ) ) ( not ( = ?auto_135106 ?auto_135108 ) ) ( not ( = ?auto_135106 ?auto_135110 ) ) ( not ( = ?auto_135107 ?auto_135108 ) ) ( not ( = ?auto_135107 ?auto_135110 ) ) ( not ( = ?auto_135111 ?auto_135108 ) ) ( not ( = ?auto_135111 ?auto_135110 ) ) ( not ( = ?auto_135108 ?auto_135110 ) ) ( not ( = ?auto_135112 ?auto_135110 ) ) ( not ( = ?auto_135104 ?auto_135112 ) ) ( not ( = ?auto_135105 ?auto_135112 ) ) ( not ( = ?auto_135106 ?auto_135112 ) ) ( not ( = ?auto_135107 ?auto_135112 ) ) ( not ( = ?auto_135111 ?auto_135112 ) ) ( not ( = ?auto_135108 ?auto_135112 ) ) ( ON ?auto_135112 ?auto_135109 ) ( not ( = ?auto_135104 ?auto_135109 ) ) ( not ( = ?auto_135105 ?auto_135109 ) ) ( not ( = ?auto_135106 ?auto_135109 ) ) ( not ( = ?auto_135107 ?auto_135109 ) ) ( not ( = ?auto_135111 ?auto_135109 ) ) ( not ( = ?auto_135108 ?auto_135109 ) ) ( not ( = ?auto_135110 ?auto_135109 ) ) ( not ( = ?auto_135112 ?auto_135109 ) ) ( ON ?auto_135110 ?auto_135112 ) ( ON-TABLE ?auto_135109 ) ( ON ?auto_135108 ?auto_135110 ) ( ON ?auto_135111 ?auto_135108 ) ( CLEAR ?auto_135111 ) ( HOLDING ?auto_135107 ) ( CLEAR ?auto_135106 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135104 ?auto_135105 ?auto_135106 ?auto_135107 ?auto_135111 )
      ( MAKE-4PILE ?auto_135104 ?auto_135105 ?auto_135106 ?auto_135107 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135113 - BLOCK
      ?auto_135114 - BLOCK
      ?auto_135115 - BLOCK
      ?auto_135116 - BLOCK
    )
    :vars
    (
      ?auto_135121 - BLOCK
      ?auto_135118 - BLOCK
      ?auto_135120 - BLOCK
      ?auto_135117 - BLOCK
      ?auto_135119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135113 ) ( ON ?auto_135114 ?auto_135113 ) ( ON ?auto_135115 ?auto_135114 ) ( not ( = ?auto_135113 ?auto_135114 ) ) ( not ( = ?auto_135113 ?auto_135115 ) ) ( not ( = ?auto_135113 ?auto_135116 ) ) ( not ( = ?auto_135113 ?auto_135121 ) ) ( not ( = ?auto_135114 ?auto_135115 ) ) ( not ( = ?auto_135114 ?auto_135116 ) ) ( not ( = ?auto_135114 ?auto_135121 ) ) ( not ( = ?auto_135115 ?auto_135116 ) ) ( not ( = ?auto_135115 ?auto_135121 ) ) ( not ( = ?auto_135116 ?auto_135121 ) ) ( not ( = ?auto_135113 ?auto_135118 ) ) ( not ( = ?auto_135113 ?auto_135120 ) ) ( not ( = ?auto_135114 ?auto_135118 ) ) ( not ( = ?auto_135114 ?auto_135120 ) ) ( not ( = ?auto_135115 ?auto_135118 ) ) ( not ( = ?auto_135115 ?auto_135120 ) ) ( not ( = ?auto_135116 ?auto_135118 ) ) ( not ( = ?auto_135116 ?auto_135120 ) ) ( not ( = ?auto_135121 ?auto_135118 ) ) ( not ( = ?auto_135121 ?auto_135120 ) ) ( not ( = ?auto_135118 ?auto_135120 ) ) ( not ( = ?auto_135117 ?auto_135120 ) ) ( not ( = ?auto_135113 ?auto_135117 ) ) ( not ( = ?auto_135114 ?auto_135117 ) ) ( not ( = ?auto_135115 ?auto_135117 ) ) ( not ( = ?auto_135116 ?auto_135117 ) ) ( not ( = ?auto_135121 ?auto_135117 ) ) ( not ( = ?auto_135118 ?auto_135117 ) ) ( ON ?auto_135117 ?auto_135119 ) ( not ( = ?auto_135113 ?auto_135119 ) ) ( not ( = ?auto_135114 ?auto_135119 ) ) ( not ( = ?auto_135115 ?auto_135119 ) ) ( not ( = ?auto_135116 ?auto_135119 ) ) ( not ( = ?auto_135121 ?auto_135119 ) ) ( not ( = ?auto_135118 ?auto_135119 ) ) ( not ( = ?auto_135120 ?auto_135119 ) ) ( not ( = ?auto_135117 ?auto_135119 ) ) ( ON ?auto_135120 ?auto_135117 ) ( ON-TABLE ?auto_135119 ) ( ON ?auto_135118 ?auto_135120 ) ( ON ?auto_135121 ?auto_135118 ) ( CLEAR ?auto_135115 ) ( ON ?auto_135116 ?auto_135121 ) ( CLEAR ?auto_135116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135119 ?auto_135117 ?auto_135120 ?auto_135118 ?auto_135121 )
      ( MAKE-4PILE ?auto_135113 ?auto_135114 ?auto_135115 ?auto_135116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135122 - BLOCK
      ?auto_135123 - BLOCK
      ?auto_135124 - BLOCK
      ?auto_135125 - BLOCK
    )
    :vars
    (
      ?auto_135130 - BLOCK
      ?auto_135127 - BLOCK
      ?auto_135128 - BLOCK
      ?auto_135129 - BLOCK
      ?auto_135126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135122 ) ( ON ?auto_135123 ?auto_135122 ) ( not ( = ?auto_135122 ?auto_135123 ) ) ( not ( = ?auto_135122 ?auto_135124 ) ) ( not ( = ?auto_135122 ?auto_135125 ) ) ( not ( = ?auto_135122 ?auto_135130 ) ) ( not ( = ?auto_135123 ?auto_135124 ) ) ( not ( = ?auto_135123 ?auto_135125 ) ) ( not ( = ?auto_135123 ?auto_135130 ) ) ( not ( = ?auto_135124 ?auto_135125 ) ) ( not ( = ?auto_135124 ?auto_135130 ) ) ( not ( = ?auto_135125 ?auto_135130 ) ) ( not ( = ?auto_135122 ?auto_135127 ) ) ( not ( = ?auto_135122 ?auto_135128 ) ) ( not ( = ?auto_135123 ?auto_135127 ) ) ( not ( = ?auto_135123 ?auto_135128 ) ) ( not ( = ?auto_135124 ?auto_135127 ) ) ( not ( = ?auto_135124 ?auto_135128 ) ) ( not ( = ?auto_135125 ?auto_135127 ) ) ( not ( = ?auto_135125 ?auto_135128 ) ) ( not ( = ?auto_135130 ?auto_135127 ) ) ( not ( = ?auto_135130 ?auto_135128 ) ) ( not ( = ?auto_135127 ?auto_135128 ) ) ( not ( = ?auto_135129 ?auto_135128 ) ) ( not ( = ?auto_135122 ?auto_135129 ) ) ( not ( = ?auto_135123 ?auto_135129 ) ) ( not ( = ?auto_135124 ?auto_135129 ) ) ( not ( = ?auto_135125 ?auto_135129 ) ) ( not ( = ?auto_135130 ?auto_135129 ) ) ( not ( = ?auto_135127 ?auto_135129 ) ) ( ON ?auto_135129 ?auto_135126 ) ( not ( = ?auto_135122 ?auto_135126 ) ) ( not ( = ?auto_135123 ?auto_135126 ) ) ( not ( = ?auto_135124 ?auto_135126 ) ) ( not ( = ?auto_135125 ?auto_135126 ) ) ( not ( = ?auto_135130 ?auto_135126 ) ) ( not ( = ?auto_135127 ?auto_135126 ) ) ( not ( = ?auto_135128 ?auto_135126 ) ) ( not ( = ?auto_135129 ?auto_135126 ) ) ( ON ?auto_135128 ?auto_135129 ) ( ON-TABLE ?auto_135126 ) ( ON ?auto_135127 ?auto_135128 ) ( ON ?auto_135130 ?auto_135127 ) ( ON ?auto_135125 ?auto_135130 ) ( CLEAR ?auto_135125 ) ( HOLDING ?auto_135124 ) ( CLEAR ?auto_135123 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135122 ?auto_135123 ?auto_135124 )
      ( MAKE-4PILE ?auto_135122 ?auto_135123 ?auto_135124 ?auto_135125 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135131 - BLOCK
      ?auto_135132 - BLOCK
      ?auto_135133 - BLOCK
      ?auto_135134 - BLOCK
    )
    :vars
    (
      ?auto_135136 - BLOCK
      ?auto_135137 - BLOCK
      ?auto_135138 - BLOCK
      ?auto_135135 - BLOCK
      ?auto_135139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135131 ) ( ON ?auto_135132 ?auto_135131 ) ( not ( = ?auto_135131 ?auto_135132 ) ) ( not ( = ?auto_135131 ?auto_135133 ) ) ( not ( = ?auto_135131 ?auto_135134 ) ) ( not ( = ?auto_135131 ?auto_135136 ) ) ( not ( = ?auto_135132 ?auto_135133 ) ) ( not ( = ?auto_135132 ?auto_135134 ) ) ( not ( = ?auto_135132 ?auto_135136 ) ) ( not ( = ?auto_135133 ?auto_135134 ) ) ( not ( = ?auto_135133 ?auto_135136 ) ) ( not ( = ?auto_135134 ?auto_135136 ) ) ( not ( = ?auto_135131 ?auto_135137 ) ) ( not ( = ?auto_135131 ?auto_135138 ) ) ( not ( = ?auto_135132 ?auto_135137 ) ) ( not ( = ?auto_135132 ?auto_135138 ) ) ( not ( = ?auto_135133 ?auto_135137 ) ) ( not ( = ?auto_135133 ?auto_135138 ) ) ( not ( = ?auto_135134 ?auto_135137 ) ) ( not ( = ?auto_135134 ?auto_135138 ) ) ( not ( = ?auto_135136 ?auto_135137 ) ) ( not ( = ?auto_135136 ?auto_135138 ) ) ( not ( = ?auto_135137 ?auto_135138 ) ) ( not ( = ?auto_135135 ?auto_135138 ) ) ( not ( = ?auto_135131 ?auto_135135 ) ) ( not ( = ?auto_135132 ?auto_135135 ) ) ( not ( = ?auto_135133 ?auto_135135 ) ) ( not ( = ?auto_135134 ?auto_135135 ) ) ( not ( = ?auto_135136 ?auto_135135 ) ) ( not ( = ?auto_135137 ?auto_135135 ) ) ( ON ?auto_135135 ?auto_135139 ) ( not ( = ?auto_135131 ?auto_135139 ) ) ( not ( = ?auto_135132 ?auto_135139 ) ) ( not ( = ?auto_135133 ?auto_135139 ) ) ( not ( = ?auto_135134 ?auto_135139 ) ) ( not ( = ?auto_135136 ?auto_135139 ) ) ( not ( = ?auto_135137 ?auto_135139 ) ) ( not ( = ?auto_135138 ?auto_135139 ) ) ( not ( = ?auto_135135 ?auto_135139 ) ) ( ON ?auto_135138 ?auto_135135 ) ( ON-TABLE ?auto_135139 ) ( ON ?auto_135137 ?auto_135138 ) ( ON ?auto_135136 ?auto_135137 ) ( ON ?auto_135134 ?auto_135136 ) ( CLEAR ?auto_135132 ) ( ON ?auto_135133 ?auto_135134 ) ( CLEAR ?auto_135133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135139 ?auto_135135 ?auto_135138 ?auto_135137 ?auto_135136 ?auto_135134 )
      ( MAKE-4PILE ?auto_135131 ?auto_135132 ?auto_135133 ?auto_135134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135140 - BLOCK
      ?auto_135141 - BLOCK
      ?auto_135142 - BLOCK
      ?auto_135143 - BLOCK
    )
    :vars
    (
      ?auto_135145 - BLOCK
      ?auto_135147 - BLOCK
      ?auto_135146 - BLOCK
      ?auto_135148 - BLOCK
      ?auto_135144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135140 ) ( not ( = ?auto_135140 ?auto_135141 ) ) ( not ( = ?auto_135140 ?auto_135142 ) ) ( not ( = ?auto_135140 ?auto_135143 ) ) ( not ( = ?auto_135140 ?auto_135145 ) ) ( not ( = ?auto_135141 ?auto_135142 ) ) ( not ( = ?auto_135141 ?auto_135143 ) ) ( not ( = ?auto_135141 ?auto_135145 ) ) ( not ( = ?auto_135142 ?auto_135143 ) ) ( not ( = ?auto_135142 ?auto_135145 ) ) ( not ( = ?auto_135143 ?auto_135145 ) ) ( not ( = ?auto_135140 ?auto_135147 ) ) ( not ( = ?auto_135140 ?auto_135146 ) ) ( not ( = ?auto_135141 ?auto_135147 ) ) ( not ( = ?auto_135141 ?auto_135146 ) ) ( not ( = ?auto_135142 ?auto_135147 ) ) ( not ( = ?auto_135142 ?auto_135146 ) ) ( not ( = ?auto_135143 ?auto_135147 ) ) ( not ( = ?auto_135143 ?auto_135146 ) ) ( not ( = ?auto_135145 ?auto_135147 ) ) ( not ( = ?auto_135145 ?auto_135146 ) ) ( not ( = ?auto_135147 ?auto_135146 ) ) ( not ( = ?auto_135148 ?auto_135146 ) ) ( not ( = ?auto_135140 ?auto_135148 ) ) ( not ( = ?auto_135141 ?auto_135148 ) ) ( not ( = ?auto_135142 ?auto_135148 ) ) ( not ( = ?auto_135143 ?auto_135148 ) ) ( not ( = ?auto_135145 ?auto_135148 ) ) ( not ( = ?auto_135147 ?auto_135148 ) ) ( ON ?auto_135148 ?auto_135144 ) ( not ( = ?auto_135140 ?auto_135144 ) ) ( not ( = ?auto_135141 ?auto_135144 ) ) ( not ( = ?auto_135142 ?auto_135144 ) ) ( not ( = ?auto_135143 ?auto_135144 ) ) ( not ( = ?auto_135145 ?auto_135144 ) ) ( not ( = ?auto_135147 ?auto_135144 ) ) ( not ( = ?auto_135146 ?auto_135144 ) ) ( not ( = ?auto_135148 ?auto_135144 ) ) ( ON ?auto_135146 ?auto_135148 ) ( ON-TABLE ?auto_135144 ) ( ON ?auto_135147 ?auto_135146 ) ( ON ?auto_135145 ?auto_135147 ) ( ON ?auto_135143 ?auto_135145 ) ( ON ?auto_135142 ?auto_135143 ) ( CLEAR ?auto_135142 ) ( HOLDING ?auto_135141 ) ( CLEAR ?auto_135140 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135140 ?auto_135141 )
      ( MAKE-4PILE ?auto_135140 ?auto_135141 ?auto_135142 ?auto_135143 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135149 - BLOCK
      ?auto_135150 - BLOCK
      ?auto_135151 - BLOCK
      ?auto_135152 - BLOCK
    )
    :vars
    (
      ?auto_135157 - BLOCK
      ?auto_135153 - BLOCK
      ?auto_135156 - BLOCK
      ?auto_135154 - BLOCK
      ?auto_135155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135149 ) ( not ( = ?auto_135149 ?auto_135150 ) ) ( not ( = ?auto_135149 ?auto_135151 ) ) ( not ( = ?auto_135149 ?auto_135152 ) ) ( not ( = ?auto_135149 ?auto_135157 ) ) ( not ( = ?auto_135150 ?auto_135151 ) ) ( not ( = ?auto_135150 ?auto_135152 ) ) ( not ( = ?auto_135150 ?auto_135157 ) ) ( not ( = ?auto_135151 ?auto_135152 ) ) ( not ( = ?auto_135151 ?auto_135157 ) ) ( not ( = ?auto_135152 ?auto_135157 ) ) ( not ( = ?auto_135149 ?auto_135153 ) ) ( not ( = ?auto_135149 ?auto_135156 ) ) ( not ( = ?auto_135150 ?auto_135153 ) ) ( not ( = ?auto_135150 ?auto_135156 ) ) ( not ( = ?auto_135151 ?auto_135153 ) ) ( not ( = ?auto_135151 ?auto_135156 ) ) ( not ( = ?auto_135152 ?auto_135153 ) ) ( not ( = ?auto_135152 ?auto_135156 ) ) ( not ( = ?auto_135157 ?auto_135153 ) ) ( not ( = ?auto_135157 ?auto_135156 ) ) ( not ( = ?auto_135153 ?auto_135156 ) ) ( not ( = ?auto_135154 ?auto_135156 ) ) ( not ( = ?auto_135149 ?auto_135154 ) ) ( not ( = ?auto_135150 ?auto_135154 ) ) ( not ( = ?auto_135151 ?auto_135154 ) ) ( not ( = ?auto_135152 ?auto_135154 ) ) ( not ( = ?auto_135157 ?auto_135154 ) ) ( not ( = ?auto_135153 ?auto_135154 ) ) ( ON ?auto_135154 ?auto_135155 ) ( not ( = ?auto_135149 ?auto_135155 ) ) ( not ( = ?auto_135150 ?auto_135155 ) ) ( not ( = ?auto_135151 ?auto_135155 ) ) ( not ( = ?auto_135152 ?auto_135155 ) ) ( not ( = ?auto_135157 ?auto_135155 ) ) ( not ( = ?auto_135153 ?auto_135155 ) ) ( not ( = ?auto_135156 ?auto_135155 ) ) ( not ( = ?auto_135154 ?auto_135155 ) ) ( ON ?auto_135156 ?auto_135154 ) ( ON-TABLE ?auto_135155 ) ( ON ?auto_135153 ?auto_135156 ) ( ON ?auto_135157 ?auto_135153 ) ( ON ?auto_135152 ?auto_135157 ) ( ON ?auto_135151 ?auto_135152 ) ( CLEAR ?auto_135149 ) ( ON ?auto_135150 ?auto_135151 ) ( CLEAR ?auto_135150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135155 ?auto_135154 ?auto_135156 ?auto_135153 ?auto_135157 ?auto_135152 ?auto_135151 )
      ( MAKE-4PILE ?auto_135149 ?auto_135150 ?auto_135151 ?auto_135152 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135158 - BLOCK
      ?auto_135159 - BLOCK
      ?auto_135160 - BLOCK
      ?auto_135161 - BLOCK
    )
    :vars
    (
      ?auto_135163 - BLOCK
      ?auto_135164 - BLOCK
      ?auto_135165 - BLOCK
      ?auto_135162 - BLOCK
      ?auto_135166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135158 ?auto_135159 ) ) ( not ( = ?auto_135158 ?auto_135160 ) ) ( not ( = ?auto_135158 ?auto_135161 ) ) ( not ( = ?auto_135158 ?auto_135163 ) ) ( not ( = ?auto_135159 ?auto_135160 ) ) ( not ( = ?auto_135159 ?auto_135161 ) ) ( not ( = ?auto_135159 ?auto_135163 ) ) ( not ( = ?auto_135160 ?auto_135161 ) ) ( not ( = ?auto_135160 ?auto_135163 ) ) ( not ( = ?auto_135161 ?auto_135163 ) ) ( not ( = ?auto_135158 ?auto_135164 ) ) ( not ( = ?auto_135158 ?auto_135165 ) ) ( not ( = ?auto_135159 ?auto_135164 ) ) ( not ( = ?auto_135159 ?auto_135165 ) ) ( not ( = ?auto_135160 ?auto_135164 ) ) ( not ( = ?auto_135160 ?auto_135165 ) ) ( not ( = ?auto_135161 ?auto_135164 ) ) ( not ( = ?auto_135161 ?auto_135165 ) ) ( not ( = ?auto_135163 ?auto_135164 ) ) ( not ( = ?auto_135163 ?auto_135165 ) ) ( not ( = ?auto_135164 ?auto_135165 ) ) ( not ( = ?auto_135162 ?auto_135165 ) ) ( not ( = ?auto_135158 ?auto_135162 ) ) ( not ( = ?auto_135159 ?auto_135162 ) ) ( not ( = ?auto_135160 ?auto_135162 ) ) ( not ( = ?auto_135161 ?auto_135162 ) ) ( not ( = ?auto_135163 ?auto_135162 ) ) ( not ( = ?auto_135164 ?auto_135162 ) ) ( ON ?auto_135162 ?auto_135166 ) ( not ( = ?auto_135158 ?auto_135166 ) ) ( not ( = ?auto_135159 ?auto_135166 ) ) ( not ( = ?auto_135160 ?auto_135166 ) ) ( not ( = ?auto_135161 ?auto_135166 ) ) ( not ( = ?auto_135163 ?auto_135166 ) ) ( not ( = ?auto_135164 ?auto_135166 ) ) ( not ( = ?auto_135165 ?auto_135166 ) ) ( not ( = ?auto_135162 ?auto_135166 ) ) ( ON ?auto_135165 ?auto_135162 ) ( ON-TABLE ?auto_135166 ) ( ON ?auto_135164 ?auto_135165 ) ( ON ?auto_135163 ?auto_135164 ) ( ON ?auto_135161 ?auto_135163 ) ( ON ?auto_135160 ?auto_135161 ) ( ON ?auto_135159 ?auto_135160 ) ( CLEAR ?auto_135159 ) ( HOLDING ?auto_135158 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135158 )
      ( MAKE-4PILE ?auto_135158 ?auto_135159 ?auto_135160 ?auto_135161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135167 - BLOCK
      ?auto_135168 - BLOCK
      ?auto_135169 - BLOCK
      ?auto_135170 - BLOCK
    )
    :vars
    (
      ?auto_135172 - BLOCK
      ?auto_135173 - BLOCK
      ?auto_135171 - BLOCK
      ?auto_135175 - BLOCK
      ?auto_135174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135167 ?auto_135168 ) ) ( not ( = ?auto_135167 ?auto_135169 ) ) ( not ( = ?auto_135167 ?auto_135170 ) ) ( not ( = ?auto_135167 ?auto_135172 ) ) ( not ( = ?auto_135168 ?auto_135169 ) ) ( not ( = ?auto_135168 ?auto_135170 ) ) ( not ( = ?auto_135168 ?auto_135172 ) ) ( not ( = ?auto_135169 ?auto_135170 ) ) ( not ( = ?auto_135169 ?auto_135172 ) ) ( not ( = ?auto_135170 ?auto_135172 ) ) ( not ( = ?auto_135167 ?auto_135173 ) ) ( not ( = ?auto_135167 ?auto_135171 ) ) ( not ( = ?auto_135168 ?auto_135173 ) ) ( not ( = ?auto_135168 ?auto_135171 ) ) ( not ( = ?auto_135169 ?auto_135173 ) ) ( not ( = ?auto_135169 ?auto_135171 ) ) ( not ( = ?auto_135170 ?auto_135173 ) ) ( not ( = ?auto_135170 ?auto_135171 ) ) ( not ( = ?auto_135172 ?auto_135173 ) ) ( not ( = ?auto_135172 ?auto_135171 ) ) ( not ( = ?auto_135173 ?auto_135171 ) ) ( not ( = ?auto_135175 ?auto_135171 ) ) ( not ( = ?auto_135167 ?auto_135175 ) ) ( not ( = ?auto_135168 ?auto_135175 ) ) ( not ( = ?auto_135169 ?auto_135175 ) ) ( not ( = ?auto_135170 ?auto_135175 ) ) ( not ( = ?auto_135172 ?auto_135175 ) ) ( not ( = ?auto_135173 ?auto_135175 ) ) ( ON ?auto_135175 ?auto_135174 ) ( not ( = ?auto_135167 ?auto_135174 ) ) ( not ( = ?auto_135168 ?auto_135174 ) ) ( not ( = ?auto_135169 ?auto_135174 ) ) ( not ( = ?auto_135170 ?auto_135174 ) ) ( not ( = ?auto_135172 ?auto_135174 ) ) ( not ( = ?auto_135173 ?auto_135174 ) ) ( not ( = ?auto_135171 ?auto_135174 ) ) ( not ( = ?auto_135175 ?auto_135174 ) ) ( ON ?auto_135171 ?auto_135175 ) ( ON-TABLE ?auto_135174 ) ( ON ?auto_135173 ?auto_135171 ) ( ON ?auto_135172 ?auto_135173 ) ( ON ?auto_135170 ?auto_135172 ) ( ON ?auto_135169 ?auto_135170 ) ( ON ?auto_135168 ?auto_135169 ) ( ON ?auto_135167 ?auto_135168 ) ( CLEAR ?auto_135167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135174 ?auto_135175 ?auto_135171 ?auto_135173 ?auto_135172 ?auto_135170 ?auto_135169 ?auto_135168 )
      ( MAKE-4PILE ?auto_135167 ?auto_135168 ?auto_135169 ?auto_135170 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135180 - BLOCK
      ?auto_135181 - BLOCK
      ?auto_135182 - BLOCK
      ?auto_135183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135183 ) ( CLEAR ?auto_135182 ) ( ON-TABLE ?auto_135180 ) ( ON ?auto_135181 ?auto_135180 ) ( ON ?auto_135182 ?auto_135181 ) ( not ( = ?auto_135180 ?auto_135181 ) ) ( not ( = ?auto_135180 ?auto_135182 ) ) ( not ( = ?auto_135180 ?auto_135183 ) ) ( not ( = ?auto_135181 ?auto_135182 ) ) ( not ( = ?auto_135181 ?auto_135183 ) ) ( not ( = ?auto_135182 ?auto_135183 ) ) )
    :subtasks
    ( ( !STACK ?auto_135183 ?auto_135182 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135184 - BLOCK
      ?auto_135185 - BLOCK
      ?auto_135186 - BLOCK
      ?auto_135187 - BLOCK
    )
    :vars
    (
      ?auto_135188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135186 ) ( ON-TABLE ?auto_135184 ) ( ON ?auto_135185 ?auto_135184 ) ( ON ?auto_135186 ?auto_135185 ) ( not ( = ?auto_135184 ?auto_135185 ) ) ( not ( = ?auto_135184 ?auto_135186 ) ) ( not ( = ?auto_135184 ?auto_135187 ) ) ( not ( = ?auto_135185 ?auto_135186 ) ) ( not ( = ?auto_135185 ?auto_135187 ) ) ( not ( = ?auto_135186 ?auto_135187 ) ) ( ON ?auto_135187 ?auto_135188 ) ( CLEAR ?auto_135187 ) ( HAND-EMPTY ) ( not ( = ?auto_135184 ?auto_135188 ) ) ( not ( = ?auto_135185 ?auto_135188 ) ) ( not ( = ?auto_135186 ?auto_135188 ) ) ( not ( = ?auto_135187 ?auto_135188 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135187 ?auto_135188 )
      ( MAKE-4PILE ?auto_135184 ?auto_135185 ?auto_135186 ?auto_135187 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135189 - BLOCK
      ?auto_135190 - BLOCK
      ?auto_135191 - BLOCK
      ?auto_135192 - BLOCK
    )
    :vars
    (
      ?auto_135193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135189 ) ( ON ?auto_135190 ?auto_135189 ) ( not ( = ?auto_135189 ?auto_135190 ) ) ( not ( = ?auto_135189 ?auto_135191 ) ) ( not ( = ?auto_135189 ?auto_135192 ) ) ( not ( = ?auto_135190 ?auto_135191 ) ) ( not ( = ?auto_135190 ?auto_135192 ) ) ( not ( = ?auto_135191 ?auto_135192 ) ) ( ON ?auto_135192 ?auto_135193 ) ( CLEAR ?auto_135192 ) ( not ( = ?auto_135189 ?auto_135193 ) ) ( not ( = ?auto_135190 ?auto_135193 ) ) ( not ( = ?auto_135191 ?auto_135193 ) ) ( not ( = ?auto_135192 ?auto_135193 ) ) ( HOLDING ?auto_135191 ) ( CLEAR ?auto_135190 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135189 ?auto_135190 ?auto_135191 )
      ( MAKE-4PILE ?auto_135189 ?auto_135190 ?auto_135191 ?auto_135192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135194 - BLOCK
      ?auto_135195 - BLOCK
      ?auto_135196 - BLOCK
      ?auto_135197 - BLOCK
    )
    :vars
    (
      ?auto_135198 - BLOCK
      ?auto_135201 - BLOCK
      ?auto_135200 - BLOCK
      ?auto_135199 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135194 ) ( ON ?auto_135195 ?auto_135194 ) ( not ( = ?auto_135194 ?auto_135195 ) ) ( not ( = ?auto_135194 ?auto_135196 ) ) ( not ( = ?auto_135194 ?auto_135197 ) ) ( not ( = ?auto_135195 ?auto_135196 ) ) ( not ( = ?auto_135195 ?auto_135197 ) ) ( not ( = ?auto_135196 ?auto_135197 ) ) ( ON ?auto_135197 ?auto_135198 ) ( not ( = ?auto_135194 ?auto_135198 ) ) ( not ( = ?auto_135195 ?auto_135198 ) ) ( not ( = ?auto_135196 ?auto_135198 ) ) ( not ( = ?auto_135197 ?auto_135198 ) ) ( CLEAR ?auto_135195 ) ( ON ?auto_135196 ?auto_135197 ) ( CLEAR ?auto_135196 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135201 ) ( ON ?auto_135200 ?auto_135201 ) ( ON ?auto_135199 ?auto_135200 ) ( ON ?auto_135198 ?auto_135199 ) ( not ( = ?auto_135201 ?auto_135200 ) ) ( not ( = ?auto_135201 ?auto_135199 ) ) ( not ( = ?auto_135201 ?auto_135198 ) ) ( not ( = ?auto_135201 ?auto_135197 ) ) ( not ( = ?auto_135201 ?auto_135196 ) ) ( not ( = ?auto_135200 ?auto_135199 ) ) ( not ( = ?auto_135200 ?auto_135198 ) ) ( not ( = ?auto_135200 ?auto_135197 ) ) ( not ( = ?auto_135200 ?auto_135196 ) ) ( not ( = ?auto_135199 ?auto_135198 ) ) ( not ( = ?auto_135199 ?auto_135197 ) ) ( not ( = ?auto_135199 ?auto_135196 ) ) ( not ( = ?auto_135194 ?auto_135201 ) ) ( not ( = ?auto_135194 ?auto_135200 ) ) ( not ( = ?auto_135194 ?auto_135199 ) ) ( not ( = ?auto_135195 ?auto_135201 ) ) ( not ( = ?auto_135195 ?auto_135200 ) ) ( not ( = ?auto_135195 ?auto_135199 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135201 ?auto_135200 ?auto_135199 ?auto_135198 ?auto_135197 )
      ( MAKE-4PILE ?auto_135194 ?auto_135195 ?auto_135196 ?auto_135197 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135202 - BLOCK
      ?auto_135203 - BLOCK
      ?auto_135204 - BLOCK
      ?auto_135205 - BLOCK
    )
    :vars
    (
      ?auto_135206 - BLOCK
      ?auto_135209 - BLOCK
      ?auto_135207 - BLOCK
      ?auto_135208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135202 ) ( not ( = ?auto_135202 ?auto_135203 ) ) ( not ( = ?auto_135202 ?auto_135204 ) ) ( not ( = ?auto_135202 ?auto_135205 ) ) ( not ( = ?auto_135203 ?auto_135204 ) ) ( not ( = ?auto_135203 ?auto_135205 ) ) ( not ( = ?auto_135204 ?auto_135205 ) ) ( ON ?auto_135205 ?auto_135206 ) ( not ( = ?auto_135202 ?auto_135206 ) ) ( not ( = ?auto_135203 ?auto_135206 ) ) ( not ( = ?auto_135204 ?auto_135206 ) ) ( not ( = ?auto_135205 ?auto_135206 ) ) ( ON ?auto_135204 ?auto_135205 ) ( CLEAR ?auto_135204 ) ( ON-TABLE ?auto_135209 ) ( ON ?auto_135207 ?auto_135209 ) ( ON ?auto_135208 ?auto_135207 ) ( ON ?auto_135206 ?auto_135208 ) ( not ( = ?auto_135209 ?auto_135207 ) ) ( not ( = ?auto_135209 ?auto_135208 ) ) ( not ( = ?auto_135209 ?auto_135206 ) ) ( not ( = ?auto_135209 ?auto_135205 ) ) ( not ( = ?auto_135209 ?auto_135204 ) ) ( not ( = ?auto_135207 ?auto_135208 ) ) ( not ( = ?auto_135207 ?auto_135206 ) ) ( not ( = ?auto_135207 ?auto_135205 ) ) ( not ( = ?auto_135207 ?auto_135204 ) ) ( not ( = ?auto_135208 ?auto_135206 ) ) ( not ( = ?auto_135208 ?auto_135205 ) ) ( not ( = ?auto_135208 ?auto_135204 ) ) ( not ( = ?auto_135202 ?auto_135209 ) ) ( not ( = ?auto_135202 ?auto_135207 ) ) ( not ( = ?auto_135202 ?auto_135208 ) ) ( not ( = ?auto_135203 ?auto_135209 ) ) ( not ( = ?auto_135203 ?auto_135207 ) ) ( not ( = ?auto_135203 ?auto_135208 ) ) ( HOLDING ?auto_135203 ) ( CLEAR ?auto_135202 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135202 ?auto_135203 )
      ( MAKE-4PILE ?auto_135202 ?auto_135203 ?auto_135204 ?auto_135205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135210 - BLOCK
      ?auto_135211 - BLOCK
      ?auto_135212 - BLOCK
      ?auto_135213 - BLOCK
    )
    :vars
    (
      ?auto_135214 - BLOCK
      ?auto_135215 - BLOCK
      ?auto_135216 - BLOCK
      ?auto_135217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135210 ) ( not ( = ?auto_135210 ?auto_135211 ) ) ( not ( = ?auto_135210 ?auto_135212 ) ) ( not ( = ?auto_135210 ?auto_135213 ) ) ( not ( = ?auto_135211 ?auto_135212 ) ) ( not ( = ?auto_135211 ?auto_135213 ) ) ( not ( = ?auto_135212 ?auto_135213 ) ) ( ON ?auto_135213 ?auto_135214 ) ( not ( = ?auto_135210 ?auto_135214 ) ) ( not ( = ?auto_135211 ?auto_135214 ) ) ( not ( = ?auto_135212 ?auto_135214 ) ) ( not ( = ?auto_135213 ?auto_135214 ) ) ( ON ?auto_135212 ?auto_135213 ) ( ON-TABLE ?auto_135215 ) ( ON ?auto_135216 ?auto_135215 ) ( ON ?auto_135217 ?auto_135216 ) ( ON ?auto_135214 ?auto_135217 ) ( not ( = ?auto_135215 ?auto_135216 ) ) ( not ( = ?auto_135215 ?auto_135217 ) ) ( not ( = ?auto_135215 ?auto_135214 ) ) ( not ( = ?auto_135215 ?auto_135213 ) ) ( not ( = ?auto_135215 ?auto_135212 ) ) ( not ( = ?auto_135216 ?auto_135217 ) ) ( not ( = ?auto_135216 ?auto_135214 ) ) ( not ( = ?auto_135216 ?auto_135213 ) ) ( not ( = ?auto_135216 ?auto_135212 ) ) ( not ( = ?auto_135217 ?auto_135214 ) ) ( not ( = ?auto_135217 ?auto_135213 ) ) ( not ( = ?auto_135217 ?auto_135212 ) ) ( not ( = ?auto_135210 ?auto_135215 ) ) ( not ( = ?auto_135210 ?auto_135216 ) ) ( not ( = ?auto_135210 ?auto_135217 ) ) ( not ( = ?auto_135211 ?auto_135215 ) ) ( not ( = ?auto_135211 ?auto_135216 ) ) ( not ( = ?auto_135211 ?auto_135217 ) ) ( CLEAR ?auto_135210 ) ( ON ?auto_135211 ?auto_135212 ) ( CLEAR ?auto_135211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135215 ?auto_135216 ?auto_135217 ?auto_135214 ?auto_135213 ?auto_135212 )
      ( MAKE-4PILE ?auto_135210 ?auto_135211 ?auto_135212 ?auto_135213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135218 - BLOCK
      ?auto_135219 - BLOCK
      ?auto_135220 - BLOCK
      ?auto_135221 - BLOCK
    )
    :vars
    (
      ?auto_135224 - BLOCK
      ?auto_135225 - BLOCK
      ?auto_135223 - BLOCK
      ?auto_135222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135218 ?auto_135219 ) ) ( not ( = ?auto_135218 ?auto_135220 ) ) ( not ( = ?auto_135218 ?auto_135221 ) ) ( not ( = ?auto_135219 ?auto_135220 ) ) ( not ( = ?auto_135219 ?auto_135221 ) ) ( not ( = ?auto_135220 ?auto_135221 ) ) ( ON ?auto_135221 ?auto_135224 ) ( not ( = ?auto_135218 ?auto_135224 ) ) ( not ( = ?auto_135219 ?auto_135224 ) ) ( not ( = ?auto_135220 ?auto_135224 ) ) ( not ( = ?auto_135221 ?auto_135224 ) ) ( ON ?auto_135220 ?auto_135221 ) ( ON-TABLE ?auto_135225 ) ( ON ?auto_135223 ?auto_135225 ) ( ON ?auto_135222 ?auto_135223 ) ( ON ?auto_135224 ?auto_135222 ) ( not ( = ?auto_135225 ?auto_135223 ) ) ( not ( = ?auto_135225 ?auto_135222 ) ) ( not ( = ?auto_135225 ?auto_135224 ) ) ( not ( = ?auto_135225 ?auto_135221 ) ) ( not ( = ?auto_135225 ?auto_135220 ) ) ( not ( = ?auto_135223 ?auto_135222 ) ) ( not ( = ?auto_135223 ?auto_135224 ) ) ( not ( = ?auto_135223 ?auto_135221 ) ) ( not ( = ?auto_135223 ?auto_135220 ) ) ( not ( = ?auto_135222 ?auto_135224 ) ) ( not ( = ?auto_135222 ?auto_135221 ) ) ( not ( = ?auto_135222 ?auto_135220 ) ) ( not ( = ?auto_135218 ?auto_135225 ) ) ( not ( = ?auto_135218 ?auto_135223 ) ) ( not ( = ?auto_135218 ?auto_135222 ) ) ( not ( = ?auto_135219 ?auto_135225 ) ) ( not ( = ?auto_135219 ?auto_135223 ) ) ( not ( = ?auto_135219 ?auto_135222 ) ) ( ON ?auto_135219 ?auto_135220 ) ( CLEAR ?auto_135219 ) ( HOLDING ?auto_135218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135218 )
      ( MAKE-4PILE ?auto_135218 ?auto_135219 ?auto_135220 ?auto_135221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135226 - BLOCK
      ?auto_135227 - BLOCK
      ?auto_135228 - BLOCK
      ?auto_135229 - BLOCK
    )
    :vars
    (
      ?auto_135231 - BLOCK
      ?auto_135232 - BLOCK
      ?auto_135230 - BLOCK
      ?auto_135233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135226 ?auto_135227 ) ) ( not ( = ?auto_135226 ?auto_135228 ) ) ( not ( = ?auto_135226 ?auto_135229 ) ) ( not ( = ?auto_135227 ?auto_135228 ) ) ( not ( = ?auto_135227 ?auto_135229 ) ) ( not ( = ?auto_135228 ?auto_135229 ) ) ( ON ?auto_135229 ?auto_135231 ) ( not ( = ?auto_135226 ?auto_135231 ) ) ( not ( = ?auto_135227 ?auto_135231 ) ) ( not ( = ?auto_135228 ?auto_135231 ) ) ( not ( = ?auto_135229 ?auto_135231 ) ) ( ON ?auto_135228 ?auto_135229 ) ( ON-TABLE ?auto_135232 ) ( ON ?auto_135230 ?auto_135232 ) ( ON ?auto_135233 ?auto_135230 ) ( ON ?auto_135231 ?auto_135233 ) ( not ( = ?auto_135232 ?auto_135230 ) ) ( not ( = ?auto_135232 ?auto_135233 ) ) ( not ( = ?auto_135232 ?auto_135231 ) ) ( not ( = ?auto_135232 ?auto_135229 ) ) ( not ( = ?auto_135232 ?auto_135228 ) ) ( not ( = ?auto_135230 ?auto_135233 ) ) ( not ( = ?auto_135230 ?auto_135231 ) ) ( not ( = ?auto_135230 ?auto_135229 ) ) ( not ( = ?auto_135230 ?auto_135228 ) ) ( not ( = ?auto_135233 ?auto_135231 ) ) ( not ( = ?auto_135233 ?auto_135229 ) ) ( not ( = ?auto_135233 ?auto_135228 ) ) ( not ( = ?auto_135226 ?auto_135232 ) ) ( not ( = ?auto_135226 ?auto_135230 ) ) ( not ( = ?auto_135226 ?auto_135233 ) ) ( not ( = ?auto_135227 ?auto_135232 ) ) ( not ( = ?auto_135227 ?auto_135230 ) ) ( not ( = ?auto_135227 ?auto_135233 ) ) ( ON ?auto_135227 ?auto_135228 ) ( ON ?auto_135226 ?auto_135227 ) ( CLEAR ?auto_135226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135232 ?auto_135230 ?auto_135233 ?auto_135231 ?auto_135229 ?auto_135228 ?auto_135227 )
      ( MAKE-4PILE ?auto_135226 ?auto_135227 ?auto_135228 ?auto_135229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135234 - BLOCK
      ?auto_135235 - BLOCK
      ?auto_135236 - BLOCK
      ?auto_135237 - BLOCK
    )
    :vars
    (
      ?auto_135241 - BLOCK
      ?auto_135238 - BLOCK
      ?auto_135240 - BLOCK
      ?auto_135239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135234 ?auto_135235 ) ) ( not ( = ?auto_135234 ?auto_135236 ) ) ( not ( = ?auto_135234 ?auto_135237 ) ) ( not ( = ?auto_135235 ?auto_135236 ) ) ( not ( = ?auto_135235 ?auto_135237 ) ) ( not ( = ?auto_135236 ?auto_135237 ) ) ( ON ?auto_135237 ?auto_135241 ) ( not ( = ?auto_135234 ?auto_135241 ) ) ( not ( = ?auto_135235 ?auto_135241 ) ) ( not ( = ?auto_135236 ?auto_135241 ) ) ( not ( = ?auto_135237 ?auto_135241 ) ) ( ON ?auto_135236 ?auto_135237 ) ( ON-TABLE ?auto_135238 ) ( ON ?auto_135240 ?auto_135238 ) ( ON ?auto_135239 ?auto_135240 ) ( ON ?auto_135241 ?auto_135239 ) ( not ( = ?auto_135238 ?auto_135240 ) ) ( not ( = ?auto_135238 ?auto_135239 ) ) ( not ( = ?auto_135238 ?auto_135241 ) ) ( not ( = ?auto_135238 ?auto_135237 ) ) ( not ( = ?auto_135238 ?auto_135236 ) ) ( not ( = ?auto_135240 ?auto_135239 ) ) ( not ( = ?auto_135240 ?auto_135241 ) ) ( not ( = ?auto_135240 ?auto_135237 ) ) ( not ( = ?auto_135240 ?auto_135236 ) ) ( not ( = ?auto_135239 ?auto_135241 ) ) ( not ( = ?auto_135239 ?auto_135237 ) ) ( not ( = ?auto_135239 ?auto_135236 ) ) ( not ( = ?auto_135234 ?auto_135238 ) ) ( not ( = ?auto_135234 ?auto_135240 ) ) ( not ( = ?auto_135234 ?auto_135239 ) ) ( not ( = ?auto_135235 ?auto_135238 ) ) ( not ( = ?auto_135235 ?auto_135240 ) ) ( not ( = ?auto_135235 ?auto_135239 ) ) ( ON ?auto_135235 ?auto_135236 ) ( HOLDING ?auto_135234 ) ( CLEAR ?auto_135235 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135238 ?auto_135240 ?auto_135239 ?auto_135241 ?auto_135237 ?auto_135236 ?auto_135235 ?auto_135234 )
      ( MAKE-4PILE ?auto_135234 ?auto_135235 ?auto_135236 ?auto_135237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135242 - BLOCK
      ?auto_135243 - BLOCK
      ?auto_135244 - BLOCK
      ?auto_135245 - BLOCK
    )
    :vars
    (
      ?auto_135247 - BLOCK
      ?auto_135246 - BLOCK
      ?auto_135248 - BLOCK
      ?auto_135249 - BLOCK
      ?auto_135250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135242 ?auto_135243 ) ) ( not ( = ?auto_135242 ?auto_135244 ) ) ( not ( = ?auto_135242 ?auto_135245 ) ) ( not ( = ?auto_135243 ?auto_135244 ) ) ( not ( = ?auto_135243 ?auto_135245 ) ) ( not ( = ?auto_135244 ?auto_135245 ) ) ( ON ?auto_135245 ?auto_135247 ) ( not ( = ?auto_135242 ?auto_135247 ) ) ( not ( = ?auto_135243 ?auto_135247 ) ) ( not ( = ?auto_135244 ?auto_135247 ) ) ( not ( = ?auto_135245 ?auto_135247 ) ) ( ON ?auto_135244 ?auto_135245 ) ( ON-TABLE ?auto_135246 ) ( ON ?auto_135248 ?auto_135246 ) ( ON ?auto_135249 ?auto_135248 ) ( ON ?auto_135247 ?auto_135249 ) ( not ( = ?auto_135246 ?auto_135248 ) ) ( not ( = ?auto_135246 ?auto_135249 ) ) ( not ( = ?auto_135246 ?auto_135247 ) ) ( not ( = ?auto_135246 ?auto_135245 ) ) ( not ( = ?auto_135246 ?auto_135244 ) ) ( not ( = ?auto_135248 ?auto_135249 ) ) ( not ( = ?auto_135248 ?auto_135247 ) ) ( not ( = ?auto_135248 ?auto_135245 ) ) ( not ( = ?auto_135248 ?auto_135244 ) ) ( not ( = ?auto_135249 ?auto_135247 ) ) ( not ( = ?auto_135249 ?auto_135245 ) ) ( not ( = ?auto_135249 ?auto_135244 ) ) ( not ( = ?auto_135242 ?auto_135246 ) ) ( not ( = ?auto_135242 ?auto_135248 ) ) ( not ( = ?auto_135242 ?auto_135249 ) ) ( not ( = ?auto_135243 ?auto_135246 ) ) ( not ( = ?auto_135243 ?auto_135248 ) ) ( not ( = ?auto_135243 ?auto_135249 ) ) ( ON ?auto_135243 ?auto_135244 ) ( CLEAR ?auto_135243 ) ( ON ?auto_135242 ?auto_135250 ) ( CLEAR ?auto_135242 ) ( HAND-EMPTY ) ( not ( = ?auto_135242 ?auto_135250 ) ) ( not ( = ?auto_135243 ?auto_135250 ) ) ( not ( = ?auto_135244 ?auto_135250 ) ) ( not ( = ?auto_135245 ?auto_135250 ) ) ( not ( = ?auto_135247 ?auto_135250 ) ) ( not ( = ?auto_135246 ?auto_135250 ) ) ( not ( = ?auto_135248 ?auto_135250 ) ) ( not ( = ?auto_135249 ?auto_135250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135242 ?auto_135250 )
      ( MAKE-4PILE ?auto_135242 ?auto_135243 ?auto_135244 ?auto_135245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135251 - BLOCK
      ?auto_135252 - BLOCK
      ?auto_135253 - BLOCK
      ?auto_135254 - BLOCK
    )
    :vars
    (
      ?auto_135257 - BLOCK
      ?auto_135258 - BLOCK
      ?auto_135259 - BLOCK
      ?auto_135255 - BLOCK
      ?auto_135256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135251 ?auto_135252 ) ) ( not ( = ?auto_135251 ?auto_135253 ) ) ( not ( = ?auto_135251 ?auto_135254 ) ) ( not ( = ?auto_135252 ?auto_135253 ) ) ( not ( = ?auto_135252 ?auto_135254 ) ) ( not ( = ?auto_135253 ?auto_135254 ) ) ( ON ?auto_135254 ?auto_135257 ) ( not ( = ?auto_135251 ?auto_135257 ) ) ( not ( = ?auto_135252 ?auto_135257 ) ) ( not ( = ?auto_135253 ?auto_135257 ) ) ( not ( = ?auto_135254 ?auto_135257 ) ) ( ON ?auto_135253 ?auto_135254 ) ( ON-TABLE ?auto_135258 ) ( ON ?auto_135259 ?auto_135258 ) ( ON ?auto_135255 ?auto_135259 ) ( ON ?auto_135257 ?auto_135255 ) ( not ( = ?auto_135258 ?auto_135259 ) ) ( not ( = ?auto_135258 ?auto_135255 ) ) ( not ( = ?auto_135258 ?auto_135257 ) ) ( not ( = ?auto_135258 ?auto_135254 ) ) ( not ( = ?auto_135258 ?auto_135253 ) ) ( not ( = ?auto_135259 ?auto_135255 ) ) ( not ( = ?auto_135259 ?auto_135257 ) ) ( not ( = ?auto_135259 ?auto_135254 ) ) ( not ( = ?auto_135259 ?auto_135253 ) ) ( not ( = ?auto_135255 ?auto_135257 ) ) ( not ( = ?auto_135255 ?auto_135254 ) ) ( not ( = ?auto_135255 ?auto_135253 ) ) ( not ( = ?auto_135251 ?auto_135258 ) ) ( not ( = ?auto_135251 ?auto_135259 ) ) ( not ( = ?auto_135251 ?auto_135255 ) ) ( not ( = ?auto_135252 ?auto_135258 ) ) ( not ( = ?auto_135252 ?auto_135259 ) ) ( not ( = ?auto_135252 ?auto_135255 ) ) ( ON ?auto_135251 ?auto_135256 ) ( CLEAR ?auto_135251 ) ( not ( = ?auto_135251 ?auto_135256 ) ) ( not ( = ?auto_135252 ?auto_135256 ) ) ( not ( = ?auto_135253 ?auto_135256 ) ) ( not ( = ?auto_135254 ?auto_135256 ) ) ( not ( = ?auto_135257 ?auto_135256 ) ) ( not ( = ?auto_135258 ?auto_135256 ) ) ( not ( = ?auto_135259 ?auto_135256 ) ) ( not ( = ?auto_135255 ?auto_135256 ) ) ( HOLDING ?auto_135252 ) ( CLEAR ?auto_135253 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135258 ?auto_135259 ?auto_135255 ?auto_135257 ?auto_135254 ?auto_135253 ?auto_135252 )
      ( MAKE-4PILE ?auto_135251 ?auto_135252 ?auto_135253 ?auto_135254 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135260 - BLOCK
      ?auto_135261 - BLOCK
      ?auto_135262 - BLOCK
      ?auto_135263 - BLOCK
    )
    :vars
    (
      ?auto_135264 - BLOCK
      ?auto_135266 - BLOCK
      ?auto_135265 - BLOCK
      ?auto_135267 - BLOCK
      ?auto_135268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135260 ?auto_135261 ) ) ( not ( = ?auto_135260 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135263 ) ) ( not ( = ?auto_135261 ?auto_135262 ) ) ( not ( = ?auto_135261 ?auto_135263 ) ) ( not ( = ?auto_135262 ?auto_135263 ) ) ( ON ?auto_135263 ?auto_135264 ) ( not ( = ?auto_135260 ?auto_135264 ) ) ( not ( = ?auto_135261 ?auto_135264 ) ) ( not ( = ?auto_135262 ?auto_135264 ) ) ( not ( = ?auto_135263 ?auto_135264 ) ) ( ON ?auto_135262 ?auto_135263 ) ( ON-TABLE ?auto_135266 ) ( ON ?auto_135265 ?auto_135266 ) ( ON ?auto_135267 ?auto_135265 ) ( ON ?auto_135264 ?auto_135267 ) ( not ( = ?auto_135266 ?auto_135265 ) ) ( not ( = ?auto_135266 ?auto_135267 ) ) ( not ( = ?auto_135266 ?auto_135264 ) ) ( not ( = ?auto_135266 ?auto_135263 ) ) ( not ( = ?auto_135266 ?auto_135262 ) ) ( not ( = ?auto_135265 ?auto_135267 ) ) ( not ( = ?auto_135265 ?auto_135264 ) ) ( not ( = ?auto_135265 ?auto_135263 ) ) ( not ( = ?auto_135265 ?auto_135262 ) ) ( not ( = ?auto_135267 ?auto_135264 ) ) ( not ( = ?auto_135267 ?auto_135263 ) ) ( not ( = ?auto_135267 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135266 ) ) ( not ( = ?auto_135260 ?auto_135265 ) ) ( not ( = ?auto_135260 ?auto_135267 ) ) ( not ( = ?auto_135261 ?auto_135266 ) ) ( not ( = ?auto_135261 ?auto_135265 ) ) ( not ( = ?auto_135261 ?auto_135267 ) ) ( ON ?auto_135260 ?auto_135268 ) ( not ( = ?auto_135260 ?auto_135268 ) ) ( not ( = ?auto_135261 ?auto_135268 ) ) ( not ( = ?auto_135262 ?auto_135268 ) ) ( not ( = ?auto_135263 ?auto_135268 ) ) ( not ( = ?auto_135264 ?auto_135268 ) ) ( not ( = ?auto_135266 ?auto_135268 ) ) ( not ( = ?auto_135265 ?auto_135268 ) ) ( not ( = ?auto_135267 ?auto_135268 ) ) ( CLEAR ?auto_135262 ) ( ON ?auto_135261 ?auto_135260 ) ( CLEAR ?auto_135261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135268 ?auto_135260 )
      ( MAKE-4PILE ?auto_135260 ?auto_135261 ?auto_135262 ?auto_135263 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135269 - BLOCK
      ?auto_135270 - BLOCK
      ?auto_135271 - BLOCK
      ?auto_135272 - BLOCK
    )
    :vars
    (
      ?auto_135275 - BLOCK
      ?auto_135274 - BLOCK
      ?auto_135273 - BLOCK
      ?auto_135276 - BLOCK
      ?auto_135277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135269 ?auto_135270 ) ) ( not ( = ?auto_135269 ?auto_135271 ) ) ( not ( = ?auto_135269 ?auto_135272 ) ) ( not ( = ?auto_135270 ?auto_135271 ) ) ( not ( = ?auto_135270 ?auto_135272 ) ) ( not ( = ?auto_135271 ?auto_135272 ) ) ( ON ?auto_135272 ?auto_135275 ) ( not ( = ?auto_135269 ?auto_135275 ) ) ( not ( = ?auto_135270 ?auto_135275 ) ) ( not ( = ?auto_135271 ?auto_135275 ) ) ( not ( = ?auto_135272 ?auto_135275 ) ) ( ON-TABLE ?auto_135274 ) ( ON ?auto_135273 ?auto_135274 ) ( ON ?auto_135276 ?auto_135273 ) ( ON ?auto_135275 ?auto_135276 ) ( not ( = ?auto_135274 ?auto_135273 ) ) ( not ( = ?auto_135274 ?auto_135276 ) ) ( not ( = ?auto_135274 ?auto_135275 ) ) ( not ( = ?auto_135274 ?auto_135272 ) ) ( not ( = ?auto_135274 ?auto_135271 ) ) ( not ( = ?auto_135273 ?auto_135276 ) ) ( not ( = ?auto_135273 ?auto_135275 ) ) ( not ( = ?auto_135273 ?auto_135272 ) ) ( not ( = ?auto_135273 ?auto_135271 ) ) ( not ( = ?auto_135276 ?auto_135275 ) ) ( not ( = ?auto_135276 ?auto_135272 ) ) ( not ( = ?auto_135276 ?auto_135271 ) ) ( not ( = ?auto_135269 ?auto_135274 ) ) ( not ( = ?auto_135269 ?auto_135273 ) ) ( not ( = ?auto_135269 ?auto_135276 ) ) ( not ( = ?auto_135270 ?auto_135274 ) ) ( not ( = ?auto_135270 ?auto_135273 ) ) ( not ( = ?auto_135270 ?auto_135276 ) ) ( ON ?auto_135269 ?auto_135277 ) ( not ( = ?auto_135269 ?auto_135277 ) ) ( not ( = ?auto_135270 ?auto_135277 ) ) ( not ( = ?auto_135271 ?auto_135277 ) ) ( not ( = ?auto_135272 ?auto_135277 ) ) ( not ( = ?auto_135275 ?auto_135277 ) ) ( not ( = ?auto_135274 ?auto_135277 ) ) ( not ( = ?auto_135273 ?auto_135277 ) ) ( not ( = ?auto_135276 ?auto_135277 ) ) ( ON ?auto_135270 ?auto_135269 ) ( CLEAR ?auto_135270 ) ( ON-TABLE ?auto_135277 ) ( HOLDING ?auto_135271 ) ( CLEAR ?auto_135272 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135274 ?auto_135273 ?auto_135276 ?auto_135275 ?auto_135272 ?auto_135271 )
      ( MAKE-4PILE ?auto_135269 ?auto_135270 ?auto_135271 ?auto_135272 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135278 - BLOCK
      ?auto_135279 - BLOCK
      ?auto_135280 - BLOCK
      ?auto_135281 - BLOCK
    )
    :vars
    (
      ?auto_135285 - BLOCK
      ?auto_135282 - BLOCK
      ?auto_135283 - BLOCK
      ?auto_135286 - BLOCK
      ?auto_135284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135278 ?auto_135279 ) ) ( not ( = ?auto_135278 ?auto_135280 ) ) ( not ( = ?auto_135278 ?auto_135281 ) ) ( not ( = ?auto_135279 ?auto_135280 ) ) ( not ( = ?auto_135279 ?auto_135281 ) ) ( not ( = ?auto_135280 ?auto_135281 ) ) ( ON ?auto_135281 ?auto_135285 ) ( not ( = ?auto_135278 ?auto_135285 ) ) ( not ( = ?auto_135279 ?auto_135285 ) ) ( not ( = ?auto_135280 ?auto_135285 ) ) ( not ( = ?auto_135281 ?auto_135285 ) ) ( ON-TABLE ?auto_135282 ) ( ON ?auto_135283 ?auto_135282 ) ( ON ?auto_135286 ?auto_135283 ) ( ON ?auto_135285 ?auto_135286 ) ( not ( = ?auto_135282 ?auto_135283 ) ) ( not ( = ?auto_135282 ?auto_135286 ) ) ( not ( = ?auto_135282 ?auto_135285 ) ) ( not ( = ?auto_135282 ?auto_135281 ) ) ( not ( = ?auto_135282 ?auto_135280 ) ) ( not ( = ?auto_135283 ?auto_135286 ) ) ( not ( = ?auto_135283 ?auto_135285 ) ) ( not ( = ?auto_135283 ?auto_135281 ) ) ( not ( = ?auto_135283 ?auto_135280 ) ) ( not ( = ?auto_135286 ?auto_135285 ) ) ( not ( = ?auto_135286 ?auto_135281 ) ) ( not ( = ?auto_135286 ?auto_135280 ) ) ( not ( = ?auto_135278 ?auto_135282 ) ) ( not ( = ?auto_135278 ?auto_135283 ) ) ( not ( = ?auto_135278 ?auto_135286 ) ) ( not ( = ?auto_135279 ?auto_135282 ) ) ( not ( = ?auto_135279 ?auto_135283 ) ) ( not ( = ?auto_135279 ?auto_135286 ) ) ( ON ?auto_135278 ?auto_135284 ) ( not ( = ?auto_135278 ?auto_135284 ) ) ( not ( = ?auto_135279 ?auto_135284 ) ) ( not ( = ?auto_135280 ?auto_135284 ) ) ( not ( = ?auto_135281 ?auto_135284 ) ) ( not ( = ?auto_135285 ?auto_135284 ) ) ( not ( = ?auto_135282 ?auto_135284 ) ) ( not ( = ?auto_135283 ?auto_135284 ) ) ( not ( = ?auto_135286 ?auto_135284 ) ) ( ON ?auto_135279 ?auto_135278 ) ( ON-TABLE ?auto_135284 ) ( CLEAR ?auto_135281 ) ( ON ?auto_135280 ?auto_135279 ) ( CLEAR ?auto_135280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135284 ?auto_135278 ?auto_135279 )
      ( MAKE-4PILE ?auto_135278 ?auto_135279 ?auto_135280 ?auto_135281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135287 - BLOCK
      ?auto_135288 - BLOCK
      ?auto_135289 - BLOCK
      ?auto_135290 - BLOCK
    )
    :vars
    (
      ?auto_135291 - BLOCK
      ?auto_135295 - BLOCK
      ?auto_135294 - BLOCK
      ?auto_135293 - BLOCK
      ?auto_135292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135287 ?auto_135288 ) ) ( not ( = ?auto_135287 ?auto_135289 ) ) ( not ( = ?auto_135287 ?auto_135290 ) ) ( not ( = ?auto_135288 ?auto_135289 ) ) ( not ( = ?auto_135288 ?auto_135290 ) ) ( not ( = ?auto_135289 ?auto_135290 ) ) ( not ( = ?auto_135287 ?auto_135291 ) ) ( not ( = ?auto_135288 ?auto_135291 ) ) ( not ( = ?auto_135289 ?auto_135291 ) ) ( not ( = ?auto_135290 ?auto_135291 ) ) ( ON-TABLE ?auto_135295 ) ( ON ?auto_135294 ?auto_135295 ) ( ON ?auto_135293 ?auto_135294 ) ( ON ?auto_135291 ?auto_135293 ) ( not ( = ?auto_135295 ?auto_135294 ) ) ( not ( = ?auto_135295 ?auto_135293 ) ) ( not ( = ?auto_135295 ?auto_135291 ) ) ( not ( = ?auto_135295 ?auto_135290 ) ) ( not ( = ?auto_135295 ?auto_135289 ) ) ( not ( = ?auto_135294 ?auto_135293 ) ) ( not ( = ?auto_135294 ?auto_135291 ) ) ( not ( = ?auto_135294 ?auto_135290 ) ) ( not ( = ?auto_135294 ?auto_135289 ) ) ( not ( = ?auto_135293 ?auto_135291 ) ) ( not ( = ?auto_135293 ?auto_135290 ) ) ( not ( = ?auto_135293 ?auto_135289 ) ) ( not ( = ?auto_135287 ?auto_135295 ) ) ( not ( = ?auto_135287 ?auto_135294 ) ) ( not ( = ?auto_135287 ?auto_135293 ) ) ( not ( = ?auto_135288 ?auto_135295 ) ) ( not ( = ?auto_135288 ?auto_135294 ) ) ( not ( = ?auto_135288 ?auto_135293 ) ) ( ON ?auto_135287 ?auto_135292 ) ( not ( = ?auto_135287 ?auto_135292 ) ) ( not ( = ?auto_135288 ?auto_135292 ) ) ( not ( = ?auto_135289 ?auto_135292 ) ) ( not ( = ?auto_135290 ?auto_135292 ) ) ( not ( = ?auto_135291 ?auto_135292 ) ) ( not ( = ?auto_135295 ?auto_135292 ) ) ( not ( = ?auto_135294 ?auto_135292 ) ) ( not ( = ?auto_135293 ?auto_135292 ) ) ( ON ?auto_135288 ?auto_135287 ) ( ON-TABLE ?auto_135292 ) ( ON ?auto_135289 ?auto_135288 ) ( CLEAR ?auto_135289 ) ( HOLDING ?auto_135290 ) ( CLEAR ?auto_135291 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135295 ?auto_135294 ?auto_135293 ?auto_135291 ?auto_135290 )
      ( MAKE-4PILE ?auto_135287 ?auto_135288 ?auto_135289 ?auto_135290 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135296 - BLOCK
      ?auto_135297 - BLOCK
      ?auto_135298 - BLOCK
      ?auto_135299 - BLOCK
    )
    :vars
    (
      ?auto_135304 - BLOCK
      ?auto_135301 - BLOCK
      ?auto_135300 - BLOCK
      ?auto_135303 - BLOCK
      ?auto_135302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135296 ?auto_135297 ) ) ( not ( = ?auto_135296 ?auto_135298 ) ) ( not ( = ?auto_135296 ?auto_135299 ) ) ( not ( = ?auto_135297 ?auto_135298 ) ) ( not ( = ?auto_135297 ?auto_135299 ) ) ( not ( = ?auto_135298 ?auto_135299 ) ) ( not ( = ?auto_135296 ?auto_135304 ) ) ( not ( = ?auto_135297 ?auto_135304 ) ) ( not ( = ?auto_135298 ?auto_135304 ) ) ( not ( = ?auto_135299 ?auto_135304 ) ) ( ON-TABLE ?auto_135301 ) ( ON ?auto_135300 ?auto_135301 ) ( ON ?auto_135303 ?auto_135300 ) ( ON ?auto_135304 ?auto_135303 ) ( not ( = ?auto_135301 ?auto_135300 ) ) ( not ( = ?auto_135301 ?auto_135303 ) ) ( not ( = ?auto_135301 ?auto_135304 ) ) ( not ( = ?auto_135301 ?auto_135299 ) ) ( not ( = ?auto_135301 ?auto_135298 ) ) ( not ( = ?auto_135300 ?auto_135303 ) ) ( not ( = ?auto_135300 ?auto_135304 ) ) ( not ( = ?auto_135300 ?auto_135299 ) ) ( not ( = ?auto_135300 ?auto_135298 ) ) ( not ( = ?auto_135303 ?auto_135304 ) ) ( not ( = ?auto_135303 ?auto_135299 ) ) ( not ( = ?auto_135303 ?auto_135298 ) ) ( not ( = ?auto_135296 ?auto_135301 ) ) ( not ( = ?auto_135296 ?auto_135300 ) ) ( not ( = ?auto_135296 ?auto_135303 ) ) ( not ( = ?auto_135297 ?auto_135301 ) ) ( not ( = ?auto_135297 ?auto_135300 ) ) ( not ( = ?auto_135297 ?auto_135303 ) ) ( ON ?auto_135296 ?auto_135302 ) ( not ( = ?auto_135296 ?auto_135302 ) ) ( not ( = ?auto_135297 ?auto_135302 ) ) ( not ( = ?auto_135298 ?auto_135302 ) ) ( not ( = ?auto_135299 ?auto_135302 ) ) ( not ( = ?auto_135304 ?auto_135302 ) ) ( not ( = ?auto_135301 ?auto_135302 ) ) ( not ( = ?auto_135300 ?auto_135302 ) ) ( not ( = ?auto_135303 ?auto_135302 ) ) ( ON ?auto_135297 ?auto_135296 ) ( ON-TABLE ?auto_135302 ) ( ON ?auto_135298 ?auto_135297 ) ( CLEAR ?auto_135304 ) ( ON ?auto_135299 ?auto_135298 ) ( CLEAR ?auto_135299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135302 ?auto_135296 ?auto_135297 ?auto_135298 )
      ( MAKE-4PILE ?auto_135296 ?auto_135297 ?auto_135298 ?auto_135299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135305 - BLOCK
      ?auto_135306 - BLOCK
      ?auto_135307 - BLOCK
      ?auto_135308 - BLOCK
    )
    :vars
    (
      ?auto_135309 - BLOCK
      ?auto_135312 - BLOCK
      ?auto_135311 - BLOCK
      ?auto_135313 - BLOCK
      ?auto_135310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135305 ?auto_135306 ) ) ( not ( = ?auto_135305 ?auto_135307 ) ) ( not ( = ?auto_135305 ?auto_135308 ) ) ( not ( = ?auto_135306 ?auto_135307 ) ) ( not ( = ?auto_135306 ?auto_135308 ) ) ( not ( = ?auto_135307 ?auto_135308 ) ) ( not ( = ?auto_135305 ?auto_135309 ) ) ( not ( = ?auto_135306 ?auto_135309 ) ) ( not ( = ?auto_135307 ?auto_135309 ) ) ( not ( = ?auto_135308 ?auto_135309 ) ) ( ON-TABLE ?auto_135312 ) ( ON ?auto_135311 ?auto_135312 ) ( ON ?auto_135313 ?auto_135311 ) ( not ( = ?auto_135312 ?auto_135311 ) ) ( not ( = ?auto_135312 ?auto_135313 ) ) ( not ( = ?auto_135312 ?auto_135309 ) ) ( not ( = ?auto_135312 ?auto_135308 ) ) ( not ( = ?auto_135312 ?auto_135307 ) ) ( not ( = ?auto_135311 ?auto_135313 ) ) ( not ( = ?auto_135311 ?auto_135309 ) ) ( not ( = ?auto_135311 ?auto_135308 ) ) ( not ( = ?auto_135311 ?auto_135307 ) ) ( not ( = ?auto_135313 ?auto_135309 ) ) ( not ( = ?auto_135313 ?auto_135308 ) ) ( not ( = ?auto_135313 ?auto_135307 ) ) ( not ( = ?auto_135305 ?auto_135312 ) ) ( not ( = ?auto_135305 ?auto_135311 ) ) ( not ( = ?auto_135305 ?auto_135313 ) ) ( not ( = ?auto_135306 ?auto_135312 ) ) ( not ( = ?auto_135306 ?auto_135311 ) ) ( not ( = ?auto_135306 ?auto_135313 ) ) ( ON ?auto_135305 ?auto_135310 ) ( not ( = ?auto_135305 ?auto_135310 ) ) ( not ( = ?auto_135306 ?auto_135310 ) ) ( not ( = ?auto_135307 ?auto_135310 ) ) ( not ( = ?auto_135308 ?auto_135310 ) ) ( not ( = ?auto_135309 ?auto_135310 ) ) ( not ( = ?auto_135312 ?auto_135310 ) ) ( not ( = ?auto_135311 ?auto_135310 ) ) ( not ( = ?auto_135313 ?auto_135310 ) ) ( ON ?auto_135306 ?auto_135305 ) ( ON-TABLE ?auto_135310 ) ( ON ?auto_135307 ?auto_135306 ) ( ON ?auto_135308 ?auto_135307 ) ( CLEAR ?auto_135308 ) ( HOLDING ?auto_135309 ) ( CLEAR ?auto_135313 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135312 ?auto_135311 ?auto_135313 ?auto_135309 )
      ( MAKE-4PILE ?auto_135305 ?auto_135306 ?auto_135307 ?auto_135308 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135314 - BLOCK
      ?auto_135315 - BLOCK
      ?auto_135316 - BLOCK
      ?auto_135317 - BLOCK
    )
    :vars
    (
      ?auto_135321 - BLOCK
      ?auto_135318 - BLOCK
      ?auto_135320 - BLOCK
      ?auto_135322 - BLOCK
      ?auto_135319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135314 ?auto_135315 ) ) ( not ( = ?auto_135314 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135317 ) ) ( not ( = ?auto_135315 ?auto_135316 ) ) ( not ( = ?auto_135315 ?auto_135317 ) ) ( not ( = ?auto_135316 ?auto_135317 ) ) ( not ( = ?auto_135314 ?auto_135321 ) ) ( not ( = ?auto_135315 ?auto_135321 ) ) ( not ( = ?auto_135316 ?auto_135321 ) ) ( not ( = ?auto_135317 ?auto_135321 ) ) ( ON-TABLE ?auto_135318 ) ( ON ?auto_135320 ?auto_135318 ) ( ON ?auto_135322 ?auto_135320 ) ( not ( = ?auto_135318 ?auto_135320 ) ) ( not ( = ?auto_135318 ?auto_135322 ) ) ( not ( = ?auto_135318 ?auto_135321 ) ) ( not ( = ?auto_135318 ?auto_135317 ) ) ( not ( = ?auto_135318 ?auto_135316 ) ) ( not ( = ?auto_135320 ?auto_135322 ) ) ( not ( = ?auto_135320 ?auto_135321 ) ) ( not ( = ?auto_135320 ?auto_135317 ) ) ( not ( = ?auto_135320 ?auto_135316 ) ) ( not ( = ?auto_135322 ?auto_135321 ) ) ( not ( = ?auto_135322 ?auto_135317 ) ) ( not ( = ?auto_135322 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135318 ) ) ( not ( = ?auto_135314 ?auto_135320 ) ) ( not ( = ?auto_135314 ?auto_135322 ) ) ( not ( = ?auto_135315 ?auto_135318 ) ) ( not ( = ?auto_135315 ?auto_135320 ) ) ( not ( = ?auto_135315 ?auto_135322 ) ) ( ON ?auto_135314 ?auto_135319 ) ( not ( = ?auto_135314 ?auto_135319 ) ) ( not ( = ?auto_135315 ?auto_135319 ) ) ( not ( = ?auto_135316 ?auto_135319 ) ) ( not ( = ?auto_135317 ?auto_135319 ) ) ( not ( = ?auto_135321 ?auto_135319 ) ) ( not ( = ?auto_135318 ?auto_135319 ) ) ( not ( = ?auto_135320 ?auto_135319 ) ) ( not ( = ?auto_135322 ?auto_135319 ) ) ( ON ?auto_135315 ?auto_135314 ) ( ON-TABLE ?auto_135319 ) ( ON ?auto_135316 ?auto_135315 ) ( ON ?auto_135317 ?auto_135316 ) ( CLEAR ?auto_135322 ) ( ON ?auto_135321 ?auto_135317 ) ( CLEAR ?auto_135321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135319 ?auto_135314 ?auto_135315 ?auto_135316 ?auto_135317 )
      ( MAKE-4PILE ?auto_135314 ?auto_135315 ?auto_135316 ?auto_135317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135323 - BLOCK
      ?auto_135324 - BLOCK
      ?auto_135325 - BLOCK
      ?auto_135326 - BLOCK
    )
    :vars
    (
      ?auto_135327 - BLOCK
      ?auto_135331 - BLOCK
      ?auto_135329 - BLOCK
      ?auto_135328 - BLOCK
      ?auto_135330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135323 ?auto_135324 ) ) ( not ( = ?auto_135323 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135326 ) ) ( not ( = ?auto_135324 ?auto_135325 ) ) ( not ( = ?auto_135324 ?auto_135326 ) ) ( not ( = ?auto_135325 ?auto_135326 ) ) ( not ( = ?auto_135323 ?auto_135327 ) ) ( not ( = ?auto_135324 ?auto_135327 ) ) ( not ( = ?auto_135325 ?auto_135327 ) ) ( not ( = ?auto_135326 ?auto_135327 ) ) ( ON-TABLE ?auto_135331 ) ( ON ?auto_135329 ?auto_135331 ) ( not ( = ?auto_135331 ?auto_135329 ) ) ( not ( = ?auto_135331 ?auto_135328 ) ) ( not ( = ?auto_135331 ?auto_135327 ) ) ( not ( = ?auto_135331 ?auto_135326 ) ) ( not ( = ?auto_135331 ?auto_135325 ) ) ( not ( = ?auto_135329 ?auto_135328 ) ) ( not ( = ?auto_135329 ?auto_135327 ) ) ( not ( = ?auto_135329 ?auto_135326 ) ) ( not ( = ?auto_135329 ?auto_135325 ) ) ( not ( = ?auto_135328 ?auto_135327 ) ) ( not ( = ?auto_135328 ?auto_135326 ) ) ( not ( = ?auto_135328 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135331 ) ) ( not ( = ?auto_135323 ?auto_135329 ) ) ( not ( = ?auto_135323 ?auto_135328 ) ) ( not ( = ?auto_135324 ?auto_135331 ) ) ( not ( = ?auto_135324 ?auto_135329 ) ) ( not ( = ?auto_135324 ?auto_135328 ) ) ( ON ?auto_135323 ?auto_135330 ) ( not ( = ?auto_135323 ?auto_135330 ) ) ( not ( = ?auto_135324 ?auto_135330 ) ) ( not ( = ?auto_135325 ?auto_135330 ) ) ( not ( = ?auto_135326 ?auto_135330 ) ) ( not ( = ?auto_135327 ?auto_135330 ) ) ( not ( = ?auto_135331 ?auto_135330 ) ) ( not ( = ?auto_135329 ?auto_135330 ) ) ( not ( = ?auto_135328 ?auto_135330 ) ) ( ON ?auto_135324 ?auto_135323 ) ( ON-TABLE ?auto_135330 ) ( ON ?auto_135325 ?auto_135324 ) ( ON ?auto_135326 ?auto_135325 ) ( ON ?auto_135327 ?auto_135326 ) ( CLEAR ?auto_135327 ) ( HOLDING ?auto_135328 ) ( CLEAR ?auto_135329 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135331 ?auto_135329 ?auto_135328 )
      ( MAKE-4PILE ?auto_135323 ?auto_135324 ?auto_135325 ?auto_135326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135332 - BLOCK
      ?auto_135333 - BLOCK
      ?auto_135334 - BLOCK
      ?auto_135335 - BLOCK
    )
    :vars
    (
      ?auto_135336 - BLOCK
      ?auto_135337 - BLOCK
      ?auto_135339 - BLOCK
      ?auto_135338 - BLOCK
      ?auto_135340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135332 ?auto_135333 ) ) ( not ( = ?auto_135332 ?auto_135334 ) ) ( not ( = ?auto_135332 ?auto_135335 ) ) ( not ( = ?auto_135333 ?auto_135334 ) ) ( not ( = ?auto_135333 ?auto_135335 ) ) ( not ( = ?auto_135334 ?auto_135335 ) ) ( not ( = ?auto_135332 ?auto_135336 ) ) ( not ( = ?auto_135333 ?auto_135336 ) ) ( not ( = ?auto_135334 ?auto_135336 ) ) ( not ( = ?auto_135335 ?auto_135336 ) ) ( ON-TABLE ?auto_135337 ) ( ON ?auto_135339 ?auto_135337 ) ( not ( = ?auto_135337 ?auto_135339 ) ) ( not ( = ?auto_135337 ?auto_135338 ) ) ( not ( = ?auto_135337 ?auto_135336 ) ) ( not ( = ?auto_135337 ?auto_135335 ) ) ( not ( = ?auto_135337 ?auto_135334 ) ) ( not ( = ?auto_135339 ?auto_135338 ) ) ( not ( = ?auto_135339 ?auto_135336 ) ) ( not ( = ?auto_135339 ?auto_135335 ) ) ( not ( = ?auto_135339 ?auto_135334 ) ) ( not ( = ?auto_135338 ?auto_135336 ) ) ( not ( = ?auto_135338 ?auto_135335 ) ) ( not ( = ?auto_135338 ?auto_135334 ) ) ( not ( = ?auto_135332 ?auto_135337 ) ) ( not ( = ?auto_135332 ?auto_135339 ) ) ( not ( = ?auto_135332 ?auto_135338 ) ) ( not ( = ?auto_135333 ?auto_135337 ) ) ( not ( = ?auto_135333 ?auto_135339 ) ) ( not ( = ?auto_135333 ?auto_135338 ) ) ( ON ?auto_135332 ?auto_135340 ) ( not ( = ?auto_135332 ?auto_135340 ) ) ( not ( = ?auto_135333 ?auto_135340 ) ) ( not ( = ?auto_135334 ?auto_135340 ) ) ( not ( = ?auto_135335 ?auto_135340 ) ) ( not ( = ?auto_135336 ?auto_135340 ) ) ( not ( = ?auto_135337 ?auto_135340 ) ) ( not ( = ?auto_135339 ?auto_135340 ) ) ( not ( = ?auto_135338 ?auto_135340 ) ) ( ON ?auto_135333 ?auto_135332 ) ( ON-TABLE ?auto_135340 ) ( ON ?auto_135334 ?auto_135333 ) ( ON ?auto_135335 ?auto_135334 ) ( ON ?auto_135336 ?auto_135335 ) ( CLEAR ?auto_135339 ) ( ON ?auto_135338 ?auto_135336 ) ( CLEAR ?auto_135338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135340 ?auto_135332 ?auto_135333 ?auto_135334 ?auto_135335 ?auto_135336 )
      ( MAKE-4PILE ?auto_135332 ?auto_135333 ?auto_135334 ?auto_135335 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135341 - BLOCK
      ?auto_135342 - BLOCK
      ?auto_135343 - BLOCK
      ?auto_135344 - BLOCK
    )
    :vars
    (
      ?auto_135347 - BLOCK
      ?auto_135348 - BLOCK
      ?auto_135345 - BLOCK
      ?auto_135346 - BLOCK
      ?auto_135349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135341 ?auto_135342 ) ) ( not ( = ?auto_135341 ?auto_135343 ) ) ( not ( = ?auto_135341 ?auto_135344 ) ) ( not ( = ?auto_135342 ?auto_135343 ) ) ( not ( = ?auto_135342 ?auto_135344 ) ) ( not ( = ?auto_135343 ?auto_135344 ) ) ( not ( = ?auto_135341 ?auto_135347 ) ) ( not ( = ?auto_135342 ?auto_135347 ) ) ( not ( = ?auto_135343 ?auto_135347 ) ) ( not ( = ?auto_135344 ?auto_135347 ) ) ( ON-TABLE ?auto_135348 ) ( not ( = ?auto_135348 ?auto_135345 ) ) ( not ( = ?auto_135348 ?auto_135346 ) ) ( not ( = ?auto_135348 ?auto_135347 ) ) ( not ( = ?auto_135348 ?auto_135344 ) ) ( not ( = ?auto_135348 ?auto_135343 ) ) ( not ( = ?auto_135345 ?auto_135346 ) ) ( not ( = ?auto_135345 ?auto_135347 ) ) ( not ( = ?auto_135345 ?auto_135344 ) ) ( not ( = ?auto_135345 ?auto_135343 ) ) ( not ( = ?auto_135346 ?auto_135347 ) ) ( not ( = ?auto_135346 ?auto_135344 ) ) ( not ( = ?auto_135346 ?auto_135343 ) ) ( not ( = ?auto_135341 ?auto_135348 ) ) ( not ( = ?auto_135341 ?auto_135345 ) ) ( not ( = ?auto_135341 ?auto_135346 ) ) ( not ( = ?auto_135342 ?auto_135348 ) ) ( not ( = ?auto_135342 ?auto_135345 ) ) ( not ( = ?auto_135342 ?auto_135346 ) ) ( ON ?auto_135341 ?auto_135349 ) ( not ( = ?auto_135341 ?auto_135349 ) ) ( not ( = ?auto_135342 ?auto_135349 ) ) ( not ( = ?auto_135343 ?auto_135349 ) ) ( not ( = ?auto_135344 ?auto_135349 ) ) ( not ( = ?auto_135347 ?auto_135349 ) ) ( not ( = ?auto_135348 ?auto_135349 ) ) ( not ( = ?auto_135345 ?auto_135349 ) ) ( not ( = ?auto_135346 ?auto_135349 ) ) ( ON ?auto_135342 ?auto_135341 ) ( ON-TABLE ?auto_135349 ) ( ON ?auto_135343 ?auto_135342 ) ( ON ?auto_135344 ?auto_135343 ) ( ON ?auto_135347 ?auto_135344 ) ( ON ?auto_135346 ?auto_135347 ) ( CLEAR ?auto_135346 ) ( HOLDING ?auto_135345 ) ( CLEAR ?auto_135348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135348 ?auto_135345 )
      ( MAKE-4PILE ?auto_135341 ?auto_135342 ?auto_135343 ?auto_135344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135350 - BLOCK
      ?auto_135351 - BLOCK
      ?auto_135352 - BLOCK
      ?auto_135353 - BLOCK
    )
    :vars
    (
      ?auto_135357 - BLOCK
      ?auto_135354 - BLOCK
      ?auto_135355 - BLOCK
      ?auto_135356 - BLOCK
      ?auto_135358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135350 ?auto_135351 ) ) ( not ( = ?auto_135350 ?auto_135352 ) ) ( not ( = ?auto_135350 ?auto_135353 ) ) ( not ( = ?auto_135351 ?auto_135352 ) ) ( not ( = ?auto_135351 ?auto_135353 ) ) ( not ( = ?auto_135352 ?auto_135353 ) ) ( not ( = ?auto_135350 ?auto_135357 ) ) ( not ( = ?auto_135351 ?auto_135357 ) ) ( not ( = ?auto_135352 ?auto_135357 ) ) ( not ( = ?auto_135353 ?auto_135357 ) ) ( ON-TABLE ?auto_135354 ) ( not ( = ?auto_135354 ?auto_135355 ) ) ( not ( = ?auto_135354 ?auto_135356 ) ) ( not ( = ?auto_135354 ?auto_135357 ) ) ( not ( = ?auto_135354 ?auto_135353 ) ) ( not ( = ?auto_135354 ?auto_135352 ) ) ( not ( = ?auto_135355 ?auto_135356 ) ) ( not ( = ?auto_135355 ?auto_135357 ) ) ( not ( = ?auto_135355 ?auto_135353 ) ) ( not ( = ?auto_135355 ?auto_135352 ) ) ( not ( = ?auto_135356 ?auto_135357 ) ) ( not ( = ?auto_135356 ?auto_135353 ) ) ( not ( = ?auto_135356 ?auto_135352 ) ) ( not ( = ?auto_135350 ?auto_135354 ) ) ( not ( = ?auto_135350 ?auto_135355 ) ) ( not ( = ?auto_135350 ?auto_135356 ) ) ( not ( = ?auto_135351 ?auto_135354 ) ) ( not ( = ?auto_135351 ?auto_135355 ) ) ( not ( = ?auto_135351 ?auto_135356 ) ) ( ON ?auto_135350 ?auto_135358 ) ( not ( = ?auto_135350 ?auto_135358 ) ) ( not ( = ?auto_135351 ?auto_135358 ) ) ( not ( = ?auto_135352 ?auto_135358 ) ) ( not ( = ?auto_135353 ?auto_135358 ) ) ( not ( = ?auto_135357 ?auto_135358 ) ) ( not ( = ?auto_135354 ?auto_135358 ) ) ( not ( = ?auto_135355 ?auto_135358 ) ) ( not ( = ?auto_135356 ?auto_135358 ) ) ( ON ?auto_135351 ?auto_135350 ) ( ON-TABLE ?auto_135358 ) ( ON ?auto_135352 ?auto_135351 ) ( ON ?auto_135353 ?auto_135352 ) ( ON ?auto_135357 ?auto_135353 ) ( ON ?auto_135356 ?auto_135357 ) ( CLEAR ?auto_135354 ) ( ON ?auto_135355 ?auto_135356 ) ( CLEAR ?auto_135355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135358 ?auto_135350 ?auto_135351 ?auto_135352 ?auto_135353 ?auto_135357 ?auto_135356 )
      ( MAKE-4PILE ?auto_135350 ?auto_135351 ?auto_135352 ?auto_135353 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135359 - BLOCK
      ?auto_135360 - BLOCK
      ?auto_135361 - BLOCK
      ?auto_135362 - BLOCK
    )
    :vars
    (
      ?auto_135366 - BLOCK
      ?auto_135364 - BLOCK
      ?auto_135365 - BLOCK
      ?auto_135367 - BLOCK
      ?auto_135363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135359 ?auto_135360 ) ) ( not ( = ?auto_135359 ?auto_135361 ) ) ( not ( = ?auto_135359 ?auto_135362 ) ) ( not ( = ?auto_135360 ?auto_135361 ) ) ( not ( = ?auto_135360 ?auto_135362 ) ) ( not ( = ?auto_135361 ?auto_135362 ) ) ( not ( = ?auto_135359 ?auto_135366 ) ) ( not ( = ?auto_135360 ?auto_135366 ) ) ( not ( = ?auto_135361 ?auto_135366 ) ) ( not ( = ?auto_135362 ?auto_135366 ) ) ( not ( = ?auto_135364 ?auto_135365 ) ) ( not ( = ?auto_135364 ?auto_135367 ) ) ( not ( = ?auto_135364 ?auto_135366 ) ) ( not ( = ?auto_135364 ?auto_135362 ) ) ( not ( = ?auto_135364 ?auto_135361 ) ) ( not ( = ?auto_135365 ?auto_135367 ) ) ( not ( = ?auto_135365 ?auto_135366 ) ) ( not ( = ?auto_135365 ?auto_135362 ) ) ( not ( = ?auto_135365 ?auto_135361 ) ) ( not ( = ?auto_135367 ?auto_135366 ) ) ( not ( = ?auto_135367 ?auto_135362 ) ) ( not ( = ?auto_135367 ?auto_135361 ) ) ( not ( = ?auto_135359 ?auto_135364 ) ) ( not ( = ?auto_135359 ?auto_135365 ) ) ( not ( = ?auto_135359 ?auto_135367 ) ) ( not ( = ?auto_135360 ?auto_135364 ) ) ( not ( = ?auto_135360 ?auto_135365 ) ) ( not ( = ?auto_135360 ?auto_135367 ) ) ( ON ?auto_135359 ?auto_135363 ) ( not ( = ?auto_135359 ?auto_135363 ) ) ( not ( = ?auto_135360 ?auto_135363 ) ) ( not ( = ?auto_135361 ?auto_135363 ) ) ( not ( = ?auto_135362 ?auto_135363 ) ) ( not ( = ?auto_135366 ?auto_135363 ) ) ( not ( = ?auto_135364 ?auto_135363 ) ) ( not ( = ?auto_135365 ?auto_135363 ) ) ( not ( = ?auto_135367 ?auto_135363 ) ) ( ON ?auto_135360 ?auto_135359 ) ( ON-TABLE ?auto_135363 ) ( ON ?auto_135361 ?auto_135360 ) ( ON ?auto_135362 ?auto_135361 ) ( ON ?auto_135366 ?auto_135362 ) ( ON ?auto_135367 ?auto_135366 ) ( ON ?auto_135365 ?auto_135367 ) ( CLEAR ?auto_135365 ) ( HOLDING ?auto_135364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135364 )
      ( MAKE-4PILE ?auto_135359 ?auto_135360 ?auto_135361 ?auto_135362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135368 - BLOCK
      ?auto_135369 - BLOCK
      ?auto_135370 - BLOCK
      ?auto_135371 - BLOCK
    )
    :vars
    (
      ?auto_135376 - BLOCK
      ?auto_135375 - BLOCK
      ?auto_135374 - BLOCK
      ?auto_135372 - BLOCK
      ?auto_135373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135368 ?auto_135369 ) ) ( not ( = ?auto_135368 ?auto_135370 ) ) ( not ( = ?auto_135368 ?auto_135371 ) ) ( not ( = ?auto_135369 ?auto_135370 ) ) ( not ( = ?auto_135369 ?auto_135371 ) ) ( not ( = ?auto_135370 ?auto_135371 ) ) ( not ( = ?auto_135368 ?auto_135376 ) ) ( not ( = ?auto_135369 ?auto_135376 ) ) ( not ( = ?auto_135370 ?auto_135376 ) ) ( not ( = ?auto_135371 ?auto_135376 ) ) ( not ( = ?auto_135375 ?auto_135374 ) ) ( not ( = ?auto_135375 ?auto_135372 ) ) ( not ( = ?auto_135375 ?auto_135376 ) ) ( not ( = ?auto_135375 ?auto_135371 ) ) ( not ( = ?auto_135375 ?auto_135370 ) ) ( not ( = ?auto_135374 ?auto_135372 ) ) ( not ( = ?auto_135374 ?auto_135376 ) ) ( not ( = ?auto_135374 ?auto_135371 ) ) ( not ( = ?auto_135374 ?auto_135370 ) ) ( not ( = ?auto_135372 ?auto_135376 ) ) ( not ( = ?auto_135372 ?auto_135371 ) ) ( not ( = ?auto_135372 ?auto_135370 ) ) ( not ( = ?auto_135368 ?auto_135375 ) ) ( not ( = ?auto_135368 ?auto_135374 ) ) ( not ( = ?auto_135368 ?auto_135372 ) ) ( not ( = ?auto_135369 ?auto_135375 ) ) ( not ( = ?auto_135369 ?auto_135374 ) ) ( not ( = ?auto_135369 ?auto_135372 ) ) ( ON ?auto_135368 ?auto_135373 ) ( not ( = ?auto_135368 ?auto_135373 ) ) ( not ( = ?auto_135369 ?auto_135373 ) ) ( not ( = ?auto_135370 ?auto_135373 ) ) ( not ( = ?auto_135371 ?auto_135373 ) ) ( not ( = ?auto_135376 ?auto_135373 ) ) ( not ( = ?auto_135375 ?auto_135373 ) ) ( not ( = ?auto_135374 ?auto_135373 ) ) ( not ( = ?auto_135372 ?auto_135373 ) ) ( ON ?auto_135369 ?auto_135368 ) ( ON-TABLE ?auto_135373 ) ( ON ?auto_135370 ?auto_135369 ) ( ON ?auto_135371 ?auto_135370 ) ( ON ?auto_135376 ?auto_135371 ) ( ON ?auto_135372 ?auto_135376 ) ( ON ?auto_135374 ?auto_135372 ) ( ON ?auto_135375 ?auto_135374 ) ( CLEAR ?auto_135375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135373 ?auto_135368 ?auto_135369 ?auto_135370 ?auto_135371 ?auto_135376 ?auto_135372 ?auto_135374 )
      ( MAKE-4PILE ?auto_135368 ?auto_135369 ?auto_135370 ?auto_135371 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135380 - BLOCK
      ?auto_135381 - BLOCK
      ?auto_135382 - BLOCK
    )
    :vars
    (
      ?auto_135383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135383 ?auto_135382 ) ( CLEAR ?auto_135383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135380 ) ( ON ?auto_135381 ?auto_135380 ) ( ON ?auto_135382 ?auto_135381 ) ( not ( = ?auto_135380 ?auto_135381 ) ) ( not ( = ?auto_135380 ?auto_135382 ) ) ( not ( = ?auto_135380 ?auto_135383 ) ) ( not ( = ?auto_135381 ?auto_135382 ) ) ( not ( = ?auto_135381 ?auto_135383 ) ) ( not ( = ?auto_135382 ?auto_135383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135383 ?auto_135382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135384 - BLOCK
      ?auto_135385 - BLOCK
      ?auto_135386 - BLOCK
    )
    :vars
    (
      ?auto_135387 - BLOCK
      ?auto_135388 - BLOCK
      ?auto_135389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135387 ?auto_135386 ) ( CLEAR ?auto_135387 ) ( ON-TABLE ?auto_135384 ) ( ON ?auto_135385 ?auto_135384 ) ( ON ?auto_135386 ?auto_135385 ) ( not ( = ?auto_135384 ?auto_135385 ) ) ( not ( = ?auto_135384 ?auto_135386 ) ) ( not ( = ?auto_135384 ?auto_135387 ) ) ( not ( = ?auto_135385 ?auto_135386 ) ) ( not ( = ?auto_135385 ?auto_135387 ) ) ( not ( = ?auto_135386 ?auto_135387 ) ) ( HOLDING ?auto_135388 ) ( CLEAR ?auto_135389 ) ( not ( = ?auto_135384 ?auto_135388 ) ) ( not ( = ?auto_135384 ?auto_135389 ) ) ( not ( = ?auto_135385 ?auto_135388 ) ) ( not ( = ?auto_135385 ?auto_135389 ) ) ( not ( = ?auto_135386 ?auto_135388 ) ) ( not ( = ?auto_135386 ?auto_135389 ) ) ( not ( = ?auto_135387 ?auto_135388 ) ) ( not ( = ?auto_135387 ?auto_135389 ) ) ( not ( = ?auto_135388 ?auto_135389 ) ) )
    :subtasks
    ( ( !STACK ?auto_135388 ?auto_135389 )
      ( MAKE-3PILE ?auto_135384 ?auto_135385 ?auto_135386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135390 - BLOCK
      ?auto_135391 - BLOCK
      ?auto_135392 - BLOCK
    )
    :vars
    (
      ?auto_135393 - BLOCK
      ?auto_135394 - BLOCK
      ?auto_135395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135393 ?auto_135392 ) ( ON-TABLE ?auto_135390 ) ( ON ?auto_135391 ?auto_135390 ) ( ON ?auto_135392 ?auto_135391 ) ( not ( = ?auto_135390 ?auto_135391 ) ) ( not ( = ?auto_135390 ?auto_135392 ) ) ( not ( = ?auto_135390 ?auto_135393 ) ) ( not ( = ?auto_135391 ?auto_135392 ) ) ( not ( = ?auto_135391 ?auto_135393 ) ) ( not ( = ?auto_135392 ?auto_135393 ) ) ( CLEAR ?auto_135394 ) ( not ( = ?auto_135390 ?auto_135395 ) ) ( not ( = ?auto_135390 ?auto_135394 ) ) ( not ( = ?auto_135391 ?auto_135395 ) ) ( not ( = ?auto_135391 ?auto_135394 ) ) ( not ( = ?auto_135392 ?auto_135395 ) ) ( not ( = ?auto_135392 ?auto_135394 ) ) ( not ( = ?auto_135393 ?auto_135395 ) ) ( not ( = ?auto_135393 ?auto_135394 ) ) ( not ( = ?auto_135395 ?auto_135394 ) ) ( ON ?auto_135395 ?auto_135393 ) ( CLEAR ?auto_135395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135390 ?auto_135391 ?auto_135392 ?auto_135393 )
      ( MAKE-3PILE ?auto_135390 ?auto_135391 ?auto_135392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135396 - BLOCK
      ?auto_135397 - BLOCK
      ?auto_135398 - BLOCK
    )
    :vars
    (
      ?auto_135400 - BLOCK
      ?auto_135401 - BLOCK
      ?auto_135399 - BLOCK
      ?auto_135403 - BLOCK
      ?auto_135402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135400 ?auto_135398 ) ( ON-TABLE ?auto_135396 ) ( ON ?auto_135397 ?auto_135396 ) ( ON ?auto_135398 ?auto_135397 ) ( not ( = ?auto_135396 ?auto_135397 ) ) ( not ( = ?auto_135396 ?auto_135398 ) ) ( not ( = ?auto_135396 ?auto_135400 ) ) ( not ( = ?auto_135397 ?auto_135398 ) ) ( not ( = ?auto_135397 ?auto_135400 ) ) ( not ( = ?auto_135398 ?auto_135400 ) ) ( not ( = ?auto_135396 ?auto_135401 ) ) ( not ( = ?auto_135396 ?auto_135399 ) ) ( not ( = ?auto_135397 ?auto_135401 ) ) ( not ( = ?auto_135397 ?auto_135399 ) ) ( not ( = ?auto_135398 ?auto_135401 ) ) ( not ( = ?auto_135398 ?auto_135399 ) ) ( not ( = ?auto_135400 ?auto_135401 ) ) ( not ( = ?auto_135400 ?auto_135399 ) ) ( not ( = ?auto_135401 ?auto_135399 ) ) ( ON ?auto_135401 ?auto_135400 ) ( CLEAR ?auto_135401 ) ( HOLDING ?auto_135399 ) ( CLEAR ?auto_135403 ) ( ON-TABLE ?auto_135402 ) ( ON ?auto_135403 ?auto_135402 ) ( not ( = ?auto_135402 ?auto_135403 ) ) ( not ( = ?auto_135402 ?auto_135399 ) ) ( not ( = ?auto_135403 ?auto_135399 ) ) ( not ( = ?auto_135396 ?auto_135403 ) ) ( not ( = ?auto_135396 ?auto_135402 ) ) ( not ( = ?auto_135397 ?auto_135403 ) ) ( not ( = ?auto_135397 ?auto_135402 ) ) ( not ( = ?auto_135398 ?auto_135403 ) ) ( not ( = ?auto_135398 ?auto_135402 ) ) ( not ( = ?auto_135400 ?auto_135403 ) ) ( not ( = ?auto_135400 ?auto_135402 ) ) ( not ( = ?auto_135401 ?auto_135403 ) ) ( not ( = ?auto_135401 ?auto_135402 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135402 ?auto_135403 ?auto_135399 )
      ( MAKE-3PILE ?auto_135396 ?auto_135397 ?auto_135398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135404 - BLOCK
      ?auto_135405 - BLOCK
      ?auto_135406 - BLOCK
    )
    :vars
    (
      ?auto_135409 - BLOCK
      ?auto_135410 - BLOCK
      ?auto_135408 - BLOCK
      ?auto_135407 - BLOCK
      ?auto_135411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135409 ?auto_135406 ) ( ON-TABLE ?auto_135404 ) ( ON ?auto_135405 ?auto_135404 ) ( ON ?auto_135406 ?auto_135405 ) ( not ( = ?auto_135404 ?auto_135405 ) ) ( not ( = ?auto_135404 ?auto_135406 ) ) ( not ( = ?auto_135404 ?auto_135409 ) ) ( not ( = ?auto_135405 ?auto_135406 ) ) ( not ( = ?auto_135405 ?auto_135409 ) ) ( not ( = ?auto_135406 ?auto_135409 ) ) ( not ( = ?auto_135404 ?auto_135410 ) ) ( not ( = ?auto_135404 ?auto_135408 ) ) ( not ( = ?auto_135405 ?auto_135410 ) ) ( not ( = ?auto_135405 ?auto_135408 ) ) ( not ( = ?auto_135406 ?auto_135410 ) ) ( not ( = ?auto_135406 ?auto_135408 ) ) ( not ( = ?auto_135409 ?auto_135410 ) ) ( not ( = ?auto_135409 ?auto_135408 ) ) ( not ( = ?auto_135410 ?auto_135408 ) ) ( ON ?auto_135410 ?auto_135409 ) ( CLEAR ?auto_135407 ) ( ON-TABLE ?auto_135411 ) ( ON ?auto_135407 ?auto_135411 ) ( not ( = ?auto_135411 ?auto_135407 ) ) ( not ( = ?auto_135411 ?auto_135408 ) ) ( not ( = ?auto_135407 ?auto_135408 ) ) ( not ( = ?auto_135404 ?auto_135407 ) ) ( not ( = ?auto_135404 ?auto_135411 ) ) ( not ( = ?auto_135405 ?auto_135407 ) ) ( not ( = ?auto_135405 ?auto_135411 ) ) ( not ( = ?auto_135406 ?auto_135407 ) ) ( not ( = ?auto_135406 ?auto_135411 ) ) ( not ( = ?auto_135409 ?auto_135407 ) ) ( not ( = ?auto_135409 ?auto_135411 ) ) ( not ( = ?auto_135410 ?auto_135407 ) ) ( not ( = ?auto_135410 ?auto_135411 ) ) ( ON ?auto_135408 ?auto_135410 ) ( CLEAR ?auto_135408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135404 ?auto_135405 ?auto_135406 ?auto_135409 ?auto_135410 )
      ( MAKE-3PILE ?auto_135404 ?auto_135405 ?auto_135406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135412 - BLOCK
      ?auto_135413 - BLOCK
      ?auto_135414 - BLOCK
    )
    :vars
    (
      ?auto_135419 - BLOCK
      ?auto_135417 - BLOCK
      ?auto_135418 - BLOCK
      ?auto_135416 - BLOCK
      ?auto_135415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135419 ?auto_135414 ) ( ON-TABLE ?auto_135412 ) ( ON ?auto_135413 ?auto_135412 ) ( ON ?auto_135414 ?auto_135413 ) ( not ( = ?auto_135412 ?auto_135413 ) ) ( not ( = ?auto_135412 ?auto_135414 ) ) ( not ( = ?auto_135412 ?auto_135419 ) ) ( not ( = ?auto_135413 ?auto_135414 ) ) ( not ( = ?auto_135413 ?auto_135419 ) ) ( not ( = ?auto_135414 ?auto_135419 ) ) ( not ( = ?auto_135412 ?auto_135417 ) ) ( not ( = ?auto_135412 ?auto_135418 ) ) ( not ( = ?auto_135413 ?auto_135417 ) ) ( not ( = ?auto_135413 ?auto_135418 ) ) ( not ( = ?auto_135414 ?auto_135417 ) ) ( not ( = ?auto_135414 ?auto_135418 ) ) ( not ( = ?auto_135419 ?auto_135417 ) ) ( not ( = ?auto_135419 ?auto_135418 ) ) ( not ( = ?auto_135417 ?auto_135418 ) ) ( ON ?auto_135417 ?auto_135419 ) ( ON-TABLE ?auto_135416 ) ( not ( = ?auto_135416 ?auto_135415 ) ) ( not ( = ?auto_135416 ?auto_135418 ) ) ( not ( = ?auto_135415 ?auto_135418 ) ) ( not ( = ?auto_135412 ?auto_135415 ) ) ( not ( = ?auto_135412 ?auto_135416 ) ) ( not ( = ?auto_135413 ?auto_135415 ) ) ( not ( = ?auto_135413 ?auto_135416 ) ) ( not ( = ?auto_135414 ?auto_135415 ) ) ( not ( = ?auto_135414 ?auto_135416 ) ) ( not ( = ?auto_135419 ?auto_135415 ) ) ( not ( = ?auto_135419 ?auto_135416 ) ) ( not ( = ?auto_135417 ?auto_135415 ) ) ( not ( = ?auto_135417 ?auto_135416 ) ) ( ON ?auto_135418 ?auto_135417 ) ( CLEAR ?auto_135418 ) ( HOLDING ?auto_135415 ) ( CLEAR ?auto_135416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135416 ?auto_135415 )
      ( MAKE-3PILE ?auto_135412 ?auto_135413 ?auto_135414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135420 - BLOCK
      ?auto_135421 - BLOCK
      ?auto_135422 - BLOCK
    )
    :vars
    (
      ?auto_135427 - BLOCK
      ?auto_135426 - BLOCK
      ?auto_135423 - BLOCK
      ?auto_135424 - BLOCK
      ?auto_135425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135427 ?auto_135422 ) ( ON-TABLE ?auto_135420 ) ( ON ?auto_135421 ?auto_135420 ) ( ON ?auto_135422 ?auto_135421 ) ( not ( = ?auto_135420 ?auto_135421 ) ) ( not ( = ?auto_135420 ?auto_135422 ) ) ( not ( = ?auto_135420 ?auto_135427 ) ) ( not ( = ?auto_135421 ?auto_135422 ) ) ( not ( = ?auto_135421 ?auto_135427 ) ) ( not ( = ?auto_135422 ?auto_135427 ) ) ( not ( = ?auto_135420 ?auto_135426 ) ) ( not ( = ?auto_135420 ?auto_135423 ) ) ( not ( = ?auto_135421 ?auto_135426 ) ) ( not ( = ?auto_135421 ?auto_135423 ) ) ( not ( = ?auto_135422 ?auto_135426 ) ) ( not ( = ?auto_135422 ?auto_135423 ) ) ( not ( = ?auto_135427 ?auto_135426 ) ) ( not ( = ?auto_135427 ?auto_135423 ) ) ( not ( = ?auto_135426 ?auto_135423 ) ) ( ON ?auto_135426 ?auto_135427 ) ( ON-TABLE ?auto_135424 ) ( not ( = ?auto_135424 ?auto_135425 ) ) ( not ( = ?auto_135424 ?auto_135423 ) ) ( not ( = ?auto_135425 ?auto_135423 ) ) ( not ( = ?auto_135420 ?auto_135425 ) ) ( not ( = ?auto_135420 ?auto_135424 ) ) ( not ( = ?auto_135421 ?auto_135425 ) ) ( not ( = ?auto_135421 ?auto_135424 ) ) ( not ( = ?auto_135422 ?auto_135425 ) ) ( not ( = ?auto_135422 ?auto_135424 ) ) ( not ( = ?auto_135427 ?auto_135425 ) ) ( not ( = ?auto_135427 ?auto_135424 ) ) ( not ( = ?auto_135426 ?auto_135425 ) ) ( not ( = ?auto_135426 ?auto_135424 ) ) ( ON ?auto_135423 ?auto_135426 ) ( CLEAR ?auto_135424 ) ( ON ?auto_135425 ?auto_135423 ) ( CLEAR ?auto_135425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135420 ?auto_135421 ?auto_135422 ?auto_135427 ?auto_135426 ?auto_135423 )
      ( MAKE-3PILE ?auto_135420 ?auto_135421 ?auto_135422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135428 - BLOCK
      ?auto_135429 - BLOCK
      ?auto_135430 - BLOCK
    )
    :vars
    (
      ?auto_135434 - BLOCK
      ?auto_135432 - BLOCK
      ?auto_135435 - BLOCK
      ?auto_135431 - BLOCK
      ?auto_135433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135434 ?auto_135430 ) ( ON-TABLE ?auto_135428 ) ( ON ?auto_135429 ?auto_135428 ) ( ON ?auto_135430 ?auto_135429 ) ( not ( = ?auto_135428 ?auto_135429 ) ) ( not ( = ?auto_135428 ?auto_135430 ) ) ( not ( = ?auto_135428 ?auto_135434 ) ) ( not ( = ?auto_135429 ?auto_135430 ) ) ( not ( = ?auto_135429 ?auto_135434 ) ) ( not ( = ?auto_135430 ?auto_135434 ) ) ( not ( = ?auto_135428 ?auto_135432 ) ) ( not ( = ?auto_135428 ?auto_135435 ) ) ( not ( = ?auto_135429 ?auto_135432 ) ) ( not ( = ?auto_135429 ?auto_135435 ) ) ( not ( = ?auto_135430 ?auto_135432 ) ) ( not ( = ?auto_135430 ?auto_135435 ) ) ( not ( = ?auto_135434 ?auto_135432 ) ) ( not ( = ?auto_135434 ?auto_135435 ) ) ( not ( = ?auto_135432 ?auto_135435 ) ) ( ON ?auto_135432 ?auto_135434 ) ( not ( = ?auto_135431 ?auto_135433 ) ) ( not ( = ?auto_135431 ?auto_135435 ) ) ( not ( = ?auto_135433 ?auto_135435 ) ) ( not ( = ?auto_135428 ?auto_135433 ) ) ( not ( = ?auto_135428 ?auto_135431 ) ) ( not ( = ?auto_135429 ?auto_135433 ) ) ( not ( = ?auto_135429 ?auto_135431 ) ) ( not ( = ?auto_135430 ?auto_135433 ) ) ( not ( = ?auto_135430 ?auto_135431 ) ) ( not ( = ?auto_135434 ?auto_135433 ) ) ( not ( = ?auto_135434 ?auto_135431 ) ) ( not ( = ?auto_135432 ?auto_135433 ) ) ( not ( = ?auto_135432 ?auto_135431 ) ) ( ON ?auto_135435 ?auto_135432 ) ( ON ?auto_135433 ?auto_135435 ) ( CLEAR ?auto_135433 ) ( HOLDING ?auto_135431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135431 )
      ( MAKE-3PILE ?auto_135428 ?auto_135429 ?auto_135430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135436 - BLOCK
      ?auto_135437 - BLOCK
      ?auto_135438 - BLOCK
    )
    :vars
    (
      ?auto_135439 - BLOCK
      ?auto_135443 - BLOCK
      ?auto_135442 - BLOCK
      ?auto_135441 - BLOCK
      ?auto_135440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135439 ?auto_135438 ) ( ON-TABLE ?auto_135436 ) ( ON ?auto_135437 ?auto_135436 ) ( ON ?auto_135438 ?auto_135437 ) ( not ( = ?auto_135436 ?auto_135437 ) ) ( not ( = ?auto_135436 ?auto_135438 ) ) ( not ( = ?auto_135436 ?auto_135439 ) ) ( not ( = ?auto_135437 ?auto_135438 ) ) ( not ( = ?auto_135437 ?auto_135439 ) ) ( not ( = ?auto_135438 ?auto_135439 ) ) ( not ( = ?auto_135436 ?auto_135443 ) ) ( not ( = ?auto_135436 ?auto_135442 ) ) ( not ( = ?auto_135437 ?auto_135443 ) ) ( not ( = ?auto_135437 ?auto_135442 ) ) ( not ( = ?auto_135438 ?auto_135443 ) ) ( not ( = ?auto_135438 ?auto_135442 ) ) ( not ( = ?auto_135439 ?auto_135443 ) ) ( not ( = ?auto_135439 ?auto_135442 ) ) ( not ( = ?auto_135443 ?auto_135442 ) ) ( ON ?auto_135443 ?auto_135439 ) ( not ( = ?auto_135441 ?auto_135440 ) ) ( not ( = ?auto_135441 ?auto_135442 ) ) ( not ( = ?auto_135440 ?auto_135442 ) ) ( not ( = ?auto_135436 ?auto_135440 ) ) ( not ( = ?auto_135436 ?auto_135441 ) ) ( not ( = ?auto_135437 ?auto_135440 ) ) ( not ( = ?auto_135437 ?auto_135441 ) ) ( not ( = ?auto_135438 ?auto_135440 ) ) ( not ( = ?auto_135438 ?auto_135441 ) ) ( not ( = ?auto_135439 ?auto_135440 ) ) ( not ( = ?auto_135439 ?auto_135441 ) ) ( not ( = ?auto_135443 ?auto_135440 ) ) ( not ( = ?auto_135443 ?auto_135441 ) ) ( ON ?auto_135442 ?auto_135443 ) ( ON ?auto_135440 ?auto_135442 ) ( ON ?auto_135441 ?auto_135440 ) ( CLEAR ?auto_135441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135436 ?auto_135437 ?auto_135438 ?auto_135439 ?auto_135443 ?auto_135442 ?auto_135440 )
      ( MAKE-3PILE ?auto_135436 ?auto_135437 ?auto_135438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135444 - BLOCK
      ?auto_135445 - BLOCK
      ?auto_135446 - BLOCK
    )
    :vars
    (
      ?auto_135448 - BLOCK
      ?auto_135451 - BLOCK
      ?auto_135447 - BLOCK
      ?auto_135450 - BLOCK
      ?auto_135449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135448 ?auto_135446 ) ( ON-TABLE ?auto_135444 ) ( ON ?auto_135445 ?auto_135444 ) ( ON ?auto_135446 ?auto_135445 ) ( not ( = ?auto_135444 ?auto_135445 ) ) ( not ( = ?auto_135444 ?auto_135446 ) ) ( not ( = ?auto_135444 ?auto_135448 ) ) ( not ( = ?auto_135445 ?auto_135446 ) ) ( not ( = ?auto_135445 ?auto_135448 ) ) ( not ( = ?auto_135446 ?auto_135448 ) ) ( not ( = ?auto_135444 ?auto_135451 ) ) ( not ( = ?auto_135444 ?auto_135447 ) ) ( not ( = ?auto_135445 ?auto_135451 ) ) ( not ( = ?auto_135445 ?auto_135447 ) ) ( not ( = ?auto_135446 ?auto_135451 ) ) ( not ( = ?auto_135446 ?auto_135447 ) ) ( not ( = ?auto_135448 ?auto_135451 ) ) ( not ( = ?auto_135448 ?auto_135447 ) ) ( not ( = ?auto_135451 ?auto_135447 ) ) ( ON ?auto_135451 ?auto_135448 ) ( not ( = ?auto_135450 ?auto_135449 ) ) ( not ( = ?auto_135450 ?auto_135447 ) ) ( not ( = ?auto_135449 ?auto_135447 ) ) ( not ( = ?auto_135444 ?auto_135449 ) ) ( not ( = ?auto_135444 ?auto_135450 ) ) ( not ( = ?auto_135445 ?auto_135449 ) ) ( not ( = ?auto_135445 ?auto_135450 ) ) ( not ( = ?auto_135446 ?auto_135449 ) ) ( not ( = ?auto_135446 ?auto_135450 ) ) ( not ( = ?auto_135448 ?auto_135449 ) ) ( not ( = ?auto_135448 ?auto_135450 ) ) ( not ( = ?auto_135451 ?auto_135449 ) ) ( not ( = ?auto_135451 ?auto_135450 ) ) ( ON ?auto_135447 ?auto_135451 ) ( ON ?auto_135449 ?auto_135447 ) ( HOLDING ?auto_135450 ) ( CLEAR ?auto_135449 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135444 ?auto_135445 ?auto_135446 ?auto_135448 ?auto_135451 ?auto_135447 ?auto_135449 ?auto_135450 )
      ( MAKE-3PILE ?auto_135444 ?auto_135445 ?auto_135446 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135452 - BLOCK
      ?auto_135453 - BLOCK
      ?auto_135454 - BLOCK
    )
    :vars
    (
      ?auto_135457 - BLOCK
      ?auto_135456 - BLOCK
      ?auto_135455 - BLOCK
      ?auto_135458 - BLOCK
      ?auto_135459 - BLOCK
      ?auto_135460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135457 ?auto_135454 ) ( ON-TABLE ?auto_135452 ) ( ON ?auto_135453 ?auto_135452 ) ( ON ?auto_135454 ?auto_135453 ) ( not ( = ?auto_135452 ?auto_135453 ) ) ( not ( = ?auto_135452 ?auto_135454 ) ) ( not ( = ?auto_135452 ?auto_135457 ) ) ( not ( = ?auto_135453 ?auto_135454 ) ) ( not ( = ?auto_135453 ?auto_135457 ) ) ( not ( = ?auto_135454 ?auto_135457 ) ) ( not ( = ?auto_135452 ?auto_135456 ) ) ( not ( = ?auto_135452 ?auto_135455 ) ) ( not ( = ?auto_135453 ?auto_135456 ) ) ( not ( = ?auto_135453 ?auto_135455 ) ) ( not ( = ?auto_135454 ?auto_135456 ) ) ( not ( = ?auto_135454 ?auto_135455 ) ) ( not ( = ?auto_135457 ?auto_135456 ) ) ( not ( = ?auto_135457 ?auto_135455 ) ) ( not ( = ?auto_135456 ?auto_135455 ) ) ( ON ?auto_135456 ?auto_135457 ) ( not ( = ?auto_135458 ?auto_135459 ) ) ( not ( = ?auto_135458 ?auto_135455 ) ) ( not ( = ?auto_135459 ?auto_135455 ) ) ( not ( = ?auto_135452 ?auto_135459 ) ) ( not ( = ?auto_135452 ?auto_135458 ) ) ( not ( = ?auto_135453 ?auto_135459 ) ) ( not ( = ?auto_135453 ?auto_135458 ) ) ( not ( = ?auto_135454 ?auto_135459 ) ) ( not ( = ?auto_135454 ?auto_135458 ) ) ( not ( = ?auto_135457 ?auto_135459 ) ) ( not ( = ?auto_135457 ?auto_135458 ) ) ( not ( = ?auto_135456 ?auto_135459 ) ) ( not ( = ?auto_135456 ?auto_135458 ) ) ( ON ?auto_135455 ?auto_135456 ) ( ON ?auto_135459 ?auto_135455 ) ( CLEAR ?auto_135459 ) ( ON ?auto_135458 ?auto_135460 ) ( CLEAR ?auto_135458 ) ( HAND-EMPTY ) ( not ( = ?auto_135452 ?auto_135460 ) ) ( not ( = ?auto_135453 ?auto_135460 ) ) ( not ( = ?auto_135454 ?auto_135460 ) ) ( not ( = ?auto_135457 ?auto_135460 ) ) ( not ( = ?auto_135456 ?auto_135460 ) ) ( not ( = ?auto_135455 ?auto_135460 ) ) ( not ( = ?auto_135458 ?auto_135460 ) ) ( not ( = ?auto_135459 ?auto_135460 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135458 ?auto_135460 )
      ( MAKE-3PILE ?auto_135452 ?auto_135453 ?auto_135454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135461 - BLOCK
      ?auto_135462 - BLOCK
      ?auto_135463 - BLOCK
    )
    :vars
    (
      ?auto_135466 - BLOCK
      ?auto_135464 - BLOCK
      ?auto_135467 - BLOCK
      ?auto_135468 - BLOCK
      ?auto_135465 - BLOCK
      ?auto_135469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135466 ?auto_135463 ) ( ON-TABLE ?auto_135461 ) ( ON ?auto_135462 ?auto_135461 ) ( ON ?auto_135463 ?auto_135462 ) ( not ( = ?auto_135461 ?auto_135462 ) ) ( not ( = ?auto_135461 ?auto_135463 ) ) ( not ( = ?auto_135461 ?auto_135466 ) ) ( not ( = ?auto_135462 ?auto_135463 ) ) ( not ( = ?auto_135462 ?auto_135466 ) ) ( not ( = ?auto_135463 ?auto_135466 ) ) ( not ( = ?auto_135461 ?auto_135464 ) ) ( not ( = ?auto_135461 ?auto_135467 ) ) ( not ( = ?auto_135462 ?auto_135464 ) ) ( not ( = ?auto_135462 ?auto_135467 ) ) ( not ( = ?auto_135463 ?auto_135464 ) ) ( not ( = ?auto_135463 ?auto_135467 ) ) ( not ( = ?auto_135466 ?auto_135464 ) ) ( not ( = ?auto_135466 ?auto_135467 ) ) ( not ( = ?auto_135464 ?auto_135467 ) ) ( ON ?auto_135464 ?auto_135466 ) ( not ( = ?auto_135468 ?auto_135465 ) ) ( not ( = ?auto_135468 ?auto_135467 ) ) ( not ( = ?auto_135465 ?auto_135467 ) ) ( not ( = ?auto_135461 ?auto_135465 ) ) ( not ( = ?auto_135461 ?auto_135468 ) ) ( not ( = ?auto_135462 ?auto_135465 ) ) ( not ( = ?auto_135462 ?auto_135468 ) ) ( not ( = ?auto_135463 ?auto_135465 ) ) ( not ( = ?auto_135463 ?auto_135468 ) ) ( not ( = ?auto_135466 ?auto_135465 ) ) ( not ( = ?auto_135466 ?auto_135468 ) ) ( not ( = ?auto_135464 ?auto_135465 ) ) ( not ( = ?auto_135464 ?auto_135468 ) ) ( ON ?auto_135467 ?auto_135464 ) ( ON ?auto_135468 ?auto_135469 ) ( CLEAR ?auto_135468 ) ( not ( = ?auto_135461 ?auto_135469 ) ) ( not ( = ?auto_135462 ?auto_135469 ) ) ( not ( = ?auto_135463 ?auto_135469 ) ) ( not ( = ?auto_135466 ?auto_135469 ) ) ( not ( = ?auto_135464 ?auto_135469 ) ) ( not ( = ?auto_135467 ?auto_135469 ) ) ( not ( = ?auto_135468 ?auto_135469 ) ) ( not ( = ?auto_135465 ?auto_135469 ) ) ( HOLDING ?auto_135465 ) ( CLEAR ?auto_135467 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135461 ?auto_135462 ?auto_135463 ?auto_135466 ?auto_135464 ?auto_135467 ?auto_135465 )
      ( MAKE-3PILE ?auto_135461 ?auto_135462 ?auto_135463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135470 - BLOCK
      ?auto_135471 - BLOCK
      ?auto_135472 - BLOCK
    )
    :vars
    (
      ?auto_135475 - BLOCK
      ?auto_135473 - BLOCK
      ?auto_135477 - BLOCK
      ?auto_135478 - BLOCK
      ?auto_135476 - BLOCK
      ?auto_135474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135475 ?auto_135472 ) ( ON-TABLE ?auto_135470 ) ( ON ?auto_135471 ?auto_135470 ) ( ON ?auto_135472 ?auto_135471 ) ( not ( = ?auto_135470 ?auto_135471 ) ) ( not ( = ?auto_135470 ?auto_135472 ) ) ( not ( = ?auto_135470 ?auto_135475 ) ) ( not ( = ?auto_135471 ?auto_135472 ) ) ( not ( = ?auto_135471 ?auto_135475 ) ) ( not ( = ?auto_135472 ?auto_135475 ) ) ( not ( = ?auto_135470 ?auto_135473 ) ) ( not ( = ?auto_135470 ?auto_135477 ) ) ( not ( = ?auto_135471 ?auto_135473 ) ) ( not ( = ?auto_135471 ?auto_135477 ) ) ( not ( = ?auto_135472 ?auto_135473 ) ) ( not ( = ?auto_135472 ?auto_135477 ) ) ( not ( = ?auto_135475 ?auto_135473 ) ) ( not ( = ?auto_135475 ?auto_135477 ) ) ( not ( = ?auto_135473 ?auto_135477 ) ) ( ON ?auto_135473 ?auto_135475 ) ( not ( = ?auto_135478 ?auto_135476 ) ) ( not ( = ?auto_135478 ?auto_135477 ) ) ( not ( = ?auto_135476 ?auto_135477 ) ) ( not ( = ?auto_135470 ?auto_135476 ) ) ( not ( = ?auto_135470 ?auto_135478 ) ) ( not ( = ?auto_135471 ?auto_135476 ) ) ( not ( = ?auto_135471 ?auto_135478 ) ) ( not ( = ?auto_135472 ?auto_135476 ) ) ( not ( = ?auto_135472 ?auto_135478 ) ) ( not ( = ?auto_135475 ?auto_135476 ) ) ( not ( = ?auto_135475 ?auto_135478 ) ) ( not ( = ?auto_135473 ?auto_135476 ) ) ( not ( = ?auto_135473 ?auto_135478 ) ) ( ON ?auto_135477 ?auto_135473 ) ( ON ?auto_135478 ?auto_135474 ) ( not ( = ?auto_135470 ?auto_135474 ) ) ( not ( = ?auto_135471 ?auto_135474 ) ) ( not ( = ?auto_135472 ?auto_135474 ) ) ( not ( = ?auto_135475 ?auto_135474 ) ) ( not ( = ?auto_135473 ?auto_135474 ) ) ( not ( = ?auto_135477 ?auto_135474 ) ) ( not ( = ?auto_135478 ?auto_135474 ) ) ( not ( = ?auto_135476 ?auto_135474 ) ) ( CLEAR ?auto_135477 ) ( ON ?auto_135476 ?auto_135478 ) ( CLEAR ?auto_135476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135474 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135474 ?auto_135478 )
      ( MAKE-3PILE ?auto_135470 ?auto_135471 ?auto_135472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135479 - BLOCK
      ?auto_135480 - BLOCK
      ?auto_135481 - BLOCK
    )
    :vars
    (
      ?auto_135483 - BLOCK
      ?auto_135482 - BLOCK
      ?auto_135484 - BLOCK
      ?auto_135486 - BLOCK
      ?auto_135487 - BLOCK
      ?auto_135485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135483 ?auto_135481 ) ( ON-TABLE ?auto_135479 ) ( ON ?auto_135480 ?auto_135479 ) ( ON ?auto_135481 ?auto_135480 ) ( not ( = ?auto_135479 ?auto_135480 ) ) ( not ( = ?auto_135479 ?auto_135481 ) ) ( not ( = ?auto_135479 ?auto_135483 ) ) ( not ( = ?auto_135480 ?auto_135481 ) ) ( not ( = ?auto_135480 ?auto_135483 ) ) ( not ( = ?auto_135481 ?auto_135483 ) ) ( not ( = ?auto_135479 ?auto_135482 ) ) ( not ( = ?auto_135479 ?auto_135484 ) ) ( not ( = ?auto_135480 ?auto_135482 ) ) ( not ( = ?auto_135480 ?auto_135484 ) ) ( not ( = ?auto_135481 ?auto_135482 ) ) ( not ( = ?auto_135481 ?auto_135484 ) ) ( not ( = ?auto_135483 ?auto_135482 ) ) ( not ( = ?auto_135483 ?auto_135484 ) ) ( not ( = ?auto_135482 ?auto_135484 ) ) ( ON ?auto_135482 ?auto_135483 ) ( not ( = ?auto_135486 ?auto_135487 ) ) ( not ( = ?auto_135486 ?auto_135484 ) ) ( not ( = ?auto_135487 ?auto_135484 ) ) ( not ( = ?auto_135479 ?auto_135487 ) ) ( not ( = ?auto_135479 ?auto_135486 ) ) ( not ( = ?auto_135480 ?auto_135487 ) ) ( not ( = ?auto_135480 ?auto_135486 ) ) ( not ( = ?auto_135481 ?auto_135487 ) ) ( not ( = ?auto_135481 ?auto_135486 ) ) ( not ( = ?auto_135483 ?auto_135487 ) ) ( not ( = ?auto_135483 ?auto_135486 ) ) ( not ( = ?auto_135482 ?auto_135487 ) ) ( not ( = ?auto_135482 ?auto_135486 ) ) ( ON ?auto_135486 ?auto_135485 ) ( not ( = ?auto_135479 ?auto_135485 ) ) ( not ( = ?auto_135480 ?auto_135485 ) ) ( not ( = ?auto_135481 ?auto_135485 ) ) ( not ( = ?auto_135483 ?auto_135485 ) ) ( not ( = ?auto_135482 ?auto_135485 ) ) ( not ( = ?auto_135484 ?auto_135485 ) ) ( not ( = ?auto_135486 ?auto_135485 ) ) ( not ( = ?auto_135487 ?auto_135485 ) ) ( ON ?auto_135487 ?auto_135486 ) ( CLEAR ?auto_135487 ) ( ON-TABLE ?auto_135485 ) ( HOLDING ?auto_135484 ) ( CLEAR ?auto_135482 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135479 ?auto_135480 ?auto_135481 ?auto_135483 ?auto_135482 ?auto_135484 )
      ( MAKE-3PILE ?auto_135479 ?auto_135480 ?auto_135481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135488 - BLOCK
      ?auto_135489 - BLOCK
      ?auto_135490 - BLOCK
    )
    :vars
    (
      ?auto_135492 - BLOCK
      ?auto_135493 - BLOCK
      ?auto_135495 - BLOCK
      ?auto_135491 - BLOCK
      ?auto_135496 - BLOCK
      ?auto_135494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135492 ?auto_135490 ) ( ON-TABLE ?auto_135488 ) ( ON ?auto_135489 ?auto_135488 ) ( ON ?auto_135490 ?auto_135489 ) ( not ( = ?auto_135488 ?auto_135489 ) ) ( not ( = ?auto_135488 ?auto_135490 ) ) ( not ( = ?auto_135488 ?auto_135492 ) ) ( not ( = ?auto_135489 ?auto_135490 ) ) ( not ( = ?auto_135489 ?auto_135492 ) ) ( not ( = ?auto_135490 ?auto_135492 ) ) ( not ( = ?auto_135488 ?auto_135493 ) ) ( not ( = ?auto_135488 ?auto_135495 ) ) ( not ( = ?auto_135489 ?auto_135493 ) ) ( not ( = ?auto_135489 ?auto_135495 ) ) ( not ( = ?auto_135490 ?auto_135493 ) ) ( not ( = ?auto_135490 ?auto_135495 ) ) ( not ( = ?auto_135492 ?auto_135493 ) ) ( not ( = ?auto_135492 ?auto_135495 ) ) ( not ( = ?auto_135493 ?auto_135495 ) ) ( ON ?auto_135493 ?auto_135492 ) ( not ( = ?auto_135491 ?auto_135496 ) ) ( not ( = ?auto_135491 ?auto_135495 ) ) ( not ( = ?auto_135496 ?auto_135495 ) ) ( not ( = ?auto_135488 ?auto_135496 ) ) ( not ( = ?auto_135488 ?auto_135491 ) ) ( not ( = ?auto_135489 ?auto_135496 ) ) ( not ( = ?auto_135489 ?auto_135491 ) ) ( not ( = ?auto_135490 ?auto_135496 ) ) ( not ( = ?auto_135490 ?auto_135491 ) ) ( not ( = ?auto_135492 ?auto_135496 ) ) ( not ( = ?auto_135492 ?auto_135491 ) ) ( not ( = ?auto_135493 ?auto_135496 ) ) ( not ( = ?auto_135493 ?auto_135491 ) ) ( ON ?auto_135491 ?auto_135494 ) ( not ( = ?auto_135488 ?auto_135494 ) ) ( not ( = ?auto_135489 ?auto_135494 ) ) ( not ( = ?auto_135490 ?auto_135494 ) ) ( not ( = ?auto_135492 ?auto_135494 ) ) ( not ( = ?auto_135493 ?auto_135494 ) ) ( not ( = ?auto_135495 ?auto_135494 ) ) ( not ( = ?auto_135491 ?auto_135494 ) ) ( not ( = ?auto_135496 ?auto_135494 ) ) ( ON ?auto_135496 ?auto_135491 ) ( ON-TABLE ?auto_135494 ) ( CLEAR ?auto_135493 ) ( ON ?auto_135495 ?auto_135496 ) ( CLEAR ?auto_135495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135494 ?auto_135491 ?auto_135496 )
      ( MAKE-3PILE ?auto_135488 ?auto_135489 ?auto_135490 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135497 - BLOCK
      ?auto_135498 - BLOCK
      ?auto_135499 - BLOCK
    )
    :vars
    (
      ?auto_135503 - BLOCK
      ?auto_135502 - BLOCK
      ?auto_135504 - BLOCK
      ?auto_135501 - BLOCK
      ?auto_135505 - BLOCK
      ?auto_135500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135503 ?auto_135499 ) ( ON-TABLE ?auto_135497 ) ( ON ?auto_135498 ?auto_135497 ) ( ON ?auto_135499 ?auto_135498 ) ( not ( = ?auto_135497 ?auto_135498 ) ) ( not ( = ?auto_135497 ?auto_135499 ) ) ( not ( = ?auto_135497 ?auto_135503 ) ) ( not ( = ?auto_135498 ?auto_135499 ) ) ( not ( = ?auto_135498 ?auto_135503 ) ) ( not ( = ?auto_135499 ?auto_135503 ) ) ( not ( = ?auto_135497 ?auto_135502 ) ) ( not ( = ?auto_135497 ?auto_135504 ) ) ( not ( = ?auto_135498 ?auto_135502 ) ) ( not ( = ?auto_135498 ?auto_135504 ) ) ( not ( = ?auto_135499 ?auto_135502 ) ) ( not ( = ?auto_135499 ?auto_135504 ) ) ( not ( = ?auto_135503 ?auto_135502 ) ) ( not ( = ?auto_135503 ?auto_135504 ) ) ( not ( = ?auto_135502 ?auto_135504 ) ) ( not ( = ?auto_135501 ?auto_135505 ) ) ( not ( = ?auto_135501 ?auto_135504 ) ) ( not ( = ?auto_135505 ?auto_135504 ) ) ( not ( = ?auto_135497 ?auto_135505 ) ) ( not ( = ?auto_135497 ?auto_135501 ) ) ( not ( = ?auto_135498 ?auto_135505 ) ) ( not ( = ?auto_135498 ?auto_135501 ) ) ( not ( = ?auto_135499 ?auto_135505 ) ) ( not ( = ?auto_135499 ?auto_135501 ) ) ( not ( = ?auto_135503 ?auto_135505 ) ) ( not ( = ?auto_135503 ?auto_135501 ) ) ( not ( = ?auto_135502 ?auto_135505 ) ) ( not ( = ?auto_135502 ?auto_135501 ) ) ( ON ?auto_135501 ?auto_135500 ) ( not ( = ?auto_135497 ?auto_135500 ) ) ( not ( = ?auto_135498 ?auto_135500 ) ) ( not ( = ?auto_135499 ?auto_135500 ) ) ( not ( = ?auto_135503 ?auto_135500 ) ) ( not ( = ?auto_135502 ?auto_135500 ) ) ( not ( = ?auto_135504 ?auto_135500 ) ) ( not ( = ?auto_135501 ?auto_135500 ) ) ( not ( = ?auto_135505 ?auto_135500 ) ) ( ON ?auto_135505 ?auto_135501 ) ( ON-TABLE ?auto_135500 ) ( ON ?auto_135504 ?auto_135505 ) ( CLEAR ?auto_135504 ) ( HOLDING ?auto_135502 ) ( CLEAR ?auto_135503 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135497 ?auto_135498 ?auto_135499 ?auto_135503 ?auto_135502 )
      ( MAKE-3PILE ?auto_135497 ?auto_135498 ?auto_135499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135506 - BLOCK
      ?auto_135507 - BLOCK
      ?auto_135508 - BLOCK
    )
    :vars
    (
      ?auto_135509 - BLOCK
      ?auto_135513 - BLOCK
      ?auto_135510 - BLOCK
      ?auto_135511 - BLOCK
      ?auto_135512 - BLOCK
      ?auto_135514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135509 ?auto_135508 ) ( ON-TABLE ?auto_135506 ) ( ON ?auto_135507 ?auto_135506 ) ( ON ?auto_135508 ?auto_135507 ) ( not ( = ?auto_135506 ?auto_135507 ) ) ( not ( = ?auto_135506 ?auto_135508 ) ) ( not ( = ?auto_135506 ?auto_135509 ) ) ( not ( = ?auto_135507 ?auto_135508 ) ) ( not ( = ?auto_135507 ?auto_135509 ) ) ( not ( = ?auto_135508 ?auto_135509 ) ) ( not ( = ?auto_135506 ?auto_135513 ) ) ( not ( = ?auto_135506 ?auto_135510 ) ) ( not ( = ?auto_135507 ?auto_135513 ) ) ( not ( = ?auto_135507 ?auto_135510 ) ) ( not ( = ?auto_135508 ?auto_135513 ) ) ( not ( = ?auto_135508 ?auto_135510 ) ) ( not ( = ?auto_135509 ?auto_135513 ) ) ( not ( = ?auto_135509 ?auto_135510 ) ) ( not ( = ?auto_135513 ?auto_135510 ) ) ( not ( = ?auto_135511 ?auto_135512 ) ) ( not ( = ?auto_135511 ?auto_135510 ) ) ( not ( = ?auto_135512 ?auto_135510 ) ) ( not ( = ?auto_135506 ?auto_135512 ) ) ( not ( = ?auto_135506 ?auto_135511 ) ) ( not ( = ?auto_135507 ?auto_135512 ) ) ( not ( = ?auto_135507 ?auto_135511 ) ) ( not ( = ?auto_135508 ?auto_135512 ) ) ( not ( = ?auto_135508 ?auto_135511 ) ) ( not ( = ?auto_135509 ?auto_135512 ) ) ( not ( = ?auto_135509 ?auto_135511 ) ) ( not ( = ?auto_135513 ?auto_135512 ) ) ( not ( = ?auto_135513 ?auto_135511 ) ) ( ON ?auto_135511 ?auto_135514 ) ( not ( = ?auto_135506 ?auto_135514 ) ) ( not ( = ?auto_135507 ?auto_135514 ) ) ( not ( = ?auto_135508 ?auto_135514 ) ) ( not ( = ?auto_135509 ?auto_135514 ) ) ( not ( = ?auto_135513 ?auto_135514 ) ) ( not ( = ?auto_135510 ?auto_135514 ) ) ( not ( = ?auto_135511 ?auto_135514 ) ) ( not ( = ?auto_135512 ?auto_135514 ) ) ( ON ?auto_135512 ?auto_135511 ) ( ON-TABLE ?auto_135514 ) ( ON ?auto_135510 ?auto_135512 ) ( CLEAR ?auto_135509 ) ( ON ?auto_135513 ?auto_135510 ) ( CLEAR ?auto_135513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135514 ?auto_135511 ?auto_135512 ?auto_135510 )
      ( MAKE-3PILE ?auto_135506 ?auto_135507 ?auto_135508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135533 - BLOCK
      ?auto_135534 - BLOCK
      ?auto_135535 - BLOCK
    )
    :vars
    (
      ?auto_135540 - BLOCK
      ?auto_135537 - BLOCK
      ?auto_135539 - BLOCK
      ?auto_135536 - BLOCK
      ?auto_135538 - BLOCK
      ?auto_135541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135533 ) ( ON ?auto_135534 ?auto_135533 ) ( not ( = ?auto_135533 ?auto_135534 ) ) ( not ( = ?auto_135533 ?auto_135535 ) ) ( not ( = ?auto_135533 ?auto_135540 ) ) ( not ( = ?auto_135534 ?auto_135535 ) ) ( not ( = ?auto_135534 ?auto_135540 ) ) ( not ( = ?auto_135535 ?auto_135540 ) ) ( not ( = ?auto_135533 ?auto_135537 ) ) ( not ( = ?auto_135533 ?auto_135539 ) ) ( not ( = ?auto_135534 ?auto_135537 ) ) ( not ( = ?auto_135534 ?auto_135539 ) ) ( not ( = ?auto_135535 ?auto_135537 ) ) ( not ( = ?auto_135535 ?auto_135539 ) ) ( not ( = ?auto_135540 ?auto_135537 ) ) ( not ( = ?auto_135540 ?auto_135539 ) ) ( not ( = ?auto_135537 ?auto_135539 ) ) ( not ( = ?auto_135536 ?auto_135538 ) ) ( not ( = ?auto_135536 ?auto_135539 ) ) ( not ( = ?auto_135538 ?auto_135539 ) ) ( not ( = ?auto_135533 ?auto_135538 ) ) ( not ( = ?auto_135533 ?auto_135536 ) ) ( not ( = ?auto_135534 ?auto_135538 ) ) ( not ( = ?auto_135534 ?auto_135536 ) ) ( not ( = ?auto_135535 ?auto_135538 ) ) ( not ( = ?auto_135535 ?auto_135536 ) ) ( not ( = ?auto_135540 ?auto_135538 ) ) ( not ( = ?auto_135540 ?auto_135536 ) ) ( not ( = ?auto_135537 ?auto_135538 ) ) ( not ( = ?auto_135537 ?auto_135536 ) ) ( ON ?auto_135536 ?auto_135541 ) ( not ( = ?auto_135533 ?auto_135541 ) ) ( not ( = ?auto_135534 ?auto_135541 ) ) ( not ( = ?auto_135535 ?auto_135541 ) ) ( not ( = ?auto_135540 ?auto_135541 ) ) ( not ( = ?auto_135537 ?auto_135541 ) ) ( not ( = ?auto_135539 ?auto_135541 ) ) ( not ( = ?auto_135536 ?auto_135541 ) ) ( not ( = ?auto_135538 ?auto_135541 ) ) ( ON ?auto_135538 ?auto_135536 ) ( ON-TABLE ?auto_135541 ) ( ON ?auto_135539 ?auto_135538 ) ( ON ?auto_135537 ?auto_135539 ) ( ON ?auto_135540 ?auto_135537 ) ( CLEAR ?auto_135540 ) ( HOLDING ?auto_135535 ) ( CLEAR ?auto_135534 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135533 ?auto_135534 ?auto_135535 ?auto_135540 )
      ( MAKE-3PILE ?auto_135533 ?auto_135534 ?auto_135535 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135542 - BLOCK
      ?auto_135543 - BLOCK
      ?auto_135544 - BLOCK
    )
    :vars
    (
      ?auto_135546 - BLOCK
      ?auto_135550 - BLOCK
      ?auto_135547 - BLOCK
      ?auto_135549 - BLOCK
      ?auto_135545 - BLOCK
      ?auto_135548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135542 ) ( ON ?auto_135543 ?auto_135542 ) ( not ( = ?auto_135542 ?auto_135543 ) ) ( not ( = ?auto_135542 ?auto_135544 ) ) ( not ( = ?auto_135542 ?auto_135546 ) ) ( not ( = ?auto_135543 ?auto_135544 ) ) ( not ( = ?auto_135543 ?auto_135546 ) ) ( not ( = ?auto_135544 ?auto_135546 ) ) ( not ( = ?auto_135542 ?auto_135550 ) ) ( not ( = ?auto_135542 ?auto_135547 ) ) ( not ( = ?auto_135543 ?auto_135550 ) ) ( not ( = ?auto_135543 ?auto_135547 ) ) ( not ( = ?auto_135544 ?auto_135550 ) ) ( not ( = ?auto_135544 ?auto_135547 ) ) ( not ( = ?auto_135546 ?auto_135550 ) ) ( not ( = ?auto_135546 ?auto_135547 ) ) ( not ( = ?auto_135550 ?auto_135547 ) ) ( not ( = ?auto_135549 ?auto_135545 ) ) ( not ( = ?auto_135549 ?auto_135547 ) ) ( not ( = ?auto_135545 ?auto_135547 ) ) ( not ( = ?auto_135542 ?auto_135545 ) ) ( not ( = ?auto_135542 ?auto_135549 ) ) ( not ( = ?auto_135543 ?auto_135545 ) ) ( not ( = ?auto_135543 ?auto_135549 ) ) ( not ( = ?auto_135544 ?auto_135545 ) ) ( not ( = ?auto_135544 ?auto_135549 ) ) ( not ( = ?auto_135546 ?auto_135545 ) ) ( not ( = ?auto_135546 ?auto_135549 ) ) ( not ( = ?auto_135550 ?auto_135545 ) ) ( not ( = ?auto_135550 ?auto_135549 ) ) ( ON ?auto_135549 ?auto_135548 ) ( not ( = ?auto_135542 ?auto_135548 ) ) ( not ( = ?auto_135543 ?auto_135548 ) ) ( not ( = ?auto_135544 ?auto_135548 ) ) ( not ( = ?auto_135546 ?auto_135548 ) ) ( not ( = ?auto_135550 ?auto_135548 ) ) ( not ( = ?auto_135547 ?auto_135548 ) ) ( not ( = ?auto_135549 ?auto_135548 ) ) ( not ( = ?auto_135545 ?auto_135548 ) ) ( ON ?auto_135545 ?auto_135549 ) ( ON-TABLE ?auto_135548 ) ( ON ?auto_135547 ?auto_135545 ) ( ON ?auto_135550 ?auto_135547 ) ( ON ?auto_135546 ?auto_135550 ) ( CLEAR ?auto_135543 ) ( ON ?auto_135544 ?auto_135546 ) ( CLEAR ?auto_135544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135548 ?auto_135549 ?auto_135545 ?auto_135547 ?auto_135550 ?auto_135546 )
      ( MAKE-3PILE ?auto_135542 ?auto_135543 ?auto_135544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135551 - BLOCK
      ?auto_135552 - BLOCK
      ?auto_135553 - BLOCK
    )
    :vars
    (
      ?auto_135559 - BLOCK
      ?auto_135558 - BLOCK
      ?auto_135555 - BLOCK
      ?auto_135557 - BLOCK
      ?auto_135556 - BLOCK
      ?auto_135554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135551 ) ( not ( = ?auto_135551 ?auto_135552 ) ) ( not ( = ?auto_135551 ?auto_135553 ) ) ( not ( = ?auto_135551 ?auto_135559 ) ) ( not ( = ?auto_135552 ?auto_135553 ) ) ( not ( = ?auto_135552 ?auto_135559 ) ) ( not ( = ?auto_135553 ?auto_135559 ) ) ( not ( = ?auto_135551 ?auto_135558 ) ) ( not ( = ?auto_135551 ?auto_135555 ) ) ( not ( = ?auto_135552 ?auto_135558 ) ) ( not ( = ?auto_135552 ?auto_135555 ) ) ( not ( = ?auto_135553 ?auto_135558 ) ) ( not ( = ?auto_135553 ?auto_135555 ) ) ( not ( = ?auto_135559 ?auto_135558 ) ) ( not ( = ?auto_135559 ?auto_135555 ) ) ( not ( = ?auto_135558 ?auto_135555 ) ) ( not ( = ?auto_135557 ?auto_135556 ) ) ( not ( = ?auto_135557 ?auto_135555 ) ) ( not ( = ?auto_135556 ?auto_135555 ) ) ( not ( = ?auto_135551 ?auto_135556 ) ) ( not ( = ?auto_135551 ?auto_135557 ) ) ( not ( = ?auto_135552 ?auto_135556 ) ) ( not ( = ?auto_135552 ?auto_135557 ) ) ( not ( = ?auto_135553 ?auto_135556 ) ) ( not ( = ?auto_135553 ?auto_135557 ) ) ( not ( = ?auto_135559 ?auto_135556 ) ) ( not ( = ?auto_135559 ?auto_135557 ) ) ( not ( = ?auto_135558 ?auto_135556 ) ) ( not ( = ?auto_135558 ?auto_135557 ) ) ( ON ?auto_135557 ?auto_135554 ) ( not ( = ?auto_135551 ?auto_135554 ) ) ( not ( = ?auto_135552 ?auto_135554 ) ) ( not ( = ?auto_135553 ?auto_135554 ) ) ( not ( = ?auto_135559 ?auto_135554 ) ) ( not ( = ?auto_135558 ?auto_135554 ) ) ( not ( = ?auto_135555 ?auto_135554 ) ) ( not ( = ?auto_135557 ?auto_135554 ) ) ( not ( = ?auto_135556 ?auto_135554 ) ) ( ON ?auto_135556 ?auto_135557 ) ( ON-TABLE ?auto_135554 ) ( ON ?auto_135555 ?auto_135556 ) ( ON ?auto_135558 ?auto_135555 ) ( ON ?auto_135559 ?auto_135558 ) ( ON ?auto_135553 ?auto_135559 ) ( CLEAR ?auto_135553 ) ( HOLDING ?auto_135552 ) ( CLEAR ?auto_135551 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135551 ?auto_135552 )
      ( MAKE-3PILE ?auto_135551 ?auto_135552 ?auto_135553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135560 - BLOCK
      ?auto_135561 - BLOCK
      ?auto_135562 - BLOCK
    )
    :vars
    (
      ?auto_135568 - BLOCK
      ?auto_135567 - BLOCK
      ?auto_135563 - BLOCK
      ?auto_135565 - BLOCK
      ?auto_135564 - BLOCK
      ?auto_135566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135560 ) ( not ( = ?auto_135560 ?auto_135561 ) ) ( not ( = ?auto_135560 ?auto_135562 ) ) ( not ( = ?auto_135560 ?auto_135568 ) ) ( not ( = ?auto_135561 ?auto_135562 ) ) ( not ( = ?auto_135561 ?auto_135568 ) ) ( not ( = ?auto_135562 ?auto_135568 ) ) ( not ( = ?auto_135560 ?auto_135567 ) ) ( not ( = ?auto_135560 ?auto_135563 ) ) ( not ( = ?auto_135561 ?auto_135567 ) ) ( not ( = ?auto_135561 ?auto_135563 ) ) ( not ( = ?auto_135562 ?auto_135567 ) ) ( not ( = ?auto_135562 ?auto_135563 ) ) ( not ( = ?auto_135568 ?auto_135567 ) ) ( not ( = ?auto_135568 ?auto_135563 ) ) ( not ( = ?auto_135567 ?auto_135563 ) ) ( not ( = ?auto_135565 ?auto_135564 ) ) ( not ( = ?auto_135565 ?auto_135563 ) ) ( not ( = ?auto_135564 ?auto_135563 ) ) ( not ( = ?auto_135560 ?auto_135564 ) ) ( not ( = ?auto_135560 ?auto_135565 ) ) ( not ( = ?auto_135561 ?auto_135564 ) ) ( not ( = ?auto_135561 ?auto_135565 ) ) ( not ( = ?auto_135562 ?auto_135564 ) ) ( not ( = ?auto_135562 ?auto_135565 ) ) ( not ( = ?auto_135568 ?auto_135564 ) ) ( not ( = ?auto_135568 ?auto_135565 ) ) ( not ( = ?auto_135567 ?auto_135564 ) ) ( not ( = ?auto_135567 ?auto_135565 ) ) ( ON ?auto_135565 ?auto_135566 ) ( not ( = ?auto_135560 ?auto_135566 ) ) ( not ( = ?auto_135561 ?auto_135566 ) ) ( not ( = ?auto_135562 ?auto_135566 ) ) ( not ( = ?auto_135568 ?auto_135566 ) ) ( not ( = ?auto_135567 ?auto_135566 ) ) ( not ( = ?auto_135563 ?auto_135566 ) ) ( not ( = ?auto_135565 ?auto_135566 ) ) ( not ( = ?auto_135564 ?auto_135566 ) ) ( ON ?auto_135564 ?auto_135565 ) ( ON-TABLE ?auto_135566 ) ( ON ?auto_135563 ?auto_135564 ) ( ON ?auto_135567 ?auto_135563 ) ( ON ?auto_135568 ?auto_135567 ) ( ON ?auto_135562 ?auto_135568 ) ( CLEAR ?auto_135560 ) ( ON ?auto_135561 ?auto_135562 ) ( CLEAR ?auto_135561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135566 ?auto_135565 ?auto_135564 ?auto_135563 ?auto_135567 ?auto_135568 ?auto_135562 )
      ( MAKE-3PILE ?auto_135560 ?auto_135561 ?auto_135562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135569 - BLOCK
      ?auto_135570 - BLOCK
      ?auto_135571 - BLOCK
    )
    :vars
    (
      ?auto_135573 - BLOCK
      ?auto_135575 - BLOCK
      ?auto_135574 - BLOCK
      ?auto_135576 - BLOCK
      ?auto_135577 - BLOCK
      ?auto_135572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135569 ?auto_135570 ) ) ( not ( = ?auto_135569 ?auto_135571 ) ) ( not ( = ?auto_135569 ?auto_135573 ) ) ( not ( = ?auto_135570 ?auto_135571 ) ) ( not ( = ?auto_135570 ?auto_135573 ) ) ( not ( = ?auto_135571 ?auto_135573 ) ) ( not ( = ?auto_135569 ?auto_135575 ) ) ( not ( = ?auto_135569 ?auto_135574 ) ) ( not ( = ?auto_135570 ?auto_135575 ) ) ( not ( = ?auto_135570 ?auto_135574 ) ) ( not ( = ?auto_135571 ?auto_135575 ) ) ( not ( = ?auto_135571 ?auto_135574 ) ) ( not ( = ?auto_135573 ?auto_135575 ) ) ( not ( = ?auto_135573 ?auto_135574 ) ) ( not ( = ?auto_135575 ?auto_135574 ) ) ( not ( = ?auto_135576 ?auto_135577 ) ) ( not ( = ?auto_135576 ?auto_135574 ) ) ( not ( = ?auto_135577 ?auto_135574 ) ) ( not ( = ?auto_135569 ?auto_135577 ) ) ( not ( = ?auto_135569 ?auto_135576 ) ) ( not ( = ?auto_135570 ?auto_135577 ) ) ( not ( = ?auto_135570 ?auto_135576 ) ) ( not ( = ?auto_135571 ?auto_135577 ) ) ( not ( = ?auto_135571 ?auto_135576 ) ) ( not ( = ?auto_135573 ?auto_135577 ) ) ( not ( = ?auto_135573 ?auto_135576 ) ) ( not ( = ?auto_135575 ?auto_135577 ) ) ( not ( = ?auto_135575 ?auto_135576 ) ) ( ON ?auto_135576 ?auto_135572 ) ( not ( = ?auto_135569 ?auto_135572 ) ) ( not ( = ?auto_135570 ?auto_135572 ) ) ( not ( = ?auto_135571 ?auto_135572 ) ) ( not ( = ?auto_135573 ?auto_135572 ) ) ( not ( = ?auto_135575 ?auto_135572 ) ) ( not ( = ?auto_135574 ?auto_135572 ) ) ( not ( = ?auto_135576 ?auto_135572 ) ) ( not ( = ?auto_135577 ?auto_135572 ) ) ( ON ?auto_135577 ?auto_135576 ) ( ON-TABLE ?auto_135572 ) ( ON ?auto_135574 ?auto_135577 ) ( ON ?auto_135575 ?auto_135574 ) ( ON ?auto_135573 ?auto_135575 ) ( ON ?auto_135571 ?auto_135573 ) ( ON ?auto_135570 ?auto_135571 ) ( CLEAR ?auto_135570 ) ( HOLDING ?auto_135569 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135569 )
      ( MAKE-3PILE ?auto_135569 ?auto_135570 ?auto_135571 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_135578 - BLOCK
      ?auto_135579 - BLOCK
      ?auto_135580 - BLOCK
    )
    :vars
    (
      ?auto_135582 - BLOCK
      ?auto_135585 - BLOCK
      ?auto_135584 - BLOCK
      ?auto_135586 - BLOCK
      ?auto_135583 - BLOCK
      ?auto_135581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135578 ?auto_135579 ) ) ( not ( = ?auto_135578 ?auto_135580 ) ) ( not ( = ?auto_135578 ?auto_135582 ) ) ( not ( = ?auto_135579 ?auto_135580 ) ) ( not ( = ?auto_135579 ?auto_135582 ) ) ( not ( = ?auto_135580 ?auto_135582 ) ) ( not ( = ?auto_135578 ?auto_135585 ) ) ( not ( = ?auto_135578 ?auto_135584 ) ) ( not ( = ?auto_135579 ?auto_135585 ) ) ( not ( = ?auto_135579 ?auto_135584 ) ) ( not ( = ?auto_135580 ?auto_135585 ) ) ( not ( = ?auto_135580 ?auto_135584 ) ) ( not ( = ?auto_135582 ?auto_135585 ) ) ( not ( = ?auto_135582 ?auto_135584 ) ) ( not ( = ?auto_135585 ?auto_135584 ) ) ( not ( = ?auto_135586 ?auto_135583 ) ) ( not ( = ?auto_135586 ?auto_135584 ) ) ( not ( = ?auto_135583 ?auto_135584 ) ) ( not ( = ?auto_135578 ?auto_135583 ) ) ( not ( = ?auto_135578 ?auto_135586 ) ) ( not ( = ?auto_135579 ?auto_135583 ) ) ( not ( = ?auto_135579 ?auto_135586 ) ) ( not ( = ?auto_135580 ?auto_135583 ) ) ( not ( = ?auto_135580 ?auto_135586 ) ) ( not ( = ?auto_135582 ?auto_135583 ) ) ( not ( = ?auto_135582 ?auto_135586 ) ) ( not ( = ?auto_135585 ?auto_135583 ) ) ( not ( = ?auto_135585 ?auto_135586 ) ) ( ON ?auto_135586 ?auto_135581 ) ( not ( = ?auto_135578 ?auto_135581 ) ) ( not ( = ?auto_135579 ?auto_135581 ) ) ( not ( = ?auto_135580 ?auto_135581 ) ) ( not ( = ?auto_135582 ?auto_135581 ) ) ( not ( = ?auto_135585 ?auto_135581 ) ) ( not ( = ?auto_135584 ?auto_135581 ) ) ( not ( = ?auto_135586 ?auto_135581 ) ) ( not ( = ?auto_135583 ?auto_135581 ) ) ( ON ?auto_135583 ?auto_135586 ) ( ON-TABLE ?auto_135581 ) ( ON ?auto_135584 ?auto_135583 ) ( ON ?auto_135585 ?auto_135584 ) ( ON ?auto_135582 ?auto_135585 ) ( ON ?auto_135580 ?auto_135582 ) ( ON ?auto_135579 ?auto_135580 ) ( ON ?auto_135578 ?auto_135579 ) ( CLEAR ?auto_135578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135581 ?auto_135586 ?auto_135583 ?auto_135584 ?auto_135585 ?auto_135582 ?auto_135580 ?auto_135579 )
      ( MAKE-3PILE ?auto_135578 ?auto_135579 ?auto_135580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135592 - BLOCK
      ?auto_135593 - BLOCK
      ?auto_135594 - BLOCK
      ?auto_135595 - BLOCK
      ?auto_135596 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_135596 ) ( CLEAR ?auto_135595 ) ( ON-TABLE ?auto_135592 ) ( ON ?auto_135593 ?auto_135592 ) ( ON ?auto_135594 ?auto_135593 ) ( ON ?auto_135595 ?auto_135594 ) ( not ( = ?auto_135592 ?auto_135593 ) ) ( not ( = ?auto_135592 ?auto_135594 ) ) ( not ( = ?auto_135592 ?auto_135595 ) ) ( not ( = ?auto_135592 ?auto_135596 ) ) ( not ( = ?auto_135593 ?auto_135594 ) ) ( not ( = ?auto_135593 ?auto_135595 ) ) ( not ( = ?auto_135593 ?auto_135596 ) ) ( not ( = ?auto_135594 ?auto_135595 ) ) ( not ( = ?auto_135594 ?auto_135596 ) ) ( not ( = ?auto_135595 ?auto_135596 ) ) )
    :subtasks
    ( ( !STACK ?auto_135596 ?auto_135595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135597 - BLOCK
      ?auto_135598 - BLOCK
      ?auto_135599 - BLOCK
      ?auto_135600 - BLOCK
      ?auto_135601 - BLOCK
    )
    :vars
    (
      ?auto_135602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135600 ) ( ON-TABLE ?auto_135597 ) ( ON ?auto_135598 ?auto_135597 ) ( ON ?auto_135599 ?auto_135598 ) ( ON ?auto_135600 ?auto_135599 ) ( not ( = ?auto_135597 ?auto_135598 ) ) ( not ( = ?auto_135597 ?auto_135599 ) ) ( not ( = ?auto_135597 ?auto_135600 ) ) ( not ( = ?auto_135597 ?auto_135601 ) ) ( not ( = ?auto_135598 ?auto_135599 ) ) ( not ( = ?auto_135598 ?auto_135600 ) ) ( not ( = ?auto_135598 ?auto_135601 ) ) ( not ( = ?auto_135599 ?auto_135600 ) ) ( not ( = ?auto_135599 ?auto_135601 ) ) ( not ( = ?auto_135600 ?auto_135601 ) ) ( ON ?auto_135601 ?auto_135602 ) ( CLEAR ?auto_135601 ) ( HAND-EMPTY ) ( not ( = ?auto_135597 ?auto_135602 ) ) ( not ( = ?auto_135598 ?auto_135602 ) ) ( not ( = ?auto_135599 ?auto_135602 ) ) ( not ( = ?auto_135600 ?auto_135602 ) ) ( not ( = ?auto_135601 ?auto_135602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135601 ?auto_135602 )
      ( MAKE-5PILE ?auto_135597 ?auto_135598 ?auto_135599 ?auto_135600 ?auto_135601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135603 - BLOCK
      ?auto_135604 - BLOCK
      ?auto_135605 - BLOCK
      ?auto_135606 - BLOCK
      ?auto_135607 - BLOCK
    )
    :vars
    (
      ?auto_135608 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135603 ) ( ON ?auto_135604 ?auto_135603 ) ( ON ?auto_135605 ?auto_135604 ) ( not ( = ?auto_135603 ?auto_135604 ) ) ( not ( = ?auto_135603 ?auto_135605 ) ) ( not ( = ?auto_135603 ?auto_135606 ) ) ( not ( = ?auto_135603 ?auto_135607 ) ) ( not ( = ?auto_135604 ?auto_135605 ) ) ( not ( = ?auto_135604 ?auto_135606 ) ) ( not ( = ?auto_135604 ?auto_135607 ) ) ( not ( = ?auto_135605 ?auto_135606 ) ) ( not ( = ?auto_135605 ?auto_135607 ) ) ( not ( = ?auto_135606 ?auto_135607 ) ) ( ON ?auto_135607 ?auto_135608 ) ( CLEAR ?auto_135607 ) ( not ( = ?auto_135603 ?auto_135608 ) ) ( not ( = ?auto_135604 ?auto_135608 ) ) ( not ( = ?auto_135605 ?auto_135608 ) ) ( not ( = ?auto_135606 ?auto_135608 ) ) ( not ( = ?auto_135607 ?auto_135608 ) ) ( HOLDING ?auto_135606 ) ( CLEAR ?auto_135605 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135603 ?auto_135604 ?auto_135605 ?auto_135606 )
      ( MAKE-5PILE ?auto_135603 ?auto_135604 ?auto_135605 ?auto_135606 ?auto_135607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135609 - BLOCK
      ?auto_135610 - BLOCK
      ?auto_135611 - BLOCK
      ?auto_135612 - BLOCK
      ?auto_135613 - BLOCK
    )
    :vars
    (
      ?auto_135614 - BLOCK
      ?auto_135616 - BLOCK
      ?auto_135615 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135609 ) ( ON ?auto_135610 ?auto_135609 ) ( ON ?auto_135611 ?auto_135610 ) ( not ( = ?auto_135609 ?auto_135610 ) ) ( not ( = ?auto_135609 ?auto_135611 ) ) ( not ( = ?auto_135609 ?auto_135612 ) ) ( not ( = ?auto_135609 ?auto_135613 ) ) ( not ( = ?auto_135610 ?auto_135611 ) ) ( not ( = ?auto_135610 ?auto_135612 ) ) ( not ( = ?auto_135610 ?auto_135613 ) ) ( not ( = ?auto_135611 ?auto_135612 ) ) ( not ( = ?auto_135611 ?auto_135613 ) ) ( not ( = ?auto_135612 ?auto_135613 ) ) ( ON ?auto_135613 ?auto_135614 ) ( not ( = ?auto_135609 ?auto_135614 ) ) ( not ( = ?auto_135610 ?auto_135614 ) ) ( not ( = ?auto_135611 ?auto_135614 ) ) ( not ( = ?auto_135612 ?auto_135614 ) ) ( not ( = ?auto_135613 ?auto_135614 ) ) ( CLEAR ?auto_135611 ) ( ON ?auto_135612 ?auto_135613 ) ( CLEAR ?auto_135612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135616 ) ( ON ?auto_135615 ?auto_135616 ) ( ON ?auto_135614 ?auto_135615 ) ( not ( = ?auto_135616 ?auto_135615 ) ) ( not ( = ?auto_135616 ?auto_135614 ) ) ( not ( = ?auto_135616 ?auto_135613 ) ) ( not ( = ?auto_135616 ?auto_135612 ) ) ( not ( = ?auto_135615 ?auto_135614 ) ) ( not ( = ?auto_135615 ?auto_135613 ) ) ( not ( = ?auto_135615 ?auto_135612 ) ) ( not ( = ?auto_135609 ?auto_135616 ) ) ( not ( = ?auto_135609 ?auto_135615 ) ) ( not ( = ?auto_135610 ?auto_135616 ) ) ( not ( = ?auto_135610 ?auto_135615 ) ) ( not ( = ?auto_135611 ?auto_135616 ) ) ( not ( = ?auto_135611 ?auto_135615 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135616 ?auto_135615 ?auto_135614 ?auto_135613 )
      ( MAKE-5PILE ?auto_135609 ?auto_135610 ?auto_135611 ?auto_135612 ?auto_135613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135617 - BLOCK
      ?auto_135618 - BLOCK
      ?auto_135619 - BLOCK
      ?auto_135620 - BLOCK
      ?auto_135621 - BLOCK
    )
    :vars
    (
      ?auto_135624 - BLOCK
      ?auto_135622 - BLOCK
      ?auto_135623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135617 ) ( ON ?auto_135618 ?auto_135617 ) ( not ( = ?auto_135617 ?auto_135618 ) ) ( not ( = ?auto_135617 ?auto_135619 ) ) ( not ( = ?auto_135617 ?auto_135620 ) ) ( not ( = ?auto_135617 ?auto_135621 ) ) ( not ( = ?auto_135618 ?auto_135619 ) ) ( not ( = ?auto_135618 ?auto_135620 ) ) ( not ( = ?auto_135618 ?auto_135621 ) ) ( not ( = ?auto_135619 ?auto_135620 ) ) ( not ( = ?auto_135619 ?auto_135621 ) ) ( not ( = ?auto_135620 ?auto_135621 ) ) ( ON ?auto_135621 ?auto_135624 ) ( not ( = ?auto_135617 ?auto_135624 ) ) ( not ( = ?auto_135618 ?auto_135624 ) ) ( not ( = ?auto_135619 ?auto_135624 ) ) ( not ( = ?auto_135620 ?auto_135624 ) ) ( not ( = ?auto_135621 ?auto_135624 ) ) ( ON ?auto_135620 ?auto_135621 ) ( CLEAR ?auto_135620 ) ( ON-TABLE ?auto_135622 ) ( ON ?auto_135623 ?auto_135622 ) ( ON ?auto_135624 ?auto_135623 ) ( not ( = ?auto_135622 ?auto_135623 ) ) ( not ( = ?auto_135622 ?auto_135624 ) ) ( not ( = ?auto_135622 ?auto_135621 ) ) ( not ( = ?auto_135622 ?auto_135620 ) ) ( not ( = ?auto_135623 ?auto_135624 ) ) ( not ( = ?auto_135623 ?auto_135621 ) ) ( not ( = ?auto_135623 ?auto_135620 ) ) ( not ( = ?auto_135617 ?auto_135622 ) ) ( not ( = ?auto_135617 ?auto_135623 ) ) ( not ( = ?auto_135618 ?auto_135622 ) ) ( not ( = ?auto_135618 ?auto_135623 ) ) ( not ( = ?auto_135619 ?auto_135622 ) ) ( not ( = ?auto_135619 ?auto_135623 ) ) ( HOLDING ?auto_135619 ) ( CLEAR ?auto_135618 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135617 ?auto_135618 ?auto_135619 )
      ( MAKE-5PILE ?auto_135617 ?auto_135618 ?auto_135619 ?auto_135620 ?auto_135621 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135625 - BLOCK
      ?auto_135626 - BLOCK
      ?auto_135627 - BLOCK
      ?auto_135628 - BLOCK
      ?auto_135629 - BLOCK
    )
    :vars
    (
      ?auto_135631 - BLOCK
      ?auto_135630 - BLOCK
      ?auto_135632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135625 ) ( ON ?auto_135626 ?auto_135625 ) ( not ( = ?auto_135625 ?auto_135626 ) ) ( not ( = ?auto_135625 ?auto_135627 ) ) ( not ( = ?auto_135625 ?auto_135628 ) ) ( not ( = ?auto_135625 ?auto_135629 ) ) ( not ( = ?auto_135626 ?auto_135627 ) ) ( not ( = ?auto_135626 ?auto_135628 ) ) ( not ( = ?auto_135626 ?auto_135629 ) ) ( not ( = ?auto_135627 ?auto_135628 ) ) ( not ( = ?auto_135627 ?auto_135629 ) ) ( not ( = ?auto_135628 ?auto_135629 ) ) ( ON ?auto_135629 ?auto_135631 ) ( not ( = ?auto_135625 ?auto_135631 ) ) ( not ( = ?auto_135626 ?auto_135631 ) ) ( not ( = ?auto_135627 ?auto_135631 ) ) ( not ( = ?auto_135628 ?auto_135631 ) ) ( not ( = ?auto_135629 ?auto_135631 ) ) ( ON ?auto_135628 ?auto_135629 ) ( ON-TABLE ?auto_135630 ) ( ON ?auto_135632 ?auto_135630 ) ( ON ?auto_135631 ?auto_135632 ) ( not ( = ?auto_135630 ?auto_135632 ) ) ( not ( = ?auto_135630 ?auto_135631 ) ) ( not ( = ?auto_135630 ?auto_135629 ) ) ( not ( = ?auto_135630 ?auto_135628 ) ) ( not ( = ?auto_135632 ?auto_135631 ) ) ( not ( = ?auto_135632 ?auto_135629 ) ) ( not ( = ?auto_135632 ?auto_135628 ) ) ( not ( = ?auto_135625 ?auto_135630 ) ) ( not ( = ?auto_135625 ?auto_135632 ) ) ( not ( = ?auto_135626 ?auto_135630 ) ) ( not ( = ?auto_135626 ?auto_135632 ) ) ( not ( = ?auto_135627 ?auto_135630 ) ) ( not ( = ?auto_135627 ?auto_135632 ) ) ( CLEAR ?auto_135626 ) ( ON ?auto_135627 ?auto_135628 ) ( CLEAR ?auto_135627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135630 ?auto_135632 ?auto_135631 ?auto_135629 ?auto_135628 )
      ( MAKE-5PILE ?auto_135625 ?auto_135626 ?auto_135627 ?auto_135628 ?auto_135629 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135633 - BLOCK
      ?auto_135634 - BLOCK
      ?auto_135635 - BLOCK
      ?auto_135636 - BLOCK
      ?auto_135637 - BLOCK
    )
    :vars
    (
      ?auto_135640 - BLOCK
      ?auto_135639 - BLOCK
      ?auto_135638 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135633 ) ( not ( = ?auto_135633 ?auto_135634 ) ) ( not ( = ?auto_135633 ?auto_135635 ) ) ( not ( = ?auto_135633 ?auto_135636 ) ) ( not ( = ?auto_135633 ?auto_135637 ) ) ( not ( = ?auto_135634 ?auto_135635 ) ) ( not ( = ?auto_135634 ?auto_135636 ) ) ( not ( = ?auto_135634 ?auto_135637 ) ) ( not ( = ?auto_135635 ?auto_135636 ) ) ( not ( = ?auto_135635 ?auto_135637 ) ) ( not ( = ?auto_135636 ?auto_135637 ) ) ( ON ?auto_135637 ?auto_135640 ) ( not ( = ?auto_135633 ?auto_135640 ) ) ( not ( = ?auto_135634 ?auto_135640 ) ) ( not ( = ?auto_135635 ?auto_135640 ) ) ( not ( = ?auto_135636 ?auto_135640 ) ) ( not ( = ?auto_135637 ?auto_135640 ) ) ( ON ?auto_135636 ?auto_135637 ) ( ON-TABLE ?auto_135639 ) ( ON ?auto_135638 ?auto_135639 ) ( ON ?auto_135640 ?auto_135638 ) ( not ( = ?auto_135639 ?auto_135638 ) ) ( not ( = ?auto_135639 ?auto_135640 ) ) ( not ( = ?auto_135639 ?auto_135637 ) ) ( not ( = ?auto_135639 ?auto_135636 ) ) ( not ( = ?auto_135638 ?auto_135640 ) ) ( not ( = ?auto_135638 ?auto_135637 ) ) ( not ( = ?auto_135638 ?auto_135636 ) ) ( not ( = ?auto_135633 ?auto_135639 ) ) ( not ( = ?auto_135633 ?auto_135638 ) ) ( not ( = ?auto_135634 ?auto_135639 ) ) ( not ( = ?auto_135634 ?auto_135638 ) ) ( not ( = ?auto_135635 ?auto_135639 ) ) ( not ( = ?auto_135635 ?auto_135638 ) ) ( ON ?auto_135635 ?auto_135636 ) ( CLEAR ?auto_135635 ) ( HOLDING ?auto_135634 ) ( CLEAR ?auto_135633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135633 ?auto_135634 )
      ( MAKE-5PILE ?auto_135633 ?auto_135634 ?auto_135635 ?auto_135636 ?auto_135637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135641 - BLOCK
      ?auto_135642 - BLOCK
      ?auto_135643 - BLOCK
      ?auto_135644 - BLOCK
      ?auto_135645 - BLOCK
    )
    :vars
    (
      ?auto_135647 - BLOCK
      ?auto_135648 - BLOCK
      ?auto_135646 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135641 ) ( not ( = ?auto_135641 ?auto_135642 ) ) ( not ( = ?auto_135641 ?auto_135643 ) ) ( not ( = ?auto_135641 ?auto_135644 ) ) ( not ( = ?auto_135641 ?auto_135645 ) ) ( not ( = ?auto_135642 ?auto_135643 ) ) ( not ( = ?auto_135642 ?auto_135644 ) ) ( not ( = ?auto_135642 ?auto_135645 ) ) ( not ( = ?auto_135643 ?auto_135644 ) ) ( not ( = ?auto_135643 ?auto_135645 ) ) ( not ( = ?auto_135644 ?auto_135645 ) ) ( ON ?auto_135645 ?auto_135647 ) ( not ( = ?auto_135641 ?auto_135647 ) ) ( not ( = ?auto_135642 ?auto_135647 ) ) ( not ( = ?auto_135643 ?auto_135647 ) ) ( not ( = ?auto_135644 ?auto_135647 ) ) ( not ( = ?auto_135645 ?auto_135647 ) ) ( ON ?auto_135644 ?auto_135645 ) ( ON-TABLE ?auto_135648 ) ( ON ?auto_135646 ?auto_135648 ) ( ON ?auto_135647 ?auto_135646 ) ( not ( = ?auto_135648 ?auto_135646 ) ) ( not ( = ?auto_135648 ?auto_135647 ) ) ( not ( = ?auto_135648 ?auto_135645 ) ) ( not ( = ?auto_135648 ?auto_135644 ) ) ( not ( = ?auto_135646 ?auto_135647 ) ) ( not ( = ?auto_135646 ?auto_135645 ) ) ( not ( = ?auto_135646 ?auto_135644 ) ) ( not ( = ?auto_135641 ?auto_135648 ) ) ( not ( = ?auto_135641 ?auto_135646 ) ) ( not ( = ?auto_135642 ?auto_135648 ) ) ( not ( = ?auto_135642 ?auto_135646 ) ) ( not ( = ?auto_135643 ?auto_135648 ) ) ( not ( = ?auto_135643 ?auto_135646 ) ) ( ON ?auto_135643 ?auto_135644 ) ( CLEAR ?auto_135641 ) ( ON ?auto_135642 ?auto_135643 ) ( CLEAR ?auto_135642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135648 ?auto_135646 ?auto_135647 ?auto_135645 ?auto_135644 ?auto_135643 )
      ( MAKE-5PILE ?auto_135641 ?auto_135642 ?auto_135643 ?auto_135644 ?auto_135645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135649 - BLOCK
      ?auto_135650 - BLOCK
      ?auto_135651 - BLOCK
      ?auto_135652 - BLOCK
      ?auto_135653 - BLOCK
    )
    :vars
    (
      ?auto_135656 - BLOCK
      ?auto_135655 - BLOCK
      ?auto_135654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135649 ?auto_135650 ) ) ( not ( = ?auto_135649 ?auto_135651 ) ) ( not ( = ?auto_135649 ?auto_135652 ) ) ( not ( = ?auto_135649 ?auto_135653 ) ) ( not ( = ?auto_135650 ?auto_135651 ) ) ( not ( = ?auto_135650 ?auto_135652 ) ) ( not ( = ?auto_135650 ?auto_135653 ) ) ( not ( = ?auto_135651 ?auto_135652 ) ) ( not ( = ?auto_135651 ?auto_135653 ) ) ( not ( = ?auto_135652 ?auto_135653 ) ) ( ON ?auto_135653 ?auto_135656 ) ( not ( = ?auto_135649 ?auto_135656 ) ) ( not ( = ?auto_135650 ?auto_135656 ) ) ( not ( = ?auto_135651 ?auto_135656 ) ) ( not ( = ?auto_135652 ?auto_135656 ) ) ( not ( = ?auto_135653 ?auto_135656 ) ) ( ON ?auto_135652 ?auto_135653 ) ( ON-TABLE ?auto_135655 ) ( ON ?auto_135654 ?auto_135655 ) ( ON ?auto_135656 ?auto_135654 ) ( not ( = ?auto_135655 ?auto_135654 ) ) ( not ( = ?auto_135655 ?auto_135656 ) ) ( not ( = ?auto_135655 ?auto_135653 ) ) ( not ( = ?auto_135655 ?auto_135652 ) ) ( not ( = ?auto_135654 ?auto_135656 ) ) ( not ( = ?auto_135654 ?auto_135653 ) ) ( not ( = ?auto_135654 ?auto_135652 ) ) ( not ( = ?auto_135649 ?auto_135655 ) ) ( not ( = ?auto_135649 ?auto_135654 ) ) ( not ( = ?auto_135650 ?auto_135655 ) ) ( not ( = ?auto_135650 ?auto_135654 ) ) ( not ( = ?auto_135651 ?auto_135655 ) ) ( not ( = ?auto_135651 ?auto_135654 ) ) ( ON ?auto_135651 ?auto_135652 ) ( ON ?auto_135650 ?auto_135651 ) ( CLEAR ?auto_135650 ) ( HOLDING ?auto_135649 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135649 )
      ( MAKE-5PILE ?auto_135649 ?auto_135650 ?auto_135651 ?auto_135652 ?auto_135653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135657 - BLOCK
      ?auto_135658 - BLOCK
      ?auto_135659 - BLOCK
      ?auto_135660 - BLOCK
      ?auto_135661 - BLOCK
    )
    :vars
    (
      ?auto_135662 - BLOCK
      ?auto_135664 - BLOCK
      ?auto_135663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135657 ?auto_135658 ) ) ( not ( = ?auto_135657 ?auto_135659 ) ) ( not ( = ?auto_135657 ?auto_135660 ) ) ( not ( = ?auto_135657 ?auto_135661 ) ) ( not ( = ?auto_135658 ?auto_135659 ) ) ( not ( = ?auto_135658 ?auto_135660 ) ) ( not ( = ?auto_135658 ?auto_135661 ) ) ( not ( = ?auto_135659 ?auto_135660 ) ) ( not ( = ?auto_135659 ?auto_135661 ) ) ( not ( = ?auto_135660 ?auto_135661 ) ) ( ON ?auto_135661 ?auto_135662 ) ( not ( = ?auto_135657 ?auto_135662 ) ) ( not ( = ?auto_135658 ?auto_135662 ) ) ( not ( = ?auto_135659 ?auto_135662 ) ) ( not ( = ?auto_135660 ?auto_135662 ) ) ( not ( = ?auto_135661 ?auto_135662 ) ) ( ON ?auto_135660 ?auto_135661 ) ( ON-TABLE ?auto_135664 ) ( ON ?auto_135663 ?auto_135664 ) ( ON ?auto_135662 ?auto_135663 ) ( not ( = ?auto_135664 ?auto_135663 ) ) ( not ( = ?auto_135664 ?auto_135662 ) ) ( not ( = ?auto_135664 ?auto_135661 ) ) ( not ( = ?auto_135664 ?auto_135660 ) ) ( not ( = ?auto_135663 ?auto_135662 ) ) ( not ( = ?auto_135663 ?auto_135661 ) ) ( not ( = ?auto_135663 ?auto_135660 ) ) ( not ( = ?auto_135657 ?auto_135664 ) ) ( not ( = ?auto_135657 ?auto_135663 ) ) ( not ( = ?auto_135658 ?auto_135664 ) ) ( not ( = ?auto_135658 ?auto_135663 ) ) ( not ( = ?auto_135659 ?auto_135664 ) ) ( not ( = ?auto_135659 ?auto_135663 ) ) ( ON ?auto_135659 ?auto_135660 ) ( ON ?auto_135658 ?auto_135659 ) ( ON ?auto_135657 ?auto_135658 ) ( CLEAR ?auto_135657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135664 ?auto_135663 ?auto_135662 ?auto_135661 ?auto_135660 ?auto_135659 ?auto_135658 )
      ( MAKE-5PILE ?auto_135657 ?auto_135658 ?auto_135659 ?auto_135660 ?auto_135661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135665 - BLOCK
      ?auto_135666 - BLOCK
      ?auto_135667 - BLOCK
      ?auto_135668 - BLOCK
      ?auto_135669 - BLOCK
    )
    :vars
    (
      ?auto_135670 - BLOCK
      ?auto_135672 - BLOCK
      ?auto_135671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135665 ?auto_135666 ) ) ( not ( = ?auto_135665 ?auto_135667 ) ) ( not ( = ?auto_135665 ?auto_135668 ) ) ( not ( = ?auto_135665 ?auto_135669 ) ) ( not ( = ?auto_135666 ?auto_135667 ) ) ( not ( = ?auto_135666 ?auto_135668 ) ) ( not ( = ?auto_135666 ?auto_135669 ) ) ( not ( = ?auto_135667 ?auto_135668 ) ) ( not ( = ?auto_135667 ?auto_135669 ) ) ( not ( = ?auto_135668 ?auto_135669 ) ) ( ON ?auto_135669 ?auto_135670 ) ( not ( = ?auto_135665 ?auto_135670 ) ) ( not ( = ?auto_135666 ?auto_135670 ) ) ( not ( = ?auto_135667 ?auto_135670 ) ) ( not ( = ?auto_135668 ?auto_135670 ) ) ( not ( = ?auto_135669 ?auto_135670 ) ) ( ON ?auto_135668 ?auto_135669 ) ( ON-TABLE ?auto_135672 ) ( ON ?auto_135671 ?auto_135672 ) ( ON ?auto_135670 ?auto_135671 ) ( not ( = ?auto_135672 ?auto_135671 ) ) ( not ( = ?auto_135672 ?auto_135670 ) ) ( not ( = ?auto_135672 ?auto_135669 ) ) ( not ( = ?auto_135672 ?auto_135668 ) ) ( not ( = ?auto_135671 ?auto_135670 ) ) ( not ( = ?auto_135671 ?auto_135669 ) ) ( not ( = ?auto_135671 ?auto_135668 ) ) ( not ( = ?auto_135665 ?auto_135672 ) ) ( not ( = ?auto_135665 ?auto_135671 ) ) ( not ( = ?auto_135666 ?auto_135672 ) ) ( not ( = ?auto_135666 ?auto_135671 ) ) ( not ( = ?auto_135667 ?auto_135672 ) ) ( not ( = ?auto_135667 ?auto_135671 ) ) ( ON ?auto_135667 ?auto_135668 ) ( ON ?auto_135666 ?auto_135667 ) ( HOLDING ?auto_135665 ) ( CLEAR ?auto_135666 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135672 ?auto_135671 ?auto_135670 ?auto_135669 ?auto_135668 ?auto_135667 ?auto_135666 ?auto_135665 )
      ( MAKE-5PILE ?auto_135665 ?auto_135666 ?auto_135667 ?auto_135668 ?auto_135669 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135673 - BLOCK
      ?auto_135674 - BLOCK
      ?auto_135675 - BLOCK
      ?auto_135676 - BLOCK
      ?auto_135677 - BLOCK
    )
    :vars
    (
      ?auto_135680 - BLOCK
      ?auto_135679 - BLOCK
      ?auto_135678 - BLOCK
      ?auto_135681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135673 ?auto_135674 ) ) ( not ( = ?auto_135673 ?auto_135675 ) ) ( not ( = ?auto_135673 ?auto_135676 ) ) ( not ( = ?auto_135673 ?auto_135677 ) ) ( not ( = ?auto_135674 ?auto_135675 ) ) ( not ( = ?auto_135674 ?auto_135676 ) ) ( not ( = ?auto_135674 ?auto_135677 ) ) ( not ( = ?auto_135675 ?auto_135676 ) ) ( not ( = ?auto_135675 ?auto_135677 ) ) ( not ( = ?auto_135676 ?auto_135677 ) ) ( ON ?auto_135677 ?auto_135680 ) ( not ( = ?auto_135673 ?auto_135680 ) ) ( not ( = ?auto_135674 ?auto_135680 ) ) ( not ( = ?auto_135675 ?auto_135680 ) ) ( not ( = ?auto_135676 ?auto_135680 ) ) ( not ( = ?auto_135677 ?auto_135680 ) ) ( ON ?auto_135676 ?auto_135677 ) ( ON-TABLE ?auto_135679 ) ( ON ?auto_135678 ?auto_135679 ) ( ON ?auto_135680 ?auto_135678 ) ( not ( = ?auto_135679 ?auto_135678 ) ) ( not ( = ?auto_135679 ?auto_135680 ) ) ( not ( = ?auto_135679 ?auto_135677 ) ) ( not ( = ?auto_135679 ?auto_135676 ) ) ( not ( = ?auto_135678 ?auto_135680 ) ) ( not ( = ?auto_135678 ?auto_135677 ) ) ( not ( = ?auto_135678 ?auto_135676 ) ) ( not ( = ?auto_135673 ?auto_135679 ) ) ( not ( = ?auto_135673 ?auto_135678 ) ) ( not ( = ?auto_135674 ?auto_135679 ) ) ( not ( = ?auto_135674 ?auto_135678 ) ) ( not ( = ?auto_135675 ?auto_135679 ) ) ( not ( = ?auto_135675 ?auto_135678 ) ) ( ON ?auto_135675 ?auto_135676 ) ( ON ?auto_135674 ?auto_135675 ) ( CLEAR ?auto_135674 ) ( ON ?auto_135673 ?auto_135681 ) ( CLEAR ?auto_135673 ) ( HAND-EMPTY ) ( not ( = ?auto_135673 ?auto_135681 ) ) ( not ( = ?auto_135674 ?auto_135681 ) ) ( not ( = ?auto_135675 ?auto_135681 ) ) ( not ( = ?auto_135676 ?auto_135681 ) ) ( not ( = ?auto_135677 ?auto_135681 ) ) ( not ( = ?auto_135680 ?auto_135681 ) ) ( not ( = ?auto_135679 ?auto_135681 ) ) ( not ( = ?auto_135678 ?auto_135681 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135673 ?auto_135681 )
      ( MAKE-5PILE ?auto_135673 ?auto_135674 ?auto_135675 ?auto_135676 ?auto_135677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135682 - BLOCK
      ?auto_135683 - BLOCK
      ?auto_135684 - BLOCK
      ?auto_135685 - BLOCK
      ?auto_135686 - BLOCK
    )
    :vars
    (
      ?auto_135688 - BLOCK
      ?auto_135690 - BLOCK
      ?auto_135689 - BLOCK
      ?auto_135687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135682 ?auto_135683 ) ) ( not ( = ?auto_135682 ?auto_135684 ) ) ( not ( = ?auto_135682 ?auto_135685 ) ) ( not ( = ?auto_135682 ?auto_135686 ) ) ( not ( = ?auto_135683 ?auto_135684 ) ) ( not ( = ?auto_135683 ?auto_135685 ) ) ( not ( = ?auto_135683 ?auto_135686 ) ) ( not ( = ?auto_135684 ?auto_135685 ) ) ( not ( = ?auto_135684 ?auto_135686 ) ) ( not ( = ?auto_135685 ?auto_135686 ) ) ( ON ?auto_135686 ?auto_135688 ) ( not ( = ?auto_135682 ?auto_135688 ) ) ( not ( = ?auto_135683 ?auto_135688 ) ) ( not ( = ?auto_135684 ?auto_135688 ) ) ( not ( = ?auto_135685 ?auto_135688 ) ) ( not ( = ?auto_135686 ?auto_135688 ) ) ( ON ?auto_135685 ?auto_135686 ) ( ON-TABLE ?auto_135690 ) ( ON ?auto_135689 ?auto_135690 ) ( ON ?auto_135688 ?auto_135689 ) ( not ( = ?auto_135690 ?auto_135689 ) ) ( not ( = ?auto_135690 ?auto_135688 ) ) ( not ( = ?auto_135690 ?auto_135686 ) ) ( not ( = ?auto_135690 ?auto_135685 ) ) ( not ( = ?auto_135689 ?auto_135688 ) ) ( not ( = ?auto_135689 ?auto_135686 ) ) ( not ( = ?auto_135689 ?auto_135685 ) ) ( not ( = ?auto_135682 ?auto_135690 ) ) ( not ( = ?auto_135682 ?auto_135689 ) ) ( not ( = ?auto_135683 ?auto_135690 ) ) ( not ( = ?auto_135683 ?auto_135689 ) ) ( not ( = ?auto_135684 ?auto_135690 ) ) ( not ( = ?auto_135684 ?auto_135689 ) ) ( ON ?auto_135684 ?auto_135685 ) ( ON ?auto_135682 ?auto_135687 ) ( CLEAR ?auto_135682 ) ( not ( = ?auto_135682 ?auto_135687 ) ) ( not ( = ?auto_135683 ?auto_135687 ) ) ( not ( = ?auto_135684 ?auto_135687 ) ) ( not ( = ?auto_135685 ?auto_135687 ) ) ( not ( = ?auto_135686 ?auto_135687 ) ) ( not ( = ?auto_135688 ?auto_135687 ) ) ( not ( = ?auto_135690 ?auto_135687 ) ) ( not ( = ?auto_135689 ?auto_135687 ) ) ( HOLDING ?auto_135683 ) ( CLEAR ?auto_135684 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135690 ?auto_135689 ?auto_135688 ?auto_135686 ?auto_135685 ?auto_135684 ?auto_135683 )
      ( MAKE-5PILE ?auto_135682 ?auto_135683 ?auto_135684 ?auto_135685 ?auto_135686 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135691 - BLOCK
      ?auto_135692 - BLOCK
      ?auto_135693 - BLOCK
      ?auto_135694 - BLOCK
      ?auto_135695 - BLOCK
    )
    :vars
    (
      ?auto_135696 - BLOCK
      ?auto_135697 - BLOCK
      ?auto_135699 - BLOCK
      ?auto_135698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135691 ?auto_135692 ) ) ( not ( = ?auto_135691 ?auto_135693 ) ) ( not ( = ?auto_135691 ?auto_135694 ) ) ( not ( = ?auto_135691 ?auto_135695 ) ) ( not ( = ?auto_135692 ?auto_135693 ) ) ( not ( = ?auto_135692 ?auto_135694 ) ) ( not ( = ?auto_135692 ?auto_135695 ) ) ( not ( = ?auto_135693 ?auto_135694 ) ) ( not ( = ?auto_135693 ?auto_135695 ) ) ( not ( = ?auto_135694 ?auto_135695 ) ) ( ON ?auto_135695 ?auto_135696 ) ( not ( = ?auto_135691 ?auto_135696 ) ) ( not ( = ?auto_135692 ?auto_135696 ) ) ( not ( = ?auto_135693 ?auto_135696 ) ) ( not ( = ?auto_135694 ?auto_135696 ) ) ( not ( = ?auto_135695 ?auto_135696 ) ) ( ON ?auto_135694 ?auto_135695 ) ( ON-TABLE ?auto_135697 ) ( ON ?auto_135699 ?auto_135697 ) ( ON ?auto_135696 ?auto_135699 ) ( not ( = ?auto_135697 ?auto_135699 ) ) ( not ( = ?auto_135697 ?auto_135696 ) ) ( not ( = ?auto_135697 ?auto_135695 ) ) ( not ( = ?auto_135697 ?auto_135694 ) ) ( not ( = ?auto_135699 ?auto_135696 ) ) ( not ( = ?auto_135699 ?auto_135695 ) ) ( not ( = ?auto_135699 ?auto_135694 ) ) ( not ( = ?auto_135691 ?auto_135697 ) ) ( not ( = ?auto_135691 ?auto_135699 ) ) ( not ( = ?auto_135692 ?auto_135697 ) ) ( not ( = ?auto_135692 ?auto_135699 ) ) ( not ( = ?auto_135693 ?auto_135697 ) ) ( not ( = ?auto_135693 ?auto_135699 ) ) ( ON ?auto_135693 ?auto_135694 ) ( ON ?auto_135691 ?auto_135698 ) ( not ( = ?auto_135691 ?auto_135698 ) ) ( not ( = ?auto_135692 ?auto_135698 ) ) ( not ( = ?auto_135693 ?auto_135698 ) ) ( not ( = ?auto_135694 ?auto_135698 ) ) ( not ( = ?auto_135695 ?auto_135698 ) ) ( not ( = ?auto_135696 ?auto_135698 ) ) ( not ( = ?auto_135697 ?auto_135698 ) ) ( not ( = ?auto_135699 ?auto_135698 ) ) ( CLEAR ?auto_135693 ) ( ON ?auto_135692 ?auto_135691 ) ( CLEAR ?auto_135692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135698 ?auto_135691 )
      ( MAKE-5PILE ?auto_135691 ?auto_135692 ?auto_135693 ?auto_135694 ?auto_135695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135700 - BLOCK
      ?auto_135701 - BLOCK
      ?auto_135702 - BLOCK
      ?auto_135703 - BLOCK
      ?auto_135704 - BLOCK
    )
    :vars
    (
      ?auto_135706 - BLOCK
      ?auto_135707 - BLOCK
      ?auto_135705 - BLOCK
      ?auto_135708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135700 ?auto_135701 ) ) ( not ( = ?auto_135700 ?auto_135702 ) ) ( not ( = ?auto_135700 ?auto_135703 ) ) ( not ( = ?auto_135700 ?auto_135704 ) ) ( not ( = ?auto_135701 ?auto_135702 ) ) ( not ( = ?auto_135701 ?auto_135703 ) ) ( not ( = ?auto_135701 ?auto_135704 ) ) ( not ( = ?auto_135702 ?auto_135703 ) ) ( not ( = ?auto_135702 ?auto_135704 ) ) ( not ( = ?auto_135703 ?auto_135704 ) ) ( ON ?auto_135704 ?auto_135706 ) ( not ( = ?auto_135700 ?auto_135706 ) ) ( not ( = ?auto_135701 ?auto_135706 ) ) ( not ( = ?auto_135702 ?auto_135706 ) ) ( not ( = ?auto_135703 ?auto_135706 ) ) ( not ( = ?auto_135704 ?auto_135706 ) ) ( ON ?auto_135703 ?auto_135704 ) ( ON-TABLE ?auto_135707 ) ( ON ?auto_135705 ?auto_135707 ) ( ON ?auto_135706 ?auto_135705 ) ( not ( = ?auto_135707 ?auto_135705 ) ) ( not ( = ?auto_135707 ?auto_135706 ) ) ( not ( = ?auto_135707 ?auto_135704 ) ) ( not ( = ?auto_135707 ?auto_135703 ) ) ( not ( = ?auto_135705 ?auto_135706 ) ) ( not ( = ?auto_135705 ?auto_135704 ) ) ( not ( = ?auto_135705 ?auto_135703 ) ) ( not ( = ?auto_135700 ?auto_135707 ) ) ( not ( = ?auto_135700 ?auto_135705 ) ) ( not ( = ?auto_135701 ?auto_135707 ) ) ( not ( = ?auto_135701 ?auto_135705 ) ) ( not ( = ?auto_135702 ?auto_135707 ) ) ( not ( = ?auto_135702 ?auto_135705 ) ) ( ON ?auto_135700 ?auto_135708 ) ( not ( = ?auto_135700 ?auto_135708 ) ) ( not ( = ?auto_135701 ?auto_135708 ) ) ( not ( = ?auto_135702 ?auto_135708 ) ) ( not ( = ?auto_135703 ?auto_135708 ) ) ( not ( = ?auto_135704 ?auto_135708 ) ) ( not ( = ?auto_135706 ?auto_135708 ) ) ( not ( = ?auto_135707 ?auto_135708 ) ) ( not ( = ?auto_135705 ?auto_135708 ) ) ( ON ?auto_135701 ?auto_135700 ) ( CLEAR ?auto_135701 ) ( ON-TABLE ?auto_135708 ) ( HOLDING ?auto_135702 ) ( CLEAR ?auto_135703 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135707 ?auto_135705 ?auto_135706 ?auto_135704 ?auto_135703 ?auto_135702 )
      ( MAKE-5PILE ?auto_135700 ?auto_135701 ?auto_135702 ?auto_135703 ?auto_135704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135709 - BLOCK
      ?auto_135710 - BLOCK
      ?auto_135711 - BLOCK
      ?auto_135712 - BLOCK
      ?auto_135713 - BLOCK
    )
    :vars
    (
      ?auto_135715 - BLOCK
      ?auto_135714 - BLOCK
      ?auto_135716 - BLOCK
      ?auto_135717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135709 ?auto_135710 ) ) ( not ( = ?auto_135709 ?auto_135711 ) ) ( not ( = ?auto_135709 ?auto_135712 ) ) ( not ( = ?auto_135709 ?auto_135713 ) ) ( not ( = ?auto_135710 ?auto_135711 ) ) ( not ( = ?auto_135710 ?auto_135712 ) ) ( not ( = ?auto_135710 ?auto_135713 ) ) ( not ( = ?auto_135711 ?auto_135712 ) ) ( not ( = ?auto_135711 ?auto_135713 ) ) ( not ( = ?auto_135712 ?auto_135713 ) ) ( ON ?auto_135713 ?auto_135715 ) ( not ( = ?auto_135709 ?auto_135715 ) ) ( not ( = ?auto_135710 ?auto_135715 ) ) ( not ( = ?auto_135711 ?auto_135715 ) ) ( not ( = ?auto_135712 ?auto_135715 ) ) ( not ( = ?auto_135713 ?auto_135715 ) ) ( ON ?auto_135712 ?auto_135713 ) ( ON-TABLE ?auto_135714 ) ( ON ?auto_135716 ?auto_135714 ) ( ON ?auto_135715 ?auto_135716 ) ( not ( = ?auto_135714 ?auto_135716 ) ) ( not ( = ?auto_135714 ?auto_135715 ) ) ( not ( = ?auto_135714 ?auto_135713 ) ) ( not ( = ?auto_135714 ?auto_135712 ) ) ( not ( = ?auto_135716 ?auto_135715 ) ) ( not ( = ?auto_135716 ?auto_135713 ) ) ( not ( = ?auto_135716 ?auto_135712 ) ) ( not ( = ?auto_135709 ?auto_135714 ) ) ( not ( = ?auto_135709 ?auto_135716 ) ) ( not ( = ?auto_135710 ?auto_135714 ) ) ( not ( = ?auto_135710 ?auto_135716 ) ) ( not ( = ?auto_135711 ?auto_135714 ) ) ( not ( = ?auto_135711 ?auto_135716 ) ) ( ON ?auto_135709 ?auto_135717 ) ( not ( = ?auto_135709 ?auto_135717 ) ) ( not ( = ?auto_135710 ?auto_135717 ) ) ( not ( = ?auto_135711 ?auto_135717 ) ) ( not ( = ?auto_135712 ?auto_135717 ) ) ( not ( = ?auto_135713 ?auto_135717 ) ) ( not ( = ?auto_135715 ?auto_135717 ) ) ( not ( = ?auto_135714 ?auto_135717 ) ) ( not ( = ?auto_135716 ?auto_135717 ) ) ( ON ?auto_135710 ?auto_135709 ) ( ON-TABLE ?auto_135717 ) ( CLEAR ?auto_135712 ) ( ON ?auto_135711 ?auto_135710 ) ( CLEAR ?auto_135711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135717 ?auto_135709 ?auto_135710 )
      ( MAKE-5PILE ?auto_135709 ?auto_135710 ?auto_135711 ?auto_135712 ?auto_135713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135718 - BLOCK
      ?auto_135719 - BLOCK
      ?auto_135720 - BLOCK
      ?auto_135721 - BLOCK
      ?auto_135722 - BLOCK
    )
    :vars
    (
      ?auto_135725 - BLOCK
      ?auto_135726 - BLOCK
      ?auto_135724 - BLOCK
      ?auto_135723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135718 ?auto_135719 ) ) ( not ( = ?auto_135718 ?auto_135720 ) ) ( not ( = ?auto_135718 ?auto_135721 ) ) ( not ( = ?auto_135718 ?auto_135722 ) ) ( not ( = ?auto_135719 ?auto_135720 ) ) ( not ( = ?auto_135719 ?auto_135721 ) ) ( not ( = ?auto_135719 ?auto_135722 ) ) ( not ( = ?auto_135720 ?auto_135721 ) ) ( not ( = ?auto_135720 ?auto_135722 ) ) ( not ( = ?auto_135721 ?auto_135722 ) ) ( ON ?auto_135722 ?auto_135725 ) ( not ( = ?auto_135718 ?auto_135725 ) ) ( not ( = ?auto_135719 ?auto_135725 ) ) ( not ( = ?auto_135720 ?auto_135725 ) ) ( not ( = ?auto_135721 ?auto_135725 ) ) ( not ( = ?auto_135722 ?auto_135725 ) ) ( ON-TABLE ?auto_135726 ) ( ON ?auto_135724 ?auto_135726 ) ( ON ?auto_135725 ?auto_135724 ) ( not ( = ?auto_135726 ?auto_135724 ) ) ( not ( = ?auto_135726 ?auto_135725 ) ) ( not ( = ?auto_135726 ?auto_135722 ) ) ( not ( = ?auto_135726 ?auto_135721 ) ) ( not ( = ?auto_135724 ?auto_135725 ) ) ( not ( = ?auto_135724 ?auto_135722 ) ) ( not ( = ?auto_135724 ?auto_135721 ) ) ( not ( = ?auto_135718 ?auto_135726 ) ) ( not ( = ?auto_135718 ?auto_135724 ) ) ( not ( = ?auto_135719 ?auto_135726 ) ) ( not ( = ?auto_135719 ?auto_135724 ) ) ( not ( = ?auto_135720 ?auto_135726 ) ) ( not ( = ?auto_135720 ?auto_135724 ) ) ( ON ?auto_135718 ?auto_135723 ) ( not ( = ?auto_135718 ?auto_135723 ) ) ( not ( = ?auto_135719 ?auto_135723 ) ) ( not ( = ?auto_135720 ?auto_135723 ) ) ( not ( = ?auto_135721 ?auto_135723 ) ) ( not ( = ?auto_135722 ?auto_135723 ) ) ( not ( = ?auto_135725 ?auto_135723 ) ) ( not ( = ?auto_135726 ?auto_135723 ) ) ( not ( = ?auto_135724 ?auto_135723 ) ) ( ON ?auto_135719 ?auto_135718 ) ( ON-TABLE ?auto_135723 ) ( ON ?auto_135720 ?auto_135719 ) ( CLEAR ?auto_135720 ) ( HOLDING ?auto_135721 ) ( CLEAR ?auto_135722 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135726 ?auto_135724 ?auto_135725 ?auto_135722 ?auto_135721 )
      ( MAKE-5PILE ?auto_135718 ?auto_135719 ?auto_135720 ?auto_135721 ?auto_135722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135727 - BLOCK
      ?auto_135728 - BLOCK
      ?auto_135729 - BLOCK
      ?auto_135730 - BLOCK
      ?auto_135731 - BLOCK
    )
    :vars
    (
      ?auto_135735 - BLOCK
      ?auto_135732 - BLOCK
      ?auto_135734 - BLOCK
      ?auto_135733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135727 ?auto_135728 ) ) ( not ( = ?auto_135727 ?auto_135729 ) ) ( not ( = ?auto_135727 ?auto_135730 ) ) ( not ( = ?auto_135727 ?auto_135731 ) ) ( not ( = ?auto_135728 ?auto_135729 ) ) ( not ( = ?auto_135728 ?auto_135730 ) ) ( not ( = ?auto_135728 ?auto_135731 ) ) ( not ( = ?auto_135729 ?auto_135730 ) ) ( not ( = ?auto_135729 ?auto_135731 ) ) ( not ( = ?auto_135730 ?auto_135731 ) ) ( ON ?auto_135731 ?auto_135735 ) ( not ( = ?auto_135727 ?auto_135735 ) ) ( not ( = ?auto_135728 ?auto_135735 ) ) ( not ( = ?auto_135729 ?auto_135735 ) ) ( not ( = ?auto_135730 ?auto_135735 ) ) ( not ( = ?auto_135731 ?auto_135735 ) ) ( ON-TABLE ?auto_135732 ) ( ON ?auto_135734 ?auto_135732 ) ( ON ?auto_135735 ?auto_135734 ) ( not ( = ?auto_135732 ?auto_135734 ) ) ( not ( = ?auto_135732 ?auto_135735 ) ) ( not ( = ?auto_135732 ?auto_135731 ) ) ( not ( = ?auto_135732 ?auto_135730 ) ) ( not ( = ?auto_135734 ?auto_135735 ) ) ( not ( = ?auto_135734 ?auto_135731 ) ) ( not ( = ?auto_135734 ?auto_135730 ) ) ( not ( = ?auto_135727 ?auto_135732 ) ) ( not ( = ?auto_135727 ?auto_135734 ) ) ( not ( = ?auto_135728 ?auto_135732 ) ) ( not ( = ?auto_135728 ?auto_135734 ) ) ( not ( = ?auto_135729 ?auto_135732 ) ) ( not ( = ?auto_135729 ?auto_135734 ) ) ( ON ?auto_135727 ?auto_135733 ) ( not ( = ?auto_135727 ?auto_135733 ) ) ( not ( = ?auto_135728 ?auto_135733 ) ) ( not ( = ?auto_135729 ?auto_135733 ) ) ( not ( = ?auto_135730 ?auto_135733 ) ) ( not ( = ?auto_135731 ?auto_135733 ) ) ( not ( = ?auto_135735 ?auto_135733 ) ) ( not ( = ?auto_135732 ?auto_135733 ) ) ( not ( = ?auto_135734 ?auto_135733 ) ) ( ON ?auto_135728 ?auto_135727 ) ( ON-TABLE ?auto_135733 ) ( ON ?auto_135729 ?auto_135728 ) ( CLEAR ?auto_135731 ) ( ON ?auto_135730 ?auto_135729 ) ( CLEAR ?auto_135730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135733 ?auto_135727 ?auto_135728 ?auto_135729 )
      ( MAKE-5PILE ?auto_135727 ?auto_135728 ?auto_135729 ?auto_135730 ?auto_135731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135736 - BLOCK
      ?auto_135737 - BLOCK
      ?auto_135738 - BLOCK
      ?auto_135739 - BLOCK
      ?auto_135740 - BLOCK
    )
    :vars
    (
      ?auto_135744 - BLOCK
      ?auto_135743 - BLOCK
      ?auto_135742 - BLOCK
      ?auto_135741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135736 ?auto_135737 ) ) ( not ( = ?auto_135736 ?auto_135738 ) ) ( not ( = ?auto_135736 ?auto_135739 ) ) ( not ( = ?auto_135736 ?auto_135740 ) ) ( not ( = ?auto_135737 ?auto_135738 ) ) ( not ( = ?auto_135737 ?auto_135739 ) ) ( not ( = ?auto_135737 ?auto_135740 ) ) ( not ( = ?auto_135738 ?auto_135739 ) ) ( not ( = ?auto_135738 ?auto_135740 ) ) ( not ( = ?auto_135739 ?auto_135740 ) ) ( not ( = ?auto_135736 ?auto_135744 ) ) ( not ( = ?auto_135737 ?auto_135744 ) ) ( not ( = ?auto_135738 ?auto_135744 ) ) ( not ( = ?auto_135739 ?auto_135744 ) ) ( not ( = ?auto_135740 ?auto_135744 ) ) ( ON-TABLE ?auto_135743 ) ( ON ?auto_135742 ?auto_135743 ) ( ON ?auto_135744 ?auto_135742 ) ( not ( = ?auto_135743 ?auto_135742 ) ) ( not ( = ?auto_135743 ?auto_135744 ) ) ( not ( = ?auto_135743 ?auto_135740 ) ) ( not ( = ?auto_135743 ?auto_135739 ) ) ( not ( = ?auto_135742 ?auto_135744 ) ) ( not ( = ?auto_135742 ?auto_135740 ) ) ( not ( = ?auto_135742 ?auto_135739 ) ) ( not ( = ?auto_135736 ?auto_135743 ) ) ( not ( = ?auto_135736 ?auto_135742 ) ) ( not ( = ?auto_135737 ?auto_135743 ) ) ( not ( = ?auto_135737 ?auto_135742 ) ) ( not ( = ?auto_135738 ?auto_135743 ) ) ( not ( = ?auto_135738 ?auto_135742 ) ) ( ON ?auto_135736 ?auto_135741 ) ( not ( = ?auto_135736 ?auto_135741 ) ) ( not ( = ?auto_135737 ?auto_135741 ) ) ( not ( = ?auto_135738 ?auto_135741 ) ) ( not ( = ?auto_135739 ?auto_135741 ) ) ( not ( = ?auto_135740 ?auto_135741 ) ) ( not ( = ?auto_135744 ?auto_135741 ) ) ( not ( = ?auto_135743 ?auto_135741 ) ) ( not ( = ?auto_135742 ?auto_135741 ) ) ( ON ?auto_135737 ?auto_135736 ) ( ON-TABLE ?auto_135741 ) ( ON ?auto_135738 ?auto_135737 ) ( ON ?auto_135739 ?auto_135738 ) ( CLEAR ?auto_135739 ) ( HOLDING ?auto_135740 ) ( CLEAR ?auto_135744 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135743 ?auto_135742 ?auto_135744 ?auto_135740 )
      ( MAKE-5PILE ?auto_135736 ?auto_135737 ?auto_135738 ?auto_135739 ?auto_135740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135745 - BLOCK
      ?auto_135746 - BLOCK
      ?auto_135747 - BLOCK
      ?auto_135748 - BLOCK
      ?auto_135749 - BLOCK
    )
    :vars
    (
      ?auto_135752 - BLOCK
      ?auto_135753 - BLOCK
      ?auto_135751 - BLOCK
      ?auto_135750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135745 ?auto_135746 ) ) ( not ( = ?auto_135745 ?auto_135747 ) ) ( not ( = ?auto_135745 ?auto_135748 ) ) ( not ( = ?auto_135745 ?auto_135749 ) ) ( not ( = ?auto_135746 ?auto_135747 ) ) ( not ( = ?auto_135746 ?auto_135748 ) ) ( not ( = ?auto_135746 ?auto_135749 ) ) ( not ( = ?auto_135747 ?auto_135748 ) ) ( not ( = ?auto_135747 ?auto_135749 ) ) ( not ( = ?auto_135748 ?auto_135749 ) ) ( not ( = ?auto_135745 ?auto_135752 ) ) ( not ( = ?auto_135746 ?auto_135752 ) ) ( not ( = ?auto_135747 ?auto_135752 ) ) ( not ( = ?auto_135748 ?auto_135752 ) ) ( not ( = ?auto_135749 ?auto_135752 ) ) ( ON-TABLE ?auto_135753 ) ( ON ?auto_135751 ?auto_135753 ) ( ON ?auto_135752 ?auto_135751 ) ( not ( = ?auto_135753 ?auto_135751 ) ) ( not ( = ?auto_135753 ?auto_135752 ) ) ( not ( = ?auto_135753 ?auto_135749 ) ) ( not ( = ?auto_135753 ?auto_135748 ) ) ( not ( = ?auto_135751 ?auto_135752 ) ) ( not ( = ?auto_135751 ?auto_135749 ) ) ( not ( = ?auto_135751 ?auto_135748 ) ) ( not ( = ?auto_135745 ?auto_135753 ) ) ( not ( = ?auto_135745 ?auto_135751 ) ) ( not ( = ?auto_135746 ?auto_135753 ) ) ( not ( = ?auto_135746 ?auto_135751 ) ) ( not ( = ?auto_135747 ?auto_135753 ) ) ( not ( = ?auto_135747 ?auto_135751 ) ) ( ON ?auto_135745 ?auto_135750 ) ( not ( = ?auto_135745 ?auto_135750 ) ) ( not ( = ?auto_135746 ?auto_135750 ) ) ( not ( = ?auto_135747 ?auto_135750 ) ) ( not ( = ?auto_135748 ?auto_135750 ) ) ( not ( = ?auto_135749 ?auto_135750 ) ) ( not ( = ?auto_135752 ?auto_135750 ) ) ( not ( = ?auto_135753 ?auto_135750 ) ) ( not ( = ?auto_135751 ?auto_135750 ) ) ( ON ?auto_135746 ?auto_135745 ) ( ON-TABLE ?auto_135750 ) ( ON ?auto_135747 ?auto_135746 ) ( ON ?auto_135748 ?auto_135747 ) ( CLEAR ?auto_135752 ) ( ON ?auto_135749 ?auto_135748 ) ( CLEAR ?auto_135749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135750 ?auto_135745 ?auto_135746 ?auto_135747 ?auto_135748 )
      ( MAKE-5PILE ?auto_135745 ?auto_135746 ?auto_135747 ?auto_135748 ?auto_135749 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135754 - BLOCK
      ?auto_135755 - BLOCK
      ?auto_135756 - BLOCK
      ?auto_135757 - BLOCK
      ?auto_135758 - BLOCK
    )
    :vars
    (
      ?auto_135760 - BLOCK
      ?auto_135761 - BLOCK
      ?auto_135759 - BLOCK
      ?auto_135762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135754 ?auto_135755 ) ) ( not ( = ?auto_135754 ?auto_135756 ) ) ( not ( = ?auto_135754 ?auto_135757 ) ) ( not ( = ?auto_135754 ?auto_135758 ) ) ( not ( = ?auto_135755 ?auto_135756 ) ) ( not ( = ?auto_135755 ?auto_135757 ) ) ( not ( = ?auto_135755 ?auto_135758 ) ) ( not ( = ?auto_135756 ?auto_135757 ) ) ( not ( = ?auto_135756 ?auto_135758 ) ) ( not ( = ?auto_135757 ?auto_135758 ) ) ( not ( = ?auto_135754 ?auto_135760 ) ) ( not ( = ?auto_135755 ?auto_135760 ) ) ( not ( = ?auto_135756 ?auto_135760 ) ) ( not ( = ?auto_135757 ?auto_135760 ) ) ( not ( = ?auto_135758 ?auto_135760 ) ) ( ON-TABLE ?auto_135761 ) ( ON ?auto_135759 ?auto_135761 ) ( not ( = ?auto_135761 ?auto_135759 ) ) ( not ( = ?auto_135761 ?auto_135760 ) ) ( not ( = ?auto_135761 ?auto_135758 ) ) ( not ( = ?auto_135761 ?auto_135757 ) ) ( not ( = ?auto_135759 ?auto_135760 ) ) ( not ( = ?auto_135759 ?auto_135758 ) ) ( not ( = ?auto_135759 ?auto_135757 ) ) ( not ( = ?auto_135754 ?auto_135761 ) ) ( not ( = ?auto_135754 ?auto_135759 ) ) ( not ( = ?auto_135755 ?auto_135761 ) ) ( not ( = ?auto_135755 ?auto_135759 ) ) ( not ( = ?auto_135756 ?auto_135761 ) ) ( not ( = ?auto_135756 ?auto_135759 ) ) ( ON ?auto_135754 ?auto_135762 ) ( not ( = ?auto_135754 ?auto_135762 ) ) ( not ( = ?auto_135755 ?auto_135762 ) ) ( not ( = ?auto_135756 ?auto_135762 ) ) ( not ( = ?auto_135757 ?auto_135762 ) ) ( not ( = ?auto_135758 ?auto_135762 ) ) ( not ( = ?auto_135760 ?auto_135762 ) ) ( not ( = ?auto_135761 ?auto_135762 ) ) ( not ( = ?auto_135759 ?auto_135762 ) ) ( ON ?auto_135755 ?auto_135754 ) ( ON-TABLE ?auto_135762 ) ( ON ?auto_135756 ?auto_135755 ) ( ON ?auto_135757 ?auto_135756 ) ( ON ?auto_135758 ?auto_135757 ) ( CLEAR ?auto_135758 ) ( HOLDING ?auto_135760 ) ( CLEAR ?auto_135759 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135761 ?auto_135759 ?auto_135760 )
      ( MAKE-5PILE ?auto_135754 ?auto_135755 ?auto_135756 ?auto_135757 ?auto_135758 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135763 - BLOCK
      ?auto_135764 - BLOCK
      ?auto_135765 - BLOCK
      ?auto_135766 - BLOCK
      ?auto_135767 - BLOCK
    )
    :vars
    (
      ?auto_135769 - BLOCK
      ?auto_135770 - BLOCK
      ?auto_135771 - BLOCK
      ?auto_135768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135763 ?auto_135764 ) ) ( not ( = ?auto_135763 ?auto_135765 ) ) ( not ( = ?auto_135763 ?auto_135766 ) ) ( not ( = ?auto_135763 ?auto_135767 ) ) ( not ( = ?auto_135764 ?auto_135765 ) ) ( not ( = ?auto_135764 ?auto_135766 ) ) ( not ( = ?auto_135764 ?auto_135767 ) ) ( not ( = ?auto_135765 ?auto_135766 ) ) ( not ( = ?auto_135765 ?auto_135767 ) ) ( not ( = ?auto_135766 ?auto_135767 ) ) ( not ( = ?auto_135763 ?auto_135769 ) ) ( not ( = ?auto_135764 ?auto_135769 ) ) ( not ( = ?auto_135765 ?auto_135769 ) ) ( not ( = ?auto_135766 ?auto_135769 ) ) ( not ( = ?auto_135767 ?auto_135769 ) ) ( ON-TABLE ?auto_135770 ) ( ON ?auto_135771 ?auto_135770 ) ( not ( = ?auto_135770 ?auto_135771 ) ) ( not ( = ?auto_135770 ?auto_135769 ) ) ( not ( = ?auto_135770 ?auto_135767 ) ) ( not ( = ?auto_135770 ?auto_135766 ) ) ( not ( = ?auto_135771 ?auto_135769 ) ) ( not ( = ?auto_135771 ?auto_135767 ) ) ( not ( = ?auto_135771 ?auto_135766 ) ) ( not ( = ?auto_135763 ?auto_135770 ) ) ( not ( = ?auto_135763 ?auto_135771 ) ) ( not ( = ?auto_135764 ?auto_135770 ) ) ( not ( = ?auto_135764 ?auto_135771 ) ) ( not ( = ?auto_135765 ?auto_135770 ) ) ( not ( = ?auto_135765 ?auto_135771 ) ) ( ON ?auto_135763 ?auto_135768 ) ( not ( = ?auto_135763 ?auto_135768 ) ) ( not ( = ?auto_135764 ?auto_135768 ) ) ( not ( = ?auto_135765 ?auto_135768 ) ) ( not ( = ?auto_135766 ?auto_135768 ) ) ( not ( = ?auto_135767 ?auto_135768 ) ) ( not ( = ?auto_135769 ?auto_135768 ) ) ( not ( = ?auto_135770 ?auto_135768 ) ) ( not ( = ?auto_135771 ?auto_135768 ) ) ( ON ?auto_135764 ?auto_135763 ) ( ON-TABLE ?auto_135768 ) ( ON ?auto_135765 ?auto_135764 ) ( ON ?auto_135766 ?auto_135765 ) ( ON ?auto_135767 ?auto_135766 ) ( CLEAR ?auto_135771 ) ( ON ?auto_135769 ?auto_135767 ) ( CLEAR ?auto_135769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135768 ?auto_135763 ?auto_135764 ?auto_135765 ?auto_135766 ?auto_135767 )
      ( MAKE-5PILE ?auto_135763 ?auto_135764 ?auto_135765 ?auto_135766 ?auto_135767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135772 - BLOCK
      ?auto_135773 - BLOCK
      ?auto_135774 - BLOCK
      ?auto_135775 - BLOCK
      ?auto_135776 - BLOCK
    )
    :vars
    (
      ?auto_135777 - BLOCK
      ?auto_135780 - BLOCK
      ?auto_135779 - BLOCK
      ?auto_135778 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135772 ?auto_135773 ) ) ( not ( = ?auto_135772 ?auto_135774 ) ) ( not ( = ?auto_135772 ?auto_135775 ) ) ( not ( = ?auto_135772 ?auto_135776 ) ) ( not ( = ?auto_135773 ?auto_135774 ) ) ( not ( = ?auto_135773 ?auto_135775 ) ) ( not ( = ?auto_135773 ?auto_135776 ) ) ( not ( = ?auto_135774 ?auto_135775 ) ) ( not ( = ?auto_135774 ?auto_135776 ) ) ( not ( = ?auto_135775 ?auto_135776 ) ) ( not ( = ?auto_135772 ?auto_135777 ) ) ( not ( = ?auto_135773 ?auto_135777 ) ) ( not ( = ?auto_135774 ?auto_135777 ) ) ( not ( = ?auto_135775 ?auto_135777 ) ) ( not ( = ?auto_135776 ?auto_135777 ) ) ( ON-TABLE ?auto_135780 ) ( not ( = ?auto_135780 ?auto_135779 ) ) ( not ( = ?auto_135780 ?auto_135777 ) ) ( not ( = ?auto_135780 ?auto_135776 ) ) ( not ( = ?auto_135780 ?auto_135775 ) ) ( not ( = ?auto_135779 ?auto_135777 ) ) ( not ( = ?auto_135779 ?auto_135776 ) ) ( not ( = ?auto_135779 ?auto_135775 ) ) ( not ( = ?auto_135772 ?auto_135780 ) ) ( not ( = ?auto_135772 ?auto_135779 ) ) ( not ( = ?auto_135773 ?auto_135780 ) ) ( not ( = ?auto_135773 ?auto_135779 ) ) ( not ( = ?auto_135774 ?auto_135780 ) ) ( not ( = ?auto_135774 ?auto_135779 ) ) ( ON ?auto_135772 ?auto_135778 ) ( not ( = ?auto_135772 ?auto_135778 ) ) ( not ( = ?auto_135773 ?auto_135778 ) ) ( not ( = ?auto_135774 ?auto_135778 ) ) ( not ( = ?auto_135775 ?auto_135778 ) ) ( not ( = ?auto_135776 ?auto_135778 ) ) ( not ( = ?auto_135777 ?auto_135778 ) ) ( not ( = ?auto_135780 ?auto_135778 ) ) ( not ( = ?auto_135779 ?auto_135778 ) ) ( ON ?auto_135773 ?auto_135772 ) ( ON-TABLE ?auto_135778 ) ( ON ?auto_135774 ?auto_135773 ) ( ON ?auto_135775 ?auto_135774 ) ( ON ?auto_135776 ?auto_135775 ) ( ON ?auto_135777 ?auto_135776 ) ( CLEAR ?auto_135777 ) ( HOLDING ?auto_135779 ) ( CLEAR ?auto_135780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135780 ?auto_135779 )
      ( MAKE-5PILE ?auto_135772 ?auto_135773 ?auto_135774 ?auto_135775 ?auto_135776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135781 - BLOCK
      ?auto_135782 - BLOCK
      ?auto_135783 - BLOCK
      ?auto_135784 - BLOCK
      ?auto_135785 - BLOCK
    )
    :vars
    (
      ?auto_135787 - BLOCK
      ?auto_135786 - BLOCK
      ?auto_135789 - BLOCK
      ?auto_135788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135781 ?auto_135782 ) ) ( not ( = ?auto_135781 ?auto_135783 ) ) ( not ( = ?auto_135781 ?auto_135784 ) ) ( not ( = ?auto_135781 ?auto_135785 ) ) ( not ( = ?auto_135782 ?auto_135783 ) ) ( not ( = ?auto_135782 ?auto_135784 ) ) ( not ( = ?auto_135782 ?auto_135785 ) ) ( not ( = ?auto_135783 ?auto_135784 ) ) ( not ( = ?auto_135783 ?auto_135785 ) ) ( not ( = ?auto_135784 ?auto_135785 ) ) ( not ( = ?auto_135781 ?auto_135787 ) ) ( not ( = ?auto_135782 ?auto_135787 ) ) ( not ( = ?auto_135783 ?auto_135787 ) ) ( not ( = ?auto_135784 ?auto_135787 ) ) ( not ( = ?auto_135785 ?auto_135787 ) ) ( ON-TABLE ?auto_135786 ) ( not ( = ?auto_135786 ?auto_135789 ) ) ( not ( = ?auto_135786 ?auto_135787 ) ) ( not ( = ?auto_135786 ?auto_135785 ) ) ( not ( = ?auto_135786 ?auto_135784 ) ) ( not ( = ?auto_135789 ?auto_135787 ) ) ( not ( = ?auto_135789 ?auto_135785 ) ) ( not ( = ?auto_135789 ?auto_135784 ) ) ( not ( = ?auto_135781 ?auto_135786 ) ) ( not ( = ?auto_135781 ?auto_135789 ) ) ( not ( = ?auto_135782 ?auto_135786 ) ) ( not ( = ?auto_135782 ?auto_135789 ) ) ( not ( = ?auto_135783 ?auto_135786 ) ) ( not ( = ?auto_135783 ?auto_135789 ) ) ( ON ?auto_135781 ?auto_135788 ) ( not ( = ?auto_135781 ?auto_135788 ) ) ( not ( = ?auto_135782 ?auto_135788 ) ) ( not ( = ?auto_135783 ?auto_135788 ) ) ( not ( = ?auto_135784 ?auto_135788 ) ) ( not ( = ?auto_135785 ?auto_135788 ) ) ( not ( = ?auto_135787 ?auto_135788 ) ) ( not ( = ?auto_135786 ?auto_135788 ) ) ( not ( = ?auto_135789 ?auto_135788 ) ) ( ON ?auto_135782 ?auto_135781 ) ( ON-TABLE ?auto_135788 ) ( ON ?auto_135783 ?auto_135782 ) ( ON ?auto_135784 ?auto_135783 ) ( ON ?auto_135785 ?auto_135784 ) ( ON ?auto_135787 ?auto_135785 ) ( CLEAR ?auto_135786 ) ( ON ?auto_135789 ?auto_135787 ) ( CLEAR ?auto_135789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135788 ?auto_135781 ?auto_135782 ?auto_135783 ?auto_135784 ?auto_135785 ?auto_135787 )
      ( MAKE-5PILE ?auto_135781 ?auto_135782 ?auto_135783 ?auto_135784 ?auto_135785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135790 - BLOCK
      ?auto_135791 - BLOCK
      ?auto_135792 - BLOCK
      ?auto_135793 - BLOCK
      ?auto_135794 - BLOCK
    )
    :vars
    (
      ?auto_135795 - BLOCK
      ?auto_135796 - BLOCK
      ?auto_135797 - BLOCK
      ?auto_135798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135790 ?auto_135791 ) ) ( not ( = ?auto_135790 ?auto_135792 ) ) ( not ( = ?auto_135790 ?auto_135793 ) ) ( not ( = ?auto_135790 ?auto_135794 ) ) ( not ( = ?auto_135791 ?auto_135792 ) ) ( not ( = ?auto_135791 ?auto_135793 ) ) ( not ( = ?auto_135791 ?auto_135794 ) ) ( not ( = ?auto_135792 ?auto_135793 ) ) ( not ( = ?auto_135792 ?auto_135794 ) ) ( not ( = ?auto_135793 ?auto_135794 ) ) ( not ( = ?auto_135790 ?auto_135795 ) ) ( not ( = ?auto_135791 ?auto_135795 ) ) ( not ( = ?auto_135792 ?auto_135795 ) ) ( not ( = ?auto_135793 ?auto_135795 ) ) ( not ( = ?auto_135794 ?auto_135795 ) ) ( not ( = ?auto_135796 ?auto_135797 ) ) ( not ( = ?auto_135796 ?auto_135795 ) ) ( not ( = ?auto_135796 ?auto_135794 ) ) ( not ( = ?auto_135796 ?auto_135793 ) ) ( not ( = ?auto_135797 ?auto_135795 ) ) ( not ( = ?auto_135797 ?auto_135794 ) ) ( not ( = ?auto_135797 ?auto_135793 ) ) ( not ( = ?auto_135790 ?auto_135796 ) ) ( not ( = ?auto_135790 ?auto_135797 ) ) ( not ( = ?auto_135791 ?auto_135796 ) ) ( not ( = ?auto_135791 ?auto_135797 ) ) ( not ( = ?auto_135792 ?auto_135796 ) ) ( not ( = ?auto_135792 ?auto_135797 ) ) ( ON ?auto_135790 ?auto_135798 ) ( not ( = ?auto_135790 ?auto_135798 ) ) ( not ( = ?auto_135791 ?auto_135798 ) ) ( not ( = ?auto_135792 ?auto_135798 ) ) ( not ( = ?auto_135793 ?auto_135798 ) ) ( not ( = ?auto_135794 ?auto_135798 ) ) ( not ( = ?auto_135795 ?auto_135798 ) ) ( not ( = ?auto_135796 ?auto_135798 ) ) ( not ( = ?auto_135797 ?auto_135798 ) ) ( ON ?auto_135791 ?auto_135790 ) ( ON-TABLE ?auto_135798 ) ( ON ?auto_135792 ?auto_135791 ) ( ON ?auto_135793 ?auto_135792 ) ( ON ?auto_135794 ?auto_135793 ) ( ON ?auto_135795 ?auto_135794 ) ( ON ?auto_135797 ?auto_135795 ) ( CLEAR ?auto_135797 ) ( HOLDING ?auto_135796 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135796 )
      ( MAKE-5PILE ?auto_135790 ?auto_135791 ?auto_135792 ?auto_135793 ?auto_135794 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135799 - BLOCK
      ?auto_135800 - BLOCK
      ?auto_135801 - BLOCK
      ?auto_135802 - BLOCK
      ?auto_135803 - BLOCK
    )
    :vars
    (
      ?auto_135804 - BLOCK
      ?auto_135806 - BLOCK
      ?auto_135805 - BLOCK
      ?auto_135807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_135799 ?auto_135800 ) ) ( not ( = ?auto_135799 ?auto_135801 ) ) ( not ( = ?auto_135799 ?auto_135802 ) ) ( not ( = ?auto_135799 ?auto_135803 ) ) ( not ( = ?auto_135800 ?auto_135801 ) ) ( not ( = ?auto_135800 ?auto_135802 ) ) ( not ( = ?auto_135800 ?auto_135803 ) ) ( not ( = ?auto_135801 ?auto_135802 ) ) ( not ( = ?auto_135801 ?auto_135803 ) ) ( not ( = ?auto_135802 ?auto_135803 ) ) ( not ( = ?auto_135799 ?auto_135804 ) ) ( not ( = ?auto_135800 ?auto_135804 ) ) ( not ( = ?auto_135801 ?auto_135804 ) ) ( not ( = ?auto_135802 ?auto_135804 ) ) ( not ( = ?auto_135803 ?auto_135804 ) ) ( not ( = ?auto_135806 ?auto_135805 ) ) ( not ( = ?auto_135806 ?auto_135804 ) ) ( not ( = ?auto_135806 ?auto_135803 ) ) ( not ( = ?auto_135806 ?auto_135802 ) ) ( not ( = ?auto_135805 ?auto_135804 ) ) ( not ( = ?auto_135805 ?auto_135803 ) ) ( not ( = ?auto_135805 ?auto_135802 ) ) ( not ( = ?auto_135799 ?auto_135806 ) ) ( not ( = ?auto_135799 ?auto_135805 ) ) ( not ( = ?auto_135800 ?auto_135806 ) ) ( not ( = ?auto_135800 ?auto_135805 ) ) ( not ( = ?auto_135801 ?auto_135806 ) ) ( not ( = ?auto_135801 ?auto_135805 ) ) ( ON ?auto_135799 ?auto_135807 ) ( not ( = ?auto_135799 ?auto_135807 ) ) ( not ( = ?auto_135800 ?auto_135807 ) ) ( not ( = ?auto_135801 ?auto_135807 ) ) ( not ( = ?auto_135802 ?auto_135807 ) ) ( not ( = ?auto_135803 ?auto_135807 ) ) ( not ( = ?auto_135804 ?auto_135807 ) ) ( not ( = ?auto_135806 ?auto_135807 ) ) ( not ( = ?auto_135805 ?auto_135807 ) ) ( ON ?auto_135800 ?auto_135799 ) ( ON-TABLE ?auto_135807 ) ( ON ?auto_135801 ?auto_135800 ) ( ON ?auto_135802 ?auto_135801 ) ( ON ?auto_135803 ?auto_135802 ) ( ON ?auto_135804 ?auto_135803 ) ( ON ?auto_135805 ?auto_135804 ) ( ON ?auto_135806 ?auto_135805 ) ( CLEAR ?auto_135806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135807 ?auto_135799 ?auto_135800 ?auto_135801 ?auto_135802 ?auto_135803 ?auto_135804 ?auto_135805 )
      ( MAKE-5PILE ?auto_135799 ?auto_135800 ?auto_135801 ?auto_135802 ?auto_135803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135810 - BLOCK
      ?auto_135811 - BLOCK
    )
    :vars
    (
      ?auto_135812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135812 ?auto_135811 ) ( CLEAR ?auto_135812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135810 ) ( ON ?auto_135811 ?auto_135810 ) ( not ( = ?auto_135810 ?auto_135811 ) ) ( not ( = ?auto_135810 ?auto_135812 ) ) ( not ( = ?auto_135811 ?auto_135812 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135812 ?auto_135811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135813 - BLOCK
      ?auto_135814 - BLOCK
    )
    :vars
    (
      ?auto_135815 - BLOCK
      ?auto_135816 - BLOCK
      ?auto_135817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135815 ?auto_135814 ) ( CLEAR ?auto_135815 ) ( ON-TABLE ?auto_135813 ) ( ON ?auto_135814 ?auto_135813 ) ( not ( = ?auto_135813 ?auto_135814 ) ) ( not ( = ?auto_135813 ?auto_135815 ) ) ( not ( = ?auto_135814 ?auto_135815 ) ) ( HOLDING ?auto_135816 ) ( CLEAR ?auto_135817 ) ( not ( = ?auto_135813 ?auto_135816 ) ) ( not ( = ?auto_135813 ?auto_135817 ) ) ( not ( = ?auto_135814 ?auto_135816 ) ) ( not ( = ?auto_135814 ?auto_135817 ) ) ( not ( = ?auto_135815 ?auto_135816 ) ) ( not ( = ?auto_135815 ?auto_135817 ) ) ( not ( = ?auto_135816 ?auto_135817 ) ) )
    :subtasks
    ( ( !STACK ?auto_135816 ?auto_135817 )
      ( MAKE-2PILE ?auto_135813 ?auto_135814 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135818 - BLOCK
      ?auto_135819 - BLOCK
    )
    :vars
    (
      ?auto_135822 - BLOCK
      ?auto_135821 - BLOCK
      ?auto_135820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135822 ?auto_135819 ) ( ON-TABLE ?auto_135818 ) ( ON ?auto_135819 ?auto_135818 ) ( not ( = ?auto_135818 ?auto_135819 ) ) ( not ( = ?auto_135818 ?auto_135822 ) ) ( not ( = ?auto_135819 ?auto_135822 ) ) ( CLEAR ?auto_135821 ) ( not ( = ?auto_135818 ?auto_135820 ) ) ( not ( = ?auto_135818 ?auto_135821 ) ) ( not ( = ?auto_135819 ?auto_135820 ) ) ( not ( = ?auto_135819 ?auto_135821 ) ) ( not ( = ?auto_135822 ?auto_135820 ) ) ( not ( = ?auto_135822 ?auto_135821 ) ) ( not ( = ?auto_135820 ?auto_135821 ) ) ( ON ?auto_135820 ?auto_135822 ) ( CLEAR ?auto_135820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135818 ?auto_135819 ?auto_135822 )
      ( MAKE-2PILE ?auto_135818 ?auto_135819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135823 - BLOCK
      ?auto_135824 - BLOCK
    )
    :vars
    (
      ?auto_135826 - BLOCK
      ?auto_135825 - BLOCK
      ?auto_135827 - BLOCK
      ?auto_135830 - BLOCK
      ?auto_135828 - BLOCK
      ?auto_135829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135826 ?auto_135824 ) ( ON-TABLE ?auto_135823 ) ( ON ?auto_135824 ?auto_135823 ) ( not ( = ?auto_135823 ?auto_135824 ) ) ( not ( = ?auto_135823 ?auto_135826 ) ) ( not ( = ?auto_135824 ?auto_135826 ) ) ( not ( = ?auto_135823 ?auto_135825 ) ) ( not ( = ?auto_135823 ?auto_135827 ) ) ( not ( = ?auto_135824 ?auto_135825 ) ) ( not ( = ?auto_135824 ?auto_135827 ) ) ( not ( = ?auto_135826 ?auto_135825 ) ) ( not ( = ?auto_135826 ?auto_135827 ) ) ( not ( = ?auto_135825 ?auto_135827 ) ) ( ON ?auto_135825 ?auto_135826 ) ( CLEAR ?auto_135825 ) ( HOLDING ?auto_135827 ) ( CLEAR ?auto_135830 ) ( ON-TABLE ?auto_135828 ) ( ON ?auto_135829 ?auto_135828 ) ( ON ?auto_135830 ?auto_135829 ) ( not ( = ?auto_135828 ?auto_135829 ) ) ( not ( = ?auto_135828 ?auto_135830 ) ) ( not ( = ?auto_135828 ?auto_135827 ) ) ( not ( = ?auto_135829 ?auto_135830 ) ) ( not ( = ?auto_135829 ?auto_135827 ) ) ( not ( = ?auto_135830 ?auto_135827 ) ) ( not ( = ?auto_135823 ?auto_135830 ) ) ( not ( = ?auto_135823 ?auto_135828 ) ) ( not ( = ?auto_135823 ?auto_135829 ) ) ( not ( = ?auto_135824 ?auto_135830 ) ) ( not ( = ?auto_135824 ?auto_135828 ) ) ( not ( = ?auto_135824 ?auto_135829 ) ) ( not ( = ?auto_135826 ?auto_135830 ) ) ( not ( = ?auto_135826 ?auto_135828 ) ) ( not ( = ?auto_135826 ?auto_135829 ) ) ( not ( = ?auto_135825 ?auto_135830 ) ) ( not ( = ?auto_135825 ?auto_135828 ) ) ( not ( = ?auto_135825 ?auto_135829 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135828 ?auto_135829 ?auto_135830 ?auto_135827 )
      ( MAKE-2PILE ?auto_135823 ?auto_135824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135831 - BLOCK
      ?auto_135832 - BLOCK
    )
    :vars
    (
      ?auto_135835 - BLOCK
      ?auto_135834 - BLOCK
      ?auto_135836 - BLOCK
      ?auto_135838 - BLOCK
      ?auto_135833 - BLOCK
      ?auto_135837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135835 ?auto_135832 ) ( ON-TABLE ?auto_135831 ) ( ON ?auto_135832 ?auto_135831 ) ( not ( = ?auto_135831 ?auto_135832 ) ) ( not ( = ?auto_135831 ?auto_135835 ) ) ( not ( = ?auto_135832 ?auto_135835 ) ) ( not ( = ?auto_135831 ?auto_135834 ) ) ( not ( = ?auto_135831 ?auto_135836 ) ) ( not ( = ?auto_135832 ?auto_135834 ) ) ( not ( = ?auto_135832 ?auto_135836 ) ) ( not ( = ?auto_135835 ?auto_135834 ) ) ( not ( = ?auto_135835 ?auto_135836 ) ) ( not ( = ?auto_135834 ?auto_135836 ) ) ( ON ?auto_135834 ?auto_135835 ) ( CLEAR ?auto_135838 ) ( ON-TABLE ?auto_135833 ) ( ON ?auto_135837 ?auto_135833 ) ( ON ?auto_135838 ?auto_135837 ) ( not ( = ?auto_135833 ?auto_135837 ) ) ( not ( = ?auto_135833 ?auto_135838 ) ) ( not ( = ?auto_135833 ?auto_135836 ) ) ( not ( = ?auto_135837 ?auto_135838 ) ) ( not ( = ?auto_135837 ?auto_135836 ) ) ( not ( = ?auto_135838 ?auto_135836 ) ) ( not ( = ?auto_135831 ?auto_135838 ) ) ( not ( = ?auto_135831 ?auto_135833 ) ) ( not ( = ?auto_135831 ?auto_135837 ) ) ( not ( = ?auto_135832 ?auto_135838 ) ) ( not ( = ?auto_135832 ?auto_135833 ) ) ( not ( = ?auto_135832 ?auto_135837 ) ) ( not ( = ?auto_135835 ?auto_135838 ) ) ( not ( = ?auto_135835 ?auto_135833 ) ) ( not ( = ?auto_135835 ?auto_135837 ) ) ( not ( = ?auto_135834 ?auto_135838 ) ) ( not ( = ?auto_135834 ?auto_135833 ) ) ( not ( = ?auto_135834 ?auto_135837 ) ) ( ON ?auto_135836 ?auto_135834 ) ( CLEAR ?auto_135836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135831 ?auto_135832 ?auto_135835 ?auto_135834 )
      ( MAKE-2PILE ?auto_135831 ?auto_135832 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135839 - BLOCK
      ?auto_135840 - BLOCK
    )
    :vars
    (
      ?auto_135844 - BLOCK
      ?auto_135846 - BLOCK
      ?auto_135845 - BLOCK
      ?auto_135842 - BLOCK
      ?auto_135841 - BLOCK
      ?auto_135843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135844 ?auto_135840 ) ( ON-TABLE ?auto_135839 ) ( ON ?auto_135840 ?auto_135839 ) ( not ( = ?auto_135839 ?auto_135840 ) ) ( not ( = ?auto_135839 ?auto_135844 ) ) ( not ( = ?auto_135840 ?auto_135844 ) ) ( not ( = ?auto_135839 ?auto_135846 ) ) ( not ( = ?auto_135839 ?auto_135845 ) ) ( not ( = ?auto_135840 ?auto_135846 ) ) ( not ( = ?auto_135840 ?auto_135845 ) ) ( not ( = ?auto_135844 ?auto_135846 ) ) ( not ( = ?auto_135844 ?auto_135845 ) ) ( not ( = ?auto_135846 ?auto_135845 ) ) ( ON ?auto_135846 ?auto_135844 ) ( ON-TABLE ?auto_135842 ) ( ON ?auto_135841 ?auto_135842 ) ( not ( = ?auto_135842 ?auto_135841 ) ) ( not ( = ?auto_135842 ?auto_135843 ) ) ( not ( = ?auto_135842 ?auto_135845 ) ) ( not ( = ?auto_135841 ?auto_135843 ) ) ( not ( = ?auto_135841 ?auto_135845 ) ) ( not ( = ?auto_135843 ?auto_135845 ) ) ( not ( = ?auto_135839 ?auto_135843 ) ) ( not ( = ?auto_135839 ?auto_135842 ) ) ( not ( = ?auto_135839 ?auto_135841 ) ) ( not ( = ?auto_135840 ?auto_135843 ) ) ( not ( = ?auto_135840 ?auto_135842 ) ) ( not ( = ?auto_135840 ?auto_135841 ) ) ( not ( = ?auto_135844 ?auto_135843 ) ) ( not ( = ?auto_135844 ?auto_135842 ) ) ( not ( = ?auto_135844 ?auto_135841 ) ) ( not ( = ?auto_135846 ?auto_135843 ) ) ( not ( = ?auto_135846 ?auto_135842 ) ) ( not ( = ?auto_135846 ?auto_135841 ) ) ( ON ?auto_135845 ?auto_135846 ) ( CLEAR ?auto_135845 ) ( HOLDING ?auto_135843 ) ( CLEAR ?auto_135841 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135842 ?auto_135841 ?auto_135843 )
      ( MAKE-2PILE ?auto_135839 ?auto_135840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135847 - BLOCK
      ?auto_135848 - BLOCK
    )
    :vars
    (
      ?auto_135851 - BLOCK
      ?auto_135850 - BLOCK
      ?auto_135854 - BLOCK
      ?auto_135852 - BLOCK
      ?auto_135849 - BLOCK
      ?auto_135853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135851 ?auto_135848 ) ( ON-TABLE ?auto_135847 ) ( ON ?auto_135848 ?auto_135847 ) ( not ( = ?auto_135847 ?auto_135848 ) ) ( not ( = ?auto_135847 ?auto_135851 ) ) ( not ( = ?auto_135848 ?auto_135851 ) ) ( not ( = ?auto_135847 ?auto_135850 ) ) ( not ( = ?auto_135847 ?auto_135854 ) ) ( not ( = ?auto_135848 ?auto_135850 ) ) ( not ( = ?auto_135848 ?auto_135854 ) ) ( not ( = ?auto_135851 ?auto_135850 ) ) ( not ( = ?auto_135851 ?auto_135854 ) ) ( not ( = ?auto_135850 ?auto_135854 ) ) ( ON ?auto_135850 ?auto_135851 ) ( ON-TABLE ?auto_135852 ) ( ON ?auto_135849 ?auto_135852 ) ( not ( = ?auto_135852 ?auto_135849 ) ) ( not ( = ?auto_135852 ?auto_135853 ) ) ( not ( = ?auto_135852 ?auto_135854 ) ) ( not ( = ?auto_135849 ?auto_135853 ) ) ( not ( = ?auto_135849 ?auto_135854 ) ) ( not ( = ?auto_135853 ?auto_135854 ) ) ( not ( = ?auto_135847 ?auto_135853 ) ) ( not ( = ?auto_135847 ?auto_135852 ) ) ( not ( = ?auto_135847 ?auto_135849 ) ) ( not ( = ?auto_135848 ?auto_135853 ) ) ( not ( = ?auto_135848 ?auto_135852 ) ) ( not ( = ?auto_135848 ?auto_135849 ) ) ( not ( = ?auto_135851 ?auto_135853 ) ) ( not ( = ?auto_135851 ?auto_135852 ) ) ( not ( = ?auto_135851 ?auto_135849 ) ) ( not ( = ?auto_135850 ?auto_135853 ) ) ( not ( = ?auto_135850 ?auto_135852 ) ) ( not ( = ?auto_135850 ?auto_135849 ) ) ( ON ?auto_135854 ?auto_135850 ) ( CLEAR ?auto_135849 ) ( ON ?auto_135853 ?auto_135854 ) ( CLEAR ?auto_135853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135847 ?auto_135848 ?auto_135851 ?auto_135850 ?auto_135854 )
      ( MAKE-2PILE ?auto_135847 ?auto_135848 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135855 - BLOCK
      ?auto_135856 - BLOCK
    )
    :vars
    (
      ?auto_135859 - BLOCK
      ?auto_135862 - BLOCK
      ?auto_135861 - BLOCK
      ?auto_135858 - BLOCK
      ?auto_135860 - BLOCK
      ?auto_135857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135859 ?auto_135856 ) ( ON-TABLE ?auto_135855 ) ( ON ?auto_135856 ?auto_135855 ) ( not ( = ?auto_135855 ?auto_135856 ) ) ( not ( = ?auto_135855 ?auto_135859 ) ) ( not ( = ?auto_135856 ?auto_135859 ) ) ( not ( = ?auto_135855 ?auto_135862 ) ) ( not ( = ?auto_135855 ?auto_135861 ) ) ( not ( = ?auto_135856 ?auto_135862 ) ) ( not ( = ?auto_135856 ?auto_135861 ) ) ( not ( = ?auto_135859 ?auto_135862 ) ) ( not ( = ?auto_135859 ?auto_135861 ) ) ( not ( = ?auto_135862 ?auto_135861 ) ) ( ON ?auto_135862 ?auto_135859 ) ( ON-TABLE ?auto_135858 ) ( not ( = ?auto_135858 ?auto_135860 ) ) ( not ( = ?auto_135858 ?auto_135857 ) ) ( not ( = ?auto_135858 ?auto_135861 ) ) ( not ( = ?auto_135860 ?auto_135857 ) ) ( not ( = ?auto_135860 ?auto_135861 ) ) ( not ( = ?auto_135857 ?auto_135861 ) ) ( not ( = ?auto_135855 ?auto_135857 ) ) ( not ( = ?auto_135855 ?auto_135858 ) ) ( not ( = ?auto_135855 ?auto_135860 ) ) ( not ( = ?auto_135856 ?auto_135857 ) ) ( not ( = ?auto_135856 ?auto_135858 ) ) ( not ( = ?auto_135856 ?auto_135860 ) ) ( not ( = ?auto_135859 ?auto_135857 ) ) ( not ( = ?auto_135859 ?auto_135858 ) ) ( not ( = ?auto_135859 ?auto_135860 ) ) ( not ( = ?auto_135862 ?auto_135857 ) ) ( not ( = ?auto_135862 ?auto_135858 ) ) ( not ( = ?auto_135862 ?auto_135860 ) ) ( ON ?auto_135861 ?auto_135862 ) ( ON ?auto_135857 ?auto_135861 ) ( CLEAR ?auto_135857 ) ( HOLDING ?auto_135860 ) ( CLEAR ?auto_135858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135858 ?auto_135860 )
      ( MAKE-2PILE ?auto_135855 ?auto_135856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135863 - BLOCK
      ?auto_135864 - BLOCK
    )
    :vars
    (
      ?auto_135870 - BLOCK
      ?auto_135867 - BLOCK
      ?auto_135865 - BLOCK
      ?auto_135868 - BLOCK
      ?auto_135869 - BLOCK
      ?auto_135866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135870 ?auto_135864 ) ( ON-TABLE ?auto_135863 ) ( ON ?auto_135864 ?auto_135863 ) ( not ( = ?auto_135863 ?auto_135864 ) ) ( not ( = ?auto_135863 ?auto_135870 ) ) ( not ( = ?auto_135864 ?auto_135870 ) ) ( not ( = ?auto_135863 ?auto_135867 ) ) ( not ( = ?auto_135863 ?auto_135865 ) ) ( not ( = ?auto_135864 ?auto_135867 ) ) ( not ( = ?auto_135864 ?auto_135865 ) ) ( not ( = ?auto_135870 ?auto_135867 ) ) ( not ( = ?auto_135870 ?auto_135865 ) ) ( not ( = ?auto_135867 ?auto_135865 ) ) ( ON ?auto_135867 ?auto_135870 ) ( ON-TABLE ?auto_135868 ) ( not ( = ?auto_135868 ?auto_135869 ) ) ( not ( = ?auto_135868 ?auto_135866 ) ) ( not ( = ?auto_135868 ?auto_135865 ) ) ( not ( = ?auto_135869 ?auto_135866 ) ) ( not ( = ?auto_135869 ?auto_135865 ) ) ( not ( = ?auto_135866 ?auto_135865 ) ) ( not ( = ?auto_135863 ?auto_135866 ) ) ( not ( = ?auto_135863 ?auto_135868 ) ) ( not ( = ?auto_135863 ?auto_135869 ) ) ( not ( = ?auto_135864 ?auto_135866 ) ) ( not ( = ?auto_135864 ?auto_135868 ) ) ( not ( = ?auto_135864 ?auto_135869 ) ) ( not ( = ?auto_135870 ?auto_135866 ) ) ( not ( = ?auto_135870 ?auto_135868 ) ) ( not ( = ?auto_135870 ?auto_135869 ) ) ( not ( = ?auto_135867 ?auto_135866 ) ) ( not ( = ?auto_135867 ?auto_135868 ) ) ( not ( = ?auto_135867 ?auto_135869 ) ) ( ON ?auto_135865 ?auto_135867 ) ( ON ?auto_135866 ?auto_135865 ) ( CLEAR ?auto_135868 ) ( ON ?auto_135869 ?auto_135866 ) ( CLEAR ?auto_135869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135863 ?auto_135864 ?auto_135870 ?auto_135867 ?auto_135865 ?auto_135866 )
      ( MAKE-2PILE ?auto_135863 ?auto_135864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135871 - BLOCK
      ?auto_135872 - BLOCK
    )
    :vars
    (
      ?auto_135876 - BLOCK
      ?auto_135878 - BLOCK
      ?auto_135877 - BLOCK
      ?auto_135874 - BLOCK
      ?auto_135873 - BLOCK
      ?auto_135875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135876 ?auto_135872 ) ( ON-TABLE ?auto_135871 ) ( ON ?auto_135872 ?auto_135871 ) ( not ( = ?auto_135871 ?auto_135872 ) ) ( not ( = ?auto_135871 ?auto_135876 ) ) ( not ( = ?auto_135872 ?auto_135876 ) ) ( not ( = ?auto_135871 ?auto_135878 ) ) ( not ( = ?auto_135871 ?auto_135877 ) ) ( not ( = ?auto_135872 ?auto_135878 ) ) ( not ( = ?auto_135872 ?auto_135877 ) ) ( not ( = ?auto_135876 ?auto_135878 ) ) ( not ( = ?auto_135876 ?auto_135877 ) ) ( not ( = ?auto_135878 ?auto_135877 ) ) ( ON ?auto_135878 ?auto_135876 ) ( not ( = ?auto_135874 ?auto_135873 ) ) ( not ( = ?auto_135874 ?auto_135875 ) ) ( not ( = ?auto_135874 ?auto_135877 ) ) ( not ( = ?auto_135873 ?auto_135875 ) ) ( not ( = ?auto_135873 ?auto_135877 ) ) ( not ( = ?auto_135875 ?auto_135877 ) ) ( not ( = ?auto_135871 ?auto_135875 ) ) ( not ( = ?auto_135871 ?auto_135874 ) ) ( not ( = ?auto_135871 ?auto_135873 ) ) ( not ( = ?auto_135872 ?auto_135875 ) ) ( not ( = ?auto_135872 ?auto_135874 ) ) ( not ( = ?auto_135872 ?auto_135873 ) ) ( not ( = ?auto_135876 ?auto_135875 ) ) ( not ( = ?auto_135876 ?auto_135874 ) ) ( not ( = ?auto_135876 ?auto_135873 ) ) ( not ( = ?auto_135878 ?auto_135875 ) ) ( not ( = ?auto_135878 ?auto_135874 ) ) ( not ( = ?auto_135878 ?auto_135873 ) ) ( ON ?auto_135877 ?auto_135878 ) ( ON ?auto_135875 ?auto_135877 ) ( ON ?auto_135873 ?auto_135875 ) ( CLEAR ?auto_135873 ) ( HOLDING ?auto_135874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135874 )
      ( MAKE-2PILE ?auto_135871 ?auto_135872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135879 - BLOCK
      ?auto_135880 - BLOCK
    )
    :vars
    (
      ?auto_135883 - BLOCK
      ?auto_135881 - BLOCK
      ?auto_135882 - BLOCK
      ?auto_135886 - BLOCK
      ?auto_135884 - BLOCK
      ?auto_135885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135883 ?auto_135880 ) ( ON-TABLE ?auto_135879 ) ( ON ?auto_135880 ?auto_135879 ) ( not ( = ?auto_135879 ?auto_135880 ) ) ( not ( = ?auto_135879 ?auto_135883 ) ) ( not ( = ?auto_135880 ?auto_135883 ) ) ( not ( = ?auto_135879 ?auto_135881 ) ) ( not ( = ?auto_135879 ?auto_135882 ) ) ( not ( = ?auto_135880 ?auto_135881 ) ) ( not ( = ?auto_135880 ?auto_135882 ) ) ( not ( = ?auto_135883 ?auto_135881 ) ) ( not ( = ?auto_135883 ?auto_135882 ) ) ( not ( = ?auto_135881 ?auto_135882 ) ) ( ON ?auto_135881 ?auto_135883 ) ( not ( = ?auto_135886 ?auto_135884 ) ) ( not ( = ?auto_135886 ?auto_135885 ) ) ( not ( = ?auto_135886 ?auto_135882 ) ) ( not ( = ?auto_135884 ?auto_135885 ) ) ( not ( = ?auto_135884 ?auto_135882 ) ) ( not ( = ?auto_135885 ?auto_135882 ) ) ( not ( = ?auto_135879 ?auto_135885 ) ) ( not ( = ?auto_135879 ?auto_135886 ) ) ( not ( = ?auto_135879 ?auto_135884 ) ) ( not ( = ?auto_135880 ?auto_135885 ) ) ( not ( = ?auto_135880 ?auto_135886 ) ) ( not ( = ?auto_135880 ?auto_135884 ) ) ( not ( = ?auto_135883 ?auto_135885 ) ) ( not ( = ?auto_135883 ?auto_135886 ) ) ( not ( = ?auto_135883 ?auto_135884 ) ) ( not ( = ?auto_135881 ?auto_135885 ) ) ( not ( = ?auto_135881 ?auto_135886 ) ) ( not ( = ?auto_135881 ?auto_135884 ) ) ( ON ?auto_135882 ?auto_135881 ) ( ON ?auto_135885 ?auto_135882 ) ( ON ?auto_135884 ?auto_135885 ) ( ON ?auto_135886 ?auto_135884 ) ( CLEAR ?auto_135886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135879 ?auto_135880 ?auto_135883 ?auto_135881 ?auto_135882 ?auto_135885 ?auto_135884 )
      ( MAKE-2PILE ?auto_135879 ?auto_135880 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135887 - BLOCK
      ?auto_135888 - BLOCK
    )
    :vars
    (
      ?auto_135889 - BLOCK
      ?auto_135891 - BLOCK
      ?auto_135892 - BLOCK
      ?auto_135894 - BLOCK
      ?auto_135893 - BLOCK
      ?auto_135890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135889 ?auto_135888 ) ( ON-TABLE ?auto_135887 ) ( ON ?auto_135888 ?auto_135887 ) ( not ( = ?auto_135887 ?auto_135888 ) ) ( not ( = ?auto_135887 ?auto_135889 ) ) ( not ( = ?auto_135888 ?auto_135889 ) ) ( not ( = ?auto_135887 ?auto_135891 ) ) ( not ( = ?auto_135887 ?auto_135892 ) ) ( not ( = ?auto_135888 ?auto_135891 ) ) ( not ( = ?auto_135888 ?auto_135892 ) ) ( not ( = ?auto_135889 ?auto_135891 ) ) ( not ( = ?auto_135889 ?auto_135892 ) ) ( not ( = ?auto_135891 ?auto_135892 ) ) ( ON ?auto_135891 ?auto_135889 ) ( not ( = ?auto_135894 ?auto_135893 ) ) ( not ( = ?auto_135894 ?auto_135890 ) ) ( not ( = ?auto_135894 ?auto_135892 ) ) ( not ( = ?auto_135893 ?auto_135890 ) ) ( not ( = ?auto_135893 ?auto_135892 ) ) ( not ( = ?auto_135890 ?auto_135892 ) ) ( not ( = ?auto_135887 ?auto_135890 ) ) ( not ( = ?auto_135887 ?auto_135894 ) ) ( not ( = ?auto_135887 ?auto_135893 ) ) ( not ( = ?auto_135888 ?auto_135890 ) ) ( not ( = ?auto_135888 ?auto_135894 ) ) ( not ( = ?auto_135888 ?auto_135893 ) ) ( not ( = ?auto_135889 ?auto_135890 ) ) ( not ( = ?auto_135889 ?auto_135894 ) ) ( not ( = ?auto_135889 ?auto_135893 ) ) ( not ( = ?auto_135891 ?auto_135890 ) ) ( not ( = ?auto_135891 ?auto_135894 ) ) ( not ( = ?auto_135891 ?auto_135893 ) ) ( ON ?auto_135892 ?auto_135891 ) ( ON ?auto_135890 ?auto_135892 ) ( ON ?auto_135893 ?auto_135890 ) ( HOLDING ?auto_135894 ) ( CLEAR ?auto_135893 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135887 ?auto_135888 ?auto_135889 ?auto_135891 ?auto_135892 ?auto_135890 ?auto_135893 ?auto_135894 )
      ( MAKE-2PILE ?auto_135887 ?auto_135888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135895 - BLOCK
      ?auto_135896 - BLOCK
    )
    :vars
    (
      ?auto_135899 - BLOCK
      ?auto_135901 - BLOCK
      ?auto_135902 - BLOCK
      ?auto_135897 - BLOCK
      ?auto_135900 - BLOCK
      ?auto_135898 - BLOCK
      ?auto_135903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135899 ?auto_135896 ) ( ON-TABLE ?auto_135895 ) ( ON ?auto_135896 ?auto_135895 ) ( not ( = ?auto_135895 ?auto_135896 ) ) ( not ( = ?auto_135895 ?auto_135899 ) ) ( not ( = ?auto_135896 ?auto_135899 ) ) ( not ( = ?auto_135895 ?auto_135901 ) ) ( not ( = ?auto_135895 ?auto_135902 ) ) ( not ( = ?auto_135896 ?auto_135901 ) ) ( not ( = ?auto_135896 ?auto_135902 ) ) ( not ( = ?auto_135899 ?auto_135901 ) ) ( not ( = ?auto_135899 ?auto_135902 ) ) ( not ( = ?auto_135901 ?auto_135902 ) ) ( ON ?auto_135901 ?auto_135899 ) ( not ( = ?auto_135897 ?auto_135900 ) ) ( not ( = ?auto_135897 ?auto_135898 ) ) ( not ( = ?auto_135897 ?auto_135902 ) ) ( not ( = ?auto_135900 ?auto_135898 ) ) ( not ( = ?auto_135900 ?auto_135902 ) ) ( not ( = ?auto_135898 ?auto_135902 ) ) ( not ( = ?auto_135895 ?auto_135898 ) ) ( not ( = ?auto_135895 ?auto_135897 ) ) ( not ( = ?auto_135895 ?auto_135900 ) ) ( not ( = ?auto_135896 ?auto_135898 ) ) ( not ( = ?auto_135896 ?auto_135897 ) ) ( not ( = ?auto_135896 ?auto_135900 ) ) ( not ( = ?auto_135899 ?auto_135898 ) ) ( not ( = ?auto_135899 ?auto_135897 ) ) ( not ( = ?auto_135899 ?auto_135900 ) ) ( not ( = ?auto_135901 ?auto_135898 ) ) ( not ( = ?auto_135901 ?auto_135897 ) ) ( not ( = ?auto_135901 ?auto_135900 ) ) ( ON ?auto_135902 ?auto_135901 ) ( ON ?auto_135898 ?auto_135902 ) ( ON ?auto_135900 ?auto_135898 ) ( CLEAR ?auto_135900 ) ( ON ?auto_135897 ?auto_135903 ) ( CLEAR ?auto_135897 ) ( HAND-EMPTY ) ( not ( = ?auto_135895 ?auto_135903 ) ) ( not ( = ?auto_135896 ?auto_135903 ) ) ( not ( = ?auto_135899 ?auto_135903 ) ) ( not ( = ?auto_135901 ?auto_135903 ) ) ( not ( = ?auto_135902 ?auto_135903 ) ) ( not ( = ?auto_135897 ?auto_135903 ) ) ( not ( = ?auto_135900 ?auto_135903 ) ) ( not ( = ?auto_135898 ?auto_135903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135897 ?auto_135903 )
      ( MAKE-2PILE ?auto_135895 ?auto_135896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135904 - BLOCK
      ?auto_135905 - BLOCK
    )
    :vars
    (
      ?auto_135906 - BLOCK
      ?auto_135909 - BLOCK
      ?auto_135907 - BLOCK
      ?auto_135908 - BLOCK
      ?auto_135912 - BLOCK
      ?auto_135910 - BLOCK
      ?auto_135911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135906 ?auto_135905 ) ( ON-TABLE ?auto_135904 ) ( ON ?auto_135905 ?auto_135904 ) ( not ( = ?auto_135904 ?auto_135905 ) ) ( not ( = ?auto_135904 ?auto_135906 ) ) ( not ( = ?auto_135905 ?auto_135906 ) ) ( not ( = ?auto_135904 ?auto_135909 ) ) ( not ( = ?auto_135904 ?auto_135907 ) ) ( not ( = ?auto_135905 ?auto_135909 ) ) ( not ( = ?auto_135905 ?auto_135907 ) ) ( not ( = ?auto_135906 ?auto_135909 ) ) ( not ( = ?auto_135906 ?auto_135907 ) ) ( not ( = ?auto_135909 ?auto_135907 ) ) ( ON ?auto_135909 ?auto_135906 ) ( not ( = ?auto_135908 ?auto_135912 ) ) ( not ( = ?auto_135908 ?auto_135910 ) ) ( not ( = ?auto_135908 ?auto_135907 ) ) ( not ( = ?auto_135912 ?auto_135910 ) ) ( not ( = ?auto_135912 ?auto_135907 ) ) ( not ( = ?auto_135910 ?auto_135907 ) ) ( not ( = ?auto_135904 ?auto_135910 ) ) ( not ( = ?auto_135904 ?auto_135908 ) ) ( not ( = ?auto_135904 ?auto_135912 ) ) ( not ( = ?auto_135905 ?auto_135910 ) ) ( not ( = ?auto_135905 ?auto_135908 ) ) ( not ( = ?auto_135905 ?auto_135912 ) ) ( not ( = ?auto_135906 ?auto_135910 ) ) ( not ( = ?auto_135906 ?auto_135908 ) ) ( not ( = ?auto_135906 ?auto_135912 ) ) ( not ( = ?auto_135909 ?auto_135910 ) ) ( not ( = ?auto_135909 ?auto_135908 ) ) ( not ( = ?auto_135909 ?auto_135912 ) ) ( ON ?auto_135907 ?auto_135909 ) ( ON ?auto_135910 ?auto_135907 ) ( ON ?auto_135908 ?auto_135911 ) ( CLEAR ?auto_135908 ) ( not ( = ?auto_135904 ?auto_135911 ) ) ( not ( = ?auto_135905 ?auto_135911 ) ) ( not ( = ?auto_135906 ?auto_135911 ) ) ( not ( = ?auto_135909 ?auto_135911 ) ) ( not ( = ?auto_135907 ?auto_135911 ) ) ( not ( = ?auto_135908 ?auto_135911 ) ) ( not ( = ?auto_135912 ?auto_135911 ) ) ( not ( = ?auto_135910 ?auto_135911 ) ) ( HOLDING ?auto_135912 ) ( CLEAR ?auto_135910 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135904 ?auto_135905 ?auto_135906 ?auto_135909 ?auto_135907 ?auto_135910 ?auto_135912 )
      ( MAKE-2PILE ?auto_135904 ?auto_135905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135913 - BLOCK
      ?auto_135914 - BLOCK
    )
    :vars
    (
      ?auto_135915 - BLOCK
      ?auto_135920 - BLOCK
      ?auto_135918 - BLOCK
      ?auto_135916 - BLOCK
      ?auto_135917 - BLOCK
      ?auto_135919 - BLOCK
      ?auto_135921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135915 ?auto_135914 ) ( ON-TABLE ?auto_135913 ) ( ON ?auto_135914 ?auto_135913 ) ( not ( = ?auto_135913 ?auto_135914 ) ) ( not ( = ?auto_135913 ?auto_135915 ) ) ( not ( = ?auto_135914 ?auto_135915 ) ) ( not ( = ?auto_135913 ?auto_135920 ) ) ( not ( = ?auto_135913 ?auto_135918 ) ) ( not ( = ?auto_135914 ?auto_135920 ) ) ( not ( = ?auto_135914 ?auto_135918 ) ) ( not ( = ?auto_135915 ?auto_135920 ) ) ( not ( = ?auto_135915 ?auto_135918 ) ) ( not ( = ?auto_135920 ?auto_135918 ) ) ( ON ?auto_135920 ?auto_135915 ) ( not ( = ?auto_135916 ?auto_135917 ) ) ( not ( = ?auto_135916 ?auto_135919 ) ) ( not ( = ?auto_135916 ?auto_135918 ) ) ( not ( = ?auto_135917 ?auto_135919 ) ) ( not ( = ?auto_135917 ?auto_135918 ) ) ( not ( = ?auto_135919 ?auto_135918 ) ) ( not ( = ?auto_135913 ?auto_135919 ) ) ( not ( = ?auto_135913 ?auto_135916 ) ) ( not ( = ?auto_135913 ?auto_135917 ) ) ( not ( = ?auto_135914 ?auto_135919 ) ) ( not ( = ?auto_135914 ?auto_135916 ) ) ( not ( = ?auto_135914 ?auto_135917 ) ) ( not ( = ?auto_135915 ?auto_135919 ) ) ( not ( = ?auto_135915 ?auto_135916 ) ) ( not ( = ?auto_135915 ?auto_135917 ) ) ( not ( = ?auto_135920 ?auto_135919 ) ) ( not ( = ?auto_135920 ?auto_135916 ) ) ( not ( = ?auto_135920 ?auto_135917 ) ) ( ON ?auto_135918 ?auto_135920 ) ( ON ?auto_135919 ?auto_135918 ) ( ON ?auto_135916 ?auto_135921 ) ( not ( = ?auto_135913 ?auto_135921 ) ) ( not ( = ?auto_135914 ?auto_135921 ) ) ( not ( = ?auto_135915 ?auto_135921 ) ) ( not ( = ?auto_135920 ?auto_135921 ) ) ( not ( = ?auto_135918 ?auto_135921 ) ) ( not ( = ?auto_135916 ?auto_135921 ) ) ( not ( = ?auto_135917 ?auto_135921 ) ) ( not ( = ?auto_135919 ?auto_135921 ) ) ( CLEAR ?auto_135919 ) ( ON ?auto_135917 ?auto_135916 ) ( CLEAR ?auto_135917 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135921 ?auto_135916 )
      ( MAKE-2PILE ?auto_135913 ?auto_135914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135922 - BLOCK
      ?auto_135923 - BLOCK
    )
    :vars
    (
      ?auto_135924 - BLOCK
      ?auto_135928 - BLOCK
      ?auto_135930 - BLOCK
      ?auto_135929 - BLOCK
      ?auto_135925 - BLOCK
      ?auto_135927 - BLOCK
      ?auto_135926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135924 ?auto_135923 ) ( ON-TABLE ?auto_135922 ) ( ON ?auto_135923 ?auto_135922 ) ( not ( = ?auto_135922 ?auto_135923 ) ) ( not ( = ?auto_135922 ?auto_135924 ) ) ( not ( = ?auto_135923 ?auto_135924 ) ) ( not ( = ?auto_135922 ?auto_135928 ) ) ( not ( = ?auto_135922 ?auto_135930 ) ) ( not ( = ?auto_135923 ?auto_135928 ) ) ( not ( = ?auto_135923 ?auto_135930 ) ) ( not ( = ?auto_135924 ?auto_135928 ) ) ( not ( = ?auto_135924 ?auto_135930 ) ) ( not ( = ?auto_135928 ?auto_135930 ) ) ( ON ?auto_135928 ?auto_135924 ) ( not ( = ?auto_135929 ?auto_135925 ) ) ( not ( = ?auto_135929 ?auto_135927 ) ) ( not ( = ?auto_135929 ?auto_135930 ) ) ( not ( = ?auto_135925 ?auto_135927 ) ) ( not ( = ?auto_135925 ?auto_135930 ) ) ( not ( = ?auto_135927 ?auto_135930 ) ) ( not ( = ?auto_135922 ?auto_135927 ) ) ( not ( = ?auto_135922 ?auto_135929 ) ) ( not ( = ?auto_135922 ?auto_135925 ) ) ( not ( = ?auto_135923 ?auto_135927 ) ) ( not ( = ?auto_135923 ?auto_135929 ) ) ( not ( = ?auto_135923 ?auto_135925 ) ) ( not ( = ?auto_135924 ?auto_135927 ) ) ( not ( = ?auto_135924 ?auto_135929 ) ) ( not ( = ?auto_135924 ?auto_135925 ) ) ( not ( = ?auto_135928 ?auto_135927 ) ) ( not ( = ?auto_135928 ?auto_135929 ) ) ( not ( = ?auto_135928 ?auto_135925 ) ) ( ON ?auto_135930 ?auto_135928 ) ( ON ?auto_135929 ?auto_135926 ) ( not ( = ?auto_135922 ?auto_135926 ) ) ( not ( = ?auto_135923 ?auto_135926 ) ) ( not ( = ?auto_135924 ?auto_135926 ) ) ( not ( = ?auto_135928 ?auto_135926 ) ) ( not ( = ?auto_135930 ?auto_135926 ) ) ( not ( = ?auto_135929 ?auto_135926 ) ) ( not ( = ?auto_135925 ?auto_135926 ) ) ( not ( = ?auto_135927 ?auto_135926 ) ) ( ON ?auto_135925 ?auto_135929 ) ( CLEAR ?auto_135925 ) ( ON-TABLE ?auto_135926 ) ( HOLDING ?auto_135927 ) ( CLEAR ?auto_135930 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135922 ?auto_135923 ?auto_135924 ?auto_135928 ?auto_135930 ?auto_135927 )
      ( MAKE-2PILE ?auto_135922 ?auto_135923 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135931 - BLOCK
      ?auto_135932 - BLOCK
    )
    :vars
    (
      ?auto_135938 - BLOCK
      ?auto_135936 - BLOCK
      ?auto_135935 - BLOCK
      ?auto_135934 - BLOCK
      ?auto_135939 - BLOCK
      ?auto_135933 - BLOCK
      ?auto_135937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135938 ?auto_135932 ) ( ON-TABLE ?auto_135931 ) ( ON ?auto_135932 ?auto_135931 ) ( not ( = ?auto_135931 ?auto_135932 ) ) ( not ( = ?auto_135931 ?auto_135938 ) ) ( not ( = ?auto_135932 ?auto_135938 ) ) ( not ( = ?auto_135931 ?auto_135936 ) ) ( not ( = ?auto_135931 ?auto_135935 ) ) ( not ( = ?auto_135932 ?auto_135936 ) ) ( not ( = ?auto_135932 ?auto_135935 ) ) ( not ( = ?auto_135938 ?auto_135936 ) ) ( not ( = ?auto_135938 ?auto_135935 ) ) ( not ( = ?auto_135936 ?auto_135935 ) ) ( ON ?auto_135936 ?auto_135938 ) ( not ( = ?auto_135934 ?auto_135939 ) ) ( not ( = ?auto_135934 ?auto_135933 ) ) ( not ( = ?auto_135934 ?auto_135935 ) ) ( not ( = ?auto_135939 ?auto_135933 ) ) ( not ( = ?auto_135939 ?auto_135935 ) ) ( not ( = ?auto_135933 ?auto_135935 ) ) ( not ( = ?auto_135931 ?auto_135933 ) ) ( not ( = ?auto_135931 ?auto_135934 ) ) ( not ( = ?auto_135931 ?auto_135939 ) ) ( not ( = ?auto_135932 ?auto_135933 ) ) ( not ( = ?auto_135932 ?auto_135934 ) ) ( not ( = ?auto_135932 ?auto_135939 ) ) ( not ( = ?auto_135938 ?auto_135933 ) ) ( not ( = ?auto_135938 ?auto_135934 ) ) ( not ( = ?auto_135938 ?auto_135939 ) ) ( not ( = ?auto_135936 ?auto_135933 ) ) ( not ( = ?auto_135936 ?auto_135934 ) ) ( not ( = ?auto_135936 ?auto_135939 ) ) ( ON ?auto_135935 ?auto_135936 ) ( ON ?auto_135934 ?auto_135937 ) ( not ( = ?auto_135931 ?auto_135937 ) ) ( not ( = ?auto_135932 ?auto_135937 ) ) ( not ( = ?auto_135938 ?auto_135937 ) ) ( not ( = ?auto_135936 ?auto_135937 ) ) ( not ( = ?auto_135935 ?auto_135937 ) ) ( not ( = ?auto_135934 ?auto_135937 ) ) ( not ( = ?auto_135939 ?auto_135937 ) ) ( not ( = ?auto_135933 ?auto_135937 ) ) ( ON ?auto_135939 ?auto_135934 ) ( ON-TABLE ?auto_135937 ) ( CLEAR ?auto_135935 ) ( ON ?auto_135933 ?auto_135939 ) ( CLEAR ?auto_135933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135937 ?auto_135934 ?auto_135939 )
      ( MAKE-2PILE ?auto_135931 ?auto_135932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135940 - BLOCK
      ?auto_135941 - BLOCK
    )
    :vars
    (
      ?auto_135942 - BLOCK
      ?auto_135945 - BLOCK
      ?auto_135944 - BLOCK
      ?auto_135948 - BLOCK
      ?auto_135947 - BLOCK
      ?auto_135946 - BLOCK
      ?auto_135943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135942 ?auto_135941 ) ( ON-TABLE ?auto_135940 ) ( ON ?auto_135941 ?auto_135940 ) ( not ( = ?auto_135940 ?auto_135941 ) ) ( not ( = ?auto_135940 ?auto_135942 ) ) ( not ( = ?auto_135941 ?auto_135942 ) ) ( not ( = ?auto_135940 ?auto_135945 ) ) ( not ( = ?auto_135940 ?auto_135944 ) ) ( not ( = ?auto_135941 ?auto_135945 ) ) ( not ( = ?auto_135941 ?auto_135944 ) ) ( not ( = ?auto_135942 ?auto_135945 ) ) ( not ( = ?auto_135942 ?auto_135944 ) ) ( not ( = ?auto_135945 ?auto_135944 ) ) ( ON ?auto_135945 ?auto_135942 ) ( not ( = ?auto_135948 ?auto_135947 ) ) ( not ( = ?auto_135948 ?auto_135946 ) ) ( not ( = ?auto_135948 ?auto_135944 ) ) ( not ( = ?auto_135947 ?auto_135946 ) ) ( not ( = ?auto_135947 ?auto_135944 ) ) ( not ( = ?auto_135946 ?auto_135944 ) ) ( not ( = ?auto_135940 ?auto_135946 ) ) ( not ( = ?auto_135940 ?auto_135948 ) ) ( not ( = ?auto_135940 ?auto_135947 ) ) ( not ( = ?auto_135941 ?auto_135946 ) ) ( not ( = ?auto_135941 ?auto_135948 ) ) ( not ( = ?auto_135941 ?auto_135947 ) ) ( not ( = ?auto_135942 ?auto_135946 ) ) ( not ( = ?auto_135942 ?auto_135948 ) ) ( not ( = ?auto_135942 ?auto_135947 ) ) ( not ( = ?auto_135945 ?auto_135946 ) ) ( not ( = ?auto_135945 ?auto_135948 ) ) ( not ( = ?auto_135945 ?auto_135947 ) ) ( ON ?auto_135948 ?auto_135943 ) ( not ( = ?auto_135940 ?auto_135943 ) ) ( not ( = ?auto_135941 ?auto_135943 ) ) ( not ( = ?auto_135942 ?auto_135943 ) ) ( not ( = ?auto_135945 ?auto_135943 ) ) ( not ( = ?auto_135944 ?auto_135943 ) ) ( not ( = ?auto_135948 ?auto_135943 ) ) ( not ( = ?auto_135947 ?auto_135943 ) ) ( not ( = ?auto_135946 ?auto_135943 ) ) ( ON ?auto_135947 ?auto_135948 ) ( ON-TABLE ?auto_135943 ) ( ON ?auto_135946 ?auto_135947 ) ( CLEAR ?auto_135946 ) ( HOLDING ?auto_135944 ) ( CLEAR ?auto_135945 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135940 ?auto_135941 ?auto_135942 ?auto_135945 ?auto_135944 )
      ( MAKE-2PILE ?auto_135940 ?auto_135941 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135949 - BLOCK
      ?auto_135950 - BLOCK
    )
    :vars
    (
      ?auto_135954 - BLOCK
      ?auto_135951 - BLOCK
      ?auto_135952 - BLOCK
      ?auto_135956 - BLOCK
      ?auto_135953 - BLOCK
      ?auto_135955 - BLOCK
      ?auto_135957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135954 ?auto_135950 ) ( ON-TABLE ?auto_135949 ) ( ON ?auto_135950 ?auto_135949 ) ( not ( = ?auto_135949 ?auto_135950 ) ) ( not ( = ?auto_135949 ?auto_135954 ) ) ( not ( = ?auto_135950 ?auto_135954 ) ) ( not ( = ?auto_135949 ?auto_135951 ) ) ( not ( = ?auto_135949 ?auto_135952 ) ) ( not ( = ?auto_135950 ?auto_135951 ) ) ( not ( = ?auto_135950 ?auto_135952 ) ) ( not ( = ?auto_135954 ?auto_135951 ) ) ( not ( = ?auto_135954 ?auto_135952 ) ) ( not ( = ?auto_135951 ?auto_135952 ) ) ( ON ?auto_135951 ?auto_135954 ) ( not ( = ?auto_135956 ?auto_135953 ) ) ( not ( = ?auto_135956 ?auto_135955 ) ) ( not ( = ?auto_135956 ?auto_135952 ) ) ( not ( = ?auto_135953 ?auto_135955 ) ) ( not ( = ?auto_135953 ?auto_135952 ) ) ( not ( = ?auto_135955 ?auto_135952 ) ) ( not ( = ?auto_135949 ?auto_135955 ) ) ( not ( = ?auto_135949 ?auto_135956 ) ) ( not ( = ?auto_135949 ?auto_135953 ) ) ( not ( = ?auto_135950 ?auto_135955 ) ) ( not ( = ?auto_135950 ?auto_135956 ) ) ( not ( = ?auto_135950 ?auto_135953 ) ) ( not ( = ?auto_135954 ?auto_135955 ) ) ( not ( = ?auto_135954 ?auto_135956 ) ) ( not ( = ?auto_135954 ?auto_135953 ) ) ( not ( = ?auto_135951 ?auto_135955 ) ) ( not ( = ?auto_135951 ?auto_135956 ) ) ( not ( = ?auto_135951 ?auto_135953 ) ) ( ON ?auto_135956 ?auto_135957 ) ( not ( = ?auto_135949 ?auto_135957 ) ) ( not ( = ?auto_135950 ?auto_135957 ) ) ( not ( = ?auto_135954 ?auto_135957 ) ) ( not ( = ?auto_135951 ?auto_135957 ) ) ( not ( = ?auto_135952 ?auto_135957 ) ) ( not ( = ?auto_135956 ?auto_135957 ) ) ( not ( = ?auto_135953 ?auto_135957 ) ) ( not ( = ?auto_135955 ?auto_135957 ) ) ( ON ?auto_135953 ?auto_135956 ) ( ON-TABLE ?auto_135957 ) ( ON ?auto_135955 ?auto_135953 ) ( CLEAR ?auto_135951 ) ( ON ?auto_135952 ?auto_135955 ) ( CLEAR ?auto_135952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135957 ?auto_135956 ?auto_135953 ?auto_135955 )
      ( MAKE-2PILE ?auto_135949 ?auto_135950 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135958 - BLOCK
      ?auto_135959 - BLOCK
    )
    :vars
    (
      ?auto_135960 - BLOCK
      ?auto_135966 - BLOCK
      ?auto_135962 - BLOCK
      ?auto_135965 - BLOCK
      ?auto_135961 - BLOCK
      ?auto_135963 - BLOCK
      ?auto_135964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135960 ?auto_135959 ) ( ON-TABLE ?auto_135958 ) ( ON ?auto_135959 ?auto_135958 ) ( not ( = ?auto_135958 ?auto_135959 ) ) ( not ( = ?auto_135958 ?auto_135960 ) ) ( not ( = ?auto_135959 ?auto_135960 ) ) ( not ( = ?auto_135958 ?auto_135966 ) ) ( not ( = ?auto_135958 ?auto_135962 ) ) ( not ( = ?auto_135959 ?auto_135966 ) ) ( not ( = ?auto_135959 ?auto_135962 ) ) ( not ( = ?auto_135960 ?auto_135966 ) ) ( not ( = ?auto_135960 ?auto_135962 ) ) ( not ( = ?auto_135966 ?auto_135962 ) ) ( not ( = ?auto_135965 ?auto_135961 ) ) ( not ( = ?auto_135965 ?auto_135963 ) ) ( not ( = ?auto_135965 ?auto_135962 ) ) ( not ( = ?auto_135961 ?auto_135963 ) ) ( not ( = ?auto_135961 ?auto_135962 ) ) ( not ( = ?auto_135963 ?auto_135962 ) ) ( not ( = ?auto_135958 ?auto_135963 ) ) ( not ( = ?auto_135958 ?auto_135965 ) ) ( not ( = ?auto_135958 ?auto_135961 ) ) ( not ( = ?auto_135959 ?auto_135963 ) ) ( not ( = ?auto_135959 ?auto_135965 ) ) ( not ( = ?auto_135959 ?auto_135961 ) ) ( not ( = ?auto_135960 ?auto_135963 ) ) ( not ( = ?auto_135960 ?auto_135965 ) ) ( not ( = ?auto_135960 ?auto_135961 ) ) ( not ( = ?auto_135966 ?auto_135963 ) ) ( not ( = ?auto_135966 ?auto_135965 ) ) ( not ( = ?auto_135966 ?auto_135961 ) ) ( ON ?auto_135965 ?auto_135964 ) ( not ( = ?auto_135958 ?auto_135964 ) ) ( not ( = ?auto_135959 ?auto_135964 ) ) ( not ( = ?auto_135960 ?auto_135964 ) ) ( not ( = ?auto_135966 ?auto_135964 ) ) ( not ( = ?auto_135962 ?auto_135964 ) ) ( not ( = ?auto_135965 ?auto_135964 ) ) ( not ( = ?auto_135961 ?auto_135964 ) ) ( not ( = ?auto_135963 ?auto_135964 ) ) ( ON ?auto_135961 ?auto_135965 ) ( ON-TABLE ?auto_135964 ) ( ON ?auto_135963 ?auto_135961 ) ( ON ?auto_135962 ?auto_135963 ) ( CLEAR ?auto_135962 ) ( HOLDING ?auto_135966 ) ( CLEAR ?auto_135960 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135958 ?auto_135959 ?auto_135960 ?auto_135966 )
      ( MAKE-2PILE ?auto_135958 ?auto_135959 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135967 - BLOCK
      ?auto_135968 - BLOCK
    )
    :vars
    (
      ?auto_135971 - BLOCK
      ?auto_135969 - BLOCK
      ?auto_135970 - BLOCK
      ?auto_135972 - BLOCK
      ?auto_135974 - BLOCK
      ?auto_135973 - BLOCK
      ?auto_135975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135971 ?auto_135968 ) ( ON-TABLE ?auto_135967 ) ( ON ?auto_135968 ?auto_135967 ) ( not ( = ?auto_135967 ?auto_135968 ) ) ( not ( = ?auto_135967 ?auto_135971 ) ) ( not ( = ?auto_135968 ?auto_135971 ) ) ( not ( = ?auto_135967 ?auto_135969 ) ) ( not ( = ?auto_135967 ?auto_135970 ) ) ( not ( = ?auto_135968 ?auto_135969 ) ) ( not ( = ?auto_135968 ?auto_135970 ) ) ( not ( = ?auto_135971 ?auto_135969 ) ) ( not ( = ?auto_135971 ?auto_135970 ) ) ( not ( = ?auto_135969 ?auto_135970 ) ) ( not ( = ?auto_135972 ?auto_135974 ) ) ( not ( = ?auto_135972 ?auto_135973 ) ) ( not ( = ?auto_135972 ?auto_135970 ) ) ( not ( = ?auto_135974 ?auto_135973 ) ) ( not ( = ?auto_135974 ?auto_135970 ) ) ( not ( = ?auto_135973 ?auto_135970 ) ) ( not ( = ?auto_135967 ?auto_135973 ) ) ( not ( = ?auto_135967 ?auto_135972 ) ) ( not ( = ?auto_135967 ?auto_135974 ) ) ( not ( = ?auto_135968 ?auto_135973 ) ) ( not ( = ?auto_135968 ?auto_135972 ) ) ( not ( = ?auto_135968 ?auto_135974 ) ) ( not ( = ?auto_135971 ?auto_135973 ) ) ( not ( = ?auto_135971 ?auto_135972 ) ) ( not ( = ?auto_135971 ?auto_135974 ) ) ( not ( = ?auto_135969 ?auto_135973 ) ) ( not ( = ?auto_135969 ?auto_135972 ) ) ( not ( = ?auto_135969 ?auto_135974 ) ) ( ON ?auto_135972 ?auto_135975 ) ( not ( = ?auto_135967 ?auto_135975 ) ) ( not ( = ?auto_135968 ?auto_135975 ) ) ( not ( = ?auto_135971 ?auto_135975 ) ) ( not ( = ?auto_135969 ?auto_135975 ) ) ( not ( = ?auto_135970 ?auto_135975 ) ) ( not ( = ?auto_135972 ?auto_135975 ) ) ( not ( = ?auto_135974 ?auto_135975 ) ) ( not ( = ?auto_135973 ?auto_135975 ) ) ( ON ?auto_135974 ?auto_135972 ) ( ON-TABLE ?auto_135975 ) ( ON ?auto_135973 ?auto_135974 ) ( ON ?auto_135970 ?auto_135973 ) ( CLEAR ?auto_135971 ) ( ON ?auto_135969 ?auto_135970 ) ( CLEAR ?auto_135969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135975 ?auto_135972 ?auto_135974 ?auto_135973 ?auto_135970 )
      ( MAKE-2PILE ?auto_135967 ?auto_135968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_135994 - BLOCK
      ?auto_135995 - BLOCK
    )
    :vars
    (
      ?auto_135998 - BLOCK
      ?auto_135996 - BLOCK
      ?auto_136000 - BLOCK
      ?auto_135999 - BLOCK
      ?auto_135997 - BLOCK
      ?auto_136001 - BLOCK
      ?auto_136002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_135994 ) ( not ( = ?auto_135994 ?auto_135995 ) ) ( not ( = ?auto_135994 ?auto_135998 ) ) ( not ( = ?auto_135995 ?auto_135998 ) ) ( not ( = ?auto_135994 ?auto_135996 ) ) ( not ( = ?auto_135994 ?auto_136000 ) ) ( not ( = ?auto_135995 ?auto_135996 ) ) ( not ( = ?auto_135995 ?auto_136000 ) ) ( not ( = ?auto_135998 ?auto_135996 ) ) ( not ( = ?auto_135998 ?auto_136000 ) ) ( not ( = ?auto_135996 ?auto_136000 ) ) ( not ( = ?auto_135999 ?auto_135997 ) ) ( not ( = ?auto_135999 ?auto_136001 ) ) ( not ( = ?auto_135999 ?auto_136000 ) ) ( not ( = ?auto_135997 ?auto_136001 ) ) ( not ( = ?auto_135997 ?auto_136000 ) ) ( not ( = ?auto_136001 ?auto_136000 ) ) ( not ( = ?auto_135994 ?auto_136001 ) ) ( not ( = ?auto_135994 ?auto_135999 ) ) ( not ( = ?auto_135994 ?auto_135997 ) ) ( not ( = ?auto_135995 ?auto_136001 ) ) ( not ( = ?auto_135995 ?auto_135999 ) ) ( not ( = ?auto_135995 ?auto_135997 ) ) ( not ( = ?auto_135998 ?auto_136001 ) ) ( not ( = ?auto_135998 ?auto_135999 ) ) ( not ( = ?auto_135998 ?auto_135997 ) ) ( not ( = ?auto_135996 ?auto_136001 ) ) ( not ( = ?auto_135996 ?auto_135999 ) ) ( not ( = ?auto_135996 ?auto_135997 ) ) ( ON ?auto_135999 ?auto_136002 ) ( not ( = ?auto_135994 ?auto_136002 ) ) ( not ( = ?auto_135995 ?auto_136002 ) ) ( not ( = ?auto_135998 ?auto_136002 ) ) ( not ( = ?auto_135996 ?auto_136002 ) ) ( not ( = ?auto_136000 ?auto_136002 ) ) ( not ( = ?auto_135999 ?auto_136002 ) ) ( not ( = ?auto_135997 ?auto_136002 ) ) ( not ( = ?auto_136001 ?auto_136002 ) ) ( ON ?auto_135997 ?auto_135999 ) ( ON-TABLE ?auto_136002 ) ( ON ?auto_136001 ?auto_135997 ) ( ON ?auto_136000 ?auto_136001 ) ( ON ?auto_135996 ?auto_136000 ) ( ON ?auto_135998 ?auto_135996 ) ( CLEAR ?auto_135998 ) ( HOLDING ?auto_135995 ) ( CLEAR ?auto_135994 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135994 ?auto_135995 ?auto_135998 )
      ( MAKE-2PILE ?auto_135994 ?auto_135995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136003 - BLOCK
      ?auto_136004 - BLOCK
    )
    :vars
    (
      ?auto_136005 - BLOCK
      ?auto_136009 - BLOCK
      ?auto_136010 - BLOCK
      ?auto_136008 - BLOCK
      ?auto_136007 - BLOCK
      ?auto_136011 - BLOCK
      ?auto_136006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136003 ) ( not ( = ?auto_136003 ?auto_136004 ) ) ( not ( = ?auto_136003 ?auto_136005 ) ) ( not ( = ?auto_136004 ?auto_136005 ) ) ( not ( = ?auto_136003 ?auto_136009 ) ) ( not ( = ?auto_136003 ?auto_136010 ) ) ( not ( = ?auto_136004 ?auto_136009 ) ) ( not ( = ?auto_136004 ?auto_136010 ) ) ( not ( = ?auto_136005 ?auto_136009 ) ) ( not ( = ?auto_136005 ?auto_136010 ) ) ( not ( = ?auto_136009 ?auto_136010 ) ) ( not ( = ?auto_136008 ?auto_136007 ) ) ( not ( = ?auto_136008 ?auto_136011 ) ) ( not ( = ?auto_136008 ?auto_136010 ) ) ( not ( = ?auto_136007 ?auto_136011 ) ) ( not ( = ?auto_136007 ?auto_136010 ) ) ( not ( = ?auto_136011 ?auto_136010 ) ) ( not ( = ?auto_136003 ?auto_136011 ) ) ( not ( = ?auto_136003 ?auto_136008 ) ) ( not ( = ?auto_136003 ?auto_136007 ) ) ( not ( = ?auto_136004 ?auto_136011 ) ) ( not ( = ?auto_136004 ?auto_136008 ) ) ( not ( = ?auto_136004 ?auto_136007 ) ) ( not ( = ?auto_136005 ?auto_136011 ) ) ( not ( = ?auto_136005 ?auto_136008 ) ) ( not ( = ?auto_136005 ?auto_136007 ) ) ( not ( = ?auto_136009 ?auto_136011 ) ) ( not ( = ?auto_136009 ?auto_136008 ) ) ( not ( = ?auto_136009 ?auto_136007 ) ) ( ON ?auto_136008 ?auto_136006 ) ( not ( = ?auto_136003 ?auto_136006 ) ) ( not ( = ?auto_136004 ?auto_136006 ) ) ( not ( = ?auto_136005 ?auto_136006 ) ) ( not ( = ?auto_136009 ?auto_136006 ) ) ( not ( = ?auto_136010 ?auto_136006 ) ) ( not ( = ?auto_136008 ?auto_136006 ) ) ( not ( = ?auto_136007 ?auto_136006 ) ) ( not ( = ?auto_136011 ?auto_136006 ) ) ( ON ?auto_136007 ?auto_136008 ) ( ON-TABLE ?auto_136006 ) ( ON ?auto_136011 ?auto_136007 ) ( ON ?auto_136010 ?auto_136011 ) ( ON ?auto_136009 ?auto_136010 ) ( ON ?auto_136005 ?auto_136009 ) ( CLEAR ?auto_136003 ) ( ON ?auto_136004 ?auto_136005 ) ( CLEAR ?auto_136004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136006 ?auto_136008 ?auto_136007 ?auto_136011 ?auto_136010 ?auto_136009 ?auto_136005 )
      ( MAKE-2PILE ?auto_136003 ?auto_136004 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136012 - BLOCK
      ?auto_136013 - BLOCK
    )
    :vars
    (
      ?auto_136014 - BLOCK
      ?auto_136015 - BLOCK
      ?auto_136016 - BLOCK
      ?auto_136019 - BLOCK
      ?auto_136018 - BLOCK
      ?auto_136020 - BLOCK
      ?auto_136017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136012 ?auto_136013 ) ) ( not ( = ?auto_136012 ?auto_136014 ) ) ( not ( = ?auto_136013 ?auto_136014 ) ) ( not ( = ?auto_136012 ?auto_136015 ) ) ( not ( = ?auto_136012 ?auto_136016 ) ) ( not ( = ?auto_136013 ?auto_136015 ) ) ( not ( = ?auto_136013 ?auto_136016 ) ) ( not ( = ?auto_136014 ?auto_136015 ) ) ( not ( = ?auto_136014 ?auto_136016 ) ) ( not ( = ?auto_136015 ?auto_136016 ) ) ( not ( = ?auto_136019 ?auto_136018 ) ) ( not ( = ?auto_136019 ?auto_136020 ) ) ( not ( = ?auto_136019 ?auto_136016 ) ) ( not ( = ?auto_136018 ?auto_136020 ) ) ( not ( = ?auto_136018 ?auto_136016 ) ) ( not ( = ?auto_136020 ?auto_136016 ) ) ( not ( = ?auto_136012 ?auto_136020 ) ) ( not ( = ?auto_136012 ?auto_136019 ) ) ( not ( = ?auto_136012 ?auto_136018 ) ) ( not ( = ?auto_136013 ?auto_136020 ) ) ( not ( = ?auto_136013 ?auto_136019 ) ) ( not ( = ?auto_136013 ?auto_136018 ) ) ( not ( = ?auto_136014 ?auto_136020 ) ) ( not ( = ?auto_136014 ?auto_136019 ) ) ( not ( = ?auto_136014 ?auto_136018 ) ) ( not ( = ?auto_136015 ?auto_136020 ) ) ( not ( = ?auto_136015 ?auto_136019 ) ) ( not ( = ?auto_136015 ?auto_136018 ) ) ( ON ?auto_136019 ?auto_136017 ) ( not ( = ?auto_136012 ?auto_136017 ) ) ( not ( = ?auto_136013 ?auto_136017 ) ) ( not ( = ?auto_136014 ?auto_136017 ) ) ( not ( = ?auto_136015 ?auto_136017 ) ) ( not ( = ?auto_136016 ?auto_136017 ) ) ( not ( = ?auto_136019 ?auto_136017 ) ) ( not ( = ?auto_136018 ?auto_136017 ) ) ( not ( = ?auto_136020 ?auto_136017 ) ) ( ON ?auto_136018 ?auto_136019 ) ( ON-TABLE ?auto_136017 ) ( ON ?auto_136020 ?auto_136018 ) ( ON ?auto_136016 ?auto_136020 ) ( ON ?auto_136015 ?auto_136016 ) ( ON ?auto_136014 ?auto_136015 ) ( ON ?auto_136013 ?auto_136014 ) ( CLEAR ?auto_136013 ) ( HOLDING ?auto_136012 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136012 )
      ( MAKE-2PILE ?auto_136012 ?auto_136013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_136021 - BLOCK
      ?auto_136022 - BLOCK
    )
    :vars
    (
      ?auto_136024 - BLOCK
      ?auto_136023 - BLOCK
      ?auto_136029 - BLOCK
      ?auto_136025 - BLOCK
      ?auto_136027 - BLOCK
      ?auto_136026 - BLOCK
      ?auto_136028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136021 ?auto_136022 ) ) ( not ( = ?auto_136021 ?auto_136024 ) ) ( not ( = ?auto_136022 ?auto_136024 ) ) ( not ( = ?auto_136021 ?auto_136023 ) ) ( not ( = ?auto_136021 ?auto_136029 ) ) ( not ( = ?auto_136022 ?auto_136023 ) ) ( not ( = ?auto_136022 ?auto_136029 ) ) ( not ( = ?auto_136024 ?auto_136023 ) ) ( not ( = ?auto_136024 ?auto_136029 ) ) ( not ( = ?auto_136023 ?auto_136029 ) ) ( not ( = ?auto_136025 ?auto_136027 ) ) ( not ( = ?auto_136025 ?auto_136026 ) ) ( not ( = ?auto_136025 ?auto_136029 ) ) ( not ( = ?auto_136027 ?auto_136026 ) ) ( not ( = ?auto_136027 ?auto_136029 ) ) ( not ( = ?auto_136026 ?auto_136029 ) ) ( not ( = ?auto_136021 ?auto_136026 ) ) ( not ( = ?auto_136021 ?auto_136025 ) ) ( not ( = ?auto_136021 ?auto_136027 ) ) ( not ( = ?auto_136022 ?auto_136026 ) ) ( not ( = ?auto_136022 ?auto_136025 ) ) ( not ( = ?auto_136022 ?auto_136027 ) ) ( not ( = ?auto_136024 ?auto_136026 ) ) ( not ( = ?auto_136024 ?auto_136025 ) ) ( not ( = ?auto_136024 ?auto_136027 ) ) ( not ( = ?auto_136023 ?auto_136026 ) ) ( not ( = ?auto_136023 ?auto_136025 ) ) ( not ( = ?auto_136023 ?auto_136027 ) ) ( ON ?auto_136025 ?auto_136028 ) ( not ( = ?auto_136021 ?auto_136028 ) ) ( not ( = ?auto_136022 ?auto_136028 ) ) ( not ( = ?auto_136024 ?auto_136028 ) ) ( not ( = ?auto_136023 ?auto_136028 ) ) ( not ( = ?auto_136029 ?auto_136028 ) ) ( not ( = ?auto_136025 ?auto_136028 ) ) ( not ( = ?auto_136027 ?auto_136028 ) ) ( not ( = ?auto_136026 ?auto_136028 ) ) ( ON ?auto_136027 ?auto_136025 ) ( ON-TABLE ?auto_136028 ) ( ON ?auto_136026 ?auto_136027 ) ( ON ?auto_136029 ?auto_136026 ) ( ON ?auto_136023 ?auto_136029 ) ( ON ?auto_136024 ?auto_136023 ) ( ON ?auto_136022 ?auto_136024 ) ( ON ?auto_136021 ?auto_136022 ) ( CLEAR ?auto_136021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136028 ?auto_136025 ?auto_136027 ?auto_136026 ?auto_136029 ?auto_136023 ?auto_136024 ?auto_136022 )
      ( MAKE-2PILE ?auto_136021 ?auto_136022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136036 - BLOCK
      ?auto_136037 - BLOCK
      ?auto_136038 - BLOCK
      ?auto_136039 - BLOCK
      ?auto_136040 - BLOCK
      ?auto_136041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136041 ) ( CLEAR ?auto_136040 ) ( ON-TABLE ?auto_136036 ) ( ON ?auto_136037 ?auto_136036 ) ( ON ?auto_136038 ?auto_136037 ) ( ON ?auto_136039 ?auto_136038 ) ( ON ?auto_136040 ?auto_136039 ) ( not ( = ?auto_136036 ?auto_136037 ) ) ( not ( = ?auto_136036 ?auto_136038 ) ) ( not ( = ?auto_136036 ?auto_136039 ) ) ( not ( = ?auto_136036 ?auto_136040 ) ) ( not ( = ?auto_136036 ?auto_136041 ) ) ( not ( = ?auto_136037 ?auto_136038 ) ) ( not ( = ?auto_136037 ?auto_136039 ) ) ( not ( = ?auto_136037 ?auto_136040 ) ) ( not ( = ?auto_136037 ?auto_136041 ) ) ( not ( = ?auto_136038 ?auto_136039 ) ) ( not ( = ?auto_136038 ?auto_136040 ) ) ( not ( = ?auto_136038 ?auto_136041 ) ) ( not ( = ?auto_136039 ?auto_136040 ) ) ( not ( = ?auto_136039 ?auto_136041 ) ) ( not ( = ?auto_136040 ?auto_136041 ) ) )
    :subtasks
    ( ( !STACK ?auto_136041 ?auto_136040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136042 - BLOCK
      ?auto_136043 - BLOCK
      ?auto_136044 - BLOCK
      ?auto_136045 - BLOCK
      ?auto_136046 - BLOCK
      ?auto_136047 - BLOCK
    )
    :vars
    (
      ?auto_136048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136046 ) ( ON-TABLE ?auto_136042 ) ( ON ?auto_136043 ?auto_136042 ) ( ON ?auto_136044 ?auto_136043 ) ( ON ?auto_136045 ?auto_136044 ) ( ON ?auto_136046 ?auto_136045 ) ( not ( = ?auto_136042 ?auto_136043 ) ) ( not ( = ?auto_136042 ?auto_136044 ) ) ( not ( = ?auto_136042 ?auto_136045 ) ) ( not ( = ?auto_136042 ?auto_136046 ) ) ( not ( = ?auto_136042 ?auto_136047 ) ) ( not ( = ?auto_136043 ?auto_136044 ) ) ( not ( = ?auto_136043 ?auto_136045 ) ) ( not ( = ?auto_136043 ?auto_136046 ) ) ( not ( = ?auto_136043 ?auto_136047 ) ) ( not ( = ?auto_136044 ?auto_136045 ) ) ( not ( = ?auto_136044 ?auto_136046 ) ) ( not ( = ?auto_136044 ?auto_136047 ) ) ( not ( = ?auto_136045 ?auto_136046 ) ) ( not ( = ?auto_136045 ?auto_136047 ) ) ( not ( = ?auto_136046 ?auto_136047 ) ) ( ON ?auto_136047 ?auto_136048 ) ( CLEAR ?auto_136047 ) ( HAND-EMPTY ) ( not ( = ?auto_136042 ?auto_136048 ) ) ( not ( = ?auto_136043 ?auto_136048 ) ) ( not ( = ?auto_136044 ?auto_136048 ) ) ( not ( = ?auto_136045 ?auto_136048 ) ) ( not ( = ?auto_136046 ?auto_136048 ) ) ( not ( = ?auto_136047 ?auto_136048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136047 ?auto_136048 )
      ( MAKE-6PILE ?auto_136042 ?auto_136043 ?auto_136044 ?auto_136045 ?auto_136046 ?auto_136047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136049 - BLOCK
      ?auto_136050 - BLOCK
      ?auto_136051 - BLOCK
      ?auto_136052 - BLOCK
      ?auto_136053 - BLOCK
      ?auto_136054 - BLOCK
    )
    :vars
    (
      ?auto_136055 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136049 ) ( ON ?auto_136050 ?auto_136049 ) ( ON ?auto_136051 ?auto_136050 ) ( ON ?auto_136052 ?auto_136051 ) ( not ( = ?auto_136049 ?auto_136050 ) ) ( not ( = ?auto_136049 ?auto_136051 ) ) ( not ( = ?auto_136049 ?auto_136052 ) ) ( not ( = ?auto_136049 ?auto_136053 ) ) ( not ( = ?auto_136049 ?auto_136054 ) ) ( not ( = ?auto_136050 ?auto_136051 ) ) ( not ( = ?auto_136050 ?auto_136052 ) ) ( not ( = ?auto_136050 ?auto_136053 ) ) ( not ( = ?auto_136050 ?auto_136054 ) ) ( not ( = ?auto_136051 ?auto_136052 ) ) ( not ( = ?auto_136051 ?auto_136053 ) ) ( not ( = ?auto_136051 ?auto_136054 ) ) ( not ( = ?auto_136052 ?auto_136053 ) ) ( not ( = ?auto_136052 ?auto_136054 ) ) ( not ( = ?auto_136053 ?auto_136054 ) ) ( ON ?auto_136054 ?auto_136055 ) ( CLEAR ?auto_136054 ) ( not ( = ?auto_136049 ?auto_136055 ) ) ( not ( = ?auto_136050 ?auto_136055 ) ) ( not ( = ?auto_136051 ?auto_136055 ) ) ( not ( = ?auto_136052 ?auto_136055 ) ) ( not ( = ?auto_136053 ?auto_136055 ) ) ( not ( = ?auto_136054 ?auto_136055 ) ) ( HOLDING ?auto_136053 ) ( CLEAR ?auto_136052 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136049 ?auto_136050 ?auto_136051 ?auto_136052 ?auto_136053 )
      ( MAKE-6PILE ?auto_136049 ?auto_136050 ?auto_136051 ?auto_136052 ?auto_136053 ?auto_136054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136056 - BLOCK
      ?auto_136057 - BLOCK
      ?auto_136058 - BLOCK
      ?auto_136059 - BLOCK
      ?auto_136060 - BLOCK
      ?auto_136061 - BLOCK
    )
    :vars
    (
      ?auto_136062 - BLOCK
      ?auto_136063 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136056 ) ( ON ?auto_136057 ?auto_136056 ) ( ON ?auto_136058 ?auto_136057 ) ( ON ?auto_136059 ?auto_136058 ) ( not ( = ?auto_136056 ?auto_136057 ) ) ( not ( = ?auto_136056 ?auto_136058 ) ) ( not ( = ?auto_136056 ?auto_136059 ) ) ( not ( = ?auto_136056 ?auto_136060 ) ) ( not ( = ?auto_136056 ?auto_136061 ) ) ( not ( = ?auto_136057 ?auto_136058 ) ) ( not ( = ?auto_136057 ?auto_136059 ) ) ( not ( = ?auto_136057 ?auto_136060 ) ) ( not ( = ?auto_136057 ?auto_136061 ) ) ( not ( = ?auto_136058 ?auto_136059 ) ) ( not ( = ?auto_136058 ?auto_136060 ) ) ( not ( = ?auto_136058 ?auto_136061 ) ) ( not ( = ?auto_136059 ?auto_136060 ) ) ( not ( = ?auto_136059 ?auto_136061 ) ) ( not ( = ?auto_136060 ?auto_136061 ) ) ( ON ?auto_136061 ?auto_136062 ) ( not ( = ?auto_136056 ?auto_136062 ) ) ( not ( = ?auto_136057 ?auto_136062 ) ) ( not ( = ?auto_136058 ?auto_136062 ) ) ( not ( = ?auto_136059 ?auto_136062 ) ) ( not ( = ?auto_136060 ?auto_136062 ) ) ( not ( = ?auto_136061 ?auto_136062 ) ) ( CLEAR ?auto_136059 ) ( ON ?auto_136060 ?auto_136061 ) ( CLEAR ?auto_136060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136063 ) ( ON ?auto_136062 ?auto_136063 ) ( not ( = ?auto_136063 ?auto_136062 ) ) ( not ( = ?auto_136063 ?auto_136061 ) ) ( not ( = ?auto_136063 ?auto_136060 ) ) ( not ( = ?auto_136056 ?auto_136063 ) ) ( not ( = ?auto_136057 ?auto_136063 ) ) ( not ( = ?auto_136058 ?auto_136063 ) ) ( not ( = ?auto_136059 ?auto_136063 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136063 ?auto_136062 ?auto_136061 )
      ( MAKE-6PILE ?auto_136056 ?auto_136057 ?auto_136058 ?auto_136059 ?auto_136060 ?auto_136061 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136064 - BLOCK
      ?auto_136065 - BLOCK
      ?auto_136066 - BLOCK
      ?auto_136067 - BLOCK
      ?auto_136068 - BLOCK
      ?auto_136069 - BLOCK
    )
    :vars
    (
      ?auto_136071 - BLOCK
      ?auto_136070 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136064 ) ( ON ?auto_136065 ?auto_136064 ) ( ON ?auto_136066 ?auto_136065 ) ( not ( = ?auto_136064 ?auto_136065 ) ) ( not ( = ?auto_136064 ?auto_136066 ) ) ( not ( = ?auto_136064 ?auto_136067 ) ) ( not ( = ?auto_136064 ?auto_136068 ) ) ( not ( = ?auto_136064 ?auto_136069 ) ) ( not ( = ?auto_136065 ?auto_136066 ) ) ( not ( = ?auto_136065 ?auto_136067 ) ) ( not ( = ?auto_136065 ?auto_136068 ) ) ( not ( = ?auto_136065 ?auto_136069 ) ) ( not ( = ?auto_136066 ?auto_136067 ) ) ( not ( = ?auto_136066 ?auto_136068 ) ) ( not ( = ?auto_136066 ?auto_136069 ) ) ( not ( = ?auto_136067 ?auto_136068 ) ) ( not ( = ?auto_136067 ?auto_136069 ) ) ( not ( = ?auto_136068 ?auto_136069 ) ) ( ON ?auto_136069 ?auto_136071 ) ( not ( = ?auto_136064 ?auto_136071 ) ) ( not ( = ?auto_136065 ?auto_136071 ) ) ( not ( = ?auto_136066 ?auto_136071 ) ) ( not ( = ?auto_136067 ?auto_136071 ) ) ( not ( = ?auto_136068 ?auto_136071 ) ) ( not ( = ?auto_136069 ?auto_136071 ) ) ( ON ?auto_136068 ?auto_136069 ) ( CLEAR ?auto_136068 ) ( ON-TABLE ?auto_136070 ) ( ON ?auto_136071 ?auto_136070 ) ( not ( = ?auto_136070 ?auto_136071 ) ) ( not ( = ?auto_136070 ?auto_136069 ) ) ( not ( = ?auto_136070 ?auto_136068 ) ) ( not ( = ?auto_136064 ?auto_136070 ) ) ( not ( = ?auto_136065 ?auto_136070 ) ) ( not ( = ?auto_136066 ?auto_136070 ) ) ( not ( = ?auto_136067 ?auto_136070 ) ) ( HOLDING ?auto_136067 ) ( CLEAR ?auto_136066 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136064 ?auto_136065 ?auto_136066 ?auto_136067 )
      ( MAKE-6PILE ?auto_136064 ?auto_136065 ?auto_136066 ?auto_136067 ?auto_136068 ?auto_136069 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136072 - BLOCK
      ?auto_136073 - BLOCK
      ?auto_136074 - BLOCK
      ?auto_136075 - BLOCK
      ?auto_136076 - BLOCK
      ?auto_136077 - BLOCK
    )
    :vars
    (
      ?auto_136079 - BLOCK
      ?auto_136078 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136072 ) ( ON ?auto_136073 ?auto_136072 ) ( ON ?auto_136074 ?auto_136073 ) ( not ( = ?auto_136072 ?auto_136073 ) ) ( not ( = ?auto_136072 ?auto_136074 ) ) ( not ( = ?auto_136072 ?auto_136075 ) ) ( not ( = ?auto_136072 ?auto_136076 ) ) ( not ( = ?auto_136072 ?auto_136077 ) ) ( not ( = ?auto_136073 ?auto_136074 ) ) ( not ( = ?auto_136073 ?auto_136075 ) ) ( not ( = ?auto_136073 ?auto_136076 ) ) ( not ( = ?auto_136073 ?auto_136077 ) ) ( not ( = ?auto_136074 ?auto_136075 ) ) ( not ( = ?auto_136074 ?auto_136076 ) ) ( not ( = ?auto_136074 ?auto_136077 ) ) ( not ( = ?auto_136075 ?auto_136076 ) ) ( not ( = ?auto_136075 ?auto_136077 ) ) ( not ( = ?auto_136076 ?auto_136077 ) ) ( ON ?auto_136077 ?auto_136079 ) ( not ( = ?auto_136072 ?auto_136079 ) ) ( not ( = ?auto_136073 ?auto_136079 ) ) ( not ( = ?auto_136074 ?auto_136079 ) ) ( not ( = ?auto_136075 ?auto_136079 ) ) ( not ( = ?auto_136076 ?auto_136079 ) ) ( not ( = ?auto_136077 ?auto_136079 ) ) ( ON ?auto_136076 ?auto_136077 ) ( ON-TABLE ?auto_136078 ) ( ON ?auto_136079 ?auto_136078 ) ( not ( = ?auto_136078 ?auto_136079 ) ) ( not ( = ?auto_136078 ?auto_136077 ) ) ( not ( = ?auto_136078 ?auto_136076 ) ) ( not ( = ?auto_136072 ?auto_136078 ) ) ( not ( = ?auto_136073 ?auto_136078 ) ) ( not ( = ?auto_136074 ?auto_136078 ) ) ( not ( = ?auto_136075 ?auto_136078 ) ) ( CLEAR ?auto_136074 ) ( ON ?auto_136075 ?auto_136076 ) ( CLEAR ?auto_136075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136078 ?auto_136079 ?auto_136077 ?auto_136076 )
      ( MAKE-6PILE ?auto_136072 ?auto_136073 ?auto_136074 ?auto_136075 ?auto_136076 ?auto_136077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136080 - BLOCK
      ?auto_136081 - BLOCK
      ?auto_136082 - BLOCK
      ?auto_136083 - BLOCK
      ?auto_136084 - BLOCK
      ?auto_136085 - BLOCK
    )
    :vars
    (
      ?auto_136087 - BLOCK
      ?auto_136086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136080 ) ( ON ?auto_136081 ?auto_136080 ) ( not ( = ?auto_136080 ?auto_136081 ) ) ( not ( = ?auto_136080 ?auto_136082 ) ) ( not ( = ?auto_136080 ?auto_136083 ) ) ( not ( = ?auto_136080 ?auto_136084 ) ) ( not ( = ?auto_136080 ?auto_136085 ) ) ( not ( = ?auto_136081 ?auto_136082 ) ) ( not ( = ?auto_136081 ?auto_136083 ) ) ( not ( = ?auto_136081 ?auto_136084 ) ) ( not ( = ?auto_136081 ?auto_136085 ) ) ( not ( = ?auto_136082 ?auto_136083 ) ) ( not ( = ?auto_136082 ?auto_136084 ) ) ( not ( = ?auto_136082 ?auto_136085 ) ) ( not ( = ?auto_136083 ?auto_136084 ) ) ( not ( = ?auto_136083 ?auto_136085 ) ) ( not ( = ?auto_136084 ?auto_136085 ) ) ( ON ?auto_136085 ?auto_136087 ) ( not ( = ?auto_136080 ?auto_136087 ) ) ( not ( = ?auto_136081 ?auto_136087 ) ) ( not ( = ?auto_136082 ?auto_136087 ) ) ( not ( = ?auto_136083 ?auto_136087 ) ) ( not ( = ?auto_136084 ?auto_136087 ) ) ( not ( = ?auto_136085 ?auto_136087 ) ) ( ON ?auto_136084 ?auto_136085 ) ( ON-TABLE ?auto_136086 ) ( ON ?auto_136087 ?auto_136086 ) ( not ( = ?auto_136086 ?auto_136087 ) ) ( not ( = ?auto_136086 ?auto_136085 ) ) ( not ( = ?auto_136086 ?auto_136084 ) ) ( not ( = ?auto_136080 ?auto_136086 ) ) ( not ( = ?auto_136081 ?auto_136086 ) ) ( not ( = ?auto_136082 ?auto_136086 ) ) ( not ( = ?auto_136083 ?auto_136086 ) ) ( ON ?auto_136083 ?auto_136084 ) ( CLEAR ?auto_136083 ) ( HOLDING ?auto_136082 ) ( CLEAR ?auto_136081 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136080 ?auto_136081 ?auto_136082 )
      ( MAKE-6PILE ?auto_136080 ?auto_136081 ?auto_136082 ?auto_136083 ?auto_136084 ?auto_136085 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136088 - BLOCK
      ?auto_136089 - BLOCK
      ?auto_136090 - BLOCK
      ?auto_136091 - BLOCK
      ?auto_136092 - BLOCK
      ?auto_136093 - BLOCK
    )
    :vars
    (
      ?auto_136095 - BLOCK
      ?auto_136094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136088 ) ( ON ?auto_136089 ?auto_136088 ) ( not ( = ?auto_136088 ?auto_136089 ) ) ( not ( = ?auto_136088 ?auto_136090 ) ) ( not ( = ?auto_136088 ?auto_136091 ) ) ( not ( = ?auto_136088 ?auto_136092 ) ) ( not ( = ?auto_136088 ?auto_136093 ) ) ( not ( = ?auto_136089 ?auto_136090 ) ) ( not ( = ?auto_136089 ?auto_136091 ) ) ( not ( = ?auto_136089 ?auto_136092 ) ) ( not ( = ?auto_136089 ?auto_136093 ) ) ( not ( = ?auto_136090 ?auto_136091 ) ) ( not ( = ?auto_136090 ?auto_136092 ) ) ( not ( = ?auto_136090 ?auto_136093 ) ) ( not ( = ?auto_136091 ?auto_136092 ) ) ( not ( = ?auto_136091 ?auto_136093 ) ) ( not ( = ?auto_136092 ?auto_136093 ) ) ( ON ?auto_136093 ?auto_136095 ) ( not ( = ?auto_136088 ?auto_136095 ) ) ( not ( = ?auto_136089 ?auto_136095 ) ) ( not ( = ?auto_136090 ?auto_136095 ) ) ( not ( = ?auto_136091 ?auto_136095 ) ) ( not ( = ?auto_136092 ?auto_136095 ) ) ( not ( = ?auto_136093 ?auto_136095 ) ) ( ON ?auto_136092 ?auto_136093 ) ( ON-TABLE ?auto_136094 ) ( ON ?auto_136095 ?auto_136094 ) ( not ( = ?auto_136094 ?auto_136095 ) ) ( not ( = ?auto_136094 ?auto_136093 ) ) ( not ( = ?auto_136094 ?auto_136092 ) ) ( not ( = ?auto_136088 ?auto_136094 ) ) ( not ( = ?auto_136089 ?auto_136094 ) ) ( not ( = ?auto_136090 ?auto_136094 ) ) ( not ( = ?auto_136091 ?auto_136094 ) ) ( ON ?auto_136091 ?auto_136092 ) ( CLEAR ?auto_136089 ) ( ON ?auto_136090 ?auto_136091 ) ( CLEAR ?auto_136090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136094 ?auto_136095 ?auto_136093 ?auto_136092 ?auto_136091 )
      ( MAKE-6PILE ?auto_136088 ?auto_136089 ?auto_136090 ?auto_136091 ?auto_136092 ?auto_136093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136096 - BLOCK
      ?auto_136097 - BLOCK
      ?auto_136098 - BLOCK
      ?auto_136099 - BLOCK
      ?auto_136100 - BLOCK
      ?auto_136101 - BLOCK
    )
    :vars
    (
      ?auto_136102 - BLOCK
      ?auto_136103 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136096 ) ( not ( = ?auto_136096 ?auto_136097 ) ) ( not ( = ?auto_136096 ?auto_136098 ) ) ( not ( = ?auto_136096 ?auto_136099 ) ) ( not ( = ?auto_136096 ?auto_136100 ) ) ( not ( = ?auto_136096 ?auto_136101 ) ) ( not ( = ?auto_136097 ?auto_136098 ) ) ( not ( = ?auto_136097 ?auto_136099 ) ) ( not ( = ?auto_136097 ?auto_136100 ) ) ( not ( = ?auto_136097 ?auto_136101 ) ) ( not ( = ?auto_136098 ?auto_136099 ) ) ( not ( = ?auto_136098 ?auto_136100 ) ) ( not ( = ?auto_136098 ?auto_136101 ) ) ( not ( = ?auto_136099 ?auto_136100 ) ) ( not ( = ?auto_136099 ?auto_136101 ) ) ( not ( = ?auto_136100 ?auto_136101 ) ) ( ON ?auto_136101 ?auto_136102 ) ( not ( = ?auto_136096 ?auto_136102 ) ) ( not ( = ?auto_136097 ?auto_136102 ) ) ( not ( = ?auto_136098 ?auto_136102 ) ) ( not ( = ?auto_136099 ?auto_136102 ) ) ( not ( = ?auto_136100 ?auto_136102 ) ) ( not ( = ?auto_136101 ?auto_136102 ) ) ( ON ?auto_136100 ?auto_136101 ) ( ON-TABLE ?auto_136103 ) ( ON ?auto_136102 ?auto_136103 ) ( not ( = ?auto_136103 ?auto_136102 ) ) ( not ( = ?auto_136103 ?auto_136101 ) ) ( not ( = ?auto_136103 ?auto_136100 ) ) ( not ( = ?auto_136096 ?auto_136103 ) ) ( not ( = ?auto_136097 ?auto_136103 ) ) ( not ( = ?auto_136098 ?auto_136103 ) ) ( not ( = ?auto_136099 ?auto_136103 ) ) ( ON ?auto_136099 ?auto_136100 ) ( ON ?auto_136098 ?auto_136099 ) ( CLEAR ?auto_136098 ) ( HOLDING ?auto_136097 ) ( CLEAR ?auto_136096 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136096 ?auto_136097 )
      ( MAKE-6PILE ?auto_136096 ?auto_136097 ?auto_136098 ?auto_136099 ?auto_136100 ?auto_136101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136104 - BLOCK
      ?auto_136105 - BLOCK
      ?auto_136106 - BLOCK
      ?auto_136107 - BLOCK
      ?auto_136108 - BLOCK
      ?auto_136109 - BLOCK
    )
    :vars
    (
      ?auto_136110 - BLOCK
      ?auto_136111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136104 ) ( not ( = ?auto_136104 ?auto_136105 ) ) ( not ( = ?auto_136104 ?auto_136106 ) ) ( not ( = ?auto_136104 ?auto_136107 ) ) ( not ( = ?auto_136104 ?auto_136108 ) ) ( not ( = ?auto_136104 ?auto_136109 ) ) ( not ( = ?auto_136105 ?auto_136106 ) ) ( not ( = ?auto_136105 ?auto_136107 ) ) ( not ( = ?auto_136105 ?auto_136108 ) ) ( not ( = ?auto_136105 ?auto_136109 ) ) ( not ( = ?auto_136106 ?auto_136107 ) ) ( not ( = ?auto_136106 ?auto_136108 ) ) ( not ( = ?auto_136106 ?auto_136109 ) ) ( not ( = ?auto_136107 ?auto_136108 ) ) ( not ( = ?auto_136107 ?auto_136109 ) ) ( not ( = ?auto_136108 ?auto_136109 ) ) ( ON ?auto_136109 ?auto_136110 ) ( not ( = ?auto_136104 ?auto_136110 ) ) ( not ( = ?auto_136105 ?auto_136110 ) ) ( not ( = ?auto_136106 ?auto_136110 ) ) ( not ( = ?auto_136107 ?auto_136110 ) ) ( not ( = ?auto_136108 ?auto_136110 ) ) ( not ( = ?auto_136109 ?auto_136110 ) ) ( ON ?auto_136108 ?auto_136109 ) ( ON-TABLE ?auto_136111 ) ( ON ?auto_136110 ?auto_136111 ) ( not ( = ?auto_136111 ?auto_136110 ) ) ( not ( = ?auto_136111 ?auto_136109 ) ) ( not ( = ?auto_136111 ?auto_136108 ) ) ( not ( = ?auto_136104 ?auto_136111 ) ) ( not ( = ?auto_136105 ?auto_136111 ) ) ( not ( = ?auto_136106 ?auto_136111 ) ) ( not ( = ?auto_136107 ?auto_136111 ) ) ( ON ?auto_136107 ?auto_136108 ) ( ON ?auto_136106 ?auto_136107 ) ( CLEAR ?auto_136104 ) ( ON ?auto_136105 ?auto_136106 ) ( CLEAR ?auto_136105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136111 ?auto_136110 ?auto_136109 ?auto_136108 ?auto_136107 ?auto_136106 )
      ( MAKE-6PILE ?auto_136104 ?auto_136105 ?auto_136106 ?auto_136107 ?auto_136108 ?auto_136109 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136112 - BLOCK
      ?auto_136113 - BLOCK
      ?auto_136114 - BLOCK
      ?auto_136115 - BLOCK
      ?auto_136116 - BLOCK
      ?auto_136117 - BLOCK
    )
    :vars
    (
      ?auto_136119 - BLOCK
      ?auto_136118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136112 ?auto_136113 ) ) ( not ( = ?auto_136112 ?auto_136114 ) ) ( not ( = ?auto_136112 ?auto_136115 ) ) ( not ( = ?auto_136112 ?auto_136116 ) ) ( not ( = ?auto_136112 ?auto_136117 ) ) ( not ( = ?auto_136113 ?auto_136114 ) ) ( not ( = ?auto_136113 ?auto_136115 ) ) ( not ( = ?auto_136113 ?auto_136116 ) ) ( not ( = ?auto_136113 ?auto_136117 ) ) ( not ( = ?auto_136114 ?auto_136115 ) ) ( not ( = ?auto_136114 ?auto_136116 ) ) ( not ( = ?auto_136114 ?auto_136117 ) ) ( not ( = ?auto_136115 ?auto_136116 ) ) ( not ( = ?auto_136115 ?auto_136117 ) ) ( not ( = ?auto_136116 ?auto_136117 ) ) ( ON ?auto_136117 ?auto_136119 ) ( not ( = ?auto_136112 ?auto_136119 ) ) ( not ( = ?auto_136113 ?auto_136119 ) ) ( not ( = ?auto_136114 ?auto_136119 ) ) ( not ( = ?auto_136115 ?auto_136119 ) ) ( not ( = ?auto_136116 ?auto_136119 ) ) ( not ( = ?auto_136117 ?auto_136119 ) ) ( ON ?auto_136116 ?auto_136117 ) ( ON-TABLE ?auto_136118 ) ( ON ?auto_136119 ?auto_136118 ) ( not ( = ?auto_136118 ?auto_136119 ) ) ( not ( = ?auto_136118 ?auto_136117 ) ) ( not ( = ?auto_136118 ?auto_136116 ) ) ( not ( = ?auto_136112 ?auto_136118 ) ) ( not ( = ?auto_136113 ?auto_136118 ) ) ( not ( = ?auto_136114 ?auto_136118 ) ) ( not ( = ?auto_136115 ?auto_136118 ) ) ( ON ?auto_136115 ?auto_136116 ) ( ON ?auto_136114 ?auto_136115 ) ( ON ?auto_136113 ?auto_136114 ) ( CLEAR ?auto_136113 ) ( HOLDING ?auto_136112 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136112 )
      ( MAKE-6PILE ?auto_136112 ?auto_136113 ?auto_136114 ?auto_136115 ?auto_136116 ?auto_136117 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136120 - BLOCK
      ?auto_136121 - BLOCK
      ?auto_136122 - BLOCK
      ?auto_136123 - BLOCK
      ?auto_136124 - BLOCK
      ?auto_136125 - BLOCK
    )
    :vars
    (
      ?auto_136127 - BLOCK
      ?auto_136126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136120 ?auto_136121 ) ) ( not ( = ?auto_136120 ?auto_136122 ) ) ( not ( = ?auto_136120 ?auto_136123 ) ) ( not ( = ?auto_136120 ?auto_136124 ) ) ( not ( = ?auto_136120 ?auto_136125 ) ) ( not ( = ?auto_136121 ?auto_136122 ) ) ( not ( = ?auto_136121 ?auto_136123 ) ) ( not ( = ?auto_136121 ?auto_136124 ) ) ( not ( = ?auto_136121 ?auto_136125 ) ) ( not ( = ?auto_136122 ?auto_136123 ) ) ( not ( = ?auto_136122 ?auto_136124 ) ) ( not ( = ?auto_136122 ?auto_136125 ) ) ( not ( = ?auto_136123 ?auto_136124 ) ) ( not ( = ?auto_136123 ?auto_136125 ) ) ( not ( = ?auto_136124 ?auto_136125 ) ) ( ON ?auto_136125 ?auto_136127 ) ( not ( = ?auto_136120 ?auto_136127 ) ) ( not ( = ?auto_136121 ?auto_136127 ) ) ( not ( = ?auto_136122 ?auto_136127 ) ) ( not ( = ?auto_136123 ?auto_136127 ) ) ( not ( = ?auto_136124 ?auto_136127 ) ) ( not ( = ?auto_136125 ?auto_136127 ) ) ( ON ?auto_136124 ?auto_136125 ) ( ON-TABLE ?auto_136126 ) ( ON ?auto_136127 ?auto_136126 ) ( not ( = ?auto_136126 ?auto_136127 ) ) ( not ( = ?auto_136126 ?auto_136125 ) ) ( not ( = ?auto_136126 ?auto_136124 ) ) ( not ( = ?auto_136120 ?auto_136126 ) ) ( not ( = ?auto_136121 ?auto_136126 ) ) ( not ( = ?auto_136122 ?auto_136126 ) ) ( not ( = ?auto_136123 ?auto_136126 ) ) ( ON ?auto_136123 ?auto_136124 ) ( ON ?auto_136122 ?auto_136123 ) ( ON ?auto_136121 ?auto_136122 ) ( ON ?auto_136120 ?auto_136121 ) ( CLEAR ?auto_136120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136126 ?auto_136127 ?auto_136125 ?auto_136124 ?auto_136123 ?auto_136122 ?auto_136121 )
      ( MAKE-6PILE ?auto_136120 ?auto_136121 ?auto_136122 ?auto_136123 ?auto_136124 ?auto_136125 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136128 - BLOCK
      ?auto_136129 - BLOCK
      ?auto_136130 - BLOCK
      ?auto_136131 - BLOCK
      ?auto_136132 - BLOCK
      ?auto_136133 - BLOCK
    )
    :vars
    (
      ?auto_136134 - BLOCK
      ?auto_136135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136128 ?auto_136129 ) ) ( not ( = ?auto_136128 ?auto_136130 ) ) ( not ( = ?auto_136128 ?auto_136131 ) ) ( not ( = ?auto_136128 ?auto_136132 ) ) ( not ( = ?auto_136128 ?auto_136133 ) ) ( not ( = ?auto_136129 ?auto_136130 ) ) ( not ( = ?auto_136129 ?auto_136131 ) ) ( not ( = ?auto_136129 ?auto_136132 ) ) ( not ( = ?auto_136129 ?auto_136133 ) ) ( not ( = ?auto_136130 ?auto_136131 ) ) ( not ( = ?auto_136130 ?auto_136132 ) ) ( not ( = ?auto_136130 ?auto_136133 ) ) ( not ( = ?auto_136131 ?auto_136132 ) ) ( not ( = ?auto_136131 ?auto_136133 ) ) ( not ( = ?auto_136132 ?auto_136133 ) ) ( ON ?auto_136133 ?auto_136134 ) ( not ( = ?auto_136128 ?auto_136134 ) ) ( not ( = ?auto_136129 ?auto_136134 ) ) ( not ( = ?auto_136130 ?auto_136134 ) ) ( not ( = ?auto_136131 ?auto_136134 ) ) ( not ( = ?auto_136132 ?auto_136134 ) ) ( not ( = ?auto_136133 ?auto_136134 ) ) ( ON ?auto_136132 ?auto_136133 ) ( ON-TABLE ?auto_136135 ) ( ON ?auto_136134 ?auto_136135 ) ( not ( = ?auto_136135 ?auto_136134 ) ) ( not ( = ?auto_136135 ?auto_136133 ) ) ( not ( = ?auto_136135 ?auto_136132 ) ) ( not ( = ?auto_136128 ?auto_136135 ) ) ( not ( = ?auto_136129 ?auto_136135 ) ) ( not ( = ?auto_136130 ?auto_136135 ) ) ( not ( = ?auto_136131 ?auto_136135 ) ) ( ON ?auto_136131 ?auto_136132 ) ( ON ?auto_136130 ?auto_136131 ) ( ON ?auto_136129 ?auto_136130 ) ( HOLDING ?auto_136128 ) ( CLEAR ?auto_136129 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136135 ?auto_136134 ?auto_136133 ?auto_136132 ?auto_136131 ?auto_136130 ?auto_136129 ?auto_136128 )
      ( MAKE-6PILE ?auto_136128 ?auto_136129 ?auto_136130 ?auto_136131 ?auto_136132 ?auto_136133 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136136 - BLOCK
      ?auto_136137 - BLOCK
      ?auto_136138 - BLOCK
      ?auto_136139 - BLOCK
      ?auto_136140 - BLOCK
      ?auto_136141 - BLOCK
    )
    :vars
    (
      ?auto_136143 - BLOCK
      ?auto_136142 - BLOCK
      ?auto_136144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136136 ?auto_136137 ) ) ( not ( = ?auto_136136 ?auto_136138 ) ) ( not ( = ?auto_136136 ?auto_136139 ) ) ( not ( = ?auto_136136 ?auto_136140 ) ) ( not ( = ?auto_136136 ?auto_136141 ) ) ( not ( = ?auto_136137 ?auto_136138 ) ) ( not ( = ?auto_136137 ?auto_136139 ) ) ( not ( = ?auto_136137 ?auto_136140 ) ) ( not ( = ?auto_136137 ?auto_136141 ) ) ( not ( = ?auto_136138 ?auto_136139 ) ) ( not ( = ?auto_136138 ?auto_136140 ) ) ( not ( = ?auto_136138 ?auto_136141 ) ) ( not ( = ?auto_136139 ?auto_136140 ) ) ( not ( = ?auto_136139 ?auto_136141 ) ) ( not ( = ?auto_136140 ?auto_136141 ) ) ( ON ?auto_136141 ?auto_136143 ) ( not ( = ?auto_136136 ?auto_136143 ) ) ( not ( = ?auto_136137 ?auto_136143 ) ) ( not ( = ?auto_136138 ?auto_136143 ) ) ( not ( = ?auto_136139 ?auto_136143 ) ) ( not ( = ?auto_136140 ?auto_136143 ) ) ( not ( = ?auto_136141 ?auto_136143 ) ) ( ON ?auto_136140 ?auto_136141 ) ( ON-TABLE ?auto_136142 ) ( ON ?auto_136143 ?auto_136142 ) ( not ( = ?auto_136142 ?auto_136143 ) ) ( not ( = ?auto_136142 ?auto_136141 ) ) ( not ( = ?auto_136142 ?auto_136140 ) ) ( not ( = ?auto_136136 ?auto_136142 ) ) ( not ( = ?auto_136137 ?auto_136142 ) ) ( not ( = ?auto_136138 ?auto_136142 ) ) ( not ( = ?auto_136139 ?auto_136142 ) ) ( ON ?auto_136139 ?auto_136140 ) ( ON ?auto_136138 ?auto_136139 ) ( ON ?auto_136137 ?auto_136138 ) ( CLEAR ?auto_136137 ) ( ON ?auto_136136 ?auto_136144 ) ( CLEAR ?auto_136136 ) ( HAND-EMPTY ) ( not ( = ?auto_136136 ?auto_136144 ) ) ( not ( = ?auto_136137 ?auto_136144 ) ) ( not ( = ?auto_136138 ?auto_136144 ) ) ( not ( = ?auto_136139 ?auto_136144 ) ) ( not ( = ?auto_136140 ?auto_136144 ) ) ( not ( = ?auto_136141 ?auto_136144 ) ) ( not ( = ?auto_136143 ?auto_136144 ) ) ( not ( = ?auto_136142 ?auto_136144 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136136 ?auto_136144 )
      ( MAKE-6PILE ?auto_136136 ?auto_136137 ?auto_136138 ?auto_136139 ?auto_136140 ?auto_136141 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136145 - BLOCK
      ?auto_136146 - BLOCK
      ?auto_136147 - BLOCK
      ?auto_136148 - BLOCK
      ?auto_136149 - BLOCK
      ?auto_136150 - BLOCK
    )
    :vars
    (
      ?auto_136153 - BLOCK
      ?auto_136152 - BLOCK
      ?auto_136151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136145 ?auto_136146 ) ) ( not ( = ?auto_136145 ?auto_136147 ) ) ( not ( = ?auto_136145 ?auto_136148 ) ) ( not ( = ?auto_136145 ?auto_136149 ) ) ( not ( = ?auto_136145 ?auto_136150 ) ) ( not ( = ?auto_136146 ?auto_136147 ) ) ( not ( = ?auto_136146 ?auto_136148 ) ) ( not ( = ?auto_136146 ?auto_136149 ) ) ( not ( = ?auto_136146 ?auto_136150 ) ) ( not ( = ?auto_136147 ?auto_136148 ) ) ( not ( = ?auto_136147 ?auto_136149 ) ) ( not ( = ?auto_136147 ?auto_136150 ) ) ( not ( = ?auto_136148 ?auto_136149 ) ) ( not ( = ?auto_136148 ?auto_136150 ) ) ( not ( = ?auto_136149 ?auto_136150 ) ) ( ON ?auto_136150 ?auto_136153 ) ( not ( = ?auto_136145 ?auto_136153 ) ) ( not ( = ?auto_136146 ?auto_136153 ) ) ( not ( = ?auto_136147 ?auto_136153 ) ) ( not ( = ?auto_136148 ?auto_136153 ) ) ( not ( = ?auto_136149 ?auto_136153 ) ) ( not ( = ?auto_136150 ?auto_136153 ) ) ( ON ?auto_136149 ?auto_136150 ) ( ON-TABLE ?auto_136152 ) ( ON ?auto_136153 ?auto_136152 ) ( not ( = ?auto_136152 ?auto_136153 ) ) ( not ( = ?auto_136152 ?auto_136150 ) ) ( not ( = ?auto_136152 ?auto_136149 ) ) ( not ( = ?auto_136145 ?auto_136152 ) ) ( not ( = ?auto_136146 ?auto_136152 ) ) ( not ( = ?auto_136147 ?auto_136152 ) ) ( not ( = ?auto_136148 ?auto_136152 ) ) ( ON ?auto_136148 ?auto_136149 ) ( ON ?auto_136147 ?auto_136148 ) ( ON ?auto_136145 ?auto_136151 ) ( CLEAR ?auto_136145 ) ( not ( = ?auto_136145 ?auto_136151 ) ) ( not ( = ?auto_136146 ?auto_136151 ) ) ( not ( = ?auto_136147 ?auto_136151 ) ) ( not ( = ?auto_136148 ?auto_136151 ) ) ( not ( = ?auto_136149 ?auto_136151 ) ) ( not ( = ?auto_136150 ?auto_136151 ) ) ( not ( = ?auto_136153 ?auto_136151 ) ) ( not ( = ?auto_136152 ?auto_136151 ) ) ( HOLDING ?auto_136146 ) ( CLEAR ?auto_136147 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136152 ?auto_136153 ?auto_136150 ?auto_136149 ?auto_136148 ?auto_136147 ?auto_136146 )
      ( MAKE-6PILE ?auto_136145 ?auto_136146 ?auto_136147 ?auto_136148 ?auto_136149 ?auto_136150 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136154 - BLOCK
      ?auto_136155 - BLOCK
      ?auto_136156 - BLOCK
      ?auto_136157 - BLOCK
      ?auto_136158 - BLOCK
      ?auto_136159 - BLOCK
    )
    :vars
    (
      ?auto_136161 - BLOCK
      ?auto_136160 - BLOCK
      ?auto_136162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136154 ?auto_136155 ) ) ( not ( = ?auto_136154 ?auto_136156 ) ) ( not ( = ?auto_136154 ?auto_136157 ) ) ( not ( = ?auto_136154 ?auto_136158 ) ) ( not ( = ?auto_136154 ?auto_136159 ) ) ( not ( = ?auto_136155 ?auto_136156 ) ) ( not ( = ?auto_136155 ?auto_136157 ) ) ( not ( = ?auto_136155 ?auto_136158 ) ) ( not ( = ?auto_136155 ?auto_136159 ) ) ( not ( = ?auto_136156 ?auto_136157 ) ) ( not ( = ?auto_136156 ?auto_136158 ) ) ( not ( = ?auto_136156 ?auto_136159 ) ) ( not ( = ?auto_136157 ?auto_136158 ) ) ( not ( = ?auto_136157 ?auto_136159 ) ) ( not ( = ?auto_136158 ?auto_136159 ) ) ( ON ?auto_136159 ?auto_136161 ) ( not ( = ?auto_136154 ?auto_136161 ) ) ( not ( = ?auto_136155 ?auto_136161 ) ) ( not ( = ?auto_136156 ?auto_136161 ) ) ( not ( = ?auto_136157 ?auto_136161 ) ) ( not ( = ?auto_136158 ?auto_136161 ) ) ( not ( = ?auto_136159 ?auto_136161 ) ) ( ON ?auto_136158 ?auto_136159 ) ( ON-TABLE ?auto_136160 ) ( ON ?auto_136161 ?auto_136160 ) ( not ( = ?auto_136160 ?auto_136161 ) ) ( not ( = ?auto_136160 ?auto_136159 ) ) ( not ( = ?auto_136160 ?auto_136158 ) ) ( not ( = ?auto_136154 ?auto_136160 ) ) ( not ( = ?auto_136155 ?auto_136160 ) ) ( not ( = ?auto_136156 ?auto_136160 ) ) ( not ( = ?auto_136157 ?auto_136160 ) ) ( ON ?auto_136157 ?auto_136158 ) ( ON ?auto_136156 ?auto_136157 ) ( ON ?auto_136154 ?auto_136162 ) ( not ( = ?auto_136154 ?auto_136162 ) ) ( not ( = ?auto_136155 ?auto_136162 ) ) ( not ( = ?auto_136156 ?auto_136162 ) ) ( not ( = ?auto_136157 ?auto_136162 ) ) ( not ( = ?auto_136158 ?auto_136162 ) ) ( not ( = ?auto_136159 ?auto_136162 ) ) ( not ( = ?auto_136161 ?auto_136162 ) ) ( not ( = ?auto_136160 ?auto_136162 ) ) ( CLEAR ?auto_136156 ) ( ON ?auto_136155 ?auto_136154 ) ( CLEAR ?auto_136155 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136162 ?auto_136154 )
      ( MAKE-6PILE ?auto_136154 ?auto_136155 ?auto_136156 ?auto_136157 ?auto_136158 ?auto_136159 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136163 - BLOCK
      ?auto_136164 - BLOCK
      ?auto_136165 - BLOCK
      ?auto_136166 - BLOCK
      ?auto_136167 - BLOCK
      ?auto_136168 - BLOCK
    )
    :vars
    (
      ?auto_136170 - BLOCK
      ?auto_136171 - BLOCK
      ?auto_136169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136163 ?auto_136164 ) ) ( not ( = ?auto_136163 ?auto_136165 ) ) ( not ( = ?auto_136163 ?auto_136166 ) ) ( not ( = ?auto_136163 ?auto_136167 ) ) ( not ( = ?auto_136163 ?auto_136168 ) ) ( not ( = ?auto_136164 ?auto_136165 ) ) ( not ( = ?auto_136164 ?auto_136166 ) ) ( not ( = ?auto_136164 ?auto_136167 ) ) ( not ( = ?auto_136164 ?auto_136168 ) ) ( not ( = ?auto_136165 ?auto_136166 ) ) ( not ( = ?auto_136165 ?auto_136167 ) ) ( not ( = ?auto_136165 ?auto_136168 ) ) ( not ( = ?auto_136166 ?auto_136167 ) ) ( not ( = ?auto_136166 ?auto_136168 ) ) ( not ( = ?auto_136167 ?auto_136168 ) ) ( ON ?auto_136168 ?auto_136170 ) ( not ( = ?auto_136163 ?auto_136170 ) ) ( not ( = ?auto_136164 ?auto_136170 ) ) ( not ( = ?auto_136165 ?auto_136170 ) ) ( not ( = ?auto_136166 ?auto_136170 ) ) ( not ( = ?auto_136167 ?auto_136170 ) ) ( not ( = ?auto_136168 ?auto_136170 ) ) ( ON ?auto_136167 ?auto_136168 ) ( ON-TABLE ?auto_136171 ) ( ON ?auto_136170 ?auto_136171 ) ( not ( = ?auto_136171 ?auto_136170 ) ) ( not ( = ?auto_136171 ?auto_136168 ) ) ( not ( = ?auto_136171 ?auto_136167 ) ) ( not ( = ?auto_136163 ?auto_136171 ) ) ( not ( = ?auto_136164 ?auto_136171 ) ) ( not ( = ?auto_136165 ?auto_136171 ) ) ( not ( = ?auto_136166 ?auto_136171 ) ) ( ON ?auto_136166 ?auto_136167 ) ( ON ?auto_136163 ?auto_136169 ) ( not ( = ?auto_136163 ?auto_136169 ) ) ( not ( = ?auto_136164 ?auto_136169 ) ) ( not ( = ?auto_136165 ?auto_136169 ) ) ( not ( = ?auto_136166 ?auto_136169 ) ) ( not ( = ?auto_136167 ?auto_136169 ) ) ( not ( = ?auto_136168 ?auto_136169 ) ) ( not ( = ?auto_136170 ?auto_136169 ) ) ( not ( = ?auto_136171 ?auto_136169 ) ) ( ON ?auto_136164 ?auto_136163 ) ( CLEAR ?auto_136164 ) ( ON-TABLE ?auto_136169 ) ( HOLDING ?auto_136165 ) ( CLEAR ?auto_136166 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136171 ?auto_136170 ?auto_136168 ?auto_136167 ?auto_136166 ?auto_136165 )
      ( MAKE-6PILE ?auto_136163 ?auto_136164 ?auto_136165 ?auto_136166 ?auto_136167 ?auto_136168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136172 - BLOCK
      ?auto_136173 - BLOCK
      ?auto_136174 - BLOCK
      ?auto_136175 - BLOCK
      ?auto_136176 - BLOCK
      ?auto_136177 - BLOCK
    )
    :vars
    (
      ?auto_136179 - BLOCK
      ?auto_136178 - BLOCK
      ?auto_136180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136172 ?auto_136173 ) ) ( not ( = ?auto_136172 ?auto_136174 ) ) ( not ( = ?auto_136172 ?auto_136175 ) ) ( not ( = ?auto_136172 ?auto_136176 ) ) ( not ( = ?auto_136172 ?auto_136177 ) ) ( not ( = ?auto_136173 ?auto_136174 ) ) ( not ( = ?auto_136173 ?auto_136175 ) ) ( not ( = ?auto_136173 ?auto_136176 ) ) ( not ( = ?auto_136173 ?auto_136177 ) ) ( not ( = ?auto_136174 ?auto_136175 ) ) ( not ( = ?auto_136174 ?auto_136176 ) ) ( not ( = ?auto_136174 ?auto_136177 ) ) ( not ( = ?auto_136175 ?auto_136176 ) ) ( not ( = ?auto_136175 ?auto_136177 ) ) ( not ( = ?auto_136176 ?auto_136177 ) ) ( ON ?auto_136177 ?auto_136179 ) ( not ( = ?auto_136172 ?auto_136179 ) ) ( not ( = ?auto_136173 ?auto_136179 ) ) ( not ( = ?auto_136174 ?auto_136179 ) ) ( not ( = ?auto_136175 ?auto_136179 ) ) ( not ( = ?auto_136176 ?auto_136179 ) ) ( not ( = ?auto_136177 ?auto_136179 ) ) ( ON ?auto_136176 ?auto_136177 ) ( ON-TABLE ?auto_136178 ) ( ON ?auto_136179 ?auto_136178 ) ( not ( = ?auto_136178 ?auto_136179 ) ) ( not ( = ?auto_136178 ?auto_136177 ) ) ( not ( = ?auto_136178 ?auto_136176 ) ) ( not ( = ?auto_136172 ?auto_136178 ) ) ( not ( = ?auto_136173 ?auto_136178 ) ) ( not ( = ?auto_136174 ?auto_136178 ) ) ( not ( = ?auto_136175 ?auto_136178 ) ) ( ON ?auto_136175 ?auto_136176 ) ( ON ?auto_136172 ?auto_136180 ) ( not ( = ?auto_136172 ?auto_136180 ) ) ( not ( = ?auto_136173 ?auto_136180 ) ) ( not ( = ?auto_136174 ?auto_136180 ) ) ( not ( = ?auto_136175 ?auto_136180 ) ) ( not ( = ?auto_136176 ?auto_136180 ) ) ( not ( = ?auto_136177 ?auto_136180 ) ) ( not ( = ?auto_136179 ?auto_136180 ) ) ( not ( = ?auto_136178 ?auto_136180 ) ) ( ON ?auto_136173 ?auto_136172 ) ( ON-TABLE ?auto_136180 ) ( CLEAR ?auto_136175 ) ( ON ?auto_136174 ?auto_136173 ) ( CLEAR ?auto_136174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136180 ?auto_136172 ?auto_136173 )
      ( MAKE-6PILE ?auto_136172 ?auto_136173 ?auto_136174 ?auto_136175 ?auto_136176 ?auto_136177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136181 - BLOCK
      ?auto_136182 - BLOCK
      ?auto_136183 - BLOCK
      ?auto_136184 - BLOCK
      ?auto_136185 - BLOCK
      ?auto_136186 - BLOCK
    )
    :vars
    (
      ?auto_136188 - BLOCK
      ?auto_136187 - BLOCK
      ?auto_136189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136181 ?auto_136182 ) ) ( not ( = ?auto_136181 ?auto_136183 ) ) ( not ( = ?auto_136181 ?auto_136184 ) ) ( not ( = ?auto_136181 ?auto_136185 ) ) ( not ( = ?auto_136181 ?auto_136186 ) ) ( not ( = ?auto_136182 ?auto_136183 ) ) ( not ( = ?auto_136182 ?auto_136184 ) ) ( not ( = ?auto_136182 ?auto_136185 ) ) ( not ( = ?auto_136182 ?auto_136186 ) ) ( not ( = ?auto_136183 ?auto_136184 ) ) ( not ( = ?auto_136183 ?auto_136185 ) ) ( not ( = ?auto_136183 ?auto_136186 ) ) ( not ( = ?auto_136184 ?auto_136185 ) ) ( not ( = ?auto_136184 ?auto_136186 ) ) ( not ( = ?auto_136185 ?auto_136186 ) ) ( ON ?auto_136186 ?auto_136188 ) ( not ( = ?auto_136181 ?auto_136188 ) ) ( not ( = ?auto_136182 ?auto_136188 ) ) ( not ( = ?auto_136183 ?auto_136188 ) ) ( not ( = ?auto_136184 ?auto_136188 ) ) ( not ( = ?auto_136185 ?auto_136188 ) ) ( not ( = ?auto_136186 ?auto_136188 ) ) ( ON ?auto_136185 ?auto_136186 ) ( ON-TABLE ?auto_136187 ) ( ON ?auto_136188 ?auto_136187 ) ( not ( = ?auto_136187 ?auto_136188 ) ) ( not ( = ?auto_136187 ?auto_136186 ) ) ( not ( = ?auto_136187 ?auto_136185 ) ) ( not ( = ?auto_136181 ?auto_136187 ) ) ( not ( = ?auto_136182 ?auto_136187 ) ) ( not ( = ?auto_136183 ?auto_136187 ) ) ( not ( = ?auto_136184 ?auto_136187 ) ) ( ON ?auto_136181 ?auto_136189 ) ( not ( = ?auto_136181 ?auto_136189 ) ) ( not ( = ?auto_136182 ?auto_136189 ) ) ( not ( = ?auto_136183 ?auto_136189 ) ) ( not ( = ?auto_136184 ?auto_136189 ) ) ( not ( = ?auto_136185 ?auto_136189 ) ) ( not ( = ?auto_136186 ?auto_136189 ) ) ( not ( = ?auto_136188 ?auto_136189 ) ) ( not ( = ?auto_136187 ?auto_136189 ) ) ( ON ?auto_136182 ?auto_136181 ) ( ON-TABLE ?auto_136189 ) ( ON ?auto_136183 ?auto_136182 ) ( CLEAR ?auto_136183 ) ( HOLDING ?auto_136184 ) ( CLEAR ?auto_136185 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136187 ?auto_136188 ?auto_136186 ?auto_136185 ?auto_136184 )
      ( MAKE-6PILE ?auto_136181 ?auto_136182 ?auto_136183 ?auto_136184 ?auto_136185 ?auto_136186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136190 - BLOCK
      ?auto_136191 - BLOCK
      ?auto_136192 - BLOCK
      ?auto_136193 - BLOCK
      ?auto_136194 - BLOCK
      ?auto_136195 - BLOCK
    )
    :vars
    (
      ?auto_136197 - BLOCK
      ?auto_136198 - BLOCK
      ?auto_136196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136190 ?auto_136191 ) ) ( not ( = ?auto_136190 ?auto_136192 ) ) ( not ( = ?auto_136190 ?auto_136193 ) ) ( not ( = ?auto_136190 ?auto_136194 ) ) ( not ( = ?auto_136190 ?auto_136195 ) ) ( not ( = ?auto_136191 ?auto_136192 ) ) ( not ( = ?auto_136191 ?auto_136193 ) ) ( not ( = ?auto_136191 ?auto_136194 ) ) ( not ( = ?auto_136191 ?auto_136195 ) ) ( not ( = ?auto_136192 ?auto_136193 ) ) ( not ( = ?auto_136192 ?auto_136194 ) ) ( not ( = ?auto_136192 ?auto_136195 ) ) ( not ( = ?auto_136193 ?auto_136194 ) ) ( not ( = ?auto_136193 ?auto_136195 ) ) ( not ( = ?auto_136194 ?auto_136195 ) ) ( ON ?auto_136195 ?auto_136197 ) ( not ( = ?auto_136190 ?auto_136197 ) ) ( not ( = ?auto_136191 ?auto_136197 ) ) ( not ( = ?auto_136192 ?auto_136197 ) ) ( not ( = ?auto_136193 ?auto_136197 ) ) ( not ( = ?auto_136194 ?auto_136197 ) ) ( not ( = ?auto_136195 ?auto_136197 ) ) ( ON ?auto_136194 ?auto_136195 ) ( ON-TABLE ?auto_136198 ) ( ON ?auto_136197 ?auto_136198 ) ( not ( = ?auto_136198 ?auto_136197 ) ) ( not ( = ?auto_136198 ?auto_136195 ) ) ( not ( = ?auto_136198 ?auto_136194 ) ) ( not ( = ?auto_136190 ?auto_136198 ) ) ( not ( = ?auto_136191 ?auto_136198 ) ) ( not ( = ?auto_136192 ?auto_136198 ) ) ( not ( = ?auto_136193 ?auto_136198 ) ) ( ON ?auto_136190 ?auto_136196 ) ( not ( = ?auto_136190 ?auto_136196 ) ) ( not ( = ?auto_136191 ?auto_136196 ) ) ( not ( = ?auto_136192 ?auto_136196 ) ) ( not ( = ?auto_136193 ?auto_136196 ) ) ( not ( = ?auto_136194 ?auto_136196 ) ) ( not ( = ?auto_136195 ?auto_136196 ) ) ( not ( = ?auto_136197 ?auto_136196 ) ) ( not ( = ?auto_136198 ?auto_136196 ) ) ( ON ?auto_136191 ?auto_136190 ) ( ON-TABLE ?auto_136196 ) ( ON ?auto_136192 ?auto_136191 ) ( CLEAR ?auto_136194 ) ( ON ?auto_136193 ?auto_136192 ) ( CLEAR ?auto_136193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136196 ?auto_136190 ?auto_136191 ?auto_136192 )
      ( MAKE-6PILE ?auto_136190 ?auto_136191 ?auto_136192 ?auto_136193 ?auto_136194 ?auto_136195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136199 - BLOCK
      ?auto_136200 - BLOCK
      ?auto_136201 - BLOCK
      ?auto_136202 - BLOCK
      ?auto_136203 - BLOCK
      ?auto_136204 - BLOCK
    )
    :vars
    (
      ?auto_136205 - BLOCK
      ?auto_136207 - BLOCK
      ?auto_136206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136199 ?auto_136200 ) ) ( not ( = ?auto_136199 ?auto_136201 ) ) ( not ( = ?auto_136199 ?auto_136202 ) ) ( not ( = ?auto_136199 ?auto_136203 ) ) ( not ( = ?auto_136199 ?auto_136204 ) ) ( not ( = ?auto_136200 ?auto_136201 ) ) ( not ( = ?auto_136200 ?auto_136202 ) ) ( not ( = ?auto_136200 ?auto_136203 ) ) ( not ( = ?auto_136200 ?auto_136204 ) ) ( not ( = ?auto_136201 ?auto_136202 ) ) ( not ( = ?auto_136201 ?auto_136203 ) ) ( not ( = ?auto_136201 ?auto_136204 ) ) ( not ( = ?auto_136202 ?auto_136203 ) ) ( not ( = ?auto_136202 ?auto_136204 ) ) ( not ( = ?auto_136203 ?auto_136204 ) ) ( ON ?auto_136204 ?auto_136205 ) ( not ( = ?auto_136199 ?auto_136205 ) ) ( not ( = ?auto_136200 ?auto_136205 ) ) ( not ( = ?auto_136201 ?auto_136205 ) ) ( not ( = ?auto_136202 ?auto_136205 ) ) ( not ( = ?auto_136203 ?auto_136205 ) ) ( not ( = ?auto_136204 ?auto_136205 ) ) ( ON-TABLE ?auto_136207 ) ( ON ?auto_136205 ?auto_136207 ) ( not ( = ?auto_136207 ?auto_136205 ) ) ( not ( = ?auto_136207 ?auto_136204 ) ) ( not ( = ?auto_136207 ?auto_136203 ) ) ( not ( = ?auto_136199 ?auto_136207 ) ) ( not ( = ?auto_136200 ?auto_136207 ) ) ( not ( = ?auto_136201 ?auto_136207 ) ) ( not ( = ?auto_136202 ?auto_136207 ) ) ( ON ?auto_136199 ?auto_136206 ) ( not ( = ?auto_136199 ?auto_136206 ) ) ( not ( = ?auto_136200 ?auto_136206 ) ) ( not ( = ?auto_136201 ?auto_136206 ) ) ( not ( = ?auto_136202 ?auto_136206 ) ) ( not ( = ?auto_136203 ?auto_136206 ) ) ( not ( = ?auto_136204 ?auto_136206 ) ) ( not ( = ?auto_136205 ?auto_136206 ) ) ( not ( = ?auto_136207 ?auto_136206 ) ) ( ON ?auto_136200 ?auto_136199 ) ( ON-TABLE ?auto_136206 ) ( ON ?auto_136201 ?auto_136200 ) ( ON ?auto_136202 ?auto_136201 ) ( CLEAR ?auto_136202 ) ( HOLDING ?auto_136203 ) ( CLEAR ?auto_136204 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136207 ?auto_136205 ?auto_136204 ?auto_136203 )
      ( MAKE-6PILE ?auto_136199 ?auto_136200 ?auto_136201 ?auto_136202 ?auto_136203 ?auto_136204 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136208 - BLOCK
      ?auto_136209 - BLOCK
      ?auto_136210 - BLOCK
      ?auto_136211 - BLOCK
      ?auto_136212 - BLOCK
      ?auto_136213 - BLOCK
    )
    :vars
    (
      ?auto_136215 - BLOCK
      ?auto_136214 - BLOCK
      ?auto_136216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136208 ?auto_136209 ) ) ( not ( = ?auto_136208 ?auto_136210 ) ) ( not ( = ?auto_136208 ?auto_136211 ) ) ( not ( = ?auto_136208 ?auto_136212 ) ) ( not ( = ?auto_136208 ?auto_136213 ) ) ( not ( = ?auto_136209 ?auto_136210 ) ) ( not ( = ?auto_136209 ?auto_136211 ) ) ( not ( = ?auto_136209 ?auto_136212 ) ) ( not ( = ?auto_136209 ?auto_136213 ) ) ( not ( = ?auto_136210 ?auto_136211 ) ) ( not ( = ?auto_136210 ?auto_136212 ) ) ( not ( = ?auto_136210 ?auto_136213 ) ) ( not ( = ?auto_136211 ?auto_136212 ) ) ( not ( = ?auto_136211 ?auto_136213 ) ) ( not ( = ?auto_136212 ?auto_136213 ) ) ( ON ?auto_136213 ?auto_136215 ) ( not ( = ?auto_136208 ?auto_136215 ) ) ( not ( = ?auto_136209 ?auto_136215 ) ) ( not ( = ?auto_136210 ?auto_136215 ) ) ( not ( = ?auto_136211 ?auto_136215 ) ) ( not ( = ?auto_136212 ?auto_136215 ) ) ( not ( = ?auto_136213 ?auto_136215 ) ) ( ON-TABLE ?auto_136214 ) ( ON ?auto_136215 ?auto_136214 ) ( not ( = ?auto_136214 ?auto_136215 ) ) ( not ( = ?auto_136214 ?auto_136213 ) ) ( not ( = ?auto_136214 ?auto_136212 ) ) ( not ( = ?auto_136208 ?auto_136214 ) ) ( not ( = ?auto_136209 ?auto_136214 ) ) ( not ( = ?auto_136210 ?auto_136214 ) ) ( not ( = ?auto_136211 ?auto_136214 ) ) ( ON ?auto_136208 ?auto_136216 ) ( not ( = ?auto_136208 ?auto_136216 ) ) ( not ( = ?auto_136209 ?auto_136216 ) ) ( not ( = ?auto_136210 ?auto_136216 ) ) ( not ( = ?auto_136211 ?auto_136216 ) ) ( not ( = ?auto_136212 ?auto_136216 ) ) ( not ( = ?auto_136213 ?auto_136216 ) ) ( not ( = ?auto_136215 ?auto_136216 ) ) ( not ( = ?auto_136214 ?auto_136216 ) ) ( ON ?auto_136209 ?auto_136208 ) ( ON-TABLE ?auto_136216 ) ( ON ?auto_136210 ?auto_136209 ) ( ON ?auto_136211 ?auto_136210 ) ( CLEAR ?auto_136213 ) ( ON ?auto_136212 ?auto_136211 ) ( CLEAR ?auto_136212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136216 ?auto_136208 ?auto_136209 ?auto_136210 ?auto_136211 )
      ( MAKE-6PILE ?auto_136208 ?auto_136209 ?auto_136210 ?auto_136211 ?auto_136212 ?auto_136213 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136217 - BLOCK
      ?auto_136218 - BLOCK
      ?auto_136219 - BLOCK
      ?auto_136220 - BLOCK
      ?auto_136221 - BLOCK
      ?auto_136222 - BLOCK
    )
    :vars
    (
      ?auto_136223 - BLOCK
      ?auto_136225 - BLOCK
      ?auto_136224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136217 ?auto_136218 ) ) ( not ( = ?auto_136217 ?auto_136219 ) ) ( not ( = ?auto_136217 ?auto_136220 ) ) ( not ( = ?auto_136217 ?auto_136221 ) ) ( not ( = ?auto_136217 ?auto_136222 ) ) ( not ( = ?auto_136218 ?auto_136219 ) ) ( not ( = ?auto_136218 ?auto_136220 ) ) ( not ( = ?auto_136218 ?auto_136221 ) ) ( not ( = ?auto_136218 ?auto_136222 ) ) ( not ( = ?auto_136219 ?auto_136220 ) ) ( not ( = ?auto_136219 ?auto_136221 ) ) ( not ( = ?auto_136219 ?auto_136222 ) ) ( not ( = ?auto_136220 ?auto_136221 ) ) ( not ( = ?auto_136220 ?auto_136222 ) ) ( not ( = ?auto_136221 ?auto_136222 ) ) ( not ( = ?auto_136217 ?auto_136223 ) ) ( not ( = ?auto_136218 ?auto_136223 ) ) ( not ( = ?auto_136219 ?auto_136223 ) ) ( not ( = ?auto_136220 ?auto_136223 ) ) ( not ( = ?auto_136221 ?auto_136223 ) ) ( not ( = ?auto_136222 ?auto_136223 ) ) ( ON-TABLE ?auto_136225 ) ( ON ?auto_136223 ?auto_136225 ) ( not ( = ?auto_136225 ?auto_136223 ) ) ( not ( = ?auto_136225 ?auto_136222 ) ) ( not ( = ?auto_136225 ?auto_136221 ) ) ( not ( = ?auto_136217 ?auto_136225 ) ) ( not ( = ?auto_136218 ?auto_136225 ) ) ( not ( = ?auto_136219 ?auto_136225 ) ) ( not ( = ?auto_136220 ?auto_136225 ) ) ( ON ?auto_136217 ?auto_136224 ) ( not ( = ?auto_136217 ?auto_136224 ) ) ( not ( = ?auto_136218 ?auto_136224 ) ) ( not ( = ?auto_136219 ?auto_136224 ) ) ( not ( = ?auto_136220 ?auto_136224 ) ) ( not ( = ?auto_136221 ?auto_136224 ) ) ( not ( = ?auto_136222 ?auto_136224 ) ) ( not ( = ?auto_136223 ?auto_136224 ) ) ( not ( = ?auto_136225 ?auto_136224 ) ) ( ON ?auto_136218 ?auto_136217 ) ( ON-TABLE ?auto_136224 ) ( ON ?auto_136219 ?auto_136218 ) ( ON ?auto_136220 ?auto_136219 ) ( ON ?auto_136221 ?auto_136220 ) ( CLEAR ?auto_136221 ) ( HOLDING ?auto_136222 ) ( CLEAR ?auto_136223 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136225 ?auto_136223 ?auto_136222 )
      ( MAKE-6PILE ?auto_136217 ?auto_136218 ?auto_136219 ?auto_136220 ?auto_136221 ?auto_136222 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136226 - BLOCK
      ?auto_136227 - BLOCK
      ?auto_136228 - BLOCK
      ?auto_136229 - BLOCK
      ?auto_136230 - BLOCK
      ?auto_136231 - BLOCK
    )
    :vars
    (
      ?auto_136232 - BLOCK
      ?auto_136234 - BLOCK
      ?auto_136233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136226 ?auto_136227 ) ) ( not ( = ?auto_136226 ?auto_136228 ) ) ( not ( = ?auto_136226 ?auto_136229 ) ) ( not ( = ?auto_136226 ?auto_136230 ) ) ( not ( = ?auto_136226 ?auto_136231 ) ) ( not ( = ?auto_136227 ?auto_136228 ) ) ( not ( = ?auto_136227 ?auto_136229 ) ) ( not ( = ?auto_136227 ?auto_136230 ) ) ( not ( = ?auto_136227 ?auto_136231 ) ) ( not ( = ?auto_136228 ?auto_136229 ) ) ( not ( = ?auto_136228 ?auto_136230 ) ) ( not ( = ?auto_136228 ?auto_136231 ) ) ( not ( = ?auto_136229 ?auto_136230 ) ) ( not ( = ?auto_136229 ?auto_136231 ) ) ( not ( = ?auto_136230 ?auto_136231 ) ) ( not ( = ?auto_136226 ?auto_136232 ) ) ( not ( = ?auto_136227 ?auto_136232 ) ) ( not ( = ?auto_136228 ?auto_136232 ) ) ( not ( = ?auto_136229 ?auto_136232 ) ) ( not ( = ?auto_136230 ?auto_136232 ) ) ( not ( = ?auto_136231 ?auto_136232 ) ) ( ON-TABLE ?auto_136234 ) ( ON ?auto_136232 ?auto_136234 ) ( not ( = ?auto_136234 ?auto_136232 ) ) ( not ( = ?auto_136234 ?auto_136231 ) ) ( not ( = ?auto_136234 ?auto_136230 ) ) ( not ( = ?auto_136226 ?auto_136234 ) ) ( not ( = ?auto_136227 ?auto_136234 ) ) ( not ( = ?auto_136228 ?auto_136234 ) ) ( not ( = ?auto_136229 ?auto_136234 ) ) ( ON ?auto_136226 ?auto_136233 ) ( not ( = ?auto_136226 ?auto_136233 ) ) ( not ( = ?auto_136227 ?auto_136233 ) ) ( not ( = ?auto_136228 ?auto_136233 ) ) ( not ( = ?auto_136229 ?auto_136233 ) ) ( not ( = ?auto_136230 ?auto_136233 ) ) ( not ( = ?auto_136231 ?auto_136233 ) ) ( not ( = ?auto_136232 ?auto_136233 ) ) ( not ( = ?auto_136234 ?auto_136233 ) ) ( ON ?auto_136227 ?auto_136226 ) ( ON-TABLE ?auto_136233 ) ( ON ?auto_136228 ?auto_136227 ) ( ON ?auto_136229 ?auto_136228 ) ( ON ?auto_136230 ?auto_136229 ) ( CLEAR ?auto_136232 ) ( ON ?auto_136231 ?auto_136230 ) ( CLEAR ?auto_136231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136233 ?auto_136226 ?auto_136227 ?auto_136228 ?auto_136229 ?auto_136230 )
      ( MAKE-6PILE ?auto_136226 ?auto_136227 ?auto_136228 ?auto_136229 ?auto_136230 ?auto_136231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136235 - BLOCK
      ?auto_136236 - BLOCK
      ?auto_136237 - BLOCK
      ?auto_136238 - BLOCK
      ?auto_136239 - BLOCK
      ?auto_136240 - BLOCK
    )
    :vars
    (
      ?auto_136242 - BLOCK
      ?auto_136243 - BLOCK
      ?auto_136241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136235 ?auto_136236 ) ) ( not ( = ?auto_136235 ?auto_136237 ) ) ( not ( = ?auto_136235 ?auto_136238 ) ) ( not ( = ?auto_136235 ?auto_136239 ) ) ( not ( = ?auto_136235 ?auto_136240 ) ) ( not ( = ?auto_136236 ?auto_136237 ) ) ( not ( = ?auto_136236 ?auto_136238 ) ) ( not ( = ?auto_136236 ?auto_136239 ) ) ( not ( = ?auto_136236 ?auto_136240 ) ) ( not ( = ?auto_136237 ?auto_136238 ) ) ( not ( = ?auto_136237 ?auto_136239 ) ) ( not ( = ?auto_136237 ?auto_136240 ) ) ( not ( = ?auto_136238 ?auto_136239 ) ) ( not ( = ?auto_136238 ?auto_136240 ) ) ( not ( = ?auto_136239 ?auto_136240 ) ) ( not ( = ?auto_136235 ?auto_136242 ) ) ( not ( = ?auto_136236 ?auto_136242 ) ) ( not ( = ?auto_136237 ?auto_136242 ) ) ( not ( = ?auto_136238 ?auto_136242 ) ) ( not ( = ?auto_136239 ?auto_136242 ) ) ( not ( = ?auto_136240 ?auto_136242 ) ) ( ON-TABLE ?auto_136243 ) ( not ( = ?auto_136243 ?auto_136242 ) ) ( not ( = ?auto_136243 ?auto_136240 ) ) ( not ( = ?auto_136243 ?auto_136239 ) ) ( not ( = ?auto_136235 ?auto_136243 ) ) ( not ( = ?auto_136236 ?auto_136243 ) ) ( not ( = ?auto_136237 ?auto_136243 ) ) ( not ( = ?auto_136238 ?auto_136243 ) ) ( ON ?auto_136235 ?auto_136241 ) ( not ( = ?auto_136235 ?auto_136241 ) ) ( not ( = ?auto_136236 ?auto_136241 ) ) ( not ( = ?auto_136237 ?auto_136241 ) ) ( not ( = ?auto_136238 ?auto_136241 ) ) ( not ( = ?auto_136239 ?auto_136241 ) ) ( not ( = ?auto_136240 ?auto_136241 ) ) ( not ( = ?auto_136242 ?auto_136241 ) ) ( not ( = ?auto_136243 ?auto_136241 ) ) ( ON ?auto_136236 ?auto_136235 ) ( ON-TABLE ?auto_136241 ) ( ON ?auto_136237 ?auto_136236 ) ( ON ?auto_136238 ?auto_136237 ) ( ON ?auto_136239 ?auto_136238 ) ( ON ?auto_136240 ?auto_136239 ) ( CLEAR ?auto_136240 ) ( HOLDING ?auto_136242 ) ( CLEAR ?auto_136243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136243 ?auto_136242 )
      ( MAKE-6PILE ?auto_136235 ?auto_136236 ?auto_136237 ?auto_136238 ?auto_136239 ?auto_136240 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136244 - BLOCK
      ?auto_136245 - BLOCK
      ?auto_136246 - BLOCK
      ?auto_136247 - BLOCK
      ?auto_136248 - BLOCK
      ?auto_136249 - BLOCK
    )
    :vars
    (
      ?auto_136251 - BLOCK
      ?auto_136252 - BLOCK
      ?auto_136250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136244 ?auto_136245 ) ) ( not ( = ?auto_136244 ?auto_136246 ) ) ( not ( = ?auto_136244 ?auto_136247 ) ) ( not ( = ?auto_136244 ?auto_136248 ) ) ( not ( = ?auto_136244 ?auto_136249 ) ) ( not ( = ?auto_136245 ?auto_136246 ) ) ( not ( = ?auto_136245 ?auto_136247 ) ) ( not ( = ?auto_136245 ?auto_136248 ) ) ( not ( = ?auto_136245 ?auto_136249 ) ) ( not ( = ?auto_136246 ?auto_136247 ) ) ( not ( = ?auto_136246 ?auto_136248 ) ) ( not ( = ?auto_136246 ?auto_136249 ) ) ( not ( = ?auto_136247 ?auto_136248 ) ) ( not ( = ?auto_136247 ?auto_136249 ) ) ( not ( = ?auto_136248 ?auto_136249 ) ) ( not ( = ?auto_136244 ?auto_136251 ) ) ( not ( = ?auto_136245 ?auto_136251 ) ) ( not ( = ?auto_136246 ?auto_136251 ) ) ( not ( = ?auto_136247 ?auto_136251 ) ) ( not ( = ?auto_136248 ?auto_136251 ) ) ( not ( = ?auto_136249 ?auto_136251 ) ) ( ON-TABLE ?auto_136252 ) ( not ( = ?auto_136252 ?auto_136251 ) ) ( not ( = ?auto_136252 ?auto_136249 ) ) ( not ( = ?auto_136252 ?auto_136248 ) ) ( not ( = ?auto_136244 ?auto_136252 ) ) ( not ( = ?auto_136245 ?auto_136252 ) ) ( not ( = ?auto_136246 ?auto_136252 ) ) ( not ( = ?auto_136247 ?auto_136252 ) ) ( ON ?auto_136244 ?auto_136250 ) ( not ( = ?auto_136244 ?auto_136250 ) ) ( not ( = ?auto_136245 ?auto_136250 ) ) ( not ( = ?auto_136246 ?auto_136250 ) ) ( not ( = ?auto_136247 ?auto_136250 ) ) ( not ( = ?auto_136248 ?auto_136250 ) ) ( not ( = ?auto_136249 ?auto_136250 ) ) ( not ( = ?auto_136251 ?auto_136250 ) ) ( not ( = ?auto_136252 ?auto_136250 ) ) ( ON ?auto_136245 ?auto_136244 ) ( ON-TABLE ?auto_136250 ) ( ON ?auto_136246 ?auto_136245 ) ( ON ?auto_136247 ?auto_136246 ) ( ON ?auto_136248 ?auto_136247 ) ( ON ?auto_136249 ?auto_136248 ) ( CLEAR ?auto_136252 ) ( ON ?auto_136251 ?auto_136249 ) ( CLEAR ?auto_136251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136250 ?auto_136244 ?auto_136245 ?auto_136246 ?auto_136247 ?auto_136248 ?auto_136249 )
      ( MAKE-6PILE ?auto_136244 ?auto_136245 ?auto_136246 ?auto_136247 ?auto_136248 ?auto_136249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136253 - BLOCK
      ?auto_136254 - BLOCK
      ?auto_136255 - BLOCK
      ?auto_136256 - BLOCK
      ?auto_136257 - BLOCK
      ?auto_136258 - BLOCK
    )
    :vars
    (
      ?auto_136260 - BLOCK
      ?auto_136261 - BLOCK
      ?auto_136259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136253 ?auto_136254 ) ) ( not ( = ?auto_136253 ?auto_136255 ) ) ( not ( = ?auto_136253 ?auto_136256 ) ) ( not ( = ?auto_136253 ?auto_136257 ) ) ( not ( = ?auto_136253 ?auto_136258 ) ) ( not ( = ?auto_136254 ?auto_136255 ) ) ( not ( = ?auto_136254 ?auto_136256 ) ) ( not ( = ?auto_136254 ?auto_136257 ) ) ( not ( = ?auto_136254 ?auto_136258 ) ) ( not ( = ?auto_136255 ?auto_136256 ) ) ( not ( = ?auto_136255 ?auto_136257 ) ) ( not ( = ?auto_136255 ?auto_136258 ) ) ( not ( = ?auto_136256 ?auto_136257 ) ) ( not ( = ?auto_136256 ?auto_136258 ) ) ( not ( = ?auto_136257 ?auto_136258 ) ) ( not ( = ?auto_136253 ?auto_136260 ) ) ( not ( = ?auto_136254 ?auto_136260 ) ) ( not ( = ?auto_136255 ?auto_136260 ) ) ( not ( = ?auto_136256 ?auto_136260 ) ) ( not ( = ?auto_136257 ?auto_136260 ) ) ( not ( = ?auto_136258 ?auto_136260 ) ) ( not ( = ?auto_136261 ?auto_136260 ) ) ( not ( = ?auto_136261 ?auto_136258 ) ) ( not ( = ?auto_136261 ?auto_136257 ) ) ( not ( = ?auto_136253 ?auto_136261 ) ) ( not ( = ?auto_136254 ?auto_136261 ) ) ( not ( = ?auto_136255 ?auto_136261 ) ) ( not ( = ?auto_136256 ?auto_136261 ) ) ( ON ?auto_136253 ?auto_136259 ) ( not ( = ?auto_136253 ?auto_136259 ) ) ( not ( = ?auto_136254 ?auto_136259 ) ) ( not ( = ?auto_136255 ?auto_136259 ) ) ( not ( = ?auto_136256 ?auto_136259 ) ) ( not ( = ?auto_136257 ?auto_136259 ) ) ( not ( = ?auto_136258 ?auto_136259 ) ) ( not ( = ?auto_136260 ?auto_136259 ) ) ( not ( = ?auto_136261 ?auto_136259 ) ) ( ON ?auto_136254 ?auto_136253 ) ( ON-TABLE ?auto_136259 ) ( ON ?auto_136255 ?auto_136254 ) ( ON ?auto_136256 ?auto_136255 ) ( ON ?auto_136257 ?auto_136256 ) ( ON ?auto_136258 ?auto_136257 ) ( ON ?auto_136260 ?auto_136258 ) ( CLEAR ?auto_136260 ) ( HOLDING ?auto_136261 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136261 )
      ( MAKE-6PILE ?auto_136253 ?auto_136254 ?auto_136255 ?auto_136256 ?auto_136257 ?auto_136258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_136262 - BLOCK
      ?auto_136263 - BLOCK
      ?auto_136264 - BLOCK
      ?auto_136265 - BLOCK
      ?auto_136266 - BLOCK
      ?auto_136267 - BLOCK
    )
    :vars
    (
      ?auto_136268 - BLOCK
      ?auto_136270 - BLOCK
      ?auto_136269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136262 ?auto_136263 ) ) ( not ( = ?auto_136262 ?auto_136264 ) ) ( not ( = ?auto_136262 ?auto_136265 ) ) ( not ( = ?auto_136262 ?auto_136266 ) ) ( not ( = ?auto_136262 ?auto_136267 ) ) ( not ( = ?auto_136263 ?auto_136264 ) ) ( not ( = ?auto_136263 ?auto_136265 ) ) ( not ( = ?auto_136263 ?auto_136266 ) ) ( not ( = ?auto_136263 ?auto_136267 ) ) ( not ( = ?auto_136264 ?auto_136265 ) ) ( not ( = ?auto_136264 ?auto_136266 ) ) ( not ( = ?auto_136264 ?auto_136267 ) ) ( not ( = ?auto_136265 ?auto_136266 ) ) ( not ( = ?auto_136265 ?auto_136267 ) ) ( not ( = ?auto_136266 ?auto_136267 ) ) ( not ( = ?auto_136262 ?auto_136268 ) ) ( not ( = ?auto_136263 ?auto_136268 ) ) ( not ( = ?auto_136264 ?auto_136268 ) ) ( not ( = ?auto_136265 ?auto_136268 ) ) ( not ( = ?auto_136266 ?auto_136268 ) ) ( not ( = ?auto_136267 ?auto_136268 ) ) ( not ( = ?auto_136270 ?auto_136268 ) ) ( not ( = ?auto_136270 ?auto_136267 ) ) ( not ( = ?auto_136270 ?auto_136266 ) ) ( not ( = ?auto_136262 ?auto_136270 ) ) ( not ( = ?auto_136263 ?auto_136270 ) ) ( not ( = ?auto_136264 ?auto_136270 ) ) ( not ( = ?auto_136265 ?auto_136270 ) ) ( ON ?auto_136262 ?auto_136269 ) ( not ( = ?auto_136262 ?auto_136269 ) ) ( not ( = ?auto_136263 ?auto_136269 ) ) ( not ( = ?auto_136264 ?auto_136269 ) ) ( not ( = ?auto_136265 ?auto_136269 ) ) ( not ( = ?auto_136266 ?auto_136269 ) ) ( not ( = ?auto_136267 ?auto_136269 ) ) ( not ( = ?auto_136268 ?auto_136269 ) ) ( not ( = ?auto_136270 ?auto_136269 ) ) ( ON ?auto_136263 ?auto_136262 ) ( ON-TABLE ?auto_136269 ) ( ON ?auto_136264 ?auto_136263 ) ( ON ?auto_136265 ?auto_136264 ) ( ON ?auto_136266 ?auto_136265 ) ( ON ?auto_136267 ?auto_136266 ) ( ON ?auto_136268 ?auto_136267 ) ( ON ?auto_136270 ?auto_136268 ) ( CLEAR ?auto_136270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136269 ?auto_136262 ?auto_136263 ?auto_136264 ?auto_136265 ?auto_136266 ?auto_136267 ?auto_136268 )
      ( MAKE-6PILE ?auto_136262 ?auto_136263 ?auto_136264 ?auto_136265 ?auto_136266 ?auto_136267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136272 - BLOCK
    )
    :vars
    (
      ?auto_136273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136273 ?auto_136272 ) ( CLEAR ?auto_136273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136272 ) ( not ( = ?auto_136272 ?auto_136273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136273 ?auto_136272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136274 - BLOCK
    )
    :vars
    (
      ?auto_136275 - BLOCK
      ?auto_136276 - BLOCK
      ?auto_136277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136275 ?auto_136274 ) ( CLEAR ?auto_136275 ) ( ON-TABLE ?auto_136274 ) ( not ( = ?auto_136274 ?auto_136275 ) ) ( HOLDING ?auto_136276 ) ( CLEAR ?auto_136277 ) ( not ( = ?auto_136274 ?auto_136276 ) ) ( not ( = ?auto_136274 ?auto_136277 ) ) ( not ( = ?auto_136275 ?auto_136276 ) ) ( not ( = ?auto_136275 ?auto_136277 ) ) ( not ( = ?auto_136276 ?auto_136277 ) ) )
    :subtasks
    ( ( !STACK ?auto_136276 ?auto_136277 )
      ( MAKE-1PILE ?auto_136274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136278 - BLOCK
    )
    :vars
    (
      ?auto_136280 - BLOCK
      ?auto_136281 - BLOCK
      ?auto_136279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136280 ?auto_136278 ) ( ON-TABLE ?auto_136278 ) ( not ( = ?auto_136278 ?auto_136280 ) ) ( CLEAR ?auto_136281 ) ( not ( = ?auto_136278 ?auto_136279 ) ) ( not ( = ?auto_136278 ?auto_136281 ) ) ( not ( = ?auto_136280 ?auto_136279 ) ) ( not ( = ?auto_136280 ?auto_136281 ) ) ( not ( = ?auto_136279 ?auto_136281 ) ) ( ON ?auto_136279 ?auto_136280 ) ( CLEAR ?auto_136279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136278 ?auto_136280 )
      ( MAKE-1PILE ?auto_136278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136282 - BLOCK
    )
    :vars
    (
      ?auto_136283 - BLOCK
      ?auto_136284 - BLOCK
      ?auto_136285 - BLOCK
      ?auto_136287 - BLOCK
      ?auto_136288 - BLOCK
      ?auto_136289 - BLOCK
      ?auto_136286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136283 ?auto_136282 ) ( ON-TABLE ?auto_136282 ) ( not ( = ?auto_136282 ?auto_136283 ) ) ( not ( = ?auto_136282 ?auto_136284 ) ) ( not ( = ?auto_136282 ?auto_136285 ) ) ( not ( = ?auto_136283 ?auto_136284 ) ) ( not ( = ?auto_136283 ?auto_136285 ) ) ( not ( = ?auto_136284 ?auto_136285 ) ) ( ON ?auto_136284 ?auto_136283 ) ( CLEAR ?auto_136284 ) ( HOLDING ?auto_136285 ) ( CLEAR ?auto_136287 ) ( ON-TABLE ?auto_136288 ) ( ON ?auto_136289 ?auto_136288 ) ( ON ?auto_136286 ?auto_136289 ) ( ON ?auto_136287 ?auto_136286 ) ( not ( = ?auto_136288 ?auto_136289 ) ) ( not ( = ?auto_136288 ?auto_136286 ) ) ( not ( = ?auto_136288 ?auto_136287 ) ) ( not ( = ?auto_136288 ?auto_136285 ) ) ( not ( = ?auto_136289 ?auto_136286 ) ) ( not ( = ?auto_136289 ?auto_136287 ) ) ( not ( = ?auto_136289 ?auto_136285 ) ) ( not ( = ?auto_136286 ?auto_136287 ) ) ( not ( = ?auto_136286 ?auto_136285 ) ) ( not ( = ?auto_136287 ?auto_136285 ) ) ( not ( = ?auto_136282 ?auto_136287 ) ) ( not ( = ?auto_136282 ?auto_136288 ) ) ( not ( = ?auto_136282 ?auto_136289 ) ) ( not ( = ?auto_136282 ?auto_136286 ) ) ( not ( = ?auto_136283 ?auto_136287 ) ) ( not ( = ?auto_136283 ?auto_136288 ) ) ( not ( = ?auto_136283 ?auto_136289 ) ) ( not ( = ?auto_136283 ?auto_136286 ) ) ( not ( = ?auto_136284 ?auto_136287 ) ) ( not ( = ?auto_136284 ?auto_136288 ) ) ( not ( = ?auto_136284 ?auto_136289 ) ) ( not ( = ?auto_136284 ?auto_136286 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136288 ?auto_136289 ?auto_136286 ?auto_136287 ?auto_136285 )
      ( MAKE-1PILE ?auto_136282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136290 - BLOCK
    )
    :vars
    (
      ?auto_136295 - BLOCK
      ?auto_136297 - BLOCK
      ?auto_136296 - BLOCK
      ?auto_136294 - BLOCK
      ?auto_136293 - BLOCK
      ?auto_136291 - BLOCK
      ?auto_136292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136295 ?auto_136290 ) ( ON-TABLE ?auto_136290 ) ( not ( = ?auto_136290 ?auto_136295 ) ) ( not ( = ?auto_136290 ?auto_136297 ) ) ( not ( = ?auto_136290 ?auto_136296 ) ) ( not ( = ?auto_136295 ?auto_136297 ) ) ( not ( = ?auto_136295 ?auto_136296 ) ) ( not ( = ?auto_136297 ?auto_136296 ) ) ( ON ?auto_136297 ?auto_136295 ) ( CLEAR ?auto_136294 ) ( ON-TABLE ?auto_136293 ) ( ON ?auto_136291 ?auto_136293 ) ( ON ?auto_136292 ?auto_136291 ) ( ON ?auto_136294 ?auto_136292 ) ( not ( = ?auto_136293 ?auto_136291 ) ) ( not ( = ?auto_136293 ?auto_136292 ) ) ( not ( = ?auto_136293 ?auto_136294 ) ) ( not ( = ?auto_136293 ?auto_136296 ) ) ( not ( = ?auto_136291 ?auto_136292 ) ) ( not ( = ?auto_136291 ?auto_136294 ) ) ( not ( = ?auto_136291 ?auto_136296 ) ) ( not ( = ?auto_136292 ?auto_136294 ) ) ( not ( = ?auto_136292 ?auto_136296 ) ) ( not ( = ?auto_136294 ?auto_136296 ) ) ( not ( = ?auto_136290 ?auto_136294 ) ) ( not ( = ?auto_136290 ?auto_136293 ) ) ( not ( = ?auto_136290 ?auto_136291 ) ) ( not ( = ?auto_136290 ?auto_136292 ) ) ( not ( = ?auto_136295 ?auto_136294 ) ) ( not ( = ?auto_136295 ?auto_136293 ) ) ( not ( = ?auto_136295 ?auto_136291 ) ) ( not ( = ?auto_136295 ?auto_136292 ) ) ( not ( = ?auto_136297 ?auto_136294 ) ) ( not ( = ?auto_136297 ?auto_136293 ) ) ( not ( = ?auto_136297 ?auto_136291 ) ) ( not ( = ?auto_136297 ?auto_136292 ) ) ( ON ?auto_136296 ?auto_136297 ) ( CLEAR ?auto_136296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136290 ?auto_136295 ?auto_136297 )
      ( MAKE-1PILE ?auto_136290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136298 - BLOCK
    )
    :vars
    (
      ?auto_136305 - BLOCK
      ?auto_136303 - BLOCK
      ?auto_136302 - BLOCK
      ?auto_136300 - BLOCK
      ?auto_136304 - BLOCK
      ?auto_136301 - BLOCK
      ?auto_136299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136305 ?auto_136298 ) ( ON-TABLE ?auto_136298 ) ( not ( = ?auto_136298 ?auto_136305 ) ) ( not ( = ?auto_136298 ?auto_136303 ) ) ( not ( = ?auto_136298 ?auto_136302 ) ) ( not ( = ?auto_136305 ?auto_136303 ) ) ( not ( = ?auto_136305 ?auto_136302 ) ) ( not ( = ?auto_136303 ?auto_136302 ) ) ( ON ?auto_136303 ?auto_136305 ) ( ON-TABLE ?auto_136300 ) ( ON ?auto_136304 ?auto_136300 ) ( ON ?auto_136301 ?auto_136304 ) ( not ( = ?auto_136300 ?auto_136304 ) ) ( not ( = ?auto_136300 ?auto_136301 ) ) ( not ( = ?auto_136300 ?auto_136299 ) ) ( not ( = ?auto_136300 ?auto_136302 ) ) ( not ( = ?auto_136304 ?auto_136301 ) ) ( not ( = ?auto_136304 ?auto_136299 ) ) ( not ( = ?auto_136304 ?auto_136302 ) ) ( not ( = ?auto_136301 ?auto_136299 ) ) ( not ( = ?auto_136301 ?auto_136302 ) ) ( not ( = ?auto_136299 ?auto_136302 ) ) ( not ( = ?auto_136298 ?auto_136299 ) ) ( not ( = ?auto_136298 ?auto_136300 ) ) ( not ( = ?auto_136298 ?auto_136304 ) ) ( not ( = ?auto_136298 ?auto_136301 ) ) ( not ( = ?auto_136305 ?auto_136299 ) ) ( not ( = ?auto_136305 ?auto_136300 ) ) ( not ( = ?auto_136305 ?auto_136304 ) ) ( not ( = ?auto_136305 ?auto_136301 ) ) ( not ( = ?auto_136303 ?auto_136299 ) ) ( not ( = ?auto_136303 ?auto_136300 ) ) ( not ( = ?auto_136303 ?auto_136304 ) ) ( not ( = ?auto_136303 ?auto_136301 ) ) ( ON ?auto_136302 ?auto_136303 ) ( CLEAR ?auto_136302 ) ( HOLDING ?auto_136299 ) ( CLEAR ?auto_136301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136300 ?auto_136304 ?auto_136301 ?auto_136299 )
      ( MAKE-1PILE ?auto_136298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136306 - BLOCK
    )
    :vars
    (
      ?auto_136309 - BLOCK
      ?auto_136308 - BLOCK
      ?auto_136313 - BLOCK
      ?auto_136311 - BLOCK
      ?auto_136310 - BLOCK
      ?auto_136312 - BLOCK
      ?auto_136307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136309 ?auto_136306 ) ( ON-TABLE ?auto_136306 ) ( not ( = ?auto_136306 ?auto_136309 ) ) ( not ( = ?auto_136306 ?auto_136308 ) ) ( not ( = ?auto_136306 ?auto_136313 ) ) ( not ( = ?auto_136309 ?auto_136308 ) ) ( not ( = ?auto_136309 ?auto_136313 ) ) ( not ( = ?auto_136308 ?auto_136313 ) ) ( ON ?auto_136308 ?auto_136309 ) ( ON-TABLE ?auto_136311 ) ( ON ?auto_136310 ?auto_136311 ) ( ON ?auto_136312 ?auto_136310 ) ( not ( = ?auto_136311 ?auto_136310 ) ) ( not ( = ?auto_136311 ?auto_136312 ) ) ( not ( = ?auto_136311 ?auto_136307 ) ) ( not ( = ?auto_136311 ?auto_136313 ) ) ( not ( = ?auto_136310 ?auto_136312 ) ) ( not ( = ?auto_136310 ?auto_136307 ) ) ( not ( = ?auto_136310 ?auto_136313 ) ) ( not ( = ?auto_136312 ?auto_136307 ) ) ( not ( = ?auto_136312 ?auto_136313 ) ) ( not ( = ?auto_136307 ?auto_136313 ) ) ( not ( = ?auto_136306 ?auto_136307 ) ) ( not ( = ?auto_136306 ?auto_136311 ) ) ( not ( = ?auto_136306 ?auto_136310 ) ) ( not ( = ?auto_136306 ?auto_136312 ) ) ( not ( = ?auto_136309 ?auto_136307 ) ) ( not ( = ?auto_136309 ?auto_136311 ) ) ( not ( = ?auto_136309 ?auto_136310 ) ) ( not ( = ?auto_136309 ?auto_136312 ) ) ( not ( = ?auto_136308 ?auto_136307 ) ) ( not ( = ?auto_136308 ?auto_136311 ) ) ( not ( = ?auto_136308 ?auto_136310 ) ) ( not ( = ?auto_136308 ?auto_136312 ) ) ( ON ?auto_136313 ?auto_136308 ) ( CLEAR ?auto_136312 ) ( ON ?auto_136307 ?auto_136313 ) ( CLEAR ?auto_136307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136306 ?auto_136309 ?auto_136308 ?auto_136313 )
      ( MAKE-1PILE ?auto_136306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136314 - BLOCK
    )
    :vars
    (
      ?auto_136316 - BLOCK
      ?auto_136315 - BLOCK
      ?auto_136320 - BLOCK
      ?auto_136319 - BLOCK
      ?auto_136317 - BLOCK
      ?auto_136318 - BLOCK
      ?auto_136321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136316 ?auto_136314 ) ( ON-TABLE ?auto_136314 ) ( not ( = ?auto_136314 ?auto_136316 ) ) ( not ( = ?auto_136314 ?auto_136315 ) ) ( not ( = ?auto_136314 ?auto_136320 ) ) ( not ( = ?auto_136316 ?auto_136315 ) ) ( not ( = ?auto_136316 ?auto_136320 ) ) ( not ( = ?auto_136315 ?auto_136320 ) ) ( ON ?auto_136315 ?auto_136316 ) ( ON-TABLE ?auto_136319 ) ( ON ?auto_136317 ?auto_136319 ) ( not ( = ?auto_136319 ?auto_136317 ) ) ( not ( = ?auto_136319 ?auto_136318 ) ) ( not ( = ?auto_136319 ?auto_136321 ) ) ( not ( = ?auto_136319 ?auto_136320 ) ) ( not ( = ?auto_136317 ?auto_136318 ) ) ( not ( = ?auto_136317 ?auto_136321 ) ) ( not ( = ?auto_136317 ?auto_136320 ) ) ( not ( = ?auto_136318 ?auto_136321 ) ) ( not ( = ?auto_136318 ?auto_136320 ) ) ( not ( = ?auto_136321 ?auto_136320 ) ) ( not ( = ?auto_136314 ?auto_136321 ) ) ( not ( = ?auto_136314 ?auto_136319 ) ) ( not ( = ?auto_136314 ?auto_136317 ) ) ( not ( = ?auto_136314 ?auto_136318 ) ) ( not ( = ?auto_136316 ?auto_136321 ) ) ( not ( = ?auto_136316 ?auto_136319 ) ) ( not ( = ?auto_136316 ?auto_136317 ) ) ( not ( = ?auto_136316 ?auto_136318 ) ) ( not ( = ?auto_136315 ?auto_136321 ) ) ( not ( = ?auto_136315 ?auto_136319 ) ) ( not ( = ?auto_136315 ?auto_136317 ) ) ( not ( = ?auto_136315 ?auto_136318 ) ) ( ON ?auto_136320 ?auto_136315 ) ( ON ?auto_136321 ?auto_136320 ) ( CLEAR ?auto_136321 ) ( HOLDING ?auto_136318 ) ( CLEAR ?auto_136317 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136319 ?auto_136317 ?auto_136318 )
      ( MAKE-1PILE ?auto_136314 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136322 - BLOCK
    )
    :vars
    (
      ?auto_136325 - BLOCK
      ?auto_136327 - BLOCK
      ?auto_136323 - BLOCK
      ?auto_136328 - BLOCK
      ?auto_136326 - BLOCK
      ?auto_136329 - BLOCK
      ?auto_136324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136325 ?auto_136322 ) ( ON-TABLE ?auto_136322 ) ( not ( = ?auto_136322 ?auto_136325 ) ) ( not ( = ?auto_136322 ?auto_136327 ) ) ( not ( = ?auto_136322 ?auto_136323 ) ) ( not ( = ?auto_136325 ?auto_136327 ) ) ( not ( = ?auto_136325 ?auto_136323 ) ) ( not ( = ?auto_136327 ?auto_136323 ) ) ( ON ?auto_136327 ?auto_136325 ) ( ON-TABLE ?auto_136328 ) ( ON ?auto_136326 ?auto_136328 ) ( not ( = ?auto_136328 ?auto_136326 ) ) ( not ( = ?auto_136328 ?auto_136329 ) ) ( not ( = ?auto_136328 ?auto_136324 ) ) ( not ( = ?auto_136328 ?auto_136323 ) ) ( not ( = ?auto_136326 ?auto_136329 ) ) ( not ( = ?auto_136326 ?auto_136324 ) ) ( not ( = ?auto_136326 ?auto_136323 ) ) ( not ( = ?auto_136329 ?auto_136324 ) ) ( not ( = ?auto_136329 ?auto_136323 ) ) ( not ( = ?auto_136324 ?auto_136323 ) ) ( not ( = ?auto_136322 ?auto_136324 ) ) ( not ( = ?auto_136322 ?auto_136328 ) ) ( not ( = ?auto_136322 ?auto_136326 ) ) ( not ( = ?auto_136322 ?auto_136329 ) ) ( not ( = ?auto_136325 ?auto_136324 ) ) ( not ( = ?auto_136325 ?auto_136328 ) ) ( not ( = ?auto_136325 ?auto_136326 ) ) ( not ( = ?auto_136325 ?auto_136329 ) ) ( not ( = ?auto_136327 ?auto_136324 ) ) ( not ( = ?auto_136327 ?auto_136328 ) ) ( not ( = ?auto_136327 ?auto_136326 ) ) ( not ( = ?auto_136327 ?auto_136329 ) ) ( ON ?auto_136323 ?auto_136327 ) ( ON ?auto_136324 ?auto_136323 ) ( CLEAR ?auto_136326 ) ( ON ?auto_136329 ?auto_136324 ) ( CLEAR ?auto_136329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136322 ?auto_136325 ?auto_136327 ?auto_136323 ?auto_136324 )
      ( MAKE-1PILE ?auto_136322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136330 - BLOCK
    )
    :vars
    (
      ?auto_136333 - BLOCK
      ?auto_136335 - BLOCK
      ?auto_136336 - BLOCK
      ?auto_136331 - BLOCK
      ?auto_136334 - BLOCK
      ?auto_136337 - BLOCK
      ?auto_136332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136333 ?auto_136330 ) ( ON-TABLE ?auto_136330 ) ( not ( = ?auto_136330 ?auto_136333 ) ) ( not ( = ?auto_136330 ?auto_136335 ) ) ( not ( = ?auto_136330 ?auto_136336 ) ) ( not ( = ?auto_136333 ?auto_136335 ) ) ( not ( = ?auto_136333 ?auto_136336 ) ) ( not ( = ?auto_136335 ?auto_136336 ) ) ( ON ?auto_136335 ?auto_136333 ) ( ON-TABLE ?auto_136331 ) ( not ( = ?auto_136331 ?auto_136334 ) ) ( not ( = ?auto_136331 ?auto_136337 ) ) ( not ( = ?auto_136331 ?auto_136332 ) ) ( not ( = ?auto_136331 ?auto_136336 ) ) ( not ( = ?auto_136334 ?auto_136337 ) ) ( not ( = ?auto_136334 ?auto_136332 ) ) ( not ( = ?auto_136334 ?auto_136336 ) ) ( not ( = ?auto_136337 ?auto_136332 ) ) ( not ( = ?auto_136337 ?auto_136336 ) ) ( not ( = ?auto_136332 ?auto_136336 ) ) ( not ( = ?auto_136330 ?auto_136332 ) ) ( not ( = ?auto_136330 ?auto_136331 ) ) ( not ( = ?auto_136330 ?auto_136334 ) ) ( not ( = ?auto_136330 ?auto_136337 ) ) ( not ( = ?auto_136333 ?auto_136332 ) ) ( not ( = ?auto_136333 ?auto_136331 ) ) ( not ( = ?auto_136333 ?auto_136334 ) ) ( not ( = ?auto_136333 ?auto_136337 ) ) ( not ( = ?auto_136335 ?auto_136332 ) ) ( not ( = ?auto_136335 ?auto_136331 ) ) ( not ( = ?auto_136335 ?auto_136334 ) ) ( not ( = ?auto_136335 ?auto_136337 ) ) ( ON ?auto_136336 ?auto_136335 ) ( ON ?auto_136332 ?auto_136336 ) ( ON ?auto_136337 ?auto_136332 ) ( CLEAR ?auto_136337 ) ( HOLDING ?auto_136334 ) ( CLEAR ?auto_136331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136331 ?auto_136334 )
      ( MAKE-1PILE ?auto_136330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136338 - BLOCK
    )
    :vars
    (
      ?auto_136344 - BLOCK
      ?auto_136343 - BLOCK
      ?auto_136340 - BLOCK
      ?auto_136341 - BLOCK
      ?auto_136345 - BLOCK
      ?auto_136339 - BLOCK
      ?auto_136342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136344 ?auto_136338 ) ( ON-TABLE ?auto_136338 ) ( not ( = ?auto_136338 ?auto_136344 ) ) ( not ( = ?auto_136338 ?auto_136343 ) ) ( not ( = ?auto_136338 ?auto_136340 ) ) ( not ( = ?auto_136344 ?auto_136343 ) ) ( not ( = ?auto_136344 ?auto_136340 ) ) ( not ( = ?auto_136343 ?auto_136340 ) ) ( ON ?auto_136343 ?auto_136344 ) ( ON-TABLE ?auto_136341 ) ( not ( = ?auto_136341 ?auto_136345 ) ) ( not ( = ?auto_136341 ?auto_136339 ) ) ( not ( = ?auto_136341 ?auto_136342 ) ) ( not ( = ?auto_136341 ?auto_136340 ) ) ( not ( = ?auto_136345 ?auto_136339 ) ) ( not ( = ?auto_136345 ?auto_136342 ) ) ( not ( = ?auto_136345 ?auto_136340 ) ) ( not ( = ?auto_136339 ?auto_136342 ) ) ( not ( = ?auto_136339 ?auto_136340 ) ) ( not ( = ?auto_136342 ?auto_136340 ) ) ( not ( = ?auto_136338 ?auto_136342 ) ) ( not ( = ?auto_136338 ?auto_136341 ) ) ( not ( = ?auto_136338 ?auto_136345 ) ) ( not ( = ?auto_136338 ?auto_136339 ) ) ( not ( = ?auto_136344 ?auto_136342 ) ) ( not ( = ?auto_136344 ?auto_136341 ) ) ( not ( = ?auto_136344 ?auto_136345 ) ) ( not ( = ?auto_136344 ?auto_136339 ) ) ( not ( = ?auto_136343 ?auto_136342 ) ) ( not ( = ?auto_136343 ?auto_136341 ) ) ( not ( = ?auto_136343 ?auto_136345 ) ) ( not ( = ?auto_136343 ?auto_136339 ) ) ( ON ?auto_136340 ?auto_136343 ) ( ON ?auto_136342 ?auto_136340 ) ( ON ?auto_136339 ?auto_136342 ) ( CLEAR ?auto_136341 ) ( ON ?auto_136345 ?auto_136339 ) ( CLEAR ?auto_136345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136338 ?auto_136344 ?auto_136343 ?auto_136340 ?auto_136342 ?auto_136339 )
      ( MAKE-1PILE ?auto_136338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136346 - BLOCK
    )
    :vars
    (
      ?auto_136348 - BLOCK
      ?auto_136350 - BLOCK
      ?auto_136349 - BLOCK
      ?auto_136347 - BLOCK
      ?auto_136352 - BLOCK
      ?auto_136353 - BLOCK
      ?auto_136351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136348 ?auto_136346 ) ( ON-TABLE ?auto_136346 ) ( not ( = ?auto_136346 ?auto_136348 ) ) ( not ( = ?auto_136346 ?auto_136350 ) ) ( not ( = ?auto_136346 ?auto_136349 ) ) ( not ( = ?auto_136348 ?auto_136350 ) ) ( not ( = ?auto_136348 ?auto_136349 ) ) ( not ( = ?auto_136350 ?auto_136349 ) ) ( ON ?auto_136350 ?auto_136348 ) ( not ( = ?auto_136347 ?auto_136352 ) ) ( not ( = ?auto_136347 ?auto_136353 ) ) ( not ( = ?auto_136347 ?auto_136351 ) ) ( not ( = ?auto_136347 ?auto_136349 ) ) ( not ( = ?auto_136352 ?auto_136353 ) ) ( not ( = ?auto_136352 ?auto_136351 ) ) ( not ( = ?auto_136352 ?auto_136349 ) ) ( not ( = ?auto_136353 ?auto_136351 ) ) ( not ( = ?auto_136353 ?auto_136349 ) ) ( not ( = ?auto_136351 ?auto_136349 ) ) ( not ( = ?auto_136346 ?auto_136351 ) ) ( not ( = ?auto_136346 ?auto_136347 ) ) ( not ( = ?auto_136346 ?auto_136352 ) ) ( not ( = ?auto_136346 ?auto_136353 ) ) ( not ( = ?auto_136348 ?auto_136351 ) ) ( not ( = ?auto_136348 ?auto_136347 ) ) ( not ( = ?auto_136348 ?auto_136352 ) ) ( not ( = ?auto_136348 ?auto_136353 ) ) ( not ( = ?auto_136350 ?auto_136351 ) ) ( not ( = ?auto_136350 ?auto_136347 ) ) ( not ( = ?auto_136350 ?auto_136352 ) ) ( not ( = ?auto_136350 ?auto_136353 ) ) ( ON ?auto_136349 ?auto_136350 ) ( ON ?auto_136351 ?auto_136349 ) ( ON ?auto_136353 ?auto_136351 ) ( ON ?auto_136352 ?auto_136353 ) ( CLEAR ?auto_136352 ) ( HOLDING ?auto_136347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136347 )
      ( MAKE-1PILE ?auto_136346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136354 - BLOCK
    )
    :vars
    (
      ?auto_136355 - BLOCK
      ?auto_136358 - BLOCK
      ?auto_136357 - BLOCK
      ?auto_136360 - BLOCK
      ?auto_136359 - BLOCK
      ?auto_136356 - BLOCK
      ?auto_136361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136355 ?auto_136354 ) ( ON-TABLE ?auto_136354 ) ( not ( = ?auto_136354 ?auto_136355 ) ) ( not ( = ?auto_136354 ?auto_136358 ) ) ( not ( = ?auto_136354 ?auto_136357 ) ) ( not ( = ?auto_136355 ?auto_136358 ) ) ( not ( = ?auto_136355 ?auto_136357 ) ) ( not ( = ?auto_136358 ?auto_136357 ) ) ( ON ?auto_136358 ?auto_136355 ) ( not ( = ?auto_136360 ?auto_136359 ) ) ( not ( = ?auto_136360 ?auto_136356 ) ) ( not ( = ?auto_136360 ?auto_136361 ) ) ( not ( = ?auto_136360 ?auto_136357 ) ) ( not ( = ?auto_136359 ?auto_136356 ) ) ( not ( = ?auto_136359 ?auto_136361 ) ) ( not ( = ?auto_136359 ?auto_136357 ) ) ( not ( = ?auto_136356 ?auto_136361 ) ) ( not ( = ?auto_136356 ?auto_136357 ) ) ( not ( = ?auto_136361 ?auto_136357 ) ) ( not ( = ?auto_136354 ?auto_136361 ) ) ( not ( = ?auto_136354 ?auto_136360 ) ) ( not ( = ?auto_136354 ?auto_136359 ) ) ( not ( = ?auto_136354 ?auto_136356 ) ) ( not ( = ?auto_136355 ?auto_136361 ) ) ( not ( = ?auto_136355 ?auto_136360 ) ) ( not ( = ?auto_136355 ?auto_136359 ) ) ( not ( = ?auto_136355 ?auto_136356 ) ) ( not ( = ?auto_136358 ?auto_136361 ) ) ( not ( = ?auto_136358 ?auto_136360 ) ) ( not ( = ?auto_136358 ?auto_136359 ) ) ( not ( = ?auto_136358 ?auto_136356 ) ) ( ON ?auto_136357 ?auto_136358 ) ( ON ?auto_136361 ?auto_136357 ) ( ON ?auto_136356 ?auto_136361 ) ( ON ?auto_136359 ?auto_136356 ) ( ON ?auto_136360 ?auto_136359 ) ( CLEAR ?auto_136360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136354 ?auto_136355 ?auto_136358 ?auto_136357 ?auto_136361 ?auto_136356 ?auto_136359 )
      ( MAKE-1PILE ?auto_136354 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136362 - BLOCK
    )
    :vars
    (
      ?auto_136368 - BLOCK
      ?auto_136364 - BLOCK
      ?auto_136365 - BLOCK
      ?auto_136369 - BLOCK
      ?auto_136367 - BLOCK
      ?auto_136363 - BLOCK
      ?auto_136366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136368 ?auto_136362 ) ( ON-TABLE ?auto_136362 ) ( not ( = ?auto_136362 ?auto_136368 ) ) ( not ( = ?auto_136362 ?auto_136364 ) ) ( not ( = ?auto_136362 ?auto_136365 ) ) ( not ( = ?auto_136368 ?auto_136364 ) ) ( not ( = ?auto_136368 ?auto_136365 ) ) ( not ( = ?auto_136364 ?auto_136365 ) ) ( ON ?auto_136364 ?auto_136368 ) ( not ( = ?auto_136369 ?auto_136367 ) ) ( not ( = ?auto_136369 ?auto_136363 ) ) ( not ( = ?auto_136369 ?auto_136366 ) ) ( not ( = ?auto_136369 ?auto_136365 ) ) ( not ( = ?auto_136367 ?auto_136363 ) ) ( not ( = ?auto_136367 ?auto_136366 ) ) ( not ( = ?auto_136367 ?auto_136365 ) ) ( not ( = ?auto_136363 ?auto_136366 ) ) ( not ( = ?auto_136363 ?auto_136365 ) ) ( not ( = ?auto_136366 ?auto_136365 ) ) ( not ( = ?auto_136362 ?auto_136366 ) ) ( not ( = ?auto_136362 ?auto_136369 ) ) ( not ( = ?auto_136362 ?auto_136367 ) ) ( not ( = ?auto_136362 ?auto_136363 ) ) ( not ( = ?auto_136368 ?auto_136366 ) ) ( not ( = ?auto_136368 ?auto_136369 ) ) ( not ( = ?auto_136368 ?auto_136367 ) ) ( not ( = ?auto_136368 ?auto_136363 ) ) ( not ( = ?auto_136364 ?auto_136366 ) ) ( not ( = ?auto_136364 ?auto_136369 ) ) ( not ( = ?auto_136364 ?auto_136367 ) ) ( not ( = ?auto_136364 ?auto_136363 ) ) ( ON ?auto_136365 ?auto_136364 ) ( ON ?auto_136366 ?auto_136365 ) ( ON ?auto_136363 ?auto_136366 ) ( ON ?auto_136367 ?auto_136363 ) ( HOLDING ?auto_136369 ) ( CLEAR ?auto_136367 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136362 ?auto_136368 ?auto_136364 ?auto_136365 ?auto_136366 ?auto_136363 ?auto_136367 ?auto_136369 )
      ( MAKE-1PILE ?auto_136362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136370 - BLOCK
    )
    :vars
    (
      ?auto_136375 - BLOCK
      ?auto_136376 - BLOCK
      ?auto_136371 - BLOCK
      ?auto_136373 - BLOCK
      ?auto_136374 - BLOCK
      ?auto_136377 - BLOCK
      ?auto_136372 - BLOCK
      ?auto_136378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136375 ?auto_136370 ) ( ON-TABLE ?auto_136370 ) ( not ( = ?auto_136370 ?auto_136375 ) ) ( not ( = ?auto_136370 ?auto_136376 ) ) ( not ( = ?auto_136370 ?auto_136371 ) ) ( not ( = ?auto_136375 ?auto_136376 ) ) ( not ( = ?auto_136375 ?auto_136371 ) ) ( not ( = ?auto_136376 ?auto_136371 ) ) ( ON ?auto_136376 ?auto_136375 ) ( not ( = ?auto_136373 ?auto_136374 ) ) ( not ( = ?auto_136373 ?auto_136377 ) ) ( not ( = ?auto_136373 ?auto_136372 ) ) ( not ( = ?auto_136373 ?auto_136371 ) ) ( not ( = ?auto_136374 ?auto_136377 ) ) ( not ( = ?auto_136374 ?auto_136372 ) ) ( not ( = ?auto_136374 ?auto_136371 ) ) ( not ( = ?auto_136377 ?auto_136372 ) ) ( not ( = ?auto_136377 ?auto_136371 ) ) ( not ( = ?auto_136372 ?auto_136371 ) ) ( not ( = ?auto_136370 ?auto_136372 ) ) ( not ( = ?auto_136370 ?auto_136373 ) ) ( not ( = ?auto_136370 ?auto_136374 ) ) ( not ( = ?auto_136370 ?auto_136377 ) ) ( not ( = ?auto_136375 ?auto_136372 ) ) ( not ( = ?auto_136375 ?auto_136373 ) ) ( not ( = ?auto_136375 ?auto_136374 ) ) ( not ( = ?auto_136375 ?auto_136377 ) ) ( not ( = ?auto_136376 ?auto_136372 ) ) ( not ( = ?auto_136376 ?auto_136373 ) ) ( not ( = ?auto_136376 ?auto_136374 ) ) ( not ( = ?auto_136376 ?auto_136377 ) ) ( ON ?auto_136371 ?auto_136376 ) ( ON ?auto_136372 ?auto_136371 ) ( ON ?auto_136377 ?auto_136372 ) ( ON ?auto_136374 ?auto_136377 ) ( CLEAR ?auto_136374 ) ( ON ?auto_136373 ?auto_136378 ) ( CLEAR ?auto_136373 ) ( HAND-EMPTY ) ( not ( = ?auto_136370 ?auto_136378 ) ) ( not ( = ?auto_136375 ?auto_136378 ) ) ( not ( = ?auto_136376 ?auto_136378 ) ) ( not ( = ?auto_136371 ?auto_136378 ) ) ( not ( = ?auto_136373 ?auto_136378 ) ) ( not ( = ?auto_136374 ?auto_136378 ) ) ( not ( = ?auto_136377 ?auto_136378 ) ) ( not ( = ?auto_136372 ?auto_136378 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136373 ?auto_136378 )
      ( MAKE-1PILE ?auto_136370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136379 - BLOCK
    )
    :vars
    (
      ?auto_136381 - BLOCK
      ?auto_136385 - BLOCK
      ?auto_136380 - BLOCK
      ?auto_136383 - BLOCK
      ?auto_136384 - BLOCK
      ?auto_136386 - BLOCK
      ?auto_136382 - BLOCK
      ?auto_136387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136381 ?auto_136379 ) ( ON-TABLE ?auto_136379 ) ( not ( = ?auto_136379 ?auto_136381 ) ) ( not ( = ?auto_136379 ?auto_136385 ) ) ( not ( = ?auto_136379 ?auto_136380 ) ) ( not ( = ?auto_136381 ?auto_136385 ) ) ( not ( = ?auto_136381 ?auto_136380 ) ) ( not ( = ?auto_136385 ?auto_136380 ) ) ( ON ?auto_136385 ?auto_136381 ) ( not ( = ?auto_136383 ?auto_136384 ) ) ( not ( = ?auto_136383 ?auto_136386 ) ) ( not ( = ?auto_136383 ?auto_136382 ) ) ( not ( = ?auto_136383 ?auto_136380 ) ) ( not ( = ?auto_136384 ?auto_136386 ) ) ( not ( = ?auto_136384 ?auto_136382 ) ) ( not ( = ?auto_136384 ?auto_136380 ) ) ( not ( = ?auto_136386 ?auto_136382 ) ) ( not ( = ?auto_136386 ?auto_136380 ) ) ( not ( = ?auto_136382 ?auto_136380 ) ) ( not ( = ?auto_136379 ?auto_136382 ) ) ( not ( = ?auto_136379 ?auto_136383 ) ) ( not ( = ?auto_136379 ?auto_136384 ) ) ( not ( = ?auto_136379 ?auto_136386 ) ) ( not ( = ?auto_136381 ?auto_136382 ) ) ( not ( = ?auto_136381 ?auto_136383 ) ) ( not ( = ?auto_136381 ?auto_136384 ) ) ( not ( = ?auto_136381 ?auto_136386 ) ) ( not ( = ?auto_136385 ?auto_136382 ) ) ( not ( = ?auto_136385 ?auto_136383 ) ) ( not ( = ?auto_136385 ?auto_136384 ) ) ( not ( = ?auto_136385 ?auto_136386 ) ) ( ON ?auto_136380 ?auto_136385 ) ( ON ?auto_136382 ?auto_136380 ) ( ON ?auto_136386 ?auto_136382 ) ( ON ?auto_136383 ?auto_136387 ) ( CLEAR ?auto_136383 ) ( not ( = ?auto_136379 ?auto_136387 ) ) ( not ( = ?auto_136381 ?auto_136387 ) ) ( not ( = ?auto_136385 ?auto_136387 ) ) ( not ( = ?auto_136380 ?auto_136387 ) ) ( not ( = ?auto_136383 ?auto_136387 ) ) ( not ( = ?auto_136384 ?auto_136387 ) ) ( not ( = ?auto_136386 ?auto_136387 ) ) ( not ( = ?auto_136382 ?auto_136387 ) ) ( HOLDING ?auto_136384 ) ( CLEAR ?auto_136386 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136379 ?auto_136381 ?auto_136385 ?auto_136380 ?auto_136382 ?auto_136386 ?auto_136384 )
      ( MAKE-1PILE ?auto_136379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136388 - BLOCK
    )
    :vars
    (
      ?auto_136391 - BLOCK
      ?auto_136390 - BLOCK
      ?auto_136389 - BLOCK
      ?auto_136394 - BLOCK
      ?auto_136396 - BLOCK
      ?auto_136392 - BLOCK
      ?auto_136393 - BLOCK
      ?auto_136395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136391 ?auto_136388 ) ( ON-TABLE ?auto_136388 ) ( not ( = ?auto_136388 ?auto_136391 ) ) ( not ( = ?auto_136388 ?auto_136390 ) ) ( not ( = ?auto_136388 ?auto_136389 ) ) ( not ( = ?auto_136391 ?auto_136390 ) ) ( not ( = ?auto_136391 ?auto_136389 ) ) ( not ( = ?auto_136390 ?auto_136389 ) ) ( ON ?auto_136390 ?auto_136391 ) ( not ( = ?auto_136394 ?auto_136396 ) ) ( not ( = ?auto_136394 ?auto_136392 ) ) ( not ( = ?auto_136394 ?auto_136393 ) ) ( not ( = ?auto_136394 ?auto_136389 ) ) ( not ( = ?auto_136396 ?auto_136392 ) ) ( not ( = ?auto_136396 ?auto_136393 ) ) ( not ( = ?auto_136396 ?auto_136389 ) ) ( not ( = ?auto_136392 ?auto_136393 ) ) ( not ( = ?auto_136392 ?auto_136389 ) ) ( not ( = ?auto_136393 ?auto_136389 ) ) ( not ( = ?auto_136388 ?auto_136393 ) ) ( not ( = ?auto_136388 ?auto_136394 ) ) ( not ( = ?auto_136388 ?auto_136396 ) ) ( not ( = ?auto_136388 ?auto_136392 ) ) ( not ( = ?auto_136391 ?auto_136393 ) ) ( not ( = ?auto_136391 ?auto_136394 ) ) ( not ( = ?auto_136391 ?auto_136396 ) ) ( not ( = ?auto_136391 ?auto_136392 ) ) ( not ( = ?auto_136390 ?auto_136393 ) ) ( not ( = ?auto_136390 ?auto_136394 ) ) ( not ( = ?auto_136390 ?auto_136396 ) ) ( not ( = ?auto_136390 ?auto_136392 ) ) ( ON ?auto_136389 ?auto_136390 ) ( ON ?auto_136393 ?auto_136389 ) ( ON ?auto_136392 ?auto_136393 ) ( ON ?auto_136394 ?auto_136395 ) ( not ( = ?auto_136388 ?auto_136395 ) ) ( not ( = ?auto_136391 ?auto_136395 ) ) ( not ( = ?auto_136390 ?auto_136395 ) ) ( not ( = ?auto_136389 ?auto_136395 ) ) ( not ( = ?auto_136394 ?auto_136395 ) ) ( not ( = ?auto_136396 ?auto_136395 ) ) ( not ( = ?auto_136392 ?auto_136395 ) ) ( not ( = ?auto_136393 ?auto_136395 ) ) ( CLEAR ?auto_136392 ) ( ON ?auto_136396 ?auto_136394 ) ( CLEAR ?auto_136396 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136395 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136395 ?auto_136394 )
      ( MAKE-1PILE ?auto_136388 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136397 - BLOCK
    )
    :vars
    (
      ?auto_136400 - BLOCK
      ?auto_136401 - BLOCK
      ?auto_136404 - BLOCK
      ?auto_136402 - BLOCK
      ?auto_136403 - BLOCK
      ?auto_136399 - BLOCK
      ?auto_136398 - BLOCK
      ?auto_136405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136400 ?auto_136397 ) ( ON-TABLE ?auto_136397 ) ( not ( = ?auto_136397 ?auto_136400 ) ) ( not ( = ?auto_136397 ?auto_136401 ) ) ( not ( = ?auto_136397 ?auto_136404 ) ) ( not ( = ?auto_136400 ?auto_136401 ) ) ( not ( = ?auto_136400 ?auto_136404 ) ) ( not ( = ?auto_136401 ?auto_136404 ) ) ( ON ?auto_136401 ?auto_136400 ) ( not ( = ?auto_136402 ?auto_136403 ) ) ( not ( = ?auto_136402 ?auto_136399 ) ) ( not ( = ?auto_136402 ?auto_136398 ) ) ( not ( = ?auto_136402 ?auto_136404 ) ) ( not ( = ?auto_136403 ?auto_136399 ) ) ( not ( = ?auto_136403 ?auto_136398 ) ) ( not ( = ?auto_136403 ?auto_136404 ) ) ( not ( = ?auto_136399 ?auto_136398 ) ) ( not ( = ?auto_136399 ?auto_136404 ) ) ( not ( = ?auto_136398 ?auto_136404 ) ) ( not ( = ?auto_136397 ?auto_136398 ) ) ( not ( = ?auto_136397 ?auto_136402 ) ) ( not ( = ?auto_136397 ?auto_136403 ) ) ( not ( = ?auto_136397 ?auto_136399 ) ) ( not ( = ?auto_136400 ?auto_136398 ) ) ( not ( = ?auto_136400 ?auto_136402 ) ) ( not ( = ?auto_136400 ?auto_136403 ) ) ( not ( = ?auto_136400 ?auto_136399 ) ) ( not ( = ?auto_136401 ?auto_136398 ) ) ( not ( = ?auto_136401 ?auto_136402 ) ) ( not ( = ?auto_136401 ?auto_136403 ) ) ( not ( = ?auto_136401 ?auto_136399 ) ) ( ON ?auto_136404 ?auto_136401 ) ( ON ?auto_136398 ?auto_136404 ) ( ON ?auto_136402 ?auto_136405 ) ( not ( = ?auto_136397 ?auto_136405 ) ) ( not ( = ?auto_136400 ?auto_136405 ) ) ( not ( = ?auto_136401 ?auto_136405 ) ) ( not ( = ?auto_136404 ?auto_136405 ) ) ( not ( = ?auto_136402 ?auto_136405 ) ) ( not ( = ?auto_136403 ?auto_136405 ) ) ( not ( = ?auto_136399 ?auto_136405 ) ) ( not ( = ?auto_136398 ?auto_136405 ) ) ( ON ?auto_136403 ?auto_136402 ) ( CLEAR ?auto_136403 ) ( ON-TABLE ?auto_136405 ) ( HOLDING ?auto_136399 ) ( CLEAR ?auto_136398 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136397 ?auto_136400 ?auto_136401 ?auto_136404 ?auto_136398 ?auto_136399 )
      ( MAKE-1PILE ?auto_136397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136406 - BLOCK
    )
    :vars
    (
      ?auto_136408 - BLOCK
      ?auto_136410 - BLOCK
      ?auto_136412 - BLOCK
      ?auto_136413 - BLOCK
      ?auto_136414 - BLOCK
      ?auto_136407 - BLOCK
      ?auto_136411 - BLOCK
      ?auto_136409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136408 ?auto_136406 ) ( ON-TABLE ?auto_136406 ) ( not ( = ?auto_136406 ?auto_136408 ) ) ( not ( = ?auto_136406 ?auto_136410 ) ) ( not ( = ?auto_136406 ?auto_136412 ) ) ( not ( = ?auto_136408 ?auto_136410 ) ) ( not ( = ?auto_136408 ?auto_136412 ) ) ( not ( = ?auto_136410 ?auto_136412 ) ) ( ON ?auto_136410 ?auto_136408 ) ( not ( = ?auto_136413 ?auto_136414 ) ) ( not ( = ?auto_136413 ?auto_136407 ) ) ( not ( = ?auto_136413 ?auto_136411 ) ) ( not ( = ?auto_136413 ?auto_136412 ) ) ( not ( = ?auto_136414 ?auto_136407 ) ) ( not ( = ?auto_136414 ?auto_136411 ) ) ( not ( = ?auto_136414 ?auto_136412 ) ) ( not ( = ?auto_136407 ?auto_136411 ) ) ( not ( = ?auto_136407 ?auto_136412 ) ) ( not ( = ?auto_136411 ?auto_136412 ) ) ( not ( = ?auto_136406 ?auto_136411 ) ) ( not ( = ?auto_136406 ?auto_136413 ) ) ( not ( = ?auto_136406 ?auto_136414 ) ) ( not ( = ?auto_136406 ?auto_136407 ) ) ( not ( = ?auto_136408 ?auto_136411 ) ) ( not ( = ?auto_136408 ?auto_136413 ) ) ( not ( = ?auto_136408 ?auto_136414 ) ) ( not ( = ?auto_136408 ?auto_136407 ) ) ( not ( = ?auto_136410 ?auto_136411 ) ) ( not ( = ?auto_136410 ?auto_136413 ) ) ( not ( = ?auto_136410 ?auto_136414 ) ) ( not ( = ?auto_136410 ?auto_136407 ) ) ( ON ?auto_136412 ?auto_136410 ) ( ON ?auto_136411 ?auto_136412 ) ( ON ?auto_136413 ?auto_136409 ) ( not ( = ?auto_136406 ?auto_136409 ) ) ( not ( = ?auto_136408 ?auto_136409 ) ) ( not ( = ?auto_136410 ?auto_136409 ) ) ( not ( = ?auto_136412 ?auto_136409 ) ) ( not ( = ?auto_136413 ?auto_136409 ) ) ( not ( = ?auto_136414 ?auto_136409 ) ) ( not ( = ?auto_136407 ?auto_136409 ) ) ( not ( = ?auto_136411 ?auto_136409 ) ) ( ON ?auto_136414 ?auto_136413 ) ( ON-TABLE ?auto_136409 ) ( CLEAR ?auto_136411 ) ( ON ?auto_136407 ?auto_136414 ) ( CLEAR ?auto_136407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136409 ?auto_136413 ?auto_136414 )
      ( MAKE-1PILE ?auto_136406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136415 - BLOCK
    )
    :vars
    (
      ?auto_136417 - BLOCK
      ?auto_136419 - BLOCK
      ?auto_136416 - BLOCK
      ?auto_136421 - BLOCK
      ?auto_136423 - BLOCK
      ?auto_136422 - BLOCK
      ?auto_136418 - BLOCK
      ?auto_136420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136417 ?auto_136415 ) ( ON-TABLE ?auto_136415 ) ( not ( = ?auto_136415 ?auto_136417 ) ) ( not ( = ?auto_136415 ?auto_136419 ) ) ( not ( = ?auto_136415 ?auto_136416 ) ) ( not ( = ?auto_136417 ?auto_136419 ) ) ( not ( = ?auto_136417 ?auto_136416 ) ) ( not ( = ?auto_136419 ?auto_136416 ) ) ( ON ?auto_136419 ?auto_136417 ) ( not ( = ?auto_136421 ?auto_136423 ) ) ( not ( = ?auto_136421 ?auto_136422 ) ) ( not ( = ?auto_136421 ?auto_136418 ) ) ( not ( = ?auto_136421 ?auto_136416 ) ) ( not ( = ?auto_136423 ?auto_136422 ) ) ( not ( = ?auto_136423 ?auto_136418 ) ) ( not ( = ?auto_136423 ?auto_136416 ) ) ( not ( = ?auto_136422 ?auto_136418 ) ) ( not ( = ?auto_136422 ?auto_136416 ) ) ( not ( = ?auto_136418 ?auto_136416 ) ) ( not ( = ?auto_136415 ?auto_136418 ) ) ( not ( = ?auto_136415 ?auto_136421 ) ) ( not ( = ?auto_136415 ?auto_136423 ) ) ( not ( = ?auto_136415 ?auto_136422 ) ) ( not ( = ?auto_136417 ?auto_136418 ) ) ( not ( = ?auto_136417 ?auto_136421 ) ) ( not ( = ?auto_136417 ?auto_136423 ) ) ( not ( = ?auto_136417 ?auto_136422 ) ) ( not ( = ?auto_136419 ?auto_136418 ) ) ( not ( = ?auto_136419 ?auto_136421 ) ) ( not ( = ?auto_136419 ?auto_136423 ) ) ( not ( = ?auto_136419 ?auto_136422 ) ) ( ON ?auto_136416 ?auto_136419 ) ( ON ?auto_136421 ?auto_136420 ) ( not ( = ?auto_136415 ?auto_136420 ) ) ( not ( = ?auto_136417 ?auto_136420 ) ) ( not ( = ?auto_136419 ?auto_136420 ) ) ( not ( = ?auto_136416 ?auto_136420 ) ) ( not ( = ?auto_136421 ?auto_136420 ) ) ( not ( = ?auto_136423 ?auto_136420 ) ) ( not ( = ?auto_136422 ?auto_136420 ) ) ( not ( = ?auto_136418 ?auto_136420 ) ) ( ON ?auto_136423 ?auto_136421 ) ( ON-TABLE ?auto_136420 ) ( ON ?auto_136422 ?auto_136423 ) ( CLEAR ?auto_136422 ) ( HOLDING ?auto_136418 ) ( CLEAR ?auto_136416 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136415 ?auto_136417 ?auto_136419 ?auto_136416 ?auto_136418 )
      ( MAKE-1PILE ?auto_136415 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136424 - BLOCK
    )
    :vars
    (
      ?auto_136427 - BLOCK
      ?auto_136431 - BLOCK
      ?auto_136425 - BLOCK
      ?auto_136426 - BLOCK
      ?auto_136430 - BLOCK
      ?auto_136428 - BLOCK
      ?auto_136429 - BLOCK
      ?auto_136432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136427 ?auto_136424 ) ( ON-TABLE ?auto_136424 ) ( not ( = ?auto_136424 ?auto_136427 ) ) ( not ( = ?auto_136424 ?auto_136431 ) ) ( not ( = ?auto_136424 ?auto_136425 ) ) ( not ( = ?auto_136427 ?auto_136431 ) ) ( not ( = ?auto_136427 ?auto_136425 ) ) ( not ( = ?auto_136431 ?auto_136425 ) ) ( ON ?auto_136431 ?auto_136427 ) ( not ( = ?auto_136426 ?auto_136430 ) ) ( not ( = ?auto_136426 ?auto_136428 ) ) ( not ( = ?auto_136426 ?auto_136429 ) ) ( not ( = ?auto_136426 ?auto_136425 ) ) ( not ( = ?auto_136430 ?auto_136428 ) ) ( not ( = ?auto_136430 ?auto_136429 ) ) ( not ( = ?auto_136430 ?auto_136425 ) ) ( not ( = ?auto_136428 ?auto_136429 ) ) ( not ( = ?auto_136428 ?auto_136425 ) ) ( not ( = ?auto_136429 ?auto_136425 ) ) ( not ( = ?auto_136424 ?auto_136429 ) ) ( not ( = ?auto_136424 ?auto_136426 ) ) ( not ( = ?auto_136424 ?auto_136430 ) ) ( not ( = ?auto_136424 ?auto_136428 ) ) ( not ( = ?auto_136427 ?auto_136429 ) ) ( not ( = ?auto_136427 ?auto_136426 ) ) ( not ( = ?auto_136427 ?auto_136430 ) ) ( not ( = ?auto_136427 ?auto_136428 ) ) ( not ( = ?auto_136431 ?auto_136429 ) ) ( not ( = ?auto_136431 ?auto_136426 ) ) ( not ( = ?auto_136431 ?auto_136430 ) ) ( not ( = ?auto_136431 ?auto_136428 ) ) ( ON ?auto_136425 ?auto_136431 ) ( ON ?auto_136426 ?auto_136432 ) ( not ( = ?auto_136424 ?auto_136432 ) ) ( not ( = ?auto_136427 ?auto_136432 ) ) ( not ( = ?auto_136431 ?auto_136432 ) ) ( not ( = ?auto_136425 ?auto_136432 ) ) ( not ( = ?auto_136426 ?auto_136432 ) ) ( not ( = ?auto_136430 ?auto_136432 ) ) ( not ( = ?auto_136428 ?auto_136432 ) ) ( not ( = ?auto_136429 ?auto_136432 ) ) ( ON ?auto_136430 ?auto_136426 ) ( ON-TABLE ?auto_136432 ) ( ON ?auto_136428 ?auto_136430 ) ( CLEAR ?auto_136425 ) ( ON ?auto_136429 ?auto_136428 ) ( CLEAR ?auto_136429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136432 ?auto_136426 ?auto_136430 ?auto_136428 )
      ( MAKE-1PILE ?auto_136424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136433 - BLOCK
    )
    :vars
    (
      ?auto_136436 - BLOCK
      ?auto_136440 - BLOCK
      ?auto_136439 - BLOCK
      ?auto_136435 - BLOCK
      ?auto_136441 - BLOCK
      ?auto_136437 - BLOCK
      ?auto_136434 - BLOCK
      ?auto_136438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136436 ?auto_136433 ) ( ON-TABLE ?auto_136433 ) ( not ( = ?auto_136433 ?auto_136436 ) ) ( not ( = ?auto_136433 ?auto_136440 ) ) ( not ( = ?auto_136433 ?auto_136439 ) ) ( not ( = ?auto_136436 ?auto_136440 ) ) ( not ( = ?auto_136436 ?auto_136439 ) ) ( not ( = ?auto_136440 ?auto_136439 ) ) ( ON ?auto_136440 ?auto_136436 ) ( not ( = ?auto_136435 ?auto_136441 ) ) ( not ( = ?auto_136435 ?auto_136437 ) ) ( not ( = ?auto_136435 ?auto_136434 ) ) ( not ( = ?auto_136435 ?auto_136439 ) ) ( not ( = ?auto_136441 ?auto_136437 ) ) ( not ( = ?auto_136441 ?auto_136434 ) ) ( not ( = ?auto_136441 ?auto_136439 ) ) ( not ( = ?auto_136437 ?auto_136434 ) ) ( not ( = ?auto_136437 ?auto_136439 ) ) ( not ( = ?auto_136434 ?auto_136439 ) ) ( not ( = ?auto_136433 ?auto_136434 ) ) ( not ( = ?auto_136433 ?auto_136435 ) ) ( not ( = ?auto_136433 ?auto_136441 ) ) ( not ( = ?auto_136433 ?auto_136437 ) ) ( not ( = ?auto_136436 ?auto_136434 ) ) ( not ( = ?auto_136436 ?auto_136435 ) ) ( not ( = ?auto_136436 ?auto_136441 ) ) ( not ( = ?auto_136436 ?auto_136437 ) ) ( not ( = ?auto_136440 ?auto_136434 ) ) ( not ( = ?auto_136440 ?auto_136435 ) ) ( not ( = ?auto_136440 ?auto_136441 ) ) ( not ( = ?auto_136440 ?auto_136437 ) ) ( ON ?auto_136435 ?auto_136438 ) ( not ( = ?auto_136433 ?auto_136438 ) ) ( not ( = ?auto_136436 ?auto_136438 ) ) ( not ( = ?auto_136440 ?auto_136438 ) ) ( not ( = ?auto_136439 ?auto_136438 ) ) ( not ( = ?auto_136435 ?auto_136438 ) ) ( not ( = ?auto_136441 ?auto_136438 ) ) ( not ( = ?auto_136437 ?auto_136438 ) ) ( not ( = ?auto_136434 ?auto_136438 ) ) ( ON ?auto_136441 ?auto_136435 ) ( ON-TABLE ?auto_136438 ) ( ON ?auto_136437 ?auto_136441 ) ( ON ?auto_136434 ?auto_136437 ) ( CLEAR ?auto_136434 ) ( HOLDING ?auto_136439 ) ( CLEAR ?auto_136440 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136433 ?auto_136436 ?auto_136440 ?auto_136439 )
      ( MAKE-1PILE ?auto_136433 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136442 - BLOCK
    )
    :vars
    (
      ?auto_136447 - BLOCK
      ?auto_136450 - BLOCK
      ?auto_136443 - BLOCK
      ?auto_136445 - BLOCK
      ?auto_136444 - BLOCK
      ?auto_136449 - BLOCK
      ?auto_136446 - BLOCK
      ?auto_136448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136447 ?auto_136442 ) ( ON-TABLE ?auto_136442 ) ( not ( = ?auto_136442 ?auto_136447 ) ) ( not ( = ?auto_136442 ?auto_136450 ) ) ( not ( = ?auto_136442 ?auto_136443 ) ) ( not ( = ?auto_136447 ?auto_136450 ) ) ( not ( = ?auto_136447 ?auto_136443 ) ) ( not ( = ?auto_136450 ?auto_136443 ) ) ( ON ?auto_136450 ?auto_136447 ) ( not ( = ?auto_136445 ?auto_136444 ) ) ( not ( = ?auto_136445 ?auto_136449 ) ) ( not ( = ?auto_136445 ?auto_136446 ) ) ( not ( = ?auto_136445 ?auto_136443 ) ) ( not ( = ?auto_136444 ?auto_136449 ) ) ( not ( = ?auto_136444 ?auto_136446 ) ) ( not ( = ?auto_136444 ?auto_136443 ) ) ( not ( = ?auto_136449 ?auto_136446 ) ) ( not ( = ?auto_136449 ?auto_136443 ) ) ( not ( = ?auto_136446 ?auto_136443 ) ) ( not ( = ?auto_136442 ?auto_136446 ) ) ( not ( = ?auto_136442 ?auto_136445 ) ) ( not ( = ?auto_136442 ?auto_136444 ) ) ( not ( = ?auto_136442 ?auto_136449 ) ) ( not ( = ?auto_136447 ?auto_136446 ) ) ( not ( = ?auto_136447 ?auto_136445 ) ) ( not ( = ?auto_136447 ?auto_136444 ) ) ( not ( = ?auto_136447 ?auto_136449 ) ) ( not ( = ?auto_136450 ?auto_136446 ) ) ( not ( = ?auto_136450 ?auto_136445 ) ) ( not ( = ?auto_136450 ?auto_136444 ) ) ( not ( = ?auto_136450 ?auto_136449 ) ) ( ON ?auto_136445 ?auto_136448 ) ( not ( = ?auto_136442 ?auto_136448 ) ) ( not ( = ?auto_136447 ?auto_136448 ) ) ( not ( = ?auto_136450 ?auto_136448 ) ) ( not ( = ?auto_136443 ?auto_136448 ) ) ( not ( = ?auto_136445 ?auto_136448 ) ) ( not ( = ?auto_136444 ?auto_136448 ) ) ( not ( = ?auto_136449 ?auto_136448 ) ) ( not ( = ?auto_136446 ?auto_136448 ) ) ( ON ?auto_136444 ?auto_136445 ) ( ON-TABLE ?auto_136448 ) ( ON ?auto_136449 ?auto_136444 ) ( ON ?auto_136446 ?auto_136449 ) ( CLEAR ?auto_136450 ) ( ON ?auto_136443 ?auto_136446 ) ( CLEAR ?auto_136443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136448 ?auto_136445 ?auto_136444 ?auto_136449 ?auto_136446 )
      ( MAKE-1PILE ?auto_136442 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136451 - BLOCK
    )
    :vars
    (
      ?auto_136453 - BLOCK
      ?auto_136456 - BLOCK
      ?auto_136459 - BLOCK
      ?auto_136457 - BLOCK
      ?auto_136454 - BLOCK
      ?auto_136458 - BLOCK
      ?auto_136455 - BLOCK
      ?auto_136452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136453 ?auto_136451 ) ( ON-TABLE ?auto_136451 ) ( not ( = ?auto_136451 ?auto_136453 ) ) ( not ( = ?auto_136451 ?auto_136456 ) ) ( not ( = ?auto_136451 ?auto_136459 ) ) ( not ( = ?auto_136453 ?auto_136456 ) ) ( not ( = ?auto_136453 ?auto_136459 ) ) ( not ( = ?auto_136456 ?auto_136459 ) ) ( not ( = ?auto_136457 ?auto_136454 ) ) ( not ( = ?auto_136457 ?auto_136458 ) ) ( not ( = ?auto_136457 ?auto_136455 ) ) ( not ( = ?auto_136457 ?auto_136459 ) ) ( not ( = ?auto_136454 ?auto_136458 ) ) ( not ( = ?auto_136454 ?auto_136455 ) ) ( not ( = ?auto_136454 ?auto_136459 ) ) ( not ( = ?auto_136458 ?auto_136455 ) ) ( not ( = ?auto_136458 ?auto_136459 ) ) ( not ( = ?auto_136455 ?auto_136459 ) ) ( not ( = ?auto_136451 ?auto_136455 ) ) ( not ( = ?auto_136451 ?auto_136457 ) ) ( not ( = ?auto_136451 ?auto_136454 ) ) ( not ( = ?auto_136451 ?auto_136458 ) ) ( not ( = ?auto_136453 ?auto_136455 ) ) ( not ( = ?auto_136453 ?auto_136457 ) ) ( not ( = ?auto_136453 ?auto_136454 ) ) ( not ( = ?auto_136453 ?auto_136458 ) ) ( not ( = ?auto_136456 ?auto_136455 ) ) ( not ( = ?auto_136456 ?auto_136457 ) ) ( not ( = ?auto_136456 ?auto_136454 ) ) ( not ( = ?auto_136456 ?auto_136458 ) ) ( ON ?auto_136457 ?auto_136452 ) ( not ( = ?auto_136451 ?auto_136452 ) ) ( not ( = ?auto_136453 ?auto_136452 ) ) ( not ( = ?auto_136456 ?auto_136452 ) ) ( not ( = ?auto_136459 ?auto_136452 ) ) ( not ( = ?auto_136457 ?auto_136452 ) ) ( not ( = ?auto_136454 ?auto_136452 ) ) ( not ( = ?auto_136458 ?auto_136452 ) ) ( not ( = ?auto_136455 ?auto_136452 ) ) ( ON ?auto_136454 ?auto_136457 ) ( ON-TABLE ?auto_136452 ) ( ON ?auto_136458 ?auto_136454 ) ( ON ?auto_136455 ?auto_136458 ) ( ON ?auto_136459 ?auto_136455 ) ( CLEAR ?auto_136459 ) ( HOLDING ?auto_136456 ) ( CLEAR ?auto_136453 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136451 ?auto_136453 ?auto_136456 )
      ( MAKE-1PILE ?auto_136451 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136460 - BLOCK
    )
    :vars
    (
      ?auto_136464 - BLOCK
      ?auto_136466 - BLOCK
      ?auto_136467 - BLOCK
      ?auto_136461 - BLOCK
      ?auto_136462 - BLOCK
      ?auto_136463 - BLOCK
      ?auto_136465 - BLOCK
      ?auto_136468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136464 ?auto_136460 ) ( ON-TABLE ?auto_136460 ) ( not ( = ?auto_136460 ?auto_136464 ) ) ( not ( = ?auto_136460 ?auto_136466 ) ) ( not ( = ?auto_136460 ?auto_136467 ) ) ( not ( = ?auto_136464 ?auto_136466 ) ) ( not ( = ?auto_136464 ?auto_136467 ) ) ( not ( = ?auto_136466 ?auto_136467 ) ) ( not ( = ?auto_136461 ?auto_136462 ) ) ( not ( = ?auto_136461 ?auto_136463 ) ) ( not ( = ?auto_136461 ?auto_136465 ) ) ( not ( = ?auto_136461 ?auto_136467 ) ) ( not ( = ?auto_136462 ?auto_136463 ) ) ( not ( = ?auto_136462 ?auto_136465 ) ) ( not ( = ?auto_136462 ?auto_136467 ) ) ( not ( = ?auto_136463 ?auto_136465 ) ) ( not ( = ?auto_136463 ?auto_136467 ) ) ( not ( = ?auto_136465 ?auto_136467 ) ) ( not ( = ?auto_136460 ?auto_136465 ) ) ( not ( = ?auto_136460 ?auto_136461 ) ) ( not ( = ?auto_136460 ?auto_136462 ) ) ( not ( = ?auto_136460 ?auto_136463 ) ) ( not ( = ?auto_136464 ?auto_136465 ) ) ( not ( = ?auto_136464 ?auto_136461 ) ) ( not ( = ?auto_136464 ?auto_136462 ) ) ( not ( = ?auto_136464 ?auto_136463 ) ) ( not ( = ?auto_136466 ?auto_136465 ) ) ( not ( = ?auto_136466 ?auto_136461 ) ) ( not ( = ?auto_136466 ?auto_136462 ) ) ( not ( = ?auto_136466 ?auto_136463 ) ) ( ON ?auto_136461 ?auto_136468 ) ( not ( = ?auto_136460 ?auto_136468 ) ) ( not ( = ?auto_136464 ?auto_136468 ) ) ( not ( = ?auto_136466 ?auto_136468 ) ) ( not ( = ?auto_136467 ?auto_136468 ) ) ( not ( = ?auto_136461 ?auto_136468 ) ) ( not ( = ?auto_136462 ?auto_136468 ) ) ( not ( = ?auto_136463 ?auto_136468 ) ) ( not ( = ?auto_136465 ?auto_136468 ) ) ( ON ?auto_136462 ?auto_136461 ) ( ON-TABLE ?auto_136468 ) ( ON ?auto_136463 ?auto_136462 ) ( ON ?auto_136465 ?auto_136463 ) ( ON ?auto_136467 ?auto_136465 ) ( CLEAR ?auto_136464 ) ( ON ?auto_136466 ?auto_136467 ) ( CLEAR ?auto_136466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136468 ?auto_136461 ?auto_136462 ?auto_136463 ?auto_136465 ?auto_136467 )
      ( MAKE-1PILE ?auto_136460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136487 - BLOCK
    )
    :vars
    (
      ?auto_136490 - BLOCK
      ?auto_136495 - BLOCK
      ?auto_136492 - BLOCK
      ?auto_136494 - BLOCK
      ?auto_136489 - BLOCK
      ?auto_136491 - BLOCK
      ?auto_136488 - BLOCK
      ?auto_136493 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136487 ?auto_136490 ) ) ( not ( = ?auto_136487 ?auto_136495 ) ) ( not ( = ?auto_136487 ?auto_136492 ) ) ( not ( = ?auto_136490 ?auto_136495 ) ) ( not ( = ?auto_136490 ?auto_136492 ) ) ( not ( = ?auto_136495 ?auto_136492 ) ) ( not ( = ?auto_136494 ?auto_136489 ) ) ( not ( = ?auto_136494 ?auto_136491 ) ) ( not ( = ?auto_136494 ?auto_136488 ) ) ( not ( = ?auto_136494 ?auto_136492 ) ) ( not ( = ?auto_136489 ?auto_136491 ) ) ( not ( = ?auto_136489 ?auto_136488 ) ) ( not ( = ?auto_136489 ?auto_136492 ) ) ( not ( = ?auto_136491 ?auto_136488 ) ) ( not ( = ?auto_136491 ?auto_136492 ) ) ( not ( = ?auto_136488 ?auto_136492 ) ) ( not ( = ?auto_136487 ?auto_136488 ) ) ( not ( = ?auto_136487 ?auto_136494 ) ) ( not ( = ?auto_136487 ?auto_136489 ) ) ( not ( = ?auto_136487 ?auto_136491 ) ) ( not ( = ?auto_136490 ?auto_136488 ) ) ( not ( = ?auto_136490 ?auto_136494 ) ) ( not ( = ?auto_136490 ?auto_136489 ) ) ( not ( = ?auto_136490 ?auto_136491 ) ) ( not ( = ?auto_136495 ?auto_136488 ) ) ( not ( = ?auto_136495 ?auto_136494 ) ) ( not ( = ?auto_136495 ?auto_136489 ) ) ( not ( = ?auto_136495 ?auto_136491 ) ) ( ON ?auto_136494 ?auto_136493 ) ( not ( = ?auto_136487 ?auto_136493 ) ) ( not ( = ?auto_136490 ?auto_136493 ) ) ( not ( = ?auto_136495 ?auto_136493 ) ) ( not ( = ?auto_136492 ?auto_136493 ) ) ( not ( = ?auto_136494 ?auto_136493 ) ) ( not ( = ?auto_136489 ?auto_136493 ) ) ( not ( = ?auto_136491 ?auto_136493 ) ) ( not ( = ?auto_136488 ?auto_136493 ) ) ( ON ?auto_136489 ?auto_136494 ) ( ON-TABLE ?auto_136493 ) ( ON ?auto_136491 ?auto_136489 ) ( ON ?auto_136488 ?auto_136491 ) ( ON ?auto_136492 ?auto_136488 ) ( ON ?auto_136495 ?auto_136492 ) ( ON ?auto_136490 ?auto_136495 ) ( CLEAR ?auto_136490 ) ( HOLDING ?auto_136487 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136487 ?auto_136490 )
      ( MAKE-1PILE ?auto_136487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_136496 - BLOCK
    )
    :vars
    (
      ?auto_136503 - BLOCK
      ?auto_136504 - BLOCK
      ?auto_136498 - BLOCK
      ?auto_136502 - BLOCK
      ?auto_136497 - BLOCK
      ?auto_136499 - BLOCK
      ?auto_136500 - BLOCK
      ?auto_136501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136496 ?auto_136503 ) ) ( not ( = ?auto_136496 ?auto_136504 ) ) ( not ( = ?auto_136496 ?auto_136498 ) ) ( not ( = ?auto_136503 ?auto_136504 ) ) ( not ( = ?auto_136503 ?auto_136498 ) ) ( not ( = ?auto_136504 ?auto_136498 ) ) ( not ( = ?auto_136502 ?auto_136497 ) ) ( not ( = ?auto_136502 ?auto_136499 ) ) ( not ( = ?auto_136502 ?auto_136500 ) ) ( not ( = ?auto_136502 ?auto_136498 ) ) ( not ( = ?auto_136497 ?auto_136499 ) ) ( not ( = ?auto_136497 ?auto_136500 ) ) ( not ( = ?auto_136497 ?auto_136498 ) ) ( not ( = ?auto_136499 ?auto_136500 ) ) ( not ( = ?auto_136499 ?auto_136498 ) ) ( not ( = ?auto_136500 ?auto_136498 ) ) ( not ( = ?auto_136496 ?auto_136500 ) ) ( not ( = ?auto_136496 ?auto_136502 ) ) ( not ( = ?auto_136496 ?auto_136497 ) ) ( not ( = ?auto_136496 ?auto_136499 ) ) ( not ( = ?auto_136503 ?auto_136500 ) ) ( not ( = ?auto_136503 ?auto_136502 ) ) ( not ( = ?auto_136503 ?auto_136497 ) ) ( not ( = ?auto_136503 ?auto_136499 ) ) ( not ( = ?auto_136504 ?auto_136500 ) ) ( not ( = ?auto_136504 ?auto_136502 ) ) ( not ( = ?auto_136504 ?auto_136497 ) ) ( not ( = ?auto_136504 ?auto_136499 ) ) ( ON ?auto_136502 ?auto_136501 ) ( not ( = ?auto_136496 ?auto_136501 ) ) ( not ( = ?auto_136503 ?auto_136501 ) ) ( not ( = ?auto_136504 ?auto_136501 ) ) ( not ( = ?auto_136498 ?auto_136501 ) ) ( not ( = ?auto_136502 ?auto_136501 ) ) ( not ( = ?auto_136497 ?auto_136501 ) ) ( not ( = ?auto_136499 ?auto_136501 ) ) ( not ( = ?auto_136500 ?auto_136501 ) ) ( ON ?auto_136497 ?auto_136502 ) ( ON-TABLE ?auto_136501 ) ( ON ?auto_136499 ?auto_136497 ) ( ON ?auto_136500 ?auto_136499 ) ( ON ?auto_136498 ?auto_136500 ) ( ON ?auto_136504 ?auto_136498 ) ( ON ?auto_136503 ?auto_136504 ) ( ON ?auto_136496 ?auto_136503 ) ( CLEAR ?auto_136496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136501 ?auto_136502 ?auto_136497 ?auto_136499 ?auto_136500 ?auto_136498 ?auto_136504 ?auto_136503 )
      ( MAKE-1PILE ?auto_136496 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136512 - BLOCK
      ?auto_136513 - BLOCK
      ?auto_136514 - BLOCK
      ?auto_136515 - BLOCK
      ?auto_136516 - BLOCK
      ?auto_136517 - BLOCK
      ?auto_136518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136518 ) ( CLEAR ?auto_136517 ) ( ON-TABLE ?auto_136512 ) ( ON ?auto_136513 ?auto_136512 ) ( ON ?auto_136514 ?auto_136513 ) ( ON ?auto_136515 ?auto_136514 ) ( ON ?auto_136516 ?auto_136515 ) ( ON ?auto_136517 ?auto_136516 ) ( not ( = ?auto_136512 ?auto_136513 ) ) ( not ( = ?auto_136512 ?auto_136514 ) ) ( not ( = ?auto_136512 ?auto_136515 ) ) ( not ( = ?auto_136512 ?auto_136516 ) ) ( not ( = ?auto_136512 ?auto_136517 ) ) ( not ( = ?auto_136512 ?auto_136518 ) ) ( not ( = ?auto_136513 ?auto_136514 ) ) ( not ( = ?auto_136513 ?auto_136515 ) ) ( not ( = ?auto_136513 ?auto_136516 ) ) ( not ( = ?auto_136513 ?auto_136517 ) ) ( not ( = ?auto_136513 ?auto_136518 ) ) ( not ( = ?auto_136514 ?auto_136515 ) ) ( not ( = ?auto_136514 ?auto_136516 ) ) ( not ( = ?auto_136514 ?auto_136517 ) ) ( not ( = ?auto_136514 ?auto_136518 ) ) ( not ( = ?auto_136515 ?auto_136516 ) ) ( not ( = ?auto_136515 ?auto_136517 ) ) ( not ( = ?auto_136515 ?auto_136518 ) ) ( not ( = ?auto_136516 ?auto_136517 ) ) ( not ( = ?auto_136516 ?auto_136518 ) ) ( not ( = ?auto_136517 ?auto_136518 ) ) )
    :subtasks
    ( ( !STACK ?auto_136518 ?auto_136517 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136519 - BLOCK
      ?auto_136520 - BLOCK
      ?auto_136521 - BLOCK
      ?auto_136522 - BLOCK
      ?auto_136523 - BLOCK
      ?auto_136524 - BLOCK
      ?auto_136525 - BLOCK
    )
    :vars
    (
      ?auto_136526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136524 ) ( ON-TABLE ?auto_136519 ) ( ON ?auto_136520 ?auto_136519 ) ( ON ?auto_136521 ?auto_136520 ) ( ON ?auto_136522 ?auto_136521 ) ( ON ?auto_136523 ?auto_136522 ) ( ON ?auto_136524 ?auto_136523 ) ( not ( = ?auto_136519 ?auto_136520 ) ) ( not ( = ?auto_136519 ?auto_136521 ) ) ( not ( = ?auto_136519 ?auto_136522 ) ) ( not ( = ?auto_136519 ?auto_136523 ) ) ( not ( = ?auto_136519 ?auto_136524 ) ) ( not ( = ?auto_136519 ?auto_136525 ) ) ( not ( = ?auto_136520 ?auto_136521 ) ) ( not ( = ?auto_136520 ?auto_136522 ) ) ( not ( = ?auto_136520 ?auto_136523 ) ) ( not ( = ?auto_136520 ?auto_136524 ) ) ( not ( = ?auto_136520 ?auto_136525 ) ) ( not ( = ?auto_136521 ?auto_136522 ) ) ( not ( = ?auto_136521 ?auto_136523 ) ) ( not ( = ?auto_136521 ?auto_136524 ) ) ( not ( = ?auto_136521 ?auto_136525 ) ) ( not ( = ?auto_136522 ?auto_136523 ) ) ( not ( = ?auto_136522 ?auto_136524 ) ) ( not ( = ?auto_136522 ?auto_136525 ) ) ( not ( = ?auto_136523 ?auto_136524 ) ) ( not ( = ?auto_136523 ?auto_136525 ) ) ( not ( = ?auto_136524 ?auto_136525 ) ) ( ON ?auto_136525 ?auto_136526 ) ( CLEAR ?auto_136525 ) ( HAND-EMPTY ) ( not ( = ?auto_136519 ?auto_136526 ) ) ( not ( = ?auto_136520 ?auto_136526 ) ) ( not ( = ?auto_136521 ?auto_136526 ) ) ( not ( = ?auto_136522 ?auto_136526 ) ) ( not ( = ?auto_136523 ?auto_136526 ) ) ( not ( = ?auto_136524 ?auto_136526 ) ) ( not ( = ?auto_136525 ?auto_136526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136525 ?auto_136526 )
      ( MAKE-7PILE ?auto_136519 ?auto_136520 ?auto_136521 ?auto_136522 ?auto_136523 ?auto_136524 ?auto_136525 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136527 - BLOCK
      ?auto_136528 - BLOCK
      ?auto_136529 - BLOCK
      ?auto_136530 - BLOCK
      ?auto_136531 - BLOCK
      ?auto_136532 - BLOCK
      ?auto_136533 - BLOCK
    )
    :vars
    (
      ?auto_136534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136527 ) ( ON ?auto_136528 ?auto_136527 ) ( ON ?auto_136529 ?auto_136528 ) ( ON ?auto_136530 ?auto_136529 ) ( ON ?auto_136531 ?auto_136530 ) ( not ( = ?auto_136527 ?auto_136528 ) ) ( not ( = ?auto_136527 ?auto_136529 ) ) ( not ( = ?auto_136527 ?auto_136530 ) ) ( not ( = ?auto_136527 ?auto_136531 ) ) ( not ( = ?auto_136527 ?auto_136532 ) ) ( not ( = ?auto_136527 ?auto_136533 ) ) ( not ( = ?auto_136528 ?auto_136529 ) ) ( not ( = ?auto_136528 ?auto_136530 ) ) ( not ( = ?auto_136528 ?auto_136531 ) ) ( not ( = ?auto_136528 ?auto_136532 ) ) ( not ( = ?auto_136528 ?auto_136533 ) ) ( not ( = ?auto_136529 ?auto_136530 ) ) ( not ( = ?auto_136529 ?auto_136531 ) ) ( not ( = ?auto_136529 ?auto_136532 ) ) ( not ( = ?auto_136529 ?auto_136533 ) ) ( not ( = ?auto_136530 ?auto_136531 ) ) ( not ( = ?auto_136530 ?auto_136532 ) ) ( not ( = ?auto_136530 ?auto_136533 ) ) ( not ( = ?auto_136531 ?auto_136532 ) ) ( not ( = ?auto_136531 ?auto_136533 ) ) ( not ( = ?auto_136532 ?auto_136533 ) ) ( ON ?auto_136533 ?auto_136534 ) ( CLEAR ?auto_136533 ) ( not ( = ?auto_136527 ?auto_136534 ) ) ( not ( = ?auto_136528 ?auto_136534 ) ) ( not ( = ?auto_136529 ?auto_136534 ) ) ( not ( = ?auto_136530 ?auto_136534 ) ) ( not ( = ?auto_136531 ?auto_136534 ) ) ( not ( = ?auto_136532 ?auto_136534 ) ) ( not ( = ?auto_136533 ?auto_136534 ) ) ( HOLDING ?auto_136532 ) ( CLEAR ?auto_136531 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136527 ?auto_136528 ?auto_136529 ?auto_136530 ?auto_136531 ?auto_136532 )
      ( MAKE-7PILE ?auto_136527 ?auto_136528 ?auto_136529 ?auto_136530 ?auto_136531 ?auto_136532 ?auto_136533 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136535 - BLOCK
      ?auto_136536 - BLOCK
      ?auto_136537 - BLOCK
      ?auto_136538 - BLOCK
      ?auto_136539 - BLOCK
      ?auto_136540 - BLOCK
      ?auto_136541 - BLOCK
    )
    :vars
    (
      ?auto_136542 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136535 ) ( ON ?auto_136536 ?auto_136535 ) ( ON ?auto_136537 ?auto_136536 ) ( ON ?auto_136538 ?auto_136537 ) ( ON ?auto_136539 ?auto_136538 ) ( not ( = ?auto_136535 ?auto_136536 ) ) ( not ( = ?auto_136535 ?auto_136537 ) ) ( not ( = ?auto_136535 ?auto_136538 ) ) ( not ( = ?auto_136535 ?auto_136539 ) ) ( not ( = ?auto_136535 ?auto_136540 ) ) ( not ( = ?auto_136535 ?auto_136541 ) ) ( not ( = ?auto_136536 ?auto_136537 ) ) ( not ( = ?auto_136536 ?auto_136538 ) ) ( not ( = ?auto_136536 ?auto_136539 ) ) ( not ( = ?auto_136536 ?auto_136540 ) ) ( not ( = ?auto_136536 ?auto_136541 ) ) ( not ( = ?auto_136537 ?auto_136538 ) ) ( not ( = ?auto_136537 ?auto_136539 ) ) ( not ( = ?auto_136537 ?auto_136540 ) ) ( not ( = ?auto_136537 ?auto_136541 ) ) ( not ( = ?auto_136538 ?auto_136539 ) ) ( not ( = ?auto_136538 ?auto_136540 ) ) ( not ( = ?auto_136538 ?auto_136541 ) ) ( not ( = ?auto_136539 ?auto_136540 ) ) ( not ( = ?auto_136539 ?auto_136541 ) ) ( not ( = ?auto_136540 ?auto_136541 ) ) ( ON ?auto_136541 ?auto_136542 ) ( not ( = ?auto_136535 ?auto_136542 ) ) ( not ( = ?auto_136536 ?auto_136542 ) ) ( not ( = ?auto_136537 ?auto_136542 ) ) ( not ( = ?auto_136538 ?auto_136542 ) ) ( not ( = ?auto_136539 ?auto_136542 ) ) ( not ( = ?auto_136540 ?auto_136542 ) ) ( not ( = ?auto_136541 ?auto_136542 ) ) ( CLEAR ?auto_136539 ) ( ON ?auto_136540 ?auto_136541 ) ( CLEAR ?auto_136540 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136542 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136542 ?auto_136541 )
      ( MAKE-7PILE ?auto_136535 ?auto_136536 ?auto_136537 ?auto_136538 ?auto_136539 ?auto_136540 ?auto_136541 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136543 - BLOCK
      ?auto_136544 - BLOCK
      ?auto_136545 - BLOCK
      ?auto_136546 - BLOCK
      ?auto_136547 - BLOCK
      ?auto_136548 - BLOCK
      ?auto_136549 - BLOCK
    )
    :vars
    (
      ?auto_136550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136543 ) ( ON ?auto_136544 ?auto_136543 ) ( ON ?auto_136545 ?auto_136544 ) ( ON ?auto_136546 ?auto_136545 ) ( not ( = ?auto_136543 ?auto_136544 ) ) ( not ( = ?auto_136543 ?auto_136545 ) ) ( not ( = ?auto_136543 ?auto_136546 ) ) ( not ( = ?auto_136543 ?auto_136547 ) ) ( not ( = ?auto_136543 ?auto_136548 ) ) ( not ( = ?auto_136543 ?auto_136549 ) ) ( not ( = ?auto_136544 ?auto_136545 ) ) ( not ( = ?auto_136544 ?auto_136546 ) ) ( not ( = ?auto_136544 ?auto_136547 ) ) ( not ( = ?auto_136544 ?auto_136548 ) ) ( not ( = ?auto_136544 ?auto_136549 ) ) ( not ( = ?auto_136545 ?auto_136546 ) ) ( not ( = ?auto_136545 ?auto_136547 ) ) ( not ( = ?auto_136545 ?auto_136548 ) ) ( not ( = ?auto_136545 ?auto_136549 ) ) ( not ( = ?auto_136546 ?auto_136547 ) ) ( not ( = ?auto_136546 ?auto_136548 ) ) ( not ( = ?auto_136546 ?auto_136549 ) ) ( not ( = ?auto_136547 ?auto_136548 ) ) ( not ( = ?auto_136547 ?auto_136549 ) ) ( not ( = ?auto_136548 ?auto_136549 ) ) ( ON ?auto_136549 ?auto_136550 ) ( not ( = ?auto_136543 ?auto_136550 ) ) ( not ( = ?auto_136544 ?auto_136550 ) ) ( not ( = ?auto_136545 ?auto_136550 ) ) ( not ( = ?auto_136546 ?auto_136550 ) ) ( not ( = ?auto_136547 ?auto_136550 ) ) ( not ( = ?auto_136548 ?auto_136550 ) ) ( not ( = ?auto_136549 ?auto_136550 ) ) ( ON ?auto_136548 ?auto_136549 ) ( CLEAR ?auto_136548 ) ( ON-TABLE ?auto_136550 ) ( HOLDING ?auto_136547 ) ( CLEAR ?auto_136546 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136543 ?auto_136544 ?auto_136545 ?auto_136546 ?auto_136547 )
      ( MAKE-7PILE ?auto_136543 ?auto_136544 ?auto_136545 ?auto_136546 ?auto_136547 ?auto_136548 ?auto_136549 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136551 - BLOCK
      ?auto_136552 - BLOCK
      ?auto_136553 - BLOCK
      ?auto_136554 - BLOCK
      ?auto_136555 - BLOCK
      ?auto_136556 - BLOCK
      ?auto_136557 - BLOCK
    )
    :vars
    (
      ?auto_136558 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136551 ) ( ON ?auto_136552 ?auto_136551 ) ( ON ?auto_136553 ?auto_136552 ) ( ON ?auto_136554 ?auto_136553 ) ( not ( = ?auto_136551 ?auto_136552 ) ) ( not ( = ?auto_136551 ?auto_136553 ) ) ( not ( = ?auto_136551 ?auto_136554 ) ) ( not ( = ?auto_136551 ?auto_136555 ) ) ( not ( = ?auto_136551 ?auto_136556 ) ) ( not ( = ?auto_136551 ?auto_136557 ) ) ( not ( = ?auto_136552 ?auto_136553 ) ) ( not ( = ?auto_136552 ?auto_136554 ) ) ( not ( = ?auto_136552 ?auto_136555 ) ) ( not ( = ?auto_136552 ?auto_136556 ) ) ( not ( = ?auto_136552 ?auto_136557 ) ) ( not ( = ?auto_136553 ?auto_136554 ) ) ( not ( = ?auto_136553 ?auto_136555 ) ) ( not ( = ?auto_136553 ?auto_136556 ) ) ( not ( = ?auto_136553 ?auto_136557 ) ) ( not ( = ?auto_136554 ?auto_136555 ) ) ( not ( = ?auto_136554 ?auto_136556 ) ) ( not ( = ?auto_136554 ?auto_136557 ) ) ( not ( = ?auto_136555 ?auto_136556 ) ) ( not ( = ?auto_136555 ?auto_136557 ) ) ( not ( = ?auto_136556 ?auto_136557 ) ) ( ON ?auto_136557 ?auto_136558 ) ( not ( = ?auto_136551 ?auto_136558 ) ) ( not ( = ?auto_136552 ?auto_136558 ) ) ( not ( = ?auto_136553 ?auto_136558 ) ) ( not ( = ?auto_136554 ?auto_136558 ) ) ( not ( = ?auto_136555 ?auto_136558 ) ) ( not ( = ?auto_136556 ?auto_136558 ) ) ( not ( = ?auto_136557 ?auto_136558 ) ) ( ON ?auto_136556 ?auto_136557 ) ( ON-TABLE ?auto_136558 ) ( CLEAR ?auto_136554 ) ( ON ?auto_136555 ?auto_136556 ) ( CLEAR ?auto_136555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136558 ?auto_136557 ?auto_136556 )
      ( MAKE-7PILE ?auto_136551 ?auto_136552 ?auto_136553 ?auto_136554 ?auto_136555 ?auto_136556 ?auto_136557 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136559 - BLOCK
      ?auto_136560 - BLOCK
      ?auto_136561 - BLOCK
      ?auto_136562 - BLOCK
      ?auto_136563 - BLOCK
      ?auto_136564 - BLOCK
      ?auto_136565 - BLOCK
    )
    :vars
    (
      ?auto_136566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136559 ) ( ON ?auto_136560 ?auto_136559 ) ( ON ?auto_136561 ?auto_136560 ) ( not ( = ?auto_136559 ?auto_136560 ) ) ( not ( = ?auto_136559 ?auto_136561 ) ) ( not ( = ?auto_136559 ?auto_136562 ) ) ( not ( = ?auto_136559 ?auto_136563 ) ) ( not ( = ?auto_136559 ?auto_136564 ) ) ( not ( = ?auto_136559 ?auto_136565 ) ) ( not ( = ?auto_136560 ?auto_136561 ) ) ( not ( = ?auto_136560 ?auto_136562 ) ) ( not ( = ?auto_136560 ?auto_136563 ) ) ( not ( = ?auto_136560 ?auto_136564 ) ) ( not ( = ?auto_136560 ?auto_136565 ) ) ( not ( = ?auto_136561 ?auto_136562 ) ) ( not ( = ?auto_136561 ?auto_136563 ) ) ( not ( = ?auto_136561 ?auto_136564 ) ) ( not ( = ?auto_136561 ?auto_136565 ) ) ( not ( = ?auto_136562 ?auto_136563 ) ) ( not ( = ?auto_136562 ?auto_136564 ) ) ( not ( = ?auto_136562 ?auto_136565 ) ) ( not ( = ?auto_136563 ?auto_136564 ) ) ( not ( = ?auto_136563 ?auto_136565 ) ) ( not ( = ?auto_136564 ?auto_136565 ) ) ( ON ?auto_136565 ?auto_136566 ) ( not ( = ?auto_136559 ?auto_136566 ) ) ( not ( = ?auto_136560 ?auto_136566 ) ) ( not ( = ?auto_136561 ?auto_136566 ) ) ( not ( = ?auto_136562 ?auto_136566 ) ) ( not ( = ?auto_136563 ?auto_136566 ) ) ( not ( = ?auto_136564 ?auto_136566 ) ) ( not ( = ?auto_136565 ?auto_136566 ) ) ( ON ?auto_136564 ?auto_136565 ) ( ON-TABLE ?auto_136566 ) ( ON ?auto_136563 ?auto_136564 ) ( CLEAR ?auto_136563 ) ( HOLDING ?auto_136562 ) ( CLEAR ?auto_136561 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136559 ?auto_136560 ?auto_136561 ?auto_136562 )
      ( MAKE-7PILE ?auto_136559 ?auto_136560 ?auto_136561 ?auto_136562 ?auto_136563 ?auto_136564 ?auto_136565 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136567 - BLOCK
      ?auto_136568 - BLOCK
      ?auto_136569 - BLOCK
      ?auto_136570 - BLOCK
      ?auto_136571 - BLOCK
      ?auto_136572 - BLOCK
      ?auto_136573 - BLOCK
    )
    :vars
    (
      ?auto_136574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136567 ) ( ON ?auto_136568 ?auto_136567 ) ( ON ?auto_136569 ?auto_136568 ) ( not ( = ?auto_136567 ?auto_136568 ) ) ( not ( = ?auto_136567 ?auto_136569 ) ) ( not ( = ?auto_136567 ?auto_136570 ) ) ( not ( = ?auto_136567 ?auto_136571 ) ) ( not ( = ?auto_136567 ?auto_136572 ) ) ( not ( = ?auto_136567 ?auto_136573 ) ) ( not ( = ?auto_136568 ?auto_136569 ) ) ( not ( = ?auto_136568 ?auto_136570 ) ) ( not ( = ?auto_136568 ?auto_136571 ) ) ( not ( = ?auto_136568 ?auto_136572 ) ) ( not ( = ?auto_136568 ?auto_136573 ) ) ( not ( = ?auto_136569 ?auto_136570 ) ) ( not ( = ?auto_136569 ?auto_136571 ) ) ( not ( = ?auto_136569 ?auto_136572 ) ) ( not ( = ?auto_136569 ?auto_136573 ) ) ( not ( = ?auto_136570 ?auto_136571 ) ) ( not ( = ?auto_136570 ?auto_136572 ) ) ( not ( = ?auto_136570 ?auto_136573 ) ) ( not ( = ?auto_136571 ?auto_136572 ) ) ( not ( = ?auto_136571 ?auto_136573 ) ) ( not ( = ?auto_136572 ?auto_136573 ) ) ( ON ?auto_136573 ?auto_136574 ) ( not ( = ?auto_136567 ?auto_136574 ) ) ( not ( = ?auto_136568 ?auto_136574 ) ) ( not ( = ?auto_136569 ?auto_136574 ) ) ( not ( = ?auto_136570 ?auto_136574 ) ) ( not ( = ?auto_136571 ?auto_136574 ) ) ( not ( = ?auto_136572 ?auto_136574 ) ) ( not ( = ?auto_136573 ?auto_136574 ) ) ( ON ?auto_136572 ?auto_136573 ) ( ON-TABLE ?auto_136574 ) ( ON ?auto_136571 ?auto_136572 ) ( CLEAR ?auto_136569 ) ( ON ?auto_136570 ?auto_136571 ) ( CLEAR ?auto_136570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136574 ?auto_136573 ?auto_136572 ?auto_136571 )
      ( MAKE-7PILE ?auto_136567 ?auto_136568 ?auto_136569 ?auto_136570 ?auto_136571 ?auto_136572 ?auto_136573 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136575 - BLOCK
      ?auto_136576 - BLOCK
      ?auto_136577 - BLOCK
      ?auto_136578 - BLOCK
      ?auto_136579 - BLOCK
      ?auto_136580 - BLOCK
      ?auto_136581 - BLOCK
    )
    :vars
    (
      ?auto_136582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136575 ) ( ON ?auto_136576 ?auto_136575 ) ( not ( = ?auto_136575 ?auto_136576 ) ) ( not ( = ?auto_136575 ?auto_136577 ) ) ( not ( = ?auto_136575 ?auto_136578 ) ) ( not ( = ?auto_136575 ?auto_136579 ) ) ( not ( = ?auto_136575 ?auto_136580 ) ) ( not ( = ?auto_136575 ?auto_136581 ) ) ( not ( = ?auto_136576 ?auto_136577 ) ) ( not ( = ?auto_136576 ?auto_136578 ) ) ( not ( = ?auto_136576 ?auto_136579 ) ) ( not ( = ?auto_136576 ?auto_136580 ) ) ( not ( = ?auto_136576 ?auto_136581 ) ) ( not ( = ?auto_136577 ?auto_136578 ) ) ( not ( = ?auto_136577 ?auto_136579 ) ) ( not ( = ?auto_136577 ?auto_136580 ) ) ( not ( = ?auto_136577 ?auto_136581 ) ) ( not ( = ?auto_136578 ?auto_136579 ) ) ( not ( = ?auto_136578 ?auto_136580 ) ) ( not ( = ?auto_136578 ?auto_136581 ) ) ( not ( = ?auto_136579 ?auto_136580 ) ) ( not ( = ?auto_136579 ?auto_136581 ) ) ( not ( = ?auto_136580 ?auto_136581 ) ) ( ON ?auto_136581 ?auto_136582 ) ( not ( = ?auto_136575 ?auto_136582 ) ) ( not ( = ?auto_136576 ?auto_136582 ) ) ( not ( = ?auto_136577 ?auto_136582 ) ) ( not ( = ?auto_136578 ?auto_136582 ) ) ( not ( = ?auto_136579 ?auto_136582 ) ) ( not ( = ?auto_136580 ?auto_136582 ) ) ( not ( = ?auto_136581 ?auto_136582 ) ) ( ON ?auto_136580 ?auto_136581 ) ( ON-TABLE ?auto_136582 ) ( ON ?auto_136579 ?auto_136580 ) ( ON ?auto_136578 ?auto_136579 ) ( CLEAR ?auto_136578 ) ( HOLDING ?auto_136577 ) ( CLEAR ?auto_136576 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136575 ?auto_136576 ?auto_136577 )
      ( MAKE-7PILE ?auto_136575 ?auto_136576 ?auto_136577 ?auto_136578 ?auto_136579 ?auto_136580 ?auto_136581 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136583 - BLOCK
      ?auto_136584 - BLOCK
      ?auto_136585 - BLOCK
      ?auto_136586 - BLOCK
      ?auto_136587 - BLOCK
      ?auto_136588 - BLOCK
      ?auto_136589 - BLOCK
    )
    :vars
    (
      ?auto_136590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136583 ) ( ON ?auto_136584 ?auto_136583 ) ( not ( = ?auto_136583 ?auto_136584 ) ) ( not ( = ?auto_136583 ?auto_136585 ) ) ( not ( = ?auto_136583 ?auto_136586 ) ) ( not ( = ?auto_136583 ?auto_136587 ) ) ( not ( = ?auto_136583 ?auto_136588 ) ) ( not ( = ?auto_136583 ?auto_136589 ) ) ( not ( = ?auto_136584 ?auto_136585 ) ) ( not ( = ?auto_136584 ?auto_136586 ) ) ( not ( = ?auto_136584 ?auto_136587 ) ) ( not ( = ?auto_136584 ?auto_136588 ) ) ( not ( = ?auto_136584 ?auto_136589 ) ) ( not ( = ?auto_136585 ?auto_136586 ) ) ( not ( = ?auto_136585 ?auto_136587 ) ) ( not ( = ?auto_136585 ?auto_136588 ) ) ( not ( = ?auto_136585 ?auto_136589 ) ) ( not ( = ?auto_136586 ?auto_136587 ) ) ( not ( = ?auto_136586 ?auto_136588 ) ) ( not ( = ?auto_136586 ?auto_136589 ) ) ( not ( = ?auto_136587 ?auto_136588 ) ) ( not ( = ?auto_136587 ?auto_136589 ) ) ( not ( = ?auto_136588 ?auto_136589 ) ) ( ON ?auto_136589 ?auto_136590 ) ( not ( = ?auto_136583 ?auto_136590 ) ) ( not ( = ?auto_136584 ?auto_136590 ) ) ( not ( = ?auto_136585 ?auto_136590 ) ) ( not ( = ?auto_136586 ?auto_136590 ) ) ( not ( = ?auto_136587 ?auto_136590 ) ) ( not ( = ?auto_136588 ?auto_136590 ) ) ( not ( = ?auto_136589 ?auto_136590 ) ) ( ON ?auto_136588 ?auto_136589 ) ( ON-TABLE ?auto_136590 ) ( ON ?auto_136587 ?auto_136588 ) ( ON ?auto_136586 ?auto_136587 ) ( CLEAR ?auto_136584 ) ( ON ?auto_136585 ?auto_136586 ) ( CLEAR ?auto_136585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136590 ?auto_136589 ?auto_136588 ?auto_136587 ?auto_136586 )
      ( MAKE-7PILE ?auto_136583 ?auto_136584 ?auto_136585 ?auto_136586 ?auto_136587 ?auto_136588 ?auto_136589 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136591 - BLOCK
      ?auto_136592 - BLOCK
      ?auto_136593 - BLOCK
      ?auto_136594 - BLOCK
      ?auto_136595 - BLOCK
      ?auto_136596 - BLOCK
      ?auto_136597 - BLOCK
    )
    :vars
    (
      ?auto_136598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136591 ) ( not ( = ?auto_136591 ?auto_136592 ) ) ( not ( = ?auto_136591 ?auto_136593 ) ) ( not ( = ?auto_136591 ?auto_136594 ) ) ( not ( = ?auto_136591 ?auto_136595 ) ) ( not ( = ?auto_136591 ?auto_136596 ) ) ( not ( = ?auto_136591 ?auto_136597 ) ) ( not ( = ?auto_136592 ?auto_136593 ) ) ( not ( = ?auto_136592 ?auto_136594 ) ) ( not ( = ?auto_136592 ?auto_136595 ) ) ( not ( = ?auto_136592 ?auto_136596 ) ) ( not ( = ?auto_136592 ?auto_136597 ) ) ( not ( = ?auto_136593 ?auto_136594 ) ) ( not ( = ?auto_136593 ?auto_136595 ) ) ( not ( = ?auto_136593 ?auto_136596 ) ) ( not ( = ?auto_136593 ?auto_136597 ) ) ( not ( = ?auto_136594 ?auto_136595 ) ) ( not ( = ?auto_136594 ?auto_136596 ) ) ( not ( = ?auto_136594 ?auto_136597 ) ) ( not ( = ?auto_136595 ?auto_136596 ) ) ( not ( = ?auto_136595 ?auto_136597 ) ) ( not ( = ?auto_136596 ?auto_136597 ) ) ( ON ?auto_136597 ?auto_136598 ) ( not ( = ?auto_136591 ?auto_136598 ) ) ( not ( = ?auto_136592 ?auto_136598 ) ) ( not ( = ?auto_136593 ?auto_136598 ) ) ( not ( = ?auto_136594 ?auto_136598 ) ) ( not ( = ?auto_136595 ?auto_136598 ) ) ( not ( = ?auto_136596 ?auto_136598 ) ) ( not ( = ?auto_136597 ?auto_136598 ) ) ( ON ?auto_136596 ?auto_136597 ) ( ON-TABLE ?auto_136598 ) ( ON ?auto_136595 ?auto_136596 ) ( ON ?auto_136594 ?auto_136595 ) ( ON ?auto_136593 ?auto_136594 ) ( CLEAR ?auto_136593 ) ( HOLDING ?auto_136592 ) ( CLEAR ?auto_136591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136591 ?auto_136592 )
      ( MAKE-7PILE ?auto_136591 ?auto_136592 ?auto_136593 ?auto_136594 ?auto_136595 ?auto_136596 ?auto_136597 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136599 - BLOCK
      ?auto_136600 - BLOCK
      ?auto_136601 - BLOCK
      ?auto_136602 - BLOCK
      ?auto_136603 - BLOCK
      ?auto_136604 - BLOCK
      ?auto_136605 - BLOCK
    )
    :vars
    (
      ?auto_136606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136599 ) ( not ( = ?auto_136599 ?auto_136600 ) ) ( not ( = ?auto_136599 ?auto_136601 ) ) ( not ( = ?auto_136599 ?auto_136602 ) ) ( not ( = ?auto_136599 ?auto_136603 ) ) ( not ( = ?auto_136599 ?auto_136604 ) ) ( not ( = ?auto_136599 ?auto_136605 ) ) ( not ( = ?auto_136600 ?auto_136601 ) ) ( not ( = ?auto_136600 ?auto_136602 ) ) ( not ( = ?auto_136600 ?auto_136603 ) ) ( not ( = ?auto_136600 ?auto_136604 ) ) ( not ( = ?auto_136600 ?auto_136605 ) ) ( not ( = ?auto_136601 ?auto_136602 ) ) ( not ( = ?auto_136601 ?auto_136603 ) ) ( not ( = ?auto_136601 ?auto_136604 ) ) ( not ( = ?auto_136601 ?auto_136605 ) ) ( not ( = ?auto_136602 ?auto_136603 ) ) ( not ( = ?auto_136602 ?auto_136604 ) ) ( not ( = ?auto_136602 ?auto_136605 ) ) ( not ( = ?auto_136603 ?auto_136604 ) ) ( not ( = ?auto_136603 ?auto_136605 ) ) ( not ( = ?auto_136604 ?auto_136605 ) ) ( ON ?auto_136605 ?auto_136606 ) ( not ( = ?auto_136599 ?auto_136606 ) ) ( not ( = ?auto_136600 ?auto_136606 ) ) ( not ( = ?auto_136601 ?auto_136606 ) ) ( not ( = ?auto_136602 ?auto_136606 ) ) ( not ( = ?auto_136603 ?auto_136606 ) ) ( not ( = ?auto_136604 ?auto_136606 ) ) ( not ( = ?auto_136605 ?auto_136606 ) ) ( ON ?auto_136604 ?auto_136605 ) ( ON-TABLE ?auto_136606 ) ( ON ?auto_136603 ?auto_136604 ) ( ON ?auto_136602 ?auto_136603 ) ( ON ?auto_136601 ?auto_136602 ) ( CLEAR ?auto_136599 ) ( ON ?auto_136600 ?auto_136601 ) ( CLEAR ?auto_136600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136606 ?auto_136605 ?auto_136604 ?auto_136603 ?auto_136602 ?auto_136601 )
      ( MAKE-7PILE ?auto_136599 ?auto_136600 ?auto_136601 ?auto_136602 ?auto_136603 ?auto_136604 ?auto_136605 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136607 - BLOCK
      ?auto_136608 - BLOCK
      ?auto_136609 - BLOCK
      ?auto_136610 - BLOCK
      ?auto_136611 - BLOCK
      ?auto_136612 - BLOCK
      ?auto_136613 - BLOCK
    )
    :vars
    (
      ?auto_136614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136607 ?auto_136608 ) ) ( not ( = ?auto_136607 ?auto_136609 ) ) ( not ( = ?auto_136607 ?auto_136610 ) ) ( not ( = ?auto_136607 ?auto_136611 ) ) ( not ( = ?auto_136607 ?auto_136612 ) ) ( not ( = ?auto_136607 ?auto_136613 ) ) ( not ( = ?auto_136608 ?auto_136609 ) ) ( not ( = ?auto_136608 ?auto_136610 ) ) ( not ( = ?auto_136608 ?auto_136611 ) ) ( not ( = ?auto_136608 ?auto_136612 ) ) ( not ( = ?auto_136608 ?auto_136613 ) ) ( not ( = ?auto_136609 ?auto_136610 ) ) ( not ( = ?auto_136609 ?auto_136611 ) ) ( not ( = ?auto_136609 ?auto_136612 ) ) ( not ( = ?auto_136609 ?auto_136613 ) ) ( not ( = ?auto_136610 ?auto_136611 ) ) ( not ( = ?auto_136610 ?auto_136612 ) ) ( not ( = ?auto_136610 ?auto_136613 ) ) ( not ( = ?auto_136611 ?auto_136612 ) ) ( not ( = ?auto_136611 ?auto_136613 ) ) ( not ( = ?auto_136612 ?auto_136613 ) ) ( ON ?auto_136613 ?auto_136614 ) ( not ( = ?auto_136607 ?auto_136614 ) ) ( not ( = ?auto_136608 ?auto_136614 ) ) ( not ( = ?auto_136609 ?auto_136614 ) ) ( not ( = ?auto_136610 ?auto_136614 ) ) ( not ( = ?auto_136611 ?auto_136614 ) ) ( not ( = ?auto_136612 ?auto_136614 ) ) ( not ( = ?auto_136613 ?auto_136614 ) ) ( ON ?auto_136612 ?auto_136613 ) ( ON-TABLE ?auto_136614 ) ( ON ?auto_136611 ?auto_136612 ) ( ON ?auto_136610 ?auto_136611 ) ( ON ?auto_136609 ?auto_136610 ) ( ON ?auto_136608 ?auto_136609 ) ( CLEAR ?auto_136608 ) ( HOLDING ?auto_136607 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136607 )
      ( MAKE-7PILE ?auto_136607 ?auto_136608 ?auto_136609 ?auto_136610 ?auto_136611 ?auto_136612 ?auto_136613 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136615 - BLOCK
      ?auto_136616 - BLOCK
      ?auto_136617 - BLOCK
      ?auto_136618 - BLOCK
      ?auto_136619 - BLOCK
      ?auto_136620 - BLOCK
      ?auto_136621 - BLOCK
    )
    :vars
    (
      ?auto_136622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136615 ?auto_136616 ) ) ( not ( = ?auto_136615 ?auto_136617 ) ) ( not ( = ?auto_136615 ?auto_136618 ) ) ( not ( = ?auto_136615 ?auto_136619 ) ) ( not ( = ?auto_136615 ?auto_136620 ) ) ( not ( = ?auto_136615 ?auto_136621 ) ) ( not ( = ?auto_136616 ?auto_136617 ) ) ( not ( = ?auto_136616 ?auto_136618 ) ) ( not ( = ?auto_136616 ?auto_136619 ) ) ( not ( = ?auto_136616 ?auto_136620 ) ) ( not ( = ?auto_136616 ?auto_136621 ) ) ( not ( = ?auto_136617 ?auto_136618 ) ) ( not ( = ?auto_136617 ?auto_136619 ) ) ( not ( = ?auto_136617 ?auto_136620 ) ) ( not ( = ?auto_136617 ?auto_136621 ) ) ( not ( = ?auto_136618 ?auto_136619 ) ) ( not ( = ?auto_136618 ?auto_136620 ) ) ( not ( = ?auto_136618 ?auto_136621 ) ) ( not ( = ?auto_136619 ?auto_136620 ) ) ( not ( = ?auto_136619 ?auto_136621 ) ) ( not ( = ?auto_136620 ?auto_136621 ) ) ( ON ?auto_136621 ?auto_136622 ) ( not ( = ?auto_136615 ?auto_136622 ) ) ( not ( = ?auto_136616 ?auto_136622 ) ) ( not ( = ?auto_136617 ?auto_136622 ) ) ( not ( = ?auto_136618 ?auto_136622 ) ) ( not ( = ?auto_136619 ?auto_136622 ) ) ( not ( = ?auto_136620 ?auto_136622 ) ) ( not ( = ?auto_136621 ?auto_136622 ) ) ( ON ?auto_136620 ?auto_136621 ) ( ON-TABLE ?auto_136622 ) ( ON ?auto_136619 ?auto_136620 ) ( ON ?auto_136618 ?auto_136619 ) ( ON ?auto_136617 ?auto_136618 ) ( ON ?auto_136616 ?auto_136617 ) ( ON ?auto_136615 ?auto_136616 ) ( CLEAR ?auto_136615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136622 ?auto_136621 ?auto_136620 ?auto_136619 ?auto_136618 ?auto_136617 ?auto_136616 )
      ( MAKE-7PILE ?auto_136615 ?auto_136616 ?auto_136617 ?auto_136618 ?auto_136619 ?auto_136620 ?auto_136621 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136623 - BLOCK
      ?auto_136624 - BLOCK
      ?auto_136625 - BLOCK
      ?auto_136626 - BLOCK
      ?auto_136627 - BLOCK
      ?auto_136628 - BLOCK
      ?auto_136629 - BLOCK
    )
    :vars
    (
      ?auto_136630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136623 ?auto_136624 ) ) ( not ( = ?auto_136623 ?auto_136625 ) ) ( not ( = ?auto_136623 ?auto_136626 ) ) ( not ( = ?auto_136623 ?auto_136627 ) ) ( not ( = ?auto_136623 ?auto_136628 ) ) ( not ( = ?auto_136623 ?auto_136629 ) ) ( not ( = ?auto_136624 ?auto_136625 ) ) ( not ( = ?auto_136624 ?auto_136626 ) ) ( not ( = ?auto_136624 ?auto_136627 ) ) ( not ( = ?auto_136624 ?auto_136628 ) ) ( not ( = ?auto_136624 ?auto_136629 ) ) ( not ( = ?auto_136625 ?auto_136626 ) ) ( not ( = ?auto_136625 ?auto_136627 ) ) ( not ( = ?auto_136625 ?auto_136628 ) ) ( not ( = ?auto_136625 ?auto_136629 ) ) ( not ( = ?auto_136626 ?auto_136627 ) ) ( not ( = ?auto_136626 ?auto_136628 ) ) ( not ( = ?auto_136626 ?auto_136629 ) ) ( not ( = ?auto_136627 ?auto_136628 ) ) ( not ( = ?auto_136627 ?auto_136629 ) ) ( not ( = ?auto_136628 ?auto_136629 ) ) ( ON ?auto_136629 ?auto_136630 ) ( not ( = ?auto_136623 ?auto_136630 ) ) ( not ( = ?auto_136624 ?auto_136630 ) ) ( not ( = ?auto_136625 ?auto_136630 ) ) ( not ( = ?auto_136626 ?auto_136630 ) ) ( not ( = ?auto_136627 ?auto_136630 ) ) ( not ( = ?auto_136628 ?auto_136630 ) ) ( not ( = ?auto_136629 ?auto_136630 ) ) ( ON ?auto_136628 ?auto_136629 ) ( ON-TABLE ?auto_136630 ) ( ON ?auto_136627 ?auto_136628 ) ( ON ?auto_136626 ?auto_136627 ) ( ON ?auto_136625 ?auto_136626 ) ( ON ?auto_136624 ?auto_136625 ) ( HOLDING ?auto_136623 ) ( CLEAR ?auto_136624 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136630 ?auto_136629 ?auto_136628 ?auto_136627 ?auto_136626 ?auto_136625 ?auto_136624 ?auto_136623 )
      ( MAKE-7PILE ?auto_136623 ?auto_136624 ?auto_136625 ?auto_136626 ?auto_136627 ?auto_136628 ?auto_136629 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136631 - BLOCK
      ?auto_136632 - BLOCK
      ?auto_136633 - BLOCK
      ?auto_136634 - BLOCK
      ?auto_136635 - BLOCK
      ?auto_136636 - BLOCK
      ?auto_136637 - BLOCK
    )
    :vars
    (
      ?auto_136638 - BLOCK
      ?auto_136639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136631 ?auto_136632 ) ) ( not ( = ?auto_136631 ?auto_136633 ) ) ( not ( = ?auto_136631 ?auto_136634 ) ) ( not ( = ?auto_136631 ?auto_136635 ) ) ( not ( = ?auto_136631 ?auto_136636 ) ) ( not ( = ?auto_136631 ?auto_136637 ) ) ( not ( = ?auto_136632 ?auto_136633 ) ) ( not ( = ?auto_136632 ?auto_136634 ) ) ( not ( = ?auto_136632 ?auto_136635 ) ) ( not ( = ?auto_136632 ?auto_136636 ) ) ( not ( = ?auto_136632 ?auto_136637 ) ) ( not ( = ?auto_136633 ?auto_136634 ) ) ( not ( = ?auto_136633 ?auto_136635 ) ) ( not ( = ?auto_136633 ?auto_136636 ) ) ( not ( = ?auto_136633 ?auto_136637 ) ) ( not ( = ?auto_136634 ?auto_136635 ) ) ( not ( = ?auto_136634 ?auto_136636 ) ) ( not ( = ?auto_136634 ?auto_136637 ) ) ( not ( = ?auto_136635 ?auto_136636 ) ) ( not ( = ?auto_136635 ?auto_136637 ) ) ( not ( = ?auto_136636 ?auto_136637 ) ) ( ON ?auto_136637 ?auto_136638 ) ( not ( = ?auto_136631 ?auto_136638 ) ) ( not ( = ?auto_136632 ?auto_136638 ) ) ( not ( = ?auto_136633 ?auto_136638 ) ) ( not ( = ?auto_136634 ?auto_136638 ) ) ( not ( = ?auto_136635 ?auto_136638 ) ) ( not ( = ?auto_136636 ?auto_136638 ) ) ( not ( = ?auto_136637 ?auto_136638 ) ) ( ON ?auto_136636 ?auto_136637 ) ( ON-TABLE ?auto_136638 ) ( ON ?auto_136635 ?auto_136636 ) ( ON ?auto_136634 ?auto_136635 ) ( ON ?auto_136633 ?auto_136634 ) ( ON ?auto_136632 ?auto_136633 ) ( CLEAR ?auto_136632 ) ( ON ?auto_136631 ?auto_136639 ) ( CLEAR ?auto_136631 ) ( HAND-EMPTY ) ( not ( = ?auto_136631 ?auto_136639 ) ) ( not ( = ?auto_136632 ?auto_136639 ) ) ( not ( = ?auto_136633 ?auto_136639 ) ) ( not ( = ?auto_136634 ?auto_136639 ) ) ( not ( = ?auto_136635 ?auto_136639 ) ) ( not ( = ?auto_136636 ?auto_136639 ) ) ( not ( = ?auto_136637 ?auto_136639 ) ) ( not ( = ?auto_136638 ?auto_136639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136631 ?auto_136639 )
      ( MAKE-7PILE ?auto_136631 ?auto_136632 ?auto_136633 ?auto_136634 ?auto_136635 ?auto_136636 ?auto_136637 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136640 - BLOCK
      ?auto_136641 - BLOCK
      ?auto_136642 - BLOCK
      ?auto_136643 - BLOCK
      ?auto_136644 - BLOCK
      ?auto_136645 - BLOCK
      ?auto_136646 - BLOCK
    )
    :vars
    (
      ?auto_136648 - BLOCK
      ?auto_136647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136640 ?auto_136641 ) ) ( not ( = ?auto_136640 ?auto_136642 ) ) ( not ( = ?auto_136640 ?auto_136643 ) ) ( not ( = ?auto_136640 ?auto_136644 ) ) ( not ( = ?auto_136640 ?auto_136645 ) ) ( not ( = ?auto_136640 ?auto_136646 ) ) ( not ( = ?auto_136641 ?auto_136642 ) ) ( not ( = ?auto_136641 ?auto_136643 ) ) ( not ( = ?auto_136641 ?auto_136644 ) ) ( not ( = ?auto_136641 ?auto_136645 ) ) ( not ( = ?auto_136641 ?auto_136646 ) ) ( not ( = ?auto_136642 ?auto_136643 ) ) ( not ( = ?auto_136642 ?auto_136644 ) ) ( not ( = ?auto_136642 ?auto_136645 ) ) ( not ( = ?auto_136642 ?auto_136646 ) ) ( not ( = ?auto_136643 ?auto_136644 ) ) ( not ( = ?auto_136643 ?auto_136645 ) ) ( not ( = ?auto_136643 ?auto_136646 ) ) ( not ( = ?auto_136644 ?auto_136645 ) ) ( not ( = ?auto_136644 ?auto_136646 ) ) ( not ( = ?auto_136645 ?auto_136646 ) ) ( ON ?auto_136646 ?auto_136648 ) ( not ( = ?auto_136640 ?auto_136648 ) ) ( not ( = ?auto_136641 ?auto_136648 ) ) ( not ( = ?auto_136642 ?auto_136648 ) ) ( not ( = ?auto_136643 ?auto_136648 ) ) ( not ( = ?auto_136644 ?auto_136648 ) ) ( not ( = ?auto_136645 ?auto_136648 ) ) ( not ( = ?auto_136646 ?auto_136648 ) ) ( ON ?auto_136645 ?auto_136646 ) ( ON-TABLE ?auto_136648 ) ( ON ?auto_136644 ?auto_136645 ) ( ON ?auto_136643 ?auto_136644 ) ( ON ?auto_136642 ?auto_136643 ) ( ON ?auto_136640 ?auto_136647 ) ( CLEAR ?auto_136640 ) ( not ( = ?auto_136640 ?auto_136647 ) ) ( not ( = ?auto_136641 ?auto_136647 ) ) ( not ( = ?auto_136642 ?auto_136647 ) ) ( not ( = ?auto_136643 ?auto_136647 ) ) ( not ( = ?auto_136644 ?auto_136647 ) ) ( not ( = ?auto_136645 ?auto_136647 ) ) ( not ( = ?auto_136646 ?auto_136647 ) ) ( not ( = ?auto_136648 ?auto_136647 ) ) ( HOLDING ?auto_136641 ) ( CLEAR ?auto_136642 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136648 ?auto_136646 ?auto_136645 ?auto_136644 ?auto_136643 ?auto_136642 ?auto_136641 )
      ( MAKE-7PILE ?auto_136640 ?auto_136641 ?auto_136642 ?auto_136643 ?auto_136644 ?auto_136645 ?auto_136646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136649 - BLOCK
      ?auto_136650 - BLOCK
      ?auto_136651 - BLOCK
      ?auto_136652 - BLOCK
      ?auto_136653 - BLOCK
      ?auto_136654 - BLOCK
      ?auto_136655 - BLOCK
    )
    :vars
    (
      ?auto_136656 - BLOCK
      ?auto_136657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136649 ?auto_136650 ) ) ( not ( = ?auto_136649 ?auto_136651 ) ) ( not ( = ?auto_136649 ?auto_136652 ) ) ( not ( = ?auto_136649 ?auto_136653 ) ) ( not ( = ?auto_136649 ?auto_136654 ) ) ( not ( = ?auto_136649 ?auto_136655 ) ) ( not ( = ?auto_136650 ?auto_136651 ) ) ( not ( = ?auto_136650 ?auto_136652 ) ) ( not ( = ?auto_136650 ?auto_136653 ) ) ( not ( = ?auto_136650 ?auto_136654 ) ) ( not ( = ?auto_136650 ?auto_136655 ) ) ( not ( = ?auto_136651 ?auto_136652 ) ) ( not ( = ?auto_136651 ?auto_136653 ) ) ( not ( = ?auto_136651 ?auto_136654 ) ) ( not ( = ?auto_136651 ?auto_136655 ) ) ( not ( = ?auto_136652 ?auto_136653 ) ) ( not ( = ?auto_136652 ?auto_136654 ) ) ( not ( = ?auto_136652 ?auto_136655 ) ) ( not ( = ?auto_136653 ?auto_136654 ) ) ( not ( = ?auto_136653 ?auto_136655 ) ) ( not ( = ?auto_136654 ?auto_136655 ) ) ( ON ?auto_136655 ?auto_136656 ) ( not ( = ?auto_136649 ?auto_136656 ) ) ( not ( = ?auto_136650 ?auto_136656 ) ) ( not ( = ?auto_136651 ?auto_136656 ) ) ( not ( = ?auto_136652 ?auto_136656 ) ) ( not ( = ?auto_136653 ?auto_136656 ) ) ( not ( = ?auto_136654 ?auto_136656 ) ) ( not ( = ?auto_136655 ?auto_136656 ) ) ( ON ?auto_136654 ?auto_136655 ) ( ON-TABLE ?auto_136656 ) ( ON ?auto_136653 ?auto_136654 ) ( ON ?auto_136652 ?auto_136653 ) ( ON ?auto_136651 ?auto_136652 ) ( ON ?auto_136649 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136657 ) ) ( not ( = ?auto_136650 ?auto_136657 ) ) ( not ( = ?auto_136651 ?auto_136657 ) ) ( not ( = ?auto_136652 ?auto_136657 ) ) ( not ( = ?auto_136653 ?auto_136657 ) ) ( not ( = ?auto_136654 ?auto_136657 ) ) ( not ( = ?auto_136655 ?auto_136657 ) ) ( not ( = ?auto_136656 ?auto_136657 ) ) ( CLEAR ?auto_136651 ) ( ON ?auto_136650 ?auto_136649 ) ( CLEAR ?auto_136650 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136657 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136657 ?auto_136649 )
      ( MAKE-7PILE ?auto_136649 ?auto_136650 ?auto_136651 ?auto_136652 ?auto_136653 ?auto_136654 ?auto_136655 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136658 - BLOCK
      ?auto_136659 - BLOCK
      ?auto_136660 - BLOCK
      ?auto_136661 - BLOCK
      ?auto_136662 - BLOCK
      ?auto_136663 - BLOCK
      ?auto_136664 - BLOCK
    )
    :vars
    (
      ?auto_136666 - BLOCK
      ?auto_136665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136658 ?auto_136659 ) ) ( not ( = ?auto_136658 ?auto_136660 ) ) ( not ( = ?auto_136658 ?auto_136661 ) ) ( not ( = ?auto_136658 ?auto_136662 ) ) ( not ( = ?auto_136658 ?auto_136663 ) ) ( not ( = ?auto_136658 ?auto_136664 ) ) ( not ( = ?auto_136659 ?auto_136660 ) ) ( not ( = ?auto_136659 ?auto_136661 ) ) ( not ( = ?auto_136659 ?auto_136662 ) ) ( not ( = ?auto_136659 ?auto_136663 ) ) ( not ( = ?auto_136659 ?auto_136664 ) ) ( not ( = ?auto_136660 ?auto_136661 ) ) ( not ( = ?auto_136660 ?auto_136662 ) ) ( not ( = ?auto_136660 ?auto_136663 ) ) ( not ( = ?auto_136660 ?auto_136664 ) ) ( not ( = ?auto_136661 ?auto_136662 ) ) ( not ( = ?auto_136661 ?auto_136663 ) ) ( not ( = ?auto_136661 ?auto_136664 ) ) ( not ( = ?auto_136662 ?auto_136663 ) ) ( not ( = ?auto_136662 ?auto_136664 ) ) ( not ( = ?auto_136663 ?auto_136664 ) ) ( ON ?auto_136664 ?auto_136666 ) ( not ( = ?auto_136658 ?auto_136666 ) ) ( not ( = ?auto_136659 ?auto_136666 ) ) ( not ( = ?auto_136660 ?auto_136666 ) ) ( not ( = ?auto_136661 ?auto_136666 ) ) ( not ( = ?auto_136662 ?auto_136666 ) ) ( not ( = ?auto_136663 ?auto_136666 ) ) ( not ( = ?auto_136664 ?auto_136666 ) ) ( ON ?auto_136663 ?auto_136664 ) ( ON-TABLE ?auto_136666 ) ( ON ?auto_136662 ?auto_136663 ) ( ON ?auto_136661 ?auto_136662 ) ( ON ?auto_136658 ?auto_136665 ) ( not ( = ?auto_136658 ?auto_136665 ) ) ( not ( = ?auto_136659 ?auto_136665 ) ) ( not ( = ?auto_136660 ?auto_136665 ) ) ( not ( = ?auto_136661 ?auto_136665 ) ) ( not ( = ?auto_136662 ?auto_136665 ) ) ( not ( = ?auto_136663 ?auto_136665 ) ) ( not ( = ?auto_136664 ?auto_136665 ) ) ( not ( = ?auto_136666 ?auto_136665 ) ) ( ON ?auto_136659 ?auto_136658 ) ( CLEAR ?auto_136659 ) ( ON-TABLE ?auto_136665 ) ( HOLDING ?auto_136660 ) ( CLEAR ?auto_136661 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136666 ?auto_136664 ?auto_136663 ?auto_136662 ?auto_136661 ?auto_136660 )
      ( MAKE-7PILE ?auto_136658 ?auto_136659 ?auto_136660 ?auto_136661 ?auto_136662 ?auto_136663 ?auto_136664 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136667 - BLOCK
      ?auto_136668 - BLOCK
      ?auto_136669 - BLOCK
      ?auto_136670 - BLOCK
      ?auto_136671 - BLOCK
      ?auto_136672 - BLOCK
      ?auto_136673 - BLOCK
    )
    :vars
    (
      ?auto_136674 - BLOCK
      ?auto_136675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136667 ?auto_136668 ) ) ( not ( = ?auto_136667 ?auto_136669 ) ) ( not ( = ?auto_136667 ?auto_136670 ) ) ( not ( = ?auto_136667 ?auto_136671 ) ) ( not ( = ?auto_136667 ?auto_136672 ) ) ( not ( = ?auto_136667 ?auto_136673 ) ) ( not ( = ?auto_136668 ?auto_136669 ) ) ( not ( = ?auto_136668 ?auto_136670 ) ) ( not ( = ?auto_136668 ?auto_136671 ) ) ( not ( = ?auto_136668 ?auto_136672 ) ) ( not ( = ?auto_136668 ?auto_136673 ) ) ( not ( = ?auto_136669 ?auto_136670 ) ) ( not ( = ?auto_136669 ?auto_136671 ) ) ( not ( = ?auto_136669 ?auto_136672 ) ) ( not ( = ?auto_136669 ?auto_136673 ) ) ( not ( = ?auto_136670 ?auto_136671 ) ) ( not ( = ?auto_136670 ?auto_136672 ) ) ( not ( = ?auto_136670 ?auto_136673 ) ) ( not ( = ?auto_136671 ?auto_136672 ) ) ( not ( = ?auto_136671 ?auto_136673 ) ) ( not ( = ?auto_136672 ?auto_136673 ) ) ( ON ?auto_136673 ?auto_136674 ) ( not ( = ?auto_136667 ?auto_136674 ) ) ( not ( = ?auto_136668 ?auto_136674 ) ) ( not ( = ?auto_136669 ?auto_136674 ) ) ( not ( = ?auto_136670 ?auto_136674 ) ) ( not ( = ?auto_136671 ?auto_136674 ) ) ( not ( = ?auto_136672 ?auto_136674 ) ) ( not ( = ?auto_136673 ?auto_136674 ) ) ( ON ?auto_136672 ?auto_136673 ) ( ON-TABLE ?auto_136674 ) ( ON ?auto_136671 ?auto_136672 ) ( ON ?auto_136670 ?auto_136671 ) ( ON ?auto_136667 ?auto_136675 ) ( not ( = ?auto_136667 ?auto_136675 ) ) ( not ( = ?auto_136668 ?auto_136675 ) ) ( not ( = ?auto_136669 ?auto_136675 ) ) ( not ( = ?auto_136670 ?auto_136675 ) ) ( not ( = ?auto_136671 ?auto_136675 ) ) ( not ( = ?auto_136672 ?auto_136675 ) ) ( not ( = ?auto_136673 ?auto_136675 ) ) ( not ( = ?auto_136674 ?auto_136675 ) ) ( ON ?auto_136668 ?auto_136667 ) ( ON-TABLE ?auto_136675 ) ( CLEAR ?auto_136670 ) ( ON ?auto_136669 ?auto_136668 ) ( CLEAR ?auto_136669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136675 ?auto_136667 ?auto_136668 )
      ( MAKE-7PILE ?auto_136667 ?auto_136668 ?auto_136669 ?auto_136670 ?auto_136671 ?auto_136672 ?auto_136673 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136676 - BLOCK
      ?auto_136677 - BLOCK
      ?auto_136678 - BLOCK
      ?auto_136679 - BLOCK
      ?auto_136680 - BLOCK
      ?auto_136681 - BLOCK
      ?auto_136682 - BLOCK
    )
    :vars
    (
      ?auto_136684 - BLOCK
      ?auto_136683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136676 ?auto_136677 ) ) ( not ( = ?auto_136676 ?auto_136678 ) ) ( not ( = ?auto_136676 ?auto_136679 ) ) ( not ( = ?auto_136676 ?auto_136680 ) ) ( not ( = ?auto_136676 ?auto_136681 ) ) ( not ( = ?auto_136676 ?auto_136682 ) ) ( not ( = ?auto_136677 ?auto_136678 ) ) ( not ( = ?auto_136677 ?auto_136679 ) ) ( not ( = ?auto_136677 ?auto_136680 ) ) ( not ( = ?auto_136677 ?auto_136681 ) ) ( not ( = ?auto_136677 ?auto_136682 ) ) ( not ( = ?auto_136678 ?auto_136679 ) ) ( not ( = ?auto_136678 ?auto_136680 ) ) ( not ( = ?auto_136678 ?auto_136681 ) ) ( not ( = ?auto_136678 ?auto_136682 ) ) ( not ( = ?auto_136679 ?auto_136680 ) ) ( not ( = ?auto_136679 ?auto_136681 ) ) ( not ( = ?auto_136679 ?auto_136682 ) ) ( not ( = ?auto_136680 ?auto_136681 ) ) ( not ( = ?auto_136680 ?auto_136682 ) ) ( not ( = ?auto_136681 ?auto_136682 ) ) ( ON ?auto_136682 ?auto_136684 ) ( not ( = ?auto_136676 ?auto_136684 ) ) ( not ( = ?auto_136677 ?auto_136684 ) ) ( not ( = ?auto_136678 ?auto_136684 ) ) ( not ( = ?auto_136679 ?auto_136684 ) ) ( not ( = ?auto_136680 ?auto_136684 ) ) ( not ( = ?auto_136681 ?auto_136684 ) ) ( not ( = ?auto_136682 ?auto_136684 ) ) ( ON ?auto_136681 ?auto_136682 ) ( ON-TABLE ?auto_136684 ) ( ON ?auto_136680 ?auto_136681 ) ( ON ?auto_136676 ?auto_136683 ) ( not ( = ?auto_136676 ?auto_136683 ) ) ( not ( = ?auto_136677 ?auto_136683 ) ) ( not ( = ?auto_136678 ?auto_136683 ) ) ( not ( = ?auto_136679 ?auto_136683 ) ) ( not ( = ?auto_136680 ?auto_136683 ) ) ( not ( = ?auto_136681 ?auto_136683 ) ) ( not ( = ?auto_136682 ?auto_136683 ) ) ( not ( = ?auto_136684 ?auto_136683 ) ) ( ON ?auto_136677 ?auto_136676 ) ( ON-TABLE ?auto_136683 ) ( ON ?auto_136678 ?auto_136677 ) ( CLEAR ?auto_136678 ) ( HOLDING ?auto_136679 ) ( CLEAR ?auto_136680 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136684 ?auto_136682 ?auto_136681 ?auto_136680 ?auto_136679 )
      ( MAKE-7PILE ?auto_136676 ?auto_136677 ?auto_136678 ?auto_136679 ?auto_136680 ?auto_136681 ?auto_136682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136685 - BLOCK
      ?auto_136686 - BLOCK
      ?auto_136687 - BLOCK
      ?auto_136688 - BLOCK
      ?auto_136689 - BLOCK
      ?auto_136690 - BLOCK
      ?auto_136691 - BLOCK
    )
    :vars
    (
      ?auto_136692 - BLOCK
      ?auto_136693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136685 ?auto_136686 ) ) ( not ( = ?auto_136685 ?auto_136687 ) ) ( not ( = ?auto_136685 ?auto_136688 ) ) ( not ( = ?auto_136685 ?auto_136689 ) ) ( not ( = ?auto_136685 ?auto_136690 ) ) ( not ( = ?auto_136685 ?auto_136691 ) ) ( not ( = ?auto_136686 ?auto_136687 ) ) ( not ( = ?auto_136686 ?auto_136688 ) ) ( not ( = ?auto_136686 ?auto_136689 ) ) ( not ( = ?auto_136686 ?auto_136690 ) ) ( not ( = ?auto_136686 ?auto_136691 ) ) ( not ( = ?auto_136687 ?auto_136688 ) ) ( not ( = ?auto_136687 ?auto_136689 ) ) ( not ( = ?auto_136687 ?auto_136690 ) ) ( not ( = ?auto_136687 ?auto_136691 ) ) ( not ( = ?auto_136688 ?auto_136689 ) ) ( not ( = ?auto_136688 ?auto_136690 ) ) ( not ( = ?auto_136688 ?auto_136691 ) ) ( not ( = ?auto_136689 ?auto_136690 ) ) ( not ( = ?auto_136689 ?auto_136691 ) ) ( not ( = ?auto_136690 ?auto_136691 ) ) ( ON ?auto_136691 ?auto_136692 ) ( not ( = ?auto_136685 ?auto_136692 ) ) ( not ( = ?auto_136686 ?auto_136692 ) ) ( not ( = ?auto_136687 ?auto_136692 ) ) ( not ( = ?auto_136688 ?auto_136692 ) ) ( not ( = ?auto_136689 ?auto_136692 ) ) ( not ( = ?auto_136690 ?auto_136692 ) ) ( not ( = ?auto_136691 ?auto_136692 ) ) ( ON ?auto_136690 ?auto_136691 ) ( ON-TABLE ?auto_136692 ) ( ON ?auto_136689 ?auto_136690 ) ( ON ?auto_136685 ?auto_136693 ) ( not ( = ?auto_136685 ?auto_136693 ) ) ( not ( = ?auto_136686 ?auto_136693 ) ) ( not ( = ?auto_136687 ?auto_136693 ) ) ( not ( = ?auto_136688 ?auto_136693 ) ) ( not ( = ?auto_136689 ?auto_136693 ) ) ( not ( = ?auto_136690 ?auto_136693 ) ) ( not ( = ?auto_136691 ?auto_136693 ) ) ( not ( = ?auto_136692 ?auto_136693 ) ) ( ON ?auto_136686 ?auto_136685 ) ( ON-TABLE ?auto_136693 ) ( ON ?auto_136687 ?auto_136686 ) ( CLEAR ?auto_136689 ) ( ON ?auto_136688 ?auto_136687 ) ( CLEAR ?auto_136688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136693 ?auto_136685 ?auto_136686 ?auto_136687 )
      ( MAKE-7PILE ?auto_136685 ?auto_136686 ?auto_136687 ?auto_136688 ?auto_136689 ?auto_136690 ?auto_136691 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136694 - BLOCK
      ?auto_136695 - BLOCK
      ?auto_136696 - BLOCK
      ?auto_136697 - BLOCK
      ?auto_136698 - BLOCK
      ?auto_136699 - BLOCK
      ?auto_136700 - BLOCK
    )
    :vars
    (
      ?auto_136702 - BLOCK
      ?auto_136701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136694 ?auto_136695 ) ) ( not ( = ?auto_136694 ?auto_136696 ) ) ( not ( = ?auto_136694 ?auto_136697 ) ) ( not ( = ?auto_136694 ?auto_136698 ) ) ( not ( = ?auto_136694 ?auto_136699 ) ) ( not ( = ?auto_136694 ?auto_136700 ) ) ( not ( = ?auto_136695 ?auto_136696 ) ) ( not ( = ?auto_136695 ?auto_136697 ) ) ( not ( = ?auto_136695 ?auto_136698 ) ) ( not ( = ?auto_136695 ?auto_136699 ) ) ( not ( = ?auto_136695 ?auto_136700 ) ) ( not ( = ?auto_136696 ?auto_136697 ) ) ( not ( = ?auto_136696 ?auto_136698 ) ) ( not ( = ?auto_136696 ?auto_136699 ) ) ( not ( = ?auto_136696 ?auto_136700 ) ) ( not ( = ?auto_136697 ?auto_136698 ) ) ( not ( = ?auto_136697 ?auto_136699 ) ) ( not ( = ?auto_136697 ?auto_136700 ) ) ( not ( = ?auto_136698 ?auto_136699 ) ) ( not ( = ?auto_136698 ?auto_136700 ) ) ( not ( = ?auto_136699 ?auto_136700 ) ) ( ON ?auto_136700 ?auto_136702 ) ( not ( = ?auto_136694 ?auto_136702 ) ) ( not ( = ?auto_136695 ?auto_136702 ) ) ( not ( = ?auto_136696 ?auto_136702 ) ) ( not ( = ?auto_136697 ?auto_136702 ) ) ( not ( = ?auto_136698 ?auto_136702 ) ) ( not ( = ?auto_136699 ?auto_136702 ) ) ( not ( = ?auto_136700 ?auto_136702 ) ) ( ON ?auto_136699 ?auto_136700 ) ( ON-TABLE ?auto_136702 ) ( ON ?auto_136694 ?auto_136701 ) ( not ( = ?auto_136694 ?auto_136701 ) ) ( not ( = ?auto_136695 ?auto_136701 ) ) ( not ( = ?auto_136696 ?auto_136701 ) ) ( not ( = ?auto_136697 ?auto_136701 ) ) ( not ( = ?auto_136698 ?auto_136701 ) ) ( not ( = ?auto_136699 ?auto_136701 ) ) ( not ( = ?auto_136700 ?auto_136701 ) ) ( not ( = ?auto_136702 ?auto_136701 ) ) ( ON ?auto_136695 ?auto_136694 ) ( ON-TABLE ?auto_136701 ) ( ON ?auto_136696 ?auto_136695 ) ( ON ?auto_136697 ?auto_136696 ) ( CLEAR ?auto_136697 ) ( HOLDING ?auto_136698 ) ( CLEAR ?auto_136699 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136702 ?auto_136700 ?auto_136699 ?auto_136698 )
      ( MAKE-7PILE ?auto_136694 ?auto_136695 ?auto_136696 ?auto_136697 ?auto_136698 ?auto_136699 ?auto_136700 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136703 - BLOCK
      ?auto_136704 - BLOCK
      ?auto_136705 - BLOCK
      ?auto_136706 - BLOCK
      ?auto_136707 - BLOCK
      ?auto_136708 - BLOCK
      ?auto_136709 - BLOCK
    )
    :vars
    (
      ?auto_136710 - BLOCK
      ?auto_136711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136703 ?auto_136704 ) ) ( not ( = ?auto_136703 ?auto_136705 ) ) ( not ( = ?auto_136703 ?auto_136706 ) ) ( not ( = ?auto_136703 ?auto_136707 ) ) ( not ( = ?auto_136703 ?auto_136708 ) ) ( not ( = ?auto_136703 ?auto_136709 ) ) ( not ( = ?auto_136704 ?auto_136705 ) ) ( not ( = ?auto_136704 ?auto_136706 ) ) ( not ( = ?auto_136704 ?auto_136707 ) ) ( not ( = ?auto_136704 ?auto_136708 ) ) ( not ( = ?auto_136704 ?auto_136709 ) ) ( not ( = ?auto_136705 ?auto_136706 ) ) ( not ( = ?auto_136705 ?auto_136707 ) ) ( not ( = ?auto_136705 ?auto_136708 ) ) ( not ( = ?auto_136705 ?auto_136709 ) ) ( not ( = ?auto_136706 ?auto_136707 ) ) ( not ( = ?auto_136706 ?auto_136708 ) ) ( not ( = ?auto_136706 ?auto_136709 ) ) ( not ( = ?auto_136707 ?auto_136708 ) ) ( not ( = ?auto_136707 ?auto_136709 ) ) ( not ( = ?auto_136708 ?auto_136709 ) ) ( ON ?auto_136709 ?auto_136710 ) ( not ( = ?auto_136703 ?auto_136710 ) ) ( not ( = ?auto_136704 ?auto_136710 ) ) ( not ( = ?auto_136705 ?auto_136710 ) ) ( not ( = ?auto_136706 ?auto_136710 ) ) ( not ( = ?auto_136707 ?auto_136710 ) ) ( not ( = ?auto_136708 ?auto_136710 ) ) ( not ( = ?auto_136709 ?auto_136710 ) ) ( ON ?auto_136708 ?auto_136709 ) ( ON-TABLE ?auto_136710 ) ( ON ?auto_136703 ?auto_136711 ) ( not ( = ?auto_136703 ?auto_136711 ) ) ( not ( = ?auto_136704 ?auto_136711 ) ) ( not ( = ?auto_136705 ?auto_136711 ) ) ( not ( = ?auto_136706 ?auto_136711 ) ) ( not ( = ?auto_136707 ?auto_136711 ) ) ( not ( = ?auto_136708 ?auto_136711 ) ) ( not ( = ?auto_136709 ?auto_136711 ) ) ( not ( = ?auto_136710 ?auto_136711 ) ) ( ON ?auto_136704 ?auto_136703 ) ( ON-TABLE ?auto_136711 ) ( ON ?auto_136705 ?auto_136704 ) ( ON ?auto_136706 ?auto_136705 ) ( CLEAR ?auto_136708 ) ( ON ?auto_136707 ?auto_136706 ) ( CLEAR ?auto_136707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136711 ?auto_136703 ?auto_136704 ?auto_136705 ?auto_136706 )
      ( MAKE-7PILE ?auto_136703 ?auto_136704 ?auto_136705 ?auto_136706 ?auto_136707 ?auto_136708 ?auto_136709 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136712 - BLOCK
      ?auto_136713 - BLOCK
      ?auto_136714 - BLOCK
      ?auto_136715 - BLOCK
      ?auto_136716 - BLOCK
      ?auto_136717 - BLOCK
      ?auto_136718 - BLOCK
    )
    :vars
    (
      ?auto_136719 - BLOCK
      ?auto_136720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136712 ?auto_136713 ) ) ( not ( = ?auto_136712 ?auto_136714 ) ) ( not ( = ?auto_136712 ?auto_136715 ) ) ( not ( = ?auto_136712 ?auto_136716 ) ) ( not ( = ?auto_136712 ?auto_136717 ) ) ( not ( = ?auto_136712 ?auto_136718 ) ) ( not ( = ?auto_136713 ?auto_136714 ) ) ( not ( = ?auto_136713 ?auto_136715 ) ) ( not ( = ?auto_136713 ?auto_136716 ) ) ( not ( = ?auto_136713 ?auto_136717 ) ) ( not ( = ?auto_136713 ?auto_136718 ) ) ( not ( = ?auto_136714 ?auto_136715 ) ) ( not ( = ?auto_136714 ?auto_136716 ) ) ( not ( = ?auto_136714 ?auto_136717 ) ) ( not ( = ?auto_136714 ?auto_136718 ) ) ( not ( = ?auto_136715 ?auto_136716 ) ) ( not ( = ?auto_136715 ?auto_136717 ) ) ( not ( = ?auto_136715 ?auto_136718 ) ) ( not ( = ?auto_136716 ?auto_136717 ) ) ( not ( = ?auto_136716 ?auto_136718 ) ) ( not ( = ?auto_136717 ?auto_136718 ) ) ( ON ?auto_136718 ?auto_136719 ) ( not ( = ?auto_136712 ?auto_136719 ) ) ( not ( = ?auto_136713 ?auto_136719 ) ) ( not ( = ?auto_136714 ?auto_136719 ) ) ( not ( = ?auto_136715 ?auto_136719 ) ) ( not ( = ?auto_136716 ?auto_136719 ) ) ( not ( = ?auto_136717 ?auto_136719 ) ) ( not ( = ?auto_136718 ?auto_136719 ) ) ( ON-TABLE ?auto_136719 ) ( ON ?auto_136712 ?auto_136720 ) ( not ( = ?auto_136712 ?auto_136720 ) ) ( not ( = ?auto_136713 ?auto_136720 ) ) ( not ( = ?auto_136714 ?auto_136720 ) ) ( not ( = ?auto_136715 ?auto_136720 ) ) ( not ( = ?auto_136716 ?auto_136720 ) ) ( not ( = ?auto_136717 ?auto_136720 ) ) ( not ( = ?auto_136718 ?auto_136720 ) ) ( not ( = ?auto_136719 ?auto_136720 ) ) ( ON ?auto_136713 ?auto_136712 ) ( ON-TABLE ?auto_136720 ) ( ON ?auto_136714 ?auto_136713 ) ( ON ?auto_136715 ?auto_136714 ) ( ON ?auto_136716 ?auto_136715 ) ( CLEAR ?auto_136716 ) ( HOLDING ?auto_136717 ) ( CLEAR ?auto_136718 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136719 ?auto_136718 ?auto_136717 )
      ( MAKE-7PILE ?auto_136712 ?auto_136713 ?auto_136714 ?auto_136715 ?auto_136716 ?auto_136717 ?auto_136718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136721 - BLOCK
      ?auto_136722 - BLOCK
      ?auto_136723 - BLOCK
      ?auto_136724 - BLOCK
      ?auto_136725 - BLOCK
      ?auto_136726 - BLOCK
      ?auto_136727 - BLOCK
    )
    :vars
    (
      ?auto_136728 - BLOCK
      ?auto_136729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136721 ?auto_136722 ) ) ( not ( = ?auto_136721 ?auto_136723 ) ) ( not ( = ?auto_136721 ?auto_136724 ) ) ( not ( = ?auto_136721 ?auto_136725 ) ) ( not ( = ?auto_136721 ?auto_136726 ) ) ( not ( = ?auto_136721 ?auto_136727 ) ) ( not ( = ?auto_136722 ?auto_136723 ) ) ( not ( = ?auto_136722 ?auto_136724 ) ) ( not ( = ?auto_136722 ?auto_136725 ) ) ( not ( = ?auto_136722 ?auto_136726 ) ) ( not ( = ?auto_136722 ?auto_136727 ) ) ( not ( = ?auto_136723 ?auto_136724 ) ) ( not ( = ?auto_136723 ?auto_136725 ) ) ( not ( = ?auto_136723 ?auto_136726 ) ) ( not ( = ?auto_136723 ?auto_136727 ) ) ( not ( = ?auto_136724 ?auto_136725 ) ) ( not ( = ?auto_136724 ?auto_136726 ) ) ( not ( = ?auto_136724 ?auto_136727 ) ) ( not ( = ?auto_136725 ?auto_136726 ) ) ( not ( = ?auto_136725 ?auto_136727 ) ) ( not ( = ?auto_136726 ?auto_136727 ) ) ( ON ?auto_136727 ?auto_136728 ) ( not ( = ?auto_136721 ?auto_136728 ) ) ( not ( = ?auto_136722 ?auto_136728 ) ) ( not ( = ?auto_136723 ?auto_136728 ) ) ( not ( = ?auto_136724 ?auto_136728 ) ) ( not ( = ?auto_136725 ?auto_136728 ) ) ( not ( = ?auto_136726 ?auto_136728 ) ) ( not ( = ?auto_136727 ?auto_136728 ) ) ( ON-TABLE ?auto_136728 ) ( ON ?auto_136721 ?auto_136729 ) ( not ( = ?auto_136721 ?auto_136729 ) ) ( not ( = ?auto_136722 ?auto_136729 ) ) ( not ( = ?auto_136723 ?auto_136729 ) ) ( not ( = ?auto_136724 ?auto_136729 ) ) ( not ( = ?auto_136725 ?auto_136729 ) ) ( not ( = ?auto_136726 ?auto_136729 ) ) ( not ( = ?auto_136727 ?auto_136729 ) ) ( not ( = ?auto_136728 ?auto_136729 ) ) ( ON ?auto_136722 ?auto_136721 ) ( ON-TABLE ?auto_136729 ) ( ON ?auto_136723 ?auto_136722 ) ( ON ?auto_136724 ?auto_136723 ) ( ON ?auto_136725 ?auto_136724 ) ( CLEAR ?auto_136727 ) ( ON ?auto_136726 ?auto_136725 ) ( CLEAR ?auto_136726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136729 ?auto_136721 ?auto_136722 ?auto_136723 ?auto_136724 ?auto_136725 )
      ( MAKE-7PILE ?auto_136721 ?auto_136722 ?auto_136723 ?auto_136724 ?auto_136725 ?auto_136726 ?auto_136727 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136730 - BLOCK
      ?auto_136731 - BLOCK
      ?auto_136732 - BLOCK
      ?auto_136733 - BLOCK
      ?auto_136734 - BLOCK
      ?auto_136735 - BLOCK
      ?auto_136736 - BLOCK
    )
    :vars
    (
      ?auto_136738 - BLOCK
      ?auto_136737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136730 ?auto_136731 ) ) ( not ( = ?auto_136730 ?auto_136732 ) ) ( not ( = ?auto_136730 ?auto_136733 ) ) ( not ( = ?auto_136730 ?auto_136734 ) ) ( not ( = ?auto_136730 ?auto_136735 ) ) ( not ( = ?auto_136730 ?auto_136736 ) ) ( not ( = ?auto_136731 ?auto_136732 ) ) ( not ( = ?auto_136731 ?auto_136733 ) ) ( not ( = ?auto_136731 ?auto_136734 ) ) ( not ( = ?auto_136731 ?auto_136735 ) ) ( not ( = ?auto_136731 ?auto_136736 ) ) ( not ( = ?auto_136732 ?auto_136733 ) ) ( not ( = ?auto_136732 ?auto_136734 ) ) ( not ( = ?auto_136732 ?auto_136735 ) ) ( not ( = ?auto_136732 ?auto_136736 ) ) ( not ( = ?auto_136733 ?auto_136734 ) ) ( not ( = ?auto_136733 ?auto_136735 ) ) ( not ( = ?auto_136733 ?auto_136736 ) ) ( not ( = ?auto_136734 ?auto_136735 ) ) ( not ( = ?auto_136734 ?auto_136736 ) ) ( not ( = ?auto_136735 ?auto_136736 ) ) ( not ( = ?auto_136730 ?auto_136738 ) ) ( not ( = ?auto_136731 ?auto_136738 ) ) ( not ( = ?auto_136732 ?auto_136738 ) ) ( not ( = ?auto_136733 ?auto_136738 ) ) ( not ( = ?auto_136734 ?auto_136738 ) ) ( not ( = ?auto_136735 ?auto_136738 ) ) ( not ( = ?auto_136736 ?auto_136738 ) ) ( ON-TABLE ?auto_136738 ) ( ON ?auto_136730 ?auto_136737 ) ( not ( = ?auto_136730 ?auto_136737 ) ) ( not ( = ?auto_136731 ?auto_136737 ) ) ( not ( = ?auto_136732 ?auto_136737 ) ) ( not ( = ?auto_136733 ?auto_136737 ) ) ( not ( = ?auto_136734 ?auto_136737 ) ) ( not ( = ?auto_136735 ?auto_136737 ) ) ( not ( = ?auto_136736 ?auto_136737 ) ) ( not ( = ?auto_136738 ?auto_136737 ) ) ( ON ?auto_136731 ?auto_136730 ) ( ON-TABLE ?auto_136737 ) ( ON ?auto_136732 ?auto_136731 ) ( ON ?auto_136733 ?auto_136732 ) ( ON ?auto_136734 ?auto_136733 ) ( ON ?auto_136735 ?auto_136734 ) ( CLEAR ?auto_136735 ) ( HOLDING ?auto_136736 ) ( CLEAR ?auto_136738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136738 ?auto_136736 )
      ( MAKE-7PILE ?auto_136730 ?auto_136731 ?auto_136732 ?auto_136733 ?auto_136734 ?auto_136735 ?auto_136736 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136739 - BLOCK
      ?auto_136740 - BLOCK
      ?auto_136741 - BLOCK
      ?auto_136742 - BLOCK
      ?auto_136743 - BLOCK
      ?auto_136744 - BLOCK
      ?auto_136745 - BLOCK
    )
    :vars
    (
      ?auto_136747 - BLOCK
      ?auto_136746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136739 ?auto_136740 ) ) ( not ( = ?auto_136739 ?auto_136741 ) ) ( not ( = ?auto_136739 ?auto_136742 ) ) ( not ( = ?auto_136739 ?auto_136743 ) ) ( not ( = ?auto_136739 ?auto_136744 ) ) ( not ( = ?auto_136739 ?auto_136745 ) ) ( not ( = ?auto_136740 ?auto_136741 ) ) ( not ( = ?auto_136740 ?auto_136742 ) ) ( not ( = ?auto_136740 ?auto_136743 ) ) ( not ( = ?auto_136740 ?auto_136744 ) ) ( not ( = ?auto_136740 ?auto_136745 ) ) ( not ( = ?auto_136741 ?auto_136742 ) ) ( not ( = ?auto_136741 ?auto_136743 ) ) ( not ( = ?auto_136741 ?auto_136744 ) ) ( not ( = ?auto_136741 ?auto_136745 ) ) ( not ( = ?auto_136742 ?auto_136743 ) ) ( not ( = ?auto_136742 ?auto_136744 ) ) ( not ( = ?auto_136742 ?auto_136745 ) ) ( not ( = ?auto_136743 ?auto_136744 ) ) ( not ( = ?auto_136743 ?auto_136745 ) ) ( not ( = ?auto_136744 ?auto_136745 ) ) ( not ( = ?auto_136739 ?auto_136747 ) ) ( not ( = ?auto_136740 ?auto_136747 ) ) ( not ( = ?auto_136741 ?auto_136747 ) ) ( not ( = ?auto_136742 ?auto_136747 ) ) ( not ( = ?auto_136743 ?auto_136747 ) ) ( not ( = ?auto_136744 ?auto_136747 ) ) ( not ( = ?auto_136745 ?auto_136747 ) ) ( ON-TABLE ?auto_136747 ) ( ON ?auto_136739 ?auto_136746 ) ( not ( = ?auto_136739 ?auto_136746 ) ) ( not ( = ?auto_136740 ?auto_136746 ) ) ( not ( = ?auto_136741 ?auto_136746 ) ) ( not ( = ?auto_136742 ?auto_136746 ) ) ( not ( = ?auto_136743 ?auto_136746 ) ) ( not ( = ?auto_136744 ?auto_136746 ) ) ( not ( = ?auto_136745 ?auto_136746 ) ) ( not ( = ?auto_136747 ?auto_136746 ) ) ( ON ?auto_136740 ?auto_136739 ) ( ON-TABLE ?auto_136746 ) ( ON ?auto_136741 ?auto_136740 ) ( ON ?auto_136742 ?auto_136741 ) ( ON ?auto_136743 ?auto_136742 ) ( ON ?auto_136744 ?auto_136743 ) ( CLEAR ?auto_136747 ) ( ON ?auto_136745 ?auto_136744 ) ( CLEAR ?auto_136745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136746 ?auto_136739 ?auto_136740 ?auto_136741 ?auto_136742 ?auto_136743 ?auto_136744 )
      ( MAKE-7PILE ?auto_136739 ?auto_136740 ?auto_136741 ?auto_136742 ?auto_136743 ?auto_136744 ?auto_136745 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136748 - BLOCK
      ?auto_136749 - BLOCK
      ?auto_136750 - BLOCK
      ?auto_136751 - BLOCK
      ?auto_136752 - BLOCK
      ?auto_136753 - BLOCK
      ?auto_136754 - BLOCK
    )
    :vars
    (
      ?auto_136756 - BLOCK
      ?auto_136755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136748 ?auto_136749 ) ) ( not ( = ?auto_136748 ?auto_136750 ) ) ( not ( = ?auto_136748 ?auto_136751 ) ) ( not ( = ?auto_136748 ?auto_136752 ) ) ( not ( = ?auto_136748 ?auto_136753 ) ) ( not ( = ?auto_136748 ?auto_136754 ) ) ( not ( = ?auto_136749 ?auto_136750 ) ) ( not ( = ?auto_136749 ?auto_136751 ) ) ( not ( = ?auto_136749 ?auto_136752 ) ) ( not ( = ?auto_136749 ?auto_136753 ) ) ( not ( = ?auto_136749 ?auto_136754 ) ) ( not ( = ?auto_136750 ?auto_136751 ) ) ( not ( = ?auto_136750 ?auto_136752 ) ) ( not ( = ?auto_136750 ?auto_136753 ) ) ( not ( = ?auto_136750 ?auto_136754 ) ) ( not ( = ?auto_136751 ?auto_136752 ) ) ( not ( = ?auto_136751 ?auto_136753 ) ) ( not ( = ?auto_136751 ?auto_136754 ) ) ( not ( = ?auto_136752 ?auto_136753 ) ) ( not ( = ?auto_136752 ?auto_136754 ) ) ( not ( = ?auto_136753 ?auto_136754 ) ) ( not ( = ?auto_136748 ?auto_136756 ) ) ( not ( = ?auto_136749 ?auto_136756 ) ) ( not ( = ?auto_136750 ?auto_136756 ) ) ( not ( = ?auto_136751 ?auto_136756 ) ) ( not ( = ?auto_136752 ?auto_136756 ) ) ( not ( = ?auto_136753 ?auto_136756 ) ) ( not ( = ?auto_136754 ?auto_136756 ) ) ( ON ?auto_136748 ?auto_136755 ) ( not ( = ?auto_136748 ?auto_136755 ) ) ( not ( = ?auto_136749 ?auto_136755 ) ) ( not ( = ?auto_136750 ?auto_136755 ) ) ( not ( = ?auto_136751 ?auto_136755 ) ) ( not ( = ?auto_136752 ?auto_136755 ) ) ( not ( = ?auto_136753 ?auto_136755 ) ) ( not ( = ?auto_136754 ?auto_136755 ) ) ( not ( = ?auto_136756 ?auto_136755 ) ) ( ON ?auto_136749 ?auto_136748 ) ( ON-TABLE ?auto_136755 ) ( ON ?auto_136750 ?auto_136749 ) ( ON ?auto_136751 ?auto_136750 ) ( ON ?auto_136752 ?auto_136751 ) ( ON ?auto_136753 ?auto_136752 ) ( ON ?auto_136754 ?auto_136753 ) ( CLEAR ?auto_136754 ) ( HOLDING ?auto_136756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136756 )
      ( MAKE-7PILE ?auto_136748 ?auto_136749 ?auto_136750 ?auto_136751 ?auto_136752 ?auto_136753 ?auto_136754 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_136757 - BLOCK
      ?auto_136758 - BLOCK
      ?auto_136759 - BLOCK
      ?auto_136760 - BLOCK
      ?auto_136761 - BLOCK
      ?auto_136762 - BLOCK
      ?auto_136763 - BLOCK
    )
    :vars
    (
      ?auto_136765 - BLOCK
      ?auto_136764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136757 ?auto_136758 ) ) ( not ( = ?auto_136757 ?auto_136759 ) ) ( not ( = ?auto_136757 ?auto_136760 ) ) ( not ( = ?auto_136757 ?auto_136761 ) ) ( not ( = ?auto_136757 ?auto_136762 ) ) ( not ( = ?auto_136757 ?auto_136763 ) ) ( not ( = ?auto_136758 ?auto_136759 ) ) ( not ( = ?auto_136758 ?auto_136760 ) ) ( not ( = ?auto_136758 ?auto_136761 ) ) ( not ( = ?auto_136758 ?auto_136762 ) ) ( not ( = ?auto_136758 ?auto_136763 ) ) ( not ( = ?auto_136759 ?auto_136760 ) ) ( not ( = ?auto_136759 ?auto_136761 ) ) ( not ( = ?auto_136759 ?auto_136762 ) ) ( not ( = ?auto_136759 ?auto_136763 ) ) ( not ( = ?auto_136760 ?auto_136761 ) ) ( not ( = ?auto_136760 ?auto_136762 ) ) ( not ( = ?auto_136760 ?auto_136763 ) ) ( not ( = ?auto_136761 ?auto_136762 ) ) ( not ( = ?auto_136761 ?auto_136763 ) ) ( not ( = ?auto_136762 ?auto_136763 ) ) ( not ( = ?auto_136757 ?auto_136765 ) ) ( not ( = ?auto_136758 ?auto_136765 ) ) ( not ( = ?auto_136759 ?auto_136765 ) ) ( not ( = ?auto_136760 ?auto_136765 ) ) ( not ( = ?auto_136761 ?auto_136765 ) ) ( not ( = ?auto_136762 ?auto_136765 ) ) ( not ( = ?auto_136763 ?auto_136765 ) ) ( ON ?auto_136757 ?auto_136764 ) ( not ( = ?auto_136757 ?auto_136764 ) ) ( not ( = ?auto_136758 ?auto_136764 ) ) ( not ( = ?auto_136759 ?auto_136764 ) ) ( not ( = ?auto_136760 ?auto_136764 ) ) ( not ( = ?auto_136761 ?auto_136764 ) ) ( not ( = ?auto_136762 ?auto_136764 ) ) ( not ( = ?auto_136763 ?auto_136764 ) ) ( not ( = ?auto_136765 ?auto_136764 ) ) ( ON ?auto_136758 ?auto_136757 ) ( ON-TABLE ?auto_136764 ) ( ON ?auto_136759 ?auto_136758 ) ( ON ?auto_136760 ?auto_136759 ) ( ON ?auto_136761 ?auto_136760 ) ( ON ?auto_136762 ?auto_136761 ) ( ON ?auto_136763 ?auto_136762 ) ( ON ?auto_136765 ?auto_136763 ) ( CLEAR ?auto_136765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136764 ?auto_136757 ?auto_136758 ?auto_136759 ?auto_136760 ?auto_136761 ?auto_136762 ?auto_136763 )
      ( MAKE-7PILE ?auto_136757 ?auto_136758 ?auto_136759 ?auto_136760 ?auto_136761 ?auto_136762 ?auto_136763 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136774 - BLOCK
      ?auto_136775 - BLOCK
      ?auto_136776 - BLOCK
      ?auto_136777 - BLOCK
      ?auto_136778 - BLOCK
      ?auto_136779 - BLOCK
      ?auto_136780 - BLOCK
      ?auto_136781 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_136781 ) ( CLEAR ?auto_136780 ) ( ON-TABLE ?auto_136774 ) ( ON ?auto_136775 ?auto_136774 ) ( ON ?auto_136776 ?auto_136775 ) ( ON ?auto_136777 ?auto_136776 ) ( ON ?auto_136778 ?auto_136777 ) ( ON ?auto_136779 ?auto_136778 ) ( ON ?auto_136780 ?auto_136779 ) ( not ( = ?auto_136774 ?auto_136775 ) ) ( not ( = ?auto_136774 ?auto_136776 ) ) ( not ( = ?auto_136774 ?auto_136777 ) ) ( not ( = ?auto_136774 ?auto_136778 ) ) ( not ( = ?auto_136774 ?auto_136779 ) ) ( not ( = ?auto_136774 ?auto_136780 ) ) ( not ( = ?auto_136774 ?auto_136781 ) ) ( not ( = ?auto_136775 ?auto_136776 ) ) ( not ( = ?auto_136775 ?auto_136777 ) ) ( not ( = ?auto_136775 ?auto_136778 ) ) ( not ( = ?auto_136775 ?auto_136779 ) ) ( not ( = ?auto_136775 ?auto_136780 ) ) ( not ( = ?auto_136775 ?auto_136781 ) ) ( not ( = ?auto_136776 ?auto_136777 ) ) ( not ( = ?auto_136776 ?auto_136778 ) ) ( not ( = ?auto_136776 ?auto_136779 ) ) ( not ( = ?auto_136776 ?auto_136780 ) ) ( not ( = ?auto_136776 ?auto_136781 ) ) ( not ( = ?auto_136777 ?auto_136778 ) ) ( not ( = ?auto_136777 ?auto_136779 ) ) ( not ( = ?auto_136777 ?auto_136780 ) ) ( not ( = ?auto_136777 ?auto_136781 ) ) ( not ( = ?auto_136778 ?auto_136779 ) ) ( not ( = ?auto_136778 ?auto_136780 ) ) ( not ( = ?auto_136778 ?auto_136781 ) ) ( not ( = ?auto_136779 ?auto_136780 ) ) ( not ( = ?auto_136779 ?auto_136781 ) ) ( not ( = ?auto_136780 ?auto_136781 ) ) )
    :subtasks
    ( ( !STACK ?auto_136781 ?auto_136780 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136782 - BLOCK
      ?auto_136783 - BLOCK
      ?auto_136784 - BLOCK
      ?auto_136785 - BLOCK
      ?auto_136786 - BLOCK
      ?auto_136787 - BLOCK
      ?auto_136788 - BLOCK
      ?auto_136789 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136788 ) ( ON-TABLE ?auto_136782 ) ( ON ?auto_136783 ?auto_136782 ) ( ON ?auto_136784 ?auto_136783 ) ( ON ?auto_136785 ?auto_136784 ) ( ON ?auto_136786 ?auto_136785 ) ( ON ?auto_136787 ?auto_136786 ) ( ON ?auto_136788 ?auto_136787 ) ( not ( = ?auto_136782 ?auto_136783 ) ) ( not ( = ?auto_136782 ?auto_136784 ) ) ( not ( = ?auto_136782 ?auto_136785 ) ) ( not ( = ?auto_136782 ?auto_136786 ) ) ( not ( = ?auto_136782 ?auto_136787 ) ) ( not ( = ?auto_136782 ?auto_136788 ) ) ( not ( = ?auto_136782 ?auto_136789 ) ) ( not ( = ?auto_136783 ?auto_136784 ) ) ( not ( = ?auto_136783 ?auto_136785 ) ) ( not ( = ?auto_136783 ?auto_136786 ) ) ( not ( = ?auto_136783 ?auto_136787 ) ) ( not ( = ?auto_136783 ?auto_136788 ) ) ( not ( = ?auto_136783 ?auto_136789 ) ) ( not ( = ?auto_136784 ?auto_136785 ) ) ( not ( = ?auto_136784 ?auto_136786 ) ) ( not ( = ?auto_136784 ?auto_136787 ) ) ( not ( = ?auto_136784 ?auto_136788 ) ) ( not ( = ?auto_136784 ?auto_136789 ) ) ( not ( = ?auto_136785 ?auto_136786 ) ) ( not ( = ?auto_136785 ?auto_136787 ) ) ( not ( = ?auto_136785 ?auto_136788 ) ) ( not ( = ?auto_136785 ?auto_136789 ) ) ( not ( = ?auto_136786 ?auto_136787 ) ) ( not ( = ?auto_136786 ?auto_136788 ) ) ( not ( = ?auto_136786 ?auto_136789 ) ) ( not ( = ?auto_136787 ?auto_136788 ) ) ( not ( = ?auto_136787 ?auto_136789 ) ) ( not ( = ?auto_136788 ?auto_136789 ) ) ( ON-TABLE ?auto_136789 ) ( CLEAR ?auto_136789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_136789 )
      ( MAKE-8PILE ?auto_136782 ?auto_136783 ?auto_136784 ?auto_136785 ?auto_136786 ?auto_136787 ?auto_136788 ?auto_136789 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136790 - BLOCK
      ?auto_136791 - BLOCK
      ?auto_136792 - BLOCK
      ?auto_136793 - BLOCK
      ?auto_136794 - BLOCK
      ?auto_136795 - BLOCK
      ?auto_136796 - BLOCK
      ?auto_136797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136790 ) ( ON ?auto_136791 ?auto_136790 ) ( ON ?auto_136792 ?auto_136791 ) ( ON ?auto_136793 ?auto_136792 ) ( ON ?auto_136794 ?auto_136793 ) ( ON ?auto_136795 ?auto_136794 ) ( not ( = ?auto_136790 ?auto_136791 ) ) ( not ( = ?auto_136790 ?auto_136792 ) ) ( not ( = ?auto_136790 ?auto_136793 ) ) ( not ( = ?auto_136790 ?auto_136794 ) ) ( not ( = ?auto_136790 ?auto_136795 ) ) ( not ( = ?auto_136790 ?auto_136796 ) ) ( not ( = ?auto_136790 ?auto_136797 ) ) ( not ( = ?auto_136791 ?auto_136792 ) ) ( not ( = ?auto_136791 ?auto_136793 ) ) ( not ( = ?auto_136791 ?auto_136794 ) ) ( not ( = ?auto_136791 ?auto_136795 ) ) ( not ( = ?auto_136791 ?auto_136796 ) ) ( not ( = ?auto_136791 ?auto_136797 ) ) ( not ( = ?auto_136792 ?auto_136793 ) ) ( not ( = ?auto_136792 ?auto_136794 ) ) ( not ( = ?auto_136792 ?auto_136795 ) ) ( not ( = ?auto_136792 ?auto_136796 ) ) ( not ( = ?auto_136792 ?auto_136797 ) ) ( not ( = ?auto_136793 ?auto_136794 ) ) ( not ( = ?auto_136793 ?auto_136795 ) ) ( not ( = ?auto_136793 ?auto_136796 ) ) ( not ( = ?auto_136793 ?auto_136797 ) ) ( not ( = ?auto_136794 ?auto_136795 ) ) ( not ( = ?auto_136794 ?auto_136796 ) ) ( not ( = ?auto_136794 ?auto_136797 ) ) ( not ( = ?auto_136795 ?auto_136796 ) ) ( not ( = ?auto_136795 ?auto_136797 ) ) ( not ( = ?auto_136796 ?auto_136797 ) ) ( ON-TABLE ?auto_136797 ) ( CLEAR ?auto_136797 ) ( HOLDING ?auto_136796 ) ( CLEAR ?auto_136795 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136790 ?auto_136791 ?auto_136792 ?auto_136793 ?auto_136794 ?auto_136795 ?auto_136796 )
      ( MAKE-8PILE ?auto_136790 ?auto_136791 ?auto_136792 ?auto_136793 ?auto_136794 ?auto_136795 ?auto_136796 ?auto_136797 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136798 - BLOCK
      ?auto_136799 - BLOCK
      ?auto_136800 - BLOCK
      ?auto_136801 - BLOCK
      ?auto_136802 - BLOCK
      ?auto_136803 - BLOCK
      ?auto_136804 - BLOCK
      ?auto_136805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136798 ) ( ON ?auto_136799 ?auto_136798 ) ( ON ?auto_136800 ?auto_136799 ) ( ON ?auto_136801 ?auto_136800 ) ( ON ?auto_136802 ?auto_136801 ) ( ON ?auto_136803 ?auto_136802 ) ( not ( = ?auto_136798 ?auto_136799 ) ) ( not ( = ?auto_136798 ?auto_136800 ) ) ( not ( = ?auto_136798 ?auto_136801 ) ) ( not ( = ?auto_136798 ?auto_136802 ) ) ( not ( = ?auto_136798 ?auto_136803 ) ) ( not ( = ?auto_136798 ?auto_136804 ) ) ( not ( = ?auto_136798 ?auto_136805 ) ) ( not ( = ?auto_136799 ?auto_136800 ) ) ( not ( = ?auto_136799 ?auto_136801 ) ) ( not ( = ?auto_136799 ?auto_136802 ) ) ( not ( = ?auto_136799 ?auto_136803 ) ) ( not ( = ?auto_136799 ?auto_136804 ) ) ( not ( = ?auto_136799 ?auto_136805 ) ) ( not ( = ?auto_136800 ?auto_136801 ) ) ( not ( = ?auto_136800 ?auto_136802 ) ) ( not ( = ?auto_136800 ?auto_136803 ) ) ( not ( = ?auto_136800 ?auto_136804 ) ) ( not ( = ?auto_136800 ?auto_136805 ) ) ( not ( = ?auto_136801 ?auto_136802 ) ) ( not ( = ?auto_136801 ?auto_136803 ) ) ( not ( = ?auto_136801 ?auto_136804 ) ) ( not ( = ?auto_136801 ?auto_136805 ) ) ( not ( = ?auto_136802 ?auto_136803 ) ) ( not ( = ?auto_136802 ?auto_136804 ) ) ( not ( = ?auto_136802 ?auto_136805 ) ) ( not ( = ?auto_136803 ?auto_136804 ) ) ( not ( = ?auto_136803 ?auto_136805 ) ) ( not ( = ?auto_136804 ?auto_136805 ) ) ( ON-TABLE ?auto_136805 ) ( CLEAR ?auto_136803 ) ( ON ?auto_136804 ?auto_136805 ) ( CLEAR ?auto_136804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136805 )
      ( MAKE-8PILE ?auto_136798 ?auto_136799 ?auto_136800 ?auto_136801 ?auto_136802 ?auto_136803 ?auto_136804 ?auto_136805 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136806 - BLOCK
      ?auto_136807 - BLOCK
      ?auto_136808 - BLOCK
      ?auto_136809 - BLOCK
      ?auto_136810 - BLOCK
      ?auto_136811 - BLOCK
      ?auto_136812 - BLOCK
      ?auto_136813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136806 ) ( ON ?auto_136807 ?auto_136806 ) ( ON ?auto_136808 ?auto_136807 ) ( ON ?auto_136809 ?auto_136808 ) ( ON ?auto_136810 ?auto_136809 ) ( not ( = ?auto_136806 ?auto_136807 ) ) ( not ( = ?auto_136806 ?auto_136808 ) ) ( not ( = ?auto_136806 ?auto_136809 ) ) ( not ( = ?auto_136806 ?auto_136810 ) ) ( not ( = ?auto_136806 ?auto_136811 ) ) ( not ( = ?auto_136806 ?auto_136812 ) ) ( not ( = ?auto_136806 ?auto_136813 ) ) ( not ( = ?auto_136807 ?auto_136808 ) ) ( not ( = ?auto_136807 ?auto_136809 ) ) ( not ( = ?auto_136807 ?auto_136810 ) ) ( not ( = ?auto_136807 ?auto_136811 ) ) ( not ( = ?auto_136807 ?auto_136812 ) ) ( not ( = ?auto_136807 ?auto_136813 ) ) ( not ( = ?auto_136808 ?auto_136809 ) ) ( not ( = ?auto_136808 ?auto_136810 ) ) ( not ( = ?auto_136808 ?auto_136811 ) ) ( not ( = ?auto_136808 ?auto_136812 ) ) ( not ( = ?auto_136808 ?auto_136813 ) ) ( not ( = ?auto_136809 ?auto_136810 ) ) ( not ( = ?auto_136809 ?auto_136811 ) ) ( not ( = ?auto_136809 ?auto_136812 ) ) ( not ( = ?auto_136809 ?auto_136813 ) ) ( not ( = ?auto_136810 ?auto_136811 ) ) ( not ( = ?auto_136810 ?auto_136812 ) ) ( not ( = ?auto_136810 ?auto_136813 ) ) ( not ( = ?auto_136811 ?auto_136812 ) ) ( not ( = ?auto_136811 ?auto_136813 ) ) ( not ( = ?auto_136812 ?auto_136813 ) ) ( ON-TABLE ?auto_136813 ) ( ON ?auto_136812 ?auto_136813 ) ( CLEAR ?auto_136812 ) ( HOLDING ?auto_136811 ) ( CLEAR ?auto_136810 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136806 ?auto_136807 ?auto_136808 ?auto_136809 ?auto_136810 ?auto_136811 )
      ( MAKE-8PILE ?auto_136806 ?auto_136807 ?auto_136808 ?auto_136809 ?auto_136810 ?auto_136811 ?auto_136812 ?auto_136813 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136814 - BLOCK
      ?auto_136815 - BLOCK
      ?auto_136816 - BLOCK
      ?auto_136817 - BLOCK
      ?auto_136818 - BLOCK
      ?auto_136819 - BLOCK
      ?auto_136820 - BLOCK
      ?auto_136821 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136814 ) ( ON ?auto_136815 ?auto_136814 ) ( ON ?auto_136816 ?auto_136815 ) ( ON ?auto_136817 ?auto_136816 ) ( ON ?auto_136818 ?auto_136817 ) ( not ( = ?auto_136814 ?auto_136815 ) ) ( not ( = ?auto_136814 ?auto_136816 ) ) ( not ( = ?auto_136814 ?auto_136817 ) ) ( not ( = ?auto_136814 ?auto_136818 ) ) ( not ( = ?auto_136814 ?auto_136819 ) ) ( not ( = ?auto_136814 ?auto_136820 ) ) ( not ( = ?auto_136814 ?auto_136821 ) ) ( not ( = ?auto_136815 ?auto_136816 ) ) ( not ( = ?auto_136815 ?auto_136817 ) ) ( not ( = ?auto_136815 ?auto_136818 ) ) ( not ( = ?auto_136815 ?auto_136819 ) ) ( not ( = ?auto_136815 ?auto_136820 ) ) ( not ( = ?auto_136815 ?auto_136821 ) ) ( not ( = ?auto_136816 ?auto_136817 ) ) ( not ( = ?auto_136816 ?auto_136818 ) ) ( not ( = ?auto_136816 ?auto_136819 ) ) ( not ( = ?auto_136816 ?auto_136820 ) ) ( not ( = ?auto_136816 ?auto_136821 ) ) ( not ( = ?auto_136817 ?auto_136818 ) ) ( not ( = ?auto_136817 ?auto_136819 ) ) ( not ( = ?auto_136817 ?auto_136820 ) ) ( not ( = ?auto_136817 ?auto_136821 ) ) ( not ( = ?auto_136818 ?auto_136819 ) ) ( not ( = ?auto_136818 ?auto_136820 ) ) ( not ( = ?auto_136818 ?auto_136821 ) ) ( not ( = ?auto_136819 ?auto_136820 ) ) ( not ( = ?auto_136819 ?auto_136821 ) ) ( not ( = ?auto_136820 ?auto_136821 ) ) ( ON-TABLE ?auto_136821 ) ( ON ?auto_136820 ?auto_136821 ) ( CLEAR ?auto_136818 ) ( ON ?auto_136819 ?auto_136820 ) ( CLEAR ?auto_136819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136821 ?auto_136820 )
      ( MAKE-8PILE ?auto_136814 ?auto_136815 ?auto_136816 ?auto_136817 ?auto_136818 ?auto_136819 ?auto_136820 ?auto_136821 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136822 - BLOCK
      ?auto_136823 - BLOCK
      ?auto_136824 - BLOCK
      ?auto_136825 - BLOCK
      ?auto_136826 - BLOCK
      ?auto_136827 - BLOCK
      ?auto_136828 - BLOCK
      ?auto_136829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136822 ) ( ON ?auto_136823 ?auto_136822 ) ( ON ?auto_136824 ?auto_136823 ) ( ON ?auto_136825 ?auto_136824 ) ( not ( = ?auto_136822 ?auto_136823 ) ) ( not ( = ?auto_136822 ?auto_136824 ) ) ( not ( = ?auto_136822 ?auto_136825 ) ) ( not ( = ?auto_136822 ?auto_136826 ) ) ( not ( = ?auto_136822 ?auto_136827 ) ) ( not ( = ?auto_136822 ?auto_136828 ) ) ( not ( = ?auto_136822 ?auto_136829 ) ) ( not ( = ?auto_136823 ?auto_136824 ) ) ( not ( = ?auto_136823 ?auto_136825 ) ) ( not ( = ?auto_136823 ?auto_136826 ) ) ( not ( = ?auto_136823 ?auto_136827 ) ) ( not ( = ?auto_136823 ?auto_136828 ) ) ( not ( = ?auto_136823 ?auto_136829 ) ) ( not ( = ?auto_136824 ?auto_136825 ) ) ( not ( = ?auto_136824 ?auto_136826 ) ) ( not ( = ?auto_136824 ?auto_136827 ) ) ( not ( = ?auto_136824 ?auto_136828 ) ) ( not ( = ?auto_136824 ?auto_136829 ) ) ( not ( = ?auto_136825 ?auto_136826 ) ) ( not ( = ?auto_136825 ?auto_136827 ) ) ( not ( = ?auto_136825 ?auto_136828 ) ) ( not ( = ?auto_136825 ?auto_136829 ) ) ( not ( = ?auto_136826 ?auto_136827 ) ) ( not ( = ?auto_136826 ?auto_136828 ) ) ( not ( = ?auto_136826 ?auto_136829 ) ) ( not ( = ?auto_136827 ?auto_136828 ) ) ( not ( = ?auto_136827 ?auto_136829 ) ) ( not ( = ?auto_136828 ?auto_136829 ) ) ( ON-TABLE ?auto_136829 ) ( ON ?auto_136828 ?auto_136829 ) ( ON ?auto_136827 ?auto_136828 ) ( CLEAR ?auto_136827 ) ( HOLDING ?auto_136826 ) ( CLEAR ?auto_136825 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136822 ?auto_136823 ?auto_136824 ?auto_136825 ?auto_136826 )
      ( MAKE-8PILE ?auto_136822 ?auto_136823 ?auto_136824 ?auto_136825 ?auto_136826 ?auto_136827 ?auto_136828 ?auto_136829 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136830 - BLOCK
      ?auto_136831 - BLOCK
      ?auto_136832 - BLOCK
      ?auto_136833 - BLOCK
      ?auto_136834 - BLOCK
      ?auto_136835 - BLOCK
      ?auto_136836 - BLOCK
      ?auto_136837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136830 ) ( ON ?auto_136831 ?auto_136830 ) ( ON ?auto_136832 ?auto_136831 ) ( ON ?auto_136833 ?auto_136832 ) ( not ( = ?auto_136830 ?auto_136831 ) ) ( not ( = ?auto_136830 ?auto_136832 ) ) ( not ( = ?auto_136830 ?auto_136833 ) ) ( not ( = ?auto_136830 ?auto_136834 ) ) ( not ( = ?auto_136830 ?auto_136835 ) ) ( not ( = ?auto_136830 ?auto_136836 ) ) ( not ( = ?auto_136830 ?auto_136837 ) ) ( not ( = ?auto_136831 ?auto_136832 ) ) ( not ( = ?auto_136831 ?auto_136833 ) ) ( not ( = ?auto_136831 ?auto_136834 ) ) ( not ( = ?auto_136831 ?auto_136835 ) ) ( not ( = ?auto_136831 ?auto_136836 ) ) ( not ( = ?auto_136831 ?auto_136837 ) ) ( not ( = ?auto_136832 ?auto_136833 ) ) ( not ( = ?auto_136832 ?auto_136834 ) ) ( not ( = ?auto_136832 ?auto_136835 ) ) ( not ( = ?auto_136832 ?auto_136836 ) ) ( not ( = ?auto_136832 ?auto_136837 ) ) ( not ( = ?auto_136833 ?auto_136834 ) ) ( not ( = ?auto_136833 ?auto_136835 ) ) ( not ( = ?auto_136833 ?auto_136836 ) ) ( not ( = ?auto_136833 ?auto_136837 ) ) ( not ( = ?auto_136834 ?auto_136835 ) ) ( not ( = ?auto_136834 ?auto_136836 ) ) ( not ( = ?auto_136834 ?auto_136837 ) ) ( not ( = ?auto_136835 ?auto_136836 ) ) ( not ( = ?auto_136835 ?auto_136837 ) ) ( not ( = ?auto_136836 ?auto_136837 ) ) ( ON-TABLE ?auto_136837 ) ( ON ?auto_136836 ?auto_136837 ) ( ON ?auto_136835 ?auto_136836 ) ( CLEAR ?auto_136833 ) ( ON ?auto_136834 ?auto_136835 ) ( CLEAR ?auto_136834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136837 ?auto_136836 ?auto_136835 )
      ( MAKE-8PILE ?auto_136830 ?auto_136831 ?auto_136832 ?auto_136833 ?auto_136834 ?auto_136835 ?auto_136836 ?auto_136837 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136838 - BLOCK
      ?auto_136839 - BLOCK
      ?auto_136840 - BLOCK
      ?auto_136841 - BLOCK
      ?auto_136842 - BLOCK
      ?auto_136843 - BLOCK
      ?auto_136844 - BLOCK
      ?auto_136845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136838 ) ( ON ?auto_136839 ?auto_136838 ) ( ON ?auto_136840 ?auto_136839 ) ( not ( = ?auto_136838 ?auto_136839 ) ) ( not ( = ?auto_136838 ?auto_136840 ) ) ( not ( = ?auto_136838 ?auto_136841 ) ) ( not ( = ?auto_136838 ?auto_136842 ) ) ( not ( = ?auto_136838 ?auto_136843 ) ) ( not ( = ?auto_136838 ?auto_136844 ) ) ( not ( = ?auto_136838 ?auto_136845 ) ) ( not ( = ?auto_136839 ?auto_136840 ) ) ( not ( = ?auto_136839 ?auto_136841 ) ) ( not ( = ?auto_136839 ?auto_136842 ) ) ( not ( = ?auto_136839 ?auto_136843 ) ) ( not ( = ?auto_136839 ?auto_136844 ) ) ( not ( = ?auto_136839 ?auto_136845 ) ) ( not ( = ?auto_136840 ?auto_136841 ) ) ( not ( = ?auto_136840 ?auto_136842 ) ) ( not ( = ?auto_136840 ?auto_136843 ) ) ( not ( = ?auto_136840 ?auto_136844 ) ) ( not ( = ?auto_136840 ?auto_136845 ) ) ( not ( = ?auto_136841 ?auto_136842 ) ) ( not ( = ?auto_136841 ?auto_136843 ) ) ( not ( = ?auto_136841 ?auto_136844 ) ) ( not ( = ?auto_136841 ?auto_136845 ) ) ( not ( = ?auto_136842 ?auto_136843 ) ) ( not ( = ?auto_136842 ?auto_136844 ) ) ( not ( = ?auto_136842 ?auto_136845 ) ) ( not ( = ?auto_136843 ?auto_136844 ) ) ( not ( = ?auto_136843 ?auto_136845 ) ) ( not ( = ?auto_136844 ?auto_136845 ) ) ( ON-TABLE ?auto_136845 ) ( ON ?auto_136844 ?auto_136845 ) ( ON ?auto_136843 ?auto_136844 ) ( ON ?auto_136842 ?auto_136843 ) ( CLEAR ?auto_136842 ) ( HOLDING ?auto_136841 ) ( CLEAR ?auto_136840 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136838 ?auto_136839 ?auto_136840 ?auto_136841 )
      ( MAKE-8PILE ?auto_136838 ?auto_136839 ?auto_136840 ?auto_136841 ?auto_136842 ?auto_136843 ?auto_136844 ?auto_136845 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136846 - BLOCK
      ?auto_136847 - BLOCK
      ?auto_136848 - BLOCK
      ?auto_136849 - BLOCK
      ?auto_136850 - BLOCK
      ?auto_136851 - BLOCK
      ?auto_136852 - BLOCK
      ?auto_136853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136846 ) ( ON ?auto_136847 ?auto_136846 ) ( ON ?auto_136848 ?auto_136847 ) ( not ( = ?auto_136846 ?auto_136847 ) ) ( not ( = ?auto_136846 ?auto_136848 ) ) ( not ( = ?auto_136846 ?auto_136849 ) ) ( not ( = ?auto_136846 ?auto_136850 ) ) ( not ( = ?auto_136846 ?auto_136851 ) ) ( not ( = ?auto_136846 ?auto_136852 ) ) ( not ( = ?auto_136846 ?auto_136853 ) ) ( not ( = ?auto_136847 ?auto_136848 ) ) ( not ( = ?auto_136847 ?auto_136849 ) ) ( not ( = ?auto_136847 ?auto_136850 ) ) ( not ( = ?auto_136847 ?auto_136851 ) ) ( not ( = ?auto_136847 ?auto_136852 ) ) ( not ( = ?auto_136847 ?auto_136853 ) ) ( not ( = ?auto_136848 ?auto_136849 ) ) ( not ( = ?auto_136848 ?auto_136850 ) ) ( not ( = ?auto_136848 ?auto_136851 ) ) ( not ( = ?auto_136848 ?auto_136852 ) ) ( not ( = ?auto_136848 ?auto_136853 ) ) ( not ( = ?auto_136849 ?auto_136850 ) ) ( not ( = ?auto_136849 ?auto_136851 ) ) ( not ( = ?auto_136849 ?auto_136852 ) ) ( not ( = ?auto_136849 ?auto_136853 ) ) ( not ( = ?auto_136850 ?auto_136851 ) ) ( not ( = ?auto_136850 ?auto_136852 ) ) ( not ( = ?auto_136850 ?auto_136853 ) ) ( not ( = ?auto_136851 ?auto_136852 ) ) ( not ( = ?auto_136851 ?auto_136853 ) ) ( not ( = ?auto_136852 ?auto_136853 ) ) ( ON-TABLE ?auto_136853 ) ( ON ?auto_136852 ?auto_136853 ) ( ON ?auto_136851 ?auto_136852 ) ( ON ?auto_136850 ?auto_136851 ) ( CLEAR ?auto_136848 ) ( ON ?auto_136849 ?auto_136850 ) ( CLEAR ?auto_136849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136853 ?auto_136852 ?auto_136851 ?auto_136850 )
      ( MAKE-8PILE ?auto_136846 ?auto_136847 ?auto_136848 ?auto_136849 ?auto_136850 ?auto_136851 ?auto_136852 ?auto_136853 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136854 - BLOCK
      ?auto_136855 - BLOCK
      ?auto_136856 - BLOCK
      ?auto_136857 - BLOCK
      ?auto_136858 - BLOCK
      ?auto_136859 - BLOCK
      ?auto_136860 - BLOCK
      ?auto_136861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136854 ) ( ON ?auto_136855 ?auto_136854 ) ( not ( = ?auto_136854 ?auto_136855 ) ) ( not ( = ?auto_136854 ?auto_136856 ) ) ( not ( = ?auto_136854 ?auto_136857 ) ) ( not ( = ?auto_136854 ?auto_136858 ) ) ( not ( = ?auto_136854 ?auto_136859 ) ) ( not ( = ?auto_136854 ?auto_136860 ) ) ( not ( = ?auto_136854 ?auto_136861 ) ) ( not ( = ?auto_136855 ?auto_136856 ) ) ( not ( = ?auto_136855 ?auto_136857 ) ) ( not ( = ?auto_136855 ?auto_136858 ) ) ( not ( = ?auto_136855 ?auto_136859 ) ) ( not ( = ?auto_136855 ?auto_136860 ) ) ( not ( = ?auto_136855 ?auto_136861 ) ) ( not ( = ?auto_136856 ?auto_136857 ) ) ( not ( = ?auto_136856 ?auto_136858 ) ) ( not ( = ?auto_136856 ?auto_136859 ) ) ( not ( = ?auto_136856 ?auto_136860 ) ) ( not ( = ?auto_136856 ?auto_136861 ) ) ( not ( = ?auto_136857 ?auto_136858 ) ) ( not ( = ?auto_136857 ?auto_136859 ) ) ( not ( = ?auto_136857 ?auto_136860 ) ) ( not ( = ?auto_136857 ?auto_136861 ) ) ( not ( = ?auto_136858 ?auto_136859 ) ) ( not ( = ?auto_136858 ?auto_136860 ) ) ( not ( = ?auto_136858 ?auto_136861 ) ) ( not ( = ?auto_136859 ?auto_136860 ) ) ( not ( = ?auto_136859 ?auto_136861 ) ) ( not ( = ?auto_136860 ?auto_136861 ) ) ( ON-TABLE ?auto_136861 ) ( ON ?auto_136860 ?auto_136861 ) ( ON ?auto_136859 ?auto_136860 ) ( ON ?auto_136858 ?auto_136859 ) ( ON ?auto_136857 ?auto_136858 ) ( CLEAR ?auto_136857 ) ( HOLDING ?auto_136856 ) ( CLEAR ?auto_136855 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136854 ?auto_136855 ?auto_136856 )
      ( MAKE-8PILE ?auto_136854 ?auto_136855 ?auto_136856 ?auto_136857 ?auto_136858 ?auto_136859 ?auto_136860 ?auto_136861 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136862 - BLOCK
      ?auto_136863 - BLOCK
      ?auto_136864 - BLOCK
      ?auto_136865 - BLOCK
      ?auto_136866 - BLOCK
      ?auto_136867 - BLOCK
      ?auto_136868 - BLOCK
      ?auto_136869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136862 ) ( ON ?auto_136863 ?auto_136862 ) ( not ( = ?auto_136862 ?auto_136863 ) ) ( not ( = ?auto_136862 ?auto_136864 ) ) ( not ( = ?auto_136862 ?auto_136865 ) ) ( not ( = ?auto_136862 ?auto_136866 ) ) ( not ( = ?auto_136862 ?auto_136867 ) ) ( not ( = ?auto_136862 ?auto_136868 ) ) ( not ( = ?auto_136862 ?auto_136869 ) ) ( not ( = ?auto_136863 ?auto_136864 ) ) ( not ( = ?auto_136863 ?auto_136865 ) ) ( not ( = ?auto_136863 ?auto_136866 ) ) ( not ( = ?auto_136863 ?auto_136867 ) ) ( not ( = ?auto_136863 ?auto_136868 ) ) ( not ( = ?auto_136863 ?auto_136869 ) ) ( not ( = ?auto_136864 ?auto_136865 ) ) ( not ( = ?auto_136864 ?auto_136866 ) ) ( not ( = ?auto_136864 ?auto_136867 ) ) ( not ( = ?auto_136864 ?auto_136868 ) ) ( not ( = ?auto_136864 ?auto_136869 ) ) ( not ( = ?auto_136865 ?auto_136866 ) ) ( not ( = ?auto_136865 ?auto_136867 ) ) ( not ( = ?auto_136865 ?auto_136868 ) ) ( not ( = ?auto_136865 ?auto_136869 ) ) ( not ( = ?auto_136866 ?auto_136867 ) ) ( not ( = ?auto_136866 ?auto_136868 ) ) ( not ( = ?auto_136866 ?auto_136869 ) ) ( not ( = ?auto_136867 ?auto_136868 ) ) ( not ( = ?auto_136867 ?auto_136869 ) ) ( not ( = ?auto_136868 ?auto_136869 ) ) ( ON-TABLE ?auto_136869 ) ( ON ?auto_136868 ?auto_136869 ) ( ON ?auto_136867 ?auto_136868 ) ( ON ?auto_136866 ?auto_136867 ) ( ON ?auto_136865 ?auto_136866 ) ( CLEAR ?auto_136863 ) ( ON ?auto_136864 ?auto_136865 ) ( CLEAR ?auto_136864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136869 ?auto_136868 ?auto_136867 ?auto_136866 ?auto_136865 )
      ( MAKE-8PILE ?auto_136862 ?auto_136863 ?auto_136864 ?auto_136865 ?auto_136866 ?auto_136867 ?auto_136868 ?auto_136869 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136870 - BLOCK
      ?auto_136871 - BLOCK
      ?auto_136872 - BLOCK
      ?auto_136873 - BLOCK
      ?auto_136874 - BLOCK
      ?auto_136875 - BLOCK
      ?auto_136876 - BLOCK
      ?auto_136877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136870 ) ( not ( = ?auto_136870 ?auto_136871 ) ) ( not ( = ?auto_136870 ?auto_136872 ) ) ( not ( = ?auto_136870 ?auto_136873 ) ) ( not ( = ?auto_136870 ?auto_136874 ) ) ( not ( = ?auto_136870 ?auto_136875 ) ) ( not ( = ?auto_136870 ?auto_136876 ) ) ( not ( = ?auto_136870 ?auto_136877 ) ) ( not ( = ?auto_136871 ?auto_136872 ) ) ( not ( = ?auto_136871 ?auto_136873 ) ) ( not ( = ?auto_136871 ?auto_136874 ) ) ( not ( = ?auto_136871 ?auto_136875 ) ) ( not ( = ?auto_136871 ?auto_136876 ) ) ( not ( = ?auto_136871 ?auto_136877 ) ) ( not ( = ?auto_136872 ?auto_136873 ) ) ( not ( = ?auto_136872 ?auto_136874 ) ) ( not ( = ?auto_136872 ?auto_136875 ) ) ( not ( = ?auto_136872 ?auto_136876 ) ) ( not ( = ?auto_136872 ?auto_136877 ) ) ( not ( = ?auto_136873 ?auto_136874 ) ) ( not ( = ?auto_136873 ?auto_136875 ) ) ( not ( = ?auto_136873 ?auto_136876 ) ) ( not ( = ?auto_136873 ?auto_136877 ) ) ( not ( = ?auto_136874 ?auto_136875 ) ) ( not ( = ?auto_136874 ?auto_136876 ) ) ( not ( = ?auto_136874 ?auto_136877 ) ) ( not ( = ?auto_136875 ?auto_136876 ) ) ( not ( = ?auto_136875 ?auto_136877 ) ) ( not ( = ?auto_136876 ?auto_136877 ) ) ( ON-TABLE ?auto_136877 ) ( ON ?auto_136876 ?auto_136877 ) ( ON ?auto_136875 ?auto_136876 ) ( ON ?auto_136874 ?auto_136875 ) ( ON ?auto_136873 ?auto_136874 ) ( ON ?auto_136872 ?auto_136873 ) ( CLEAR ?auto_136872 ) ( HOLDING ?auto_136871 ) ( CLEAR ?auto_136870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136870 ?auto_136871 )
      ( MAKE-8PILE ?auto_136870 ?auto_136871 ?auto_136872 ?auto_136873 ?auto_136874 ?auto_136875 ?auto_136876 ?auto_136877 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136878 - BLOCK
      ?auto_136879 - BLOCK
      ?auto_136880 - BLOCK
      ?auto_136881 - BLOCK
      ?auto_136882 - BLOCK
      ?auto_136883 - BLOCK
      ?auto_136884 - BLOCK
      ?auto_136885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136878 ) ( not ( = ?auto_136878 ?auto_136879 ) ) ( not ( = ?auto_136878 ?auto_136880 ) ) ( not ( = ?auto_136878 ?auto_136881 ) ) ( not ( = ?auto_136878 ?auto_136882 ) ) ( not ( = ?auto_136878 ?auto_136883 ) ) ( not ( = ?auto_136878 ?auto_136884 ) ) ( not ( = ?auto_136878 ?auto_136885 ) ) ( not ( = ?auto_136879 ?auto_136880 ) ) ( not ( = ?auto_136879 ?auto_136881 ) ) ( not ( = ?auto_136879 ?auto_136882 ) ) ( not ( = ?auto_136879 ?auto_136883 ) ) ( not ( = ?auto_136879 ?auto_136884 ) ) ( not ( = ?auto_136879 ?auto_136885 ) ) ( not ( = ?auto_136880 ?auto_136881 ) ) ( not ( = ?auto_136880 ?auto_136882 ) ) ( not ( = ?auto_136880 ?auto_136883 ) ) ( not ( = ?auto_136880 ?auto_136884 ) ) ( not ( = ?auto_136880 ?auto_136885 ) ) ( not ( = ?auto_136881 ?auto_136882 ) ) ( not ( = ?auto_136881 ?auto_136883 ) ) ( not ( = ?auto_136881 ?auto_136884 ) ) ( not ( = ?auto_136881 ?auto_136885 ) ) ( not ( = ?auto_136882 ?auto_136883 ) ) ( not ( = ?auto_136882 ?auto_136884 ) ) ( not ( = ?auto_136882 ?auto_136885 ) ) ( not ( = ?auto_136883 ?auto_136884 ) ) ( not ( = ?auto_136883 ?auto_136885 ) ) ( not ( = ?auto_136884 ?auto_136885 ) ) ( ON-TABLE ?auto_136885 ) ( ON ?auto_136884 ?auto_136885 ) ( ON ?auto_136883 ?auto_136884 ) ( ON ?auto_136882 ?auto_136883 ) ( ON ?auto_136881 ?auto_136882 ) ( ON ?auto_136880 ?auto_136881 ) ( CLEAR ?auto_136878 ) ( ON ?auto_136879 ?auto_136880 ) ( CLEAR ?auto_136879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136885 ?auto_136884 ?auto_136883 ?auto_136882 ?auto_136881 ?auto_136880 )
      ( MAKE-8PILE ?auto_136878 ?auto_136879 ?auto_136880 ?auto_136881 ?auto_136882 ?auto_136883 ?auto_136884 ?auto_136885 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136886 - BLOCK
      ?auto_136887 - BLOCK
      ?auto_136888 - BLOCK
      ?auto_136889 - BLOCK
      ?auto_136890 - BLOCK
      ?auto_136891 - BLOCK
      ?auto_136892 - BLOCK
      ?auto_136893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136886 ?auto_136887 ) ) ( not ( = ?auto_136886 ?auto_136888 ) ) ( not ( = ?auto_136886 ?auto_136889 ) ) ( not ( = ?auto_136886 ?auto_136890 ) ) ( not ( = ?auto_136886 ?auto_136891 ) ) ( not ( = ?auto_136886 ?auto_136892 ) ) ( not ( = ?auto_136886 ?auto_136893 ) ) ( not ( = ?auto_136887 ?auto_136888 ) ) ( not ( = ?auto_136887 ?auto_136889 ) ) ( not ( = ?auto_136887 ?auto_136890 ) ) ( not ( = ?auto_136887 ?auto_136891 ) ) ( not ( = ?auto_136887 ?auto_136892 ) ) ( not ( = ?auto_136887 ?auto_136893 ) ) ( not ( = ?auto_136888 ?auto_136889 ) ) ( not ( = ?auto_136888 ?auto_136890 ) ) ( not ( = ?auto_136888 ?auto_136891 ) ) ( not ( = ?auto_136888 ?auto_136892 ) ) ( not ( = ?auto_136888 ?auto_136893 ) ) ( not ( = ?auto_136889 ?auto_136890 ) ) ( not ( = ?auto_136889 ?auto_136891 ) ) ( not ( = ?auto_136889 ?auto_136892 ) ) ( not ( = ?auto_136889 ?auto_136893 ) ) ( not ( = ?auto_136890 ?auto_136891 ) ) ( not ( = ?auto_136890 ?auto_136892 ) ) ( not ( = ?auto_136890 ?auto_136893 ) ) ( not ( = ?auto_136891 ?auto_136892 ) ) ( not ( = ?auto_136891 ?auto_136893 ) ) ( not ( = ?auto_136892 ?auto_136893 ) ) ( ON-TABLE ?auto_136893 ) ( ON ?auto_136892 ?auto_136893 ) ( ON ?auto_136891 ?auto_136892 ) ( ON ?auto_136890 ?auto_136891 ) ( ON ?auto_136889 ?auto_136890 ) ( ON ?auto_136888 ?auto_136889 ) ( ON ?auto_136887 ?auto_136888 ) ( CLEAR ?auto_136887 ) ( HOLDING ?auto_136886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136886 )
      ( MAKE-8PILE ?auto_136886 ?auto_136887 ?auto_136888 ?auto_136889 ?auto_136890 ?auto_136891 ?auto_136892 ?auto_136893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136894 - BLOCK
      ?auto_136895 - BLOCK
      ?auto_136896 - BLOCK
      ?auto_136897 - BLOCK
      ?auto_136898 - BLOCK
      ?auto_136899 - BLOCK
      ?auto_136900 - BLOCK
      ?auto_136901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136894 ?auto_136895 ) ) ( not ( = ?auto_136894 ?auto_136896 ) ) ( not ( = ?auto_136894 ?auto_136897 ) ) ( not ( = ?auto_136894 ?auto_136898 ) ) ( not ( = ?auto_136894 ?auto_136899 ) ) ( not ( = ?auto_136894 ?auto_136900 ) ) ( not ( = ?auto_136894 ?auto_136901 ) ) ( not ( = ?auto_136895 ?auto_136896 ) ) ( not ( = ?auto_136895 ?auto_136897 ) ) ( not ( = ?auto_136895 ?auto_136898 ) ) ( not ( = ?auto_136895 ?auto_136899 ) ) ( not ( = ?auto_136895 ?auto_136900 ) ) ( not ( = ?auto_136895 ?auto_136901 ) ) ( not ( = ?auto_136896 ?auto_136897 ) ) ( not ( = ?auto_136896 ?auto_136898 ) ) ( not ( = ?auto_136896 ?auto_136899 ) ) ( not ( = ?auto_136896 ?auto_136900 ) ) ( not ( = ?auto_136896 ?auto_136901 ) ) ( not ( = ?auto_136897 ?auto_136898 ) ) ( not ( = ?auto_136897 ?auto_136899 ) ) ( not ( = ?auto_136897 ?auto_136900 ) ) ( not ( = ?auto_136897 ?auto_136901 ) ) ( not ( = ?auto_136898 ?auto_136899 ) ) ( not ( = ?auto_136898 ?auto_136900 ) ) ( not ( = ?auto_136898 ?auto_136901 ) ) ( not ( = ?auto_136899 ?auto_136900 ) ) ( not ( = ?auto_136899 ?auto_136901 ) ) ( not ( = ?auto_136900 ?auto_136901 ) ) ( ON-TABLE ?auto_136901 ) ( ON ?auto_136900 ?auto_136901 ) ( ON ?auto_136899 ?auto_136900 ) ( ON ?auto_136898 ?auto_136899 ) ( ON ?auto_136897 ?auto_136898 ) ( ON ?auto_136896 ?auto_136897 ) ( ON ?auto_136895 ?auto_136896 ) ( ON ?auto_136894 ?auto_136895 ) ( CLEAR ?auto_136894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136901 ?auto_136900 ?auto_136899 ?auto_136898 ?auto_136897 ?auto_136896 ?auto_136895 )
      ( MAKE-8PILE ?auto_136894 ?auto_136895 ?auto_136896 ?auto_136897 ?auto_136898 ?auto_136899 ?auto_136900 ?auto_136901 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136902 - BLOCK
      ?auto_136903 - BLOCK
      ?auto_136904 - BLOCK
      ?auto_136905 - BLOCK
      ?auto_136906 - BLOCK
      ?auto_136907 - BLOCK
      ?auto_136908 - BLOCK
      ?auto_136909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136902 ?auto_136903 ) ) ( not ( = ?auto_136902 ?auto_136904 ) ) ( not ( = ?auto_136902 ?auto_136905 ) ) ( not ( = ?auto_136902 ?auto_136906 ) ) ( not ( = ?auto_136902 ?auto_136907 ) ) ( not ( = ?auto_136902 ?auto_136908 ) ) ( not ( = ?auto_136902 ?auto_136909 ) ) ( not ( = ?auto_136903 ?auto_136904 ) ) ( not ( = ?auto_136903 ?auto_136905 ) ) ( not ( = ?auto_136903 ?auto_136906 ) ) ( not ( = ?auto_136903 ?auto_136907 ) ) ( not ( = ?auto_136903 ?auto_136908 ) ) ( not ( = ?auto_136903 ?auto_136909 ) ) ( not ( = ?auto_136904 ?auto_136905 ) ) ( not ( = ?auto_136904 ?auto_136906 ) ) ( not ( = ?auto_136904 ?auto_136907 ) ) ( not ( = ?auto_136904 ?auto_136908 ) ) ( not ( = ?auto_136904 ?auto_136909 ) ) ( not ( = ?auto_136905 ?auto_136906 ) ) ( not ( = ?auto_136905 ?auto_136907 ) ) ( not ( = ?auto_136905 ?auto_136908 ) ) ( not ( = ?auto_136905 ?auto_136909 ) ) ( not ( = ?auto_136906 ?auto_136907 ) ) ( not ( = ?auto_136906 ?auto_136908 ) ) ( not ( = ?auto_136906 ?auto_136909 ) ) ( not ( = ?auto_136907 ?auto_136908 ) ) ( not ( = ?auto_136907 ?auto_136909 ) ) ( not ( = ?auto_136908 ?auto_136909 ) ) ( ON-TABLE ?auto_136909 ) ( ON ?auto_136908 ?auto_136909 ) ( ON ?auto_136907 ?auto_136908 ) ( ON ?auto_136906 ?auto_136907 ) ( ON ?auto_136905 ?auto_136906 ) ( ON ?auto_136904 ?auto_136905 ) ( ON ?auto_136903 ?auto_136904 ) ( HOLDING ?auto_136902 ) ( CLEAR ?auto_136903 ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136909 ?auto_136908 ?auto_136907 ?auto_136906 ?auto_136905 ?auto_136904 ?auto_136903 ?auto_136902 )
      ( MAKE-8PILE ?auto_136902 ?auto_136903 ?auto_136904 ?auto_136905 ?auto_136906 ?auto_136907 ?auto_136908 ?auto_136909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136910 - BLOCK
      ?auto_136911 - BLOCK
      ?auto_136912 - BLOCK
      ?auto_136913 - BLOCK
      ?auto_136914 - BLOCK
      ?auto_136915 - BLOCK
      ?auto_136916 - BLOCK
      ?auto_136917 - BLOCK
    )
    :vars
    (
      ?auto_136918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136910 ?auto_136911 ) ) ( not ( = ?auto_136910 ?auto_136912 ) ) ( not ( = ?auto_136910 ?auto_136913 ) ) ( not ( = ?auto_136910 ?auto_136914 ) ) ( not ( = ?auto_136910 ?auto_136915 ) ) ( not ( = ?auto_136910 ?auto_136916 ) ) ( not ( = ?auto_136910 ?auto_136917 ) ) ( not ( = ?auto_136911 ?auto_136912 ) ) ( not ( = ?auto_136911 ?auto_136913 ) ) ( not ( = ?auto_136911 ?auto_136914 ) ) ( not ( = ?auto_136911 ?auto_136915 ) ) ( not ( = ?auto_136911 ?auto_136916 ) ) ( not ( = ?auto_136911 ?auto_136917 ) ) ( not ( = ?auto_136912 ?auto_136913 ) ) ( not ( = ?auto_136912 ?auto_136914 ) ) ( not ( = ?auto_136912 ?auto_136915 ) ) ( not ( = ?auto_136912 ?auto_136916 ) ) ( not ( = ?auto_136912 ?auto_136917 ) ) ( not ( = ?auto_136913 ?auto_136914 ) ) ( not ( = ?auto_136913 ?auto_136915 ) ) ( not ( = ?auto_136913 ?auto_136916 ) ) ( not ( = ?auto_136913 ?auto_136917 ) ) ( not ( = ?auto_136914 ?auto_136915 ) ) ( not ( = ?auto_136914 ?auto_136916 ) ) ( not ( = ?auto_136914 ?auto_136917 ) ) ( not ( = ?auto_136915 ?auto_136916 ) ) ( not ( = ?auto_136915 ?auto_136917 ) ) ( not ( = ?auto_136916 ?auto_136917 ) ) ( ON-TABLE ?auto_136917 ) ( ON ?auto_136916 ?auto_136917 ) ( ON ?auto_136915 ?auto_136916 ) ( ON ?auto_136914 ?auto_136915 ) ( ON ?auto_136913 ?auto_136914 ) ( ON ?auto_136912 ?auto_136913 ) ( ON ?auto_136911 ?auto_136912 ) ( CLEAR ?auto_136911 ) ( ON ?auto_136910 ?auto_136918 ) ( CLEAR ?auto_136910 ) ( HAND-EMPTY ) ( not ( = ?auto_136910 ?auto_136918 ) ) ( not ( = ?auto_136911 ?auto_136918 ) ) ( not ( = ?auto_136912 ?auto_136918 ) ) ( not ( = ?auto_136913 ?auto_136918 ) ) ( not ( = ?auto_136914 ?auto_136918 ) ) ( not ( = ?auto_136915 ?auto_136918 ) ) ( not ( = ?auto_136916 ?auto_136918 ) ) ( not ( = ?auto_136917 ?auto_136918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136910 ?auto_136918 )
      ( MAKE-8PILE ?auto_136910 ?auto_136911 ?auto_136912 ?auto_136913 ?auto_136914 ?auto_136915 ?auto_136916 ?auto_136917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136919 - BLOCK
      ?auto_136920 - BLOCK
      ?auto_136921 - BLOCK
      ?auto_136922 - BLOCK
      ?auto_136923 - BLOCK
      ?auto_136924 - BLOCK
      ?auto_136925 - BLOCK
      ?auto_136926 - BLOCK
    )
    :vars
    (
      ?auto_136927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136919 ?auto_136920 ) ) ( not ( = ?auto_136919 ?auto_136921 ) ) ( not ( = ?auto_136919 ?auto_136922 ) ) ( not ( = ?auto_136919 ?auto_136923 ) ) ( not ( = ?auto_136919 ?auto_136924 ) ) ( not ( = ?auto_136919 ?auto_136925 ) ) ( not ( = ?auto_136919 ?auto_136926 ) ) ( not ( = ?auto_136920 ?auto_136921 ) ) ( not ( = ?auto_136920 ?auto_136922 ) ) ( not ( = ?auto_136920 ?auto_136923 ) ) ( not ( = ?auto_136920 ?auto_136924 ) ) ( not ( = ?auto_136920 ?auto_136925 ) ) ( not ( = ?auto_136920 ?auto_136926 ) ) ( not ( = ?auto_136921 ?auto_136922 ) ) ( not ( = ?auto_136921 ?auto_136923 ) ) ( not ( = ?auto_136921 ?auto_136924 ) ) ( not ( = ?auto_136921 ?auto_136925 ) ) ( not ( = ?auto_136921 ?auto_136926 ) ) ( not ( = ?auto_136922 ?auto_136923 ) ) ( not ( = ?auto_136922 ?auto_136924 ) ) ( not ( = ?auto_136922 ?auto_136925 ) ) ( not ( = ?auto_136922 ?auto_136926 ) ) ( not ( = ?auto_136923 ?auto_136924 ) ) ( not ( = ?auto_136923 ?auto_136925 ) ) ( not ( = ?auto_136923 ?auto_136926 ) ) ( not ( = ?auto_136924 ?auto_136925 ) ) ( not ( = ?auto_136924 ?auto_136926 ) ) ( not ( = ?auto_136925 ?auto_136926 ) ) ( ON-TABLE ?auto_136926 ) ( ON ?auto_136925 ?auto_136926 ) ( ON ?auto_136924 ?auto_136925 ) ( ON ?auto_136923 ?auto_136924 ) ( ON ?auto_136922 ?auto_136923 ) ( ON ?auto_136921 ?auto_136922 ) ( ON ?auto_136919 ?auto_136927 ) ( CLEAR ?auto_136919 ) ( not ( = ?auto_136919 ?auto_136927 ) ) ( not ( = ?auto_136920 ?auto_136927 ) ) ( not ( = ?auto_136921 ?auto_136927 ) ) ( not ( = ?auto_136922 ?auto_136927 ) ) ( not ( = ?auto_136923 ?auto_136927 ) ) ( not ( = ?auto_136924 ?auto_136927 ) ) ( not ( = ?auto_136925 ?auto_136927 ) ) ( not ( = ?auto_136926 ?auto_136927 ) ) ( HOLDING ?auto_136920 ) ( CLEAR ?auto_136921 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136926 ?auto_136925 ?auto_136924 ?auto_136923 ?auto_136922 ?auto_136921 ?auto_136920 )
      ( MAKE-8PILE ?auto_136919 ?auto_136920 ?auto_136921 ?auto_136922 ?auto_136923 ?auto_136924 ?auto_136925 ?auto_136926 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136928 - BLOCK
      ?auto_136929 - BLOCK
      ?auto_136930 - BLOCK
      ?auto_136931 - BLOCK
      ?auto_136932 - BLOCK
      ?auto_136933 - BLOCK
      ?auto_136934 - BLOCK
      ?auto_136935 - BLOCK
    )
    :vars
    (
      ?auto_136936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136928 ?auto_136929 ) ) ( not ( = ?auto_136928 ?auto_136930 ) ) ( not ( = ?auto_136928 ?auto_136931 ) ) ( not ( = ?auto_136928 ?auto_136932 ) ) ( not ( = ?auto_136928 ?auto_136933 ) ) ( not ( = ?auto_136928 ?auto_136934 ) ) ( not ( = ?auto_136928 ?auto_136935 ) ) ( not ( = ?auto_136929 ?auto_136930 ) ) ( not ( = ?auto_136929 ?auto_136931 ) ) ( not ( = ?auto_136929 ?auto_136932 ) ) ( not ( = ?auto_136929 ?auto_136933 ) ) ( not ( = ?auto_136929 ?auto_136934 ) ) ( not ( = ?auto_136929 ?auto_136935 ) ) ( not ( = ?auto_136930 ?auto_136931 ) ) ( not ( = ?auto_136930 ?auto_136932 ) ) ( not ( = ?auto_136930 ?auto_136933 ) ) ( not ( = ?auto_136930 ?auto_136934 ) ) ( not ( = ?auto_136930 ?auto_136935 ) ) ( not ( = ?auto_136931 ?auto_136932 ) ) ( not ( = ?auto_136931 ?auto_136933 ) ) ( not ( = ?auto_136931 ?auto_136934 ) ) ( not ( = ?auto_136931 ?auto_136935 ) ) ( not ( = ?auto_136932 ?auto_136933 ) ) ( not ( = ?auto_136932 ?auto_136934 ) ) ( not ( = ?auto_136932 ?auto_136935 ) ) ( not ( = ?auto_136933 ?auto_136934 ) ) ( not ( = ?auto_136933 ?auto_136935 ) ) ( not ( = ?auto_136934 ?auto_136935 ) ) ( ON-TABLE ?auto_136935 ) ( ON ?auto_136934 ?auto_136935 ) ( ON ?auto_136933 ?auto_136934 ) ( ON ?auto_136932 ?auto_136933 ) ( ON ?auto_136931 ?auto_136932 ) ( ON ?auto_136930 ?auto_136931 ) ( ON ?auto_136928 ?auto_136936 ) ( not ( = ?auto_136928 ?auto_136936 ) ) ( not ( = ?auto_136929 ?auto_136936 ) ) ( not ( = ?auto_136930 ?auto_136936 ) ) ( not ( = ?auto_136931 ?auto_136936 ) ) ( not ( = ?auto_136932 ?auto_136936 ) ) ( not ( = ?auto_136933 ?auto_136936 ) ) ( not ( = ?auto_136934 ?auto_136936 ) ) ( not ( = ?auto_136935 ?auto_136936 ) ) ( CLEAR ?auto_136930 ) ( ON ?auto_136929 ?auto_136928 ) ( CLEAR ?auto_136929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136936 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136936 ?auto_136928 )
      ( MAKE-8PILE ?auto_136928 ?auto_136929 ?auto_136930 ?auto_136931 ?auto_136932 ?auto_136933 ?auto_136934 ?auto_136935 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136937 - BLOCK
      ?auto_136938 - BLOCK
      ?auto_136939 - BLOCK
      ?auto_136940 - BLOCK
      ?auto_136941 - BLOCK
      ?auto_136942 - BLOCK
      ?auto_136943 - BLOCK
      ?auto_136944 - BLOCK
    )
    :vars
    (
      ?auto_136945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136937 ?auto_136938 ) ) ( not ( = ?auto_136937 ?auto_136939 ) ) ( not ( = ?auto_136937 ?auto_136940 ) ) ( not ( = ?auto_136937 ?auto_136941 ) ) ( not ( = ?auto_136937 ?auto_136942 ) ) ( not ( = ?auto_136937 ?auto_136943 ) ) ( not ( = ?auto_136937 ?auto_136944 ) ) ( not ( = ?auto_136938 ?auto_136939 ) ) ( not ( = ?auto_136938 ?auto_136940 ) ) ( not ( = ?auto_136938 ?auto_136941 ) ) ( not ( = ?auto_136938 ?auto_136942 ) ) ( not ( = ?auto_136938 ?auto_136943 ) ) ( not ( = ?auto_136938 ?auto_136944 ) ) ( not ( = ?auto_136939 ?auto_136940 ) ) ( not ( = ?auto_136939 ?auto_136941 ) ) ( not ( = ?auto_136939 ?auto_136942 ) ) ( not ( = ?auto_136939 ?auto_136943 ) ) ( not ( = ?auto_136939 ?auto_136944 ) ) ( not ( = ?auto_136940 ?auto_136941 ) ) ( not ( = ?auto_136940 ?auto_136942 ) ) ( not ( = ?auto_136940 ?auto_136943 ) ) ( not ( = ?auto_136940 ?auto_136944 ) ) ( not ( = ?auto_136941 ?auto_136942 ) ) ( not ( = ?auto_136941 ?auto_136943 ) ) ( not ( = ?auto_136941 ?auto_136944 ) ) ( not ( = ?auto_136942 ?auto_136943 ) ) ( not ( = ?auto_136942 ?auto_136944 ) ) ( not ( = ?auto_136943 ?auto_136944 ) ) ( ON-TABLE ?auto_136944 ) ( ON ?auto_136943 ?auto_136944 ) ( ON ?auto_136942 ?auto_136943 ) ( ON ?auto_136941 ?auto_136942 ) ( ON ?auto_136940 ?auto_136941 ) ( ON ?auto_136937 ?auto_136945 ) ( not ( = ?auto_136937 ?auto_136945 ) ) ( not ( = ?auto_136938 ?auto_136945 ) ) ( not ( = ?auto_136939 ?auto_136945 ) ) ( not ( = ?auto_136940 ?auto_136945 ) ) ( not ( = ?auto_136941 ?auto_136945 ) ) ( not ( = ?auto_136942 ?auto_136945 ) ) ( not ( = ?auto_136943 ?auto_136945 ) ) ( not ( = ?auto_136944 ?auto_136945 ) ) ( ON ?auto_136938 ?auto_136937 ) ( CLEAR ?auto_136938 ) ( ON-TABLE ?auto_136945 ) ( HOLDING ?auto_136939 ) ( CLEAR ?auto_136940 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136944 ?auto_136943 ?auto_136942 ?auto_136941 ?auto_136940 ?auto_136939 )
      ( MAKE-8PILE ?auto_136937 ?auto_136938 ?auto_136939 ?auto_136940 ?auto_136941 ?auto_136942 ?auto_136943 ?auto_136944 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136946 - BLOCK
      ?auto_136947 - BLOCK
      ?auto_136948 - BLOCK
      ?auto_136949 - BLOCK
      ?auto_136950 - BLOCK
      ?auto_136951 - BLOCK
      ?auto_136952 - BLOCK
      ?auto_136953 - BLOCK
    )
    :vars
    (
      ?auto_136954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136946 ?auto_136947 ) ) ( not ( = ?auto_136946 ?auto_136948 ) ) ( not ( = ?auto_136946 ?auto_136949 ) ) ( not ( = ?auto_136946 ?auto_136950 ) ) ( not ( = ?auto_136946 ?auto_136951 ) ) ( not ( = ?auto_136946 ?auto_136952 ) ) ( not ( = ?auto_136946 ?auto_136953 ) ) ( not ( = ?auto_136947 ?auto_136948 ) ) ( not ( = ?auto_136947 ?auto_136949 ) ) ( not ( = ?auto_136947 ?auto_136950 ) ) ( not ( = ?auto_136947 ?auto_136951 ) ) ( not ( = ?auto_136947 ?auto_136952 ) ) ( not ( = ?auto_136947 ?auto_136953 ) ) ( not ( = ?auto_136948 ?auto_136949 ) ) ( not ( = ?auto_136948 ?auto_136950 ) ) ( not ( = ?auto_136948 ?auto_136951 ) ) ( not ( = ?auto_136948 ?auto_136952 ) ) ( not ( = ?auto_136948 ?auto_136953 ) ) ( not ( = ?auto_136949 ?auto_136950 ) ) ( not ( = ?auto_136949 ?auto_136951 ) ) ( not ( = ?auto_136949 ?auto_136952 ) ) ( not ( = ?auto_136949 ?auto_136953 ) ) ( not ( = ?auto_136950 ?auto_136951 ) ) ( not ( = ?auto_136950 ?auto_136952 ) ) ( not ( = ?auto_136950 ?auto_136953 ) ) ( not ( = ?auto_136951 ?auto_136952 ) ) ( not ( = ?auto_136951 ?auto_136953 ) ) ( not ( = ?auto_136952 ?auto_136953 ) ) ( ON-TABLE ?auto_136953 ) ( ON ?auto_136952 ?auto_136953 ) ( ON ?auto_136951 ?auto_136952 ) ( ON ?auto_136950 ?auto_136951 ) ( ON ?auto_136949 ?auto_136950 ) ( ON ?auto_136946 ?auto_136954 ) ( not ( = ?auto_136946 ?auto_136954 ) ) ( not ( = ?auto_136947 ?auto_136954 ) ) ( not ( = ?auto_136948 ?auto_136954 ) ) ( not ( = ?auto_136949 ?auto_136954 ) ) ( not ( = ?auto_136950 ?auto_136954 ) ) ( not ( = ?auto_136951 ?auto_136954 ) ) ( not ( = ?auto_136952 ?auto_136954 ) ) ( not ( = ?auto_136953 ?auto_136954 ) ) ( ON ?auto_136947 ?auto_136946 ) ( ON-TABLE ?auto_136954 ) ( CLEAR ?auto_136949 ) ( ON ?auto_136948 ?auto_136947 ) ( CLEAR ?auto_136948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136954 ?auto_136946 ?auto_136947 )
      ( MAKE-8PILE ?auto_136946 ?auto_136947 ?auto_136948 ?auto_136949 ?auto_136950 ?auto_136951 ?auto_136952 ?auto_136953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136955 - BLOCK
      ?auto_136956 - BLOCK
      ?auto_136957 - BLOCK
      ?auto_136958 - BLOCK
      ?auto_136959 - BLOCK
      ?auto_136960 - BLOCK
      ?auto_136961 - BLOCK
      ?auto_136962 - BLOCK
    )
    :vars
    (
      ?auto_136963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136955 ?auto_136956 ) ) ( not ( = ?auto_136955 ?auto_136957 ) ) ( not ( = ?auto_136955 ?auto_136958 ) ) ( not ( = ?auto_136955 ?auto_136959 ) ) ( not ( = ?auto_136955 ?auto_136960 ) ) ( not ( = ?auto_136955 ?auto_136961 ) ) ( not ( = ?auto_136955 ?auto_136962 ) ) ( not ( = ?auto_136956 ?auto_136957 ) ) ( not ( = ?auto_136956 ?auto_136958 ) ) ( not ( = ?auto_136956 ?auto_136959 ) ) ( not ( = ?auto_136956 ?auto_136960 ) ) ( not ( = ?auto_136956 ?auto_136961 ) ) ( not ( = ?auto_136956 ?auto_136962 ) ) ( not ( = ?auto_136957 ?auto_136958 ) ) ( not ( = ?auto_136957 ?auto_136959 ) ) ( not ( = ?auto_136957 ?auto_136960 ) ) ( not ( = ?auto_136957 ?auto_136961 ) ) ( not ( = ?auto_136957 ?auto_136962 ) ) ( not ( = ?auto_136958 ?auto_136959 ) ) ( not ( = ?auto_136958 ?auto_136960 ) ) ( not ( = ?auto_136958 ?auto_136961 ) ) ( not ( = ?auto_136958 ?auto_136962 ) ) ( not ( = ?auto_136959 ?auto_136960 ) ) ( not ( = ?auto_136959 ?auto_136961 ) ) ( not ( = ?auto_136959 ?auto_136962 ) ) ( not ( = ?auto_136960 ?auto_136961 ) ) ( not ( = ?auto_136960 ?auto_136962 ) ) ( not ( = ?auto_136961 ?auto_136962 ) ) ( ON-TABLE ?auto_136962 ) ( ON ?auto_136961 ?auto_136962 ) ( ON ?auto_136960 ?auto_136961 ) ( ON ?auto_136959 ?auto_136960 ) ( ON ?auto_136955 ?auto_136963 ) ( not ( = ?auto_136955 ?auto_136963 ) ) ( not ( = ?auto_136956 ?auto_136963 ) ) ( not ( = ?auto_136957 ?auto_136963 ) ) ( not ( = ?auto_136958 ?auto_136963 ) ) ( not ( = ?auto_136959 ?auto_136963 ) ) ( not ( = ?auto_136960 ?auto_136963 ) ) ( not ( = ?auto_136961 ?auto_136963 ) ) ( not ( = ?auto_136962 ?auto_136963 ) ) ( ON ?auto_136956 ?auto_136955 ) ( ON-TABLE ?auto_136963 ) ( ON ?auto_136957 ?auto_136956 ) ( CLEAR ?auto_136957 ) ( HOLDING ?auto_136958 ) ( CLEAR ?auto_136959 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136962 ?auto_136961 ?auto_136960 ?auto_136959 ?auto_136958 )
      ( MAKE-8PILE ?auto_136955 ?auto_136956 ?auto_136957 ?auto_136958 ?auto_136959 ?auto_136960 ?auto_136961 ?auto_136962 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136964 - BLOCK
      ?auto_136965 - BLOCK
      ?auto_136966 - BLOCK
      ?auto_136967 - BLOCK
      ?auto_136968 - BLOCK
      ?auto_136969 - BLOCK
      ?auto_136970 - BLOCK
      ?auto_136971 - BLOCK
    )
    :vars
    (
      ?auto_136972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136964 ?auto_136965 ) ) ( not ( = ?auto_136964 ?auto_136966 ) ) ( not ( = ?auto_136964 ?auto_136967 ) ) ( not ( = ?auto_136964 ?auto_136968 ) ) ( not ( = ?auto_136964 ?auto_136969 ) ) ( not ( = ?auto_136964 ?auto_136970 ) ) ( not ( = ?auto_136964 ?auto_136971 ) ) ( not ( = ?auto_136965 ?auto_136966 ) ) ( not ( = ?auto_136965 ?auto_136967 ) ) ( not ( = ?auto_136965 ?auto_136968 ) ) ( not ( = ?auto_136965 ?auto_136969 ) ) ( not ( = ?auto_136965 ?auto_136970 ) ) ( not ( = ?auto_136965 ?auto_136971 ) ) ( not ( = ?auto_136966 ?auto_136967 ) ) ( not ( = ?auto_136966 ?auto_136968 ) ) ( not ( = ?auto_136966 ?auto_136969 ) ) ( not ( = ?auto_136966 ?auto_136970 ) ) ( not ( = ?auto_136966 ?auto_136971 ) ) ( not ( = ?auto_136967 ?auto_136968 ) ) ( not ( = ?auto_136967 ?auto_136969 ) ) ( not ( = ?auto_136967 ?auto_136970 ) ) ( not ( = ?auto_136967 ?auto_136971 ) ) ( not ( = ?auto_136968 ?auto_136969 ) ) ( not ( = ?auto_136968 ?auto_136970 ) ) ( not ( = ?auto_136968 ?auto_136971 ) ) ( not ( = ?auto_136969 ?auto_136970 ) ) ( not ( = ?auto_136969 ?auto_136971 ) ) ( not ( = ?auto_136970 ?auto_136971 ) ) ( ON-TABLE ?auto_136971 ) ( ON ?auto_136970 ?auto_136971 ) ( ON ?auto_136969 ?auto_136970 ) ( ON ?auto_136968 ?auto_136969 ) ( ON ?auto_136964 ?auto_136972 ) ( not ( = ?auto_136964 ?auto_136972 ) ) ( not ( = ?auto_136965 ?auto_136972 ) ) ( not ( = ?auto_136966 ?auto_136972 ) ) ( not ( = ?auto_136967 ?auto_136972 ) ) ( not ( = ?auto_136968 ?auto_136972 ) ) ( not ( = ?auto_136969 ?auto_136972 ) ) ( not ( = ?auto_136970 ?auto_136972 ) ) ( not ( = ?auto_136971 ?auto_136972 ) ) ( ON ?auto_136965 ?auto_136964 ) ( ON-TABLE ?auto_136972 ) ( ON ?auto_136966 ?auto_136965 ) ( CLEAR ?auto_136968 ) ( ON ?auto_136967 ?auto_136966 ) ( CLEAR ?auto_136967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136972 ?auto_136964 ?auto_136965 ?auto_136966 )
      ( MAKE-8PILE ?auto_136964 ?auto_136965 ?auto_136966 ?auto_136967 ?auto_136968 ?auto_136969 ?auto_136970 ?auto_136971 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136973 - BLOCK
      ?auto_136974 - BLOCK
      ?auto_136975 - BLOCK
      ?auto_136976 - BLOCK
      ?auto_136977 - BLOCK
      ?auto_136978 - BLOCK
      ?auto_136979 - BLOCK
      ?auto_136980 - BLOCK
    )
    :vars
    (
      ?auto_136981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136973 ?auto_136974 ) ) ( not ( = ?auto_136973 ?auto_136975 ) ) ( not ( = ?auto_136973 ?auto_136976 ) ) ( not ( = ?auto_136973 ?auto_136977 ) ) ( not ( = ?auto_136973 ?auto_136978 ) ) ( not ( = ?auto_136973 ?auto_136979 ) ) ( not ( = ?auto_136973 ?auto_136980 ) ) ( not ( = ?auto_136974 ?auto_136975 ) ) ( not ( = ?auto_136974 ?auto_136976 ) ) ( not ( = ?auto_136974 ?auto_136977 ) ) ( not ( = ?auto_136974 ?auto_136978 ) ) ( not ( = ?auto_136974 ?auto_136979 ) ) ( not ( = ?auto_136974 ?auto_136980 ) ) ( not ( = ?auto_136975 ?auto_136976 ) ) ( not ( = ?auto_136975 ?auto_136977 ) ) ( not ( = ?auto_136975 ?auto_136978 ) ) ( not ( = ?auto_136975 ?auto_136979 ) ) ( not ( = ?auto_136975 ?auto_136980 ) ) ( not ( = ?auto_136976 ?auto_136977 ) ) ( not ( = ?auto_136976 ?auto_136978 ) ) ( not ( = ?auto_136976 ?auto_136979 ) ) ( not ( = ?auto_136976 ?auto_136980 ) ) ( not ( = ?auto_136977 ?auto_136978 ) ) ( not ( = ?auto_136977 ?auto_136979 ) ) ( not ( = ?auto_136977 ?auto_136980 ) ) ( not ( = ?auto_136978 ?auto_136979 ) ) ( not ( = ?auto_136978 ?auto_136980 ) ) ( not ( = ?auto_136979 ?auto_136980 ) ) ( ON-TABLE ?auto_136980 ) ( ON ?auto_136979 ?auto_136980 ) ( ON ?auto_136978 ?auto_136979 ) ( ON ?auto_136973 ?auto_136981 ) ( not ( = ?auto_136973 ?auto_136981 ) ) ( not ( = ?auto_136974 ?auto_136981 ) ) ( not ( = ?auto_136975 ?auto_136981 ) ) ( not ( = ?auto_136976 ?auto_136981 ) ) ( not ( = ?auto_136977 ?auto_136981 ) ) ( not ( = ?auto_136978 ?auto_136981 ) ) ( not ( = ?auto_136979 ?auto_136981 ) ) ( not ( = ?auto_136980 ?auto_136981 ) ) ( ON ?auto_136974 ?auto_136973 ) ( ON-TABLE ?auto_136981 ) ( ON ?auto_136975 ?auto_136974 ) ( ON ?auto_136976 ?auto_136975 ) ( CLEAR ?auto_136976 ) ( HOLDING ?auto_136977 ) ( CLEAR ?auto_136978 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136980 ?auto_136979 ?auto_136978 ?auto_136977 )
      ( MAKE-8PILE ?auto_136973 ?auto_136974 ?auto_136975 ?auto_136976 ?auto_136977 ?auto_136978 ?auto_136979 ?auto_136980 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136982 - BLOCK
      ?auto_136983 - BLOCK
      ?auto_136984 - BLOCK
      ?auto_136985 - BLOCK
      ?auto_136986 - BLOCK
      ?auto_136987 - BLOCK
      ?auto_136988 - BLOCK
      ?auto_136989 - BLOCK
    )
    :vars
    (
      ?auto_136990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136982 ?auto_136983 ) ) ( not ( = ?auto_136982 ?auto_136984 ) ) ( not ( = ?auto_136982 ?auto_136985 ) ) ( not ( = ?auto_136982 ?auto_136986 ) ) ( not ( = ?auto_136982 ?auto_136987 ) ) ( not ( = ?auto_136982 ?auto_136988 ) ) ( not ( = ?auto_136982 ?auto_136989 ) ) ( not ( = ?auto_136983 ?auto_136984 ) ) ( not ( = ?auto_136983 ?auto_136985 ) ) ( not ( = ?auto_136983 ?auto_136986 ) ) ( not ( = ?auto_136983 ?auto_136987 ) ) ( not ( = ?auto_136983 ?auto_136988 ) ) ( not ( = ?auto_136983 ?auto_136989 ) ) ( not ( = ?auto_136984 ?auto_136985 ) ) ( not ( = ?auto_136984 ?auto_136986 ) ) ( not ( = ?auto_136984 ?auto_136987 ) ) ( not ( = ?auto_136984 ?auto_136988 ) ) ( not ( = ?auto_136984 ?auto_136989 ) ) ( not ( = ?auto_136985 ?auto_136986 ) ) ( not ( = ?auto_136985 ?auto_136987 ) ) ( not ( = ?auto_136985 ?auto_136988 ) ) ( not ( = ?auto_136985 ?auto_136989 ) ) ( not ( = ?auto_136986 ?auto_136987 ) ) ( not ( = ?auto_136986 ?auto_136988 ) ) ( not ( = ?auto_136986 ?auto_136989 ) ) ( not ( = ?auto_136987 ?auto_136988 ) ) ( not ( = ?auto_136987 ?auto_136989 ) ) ( not ( = ?auto_136988 ?auto_136989 ) ) ( ON-TABLE ?auto_136989 ) ( ON ?auto_136988 ?auto_136989 ) ( ON ?auto_136987 ?auto_136988 ) ( ON ?auto_136982 ?auto_136990 ) ( not ( = ?auto_136982 ?auto_136990 ) ) ( not ( = ?auto_136983 ?auto_136990 ) ) ( not ( = ?auto_136984 ?auto_136990 ) ) ( not ( = ?auto_136985 ?auto_136990 ) ) ( not ( = ?auto_136986 ?auto_136990 ) ) ( not ( = ?auto_136987 ?auto_136990 ) ) ( not ( = ?auto_136988 ?auto_136990 ) ) ( not ( = ?auto_136989 ?auto_136990 ) ) ( ON ?auto_136983 ?auto_136982 ) ( ON-TABLE ?auto_136990 ) ( ON ?auto_136984 ?auto_136983 ) ( ON ?auto_136985 ?auto_136984 ) ( CLEAR ?auto_136987 ) ( ON ?auto_136986 ?auto_136985 ) ( CLEAR ?auto_136986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136990 ?auto_136982 ?auto_136983 ?auto_136984 ?auto_136985 )
      ( MAKE-8PILE ?auto_136982 ?auto_136983 ?auto_136984 ?auto_136985 ?auto_136986 ?auto_136987 ?auto_136988 ?auto_136989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_136991 - BLOCK
      ?auto_136992 - BLOCK
      ?auto_136993 - BLOCK
      ?auto_136994 - BLOCK
      ?auto_136995 - BLOCK
      ?auto_136996 - BLOCK
      ?auto_136997 - BLOCK
      ?auto_136998 - BLOCK
    )
    :vars
    (
      ?auto_136999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_136991 ?auto_136992 ) ) ( not ( = ?auto_136991 ?auto_136993 ) ) ( not ( = ?auto_136991 ?auto_136994 ) ) ( not ( = ?auto_136991 ?auto_136995 ) ) ( not ( = ?auto_136991 ?auto_136996 ) ) ( not ( = ?auto_136991 ?auto_136997 ) ) ( not ( = ?auto_136991 ?auto_136998 ) ) ( not ( = ?auto_136992 ?auto_136993 ) ) ( not ( = ?auto_136992 ?auto_136994 ) ) ( not ( = ?auto_136992 ?auto_136995 ) ) ( not ( = ?auto_136992 ?auto_136996 ) ) ( not ( = ?auto_136992 ?auto_136997 ) ) ( not ( = ?auto_136992 ?auto_136998 ) ) ( not ( = ?auto_136993 ?auto_136994 ) ) ( not ( = ?auto_136993 ?auto_136995 ) ) ( not ( = ?auto_136993 ?auto_136996 ) ) ( not ( = ?auto_136993 ?auto_136997 ) ) ( not ( = ?auto_136993 ?auto_136998 ) ) ( not ( = ?auto_136994 ?auto_136995 ) ) ( not ( = ?auto_136994 ?auto_136996 ) ) ( not ( = ?auto_136994 ?auto_136997 ) ) ( not ( = ?auto_136994 ?auto_136998 ) ) ( not ( = ?auto_136995 ?auto_136996 ) ) ( not ( = ?auto_136995 ?auto_136997 ) ) ( not ( = ?auto_136995 ?auto_136998 ) ) ( not ( = ?auto_136996 ?auto_136997 ) ) ( not ( = ?auto_136996 ?auto_136998 ) ) ( not ( = ?auto_136997 ?auto_136998 ) ) ( ON-TABLE ?auto_136998 ) ( ON ?auto_136997 ?auto_136998 ) ( ON ?auto_136991 ?auto_136999 ) ( not ( = ?auto_136991 ?auto_136999 ) ) ( not ( = ?auto_136992 ?auto_136999 ) ) ( not ( = ?auto_136993 ?auto_136999 ) ) ( not ( = ?auto_136994 ?auto_136999 ) ) ( not ( = ?auto_136995 ?auto_136999 ) ) ( not ( = ?auto_136996 ?auto_136999 ) ) ( not ( = ?auto_136997 ?auto_136999 ) ) ( not ( = ?auto_136998 ?auto_136999 ) ) ( ON ?auto_136992 ?auto_136991 ) ( ON-TABLE ?auto_136999 ) ( ON ?auto_136993 ?auto_136992 ) ( ON ?auto_136994 ?auto_136993 ) ( ON ?auto_136995 ?auto_136994 ) ( CLEAR ?auto_136995 ) ( HOLDING ?auto_136996 ) ( CLEAR ?auto_136997 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136998 ?auto_136997 ?auto_136996 )
      ( MAKE-8PILE ?auto_136991 ?auto_136992 ?auto_136993 ?auto_136994 ?auto_136995 ?auto_136996 ?auto_136997 ?auto_136998 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137000 - BLOCK
      ?auto_137001 - BLOCK
      ?auto_137002 - BLOCK
      ?auto_137003 - BLOCK
      ?auto_137004 - BLOCK
      ?auto_137005 - BLOCK
      ?auto_137006 - BLOCK
      ?auto_137007 - BLOCK
    )
    :vars
    (
      ?auto_137008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137000 ?auto_137001 ) ) ( not ( = ?auto_137000 ?auto_137002 ) ) ( not ( = ?auto_137000 ?auto_137003 ) ) ( not ( = ?auto_137000 ?auto_137004 ) ) ( not ( = ?auto_137000 ?auto_137005 ) ) ( not ( = ?auto_137000 ?auto_137006 ) ) ( not ( = ?auto_137000 ?auto_137007 ) ) ( not ( = ?auto_137001 ?auto_137002 ) ) ( not ( = ?auto_137001 ?auto_137003 ) ) ( not ( = ?auto_137001 ?auto_137004 ) ) ( not ( = ?auto_137001 ?auto_137005 ) ) ( not ( = ?auto_137001 ?auto_137006 ) ) ( not ( = ?auto_137001 ?auto_137007 ) ) ( not ( = ?auto_137002 ?auto_137003 ) ) ( not ( = ?auto_137002 ?auto_137004 ) ) ( not ( = ?auto_137002 ?auto_137005 ) ) ( not ( = ?auto_137002 ?auto_137006 ) ) ( not ( = ?auto_137002 ?auto_137007 ) ) ( not ( = ?auto_137003 ?auto_137004 ) ) ( not ( = ?auto_137003 ?auto_137005 ) ) ( not ( = ?auto_137003 ?auto_137006 ) ) ( not ( = ?auto_137003 ?auto_137007 ) ) ( not ( = ?auto_137004 ?auto_137005 ) ) ( not ( = ?auto_137004 ?auto_137006 ) ) ( not ( = ?auto_137004 ?auto_137007 ) ) ( not ( = ?auto_137005 ?auto_137006 ) ) ( not ( = ?auto_137005 ?auto_137007 ) ) ( not ( = ?auto_137006 ?auto_137007 ) ) ( ON-TABLE ?auto_137007 ) ( ON ?auto_137006 ?auto_137007 ) ( ON ?auto_137000 ?auto_137008 ) ( not ( = ?auto_137000 ?auto_137008 ) ) ( not ( = ?auto_137001 ?auto_137008 ) ) ( not ( = ?auto_137002 ?auto_137008 ) ) ( not ( = ?auto_137003 ?auto_137008 ) ) ( not ( = ?auto_137004 ?auto_137008 ) ) ( not ( = ?auto_137005 ?auto_137008 ) ) ( not ( = ?auto_137006 ?auto_137008 ) ) ( not ( = ?auto_137007 ?auto_137008 ) ) ( ON ?auto_137001 ?auto_137000 ) ( ON-TABLE ?auto_137008 ) ( ON ?auto_137002 ?auto_137001 ) ( ON ?auto_137003 ?auto_137002 ) ( ON ?auto_137004 ?auto_137003 ) ( CLEAR ?auto_137006 ) ( ON ?auto_137005 ?auto_137004 ) ( CLEAR ?auto_137005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_137008 ?auto_137000 ?auto_137001 ?auto_137002 ?auto_137003 ?auto_137004 )
      ( MAKE-8PILE ?auto_137000 ?auto_137001 ?auto_137002 ?auto_137003 ?auto_137004 ?auto_137005 ?auto_137006 ?auto_137007 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137009 - BLOCK
      ?auto_137010 - BLOCK
      ?auto_137011 - BLOCK
      ?auto_137012 - BLOCK
      ?auto_137013 - BLOCK
      ?auto_137014 - BLOCK
      ?auto_137015 - BLOCK
      ?auto_137016 - BLOCK
    )
    :vars
    (
      ?auto_137017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137009 ?auto_137010 ) ) ( not ( = ?auto_137009 ?auto_137011 ) ) ( not ( = ?auto_137009 ?auto_137012 ) ) ( not ( = ?auto_137009 ?auto_137013 ) ) ( not ( = ?auto_137009 ?auto_137014 ) ) ( not ( = ?auto_137009 ?auto_137015 ) ) ( not ( = ?auto_137009 ?auto_137016 ) ) ( not ( = ?auto_137010 ?auto_137011 ) ) ( not ( = ?auto_137010 ?auto_137012 ) ) ( not ( = ?auto_137010 ?auto_137013 ) ) ( not ( = ?auto_137010 ?auto_137014 ) ) ( not ( = ?auto_137010 ?auto_137015 ) ) ( not ( = ?auto_137010 ?auto_137016 ) ) ( not ( = ?auto_137011 ?auto_137012 ) ) ( not ( = ?auto_137011 ?auto_137013 ) ) ( not ( = ?auto_137011 ?auto_137014 ) ) ( not ( = ?auto_137011 ?auto_137015 ) ) ( not ( = ?auto_137011 ?auto_137016 ) ) ( not ( = ?auto_137012 ?auto_137013 ) ) ( not ( = ?auto_137012 ?auto_137014 ) ) ( not ( = ?auto_137012 ?auto_137015 ) ) ( not ( = ?auto_137012 ?auto_137016 ) ) ( not ( = ?auto_137013 ?auto_137014 ) ) ( not ( = ?auto_137013 ?auto_137015 ) ) ( not ( = ?auto_137013 ?auto_137016 ) ) ( not ( = ?auto_137014 ?auto_137015 ) ) ( not ( = ?auto_137014 ?auto_137016 ) ) ( not ( = ?auto_137015 ?auto_137016 ) ) ( ON-TABLE ?auto_137016 ) ( ON ?auto_137009 ?auto_137017 ) ( not ( = ?auto_137009 ?auto_137017 ) ) ( not ( = ?auto_137010 ?auto_137017 ) ) ( not ( = ?auto_137011 ?auto_137017 ) ) ( not ( = ?auto_137012 ?auto_137017 ) ) ( not ( = ?auto_137013 ?auto_137017 ) ) ( not ( = ?auto_137014 ?auto_137017 ) ) ( not ( = ?auto_137015 ?auto_137017 ) ) ( not ( = ?auto_137016 ?auto_137017 ) ) ( ON ?auto_137010 ?auto_137009 ) ( ON-TABLE ?auto_137017 ) ( ON ?auto_137011 ?auto_137010 ) ( ON ?auto_137012 ?auto_137011 ) ( ON ?auto_137013 ?auto_137012 ) ( ON ?auto_137014 ?auto_137013 ) ( CLEAR ?auto_137014 ) ( HOLDING ?auto_137015 ) ( CLEAR ?auto_137016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137016 ?auto_137015 )
      ( MAKE-8PILE ?auto_137009 ?auto_137010 ?auto_137011 ?auto_137012 ?auto_137013 ?auto_137014 ?auto_137015 ?auto_137016 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137018 - BLOCK
      ?auto_137019 - BLOCK
      ?auto_137020 - BLOCK
      ?auto_137021 - BLOCK
      ?auto_137022 - BLOCK
      ?auto_137023 - BLOCK
      ?auto_137024 - BLOCK
      ?auto_137025 - BLOCK
    )
    :vars
    (
      ?auto_137026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137018 ?auto_137019 ) ) ( not ( = ?auto_137018 ?auto_137020 ) ) ( not ( = ?auto_137018 ?auto_137021 ) ) ( not ( = ?auto_137018 ?auto_137022 ) ) ( not ( = ?auto_137018 ?auto_137023 ) ) ( not ( = ?auto_137018 ?auto_137024 ) ) ( not ( = ?auto_137018 ?auto_137025 ) ) ( not ( = ?auto_137019 ?auto_137020 ) ) ( not ( = ?auto_137019 ?auto_137021 ) ) ( not ( = ?auto_137019 ?auto_137022 ) ) ( not ( = ?auto_137019 ?auto_137023 ) ) ( not ( = ?auto_137019 ?auto_137024 ) ) ( not ( = ?auto_137019 ?auto_137025 ) ) ( not ( = ?auto_137020 ?auto_137021 ) ) ( not ( = ?auto_137020 ?auto_137022 ) ) ( not ( = ?auto_137020 ?auto_137023 ) ) ( not ( = ?auto_137020 ?auto_137024 ) ) ( not ( = ?auto_137020 ?auto_137025 ) ) ( not ( = ?auto_137021 ?auto_137022 ) ) ( not ( = ?auto_137021 ?auto_137023 ) ) ( not ( = ?auto_137021 ?auto_137024 ) ) ( not ( = ?auto_137021 ?auto_137025 ) ) ( not ( = ?auto_137022 ?auto_137023 ) ) ( not ( = ?auto_137022 ?auto_137024 ) ) ( not ( = ?auto_137022 ?auto_137025 ) ) ( not ( = ?auto_137023 ?auto_137024 ) ) ( not ( = ?auto_137023 ?auto_137025 ) ) ( not ( = ?auto_137024 ?auto_137025 ) ) ( ON-TABLE ?auto_137025 ) ( ON ?auto_137018 ?auto_137026 ) ( not ( = ?auto_137018 ?auto_137026 ) ) ( not ( = ?auto_137019 ?auto_137026 ) ) ( not ( = ?auto_137020 ?auto_137026 ) ) ( not ( = ?auto_137021 ?auto_137026 ) ) ( not ( = ?auto_137022 ?auto_137026 ) ) ( not ( = ?auto_137023 ?auto_137026 ) ) ( not ( = ?auto_137024 ?auto_137026 ) ) ( not ( = ?auto_137025 ?auto_137026 ) ) ( ON ?auto_137019 ?auto_137018 ) ( ON-TABLE ?auto_137026 ) ( ON ?auto_137020 ?auto_137019 ) ( ON ?auto_137021 ?auto_137020 ) ( ON ?auto_137022 ?auto_137021 ) ( ON ?auto_137023 ?auto_137022 ) ( CLEAR ?auto_137025 ) ( ON ?auto_137024 ?auto_137023 ) ( CLEAR ?auto_137024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_137026 ?auto_137018 ?auto_137019 ?auto_137020 ?auto_137021 ?auto_137022 ?auto_137023 )
      ( MAKE-8PILE ?auto_137018 ?auto_137019 ?auto_137020 ?auto_137021 ?auto_137022 ?auto_137023 ?auto_137024 ?auto_137025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137027 - BLOCK
      ?auto_137028 - BLOCK
      ?auto_137029 - BLOCK
      ?auto_137030 - BLOCK
      ?auto_137031 - BLOCK
      ?auto_137032 - BLOCK
      ?auto_137033 - BLOCK
      ?auto_137034 - BLOCK
    )
    :vars
    (
      ?auto_137035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137027 ?auto_137028 ) ) ( not ( = ?auto_137027 ?auto_137029 ) ) ( not ( = ?auto_137027 ?auto_137030 ) ) ( not ( = ?auto_137027 ?auto_137031 ) ) ( not ( = ?auto_137027 ?auto_137032 ) ) ( not ( = ?auto_137027 ?auto_137033 ) ) ( not ( = ?auto_137027 ?auto_137034 ) ) ( not ( = ?auto_137028 ?auto_137029 ) ) ( not ( = ?auto_137028 ?auto_137030 ) ) ( not ( = ?auto_137028 ?auto_137031 ) ) ( not ( = ?auto_137028 ?auto_137032 ) ) ( not ( = ?auto_137028 ?auto_137033 ) ) ( not ( = ?auto_137028 ?auto_137034 ) ) ( not ( = ?auto_137029 ?auto_137030 ) ) ( not ( = ?auto_137029 ?auto_137031 ) ) ( not ( = ?auto_137029 ?auto_137032 ) ) ( not ( = ?auto_137029 ?auto_137033 ) ) ( not ( = ?auto_137029 ?auto_137034 ) ) ( not ( = ?auto_137030 ?auto_137031 ) ) ( not ( = ?auto_137030 ?auto_137032 ) ) ( not ( = ?auto_137030 ?auto_137033 ) ) ( not ( = ?auto_137030 ?auto_137034 ) ) ( not ( = ?auto_137031 ?auto_137032 ) ) ( not ( = ?auto_137031 ?auto_137033 ) ) ( not ( = ?auto_137031 ?auto_137034 ) ) ( not ( = ?auto_137032 ?auto_137033 ) ) ( not ( = ?auto_137032 ?auto_137034 ) ) ( not ( = ?auto_137033 ?auto_137034 ) ) ( ON ?auto_137027 ?auto_137035 ) ( not ( = ?auto_137027 ?auto_137035 ) ) ( not ( = ?auto_137028 ?auto_137035 ) ) ( not ( = ?auto_137029 ?auto_137035 ) ) ( not ( = ?auto_137030 ?auto_137035 ) ) ( not ( = ?auto_137031 ?auto_137035 ) ) ( not ( = ?auto_137032 ?auto_137035 ) ) ( not ( = ?auto_137033 ?auto_137035 ) ) ( not ( = ?auto_137034 ?auto_137035 ) ) ( ON ?auto_137028 ?auto_137027 ) ( ON-TABLE ?auto_137035 ) ( ON ?auto_137029 ?auto_137028 ) ( ON ?auto_137030 ?auto_137029 ) ( ON ?auto_137031 ?auto_137030 ) ( ON ?auto_137032 ?auto_137031 ) ( ON ?auto_137033 ?auto_137032 ) ( CLEAR ?auto_137033 ) ( HOLDING ?auto_137034 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137034 )
      ( MAKE-8PILE ?auto_137027 ?auto_137028 ?auto_137029 ?auto_137030 ?auto_137031 ?auto_137032 ?auto_137033 ?auto_137034 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_137036 - BLOCK
      ?auto_137037 - BLOCK
      ?auto_137038 - BLOCK
      ?auto_137039 - BLOCK
      ?auto_137040 - BLOCK
      ?auto_137041 - BLOCK
      ?auto_137042 - BLOCK
      ?auto_137043 - BLOCK
    )
    :vars
    (
      ?auto_137044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137036 ?auto_137037 ) ) ( not ( = ?auto_137036 ?auto_137038 ) ) ( not ( = ?auto_137036 ?auto_137039 ) ) ( not ( = ?auto_137036 ?auto_137040 ) ) ( not ( = ?auto_137036 ?auto_137041 ) ) ( not ( = ?auto_137036 ?auto_137042 ) ) ( not ( = ?auto_137036 ?auto_137043 ) ) ( not ( = ?auto_137037 ?auto_137038 ) ) ( not ( = ?auto_137037 ?auto_137039 ) ) ( not ( = ?auto_137037 ?auto_137040 ) ) ( not ( = ?auto_137037 ?auto_137041 ) ) ( not ( = ?auto_137037 ?auto_137042 ) ) ( not ( = ?auto_137037 ?auto_137043 ) ) ( not ( = ?auto_137038 ?auto_137039 ) ) ( not ( = ?auto_137038 ?auto_137040 ) ) ( not ( = ?auto_137038 ?auto_137041 ) ) ( not ( = ?auto_137038 ?auto_137042 ) ) ( not ( = ?auto_137038 ?auto_137043 ) ) ( not ( = ?auto_137039 ?auto_137040 ) ) ( not ( = ?auto_137039 ?auto_137041 ) ) ( not ( = ?auto_137039 ?auto_137042 ) ) ( not ( = ?auto_137039 ?auto_137043 ) ) ( not ( = ?auto_137040 ?auto_137041 ) ) ( not ( = ?auto_137040 ?auto_137042 ) ) ( not ( = ?auto_137040 ?auto_137043 ) ) ( not ( = ?auto_137041 ?auto_137042 ) ) ( not ( = ?auto_137041 ?auto_137043 ) ) ( not ( = ?auto_137042 ?auto_137043 ) ) ( ON ?auto_137036 ?auto_137044 ) ( not ( = ?auto_137036 ?auto_137044 ) ) ( not ( = ?auto_137037 ?auto_137044 ) ) ( not ( = ?auto_137038 ?auto_137044 ) ) ( not ( = ?auto_137039 ?auto_137044 ) ) ( not ( = ?auto_137040 ?auto_137044 ) ) ( not ( = ?auto_137041 ?auto_137044 ) ) ( not ( = ?auto_137042 ?auto_137044 ) ) ( not ( = ?auto_137043 ?auto_137044 ) ) ( ON ?auto_137037 ?auto_137036 ) ( ON-TABLE ?auto_137044 ) ( ON ?auto_137038 ?auto_137037 ) ( ON ?auto_137039 ?auto_137038 ) ( ON ?auto_137040 ?auto_137039 ) ( ON ?auto_137041 ?auto_137040 ) ( ON ?auto_137042 ?auto_137041 ) ( ON ?auto_137043 ?auto_137042 ) ( CLEAR ?auto_137043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_137044 ?auto_137036 ?auto_137037 ?auto_137038 ?auto_137039 ?auto_137040 ?auto_137041 ?auto_137042 )
      ( MAKE-8PILE ?auto_137036 ?auto_137037 ?auto_137038 ?auto_137039 ?auto_137040 ?auto_137041 ?auto_137042 ?auto_137043 ) )
  )

)

