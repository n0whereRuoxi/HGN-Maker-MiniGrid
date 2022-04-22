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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12839 - BLOCK
      ?auto_12840 - BLOCK
      ?auto_12841 - BLOCK
      ?auto_12842 - BLOCK
    )
    :vars
    (
      ?auto_12843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12843 ?auto_12842 ) ( CLEAR ?auto_12843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12839 ) ( ON ?auto_12840 ?auto_12839 ) ( ON ?auto_12841 ?auto_12840 ) ( ON ?auto_12842 ?auto_12841 ) ( not ( = ?auto_12839 ?auto_12840 ) ) ( not ( = ?auto_12839 ?auto_12841 ) ) ( not ( = ?auto_12839 ?auto_12842 ) ) ( not ( = ?auto_12839 ?auto_12843 ) ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( not ( = ?auto_12840 ?auto_12842 ) ) ( not ( = ?auto_12840 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12842 ?auto_12843 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12843 ?auto_12842 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12845 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12845 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12846 - BLOCK
    )
    :vars
    (
      ?auto_12847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12846 ?auto_12847 ) ( CLEAR ?auto_12846 ) ( HAND-EMPTY ) ( not ( = ?auto_12846 ?auto_12847 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12846 ?auto_12847 )
      ( MAKE-1PILE ?auto_12846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12851 - BLOCK
      ?auto_12852 - BLOCK
      ?auto_12853 - BLOCK
    )
    :vars
    (
      ?auto_12854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12854 ?auto_12853 ) ( CLEAR ?auto_12854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12851 ) ( ON ?auto_12852 ?auto_12851 ) ( ON ?auto_12853 ?auto_12852 ) ( not ( = ?auto_12851 ?auto_12852 ) ) ( not ( = ?auto_12851 ?auto_12853 ) ) ( not ( = ?auto_12851 ?auto_12854 ) ) ( not ( = ?auto_12852 ?auto_12853 ) ) ( not ( = ?auto_12852 ?auto_12854 ) ) ( not ( = ?auto_12853 ?auto_12854 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12854 ?auto_12853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12855 - BLOCK
      ?auto_12856 - BLOCK
      ?auto_12857 - BLOCK
    )
    :vars
    (
      ?auto_12858 - BLOCK
      ?auto_12859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12858 ?auto_12857 ) ( CLEAR ?auto_12858 ) ( ON-TABLE ?auto_12855 ) ( ON ?auto_12856 ?auto_12855 ) ( ON ?auto_12857 ?auto_12856 ) ( not ( = ?auto_12855 ?auto_12856 ) ) ( not ( = ?auto_12855 ?auto_12857 ) ) ( not ( = ?auto_12855 ?auto_12858 ) ) ( not ( = ?auto_12856 ?auto_12857 ) ) ( not ( = ?auto_12856 ?auto_12858 ) ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( HOLDING ?auto_12859 ) ( not ( = ?auto_12855 ?auto_12859 ) ) ( not ( = ?auto_12856 ?auto_12859 ) ) ( not ( = ?auto_12857 ?auto_12859 ) ) ( not ( = ?auto_12858 ?auto_12859 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12859 )
      ( MAKE-3PILE ?auto_12855 ?auto_12856 ?auto_12857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12860 - BLOCK
      ?auto_12861 - BLOCK
      ?auto_12862 - BLOCK
    )
    :vars
    (
      ?auto_12863 - BLOCK
      ?auto_12864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12863 ?auto_12862 ) ( ON-TABLE ?auto_12860 ) ( ON ?auto_12861 ?auto_12860 ) ( ON ?auto_12862 ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12861 ) ) ( not ( = ?auto_12860 ?auto_12862 ) ) ( not ( = ?auto_12860 ?auto_12863 ) ) ( not ( = ?auto_12861 ?auto_12862 ) ) ( not ( = ?auto_12861 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12863 ) ) ( not ( = ?auto_12860 ?auto_12864 ) ) ( not ( = ?auto_12861 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( ON ?auto_12864 ?auto_12863 ) ( CLEAR ?auto_12864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12860 ?auto_12861 ?auto_12862 ?auto_12863 )
      ( MAKE-3PILE ?auto_12860 ?auto_12861 ?auto_12862 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12867 - BLOCK
      ?auto_12868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12868 ) ( CLEAR ?auto_12867 ) ( ON-TABLE ?auto_12867 ) ( not ( = ?auto_12867 ?auto_12868 ) ) )
    :subtasks
    ( ( !STACK ?auto_12868 ?auto_12867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12869 - BLOCK
      ?auto_12870 - BLOCK
    )
    :vars
    (
      ?auto_12871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12869 ) ( ON-TABLE ?auto_12869 ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( ON ?auto_12870 ?auto_12871 ) ( CLEAR ?auto_12870 ) ( HAND-EMPTY ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12870 ?auto_12871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12870 ?auto_12871 )
      ( MAKE-2PILE ?auto_12869 ?auto_12870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12872 - BLOCK
      ?auto_12873 - BLOCK
    )
    :vars
    (
      ?auto_12874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12872 ?auto_12873 ) ) ( ON ?auto_12873 ?auto_12874 ) ( CLEAR ?auto_12873 ) ( not ( = ?auto_12872 ?auto_12874 ) ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( HOLDING ?auto_12872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12872 )
      ( MAKE-2PILE ?auto_12872 ?auto_12873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12875 - BLOCK
      ?auto_12876 - BLOCK
    )
    :vars
    (
      ?auto_12877 - BLOCK
      ?auto_12878 - BLOCK
      ?auto_12879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12875 ?auto_12876 ) ) ( ON ?auto_12876 ?auto_12877 ) ( not ( = ?auto_12875 ?auto_12877 ) ) ( not ( = ?auto_12876 ?auto_12877 ) ) ( ON ?auto_12875 ?auto_12876 ) ( CLEAR ?auto_12875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12878 ) ( ON ?auto_12879 ?auto_12878 ) ( ON ?auto_12877 ?auto_12879 ) ( not ( = ?auto_12878 ?auto_12879 ) ) ( not ( = ?auto_12878 ?auto_12877 ) ) ( not ( = ?auto_12878 ?auto_12876 ) ) ( not ( = ?auto_12878 ?auto_12875 ) ) ( not ( = ?auto_12879 ?auto_12877 ) ) ( not ( = ?auto_12879 ?auto_12876 ) ) ( not ( = ?auto_12879 ?auto_12875 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12878 ?auto_12879 ?auto_12877 ?auto_12876 )
      ( MAKE-2PILE ?auto_12875 ?auto_12876 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12882 - BLOCK
      ?auto_12883 - BLOCK
    )
    :vars
    (
      ?auto_12884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12884 ?auto_12883 ) ( CLEAR ?auto_12884 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12882 ) ( ON ?auto_12883 ?auto_12882 ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12884 ) ) ( not ( = ?auto_12883 ?auto_12884 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12884 ?auto_12883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12885 - BLOCK
      ?auto_12886 - BLOCK
    )
    :vars
    (
      ?auto_12887 - BLOCK
      ?auto_12888 - BLOCK
      ?auto_12889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12887 ?auto_12886 ) ( CLEAR ?auto_12887 ) ( ON-TABLE ?auto_12885 ) ( ON ?auto_12886 ?auto_12885 ) ( not ( = ?auto_12885 ?auto_12886 ) ) ( not ( = ?auto_12885 ?auto_12887 ) ) ( not ( = ?auto_12886 ?auto_12887 ) ) ( HOLDING ?auto_12888 ) ( CLEAR ?auto_12889 ) ( not ( = ?auto_12885 ?auto_12888 ) ) ( not ( = ?auto_12885 ?auto_12889 ) ) ( not ( = ?auto_12886 ?auto_12888 ) ) ( not ( = ?auto_12886 ?auto_12889 ) ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12889 ) ) ( not ( = ?auto_12888 ?auto_12889 ) ) )
    :subtasks
    ( ( !STACK ?auto_12888 ?auto_12889 )
      ( MAKE-2PILE ?auto_12885 ?auto_12886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12890 - BLOCK
      ?auto_12891 - BLOCK
    )
    :vars
    (
      ?auto_12892 - BLOCK
      ?auto_12894 - BLOCK
      ?auto_12893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12892 ?auto_12891 ) ( ON-TABLE ?auto_12890 ) ( ON ?auto_12891 ?auto_12890 ) ( not ( = ?auto_12890 ?auto_12891 ) ) ( not ( = ?auto_12890 ?auto_12892 ) ) ( not ( = ?auto_12891 ?auto_12892 ) ) ( CLEAR ?auto_12894 ) ( not ( = ?auto_12890 ?auto_12893 ) ) ( not ( = ?auto_12890 ?auto_12894 ) ) ( not ( = ?auto_12891 ?auto_12893 ) ) ( not ( = ?auto_12891 ?auto_12894 ) ) ( not ( = ?auto_12892 ?auto_12893 ) ) ( not ( = ?auto_12892 ?auto_12894 ) ) ( not ( = ?auto_12893 ?auto_12894 ) ) ( ON ?auto_12893 ?auto_12892 ) ( CLEAR ?auto_12893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12890 ?auto_12891 ?auto_12892 )
      ( MAKE-2PILE ?auto_12890 ?auto_12891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12895 - BLOCK
      ?auto_12896 - BLOCK
    )
    :vars
    (
      ?auto_12897 - BLOCK
      ?auto_12899 - BLOCK
      ?auto_12898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12897 ?auto_12896 ) ( ON-TABLE ?auto_12895 ) ( ON ?auto_12896 ?auto_12895 ) ( not ( = ?auto_12895 ?auto_12896 ) ) ( not ( = ?auto_12895 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( not ( = ?auto_12895 ?auto_12899 ) ) ( not ( = ?auto_12895 ?auto_12898 ) ) ( not ( = ?auto_12896 ?auto_12899 ) ) ( not ( = ?auto_12896 ?auto_12898 ) ) ( not ( = ?auto_12897 ?auto_12899 ) ) ( not ( = ?auto_12897 ?auto_12898 ) ) ( not ( = ?auto_12899 ?auto_12898 ) ) ( ON ?auto_12899 ?auto_12897 ) ( CLEAR ?auto_12899 ) ( HOLDING ?auto_12898 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12898 )
      ( MAKE-2PILE ?auto_12895 ?auto_12896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12900 - BLOCK
      ?auto_12901 - BLOCK
    )
    :vars
    (
      ?auto_12903 - BLOCK
      ?auto_12904 - BLOCK
      ?auto_12902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12903 ?auto_12901 ) ( ON-TABLE ?auto_12900 ) ( ON ?auto_12901 ?auto_12900 ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12903 ) ) ( not ( = ?auto_12901 ?auto_12903 ) ) ( not ( = ?auto_12900 ?auto_12904 ) ) ( not ( = ?auto_12900 ?auto_12902 ) ) ( not ( = ?auto_12901 ?auto_12904 ) ) ( not ( = ?auto_12901 ?auto_12902 ) ) ( not ( = ?auto_12903 ?auto_12904 ) ) ( not ( = ?auto_12903 ?auto_12902 ) ) ( not ( = ?auto_12904 ?auto_12902 ) ) ( ON ?auto_12904 ?auto_12903 ) ( ON ?auto_12902 ?auto_12904 ) ( CLEAR ?auto_12902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12900 ?auto_12901 ?auto_12903 ?auto_12904 )
      ( MAKE-2PILE ?auto_12900 ?auto_12901 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12908 - BLOCK
      ?auto_12909 - BLOCK
      ?auto_12910 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12910 ) ( CLEAR ?auto_12909 ) ( ON-TABLE ?auto_12908 ) ( ON ?auto_12909 ?auto_12908 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12910 ) ) )
    :subtasks
    ( ( !STACK ?auto_12910 ?auto_12909 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12911 - BLOCK
      ?auto_12912 - BLOCK
      ?auto_12913 - BLOCK
    )
    :vars
    (
      ?auto_12914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12912 ) ( ON-TABLE ?auto_12911 ) ( ON ?auto_12912 ?auto_12911 ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( ON ?auto_12913 ?auto_12914 ) ( CLEAR ?auto_12913 ) ( HAND-EMPTY ) ( not ( = ?auto_12911 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12914 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12913 ?auto_12914 )
      ( MAKE-3PILE ?auto_12911 ?auto_12912 ?auto_12913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12915 - BLOCK
      ?auto_12916 - BLOCK
      ?auto_12917 - BLOCK
    )
    :vars
    (
      ?auto_12918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12915 ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( ON ?auto_12917 ?auto_12918 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( HOLDING ?auto_12916 ) ( CLEAR ?auto_12915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12915 ?auto_12916 )
      ( MAKE-3PILE ?auto_12915 ?auto_12916 ?auto_12917 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12919 - BLOCK
      ?auto_12920 - BLOCK
      ?auto_12921 - BLOCK
    )
    :vars
    (
      ?auto_12922 - BLOCK
      ?auto_12923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12919 ) ( not ( = ?auto_12919 ?auto_12920 ) ) ( not ( = ?auto_12919 ?auto_12921 ) ) ( not ( = ?auto_12920 ?auto_12921 ) ) ( ON ?auto_12921 ?auto_12922 ) ( not ( = ?auto_12919 ?auto_12922 ) ) ( not ( = ?auto_12920 ?auto_12922 ) ) ( not ( = ?auto_12921 ?auto_12922 ) ) ( CLEAR ?auto_12919 ) ( ON ?auto_12920 ?auto_12921 ) ( CLEAR ?auto_12920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12923 ) ( ON ?auto_12922 ?auto_12923 ) ( not ( = ?auto_12923 ?auto_12922 ) ) ( not ( = ?auto_12923 ?auto_12921 ) ) ( not ( = ?auto_12923 ?auto_12920 ) ) ( not ( = ?auto_12919 ?auto_12923 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12923 ?auto_12922 ?auto_12921 )
      ( MAKE-3PILE ?auto_12919 ?auto_12920 ?auto_12921 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12924 - BLOCK
      ?auto_12925 - BLOCK
      ?auto_12926 - BLOCK
    )
    :vars
    (
      ?auto_12927 - BLOCK
      ?auto_12928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12924 ?auto_12925 ) ) ( not ( = ?auto_12924 ?auto_12926 ) ) ( not ( = ?auto_12925 ?auto_12926 ) ) ( ON ?auto_12926 ?auto_12927 ) ( not ( = ?auto_12924 ?auto_12927 ) ) ( not ( = ?auto_12925 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( ON ?auto_12925 ?auto_12926 ) ( CLEAR ?auto_12925 ) ( ON-TABLE ?auto_12928 ) ( ON ?auto_12927 ?auto_12928 ) ( not ( = ?auto_12928 ?auto_12927 ) ) ( not ( = ?auto_12928 ?auto_12926 ) ) ( not ( = ?auto_12928 ?auto_12925 ) ) ( not ( = ?auto_12924 ?auto_12928 ) ) ( HOLDING ?auto_12924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12924 )
      ( MAKE-3PILE ?auto_12924 ?auto_12925 ?auto_12926 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12929 - BLOCK
      ?auto_12930 - BLOCK
      ?auto_12931 - BLOCK
    )
    :vars
    (
      ?auto_12932 - BLOCK
      ?auto_12933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12929 ?auto_12930 ) ) ( not ( = ?auto_12929 ?auto_12931 ) ) ( not ( = ?auto_12930 ?auto_12931 ) ) ( ON ?auto_12931 ?auto_12932 ) ( not ( = ?auto_12929 ?auto_12932 ) ) ( not ( = ?auto_12930 ?auto_12932 ) ) ( not ( = ?auto_12931 ?auto_12932 ) ) ( ON ?auto_12930 ?auto_12931 ) ( ON-TABLE ?auto_12933 ) ( ON ?auto_12932 ?auto_12933 ) ( not ( = ?auto_12933 ?auto_12932 ) ) ( not ( = ?auto_12933 ?auto_12931 ) ) ( not ( = ?auto_12933 ?auto_12930 ) ) ( not ( = ?auto_12929 ?auto_12933 ) ) ( ON ?auto_12929 ?auto_12930 ) ( CLEAR ?auto_12929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12933 ?auto_12932 ?auto_12931 ?auto_12930 )
      ( MAKE-3PILE ?auto_12929 ?auto_12930 ?auto_12931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12935 - BLOCK
    )
    :vars
    (
      ?auto_12936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12936 ?auto_12935 ) ( CLEAR ?auto_12936 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12935 ) ( not ( = ?auto_12935 ?auto_12936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12936 ?auto_12935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12937 - BLOCK
    )
    :vars
    (
      ?auto_12938 - BLOCK
      ?auto_12939 - BLOCK
      ?auto_12940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12938 ?auto_12937 ) ( CLEAR ?auto_12938 ) ( ON-TABLE ?auto_12937 ) ( not ( = ?auto_12937 ?auto_12938 ) ) ( HOLDING ?auto_12939 ) ( CLEAR ?auto_12940 ) ( not ( = ?auto_12937 ?auto_12939 ) ) ( not ( = ?auto_12937 ?auto_12940 ) ) ( not ( = ?auto_12938 ?auto_12939 ) ) ( not ( = ?auto_12938 ?auto_12940 ) ) ( not ( = ?auto_12939 ?auto_12940 ) ) )
    :subtasks
    ( ( !STACK ?auto_12939 ?auto_12940 )
      ( MAKE-1PILE ?auto_12937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12941 - BLOCK
    )
    :vars
    (
      ?auto_12942 - BLOCK
      ?auto_12944 - BLOCK
      ?auto_12943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12942 ?auto_12941 ) ( ON-TABLE ?auto_12941 ) ( not ( = ?auto_12941 ?auto_12942 ) ) ( CLEAR ?auto_12944 ) ( not ( = ?auto_12941 ?auto_12943 ) ) ( not ( = ?auto_12941 ?auto_12944 ) ) ( not ( = ?auto_12942 ?auto_12943 ) ) ( not ( = ?auto_12942 ?auto_12944 ) ) ( not ( = ?auto_12943 ?auto_12944 ) ) ( ON ?auto_12943 ?auto_12942 ) ( CLEAR ?auto_12943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12941 ?auto_12942 )
      ( MAKE-1PILE ?auto_12941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12945 - BLOCK
    )
    :vars
    (
      ?auto_12947 - BLOCK
      ?auto_12946 - BLOCK
      ?auto_12948 - BLOCK
      ?auto_12949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12947 ?auto_12945 ) ( ON-TABLE ?auto_12945 ) ( not ( = ?auto_12945 ?auto_12947 ) ) ( not ( = ?auto_12945 ?auto_12946 ) ) ( not ( = ?auto_12945 ?auto_12948 ) ) ( not ( = ?auto_12947 ?auto_12946 ) ) ( not ( = ?auto_12947 ?auto_12948 ) ) ( not ( = ?auto_12946 ?auto_12948 ) ) ( ON ?auto_12946 ?auto_12947 ) ( CLEAR ?auto_12946 ) ( HOLDING ?auto_12948 ) ( CLEAR ?auto_12949 ) ( ON-TABLE ?auto_12949 ) ( not ( = ?auto_12949 ?auto_12948 ) ) ( not ( = ?auto_12945 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12949 ) ) ( not ( = ?auto_12946 ?auto_12949 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12949 ?auto_12948 )
      ( MAKE-1PILE ?auto_12945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12950 - BLOCK
    )
    :vars
    (
      ?auto_12952 - BLOCK
      ?auto_12954 - BLOCK
      ?auto_12951 - BLOCK
      ?auto_12953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12952 ?auto_12950 ) ( ON-TABLE ?auto_12950 ) ( not ( = ?auto_12950 ?auto_12952 ) ) ( not ( = ?auto_12950 ?auto_12954 ) ) ( not ( = ?auto_12950 ?auto_12951 ) ) ( not ( = ?auto_12952 ?auto_12954 ) ) ( not ( = ?auto_12952 ?auto_12951 ) ) ( not ( = ?auto_12954 ?auto_12951 ) ) ( ON ?auto_12954 ?auto_12952 ) ( CLEAR ?auto_12953 ) ( ON-TABLE ?auto_12953 ) ( not ( = ?auto_12953 ?auto_12951 ) ) ( not ( = ?auto_12950 ?auto_12953 ) ) ( not ( = ?auto_12952 ?auto_12953 ) ) ( not ( = ?auto_12954 ?auto_12953 ) ) ( ON ?auto_12951 ?auto_12954 ) ( CLEAR ?auto_12951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12950 ?auto_12952 ?auto_12954 )
      ( MAKE-1PILE ?auto_12950 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12955 - BLOCK
    )
    :vars
    (
      ?auto_12957 - BLOCK
      ?auto_12958 - BLOCK
      ?auto_12956 - BLOCK
      ?auto_12959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12957 ?auto_12955 ) ( ON-TABLE ?auto_12955 ) ( not ( = ?auto_12955 ?auto_12957 ) ) ( not ( = ?auto_12955 ?auto_12958 ) ) ( not ( = ?auto_12955 ?auto_12956 ) ) ( not ( = ?auto_12957 ?auto_12958 ) ) ( not ( = ?auto_12957 ?auto_12956 ) ) ( not ( = ?auto_12958 ?auto_12956 ) ) ( ON ?auto_12958 ?auto_12957 ) ( not ( = ?auto_12959 ?auto_12956 ) ) ( not ( = ?auto_12955 ?auto_12959 ) ) ( not ( = ?auto_12957 ?auto_12959 ) ) ( not ( = ?auto_12958 ?auto_12959 ) ) ( ON ?auto_12956 ?auto_12958 ) ( CLEAR ?auto_12956 ) ( HOLDING ?auto_12959 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12959 )
      ( MAKE-1PILE ?auto_12955 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12960 - BLOCK
    )
    :vars
    (
      ?auto_12961 - BLOCK
      ?auto_12964 - BLOCK
      ?auto_12962 - BLOCK
      ?auto_12963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12961 ?auto_12960 ) ( ON-TABLE ?auto_12960 ) ( not ( = ?auto_12960 ?auto_12961 ) ) ( not ( = ?auto_12960 ?auto_12964 ) ) ( not ( = ?auto_12960 ?auto_12962 ) ) ( not ( = ?auto_12961 ?auto_12964 ) ) ( not ( = ?auto_12961 ?auto_12962 ) ) ( not ( = ?auto_12964 ?auto_12962 ) ) ( ON ?auto_12964 ?auto_12961 ) ( not ( = ?auto_12963 ?auto_12962 ) ) ( not ( = ?auto_12960 ?auto_12963 ) ) ( not ( = ?auto_12961 ?auto_12963 ) ) ( not ( = ?auto_12964 ?auto_12963 ) ) ( ON ?auto_12962 ?auto_12964 ) ( ON ?auto_12963 ?auto_12962 ) ( CLEAR ?auto_12963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12960 ?auto_12961 ?auto_12964 ?auto_12962 )
      ( MAKE-1PILE ?auto_12960 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12969 - BLOCK
      ?auto_12970 - BLOCK
      ?auto_12971 - BLOCK
      ?auto_12972 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12972 ) ( CLEAR ?auto_12971 ) ( ON-TABLE ?auto_12969 ) ( ON ?auto_12970 ?auto_12969 ) ( ON ?auto_12971 ?auto_12970 ) ( not ( = ?auto_12969 ?auto_12970 ) ) ( not ( = ?auto_12969 ?auto_12971 ) ) ( not ( = ?auto_12969 ?auto_12972 ) ) ( not ( = ?auto_12970 ?auto_12971 ) ) ( not ( = ?auto_12970 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12972 ) ) )
    :subtasks
    ( ( !STACK ?auto_12972 ?auto_12971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12973 - BLOCK
      ?auto_12974 - BLOCK
      ?auto_12975 - BLOCK
      ?auto_12976 - BLOCK
    )
    :vars
    (
      ?auto_12977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12975 ) ( ON-TABLE ?auto_12973 ) ( ON ?auto_12974 ?auto_12973 ) ( ON ?auto_12975 ?auto_12974 ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( not ( = ?auto_12973 ?auto_12975 ) ) ( not ( = ?auto_12973 ?auto_12976 ) ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( not ( = ?auto_12974 ?auto_12976 ) ) ( not ( = ?auto_12975 ?auto_12976 ) ) ( ON ?auto_12976 ?auto_12977 ) ( CLEAR ?auto_12976 ) ( HAND-EMPTY ) ( not ( = ?auto_12973 ?auto_12977 ) ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12977 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12976 ?auto_12977 )
      ( MAKE-4PILE ?auto_12973 ?auto_12974 ?auto_12975 ?auto_12976 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12978 - BLOCK
      ?auto_12979 - BLOCK
      ?auto_12980 - BLOCK
      ?auto_12981 - BLOCK
    )
    :vars
    (
      ?auto_12982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12978 ) ( ON ?auto_12979 ?auto_12978 ) ( not ( = ?auto_12978 ?auto_12979 ) ) ( not ( = ?auto_12978 ?auto_12980 ) ) ( not ( = ?auto_12978 ?auto_12981 ) ) ( not ( = ?auto_12979 ?auto_12980 ) ) ( not ( = ?auto_12979 ?auto_12981 ) ) ( not ( = ?auto_12980 ?auto_12981 ) ) ( ON ?auto_12981 ?auto_12982 ) ( CLEAR ?auto_12981 ) ( not ( = ?auto_12978 ?auto_12982 ) ) ( not ( = ?auto_12979 ?auto_12982 ) ) ( not ( = ?auto_12980 ?auto_12982 ) ) ( not ( = ?auto_12981 ?auto_12982 ) ) ( HOLDING ?auto_12980 ) ( CLEAR ?auto_12979 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12978 ?auto_12979 ?auto_12980 )
      ( MAKE-4PILE ?auto_12978 ?auto_12979 ?auto_12980 ?auto_12981 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12983 - BLOCK
      ?auto_12984 - BLOCK
      ?auto_12985 - BLOCK
      ?auto_12986 - BLOCK
    )
    :vars
    (
      ?auto_12987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12983 ) ( ON ?auto_12984 ?auto_12983 ) ( not ( = ?auto_12983 ?auto_12984 ) ) ( not ( = ?auto_12983 ?auto_12985 ) ) ( not ( = ?auto_12983 ?auto_12986 ) ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( not ( = ?auto_12984 ?auto_12986 ) ) ( not ( = ?auto_12985 ?auto_12986 ) ) ( ON ?auto_12986 ?auto_12987 ) ( not ( = ?auto_12983 ?auto_12987 ) ) ( not ( = ?auto_12984 ?auto_12987 ) ) ( not ( = ?auto_12985 ?auto_12987 ) ) ( not ( = ?auto_12986 ?auto_12987 ) ) ( CLEAR ?auto_12984 ) ( ON ?auto_12985 ?auto_12986 ) ( CLEAR ?auto_12985 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12987 ?auto_12986 )
      ( MAKE-4PILE ?auto_12983 ?auto_12984 ?auto_12985 ?auto_12986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12988 - BLOCK
      ?auto_12989 - BLOCK
      ?auto_12990 - BLOCK
      ?auto_12991 - BLOCK
    )
    :vars
    (
      ?auto_12992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12988 ) ( not ( = ?auto_12988 ?auto_12989 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12988 ?auto_12991 ) ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( not ( = ?auto_12989 ?auto_12991 ) ) ( not ( = ?auto_12990 ?auto_12991 ) ) ( ON ?auto_12991 ?auto_12992 ) ( not ( = ?auto_12988 ?auto_12992 ) ) ( not ( = ?auto_12989 ?auto_12992 ) ) ( not ( = ?auto_12990 ?auto_12992 ) ) ( not ( = ?auto_12991 ?auto_12992 ) ) ( ON ?auto_12990 ?auto_12991 ) ( CLEAR ?auto_12990 ) ( ON-TABLE ?auto_12992 ) ( HOLDING ?auto_12989 ) ( CLEAR ?auto_12988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12988 ?auto_12989 )
      ( MAKE-4PILE ?auto_12988 ?auto_12989 ?auto_12990 ?auto_12991 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12993 - BLOCK
      ?auto_12994 - BLOCK
      ?auto_12995 - BLOCK
      ?auto_12996 - BLOCK
    )
    :vars
    (
      ?auto_12997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12993 ) ( not ( = ?auto_12993 ?auto_12994 ) ) ( not ( = ?auto_12993 ?auto_12995 ) ) ( not ( = ?auto_12993 ?auto_12996 ) ) ( not ( = ?auto_12994 ?auto_12995 ) ) ( not ( = ?auto_12994 ?auto_12996 ) ) ( not ( = ?auto_12995 ?auto_12996 ) ) ( ON ?auto_12996 ?auto_12997 ) ( not ( = ?auto_12993 ?auto_12997 ) ) ( not ( = ?auto_12994 ?auto_12997 ) ) ( not ( = ?auto_12995 ?auto_12997 ) ) ( not ( = ?auto_12996 ?auto_12997 ) ) ( ON ?auto_12995 ?auto_12996 ) ( ON-TABLE ?auto_12997 ) ( CLEAR ?auto_12993 ) ( ON ?auto_12994 ?auto_12995 ) ( CLEAR ?auto_12994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12997 ?auto_12996 ?auto_12995 )
      ( MAKE-4PILE ?auto_12993 ?auto_12994 ?auto_12995 ?auto_12996 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12998 - BLOCK
      ?auto_12999 - BLOCK
      ?auto_13000 - BLOCK
      ?auto_13001 - BLOCK
    )
    :vars
    (
      ?auto_13002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12998 ?auto_12999 ) ) ( not ( = ?auto_12998 ?auto_13000 ) ) ( not ( = ?auto_12998 ?auto_13001 ) ) ( not ( = ?auto_12999 ?auto_13000 ) ) ( not ( = ?auto_12999 ?auto_13001 ) ) ( not ( = ?auto_13000 ?auto_13001 ) ) ( ON ?auto_13001 ?auto_13002 ) ( not ( = ?auto_12998 ?auto_13002 ) ) ( not ( = ?auto_12999 ?auto_13002 ) ) ( not ( = ?auto_13000 ?auto_13002 ) ) ( not ( = ?auto_13001 ?auto_13002 ) ) ( ON ?auto_13000 ?auto_13001 ) ( ON-TABLE ?auto_13002 ) ( ON ?auto_12999 ?auto_13000 ) ( CLEAR ?auto_12999 ) ( HOLDING ?auto_12998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12998 )
      ( MAKE-4PILE ?auto_12998 ?auto_12999 ?auto_13000 ?auto_13001 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13003 - BLOCK
      ?auto_13004 - BLOCK
      ?auto_13005 - BLOCK
      ?auto_13006 - BLOCK
    )
    :vars
    (
      ?auto_13007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13003 ?auto_13005 ) ) ( not ( = ?auto_13003 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13005 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13005 ?auto_13006 ) ) ( ON ?auto_13006 ?auto_13007 ) ( not ( = ?auto_13003 ?auto_13007 ) ) ( not ( = ?auto_13004 ?auto_13007 ) ) ( not ( = ?auto_13005 ?auto_13007 ) ) ( not ( = ?auto_13006 ?auto_13007 ) ) ( ON ?auto_13005 ?auto_13006 ) ( ON-TABLE ?auto_13007 ) ( ON ?auto_13004 ?auto_13005 ) ( ON ?auto_13003 ?auto_13004 ) ( CLEAR ?auto_13003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13007 ?auto_13006 ?auto_13005 ?auto_13004 )
      ( MAKE-4PILE ?auto_13003 ?auto_13004 ?auto_13005 ?auto_13006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13011 - BLOCK
      ?auto_13012 - BLOCK
      ?auto_13013 - BLOCK
    )
    :vars
    (
      ?auto_13014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13014 ?auto_13013 ) ( CLEAR ?auto_13014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13011 ) ( ON ?auto_13012 ?auto_13011 ) ( ON ?auto_13013 ?auto_13012 ) ( not ( = ?auto_13011 ?auto_13012 ) ) ( not ( = ?auto_13011 ?auto_13013 ) ) ( not ( = ?auto_13011 ?auto_13014 ) ) ( not ( = ?auto_13012 ?auto_13013 ) ) ( not ( = ?auto_13012 ?auto_13014 ) ) ( not ( = ?auto_13013 ?auto_13014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13014 ?auto_13013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13024 - BLOCK
      ?auto_13025 - BLOCK
      ?auto_13026 - BLOCK
    )
    :vars
    (
      ?auto_13027 - BLOCK
      ?auto_13028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13024 ) ( ON ?auto_13025 ?auto_13024 ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13026 ) ) ( not ( = ?auto_13024 ?auto_13027 ) ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13025 ?auto_13027 ) ) ( not ( = ?auto_13026 ?auto_13027 ) ) ( ON ?auto_13027 ?auto_13028 ) ( CLEAR ?auto_13027 ) ( not ( = ?auto_13024 ?auto_13028 ) ) ( not ( = ?auto_13025 ?auto_13028 ) ) ( not ( = ?auto_13026 ?auto_13028 ) ) ( not ( = ?auto_13027 ?auto_13028 ) ) ( HOLDING ?auto_13026 ) ( CLEAR ?auto_13025 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13024 ?auto_13025 ?auto_13026 ?auto_13027 )
      ( MAKE-3PILE ?auto_13024 ?auto_13025 ?auto_13026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13029 - BLOCK
      ?auto_13030 - BLOCK
      ?auto_13031 - BLOCK
    )
    :vars
    (
      ?auto_13033 - BLOCK
      ?auto_13032 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13029 ) ( ON ?auto_13030 ?auto_13029 ) ( not ( = ?auto_13029 ?auto_13030 ) ) ( not ( = ?auto_13029 ?auto_13031 ) ) ( not ( = ?auto_13029 ?auto_13033 ) ) ( not ( = ?auto_13030 ?auto_13031 ) ) ( not ( = ?auto_13030 ?auto_13033 ) ) ( not ( = ?auto_13031 ?auto_13033 ) ) ( ON ?auto_13033 ?auto_13032 ) ( not ( = ?auto_13029 ?auto_13032 ) ) ( not ( = ?auto_13030 ?auto_13032 ) ) ( not ( = ?auto_13031 ?auto_13032 ) ) ( not ( = ?auto_13033 ?auto_13032 ) ) ( CLEAR ?auto_13030 ) ( ON ?auto_13031 ?auto_13033 ) ( CLEAR ?auto_13031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13032 ?auto_13033 )
      ( MAKE-3PILE ?auto_13029 ?auto_13030 ?auto_13031 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13034 - BLOCK
      ?auto_13035 - BLOCK
      ?auto_13036 - BLOCK
    )
    :vars
    (
      ?auto_13038 - BLOCK
      ?auto_13037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13034 ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13038 ) ) ( not ( = ?auto_13035 ?auto_13036 ) ) ( not ( = ?auto_13035 ?auto_13038 ) ) ( not ( = ?auto_13036 ?auto_13038 ) ) ( ON ?auto_13038 ?auto_13037 ) ( not ( = ?auto_13034 ?auto_13037 ) ) ( not ( = ?auto_13035 ?auto_13037 ) ) ( not ( = ?auto_13036 ?auto_13037 ) ) ( not ( = ?auto_13038 ?auto_13037 ) ) ( ON ?auto_13036 ?auto_13038 ) ( CLEAR ?auto_13036 ) ( ON-TABLE ?auto_13037 ) ( HOLDING ?auto_13035 ) ( CLEAR ?auto_13034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13034 ?auto_13035 )
      ( MAKE-3PILE ?auto_13034 ?auto_13035 ?auto_13036 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13039 - BLOCK
      ?auto_13040 - BLOCK
      ?auto_13041 - BLOCK
    )
    :vars
    (
      ?auto_13043 - BLOCK
      ?auto_13042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13039 ) ( not ( = ?auto_13039 ?auto_13040 ) ) ( not ( = ?auto_13039 ?auto_13041 ) ) ( not ( = ?auto_13039 ?auto_13043 ) ) ( not ( = ?auto_13040 ?auto_13041 ) ) ( not ( = ?auto_13040 ?auto_13043 ) ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( ON ?auto_13043 ?auto_13042 ) ( not ( = ?auto_13039 ?auto_13042 ) ) ( not ( = ?auto_13040 ?auto_13042 ) ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( not ( = ?auto_13043 ?auto_13042 ) ) ( ON ?auto_13041 ?auto_13043 ) ( ON-TABLE ?auto_13042 ) ( CLEAR ?auto_13039 ) ( ON ?auto_13040 ?auto_13041 ) ( CLEAR ?auto_13040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13042 ?auto_13043 ?auto_13041 )
      ( MAKE-3PILE ?auto_13039 ?auto_13040 ?auto_13041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13044 - BLOCK
      ?auto_13045 - BLOCK
      ?auto_13046 - BLOCK
    )
    :vars
    (
      ?auto_13048 - BLOCK
      ?auto_13047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13044 ?auto_13045 ) ) ( not ( = ?auto_13044 ?auto_13046 ) ) ( not ( = ?auto_13044 ?auto_13048 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( not ( = ?auto_13045 ?auto_13048 ) ) ( not ( = ?auto_13046 ?auto_13048 ) ) ( ON ?auto_13048 ?auto_13047 ) ( not ( = ?auto_13044 ?auto_13047 ) ) ( not ( = ?auto_13045 ?auto_13047 ) ) ( not ( = ?auto_13046 ?auto_13047 ) ) ( not ( = ?auto_13048 ?auto_13047 ) ) ( ON ?auto_13046 ?auto_13048 ) ( ON-TABLE ?auto_13047 ) ( ON ?auto_13045 ?auto_13046 ) ( CLEAR ?auto_13045 ) ( HOLDING ?auto_13044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13044 )
      ( MAKE-3PILE ?auto_13044 ?auto_13045 ?auto_13046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13049 - BLOCK
      ?auto_13050 - BLOCK
      ?auto_13051 - BLOCK
    )
    :vars
    (
      ?auto_13052 - BLOCK
      ?auto_13053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13049 ?auto_13050 ) ) ( not ( = ?auto_13049 ?auto_13051 ) ) ( not ( = ?auto_13049 ?auto_13052 ) ) ( not ( = ?auto_13050 ?auto_13051 ) ) ( not ( = ?auto_13050 ?auto_13052 ) ) ( not ( = ?auto_13051 ?auto_13052 ) ) ( ON ?auto_13052 ?auto_13053 ) ( not ( = ?auto_13049 ?auto_13053 ) ) ( not ( = ?auto_13050 ?auto_13053 ) ) ( not ( = ?auto_13051 ?auto_13053 ) ) ( not ( = ?auto_13052 ?auto_13053 ) ) ( ON ?auto_13051 ?auto_13052 ) ( ON-TABLE ?auto_13053 ) ( ON ?auto_13050 ?auto_13051 ) ( ON ?auto_13049 ?auto_13050 ) ( CLEAR ?auto_13049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13053 ?auto_13052 ?auto_13051 ?auto_13050 )
      ( MAKE-3PILE ?auto_13049 ?auto_13050 ?auto_13051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13055 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13055 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13056 - BLOCK
    )
    :vars
    (
      ?auto_13057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13056 ?auto_13057 ) ( CLEAR ?auto_13056 ) ( HAND-EMPTY ) ( not ( = ?auto_13056 ?auto_13057 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13056 ?auto_13057 )
      ( MAKE-1PILE ?auto_13056 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13058 - BLOCK
    )
    :vars
    (
      ?auto_13059 - BLOCK
      ?auto_13061 - BLOCK
      ?auto_13060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13058 ?auto_13059 ) ) ( HOLDING ?auto_13058 ) ( CLEAR ?auto_13059 ) ( ON-TABLE ?auto_13061 ) ( ON ?auto_13060 ?auto_13061 ) ( ON ?auto_13059 ?auto_13060 ) ( not ( = ?auto_13061 ?auto_13060 ) ) ( not ( = ?auto_13061 ?auto_13059 ) ) ( not ( = ?auto_13061 ?auto_13058 ) ) ( not ( = ?auto_13060 ?auto_13059 ) ) ( not ( = ?auto_13060 ?auto_13058 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13061 ?auto_13060 ?auto_13059 ?auto_13058 )
      ( MAKE-1PILE ?auto_13058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13062 - BLOCK
    )
    :vars
    (
      ?auto_13063 - BLOCK
      ?auto_13064 - BLOCK
      ?auto_13065 - BLOCK
      ?auto_13066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13062 ?auto_13063 ) ) ( CLEAR ?auto_13063 ) ( ON-TABLE ?auto_13064 ) ( ON ?auto_13065 ?auto_13064 ) ( ON ?auto_13063 ?auto_13065 ) ( not ( = ?auto_13064 ?auto_13065 ) ) ( not ( = ?auto_13064 ?auto_13063 ) ) ( not ( = ?auto_13064 ?auto_13062 ) ) ( not ( = ?auto_13065 ?auto_13063 ) ) ( not ( = ?auto_13065 ?auto_13062 ) ) ( ON ?auto_13062 ?auto_13066 ) ( CLEAR ?auto_13062 ) ( HAND-EMPTY ) ( not ( = ?auto_13062 ?auto_13066 ) ) ( not ( = ?auto_13063 ?auto_13066 ) ) ( not ( = ?auto_13064 ?auto_13066 ) ) ( not ( = ?auto_13065 ?auto_13066 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13062 ?auto_13066 )
      ( MAKE-1PILE ?auto_13062 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13067 - BLOCK
    )
    :vars
    (
      ?auto_13071 - BLOCK
      ?auto_13068 - BLOCK
      ?auto_13069 - BLOCK
      ?auto_13070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13067 ?auto_13071 ) ) ( ON-TABLE ?auto_13068 ) ( ON ?auto_13069 ?auto_13068 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13067 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13067 ) ) ( ON ?auto_13067 ?auto_13070 ) ( CLEAR ?auto_13067 ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( not ( = ?auto_13071 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( HOLDING ?auto_13071 ) ( CLEAR ?auto_13069 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13068 ?auto_13069 ?auto_13071 )
      ( MAKE-1PILE ?auto_13067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13072 - BLOCK
    )
    :vars
    (
      ?auto_13076 - BLOCK
      ?auto_13075 - BLOCK
      ?auto_13073 - BLOCK
      ?auto_13074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13072 ?auto_13076 ) ) ( ON-TABLE ?auto_13075 ) ( ON ?auto_13073 ?auto_13075 ) ( not ( = ?auto_13075 ?auto_13073 ) ) ( not ( = ?auto_13075 ?auto_13076 ) ) ( not ( = ?auto_13075 ?auto_13072 ) ) ( not ( = ?auto_13073 ?auto_13076 ) ) ( not ( = ?auto_13073 ?auto_13072 ) ) ( ON ?auto_13072 ?auto_13074 ) ( not ( = ?auto_13072 ?auto_13074 ) ) ( not ( = ?auto_13076 ?auto_13074 ) ) ( not ( = ?auto_13075 ?auto_13074 ) ) ( not ( = ?auto_13073 ?auto_13074 ) ) ( CLEAR ?auto_13073 ) ( ON ?auto_13076 ?auto_13072 ) ( CLEAR ?auto_13076 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13074 ?auto_13072 )
      ( MAKE-1PILE ?auto_13072 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13077 - BLOCK
    )
    :vars
    (
      ?auto_13081 - BLOCK
      ?auto_13080 - BLOCK
      ?auto_13078 - BLOCK
      ?auto_13079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13077 ?auto_13081 ) ) ( ON-TABLE ?auto_13080 ) ( not ( = ?auto_13080 ?auto_13078 ) ) ( not ( = ?auto_13080 ?auto_13081 ) ) ( not ( = ?auto_13080 ?auto_13077 ) ) ( not ( = ?auto_13078 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13077 ) ) ( ON ?auto_13077 ?auto_13079 ) ( not ( = ?auto_13077 ?auto_13079 ) ) ( not ( = ?auto_13081 ?auto_13079 ) ) ( not ( = ?auto_13080 ?auto_13079 ) ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( ON ?auto_13081 ?auto_13077 ) ( CLEAR ?auto_13081 ) ( ON-TABLE ?auto_13079 ) ( HOLDING ?auto_13078 ) ( CLEAR ?auto_13080 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13080 ?auto_13078 )
      ( MAKE-1PILE ?auto_13077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13082 - BLOCK
    )
    :vars
    (
      ?auto_13086 - BLOCK
      ?auto_13084 - BLOCK
      ?auto_13085 - BLOCK
      ?auto_13083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13082 ?auto_13086 ) ) ( ON-TABLE ?auto_13084 ) ( not ( = ?auto_13084 ?auto_13085 ) ) ( not ( = ?auto_13084 ?auto_13086 ) ) ( not ( = ?auto_13084 ?auto_13082 ) ) ( not ( = ?auto_13085 ?auto_13086 ) ) ( not ( = ?auto_13085 ?auto_13082 ) ) ( ON ?auto_13082 ?auto_13083 ) ( not ( = ?auto_13082 ?auto_13083 ) ) ( not ( = ?auto_13086 ?auto_13083 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( not ( = ?auto_13085 ?auto_13083 ) ) ( ON ?auto_13086 ?auto_13082 ) ( ON-TABLE ?auto_13083 ) ( CLEAR ?auto_13084 ) ( ON ?auto_13085 ?auto_13086 ) ( CLEAR ?auto_13085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13083 ?auto_13082 ?auto_13086 )
      ( MAKE-1PILE ?auto_13082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13087 - BLOCK
    )
    :vars
    (
      ?auto_13091 - BLOCK
      ?auto_13088 - BLOCK
      ?auto_13090 - BLOCK
      ?auto_13089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13087 ?auto_13091 ) ) ( not ( = ?auto_13088 ?auto_13090 ) ) ( not ( = ?auto_13088 ?auto_13091 ) ) ( not ( = ?auto_13088 ?auto_13087 ) ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13087 ) ) ( ON ?auto_13087 ?auto_13089 ) ( not ( = ?auto_13087 ?auto_13089 ) ) ( not ( = ?auto_13091 ?auto_13089 ) ) ( not ( = ?auto_13088 ?auto_13089 ) ) ( not ( = ?auto_13090 ?auto_13089 ) ) ( ON ?auto_13091 ?auto_13087 ) ( ON-TABLE ?auto_13089 ) ( ON ?auto_13090 ?auto_13091 ) ( CLEAR ?auto_13090 ) ( HOLDING ?auto_13088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13088 )
      ( MAKE-1PILE ?auto_13087 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13092 - BLOCK
    )
    :vars
    (
      ?auto_13095 - BLOCK
      ?auto_13096 - BLOCK
      ?auto_13094 - BLOCK
      ?auto_13093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13092 ?auto_13095 ) ) ( not ( = ?auto_13096 ?auto_13094 ) ) ( not ( = ?auto_13096 ?auto_13095 ) ) ( not ( = ?auto_13096 ?auto_13092 ) ) ( not ( = ?auto_13094 ?auto_13095 ) ) ( not ( = ?auto_13094 ?auto_13092 ) ) ( ON ?auto_13092 ?auto_13093 ) ( not ( = ?auto_13092 ?auto_13093 ) ) ( not ( = ?auto_13095 ?auto_13093 ) ) ( not ( = ?auto_13096 ?auto_13093 ) ) ( not ( = ?auto_13094 ?auto_13093 ) ) ( ON ?auto_13095 ?auto_13092 ) ( ON-TABLE ?auto_13093 ) ( ON ?auto_13094 ?auto_13095 ) ( ON ?auto_13096 ?auto_13094 ) ( CLEAR ?auto_13096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13093 ?auto_13092 ?auto_13095 ?auto_13094 )
      ( MAKE-1PILE ?auto_13092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13099 - BLOCK
      ?auto_13100 - BLOCK
    )
    :vars
    (
      ?auto_13101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13101 ?auto_13100 ) ( CLEAR ?auto_13101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13099 ) ( ON ?auto_13100 ?auto_13099 ) ( not ( = ?auto_13099 ?auto_13100 ) ) ( not ( = ?auto_13099 ?auto_13101 ) ) ( not ( = ?auto_13100 ?auto_13101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13101 ?auto_13100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13102 - BLOCK
      ?auto_13103 - BLOCK
    )
    :vars
    (
      ?auto_13104 - BLOCK
      ?auto_13105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13104 ?auto_13103 ) ( CLEAR ?auto_13104 ) ( ON-TABLE ?auto_13102 ) ( ON ?auto_13103 ?auto_13102 ) ( not ( = ?auto_13102 ?auto_13103 ) ) ( not ( = ?auto_13102 ?auto_13104 ) ) ( not ( = ?auto_13103 ?auto_13104 ) ) ( HOLDING ?auto_13105 ) ( not ( = ?auto_13102 ?auto_13105 ) ) ( not ( = ?auto_13103 ?auto_13105 ) ) ( not ( = ?auto_13104 ?auto_13105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13105 )
      ( MAKE-2PILE ?auto_13102 ?auto_13103 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13106 - BLOCK
      ?auto_13107 - BLOCK
    )
    :vars
    (
      ?auto_13109 - BLOCK
      ?auto_13108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13109 ?auto_13107 ) ( ON-TABLE ?auto_13106 ) ( ON ?auto_13107 ?auto_13106 ) ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13109 ) ) ( not ( = ?auto_13107 ?auto_13109 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13109 ?auto_13108 ) ) ( ON ?auto_13108 ?auto_13109 ) ( CLEAR ?auto_13108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13106 ?auto_13107 ?auto_13109 )
      ( MAKE-2PILE ?auto_13106 ?auto_13107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13110 - BLOCK
      ?auto_13111 - BLOCK
    )
    :vars
    (
      ?auto_13112 - BLOCK
      ?auto_13113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13112 ?auto_13111 ) ( ON-TABLE ?auto_13110 ) ( ON ?auto_13111 ?auto_13110 ) ( not ( = ?auto_13110 ?auto_13111 ) ) ( not ( = ?auto_13110 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13110 ?auto_13113 ) ) ( not ( = ?auto_13111 ?auto_13113 ) ) ( not ( = ?auto_13112 ?auto_13113 ) ) ( HOLDING ?auto_13113 ) ( CLEAR ?auto_13112 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13110 ?auto_13111 ?auto_13112 ?auto_13113 )
      ( MAKE-2PILE ?auto_13110 ?auto_13111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13114 - BLOCK
      ?auto_13115 - BLOCK
    )
    :vars
    (
      ?auto_13116 - BLOCK
      ?auto_13117 - BLOCK
      ?auto_13118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13116 ?auto_13115 ) ( ON-TABLE ?auto_13114 ) ( ON ?auto_13115 ?auto_13114 ) ( not ( = ?auto_13114 ?auto_13115 ) ) ( not ( = ?auto_13114 ?auto_13116 ) ) ( not ( = ?auto_13115 ?auto_13116 ) ) ( not ( = ?auto_13114 ?auto_13117 ) ) ( not ( = ?auto_13115 ?auto_13117 ) ) ( not ( = ?auto_13116 ?auto_13117 ) ) ( CLEAR ?auto_13116 ) ( ON ?auto_13117 ?auto_13118 ) ( CLEAR ?auto_13117 ) ( HAND-EMPTY ) ( not ( = ?auto_13114 ?auto_13118 ) ) ( not ( = ?auto_13115 ?auto_13118 ) ) ( not ( = ?auto_13116 ?auto_13118 ) ) ( not ( = ?auto_13117 ?auto_13118 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13117 ?auto_13118 )
      ( MAKE-2PILE ?auto_13114 ?auto_13115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13129 - BLOCK
      ?auto_13130 - BLOCK
    )
    :vars
    (
      ?auto_13133 - BLOCK
      ?auto_13131 - BLOCK
      ?auto_13132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13129 ) ( not ( = ?auto_13129 ?auto_13130 ) ) ( not ( = ?auto_13129 ?auto_13133 ) ) ( not ( = ?auto_13130 ?auto_13133 ) ) ( not ( = ?auto_13129 ?auto_13131 ) ) ( not ( = ?auto_13130 ?auto_13131 ) ) ( not ( = ?auto_13133 ?auto_13131 ) ) ( ON ?auto_13131 ?auto_13132 ) ( not ( = ?auto_13129 ?auto_13132 ) ) ( not ( = ?auto_13130 ?auto_13132 ) ) ( not ( = ?auto_13133 ?auto_13132 ) ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( ON ?auto_13133 ?auto_13131 ) ( CLEAR ?auto_13133 ) ( HOLDING ?auto_13130 ) ( CLEAR ?auto_13129 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13129 ?auto_13130 ?auto_13133 )
      ( MAKE-2PILE ?auto_13129 ?auto_13130 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13134 - BLOCK
      ?auto_13135 - BLOCK
    )
    :vars
    (
      ?auto_13137 - BLOCK
      ?auto_13138 - BLOCK
      ?auto_13136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13134 ) ( not ( = ?auto_13134 ?auto_13135 ) ) ( not ( = ?auto_13134 ?auto_13137 ) ) ( not ( = ?auto_13135 ?auto_13137 ) ) ( not ( = ?auto_13134 ?auto_13138 ) ) ( not ( = ?auto_13135 ?auto_13138 ) ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( ON ?auto_13138 ?auto_13136 ) ( not ( = ?auto_13134 ?auto_13136 ) ) ( not ( = ?auto_13135 ?auto_13136 ) ) ( not ( = ?auto_13137 ?auto_13136 ) ) ( not ( = ?auto_13138 ?auto_13136 ) ) ( ON ?auto_13137 ?auto_13138 ) ( CLEAR ?auto_13134 ) ( ON ?auto_13135 ?auto_13137 ) ( CLEAR ?auto_13135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13136 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13136 ?auto_13138 ?auto_13137 )
      ( MAKE-2PILE ?auto_13134 ?auto_13135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13139 - BLOCK
      ?auto_13140 - BLOCK
    )
    :vars
    (
      ?auto_13142 - BLOCK
      ?auto_13141 - BLOCK
      ?auto_13143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13139 ?auto_13140 ) ) ( not ( = ?auto_13139 ?auto_13142 ) ) ( not ( = ?auto_13140 ?auto_13142 ) ) ( not ( = ?auto_13139 ?auto_13141 ) ) ( not ( = ?auto_13140 ?auto_13141 ) ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( ON ?auto_13141 ?auto_13143 ) ( not ( = ?auto_13139 ?auto_13143 ) ) ( not ( = ?auto_13140 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13141 ?auto_13143 ) ) ( ON ?auto_13142 ?auto_13141 ) ( ON ?auto_13140 ?auto_13142 ) ( CLEAR ?auto_13140 ) ( ON-TABLE ?auto_13143 ) ( HOLDING ?auto_13139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13139 )
      ( MAKE-2PILE ?auto_13139 ?auto_13140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13144 - BLOCK
      ?auto_13145 - BLOCK
    )
    :vars
    (
      ?auto_13148 - BLOCK
      ?auto_13146 - BLOCK
      ?auto_13147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13144 ?auto_13145 ) ) ( not ( = ?auto_13144 ?auto_13148 ) ) ( not ( = ?auto_13145 ?auto_13148 ) ) ( not ( = ?auto_13144 ?auto_13146 ) ) ( not ( = ?auto_13145 ?auto_13146 ) ) ( not ( = ?auto_13148 ?auto_13146 ) ) ( ON ?auto_13146 ?auto_13147 ) ( not ( = ?auto_13144 ?auto_13147 ) ) ( not ( = ?auto_13145 ?auto_13147 ) ) ( not ( = ?auto_13148 ?auto_13147 ) ) ( not ( = ?auto_13146 ?auto_13147 ) ) ( ON ?auto_13148 ?auto_13146 ) ( ON ?auto_13145 ?auto_13148 ) ( ON-TABLE ?auto_13147 ) ( ON ?auto_13144 ?auto_13145 ) ( CLEAR ?auto_13144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13147 ?auto_13146 ?auto_13148 ?auto_13145 )
      ( MAKE-2PILE ?auto_13144 ?auto_13145 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13151 - BLOCK
      ?auto_13152 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13152 ) ( CLEAR ?auto_13151 ) ( ON-TABLE ?auto_13151 ) ( not ( = ?auto_13151 ?auto_13152 ) ) )
    :subtasks
    ( ( !STACK ?auto_13152 ?auto_13151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13153 - BLOCK
      ?auto_13154 - BLOCK
    )
    :vars
    (
      ?auto_13155 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13153 ) ( ON-TABLE ?auto_13153 ) ( not ( = ?auto_13153 ?auto_13154 ) ) ( ON ?auto_13154 ?auto_13155 ) ( CLEAR ?auto_13154 ) ( HAND-EMPTY ) ( not ( = ?auto_13153 ?auto_13155 ) ) ( not ( = ?auto_13154 ?auto_13155 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13154 ?auto_13155 )
      ( MAKE-2PILE ?auto_13153 ?auto_13154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13156 - BLOCK
      ?auto_13157 - BLOCK
    )
    :vars
    (
      ?auto_13158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13156 ?auto_13157 ) ) ( ON ?auto_13157 ?auto_13158 ) ( CLEAR ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13158 ) ) ( not ( = ?auto_13157 ?auto_13158 ) ) ( HOLDING ?auto_13156 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13156 )
      ( MAKE-2PILE ?auto_13156 ?auto_13157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13159 - BLOCK
      ?auto_13160 - BLOCK
    )
    :vars
    (
      ?auto_13161 - BLOCK
      ?auto_13162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13159 ?auto_13160 ) ) ( ON ?auto_13160 ?auto_13161 ) ( not ( = ?auto_13159 ?auto_13161 ) ) ( not ( = ?auto_13160 ?auto_13161 ) ) ( ON ?auto_13159 ?auto_13160 ) ( CLEAR ?auto_13159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13162 ) ( ON ?auto_13161 ?auto_13162 ) ( not ( = ?auto_13162 ?auto_13161 ) ) ( not ( = ?auto_13162 ?auto_13160 ) ) ( not ( = ?auto_13162 ?auto_13159 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13162 ?auto_13161 ?auto_13160 )
      ( MAKE-2PILE ?auto_13159 ?auto_13160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13163 - BLOCK
      ?auto_13164 - BLOCK
    )
    :vars
    (
      ?auto_13166 - BLOCK
      ?auto_13165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13163 ?auto_13164 ) ) ( ON ?auto_13164 ?auto_13166 ) ( not ( = ?auto_13163 ?auto_13166 ) ) ( not ( = ?auto_13164 ?auto_13166 ) ) ( ON-TABLE ?auto_13165 ) ( ON ?auto_13166 ?auto_13165 ) ( not ( = ?auto_13165 ?auto_13166 ) ) ( not ( = ?auto_13165 ?auto_13164 ) ) ( not ( = ?auto_13165 ?auto_13163 ) ) ( HOLDING ?auto_13163 ) ( CLEAR ?auto_13164 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13165 ?auto_13166 ?auto_13164 ?auto_13163 )
      ( MAKE-2PILE ?auto_13163 ?auto_13164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13167 - BLOCK
      ?auto_13168 - BLOCK
    )
    :vars
    (
      ?auto_13170 - BLOCK
      ?auto_13169 - BLOCK
      ?auto_13171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13167 ?auto_13168 ) ) ( ON ?auto_13168 ?auto_13170 ) ( not ( = ?auto_13167 ?auto_13170 ) ) ( not ( = ?auto_13168 ?auto_13170 ) ) ( ON-TABLE ?auto_13169 ) ( ON ?auto_13170 ?auto_13169 ) ( not ( = ?auto_13169 ?auto_13170 ) ) ( not ( = ?auto_13169 ?auto_13168 ) ) ( not ( = ?auto_13169 ?auto_13167 ) ) ( CLEAR ?auto_13168 ) ( ON ?auto_13167 ?auto_13171 ) ( CLEAR ?auto_13167 ) ( HAND-EMPTY ) ( not ( = ?auto_13167 ?auto_13171 ) ) ( not ( = ?auto_13168 ?auto_13171 ) ) ( not ( = ?auto_13170 ?auto_13171 ) ) ( not ( = ?auto_13169 ?auto_13171 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13167 ?auto_13171 )
      ( MAKE-2PILE ?auto_13167 ?auto_13168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13172 - BLOCK
      ?auto_13173 - BLOCK
    )
    :vars
    (
      ?auto_13175 - BLOCK
      ?auto_13176 - BLOCK
      ?auto_13174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13172 ?auto_13173 ) ) ( not ( = ?auto_13172 ?auto_13175 ) ) ( not ( = ?auto_13173 ?auto_13175 ) ) ( ON-TABLE ?auto_13176 ) ( ON ?auto_13175 ?auto_13176 ) ( not ( = ?auto_13176 ?auto_13175 ) ) ( not ( = ?auto_13176 ?auto_13173 ) ) ( not ( = ?auto_13176 ?auto_13172 ) ) ( ON ?auto_13172 ?auto_13174 ) ( CLEAR ?auto_13172 ) ( not ( = ?auto_13172 ?auto_13174 ) ) ( not ( = ?auto_13173 ?auto_13174 ) ) ( not ( = ?auto_13175 ?auto_13174 ) ) ( not ( = ?auto_13176 ?auto_13174 ) ) ( HOLDING ?auto_13173 ) ( CLEAR ?auto_13175 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13176 ?auto_13175 ?auto_13173 )
      ( MAKE-2PILE ?auto_13172 ?auto_13173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13177 - BLOCK
      ?auto_13178 - BLOCK
    )
    :vars
    (
      ?auto_13181 - BLOCK
      ?auto_13180 - BLOCK
      ?auto_13179 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13177 ?auto_13178 ) ) ( not ( = ?auto_13177 ?auto_13181 ) ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( ON-TABLE ?auto_13180 ) ( ON ?auto_13181 ?auto_13180 ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13180 ?auto_13178 ) ) ( not ( = ?auto_13180 ?auto_13177 ) ) ( ON ?auto_13177 ?auto_13179 ) ( not ( = ?auto_13177 ?auto_13179 ) ) ( not ( = ?auto_13178 ?auto_13179 ) ) ( not ( = ?auto_13181 ?auto_13179 ) ) ( not ( = ?auto_13180 ?auto_13179 ) ) ( CLEAR ?auto_13181 ) ( ON ?auto_13178 ?auto_13177 ) ( CLEAR ?auto_13178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13179 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13179 ?auto_13177 )
      ( MAKE-2PILE ?auto_13177 ?auto_13178 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13182 - BLOCK
      ?auto_13183 - BLOCK
    )
    :vars
    (
      ?auto_13184 - BLOCK
      ?auto_13186 - BLOCK
      ?auto_13185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13182 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13184 ) ) ( not ( = ?auto_13183 ?auto_13184 ) ) ( ON-TABLE ?auto_13186 ) ( not ( = ?auto_13186 ?auto_13184 ) ) ( not ( = ?auto_13186 ?auto_13183 ) ) ( not ( = ?auto_13186 ?auto_13182 ) ) ( ON ?auto_13182 ?auto_13185 ) ( not ( = ?auto_13182 ?auto_13185 ) ) ( not ( = ?auto_13183 ?auto_13185 ) ) ( not ( = ?auto_13184 ?auto_13185 ) ) ( not ( = ?auto_13186 ?auto_13185 ) ) ( ON ?auto_13183 ?auto_13182 ) ( CLEAR ?auto_13183 ) ( ON-TABLE ?auto_13185 ) ( HOLDING ?auto_13184 ) ( CLEAR ?auto_13186 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13186 ?auto_13184 )
      ( MAKE-2PILE ?auto_13182 ?auto_13183 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13187 - BLOCK
      ?auto_13188 - BLOCK
    )
    :vars
    (
      ?auto_13190 - BLOCK
      ?auto_13191 - BLOCK
      ?auto_13189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13187 ?auto_13188 ) ) ( not ( = ?auto_13187 ?auto_13190 ) ) ( not ( = ?auto_13188 ?auto_13190 ) ) ( ON-TABLE ?auto_13191 ) ( not ( = ?auto_13191 ?auto_13190 ) ) ( not ( = ?auto_13191 ?auto_13188 ) ) ( not ( = ?auto_13191 ?auto_13187 ) ) ( ON ?auto_13187 ?auto_13189 ) ( not ( = ?auto_13187 ?auto_13189 ) ) ( not ( = ?auto_13188 ?auto_13189 ) ) ( not ( = ?auto_13190 ?auto_13189 ) ) ( not ( = ?auto_13191 ?auto_13189 ) ) ( ON ?auto_13188 ?auto_13187 ) ( ON-TABLE ?auto_13189 ) ( CLEAR ?auto_13191 ) ( ON ?auto_13190 ?auto_13188 ) ( CLEAR ?auto_13190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13189 ?auto_13187 ?auto_13188 )
      ( MAKE-2PILE ?auto_13187 ?auto_13188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13192 - BLOCK
      ?auto_13193 - BLOCK
    )
    :vars
    (
      ?auto_13194 - BLOCK
      ?auto_13195 - BLOCK
      ?auto_13196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13192 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13195 ?auto_13194 ) ) ( not ( = ?auto_13195 ?auto_13193 ) ) ( not ( = ?auto_13195 ?auto_13192 ) ) ( ON ?auto_13192 ?auto_13196 ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( not ( = ?auto_13193 ?auto_13196 ) ) ( not ( = ?auto_13194 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( ON ?auto_13193 ?auto_13192 ) ( ON-TABLE ?auto_13196 ) ( ON ?auto_13194 ?auto_13193 ) ( CLEAR ?auto_13194 ) ( HOLDING ?auto_13195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13195 )
      ( MAKE-2PILE ?auto_13192 ?auto_13193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13197 - BLOCK
      ?auto_13198 - BLOCK
    )
    :vars
    (
      ?auto_13200 - BLOCK
      ?auto_13199 - BLOCK
      ?auto_13201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13197 ?auto_13198 ) ) ( not ( = ?auto_13197 ?auto_13200 ) ) ( not ( = ?auto_13198 ?auto_13200 ) ) ( not ( = ?auto_13199 ?auto_13200 ) ) ( not ( = ?auto_13199 ?auto_13198 ) ) ( not ( = ?auto_13199 ?auto_13197 ) ) ( ON ?auto_13197 ?auto_13201 ) ( not ( = ?auto_13197 ?auto_13201 ) ) ( not ( = ?auto_13198 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13199 ?auto_13201 ) ) ( ON ?auto_13198 ?auto_13197 ) ( ON-TABLE ?auto_13201 ) ( ON ?auto_13200 ?auto_13198 ) ( ON ?auto_13199 ?auto_13200 ) ( CLEAR ?auto_13199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13201 ?auto_13197 ?auto_13198 ?auto_13200 )
      ( MAKE-2PILE ?auto_13197 ?auto_13198 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13203 - BLOCK
    )
    :vars
    (
      ?auto_13204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13204 ?auto_13203 ) ( CLEAR ?auto_13204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13203 ) ( not ( = ?auto_13203 ?auto_13204 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13204 ?auto_13203 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13205 - BLOCK
    )
    :vars
    (
      ?auto_13206 - BLOCK
      ?auto_13207 - BLOCK
      ?auto_13208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13206 ?auto_13205 ) ( CLEAR ?auto_13206 ) ( ON-TABLE ?auto_13205 ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( HOLDING ?auto_13207 ) ( CLEAR ?auto_13208 ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) )
    :subtasks
    ( ( !STACK ?auto_13207 ?auto_13208 )
      ( MAKE-1PILE ?auto_13205 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13209 - BLOCK
    )
    :vars
    (
      ?auto_13210 - BLOCK
      ?auto_13212 - BLOCK
      ?auto_13211 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13210 ?auto_13209 ) ( ON-TABLE ?auto_13209 ) ( not ( = ?auto_13209 ?auto_13210 ) ) ( CLEAR ?auto_13212 ) ( not ( = ?auto_13209 ?auto_13211 ) ) ( not ( = ?auto_13209 ?auto_13212 ) ) ( not ( = ?auto_13210 ?auto_13211 ) ) ( not ( = ?auto_13210 ?auto_13212 ) ) ( not ( = ?auto_13211 ?auto_13212 ) ) ( ON ?auto_13211 ?auto_13210 ) ( CLEAR ?auto_13211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13209 ?auto_13210 )
      ( MAKE-1PILE ?auto_13209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13213 - BLOCK
    )
    :vars
    (
      ?auto_13215 - BLOCK
      ?auto_13216 - BLOCK
      ?auto_13214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13215 ?auto_13213 ) ( ON-TABLE ?auto_13213 ) ( not ( = ?auto_13213 ?auto_13215 ) ) ( not ( = ?auto_13213 ?auto_13216 ) ) ( not ( = ?auto_13213 ?auto_13214 ) ) ( not ( = ?auto_13215 ?auto_13216 ) ) ( not ( = ?auto_13215 ?auto_13214 ) ) ( not ( = ?auto_13216 ?auto_13214 ) ) ( ON ?auto_13216 ?auto_13215 ) ( CLEAR ?auto_13216 ) ( HOLDING ?auto_13214 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13214 )
      ( MAKE-1PILE ?auto_13213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13217 - BLOCK
    )
    :vars
    (
      ?auto_13219 - BLOCK
      ?auto_13220 - BLOCK
      ?auto_13218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13219 ?auto_13217 ) ( ON-TABLE ?auto_13217 ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( not ( = ?auto_13217 ?auto_13220 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( not ( = ?auto_13219 ?auto_13220 ) ) ( not ( = ?auto_13219 ?auto_13218 ) ) ( not ( = ?auto_13220 ?auto_13218 ) ) ( ON ?auto_13220 ?auto_13219 ) ( ON ?auto_13218 ?auto_13220 ) ( CLEAR ?auto_13218 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13217 ?auto_13219 ?auto_13220 )
      ( MAKE-1PILE ?auto_13217 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13221 - BLOCK
    )
    :vars
    (
      ?auto_13224 - BLOCK
      ?auto_13222 - BLOCK
      ?auto_13223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13224 ?auto_13221 ) ( ON-TABLE ?auto_13221 ) ( not ( = ?auto_13221 ?auto_13224 ) ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13221 ?auto_13223 ) ) ( not ( = ?auto_13224 ?auto_13222 ) ) ( not ( = ?auto_13224 ?auto_13223 ) ) ( not ( = ?auto_13222 ?auto_13223 ) ) ( ON ?auto_13222 ?auto_13224 ) ( HOLDING ?auto_13223 ) ( CLEAR ?auto_13222 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13221 ?auto_13224 ?auto_13222 ?auto_13223 )
      ( MAKE-1PILE ?auto_13221 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13225 - BLOCK
    )
    :vars
    (
      ?auto_13226 - BLOCK
      ?auto_13228 - BLOCK
      ?auto_13227 - BLOCK
      ?auto_13229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13226 ?auto_13225 ) ( ON-TABLE ?auto_13225 ) ( not ( = ?auto_13225 ?auto_13226 ) ) ( not ( = ?auto_13225 ?auto_13228 ) ) ( not ( = ?auto_13225 ?auto_13227 ) ) ( not ( = ?auto_13226 ?auto_13228 ) ) ( not ( = ?auto_13226 ?auto_13227 ) ) ( not ( = ?auto_13228 ?auto_13227 ) ) ( ON ?auto_13228 ?auto_13226 ) ( CLEAR ?auto_13228 ) ( ON ?auto_13227 ?auto_13229 ) ( CLEAR ?auto_13227 ) ( HAND-EMPTY ) ( not ( = ?auto_13225 ?auto_13229 ) ) ( not ( = ?auto_13226 ?auto_13229 ) ) ( not ( = ?auto_13228 ?auto_13229 ) ) ( not ( = ?auto_13227 ?auto_13229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13227 ?auto_13229 )
      ( MAKE-1PILE ?auto_13225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13230 - BLOCK
    )
    :vars
    (
      ?auto_13233 - BLOCK
      ?auto_13234 - BLOCK
      ?auto_13231 - BLOCK
      ?auto_13232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13233 ?auto_13230 ) ( ON-TABLE ?auto_13230 ) ( not ( = ?auto_13230 ?auto_13233 ) ) ( not ( = ?auto_13230 ?auto_13234 ) ) ( not ( = ?auto_13230 ?auto_13231 ) ) ( not ( = ?auto_13233 ?auto_13234 ) ) ( not ( = ?auto_13233 ?auto_13231 ) ) ( not ( = ?auto_13234 ?auto_13231 ) ) ( ON ?auto_13231 ?auto_13232 ) ( CLEAR ?auto_13231 ) ( not ( = ?auto_13230 ?auto_13232 ) ) ( not ( = ?auto_13233 ?auto_13232 ) ) ( not ( = ?auto_13234 ?auto_13232 ) ) ( not ( = ?auto_13231 ?auto_13232 ) ) ( HOLDING ?auto_13234 ) ( CLEAR ?auto_13233 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13230 ?auto_13233 ?auto_13234 )
      ( MAKE-1PILE ?auto_13230 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13235 - BLOCK
    )
    :vars
    (
      ?auto_13236 - BLOCK
      ?auto_13237 - BLOCK
      ?auto_13239 - BLOCK
      ?auto_13238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13236 ?auto_13235 ) ( ON-TABLE ?auto_13235 ) ( not ( = ?auto_13235 ?auto_13236 ) ) ( not ( = ?auto_13235 ?auto_13237 ) ) ( not ( = ?auto_13235 ?auto_13239 ) ) ( not ( = ?auto_13236 ?auto_13237 ) ) ( not ( = ?auto_13236 ?auto_13239 ) ) ( not ( = ?auto_13237 ?auto_13239 ) ) ( ON ?auto_13239 ?auto_13238 ) ( not ( = ?auto_13235 ?auto_13238 ) ) ( not ( = ?auto_13236 ?auto_13238 ) ) ( not ( = ?auto_13237 ?auto_13238 ) ) ( not ( = ?auto_13239 ?auto_13238 ) ) ( CLEAR ?auto_13236 ) ( ON ?auto_13237 ?auto_13239 ) ( CLEAR ?auto_13237 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13238 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13238 ?auto_13239 )
      ( MAKE-1PILE ?auto_13235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13250 - BLOCK
    )
    :vars
    (
      ?auto_13252 - BLOCK
      ?auto_13254 - BLOCK
      ?auto_13251 - BLOCK
      ?auto_13253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13254 ) ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13252 ?auto_13251 ) ) ( not ( = ?auto_13254 ?auto_13251 ) ) ( ON ?auto_13251 ?auto_13253 ) ( not ( = ?auto_13250 ?auto_13253 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( ON ?auto_13254 ?auto_13251 ) ( ON-TABLE ?auto_13253 ) ( ON ?auto_13252 ?auto_13254 ) ( CLEAR ?auto_13252 ) ( HOLDING ?auto_13250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13250 ?auto_13252 )
      ( MAKE-1PILE ?auto_13250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13255 - BLOCK
    )
    :vars
    (
      ?auto_13259 - BLOCK
      ?auto_13256 - BLOCK
      ?auto_13258 - BLOCK
      ?auto_13257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13255 ?auto_13259 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13258 ) ) ( not ( = ?auto_13259 ?auto_13256 ) ) ( not ( = ?auto_13259 ?auto_13258 ) ) ( not ( = ?auto_13256 ?auto_13258 ) ) ( ON ?auto_13258 ?auto_13257 ) ( not ( = ?auto_13255 ?auto_13257 ) ) ( not ( = ?auto_13259 ?auto_13257 ) ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13258 ?auto_13257 ) ) ( ON ?auto_13256 ?auto_13258 ) ( ON-TABLE ?auto_13257 ) ( ON ?auto_13259 ?auto_13256 ) ( ON ?auto_13255 ?auto_13259 ) ( CLEAR ?auto_13255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13257 ?auto_13258 ?auto_13256 ?auto_13259 )
      ( MAKE-1PILE ?auto_13255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13263 - BLOCK
      ?auto_13264 - BLOCK
      ?auto_13265 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13265 ) ( CLEAR ?auto_13264 ) ( ON-TABLE ?auto_13263 ) ( ON ?auto_13264 ?auto_13263 ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( not ( = ?auto_13263 ?auto_13265 ) ) ( not ( = ?auto_13264 ?auto_13265 ) ) )
    :subtasks
    ( ( !STACK ?auto_13265 ?auto_13264 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13266 - BLOCK
      ?auto_13267 - BLOCK
      ?auto_13268 - BLOCK
    )
    :vars
    (
      ?auto_13269 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13267 ) ( ON-TABLE ?auto_13266 ) ( ON ?auto_13267 ?auto_13266 ) ( not ( = ?auto_13266 ?auto_13267 ) ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( ON ?auto_13268 ?auto_13269 ) ( CLEAR ?auto_13268 ) ( HAND-EMPTY ) ( not ( = ?auto_13266 ?auto_13269 ) ) ( not ( = ?auto_13267 ?auto_13269 ) ) ( not ( = ?auto_13268 ?auto_13269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13268 ?auto_13269 )
      ( MAKE-3PILE ?auto_13266 ?auto_13267 ?auto_13268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13270 - BLOCK
      ?auto_13271 - BLOCK
      ?auto_13272 - BLOCK
    )
    :vars
    (
      ?auto_13273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13270 ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13270 ?auto_13272 ) ) ( not ( = ?auto_13271 ?auto_13272 ) ) ( ON ?auto_13272 ?auto_13273 ) ( CLEAR ?auto_13272 ) ( not ( = ?auto_13270 ?auto_13273 ) ) ( not ( = ?auto_13271 ?auto_13273 ) ) ( not ( = ?auto_13272 ?auto_13273 ) ) ( HOLDING ?auto_13271 ) ( CLEAR ?auto_13270 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13270 ?auto_13271 )
      ( MAKE-3PILE ?auto_13270 ?auto_13271 ?auto_13272 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13274 - BLOCK
      ?auto_13275 - BLOCK
      ?auto_13276 - BLOCK
    )
    :vars
    (
      ?auto_13277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13274 ) ( not ( = ?auto_13274 ?auto_13275 ) ) ( not ( = ?auto_13274 ?auto_13276 ) ) ( not ( = ?auto_13275 ?auto_13276 ) ) ( ON ?auto_13276 ?auto_13277 ) ( not ( = ?auto_13274 ?auto_13277 ) ) ( not ( = ?auto_13275 ?auto_13277 ) ) ( not ( = ?auto_13276 ?auto_13277 ) ) ( CLEAR ?auto_13274 ) ( ON ?auto_13275 ?auto_13276 ) ( CLEAR ?auto_13275 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13277 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13277 ?auto_13276 )
      ( MAKE-3PILE ?auto_13274 ?auto_13275 ?auto_13276 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13278 - BLOCK
      ?auto_13279 - BLOCK
      ?auto_13280 - BLOCK
    )
    :vars
    (
      ?auto_13281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13280 ) ) ( not ( = ?auto_13279 ?auto_13280 ) ) ( ON ?auto_13280 ?auto_13281 ) ( not ( = ?auto_13278 ?auto_13281 ) ) ( not ( = ?auto_13279 ?auto_13281 ) ) ( not ( = ?auto_13280 ?auto_13281 ) ) ( ON ?auto_13279 ?auto_13280 ) ( CLEAR ?auto_13279 ) ( ON-TABLE ?auto_13281 ) ( HOLDING ?auto_13278 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13278 )
      ( MAKE-3PILE ?auto_13278 ?auto_13279 ?auto_13280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13282 - BLOCK
      ?auto_13283 - BLOCK
      ?auto_13284 - BLOCK
    )
    :vars
    (
      ?auto_13285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13282 ?auto_13283 ) ) ( not ( = ?auto_13282 ?auto_13284 ) ) ( not ( = ?auto_13283 ?auto_13284 ) ) ( ON ?auto_13284 ?auto_13285 ) ( not ( = ?auto_13282 ?auto_13285 ) ) ( not ( = ?auto_13283 ?auto_13285 ) ) ( not ( = ?auto_13284 ?auto_13285 ) ) ( ON ?auto_13283 ?auto_13284 ) ( ON-TABLE ?auto_13285 ) ( ON ?auto_13282 ?auto_13283 ) ( CLEAR ?auto_13282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13285 ?auto_13284 ?auto_13283 )
      ( MAKE-3PILE ?auto_13282 ?auto_13283 ?auto_13284 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13286 - BLOCK
      ?auto_13287 - BLOCK
      ?auto_13288 - BLOCK
    )
    :vars
    (
      ?auto_13289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13286 ?auto_13287 ) ) ( not ( = ?auto_13286 ?auto_13288 ) ) ( not ( = ?auto_13287 ?auto_13288 ) ) ( ON ?auto_13288 ?auto_13289 ) ( not ( = ?auto_13286 ?auto_13289 ) ) ( not ( = ?auto_13287 ?auto_13289 ) ) ( not ( = ?auto_13288 ?auto_13289 ) ) ( ON ?auto_13287 ?auto_13288 ) ( ON-TABLE ?auto_13289 ) ( HOLDING ?auto_13286 ) ( CLEAR ?auto_13287 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13289 ?auto_13288 ?auto_13287 ?auto_13286 )
      ( MAKE-3PILE ?auto_13286 ?auto_13287 ?auto_13288 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13290 - BLOCK
      ?auto_13291 - BLOCK
      ?auto_13292 - BLOCK
    )
    :vars
    (
      ?auto_13293 - BLOCK
      ?auto_13294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13290 ?auto_13291 ) ) ( not ( = ?auto_13290 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( ON ?auto_13292 ?auto_13293 ) ( not ( = ?auto_13290 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( ON ?auto_13291 ?auto_13292 ) ( ON-TABLE ?auto_13293 ) ( CLEAR ?auto_13291 ) ( ON ?auto_13290 ?auto_13294 ) ( CLEAR ?auto_13290 ) ( HAND-EMPTY ) ( not ( = ?auto_13290 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13293 ?auto_13294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13290 ?auto_13294 )
      ( MAKE-3PILE ?auto_13290 ?auto_13291 ?auto_13292 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13295 - BLOCK
      ?auto_13296 - BLOCK
      ?auto_13297 - BLOCK
    )
    :vars
    (
      ?auto_13299 - BLOCK
      ?auto_13298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13295 ?auto_13296 ) ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( ON ?auto_13297 ?auto_13299 ) ( not ( = ?auto_13295 ?auto_13299 ) ) ( not ( = ?auto_13296 ?auto_13299 ) ) ( not ( = ?auto_13297 ?auto_13299 ) ) ( ON-TABLE ?auto_13299 ) ( ON ?auto_13295 ?auto_13298 ) ( CLEAR ?auto_13295 ) ( not ( = ?auto_13295 ?auto_13298 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13297 ?auto_13298 ) ) ( not ( = ?auto_13299 ?auto_13298 ) ) ( HOLDING ?auto_13296 ) ( CLEAR ?auto_13297 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13299 ?auto_13297 ?auto_13296 )
      ( MAKE-3PILE ?auto_13295 ?auto_13296 ?auto_13297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13300 - BLOCK
      ?auto_13301 - BLOCK
      ?auto_13302 - BLOCK
    )
    :vars
    (
      ?auto_13303 - BLOCK
      ?auto_13304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13300 ?auto_13302 ) ) ( not ( = ?auto_13301 ?auto_13302 ) ) ( ON ?auto_13302 ?auto_13303 ) ( not ( = ?auto_13300 ?auto_13303 ) ) ( not ( = ?auto_13301 ?auto_13303 ) ) ( not ( = ?auto_13302 ?auto_13303 ) ) ( ON-TABLE ?auto_13303 ) ( ON ?auto_13300 ?auto_13304 ) ( not ( = ?auto_13300 ?auto_13304 ) ) ( not ( = ?auto_13301 ?auto_13304 ) ) ( not ( = ?auto_13302 ?auto_13304 ) ) ( not ( = ?auto_13303 ?auto_13304 ) ) ( CLEAR ?auto_13302 ) ( ON ?auto_13301 ?auto_13300 ) ( CLEAR ?auto_13301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13304 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13304 ?auto_13300 )
      ( MAKE-3PILE ?auto_13300 ?auto_13301 ?auto_13302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13305 - BLOCK
      ?auto_13306 - BLOCK
      ?auto_13307 - BLOCK
    )
    :vars
    (
      ?auto_13308 - BLOCK
      ?auto_13309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13305 ?auto_13306 ) ) ( not ( = ?auto_13305 ?auto_13307 ) ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( not ( = ?auto_13305 ?auto_13308 ) ) ( not ( = ?auto_13306 ?auto_13308 ) ) ( not ( = ?auto_13307 ?auto_13308 ) ) ( ON-TABLE ?auto_13308 ) ( ON ?auto_13305 ?auto_13309 ) ( not ( = ?auto_13305 ?auto_13309 ) ) ( not ( = ?auto_13306 ?auto_13309 ) ) ( not ( = ?auto_13307 ?auto_13309 ) ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( ON ?auto_13306 ?auto_13305 ) ( CLEAR ?auto_13306 ) ( ON-TABLE ?auto_13309 ) ( HOLDING ?auto_13307 ) ( CLEAR ?auto_13308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13308 ?auto_13307 )
      ( MAKE-3PILE ?auto_13305 ?auto_13306 ?auto_13307 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13310 - BLOCK
      ?auto_13311 - BLOCK
      ?auto_13312 - BLOCK
    )
    :vars
    (
      ?auto_13314 - BLOCK
      ?auto_13313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13310 ?auto_13311 ) ) ( not ( = ?auto_13310 ?auto_13312 ) ) ( not ( = ?auto_13311 ?auto_13312 ) ) ( not ( = ?auto_13310 ?auto_13314 ) ) ( not ( = ?auto_13311 ?auto_13314 ) ) ( not ( = ?auto_13312 ?auto_13314 ) ) ( ON-TABLE ?auto_13314 ) ( ON ?auto_13310 ?auto_13313 ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( not ( = ?auto_13311 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13314 ?auto_13313 ) ) ( ON ?auto_13311 ?auto_13310 ) ( ON-TABLE ?auto_13313 ) ( CLEAR ?auto_13314 ) ( ON ?auto_13312 ?auto_13311 ) ( CLEAR ?auto_13312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13313 ?auto_13310 ?auto_13311 )
      ( MAKE-3PILE ?auto_13310 ?auto_13311 ?auto_13312 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13315 - BLOCK
      ?auto_13316 - BLOCK
      ?auto_13317 - BLOCK
    )
    :vars
    (
      ?auto_13318 - BLOCK
      ?auto_13319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( ON ?auto_13315 ?auto_13319 ) ( not ( = ?auto_13315 ?auto_13319 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( ON ?auto_13316 ?auto_13315 ) ( ON-TABLE ?auto_13319 ) ( ON ?auto_13317 ?auto_13316 ) ( CLEAR ?auto_13317 ) ( HOLDING ?auto_13318 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13318 )
      ( MAKE-3PILE ?auto_13315 ?auto_13316 ?auto_13317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13320 - BLOCK
      ?auto_13321 - BLOCK
      ?auto_13322 - BLOCK
    )
    :vars
    (
      ?auto_13324 - BLOCK
      ?auto_13323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13320 ?auto_13321 ) ) ( not ( = ?auto_13320 ?auto_13322 ) ) ( not ( = ?auto_13321 ?auto_13322 ) ) ( not ( = ?auto_13320 ?auto_13324 ) ) ( not ( = ?auto_13321 ?auto_13324 ) ) ( not ( = ?auto_13322 ?auto_13324 ) ) ( ON ?auto_13320 ?auto_13323 ) ( not ( = ?auto_13320 ?auto_13323 ) ) ( not ( = ?auto_13321 ?auto_13323 ) ) ( not ( = ?auto_13322 ?auto_13323 ) ) ( not ( = ?auto_13324 ?auto_13323 ) ) ( ON ?auto_13321 ?auto_13320 ) ( ON-TABLE ?auto_13323 ) ( ON ?auto_13322 ?auto_13321 ) ( ON ?auto_13324 ?auto_13322 ) ( CLEAR ?auto_13324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13323 ?auto_13320 ?auto_13321 ?auto_13322 )
      ( MAKE-3PILE ?auto_13320 ?auto_13321 ?auto_13322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13329 - BLOCK
      ?auto_13330 - BLOCK
      ?auto_13331 - BLOCK
      ?auto_13332 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_13332 ) ( CLEAR ?auto_13331 ) ( ON-TABLE ?auto_13329 ) ( ON ?auto_13330 ?auto_13329 ) ( ON ?auto_13331 ?auto_13330 ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( not ( = ?auto_13329 ?auto_13331 ) ) ( not ( = ?auto_13329 ?auto_13332 ) ) ( not ( = ?auto_13330 ?auto_13331 ) ) ( not ( = ?auto_13330 ?auto_13332 ) ) ( not ( = ?auto_13331 ?auto_13332 ) ) )
    :subtasks
    ( ( !STACK ?auto_13332 ?auto_13331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13333 - BLOCK
      ?auto_13334 - BLOCK
      ?auto_13335 - BLOCK
      ?auto_13336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13335 ) ( ON-TABLE ?auto_13333 ) ( ON ?auto_13334 ?auto_13333 ) ( ON ?auto_13335 ?auto_13334 ) ( not ( = ?auto_13333 ?auto_13334 ) ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( not ( = ?auto_13333 ?auto_13336 ) ) ( not ( = ?auto_13334 ?auto_13335 ) ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13335 ?auto_13336 ) ) ( ON-TABLE ?auto_13336 ) ( CLEAR ?auto_13336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_13336 )
      ( MAKE-4PILE ?auto_13333 ?auto_13334 ?auto_13335 ?auto_13336 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13337 - BLOCK
      ?auto_13338 - BLOCK
      ?auto_13339 - BLOCK
      ?auto_13340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13337 ) ( ON ?auto_13338 ?auto_13337 ) ( not ( = ?auto_13337 ?auto_13338 ) ) ( not ( = ?auto_13337 ?auto_13339 ) ) ( not ( = ?auto_13337 ?auto_13340 ) ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13340 ) ) ( not ( = ?auto_13339 ?auto_13340 ) ) ( ON-TABLE ?auto_13340 ) ( CLEAR ?auto_13340 ) ( HOLDING ?auto_13339 ) ( CLEAR ?auto_13338 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13337 ?auto_13338 ?auto_13339 )
      ( MAKE-4PILE ?auto_13337 ?auto_13338 ?auto_13339 ?auto_13340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13341 - BLOCK
      ?auto_13342 - BLOCK
      ?auto_13343 - BLOCK
      ?auto_13344 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13341 ) ( ON ?auto_13342 ?auto_13341 ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13343 ) ) ( not ( = ?auto_13341 ?auto_13344 ) ) ( not ( = ?auto_13342 ?auto_13343 ) ) ( not ( = ?auto_13342 ?auto_13344 ) ) ( not ( = ?auto_13343 ?auto_13344 ) ) ( ON-TABLE ?auto_13344 ) ( CLEAR ?auto_13342 ) ( ON ?auto_13343 ?auto_13344 ) ( CLEAR ?auto_13343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13344 )
      ( MAKE-4PILE ?auto_13341 ?auto_13342 ?auto_13343 ?auto_13344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13345 - BLOCK
      ?auto_13346 - BLOCK
      ?auto_13347 - BLOCK
      ?auto_13348 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13345 ) ( not ( = ?auto_13345 ?auto_13346 ) ) ( not ( = ?auto_13345 ?auto_13347 ) ) ( not ( = ?auto_13345 ?auto_13348 ) ) ( not ( = ?auto_13346 ?auto_13347 ) ) ( not ( = ?auto_13346 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( ON-TABLE ?auto_13348 ) ( ON ?auto_13347 ?auto_13348 ) ( CLEAR ?auto_13347 ) ( HOLDING ?auto_13346 ) ( CLEAR ?auto_13345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13345 ?auto_13346 )
      ( MAKE-4PILE ?auto_13345 ?auto_13346 ?auto_13347 ?auto_13348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13349 - BLOCK
      ?auto_13350 - BLOCK
      ?auto_13351 - BLOCK
      ?auto_13352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13349 ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13351 ) ) ( not ( = ?auto_13349 ?auto_13352 ) ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13351 ?auto_13352 ) ) ( ON-TABLE ?auto_13352 ) ( ON ?auto_13351 ?auto_13352 ) ( CLEAR ?auto_13349 ) ( ON ?auto_13350 ?auto_13351 ) ( CLEAR ?auto_13350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13352 ?auto_13351 )
      ( MAKE-4PILE ?auto_13349 ?auto_13350 ?auto_13351 ?auto_13352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13353 - BLOCK
      ?auto_13354 - BLOCK
      ?auto_13355 - BLOCK
      ?auto_13356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13353 ?auto_13354 ) ) ( not ( = ?auto_13353 ?auto_13355 ) ) ( not ( = ?auto_13353 ?auto_13356 ) ) ( not ( = ?auto_13354 ?auto_13355 ) ) ( not ( = ?auto_13354 ?auto_13356 ) ) ( not ( = ?auto_13355 ?auto_13356 ) ) ( ON-TABLE ?auto_13356 ) ( ON ?auto_13355 ?auto_13356 ) ( ON ?auto_13354 ?auto_13355 ) ( CLEAR ?auto_13354 ) ( HOLDING ?auto_13353 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13353 )
      ( MAKE-4PILE ?auto_13353 ?auto_13354 ?auto_13355 ?auto_13356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13357 - BLOCK
      ?auto_13358 - BLOCK
      ?auto_13359 - BLOCK
      ?auto_13360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13357 ?auto_13359 ) ) ( not ( = ?auto_13357 ?auto_13360 ) ) ( not ( = ?auto_13358 ?auto_13359 ) ) ( not ( = ?auto_13358 ?auto_13360 ) ) ( not ( = ?auto_13359 ?auto_13360 ) ) ( ON-TABLE ?auto_13360 ) ( ON ?auto_13359 ?auto_13360 ) ( ON ?auto_13358 ?auto_13359 ) ( ON ?auto_13357 ?auto_13358 ) ( CLEAR ?auto_13357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13360 ?auto_13359 ?auto_13358 )
      ( MAKE-4PILE ?auto_13357 ?auto_13358 ?auto_13359 ?auto_13360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13361 - BLOCK
      ?auto_13362 - BLOCK
      ?auto_13363 - BLOCK
      ?auto_13364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13361 ?auto_13364 ) ) ( not ( = ?auto_13362 ?auto_13363 ) ) ( not ( = ?auto_13362 ?auto_13364 ) ) ( not ( = ?auto_13363 ?auto_13364 ) ) ( ON-TABLE ?auto_13364 ) ( ON ?auto_13363 ?auto_13364 ) ( ON ?auto_13362 ?auto_13363 ) ( HOLDING ?auto_13361 ) ( CLEAR ?auto_13362 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13364 ?auto_13363 ?auto_13362 ?auto_13361 )
      ( MAKE-4PILE ?auto_13361 ?auto_13362 ?auto_13363 ?auto_13364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13365 - BLOCK
      ?auto_13366 - BLOCK
      ?auto_13367 - BLOCK
      ?auto_13368 - BLOCK
    )
    :vars
    (
      ?auto_13369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13365 ?auto_13366 ) ) ( not ( = ?auto_13365 ?auto_13367 ) ) ( not ( = ?auto_13365 ?auto_13368 ) ) ( not ( = ?auto_13366 ?auto_13367 ) ) ( not ( = ?auto_13366 ?auto_13368 ) ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( ON-TABLE ?auto_13368 ) ( ON ?auto_13367 ?auto_13368 ) ( ON ?auto_13366 ?auto_13367 ) ( CLEAR ?auto_13366 ) ( ON ?auto_13365 ?auto_13369 ) ( CLEAR ?auto_13365 ) ( HAND-EMPTY ) ( not ( = ?auto_13365 ?auto_13369 ) ) ( not ( = ?auto_13366 ?auto_13369 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( not ( = ?auto_13368 ?auto_13369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13365 ?auto_13369 )
      ( MAKE-4PILE ?auto_13365 ?auto_13366 ?auto_13367 ?auto_13368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13370 - BLOCK
      ?auto_13371 - BLOCK
      ?auto_13372 - BLOCK
      ?auto_13373 - BLOCK
    )
    :vars
    (
      ?auto_13374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13370 ?auto_13371 ) ) ( not ( = ?auto_13370 ?auto_13372 ) ) ( not ( = ?auto_13370 ?auto_13373 ) ) ( not ( = ?auto_13371 ?auto_13372 ) ) ( not ( = ?auto_13371 ?auto_13373 ) ) ( not ( = ?auto_13372 ?auto_13373 ) ) ( ON-TABLE ?auto_13373 ) ( ON ?auto_13372 ?auto_13373 ) ( ON ?auto_13370 ?auto_13374 ) ( CLEAR ?auto_13370 ) ( not ( = ?auto_13370 ?auto_13374 ) ) ( not ( = ?auto_13371 ?auto_13374 ) ) ( not ( = ?auto_13372 ?auto_13374 ) ) ( not ( = ?auto_13373 ?auto_13374 ) ) ( HOLDING ?auto_13371 ) ( CLEAR ?auto_13372 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13373 ?auto_13372 ?auto_13371 )
      ( MAKE-4PILE ?auto_13370 ?auto_13371 ?auto_13372 ?auto_13373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13375 - BLOCK
      ?auto_13376 - BLOCK
      ?auto_13377 - BLOCK
      ?auto_13378 - BLOCK
    )
    :vars
    (
      ?auto_13379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13375 ?auto_13376 ) ) ( not ( = ?auto_13375 ?auto_13377 ) ) ( not ( = ?auto_13375 ?auto_13378 ) ) ( not ( = ?auto_13376 ?auto_13377 ) ) ( not ( = ?auto_13376 ?auto_13378 ) ) ( not ( = ?auto_13377 ?auto_13378 ) ) ( ON-TABLE ?auto_13378 ) ( ON ?auto_13377 ?auto_13378 ) ( ON ?auto_13375 ?auto_13379 ) ( not ( = ?auto_13375 ?auto_13379 ) ) ( not ( = ?auto_13376 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13378 ?auto_13379 ) ) ( CLEAR ?auto_13377 ) ( ON ?auto_13376 ?auto_13375 ) ( CLEAR ?auto_13376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13379 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13379 ?auto_13375 )
      ( MAKE-4PILE ?auto_13375 ?auto_13376 ?auto_13377 ?auto_13378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13380 - BLOCK
      ?auto_13381 - BLOCK
      ?auto_13382 - BLOCK
      ?auto_13383 - BLOCK
    )
    :vars
    (
      ?auto_13384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13380 ?auto_13381 ) ) ( not ( = ?auto_13380 ?auto_13382 ) ) ( not ( = ?auto_13380 ?auto_13383 ) ) ( not ( = ?auto_13381 ?auto_13382 ) ) ( not ( = ?auto_13381 ?auto_13383 ) ) ( not ( = ?auto_13382 ?auto_13383 ) ) ( ON-TABLE ?auto_13383 ) ( ON ?auto_13380 ?auto_13384 ) ( not ( = ?auto_13380 ?auto_13384 ) ) ( not ( = ?auto_13381 ?auto_13384 ) ) ( not ( = ?auto_13382 ?auto_13384 ) ) ( not ( = ?auto_13383 ?auto_13384 ) ) ( ON ?auto_13381 ?auto_13380 ) ( CLEAR ?auto_13381 ) ( ON-TABLE ?auto_13384 ) ( HOLDING ?auto_13382 ) ( CLEAR ?auto_13383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13383 ?auto_13382 )
      ( MAKE-4PILE ?auto_13380 ?auto_13381 ?auto_13382 ?auto_13383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13385 - BLOCK
      ?auto_13386 - BLOCK
      ?auto_13387 - BLOCK
      ?auto_13388 - BLOCK
    )
    :vars
    (
      ?auto_13389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13385 ?auto_13386 ) ) ( not ( = ?auto_13385 ?auto_13387 ) ) ( not ( = ?auto_13385 ?auto_13388 ) ) ( not ( = ?auto_13386 ?auto_13387 ) ) ( not ( = ?auto_13386 ?auto_13388 ) ) ( not ( = ?auto_13387 ?auto_13388 ) ) ( ON-TABLE ?auto_13388 ) ( ON ?auto_13385 ?auto_13389 ) ( not ( = ?auto_13385 ?auto_13389 ) ) ( not ( = ?auto_13386 ?auto_13389 ) ) ( not ( = ?auto_13387 ?auto_13389 ) ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( ON ?auto_13386 ?auto_13385 ) ( ON-TABLE ?auto_13389 ) ( CLEAR ?auto_13388 ) ( ON ?auto_13387 ?auto_13386 ) ( CLEAR ?auto_13387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13389 ?auto_13385 ?auto_13386 )
      ( MAKE-4PILE ?auto_13385 ?auto_13386 ?auto_13387 ?auto_13388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13390 - BLOCK
      ?auto_13391 - BLOCK
      ?auto_13392 - BLOCK
      ?auto_13393 - BLOCK
    )
    :vars
    (
      ?auto_13394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13390 ?auto_13391 ) ) ( not ( = ?auto_13390 ?auto_13392 ) ) ( not ( = ?auto_13390 ?auto_13393 ) ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( ON ?auto_13390 ?auto_13394 ) ( not ( = ?auto_13390 ?auto_13394 ) ) ( not ( = ?auto_13391 ?auto_13394 ) ) ( not ( = ?auto_13392 ?auto_13394 ) ) ( not ( = ?auto_13393 ?auto_13394 ) ) ( ON ?auto_13391 ?auto_13390 ) ( ON-TABLE ?auto_13394 ) ( ON ?auto_13392 ?auto_13391 ) ( CLEAR ?auto_13392 ) ( HOLDING ?auto_13393 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13393 )
      ( MAKE-4PILE ?auto_13390 ?auto_13391 ?auto_13392 ?auto_13393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13395 - BLOCK
      ?auto_13396 - BLOCK
      ?auto_13397 - BLOCK
      ?auto_13398 - BLOCK
    )
    :vars
    (
      ?auto_13399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13395 ?auto_13396 ) ) ( not ( = ?auto_13395 ?auto_13397 ) ) ( not ( = ?auto_13395 ?auto_13398 ) ) ( not ( = ?auto_13396 ?auto_13397 ) ) ( not ( = ?auto_13396 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13398 ) ) ( ON ?auto_13395 ?auto_13399 ) ( not ( = ?auto_13395 ?auto_13399 ) ) ( not ( = ?auto_13396 ?auto_13399 ) ) ( not ( = ?auto_13397 ?auto_13399 ) ) ( not ( = ?auto_13398 ?auto_13399 ) ) ( ON ?auto_13396 ?auto_13395 ) ( ON-TABLE ?auto_13399 ) ( ON ?auto_13397 ?auto_13396 ) ( ON ?auto_13398 ?auto_13397 ) ( CLEAR ?auto_13398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13399 ?auto_13395 ?auto_13396 ?auto_13397 )
      ( MAKE-4PILE ?auto_13395 ?auto_13396 ?auto_13397 ?auto_13398 ) )
  )

)

