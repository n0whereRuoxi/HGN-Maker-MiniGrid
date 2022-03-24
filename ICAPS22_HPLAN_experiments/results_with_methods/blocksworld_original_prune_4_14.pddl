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
      ?auto_12812 - BLOCK
      ?auto_12813 - BLOCK
      ?auto_12814 - BLOCK
      ?auto_12815 - BLOCK
    )
    :vars
    (
      ?auto_12816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12816 ?auto_12815 ) ( CLEAR ?auto_12816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12812 ) ( ON ?auto_12813 ?auto_12812 ) ( ON ?auto_12814 ?auto_12813 ) ( ON ?auto_12815 ?auto_12814 ) ( not ( = ?auto_12812 ?auto_12813 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12815 ) ) ( not ( = ?auto_12812 ?auto_12816 ) ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) ( not ( = ?auto_12813 ?auto_12816 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12816 ) ) ( not ( = ?auto_12815 ?auto_12816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12816 ?auto_12815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12818 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12819 - BLOCK
    )
    :vars
    (
      ?auto_12820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12819 ?auto_12820 ) ( CLEAR ?auto_12819 ) ( HAND-EMPTY ) ( not ( = ?auto_12819 ?auto_12820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12819 ?auto_12820 )
      ( MAKE-1PILE ?auto_12819 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12824 - BLOCK
      ?auto_12825 - BLOCK
      ?auto_12826 - BLOCK
    )
    :vars
    (
      ?auto_12827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12827 ?auto_12826 ) ( CLEAR ?auto_12827 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12824 ) ( ON ?auto_12825 ?auto_12824 ) ( ON ?auto_12826 ?auto_12825 ) ( not ( = ?auto_12824 ?auto_12825 ) ) ( not ( = ?auto_12824 ?auto_12826 ) ) ( not ( = ?auto_12824 ?auto_12827 ) ) ( not ( = ?auto_12825 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12827 ) ) ( not ( = ?auto_12826 ?auto_12827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12827 ?auto_12826 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12828 - BLOCK
      ?auto_12829 - BLOCK
      ?auto_12830 - BLOCK
    )
    :vars
    (
      ?auto_12831 - BLOCK
      ?auto_12832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12831 ?auto_12830 ) ( CLEAR ?auto_12831 ) ( ON-TABLE ?auto_12828 ) ( ON ?auto_12829 ?auto_12828 ) ( ON ?auto_12830 ?auto_12829 ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( not ( = ?auto_12828 ?auto_12830 ) ) ( not ( = ?auto_12828 ?auto_12831 ) ) ( not ( = ?auto_12829 ?auto_12830 ) ) ( not ( = ?auto_12829 ?auto_12831 ) ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( HOLDING ?auto_12832 ) ( not ( = ?auto_12828 ?auto_12832 ) ) ( not ( = ?auto_12829 ?auto_12832 ) ) ( not ( = ?auto_12830 ?auto_12832 ) ) ( not ( = ?auto_12831 ?auto_12832 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_12832 )
      ( MAKE-3PILE ?auto_12828 ?auto_12829 ?auto_12830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12833 - BLOCK
      ?auto_12834 - BLOCK
      ?auto_12835 - BLOCK
    )
    :vars
    (
      ?auto_12836 - BLOCK
      ?auto_12837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12836 ?auto_12835 ) ( ON-TABLE ?auto_12833 ) ( ON ?auto_12834 ?auto_12833 ) ( ON ?auto_12835 ?auto_12834 ) ( not ( = ?auto_12833 ?auto_12834 ) ) ( not ( = ?auto_12833 ?auto_12835 ) ) ( not ( = ?auto_12833 ?auto_12836 ) ) ( not ( = ?auto_12834 ?auto_12835 ) ) ( not ( = ?auto_12834 ?auto_12836 ) ) ( not ( = ?auto_12835 ?auto_12836 ) ) ( not ( = ?auto_12833 ?auto_12837 ) ) ( not ( = ?auto_12834 ?auto_12837 ) ) ( not ( = ?auto_12835 ?auto_12837 ) ) ( not ( = ?auto_12836 ?auto_12837 ) ) ( ON ?auto_12837 ?auto_12836 ) ( CLEAR ?auto_12837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12833 ?auto_12834 ?auto_12835 ?auto_12836 )
      ( MAKE-3PILE ?auto_12833 ?auto_12834 ?auto_12835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12840 - BLOCK
      ?auto_12841 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12841 ) ( CLEAR ?auto_12840 ) ( ON-TABLE ?auto_12840 ) ( not ( = ?auto_12840 ?auto_12841 ) ) )
    :subtasks
    ( ( !STACK ?auto_12841 ?auto_12840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12842 - BLOCK
      ?auto_12843 - BLOCK
    )
    :vars
    (
      ?auto_12844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12842 ) ( ON-TABLE ?auto_12842 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( ON ?auto_12843 ?auto_12844 ) ( CLEAR ?auto_12843 ) ( HAND-EMPTY ) ( not ( = ?auto_12842 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12844 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12843 ?auto_12844 )
      ( MAKE-2PILE ?auto_12842 ?auto_12843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12845 - BLOCK
      ?auto_12846 - BLOCK
    )
    :vars
    (
      ?auto_12847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12845 ?auto_12846 ) ) ( ON ?auto_12846 ?auto_12847 ) ( CLEAR ?auto_12846 ) ( not ( = ?auto_12845 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12847 ) ) ( HOLDING ?auto_12845 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12845 )
      ( MAKE-2PILE ?auto_12845 ?auto_12846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12848 - BLOCK
      ?auto_12849 - BLOCK
    )
    :vars
    (
      ?auto_12850 - BLOCK
      ?auto_12852 - BLOCK
      ?auto_12851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12848 ?auto_12849 ) ) ( ON ?auto_12849 ?auto_12850 ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( ON ?auto_12848 ?auto_12849 ) ( CLEAR ?auto_12848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12852 ) ( ON ?auto_12851 ?auto_12852 ) ( ON ?auto_12850 ?auto_12851 ) ( not ( = ?auto_12852 ?auto_12851 ) ) ( not ( = ?auto_12852 ?auto_12850 ) ) ( not ( = ?auto_12852 ?auto_12849 ) ) ( not ( = ?auto_12852 ?auto_12848 ) ) ( not ( = ?auto_12851 ?auto_12850 ) ) ( not ( = ?auto_12851 ?auto_12849 ) ) ( not ( = ?auto_12851 ?auto_12848 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12852 ?auto_12851 ?auto_12850 ?auto_12849 )
      ( MAKE-2PILE ?auto_12848 ?auto_12849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12855 - BLOCK
      ?auto_12856 - BLOCK
    )
    :vars
    (
      ?auto_12857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12857 ?auto_12856 ) ( CLEAR ?auto_12857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12855 ) ( ON ?auto_12856 ?auto_12855 ) ( not ( = ?auto_12855 ?auto_12856 ) ) ( not ( = ?auto_12855 ?auto_12857 ) ) ( not ( = ?auto_12856 ?auto_12857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12857 ?auto_12856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12858 - BLOCK
      ?auto_12859 - BLOCK
    )
    :vars
    (
      ?auto_12860 - BLOCK
      ?auto_12861 - BLOCK
      ?auto_12862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12860 ?auto_12859 ) ( CLEAR ?auto_12860 ) ( ON-TABLE ?auto_12858 ) ( ON ?auto_12859 ?auto_12858 ) ( not ( = ?auto_12858 ?auto_12859 ) ) ( not ( = ?auto_12858 ?auto_12860 ) ) ( not ( = ?auto_12859 ?auto_12860 ) ) ( HOLDING ?auto_12861 ) ( CLEAR ?auto_12862 ) ( not ( = ?auto_12858 ?auto_12861 ) ) ( not ( = ?auto_12858 ?auto_12862 ) ) ( not ( = ?auto_12859 ?auto_12861 ) ) ( not ( = ?auto_12859 ?auto_12862 ) ) ( not ( = ?auto_12860 ?auto_12861 ) ) ( not ( = ?auto_12860 ?auto_12862 ) ) ( not ( = ?auto_12861 ?auto_12862 ) ) )
    :subtasks
    ( ( !STACK ?auto_12861 ?auto_12862 )
      ( MAKE-2PILE ?auto_12858 ?auto_12859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13058 - BLOCK
      ?auto_13059 - BLOCK
    )
    :vars
    (
      ?auto_13060 - BLOCK
      ?auto_13061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13060 ?auto_13059 ) ( ON-TABLE ?auto_13058 ) ( ON ?auto_13059 ?auto_13058 ) ( not ( = ?auto_13058 ?auto_13059 ) ) ( not ( = ?auto_13058 ?auto_13060 ) ) ( not ( = ?auto_13059 ?auto_13060 ) ) ( not ( = ?auto_13058 ?auto_13061 ) ) ( not ( = ?auto_13059 ?auto_13061 ) ) ( not ( = ?auto_13060 ?auto_13061 ) ) ( ON ?auto_13061 ?auto_13060 ) ( CLEAR ?auto_13061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13058 ?auto_13059 ?auto_13060 )
      ( MAKE-2PILE ?auto_13058 ?auto_13059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12868 - BLOCK
      ?auto_12869 - BLOCK
    )
    :vars
    (
      ?auto_12872 - BLOCK
      ?auto_12870 - BLOCK
      ?auto_12871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12872 ?auto_12869 ) ( ON-TABLE ?auto_12868 ) ( ON ?auto_12869 ?auto_12868 ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12872 ) ) ( not ( = ?auto_12869 ?auto_12872 ) ) ( not ( = ?auto_12868 ?auto_12870 ) ) ( not ( = ?auto_12868 ?auto_12871 ) ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12872 ?auto_12870 ) ) ( not ( = ?auto_12872 ?auto_12871 ) ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( ON ?auto_12870 ?auto_12872 ) ( CLEAR ?auto_12870 ) ( HOLDING ?auto_12871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12871 )
      ( MAKE-2PILE ?auto_12868 ?auto_12869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12873 - BLOCK
      ?auto_12874 - BLOCK
    )
    :vars
    (
      ?auto_12877 - BLOCK
      ?auto_12876 - BLOCK
      ?auto_12875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12877 ?auto_12874 ) ( ON-TABLE ?auto_12873 ) ( ON ?auto_12874 ?auto_12873 ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( not ( = ?auto_12873 ?auto_12877 ) ) ( not ( = ?auto_12874 ?auto_12877 ) ) ( not ( = ?auto_12873 ?auto_12876 ) ) ( not ( = ?auto_12873 ?auto_12875 ) ) ( not ( = ?auto_12874 ?auto_12876 ) ) ( not ( = ?auto_12874 ?auto_12875 ) ) ( not ( = ?auto_12877 ?auto_12876 ) ) ( not ( = ?auto_12877 ?auto_12875 ) ) ( not ( = ?auto_12876 ?auto_12875 ) ) ( ON ?auto_12876 ?auto_12877 ) ( ON ?auto_12875 ?auto_12876 ) ( CLEAR ?auto_12875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12873 ?auto_12874 ?auto_12877 ?auto_12876 )
      ( MAKE-2PILE ?auto_12873 ?auto_12874 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12881 - BLOCK
      ?auto_12882 - BLOCK
      ?auto_12883 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12883 ) ( CLEAR ?auto_12882 ) ( ON-TABLE ?auto_12881 ) ( ON ?auto_12882 ?auto_12881 ) ( not ( = ?auto_12881 ?auto_12882 ) ) ( not ( = ?auto_12881 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12883 ) ) )
    :subtasks
    ( ( !STACK ?auto_12883 ?auto_12882 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12884 - BLOCK
      ?auto_12885 - BLOCK
      ?auto_12886 - BLOCK
    )
    :vars
    (
      ?auto_12887 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12885 ) ( ON-TABLE ?auto_12884 ) ( ON ?auto_12885 ?auto_12884 ) ( not ( = ?auto_12884 ?auto_12885 ) ) ( not ( = ?auto_12884 ?auto_12886 ) ) ( not ( = ?auto_12885 ?auto_12886 ) ) ( ON ?auto_12886 ?auto_12887 ) ( CLEAR ?auto_12886 ) ( HAND-EMPTY ) ( not ( = ?auto_12884 ?auto_12887 ) ) ( not ( = ?auto_12885 ?auto_12887 ) ) ( not ( = ?auto_12886 ?auto_12887 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12886 ?auto_12887 )
      ( MAKE-3PILE ?auto_12884 ?auto_12885 ?auto_12886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12888 - BLOCK
      ?auto_12889 - BLOCK
      ?auto_12890 - BLOCK
    )
    :vars
    (
      ?auto_12891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12888 ) ( not ( = ?auto_12888 ?auto_12889 ) ) ( not ( = ?auto_12888 ?auto_12890 ) ) ( not ( = ?auto_12889 ?auto_12890 ) ) ( ON ?auto_12890 ?auto_12891 ) ( CLEAR ?auto_12890 ) ( not ( = ?auto_12888 ?auto_12891 ) ) ( not ( = ?auto_12889 ?auto_12891 ) ) ( not ( = ?auto_12890 ?auto_12891 ) ) ( HOLDING ?auto_12889 ) ( CLEAR ?auto_12888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12888 ?auto_12889 )
      ( MAKE-3PILE ?auto_12888 ?auto_12889 ?auto_12890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12892 - BLOCK
      ?auto_12893 - BLOCK
      ?auto_12894 - BLOCK
    )
    :vars
    (
      ?auto_12895 - BLOCK
      ?auto_12896 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12892 ) ( not ( = ?auto_12892 ?auto_12893 ) ) ( not ( = ?auto_12892 ?auto_12894 ) ) ( not ( = ?auto_12893 ?auto_12894 ) ) ( ON ?auto_12894 ?auto_12895 ) ( not ( = ?auto_12892 ?auto_12895 ) ) ( not ( = ?auto_12893 ?auto_12895 ) ) ( not ( = ?auto_12894 ?auto_12895 ) ) ( CLEAR ?auto_12892 ) ( ON ?auto_12893 ?auto_12894 ) ( CLEAR ?auto_12893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12896 ) ( ON ?auto_12895 ?auto_12896 ) ( not ( = ?auto_12896 ?auto_12895 ) ) ( not ( = ?auto_12896 ?auto_12894 ) ) ( not ( = ?auto_12896 ?auto_12893 ) ) ( not ( = ?auto_12892 ?auto_12896 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12896 ?auto_12895 ?auto_12894 )
      ( MAKE-3PILE ?auto_12892 ?auto_12893 ?auto_12894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12897 - BLOCK
      ?auto_12898 - BLOCK
      ?auto_12899 - BLOCK
    )
    :vars
    (
      ?auto_12900 - BLOCK
      ?auto_12901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12897 ?auto_12898 ) ) ( not ( = ?auto_12897 ?auto_12899 ) ) ( not ( = ?auto_12898 ?auto_12899 ) ) ( ON ?auto_12899 ?auto_12900 ) ( not ( = ?auto_12897 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( ON ?auto_12898 ?auto_12899 ) ( CLEAR ?auto_12898 ) ( ON-TABLE ?auto_12901 ) ( ON ?auto_12900 ?auto_12901 ) ( not ( = ?auto_12901 ?auto_12900 ) ) ( not ( = ?auto_12901 ?auto_12899 ) ) ( not ( = ?auto_12901 ?auto_12898 ) ) ( not ( = ?auto_12897 ?auto_12901 ) ) ( HOLDING ?auto_12897 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12897 )
      ( MAKE-3PILE ?auto_12897 ?auto_12898 ?auto_12899 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12902 - BLOCK
      ?auto_12903 - BLOCK
      ?auto_12904 - BLOCK
    )
    :vars
    (
      ?auto_12906 - BLOCK
      ?auto_12905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12902 ?auto_12903 ) ) ( not ( = ?auto_12902 ?auto_12904 ) ) ( not ( = ?auto_12903 ?auto_12904 ) ) ( ON ?auto_12904 ?auto_12906 ) ( not ( = ?auto_12902 ?auto_12906 ) ) ( not ( = ?auto_12903 ?auto_12906 ) ) ( not ( = ?auto_12904 ?auto_12906 ) ) ( ON ?auto_12903 ?auto_12904 ) ( ON-TABLE ?auto_12905 ) ( ON ?auto_12906 ?auto_12905 ) ( not ( = ?auto_12905 ?auto_12906 ) ) ( not ( = ?auto_12905 ?auto_12904 ) ) ( not ( = ?auto_12905 ?auto_12903 ) ) ( not ( = ?auto_12902 ?auto_12905 ) ) ( ON ?auto_12902 ?auto_12903 ) ( CLEAR ?auto_12902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12905 ?auto_12906 ?auto_12904 ?auto_12903 )
      ( MAKE-3PILE ?auto_12902 ?auto_12903 ?auto_12904 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12908 - BLOCK
    )
    :vars
    (
      ?auto_12909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12909 ?auto_12908 ) ( CLEAR ?auto_12909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12908 ) ( not ( = ?auto_12908 ?auto_12909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12909 ?auto_12908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12910 - BLOCK
    )
    :vars
    (
      ?auto_12911 - BLOCK
      ?auto_12912 - BLOCK
      ?auto_12913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12911 ?auto_12910 ) ( CLEAR ?auto_12911 ) ( ON-TABLE ?auto_12910 ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( HOLDING ?auto_12912 ) ( CLEAR ?auto_12913 ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12913 ) ) )
    :subtasks
    ( ( !STACK ?auto_12912 ?auto_12913 )
      ( MAKE-1PILE ?auto_12910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12914 - BLOCK
    )
    :vars
    (
      ?auto_12916 - BLOCK
      ?auto_12917 - BLOCK
      ?auto_12915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12916 ?auto_12914 ) ( ON-TABLE ?auto_12914 ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12915 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( ON ?auto_12915 ?auto_12916 ) ( CLEAR ?auto_12915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12914 ?auto_12916 )
      ( MAKE-1PILE ?auto_12914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12918 - BLOCK
    )
    :vars
    (
      ?auto_12921 - BLOCK
      ?auto_12919 - BLOCK
      ?auto_12920 - BLOCK
      ?auto_12922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12921 ?auto_12918 ) ( ON-TABLE ?auto_12918 ) ( not ( = ?auto_12918 ?auto_12921 ) ) ( not ( = ?auto_12918 ?auto_12919 ) ) ( not ( = ?auto_12918 ?auto_12920 ) ) ( not ( = ?auto_12921 ?auto_12919 ) ) ( not ( = ?auto_12921 ?auto_12920 ) ) ( not ( = ?auto_12919 ?auto_12920 ) ) ( ON ?auto_12919 ?auto_12921 ) ( CLEAR ?auto_12919 ) ( HOLDING ?auto_12920 ) ( CLEAR ?auto_12922 ) ( ON-TABLE ?auto_12922 ) ( not ( = ?auto_12922 ?auto_12920 ) ) ( not ( = ?auto_12918 ?auto_12922 ) ) ( not ( = ?auto_12921 ?auto_12922 ) ) ( not ( = ?auto_12919 ?auto_12922 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12922 ?auto_12920 )
      ( MAKE-1PILE ?auto_12918 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13146 - BLOCK
    )
    :vars
    (
      ?auto_13149 - BLOCK
      ?auto_13148 - BLOCK
      ?auto_13147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13149 ?auto_13146 ) ( ON-TABLE ?auto_13146 ) ( not ( = ?auto_13146 ?auto_13149 ) ) ( not ( = ?auto_13146 ?auto_13148 ) ) ( not ( = ?auto_13146 ?auto_13147 ) ) ( not ( = ?auto_13149 ?auto_13148 ) ) ( not ( = ?auto_13149 ?auto_13147 ) ) ( not ( = ?auto_13148 ?auto_13147 ) ) ( ON ?auto_13148 ?auto_13149 ) ( ON ?auto_13147 ?auto_13148 ) ( CLEAR ?auto_13147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13146 ?auto_13149 ?auto_13148 )
      ( MAKE-1PILE ?auto_13146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12928 - BLOCK
    )
    :vars
    (
      ?auto_12929 - BLOCK
      ?auto_12931 - BLOCK
      ?auto_12932 - BLOCK
      ?auto_12930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12929 ?auto_12928 ) ( ON-TABLE ?auto_12928 ) ( not ( = ?auto_12928 ?auto_12929 ) ) ( not ( = ?auto_12928 ?auto_12931 ) ) ( not ( = ?auto_12928 ?auto_12932 ) ) ( not ( = ?auto_12929 ?auto_12931 ) ) ( not ( = ?auto_12929 ?auto_12932 ) ) ( not ( = ?auto_12931 ?auto_12932 ) ) ( ON ?auto_12931 ?auto_12929 ) ( not ( = ?auto_12930 ?auto_12932 ) ) ( not ( = ?auto_12928 ?auto_12930 ) ) ( not ( = ?auto_12929 ?auto_12930 ) ) ( not ( = ?auto_12931 ?auto_12930 ) ) ( ON ?auto_12932 ?auto_12931 ) ( CLEAR ?auto_12932 ) ( HOLDING ?auto_12930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12930 )
      ( MAKE-1PILE ?auto_12928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12933 - BLOCK
    )
    :vars
    (
      ?auto_12935 - BLOCK
      ?auto_12937 - BLOCK
      ?auto_12936 - BLOCK
      ?auto_12934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12935 ?auto_12933 ) ( ON-TABLE ?auto_12933 ) ( not ( = ?auto_12933 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12937 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( not ( = ?auto_12935 ?auto_12937 ) ) ( not ( = ?auto_12935 ?auto_12936 ) ) ( not ( = ?auto_12937 ?auto_12936 ) ) ( ON ?auto_12937 ?auto_12935 ) ( not ( = ?auto_12934 ?auto_12936 ) ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12935 ?auto_12934 ) ) ( not ( = ?auto_12937 ?auto_12934 ) ) ( ON ?auto_12936 ?auto_12937 ) ( ON ?auto_12934 ?auto_12936 ) ( CLEAR ?auto_12934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12933 ?auto_12935 ?auto_12937 ?auto_12936 )
      ( MAKE-1PILE ?auto_12933 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12942 - BLOCK
      ?auto_12943 - BLOCK
      ?auto_12944 - BLOCK
      ?auto_12945 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_12945 ) ( CLEAR ?auto_12944 ) ( ON-TABLE ?auto_12942 ) ( ON ?auto_12943 ?auto_12942 ) ( ON ?auto_12944 ?auto_12943 ) ( not ( = ?auto_12942 ?auto_12943 ) ) ( not ( = ?auto_12942 ?auto_12944 ) ) ( not ( = ?auto_12942 ?auto_12945 ) ) ( not ( = ?auto_12943 ?auto_12944 ) ) ( not ( = ?auto_12943 ?auto_12945 ) ) ( not ( = ?auto_12944 ?auto_12945 ) ) )
    :subtasks
    ( ( !STACK ?auto_12945 ?auto_12944 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12946 - BLOCK
      ?auto_12947 - BLOCK
      ?auto_12948 - BLOCK
      ?auto_12949 - BLOCK
    )
    :vars
    (
      ?auto_12950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12948 ) ( ON-TABLE ?auto_12946 ) ( ON ?auto_12947 ?auto_12946 ) ( ON ?auto_12948 ?auto_12947 ) ( not ( = ?auto_12946 ?auto_12947 ) ) ( not ( = ?auto_12946 ?auto_12948 ) ) ( not ( = ?auto_12946 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12948 ) ) ( not ( = ?auto_12947 ?auto_12949 ) ) ( not ( = ?auto_12948 ?auto_12949 ) ) ( ON ?auto_12949 ?auto_12950 ) ( CLEAR ?auto_12949 ) ( HAND-EMPTY ) ( not ( = ?auto_12946 ?auto_12950 ) ) ( not ( = ?auto_12947 ?auto_12950 ) ) ( not ( = ?auto_12948 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12949 ?auto_12950 )
      ( MAKE-4PILE ?auto_12946 ?auto_12947 ?auto_12948 ?auto_12949 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12951 - BLOCK
      ?auto_12952 - BLOCK
      ?auto_12953 - BLOCK
      ?auto_12954 - BLOCK
    )
    :vars
    (
      ?auto_12955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12951 ) ( ON ?auto_12952 ?auto_12951 ) ( not ( = ?auto_12951 ?auto_12952 ) ) ( not ( = ?auto_12951 ?auto_12953 ) ) ( not ( = ?auto_12951 ?auto_12954 ) ) ( not ( = ?auto_12952 ?auto_12953 ) ) ( not ( = ?auto_12952 ?auto_12954 ) ) ( not ( = ?auto_12953 ?auto_12954 ) ) ( ON ?auto_12954 ?auto_12955 ) ( CLEAR ?auto_12954 ) ( not ( = ?auto_12951 ?auto_12955 ) ) ( not ( = ?auto_12952 ?auto_12955 ) ) ( not ( = ?auto_12953 ?auto_12955 ) ) ( not ( = ?auto_12954 ?auto_12955 ) ) ( HOLDING ?auto_12953 ) ( CLEAR ?auto_12952 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12951 ?auto_12952 ?auto_12953 )
      ( MAKE-4PILE ?auto_12951 ?auto_12952 ?auto_12953 ?auto_12954 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12956 - BLOCK
      ?auto_12957 - BLOCK
      ?auto_12958 - BLOCK
      ?auto_12959 - BLOCK
    )
    :vars
    (
      ?auto_12960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12956 ) ( ON ?auto_12957 ?auto_12956 ) ( not ( = ?auto_12956 ?auto_12957 ) ) ( not ( = ?auto_12956 ?auto_12958 ) ) ( not ( = ?auto_12956 ?auto_12959 ) ) ( not ( = ?auto_12957 ?auto_12958 ) ) ( not ( = ?auto_12957 ?auto_12959 ) ) ( not ( = ?auto_12958 ?auto_12959 ) ) ( ON ?auto_12959 ?auto_12960 ) ( not ( = ?auto_12956 ?auto_12960 ) ) ( not ( = ?auto_12957 ?auto_12960 ) ) ( not ( = ?auto_12958 ?auto_12960 ) ) ( not ( = ?auto_12959 ?auto_12960 ) ) ( CLEAR ?auto_12957 ) ( ON ?auto_12958 ?auto_12959 ) ( CLEAR ?auto_12958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12960 ?auto_12959 )
      ( MAKE-4PILE ?auto_12956 ?auto_12957 ?auto_12958 ?auto_12959 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12961 - BLOCK
      ?auto_12962 - BLOCK
      ?auto_12963 - BLOCK
      ?auto_12964 - BLOCK
    )
    :vars
    (
      ?auto_12965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12961 ) ( not ( = ?auto_12961 ?auto_12962 ) ) ( not ( = ?auto_12961 ?auto_12963 ) ) ( not ( = ?auto_12961 ?auto_12964 ) ) ( not ( = ?auto_12962 ?auto_12963 ) ) ( not ( = ?auto_12962 ?auto_12964 ) ) ( not ( = ?auto_12963 ?auto_12964 ) ) ( ON ?auto_12964 ?auto_12965 ) ( not ( = ?auto_12961 ?auto_12965 ) ) ( not ( = ?auto_12962 ?auto_12965 ) ) ( not ( = ?auto_12963 ?auto_12965 ) ) ( not ( = ?auto_12964 ?auto_12965 ) ) ( ON ?auto_12963 ?auto_12964 ) ( CLEAR ?auto_12963 ) ( ON-TABLE ?auto_12965 ) ( HOLDING ?auto_12962 ) ( CLEAR ?auto_12961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12961 ?auto_12962 )
      ( MAKE-4PILE ?auto_12961 ?auto_12962 ?auto_12963 ?auto_12964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12966 - BLOCK
      ?auto_12967 - BLOCK
      ?auto_12968 - BLOCK
      ?auto_12969 - BLOCK
    )
    :vars
    (
      ?auto_12970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12966 ) ( not ( = ?auto_12966 ?auto_12967 ) ) ( not ( = ?auto_12966 ?auto_12968 ) ) ( not ( = ?auto_12966 ?auto_12969 ) ) ( not ( = ?auto_12967 ?auto_12968 ) ) ( not ( = ?auto_12967 ?auto_12969 ) ) ( not ( = ?auto_12968 ?auto_12969 ) ) ( ON ?auto_12969 ?auto_12970 ) ( not ( = ?auto_12966 ?auto_12970 ) ) ( not ( = ?auto_12967 ?auto_12970 ) ) ( not ( = ?auto_12968 ?auto_12970 ) ) ( not ( = ?auto_12969 ?auto_12970 ) ) ( ON ?auto_12968 ?auto_12969 ) ( ON-TABLE ?auto_12970 ) ( CLEAR ?auto_12966 ) ( ON ?auto_12967 ?auto_12968 ) ( CLEAR ?auto_12967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12970 ?auto_12969 ?auto_12968 )
      ( MAKE-4PILE ?auto_12966 ?auto_12967 ?auto_12968 ?auto_12969 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12971 - BLOCK
      ?auto_12972 - BLOCK
      ?auto_12973 - BLOCK
      ?auto_12974 - BLOCK
    )
    :vars
    (
      ?auto_12975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12971 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12973 ) ) ( not ( = ?auto_12971 ?auto_12974 ) ) ( not ( = ?auto_12972 ?auto_12973 ) ) ( not ( = ?auto_12972 ?auto_12974 ) ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( ON ?auto_12974 ?auto_12975 ) ( not ( = ?auto_12971 ?auto_12975 ) ) ( not ( = ?auto_12972 ?auto_12975 ) ) ( not ( = ?auto_12973 ?auto_12975 ) ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( ON ?auto_12973 ?auto_12974 ) ( ON-TABLE ?auto_12975 ) ( ON ?auto_12972 ?auto_12973 ) ( CLEAR ?auto_12972 ) ( HOLDING ?auto_12971 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12971 )
      ( MAKE-4PILE ?auto_12971 ?auto_12972 ?auto_12973 ?auto_12974 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12976 - BLOCK
      ?auto_12977 - BLOCK
      ?auto_12978 - BLOCK
      ?auto_12979 - BLOCK
    )
    :vars
    (
      ?auto_12980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12976 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12978 ) ) ( not ( = ?auto_12976 ?auto_12979 ) ) ( not ( = ?auto_12977 ?auto_12978 ) ) ( not ( = ?auto_12977 ?auto_12979 ) ) ( not ( = ?auto_12978 ?auto_12979 ) ) ( ON ?auto_12979 ?auto_12980 ) ( not ( = ?auto_12976 ?auto_12980 ) ) ( not ( = ?auto_12977 ?auto_12980 ) ) ( not ( = ?auto_12978 ?auto_12980 ) ) ( not ( = ?auto_12979 ?auto_12980 ) ) ( ON ?auto_12978 ?auto_12979 ) ( ON-TABLE ?auto_12980 ) ( ON ?auto_12977 ?auto_12978 ) ( ON ?auto_12976 ?auto_12977 ) ( CLEAR ?auto_12976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12980 ?auto_12979 ?auto_12978 ?auto_12977 )
      ( MAKE-4PILE ?auto_12976 ?auto_12977 ?auto_12978 ?auto_12979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13021 - BLOCK
    )
    :vars
    (
      ?auto_13022 - BLOCK
      ?auto_13023 - BLOCK
      ?auto_13024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13021 ?auto_13022 ) ( CLEAR ?auto_13021 ) ( not ( = ?auto_13021 ?auto_13022 ) ) ( HOLDING ?auto_13023 ) ( CLEAR ?auto_13024 ) ( not ( = ?auto_13021 ?auto_13023 ) ) ( not ( = ?auto_13021 ?auto_13024 ) ) ( not ( = ?auto_13022 ?auto_13023 ) ) ( not ( = ?auto_13022 ?auto_13024 ) ) ( not ( = ?auto_13023 ?auto_13024 ) ) )
    :subtasks
    ( ( !STACK ?auto_13023 ?auto_13024 )
      ( MAKE-1PILE ?auto_13021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13025 - BLOCK
    )
    :vars
    (
      ?auto_13027 - BLOCK
      ?auto_13028 - BLOCK
      ?auto_13026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13025 ?auto_13027 ) ( not ( = ?auto_13025 ?auto_13027 ) ) ( CLEAR ?auto_13028 ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13025 ?auto_13028 ) ) ( not ( = ?auto_13027 ?auto_13026 ) ) ( not ( = ?auto_13027 ?auto_13028 ) ) ( not ( = ?auto_13026 ?auto_13028 ) ) ( ON ?auto_13026 ?auto_13025 ) ( CLEAR ?auto_13026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13027 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13027 ?auto_13025 )
      ( MAKE-1PILE ?auto_13025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13029 - BLOCK
    )
    :vars
    (
      ?auto_13032 - BLOCK
      ?auto_13031 - BLOCK
      ?auto_13030 - BLOCK
      ?auto_13033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13029 ?auto_13032 ) ( not ( = ?auto_13029 ?auto_13032 ) ) ( not ( = ?auto_13029 ?auto_13031 ) ) ( not ( = ?auto_13029 ?auto_13030 ) ) ( not ( = ?auto_13032 ?auto_13031 ) ) ( not ( = ?auto_13032 ?auto_13030 ) ) ( not ( = ?auto_13031 ?auto_13030 ) ) ( ON ?auto_13031 ?auto_13029 ) ( CLEAR ?auto_13031 ) ( ON-TABLE ?auto_13032 ) ( HOLDING ?auto_13030 ) ( CLEAR ?auto_13033 ) ( ON-TABLE ?auto_13033 ) ( not ( = ?auto_13033 ?auto_13030 ) ) ( not ( = ?auto_13029 ?auto_13033 ) ) ( not ( = ?auto_13032 ?auto_13033 ) ) ( not ( = ?auto_13031 ?auto_13033 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13033 ?auto_13030 )
      ( MAKE-1PILE ?auto_13029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13034 - BLOCK
    )
    :vars
    (
      ?auto_13038 - BLOCK
      ?auto_13036 - BLOCK
      ?auto_13035 - BLOCK
      ?auto_13037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13034 ?auto_13038 ) ( not ( = ?auto_13034 ?auto_13038 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13038 ?auto_13036 ) ) ( not ( = ?auto_13038 ?auto_13035 ) ) ( not ( = ?auto_13036 ?auto_13035 ) ) ( ON ?auto_13036 ?auto_13034 ) ( ON-TABLE ?auto_13038 ) ( CLEAR ?auto_13037 ) ( ON-TABLE ?auto_13037 ) ( not ( = ?auto_13037 ?auto_13035 ) ) ( not ( = ?auto_13034 ?auto_13037 ) ) ( not ( = ?auto_13038 ?auto_13037 ) ) ( not ( = ?auto_13036 ?auto_13037 ) ) ( ON ?auto_13035 ?auto_13036 ) ( CLEAR ?auto_13035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13038 ?auto_13034 ?auto_13036 )
      ( MAKE-1PILE ?auto_13034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13039 - BLOCK
    )
    :vars
    (
      ?auto_13042 - BLOCK
      ?auto_13040 - BLOCK
      ?auto_13041 - BLOCK
      ?auto_13043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13039 ?auto_13042 ) ( not ( = ?auto_13039 ?auto_13042 ) ) ( not ( = ?auto_13039 ?auto_13040 ) ) ( not ( = ?auto_13039 ?auto_13041 ) ) ( not ( = ?auto_13042 ?auto_13040 ) ) ( not ( = ?auto_13042 ?auto_13041 ) ) ( not ( = ?auto_13040 ?auto_13041 ) ) ( ON ?auto_13040 ?auto_13039 ) ( ON-TABLE ?auto_13042 ) ( not ( = ?auto_13043 ?auto_13041 ) ) ( not ( = ?auto_13039 ?auto_13043 ) ) ( not ( = ?auto_13042 ?auto_13043 ) ) ( not ( = ?auto_13040 ?auto_13043 ) ) ( ON ?auto_13041 ?auto_13040 ) ( CLEAR ?auto_13041 ) ( HOLDING ?auto_13043 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13043 )
      ( MAKE-1PILE ?auto_13039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13044 - BLOCK
    )
    :vars
    (
      ?auto_13048 - BLOCK
      ?auto_13045 - BLOCK
      ?auto_13047 - BLOCK
      ?auto_13046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13044 ?auto_13048 ) ( not ( = ?auto_13044 ?auto_13048 ) ) ( not ( = ?auto_13044 ?auto_13045 ) ) ( not ( = ?auto_13044 ?auto_13047 ) ) ( not ( = ?auto_13048 ?auto_13045 ) ) ( not ( = ?auto_13048 ?auto_13047 ) ) ( not ( = ?auto_13045 ?auto_13047 ) ) ( ON ?auto_13045 ?auto_13044 ) ( ON-TABLE ?auto_13048 ) ( not ( = ?auto_13046 ?auto_13047 ) ) ( not ( = ?auto_13044 ?auto_13046 ) ) ( not ( = ?auto_13048 ?auto_13046 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( ON ?auto_13047 ?auto_13045 ) ( ON ?auto_13046 ?auto_13047 ) ( CLEAR ?auto_13046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13048 ?auto_13044 ?auto_13045 ?auto_13047 )
      ( MAKE-1PILE ?auto_13044 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13054 - BLOCK
      ?auto_13055 - BLOCK
    )
    :vars
    (
      ?auto_13056 - BLOCK
      ?auto_13057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13056 ?auto_13055 ) ( CLEAR ?auto_13056 ) ( ON-TABLE ?auto_13054 ) ( ON ?auto_13055 ?auto_13054 ) ( not ( = ?auto_13054 ?auto_13055 ) ) ( not ( = ?auto_13054 ?auto_13056 ) ) ( not ( = ?auto_13055 ?auto_13056 ) ) ( HOLDING ?auto_13057 ) ( not ( = ?auto_13054 ?auto_13057 ) ) ( not ( = ?auto_13055 ?auto_13057 ) ) ( not ( = ?auto_13056 ?auto_13057 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_13057 )
      ( MAKE-2PILE ?auto_13054 ?auto_13055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13091 - BLOCK
      ?auto_13092 - BLOCK
    )
    :vars
    (
      ?auto_13093 - BLOCK
      ?auto_13094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13091 ?auto_13092 ) ) ( ON ?auto_13092 ?auto_13093 ) ( not ( = ?auto_13091 ?auto_13093 ) ) ( not ( = ?auto_13092 ?auto_13093 ) ) ( ON ?auto_13091 ?auto_13092 ) ( CLEAR ?auto_13091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13094 ) ( ON ?auto_13093 ?auto_13094 ) ( not ( = ?auto_13094 ?auto_13093 ) ) ( not ( = ?auto_13094 ?auto_13092 ) ) ( not ( = ?auto_13094 ?auto_13091 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13094 ?auto_13093 ?auto_13092 )
      ( MAKE-2PILE ?auto_13091 ?auto_13092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13097 - BLOCK
      ?auto_13098 - BLOCK
    )
    :vars
    (
      ?auto_13099 - BLOCK
      ?auto_13100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13097 ?auto_13098 ) ) ( ON ?auto_13098 ?auto_13099 ) ( CLEAR ?auto_13098 ) ( not ( = ?auto_13097 ?auto_13099 ) ) ( not ( = ?auto_13098 ?auto_13099 ) ) ( ON ?auto_13097 ?auto_13100 ) ( CLEAR ?auto_13097 ) ( HAND-EMPTY ) ( not ( = ?auto_13097 ?auto_13100 ) ) ( not ( = ?auto_13098 ?auto_13100 ) ) ( not ( = ?auto_13099 ?auto_13100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13097 ?auto_13100 )
      ( MAKE-2PILE ?auto_13097 ?auto_13098 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13101 - BLOCK
      ?auto_13102 - BLOCK
    )
    :vars
    (
      ?auto_13103 - BLOCK
      ?auto_13104 - BLOCK
      ?auto_13105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13101 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13103 ) ) ( not ( = ?auto_13102 ?auto_13103 ) ) ( ON ?auto_13101 ?auto_13104 ) ( CLEAR ?auto_13101 ) ( not ( = ?auto_13101 ?auto_13104 ) ) ( not ( = ?auto_13102 ?auto_13104 ) ) ( not ( = ?auto_13103 ?auto_13104 ) ) ( HOLDING ?auto_13102 ) ( CLEAR ?auto_13103 ) ( ON-TABLE ?auto_13105 ) ( ON ?auto_13103 ?auto_13105 ) ( not ( = ?auto_13105 ?auto_13103 ) ) ( not ( = ?auto_13105 ?auto_13102 ) ) ( not ( = ?auto_13101 ?auto_13105 ) ) ( not ( = ?auto_13104 ?auto_13105 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13105 ?auto_13103 ?auto_13102 )
      ( MAKE-2PILE ?auto_13101 ?auto_13102 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13106 - BLOCK
      ?auto_13107 - BLOCK
    )
    :vars
    (
      ?auto_13108 - BLOCK
      ?auto_13110 - BLOCK
      ?auto_13109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( ON ?auto_13106 ?auto_13110 ) ( not ( = ?auto_13106 ?auto_13110 ) ) ( not ( = ?auto_13107 ?auto_13110 ) ) ( not ( = ?auto_13108 ?auto_13110 ) ) ( CLEAR ?auto_13108 ) ( ON-TABLE ?auto_13109 ) ( ON ?auto_13108 ?auto_13109 ) ( not ( = ?auto_13109 ?auto_13108 ) ) ( not ( = ?auto_13109 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13109 ) ) ( not ( = ?auto_13110 ?auto_13109 ) ) ( ON ?auto_13107 ?auto_13106 ) ( CLEAR ?auto_13107 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13110 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13110 ?auto_13106 )
      ( MAKE-2PILE ?auto_13106 ?auto_13107 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13111 - BLOCK
      ?auto_13112 - BLOCK
    )
    :vars
    (
      ?auto_13114 - BLOCK
      ?auto_13113 - BLOCK
      ?auto_13115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13114 ) ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( ON ?auto_13111 ?auto_13113 ) ( not ( = ?auto_13111 ?auto_13113 ) ) ( not ( = ?auto_13112 ?auto_13113 ) ) ( not ( = ?auto_13114 ?auto_13113 ) ) ( ON-TABLE ?auto_13115 ) ( not ( = ?auto_13115 ?auto_13114 ) ) ( not ( = ?auto_13115 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13115 ) ) ( not ( = ?auto_13113 ?auto_13115 ) ) ( ON ?auto_13112 ?auto_13111 ) ( CLEAR ?auto_13112 ) ( ON-TABLE ?auto_13113 ) ( HOLDING ?auto_13114 ) ( CLEAR ?auto_13115 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13115 ?auto_13114 )
      ( MAKE-2PILE ?auto_13111 ?auto_13112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13116 - BLOCK
      ?auto_13117 - BLOCK
    )
    :vars
    (
      ?auto_13120 - BLOCK
      ?auto_13119 - BLOCK
      ?auto_13118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13116 ?auto_13117 ) ) ( not ( = ?auto_13116 ?auto_13120 ) ) ( not ( = ?auto_13117 ?auto_13120 ) ) ( ON ?auto_13116 ?auto_13119 ) ( not ( = ?auto_13116 ?auto_13119 ) ) ( not ( = ?auto_13117 ?auto_13119 ) ) ( not ( = ?auto_13120 ?auto_13119 ) ) ( ON-TABLE ?auto_13118 ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13117 ) ) ( not ( = ?auto_13116 ?auto_13118 ) ) ( not ( = ?auto_13119 ?auto_13118 ) ) ( ON ?auto_13117 ?auto_13116 ) ( ON-TABLE ?auto_13119 ) ( CLEAR ?auto_13118 ) ( ON ?auto_13120 ?auto_13117 ) ( CLEAR ?auto_13120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13119 ?auto_13116 ?auto_13117 )
      ( MAKE-2PILE ?auto_13116 ?auto_13117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13121 - BLOCK
      ?auto_13122 - BLOCK
    )
    :vars
    (
      ?auto_13125 - BLOCK
      ?auto_13123 - BLOCK
      ?auto_13124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13122 ?auto_13125 ) ) ( ON ?auto_13121 ?auto_13123 ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13123 ) ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( not ( = ?auto_13124 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( ON ?auto_13122 ?auto_13121 ) ( ON-TABLE ?auto_13123 ) ( ON ?auto_13125 ?auto_13122 ) ( CLEAR ?auto_13125 ) ( HOLDING ?auto_13124 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13124 )
      ( MAKE-2PILE ?auto_13121 ?auto_13122 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13126 - BLOCK
      ?auto_13127 - BLOCK
    )
    :vars
    (
      ?auto_13129 - BLOCK
      ?auto_13130 - BLOCK
      ?auto_13128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13126 ?auto_13127 ) ) ( not ( = ?auto_13126 ?auto_13129 ) ) ( not ( = ?auto_13127 ?auto_13129 ) ) ( ON ?auto_13126 ?auto_13130 ) ( not ( = ?auto_13126 ?auto_13130 ) ) ( not ( = ?auto_13127 ?auto_13130 ) ) ( not ( = ?auto_13129 ?auto_13130 ) ) ( not ( = ?auto_13128 ?auto_13129 ) ) ( not ( = ?auto_13128 ?auto_13127 ) ) ( not ( = ?auto_13126 ?auto_13128 ) ) ( not ( = ?auto_13130 ?auto_13128 ) ) ( ON ?auto_13127 ?auto_13126 ) ( ON-TABLE ?auto_13130 ) ( ON ?auto_13129 ?auto_13127 ) ( ON ?auto_13128 ?auto_13129 ) ( CLEAR ?auto_13128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13130 ?auto_13126 ?auto_13127 ?auto_13129 )
      ( MAKE-2PILE ?auto_13126 ?auto_13127 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_13142 - BLOCK
    )
    :vars
    (
      ?auto_13144 - BLOCK
      ?auto_13143 - BLOCK
      ?auto_13145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13144 ?auto_13142 ) ( ON-TABLE ?auto_13142 ) ( not ( = ?auto_13142 ?auto_13144 ) ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13145 ) ) ( not ( = ?auto_13144 ?auto_13143 ) ) ( not ( = ?auto_13144 ?auto_13145 ) ) ( not ( = ?auto_13143 ?auto_13145 ) ) ( ON ?auto_13143 ?auto_13144 ) ( CLEAR ?auto_13143 ) ( HOLDING ?auto_13145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13145 )
      ( MAKE-1PILE ?auto_13142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13175 - BLOCK
      ?auto_13176 - BLOCK
      ?auto_13177 - BLOCK
    )
    :vars
    (
      ?auto_13178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13175 ) ( not ( = ?auto_13175 ?auto_13176 ) ) ( not ( = ?auto_13175 ?auto_13177 ) ) ( not ( = ?auto_13176 ?auto_13177 ) ) ( ON ?auto_13177 ?auto_13178 ) ( not ( = ?auto_13175 ?auto_13178 ) ) ( not ( = ?auto_13176 ?auto_13178 ) ) ( not ( = ?auto_13177 ?auto_13178 ) ) ( CLEAR ?auto_13175 ) ( ON ?auto_13176 ?auto_13177 ) ( CLEAR ?auto_13176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13178 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13178 ?auto_13177 )
      ( MAKE-3PILE ?auto_13175 ?auto_13176 ?auto_13177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13179 - BLOCK
      ?auto_13180 - BLOCK
      ?auto_13181 - BLOCK
    )
    :vars
    (
      ?auto_13182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13179 ?auto_13180 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( ON ?auto_13181 ?auto_13182 ) ( not ( = ?auto_13179 ?auto_13182 ) ) ( not ( = ?auto_13180 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( ON ?auto_13180 ?auto_13181 ) ( CLEAR ?auto_13180 ) ( ON-TABLE ?auto_13182 ) ( HOLDING ?auto_13179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13179 )
      ( MAKE-3PILE ?auto_13179 ?auto_13180 ?auto_13181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13183 - BLOCK
      ?auto_13184 - BLOCK
      ?auto_13185 - BLOCK
    )
    :vars
    (
      ?auto_13186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13183 ?auto_13184 ) ) ( not ( = ?auto_13183 ?auto_13185 ) ) ( not ( = ?auto_13184 ?auto_13185 ) ) ( ON ?auto_13185 ?auto_13186 ) ( not ( = ?auto_13183 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( not ( = ?auto_13185 ?auto_13186 ) ) ( ON ?auto_13184 ?auto_13185 ) ( ON-TABLE ?auto_13186 ) ( ON ?auto_13183 ?auto_13184 ) ( CLEAR ?auto_13183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13186 ?auto_13185 ?auto_13184 )
      ( MAKE-3PILE ?auto_13183 ?auto_13184 ?auto_13185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13190 - BLOCK
      ?auto_13191 - BLOCK
      ?auto_13192 - BLOCK
    )
    :vars
    (
      ?auto_13193 - BLOCK
      ?auto_13194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13190 ?auto_13191 ) ) ( not ( = ?auto_13190 ?auto_13192 ) ) ( not ( = ?auto_13191 ?auto_13192 ) ) ( ON ?auto_13192 ?auto_13193 ) ( not ( = ?auto_13190 ?auto_13193 ) ) ( not ( = ?auto_13191 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( ON ?auto_13191 ?auto_13192 ) ( CLEAR ?auto_13191 ) ( ON-TABLE ?auto_13193 ) ( ON ?auto_13190 ?auto_13194 ) ( CLEAR ?auto_13190 ) ( HAND-EMPTY ) ( not ( = ?auto_13190 ?auto_13194 ) ) ( not ( = ?auto_13191 ?auto_13194 ) ) ( not ( = ?auto_13192 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13190 ?auto_13194 )
      ( MAKE-3PILE ?auto_13190 ?auto_13191 ?auto_13192 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13195 - BLOCK
      ?auto_13196 - BLOCK
      ?auto_13197 - BLOCK
    )
    :vars
    (
      ?auto_13199 - BLOCK
      ?auto_13198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13195 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( ON ?auto_13197 ?auto_13199 ) ( not ( = ?auto_13195 ?auto_13199 ) ) ( not ( = ?auto_13196 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( ON-TABLE ?auto_13199 ) ( ON ?auto_13195 ?auto_13198 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13195 ?auto_13198 ) ) ( not ( = ?auto_13196 ?auto_13198 ) ) ( not ( = ?auto_13197 ?auto_13198 ) ) ( not ( = ?auto_13199 ?auto_13198 ) ) ( HOLDING ?auto_13196 ) ( CLEAR ?auto_13197 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13199 ?auto_13197 ?auto_13196 )
      ( MAKE-3PILE ?auto_13195 ?auto_13196 ?auto_13197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13200 - BLOCK
      ?auto_13201 - BLOCK
      ?auto_13202 - BLOCK
    )
    :vars
    (
      ?auto_13204 - BLOCK
      ?auto_13203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( ON ?auto_13202 ?auto_13204 ) ( not ( = ?auto_13200 ?auto_13204 ) ) ( not ( = ?auto_13201 ?auto_13204 ) ) ( not ( = ?auto_13202 ?auto_13204 ) ) ( ON-TABLE ?auto_13204 ) ( ON ?auto_13200 ?auto_13203 ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13201 ?auto_13203 ) ) ( not ( = ?auto_13202 ?auto_13203 ) ) ( not ( = ?auto_13204 ?auto_13203 ) ) ( CLEAR ?auto_13202 ) ( ON ?auto_13201 ?auto_13200 ) ( CLEAR ?auto_13201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13203 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13203 ?auto_13200 )
      ( MAKE-3PILE ?auto_13200 ?auto_13201 ?auto_13202 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13205 - BLOCK
      ?auto_13206 - BLOCK
      ?auto_13207 - BLOCK
    )
    :vars
    (
      ?auto_13208 - BLOCK
      ?auto_13209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13205 ?auto_13206 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( ON-TABLE ?auto_13208 ) ( ON ?auto_13205 ?auto_13209 ) ( not ( = ?auto_13205 ?auto_13209 ) ) ( not ( = ?auto_13206 ?auto_13209 ) ) ( not ( = ?auto_13207 ?auto_13209 ) ) ( not ( = ?auto_13208 ?auto_13209 ) ) ( ON ?auto_13206 ?auto_13205 ) ( CLEAR ?auto_13206 ) ( ON-TABLE ?auto_13209 ) ( HOLDING ?auto_13207 ) ( CLEAR ?auto_13208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13208 ?auto_13207 )
      ( MAKE-3PILE ?auto_13205 ?auto_13206 ?auto_13207 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13210 - BLOCK
      ?auto_13211 - BLOCK
      ?auto_13212 - BLOCK
    )
    :vars
    (
      ?auto_13213 - BLOCK
      ?auto_13214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13210 ?auto_13211 ) ) ( not ( = ?auto_13210 ?auto_13212 ) ) ( not ( = ?auto_13211 ?auto_13212 ) ) ( not ( = ?auto_13210 ?auto_13213 ) ) ( not ( = ?auto_13211 ?auto_13213 ) ) ( not ( = ?auto_13212 ?auto_13213 ) ) ( ON-TABLE ?auto_13213 ) ( ON ?auto_13210 ?auto_13214 ) ( not ( = ?auto_13210 ?auto_13214 ) ) ( not ( = ?auto_13211 ?auto_13214 ) ) ( not ( = ?auto_13212 ?auto_13214 ) ) ( not ( = ?auto_13213 ?auto_13214 ) ) ( ON ?auto_13211 ?auto_13210 ) ( ON-TABLE ?auto_13214 ) ( CLEAR ?auto_13213 ) ( ON ?auto_13212 ?auto_13211 ) ( CLEAR ?auto_13212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13214 ?auto_13210 ?auto_13211 )
      ( MAKE-3PILE ?auto_13210 ?auto_13211 ?auto_13212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13215 - BLOCK
      ?auto_13216 - BLOCK
      ?auto_13217 - BLOCK
    )
    :vars
    (
      ?auto_13218 - BLOCK
      ?auto_13219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13215 ?auto_13216 ) ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( not ( = ?auto_13216 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13218 ) ) ( not ( = ?auto_13216 ?auto_13218 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( ON ?auto_13215 ?auto_13219 ) ( not ( = ?auto_13215 ?auto_13219 ) ) ( not ( = ?auto_13216 ?auto_13219 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( not ( = ?auto_13218 ?auto_13219 ) ) ( ON ?auto_13216 ?auto_13215 ) ( ON-TABLE ?auto_13219 ) ( ON ?auto_13217 ?auto_13216 ) ( CLEAR ?auto_13217 ) ( HOLDING ?auto_13218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13218 )
      ( MAKE-3PILE ?auto_13215 ?auto_13216 ?auto_13217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_13220 - BLOCK
      ?auto_13221 - BLOCK
      ?auto_13222 - BLOCK
    )
    :vars
    (
      ?auto_13223 - BLOCK
      ?auto_13224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13220 ?auto_13221 ) ) ( not ( = ?auto_13220 ?auto_13222 ) ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13220 ?auto_13223 ) ) ( not ( = ?auto_13221 ?auto_13223 ) ) ( not ( = ?auto_13222 ?auto_13223 ) ) ( ON ?auto_13220 ?auto_13224 ) ( not ( = ?auto_13220 ?auto_13224 ) ) ( not ( = ?auto_13221 ?auto_13224 ) ) ( not ( = ?auto_13222 ?auto_13224 ) ) ( not ( = ?auto_13223 ?auto_13224 ) ) ( ON ?auto_13221 ?auto_13220 ) ( ON-TABLE ?auto_13224 ) ( ON ?auto_13222 ?auto_13221 ) ( ON ?auto_13223 ?auto_13222 ) ( CLEAR ?auto_13223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13224 ?auto_13220 ?auto_13221 ?auto_13222 )
      ( MAKE-3PILE ?auto_13220 ?auto_13221 ?auto_13222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13233 - BLOCK
      ?auto_13234 - BLOCK
      ?auto_13235 - BLOCK
      ?auto_13236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13235 ) ( ON-TABLE ?auto_13233 ) ( ON ?auto_13234 ?auto_13233 ) ( ON ?auto_13235 ?auto_13234 ) ( not ( = ?auto_13233 ?auto_13234 ) ) ( not ( = ?auto_13233 ?auto_13235 ) ) ( not ( = ?auto_13233 ?auto_13236 ) ) ( not ( = ?auto_13234 ?auto_13235 ) ) ( not ( = ?auto_13234 ?auto_13236 ) ) ( not ( = ?auto_13235 ?auto_13236 ) ) ( ON-TABLE ?auto_13236 ) ( CLEAR ?auto_13236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_13236 )
      ( MAKE-4PILE ?auto_13233 ?auto_13234 ?auto_13235 ?auto_13236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13237 - BLOCK
      ?auto_13238 - BLOCK
      ?auto_13239 - BLOCK
      ?auto_13240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13237 ) ( ON ?auto_13238 ?auto_13237 ) ( not ( = ?auto_13237 ?auto_13238 ) ) ( not ( = ?auto_13237 ?auto_13239 ) ) ( not ( = ?auto_13237 ?auto_13240 ) ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( ON-TABLE ?auto_13240 ) ( CLEAR ?auto_13240 ) ( HOLDING ?auto_13239 ) ( CLEAR ?auto_13238 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13237 ?auto_13238 ?auto_13239 )
      ( MAKE-4PILE ?auto_13237 ?auto_13238 ?auto_13239 ?auto_13240 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13241 - BLOCK
      ?auto_13242 - BLOCK
      ?auto_13243 - BLOCK
      ?auto_13244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13241 ) ( ON ?auto_13242 ?auto_13241 ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13243 ?auto_13244 ) ) ( ON-TABLE ?auto_13244 ) ( CLEAR ?auto_13242 ) ( ON ?auto_13243 ?auto_13244 ) ( CLEAR ?auto_13243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13244 )
      ( MAKE-4PILE ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13245 - BLOCK
      ?auto_13246 - BLOCK
      ?auto_13247 - BLOCK
      ?auto_13248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13245 ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13248 ) ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13246 ?auto_13248 ) ) ( not ( = ?auto_13247 ?auto_13248 ) ) ( ON-TABLE ?auto_13248 ) ( ON ?auto_13247 ?auto_13248 ) ( CLEAR ?auto_13247 ) ( HOLDING ?auto_13246 ) ( CLEAR ?auto_13245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13245 ?auto_13246 )
      ( MAKE-4PILE ?auto_13245 ?auto_13246 ?auto_13247 ?auto_13248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13249 - BLOCK
      ?auto_13250 - BLOCK
      ?auto_13251 - BLOCK
      ?auto_13252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_13249 ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13249 ?auto_13251 ) ) ( not ( = ?auto_13249 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( ON-TABLE ?auto_13252 ) ( ON ?auto_13251 ?auto_13252 ) ( CLEAR ?auto_13249 ) ( ON ?auto_13250 ?auto_13251 ) ( CLEAR ?auto_13250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13252 ?auto_13251 )
      ( MAKE-4PILE ?auto_13249 ?auto_13250 ?auto_13251 ?auto_13252 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13253 - BLOCK
      ?auto_13254 - BLOCK
      ?auto_13255 - BLOCK
      ?auto_13256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13253 ?auto_13254 ) ) ( not ( = ?auto_13253 ?auto_13255 ) ) ( not ( = ?auto_13253 ?auto_13256 ) ) ( not ( = ?auto_13254 ?auto_13255 ) ) ( not ( = ?auto_13254 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( ON-TABLE ?auto_13256 ) ( ON ?auto_13255 ?auto_13256 ) ( ON ?auto_13254 ?auto_13255 ) ( CLEAR ?auto_13254 ) ( HOLDING ?auto_13253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13253 )
      ( MAKE-4PILE ?auto_13253 ?auto_13254 ?auto_13255 ?auto_13256 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13257 - BLOCK
      ?auto_13258 - BLOCK
      ?auto_13259 - BLOCK
      ?auto_13260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13259 ) ) ( not ( = ?auto_13257 ?auto_13260 ) ) ( not ( = ?auto_13258 ?auto_13259 ) ) ( not ( = ?auto_13258 ?auto_13260 ) ) ( not ( = ?auto_13259 ?auto_13260 ) ) ( ON-TABLE ?auto_13260 ) ( ON ?auto_13259 ?auto_13260 ) ( ON ?auto_13258 ?auto_13259 ) ( ON ?auto_13257 ?auto_13258 ) ( CLEAR ?auto_13257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13260 ?auto_13259 ?auto_13258 )
      ( MAKE-4PILE ?auto_13257 ?auto_13258 ?auto_13259 ?auto_13260 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13265 - BLOCK
      ?auto_13266 - BLOCK
      ?auto_13267 - BLOCK
      ?auto_13268 - BLOCK
    )
    :vars
    (
      ?auto_13269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13265 ?auto_13266 ) ) ( not ( = ?auto_13265 ?auto_13267 ) ) ( not ( = ?auto_13265 ?auto_13268 ) ) ( not ( = ?auto_13266 ?auto_13267 ) ) ( not ( = ?auto_13266 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( ON-TABLE ?auto_13268 ) ( ON ?auto_13267 ?auto_13268 ) ( ON ?auto_13266 ?auto_13267 ) ( CLEAR ?auto_13266 ) ( ON ?auto_13265 ?auto_13269 ) ( CLEAR ?auto_13265 ) ( HAND-EMPTY ) ( not ( = ?auto_13265 ?auto_13269 ) ) ( not ( = ?auto_13266 ?auto_13269 ) ) ( not ( = ?auto_13267 ?auto_13269 ) ) ( not ( = ?auto_13268 ?auto_13269 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_13265 ?auto_13269 )
      ( MAKE-4PILE ?auto_13265 ?auto_13266 ?auto_13267 ?auto_13268 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13270 - BLOCK
      ?auto_13271 - BLOCK
      ?auto_13272 - BLOCK
      ?auto_13273 - BLOCK
    )
    :vars
    (
      ?auto_13274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13270 ?auto_13272 ) ) ( not ( = ?auto_13270 ?auto_13273 ) ) ( not ( = ?auto_13271 ?auto_13272 ) ) ( not ( = ?auto_13271 ?auto_13273 ) ) ( not ( = ?auto_13272 ?auto_13273 ) ) ( ON-TABLE ?auto_13273 ) ( ON ?auto_13272 ?auto_13273 ) ( ON ?auto_13270 ?auto_13274 ) ( CLEAR ?auto_13270 ) ( not ( = ?auto_13270 ?auto_13274 ) ) ( not ( = ?auto_13271 ?auto_13274 ) ) ( not ( = ?auto_13272 ?auto_13274 ) ) ( not ( = ?auto_13273 ?auto_13274 ) ) ( HOLDING ?auto_13271 ) ( CLEAR ?auto_13272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13273 ?auto_13272 ?auto_13271 )
      ( MAKE-4PILE ?auto_13270 ?auto_13271 ?auto_13272 ?auto_13273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13275 - BLOCK
      ?auto_13276 - BLOCK
      ?auto_13277 - BLOCK
      ?auto_13278 - BLOCK
    )
    :vars
    (
      ?auto_13279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13275 ?auto_13276 ) ) ( not ( = ?auto_13275 ?auto_13277 ) ) ( not ( = ?auto_13275 ?auto_13278 ) ) ( not ( = ?auto_13276 ?auto_13277 ) ) ( not ( = ?auto_13276 ?auto_13278 ) ) ( not ( = ?auto_13277 ?auto_13278 ) ) ( ON-TABLE ?auto_13278 ) ( ON ?auto_13277 ?auto_13278 ) ( ON ?auto_13275 ?auto_13279 ) ( not ( = ?auto_13275 ?auto_13279 ) ) ( not ( = ?auto_13276 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( CLEAR ?auto_13277 ) ( ON ?auto_13276 ?auto_13275 ) ( CLEAR ?auto_13276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13279 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13279 ?auto_13275 )
      ( MAKE-4PILE ?auto_13275 ?auto_13276 ?auto_13277 ?auto_13278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13280 - BLOCK
      ?auto_13281 - BLOCK
      ?auto_13282 - BLOCK
      ?auto_13283 - BLOCK
    )
    :vars
    (
      ?auto_13284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13280 ?auto_13281 ) ) ( not ( = ?auto_13280 ?auto_13282 ) ) ( not ( = ?auto_13280 ?auto_13283 ) ) ( not ( = ?auto_13281 ?auto_13282 ) ) ( not ( = ?auto_13281 ?auto_13283 ) ) ( not ( = ?auto_13282 ?auto_13283 ) ) ( ON-TABLE ?auto_13283 ) ( ON ?auto_13280 ?auto_13284 ) ( not ( = ?auto_13280 ?auto_13284 ) ) ( not ( = ?auto_13281 ?auto_13284 ) ) ( not ( = ?auto_13282 ?auto_13284 ) ) ( not ( = ?auto_13283 ?auto_13284 ) ) ( ON ?auto_13281 ?auto_13280 ) ( CLEAR ?auto_13281 ) ( ON-TABLE ?auto_13284 ) ( HOLDING ?auto_13282 ) ( CLEAR ?auto_13283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_13283 ?auto_13282 )
      ( MAKE-4PILE ?auto_13280 ?auto_13281 ?auto_13282 ?auto_13283 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13285 - BLOCK
      ?auto_13286 - BLOCK
      ?auto_13287 - BLOCK
      ?auto_13288 - BLOCK
    )
    :vars
    (
      ?auto_13289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13285 ?auto_13286 ) ) ( not ( = ?auto_13285 ?auto_13287 ) ) ( not ( = ?auto_13285 ?auto_13288 ) ) ( not ( = ?auto_13286 ?auto_13287 ) ) ( not ( = ?auto_13286 ?auto_13288 ) ) ( not ( = ?auto_13287 ?auto_13288 ) ) ( ON-TABLE ?auto_13288 ) ( ON ?auto_13285 ?auto_13289 ) ( not ( = ?auto_13285 ?auto_13289 ) ) ( not ( = ?auto_13286 ?auto_13289 ) ) ( not ( = ?auto_13287 ?auto_13289 ) ) ( not ( = ?auto_13288 ?auto_13289 ) ) ( ON ?auto_13286 ?auto_13285 ) ( ON-TABLE ?auto_13289 ) ( CLEAR ?auto_13288 ) ( ON ?auto_13287 ?auto_13286 ) ( CLEAR ?auto_13287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_13289 ?auto_13285 ?auto_13286 )
      ( MAKE-4PILE ?auto_13285 ?auto_13286 ?auto_13287 ?auto_13288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13290 - BLOCK
      ?auto_13291 - BLOCK
      ?auto_13292 - BLOCK
      ?auto_13293 - BLOCK
    )
    :vars
    (
      ?auto_13294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13290 ?auto_13291 ) ) ( not ( = ?auto_13290 ?auto_13292 ) ) ( not ( = ?auto_13290 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( ON ?auto_13290 ?auto_13294 ) ( not ( = ?auto_13290 ?auto_13294 ) ) ( not ( = ?auto_13291 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13293 ?auto_13294 ) ) ( ON ?auto_13291 ?auto_13290 ) ( ON-TABLE ?auto_13294 ) ( ON ?auto_13292 ?auto_13291 ) ( CLEAR ?auto_13292 ) ( HOLDING ?auto_13293 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_13293 )
      ( MAKE-4PILE ?auto_13290 ?auto_13291 ?auto_13292 ?auto_13293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_13295 - BLOCK
      ?auto_13296 - BLOCK
      ?auto_13297 - BLOCK
      ?auto_13298 - BLOCK
    )
    :vars
    (
      ?auto_13299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_13295 ?auto_13296 ) ) ( not ( = ?auto_13295 ?auto_13297 ) ) ( not ( = ?auto_13295 ?auto_13298 ) ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13298 ) ) ( not ( = ?auto_13297 ?auto_13298 ) ) ( ON ?auto_13295 ?auto_13299 ) ( not ( = ?auto_13295 ?auto_13299 ) ) ( not ( = ?auto_13296 ?auto_13299 ) ) ( not ( = ?auto_13297 ?auto_13299 ) ) ( not ( = ?auto_13298 ?auto_13299 ) ) ( ON ?auto_13296 ?auto_13295 ) ( ON-TABLE ?auto_13299 ) ( ON ?auto_13297 ?auto_13296 ) ( ON ?auto_13298 ?auto_13297 ) ( CLEAR ?auto_13298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_13299 ?auto_13295 ?auto_13296 ?auto_13297 )
      ( MAKE-4PILE ?auto_13295 ?auto_13296 ?auto_13297 ?auto_13298 ) )
  )

)

