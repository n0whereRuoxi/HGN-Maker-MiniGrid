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
      ?auto_5689 - BLOCK
    )
    :vars
    (
      ?auto_5690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5689 ?auto_5690 ) ( CLEAR ?auto_5689 ) ( HAND-EMPTY ) ( not ( = ?auto_5689 ?auto_5690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5689 ?auto_5690 )
      ( !PUTDOWN ?auto_5689 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5696 - BLOCK
      ?auto_5697 - BLOCK
    )
    :vars
    (
      ?auto_5698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5696 ) ( ON ?auto_5697 ?auto_5698 ) ( CLEAR ?auto_5697 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5696 ) ( not ( = ?auto_5696 ?auto_5697 ) ) ( not ( = ?auto_5696 ?auto_5698 ) ) ( not ( = ?auto_5697 ?auto_5698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5697 ?auto_5698 )
      ( !STACK ?auto_5697 ?auto_5696 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5706 - BLOCK
      ?auto_5707 - BLOCK
    )
    :vars
    (
      ?auto_5708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5707 ?auto_5708 ) ( not ( = ?auto_5706 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5708 ) ) ( not ( = ?auto_5707 ?auto_5708 ) ) ( ON ?auto_5706 ?auto_5707 ) ( CLEAR ?auto_5706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5706 )
      ( MAKE-2PILE ?auto_5706 ?auto_5707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5717 - BLOCK
      ?auto_5718 - BLOCK
      ?auto_5719 - BLOCK
    )
    :vars
    (
      ?auto_5720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5718 ) ( ON ?auto_5719 ?auto_5720 ) ( CLEAR ?auto_5719 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5717 ) ( ON ?auto_5718 ?auto_5717 ) ( not ( = ?auto_5717 ?auto_5718 ) ) ( not ( = ?auto_5717 ?auto_5719 ) ) ( not ( = ?auto_5717 ?auto_5720 ) ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5718 ?auto_5720 ) ) ( not ( = ?auto_5719 ?auto_5720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5719 ?auto_5720 )
      ( !STACK ?auto_5719 ?auto_5718 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5731 - BLOCK
      ?auto_5732 - BLOCK
      ?auto_5733 - BLOCK
    )
    :vars
    (
      ?auto_5734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5733 ?auto_5734 ) ( ON-TABLE ?auto_5731 ) ( not ( = ?auto_5731 ?auto_5732 ) ) ( not ( = ?auto_5731 ?auto_5733 ) ) ( not ( = ?auto_5731 ?auto_5734 ) ) ( not ( = ?auto_5732 ?auto_5733 ) ) ( not ( = ?auto_5732 ?auto_5734 ) ) ( not ( = ?auto_5733 ?auto_5734 ) ) ( CLEAR ?auto_5731 ) ( ON ?auto_5732 ?auto_5733 ) ( CLEAR ?auto_5732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5731 ?auto_5732 )
      ( MAKE-3PILE ?auto_5731 ?auto_5732 ?auto_5733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5745 - BLOCK
      ?auto_5746 - BLOCK
      ?auto_5747 - BLOCK
    )
    :vars
    (
      ?auto_5748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5747 ?auto_5748 ) ( not ( = ?auto_5745 ?auto_5746 ) ) ( not ( = ?auto_5745 ?auto_5747 ) ) ( not ( = ?auto_5745 ?auto_5748 ) ) ( not ( = ?auto_5746 ?auto_5747 ) ) ( not ( = ?auto_5746 ?auto_5748 ) ) ( not ( = ?auto_5747 ?auto_5748 ) ) ( ON ?auto_5746 ?auto_5747 ) ( ON ?auto_5745 ?auto_5746 ) ( CLEAR ?auto_5745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5745 )
      ( MAKE-3PILE ?auto_5745 ?auto_5746 ?auto_5747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5760 - BLOCK
      ?auto_5761 - BLOCK
      ?auto_5762 - BLOCK
      ?auto_5763 - BLOCK
    )
    :vars
    (
      ?auto_5764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5762 ) ( ON ?auto_5763 ?auto_5764 ) ( CLEAR ?auto_5763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5760 ) ( ON ?auto_5761 ?auto_5760 ) ( ON ?auto_5762 ?auto_5761 ) ( not ( = ?auto_5760 ?auto_5761 ) ) ( not ( = ?auto_5760 ?auto_5762 ) ) ( not ( = ?auto_5760 ?auto_5763 ) ) ( not ( = ?auto_5760 ?auto_5764 ) ) ( not ( = ?auto_5761 ?auto_5762 ) ) ( not ( = ?auto_5761 ?auto_5763 ) ) ( not ( = ?auto_5761 ?auto_5764 ) ) ( not ( = ?auto_5762 ?auto_5763 ) ) ( not ( = ?auto_5762 ?auto_5764 ) ) ( not ( = ?auto_5763 ?auto_5764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5763 ?auto_5764 )
      ( !STACK ?auto_5763 ?auto_5762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5778 - BLOCK
      ?auto_5779 - BLOCK
      ?auto_5780 - BLOCK
      ?auto_5781 - BLOCK
    )
    :vars
    (
      ?auto_5782 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5781 ?auto_5782 ) ( ON-TABLE ?auto_5778 ) ( ON ?auto_5779 ?auto_5778 ) ( not ( = ?auto_5778 ?auto_5779 ) ) ( not ( = ?auto_5778 ?auto_5780 ) ) ( not ( = ?auto_5778 ?auto_5781 ) ) ( not ( = ?auto_5778 ?auto_5782 ) ) ( not ( = ?auto_5779 ?auto_5780 ) ) ( not ( = ?auto_5779 ?auto_5781 ) ) ( not ( = ?auto_5779 ?auto_5782 ) ) ( not ( = ?auto_5780 ?auto_5781 ) ) ( not ( = ?auto_5780 ?auto_5782 ) ) ( not ( = ?auto_5781 ?auto_5782 ) ) ( CLEAR ?auto_5779 ) ( ON ?auto_5780 ?auto_5781 ) ( CLEAR ?auto_5780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5778 ?auto_5779 ?auto_5780 )
      ( MAKE-4PILE ?auto_5778 ?auto_5779 ?auto_5780 ?auto_5781 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5796 - BLOCK
      ?auto_5797 - BLOCK
      ?auto_5798 - BLOCK
      ?auto_5799 - BLOCK
    )
    :vars
    (
      ?auto_5800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5799 ?auto_5800 ) ( ON-TABLE ?auto_5796 ) ( not ( = ?auto_5796 ?auto_5797 ) ) ( not ( = ?auto_5796 ?auto_5798 ) ) ( not ( = ?auto_5796 ?auto_5799 ) ) ( not ( = ?auto_5796 ?auto_5800 ) ) ( not ( = ?auto_5797 ?auto_5798 ) ) ( not ( = ?auto_5797 ?auto_5799 ) ) ( not ( = ?auto_5797 ?auto_5800 ) ) ( not ( = ?auto_5798 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5800 ) ) ( not ( = ?auto_5799 ?auto_5800 ) ) ( ON ?auto_5798 ?auto_5799 ) ( CLEAR ?auto_5796 ) ( ON ?auto_5797 ?auto_5798 ) ( CLEAR ?auto_5797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5796 ?auto_5797 )
      ( MAKE-4PILE ?auto_5796 ?auto_5797 ?auto_5798 ?auto_5799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5814 - BLOCK
      ?auto_5815 - BLOCK
      ?auto_5816 - BLOCK
      ?auto_5817 - BLOCK
    )
    :vars
    (
      ?auto_5818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5817 ?auto_5818 ) ( not ( = ?auto_5814 ?auto_5815 ) ) ( not ( = ?auto_5814 ?auto_5816 ) ) ( not ( = ?auto_5814 ?auto_5817 ) ) ( not ( = ?auto_5814 ?auto_5818 ) ) ( not ( = ?auto_5815 ?auto_5816 ) ) ( not ( = ?auto_5815 ?auto_5817 ) ) ( not ( = ?auto_5815 ?auto_5818 ) ) ( not ( = ?auto_5816 ?auto_5817 ) ) ( not ( = ?auto_5816 ?auto_5818 ) ) ( not ( = ?auto_5817 ?auto_5818 ) ) ( ON ?auto_5816 ?auto_5817 ) ( ON ?auto_5815 ?auto_5816 ) ( ON ?auto_5814 ?auto_5815 ) ( CLEAR ?auto_5814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5814 )
      ( MAKE-4PILE ?auto_5814 ?auto_5815 ?auto_5816 ?auto_5817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5833 - BLOCK
      ?auto_5834 - BLOCK
      ?auto_5835 - BLOCK
      ?auto_5836 - BLOCK
      ?auto_5837 - BLOCK
    )
    :vars
    (
      ?auto_5838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5836 ) ( ON ?auto_5837 ?auto_5838 ) ( CLEAR ?auto_5837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5833 ) ( ON ?auto_5834 ?auto_5833 ) ( ON ?auto_5835 ?auto_5834 ) ( ON ?auto_5836 ?auto_5835 ) ( not ( = ?auto_5833 ?auto_5834 ) ) ( not ( = ?auto_5833 ?auto_5835 ) ) ( not ( = ?auto_5833 ?auto_5836 ) ) ( not ( = ?auto_5833 ?auto_5837 ) ) ( not ( = ?auto_5833 ?auto_5838 ) ) ( not ( = ?auto_5834 ?auto_5835 ) ) ( not ( = ?auto_5834 ?auto_5836 ) ) ( not ( = ?auto_5834 ?auto_5837 ) ) ( not ( = ?auto_5834 ?auto_5838 ) ) ( not ( = ?auto_5835 ?auto_5836 ) ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( not ( = ?auto_5835 ?auto_5838 ) ) ( not ( = ?auto_5836 ?auto_5837 ) ) ( not ( = ?auto_5836 ?auto_5838 ) ) ( not ( = ?auto_5837 ?auto_5838 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5837 ?auto_5838 )
      ( !STACK ?auto_5837 ?auto_5836 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5844 - BLOCK
      ?auto_5845 - BLOCK
      ?auto_5846 - BLOCK
      ?auto_5847 - BLOCK
      ?auto_5848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5847 ) ( ON-TABLE ?auto_5848 ) ( CLEAR ?auto_5848 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5844 ) ( ON ?auto_5845 ?auto_5844 ) ( ON ?auto_5846 ?auto_5845 ) ( ON ?auto_5847 ?auto_5846 ) ( not ( = ?auto_5844 ?auto_5845 ) ) ( not ( = ?auto_5844 ?auto_5846 ) ) ( not ( = ?auto_5844 ?auto_5847 ) ) ( not ( = ?auto_5844 ?auto_5848 ) ) ( not ( = ?auto_5845 ?auto_5846 ) ) ( not ( = ?auto_5845 ?auto_5847 ) ) ( not ( = ?auto_5845 ?auto_5848 ) ) ( not ( = ?auto_5846 ?auto_5847 ) ) ( not ( = ?auto_5846 ?auto_5848 ) ) ( not ( = ?auto_5847 ?auto_5848 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_5848 )
      ( !STACK ?auto_5848 ?auto_5847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5854 - BLOCK
      ?auto_5855 - BLOCK
      ?auto_5856 - BLOCK
      ?auto_5857 - BLOCK
      ?auto_5858 - BLOCK
    )
    :vars
    (
      ?auto_5859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5858 ?auto_5859 ) ( ON-TABLE ?auto_5854 ) ( ON ?auto_5855 ?auto_5854 ) ( ON ?auto_5856 ?auto_5855 ) ( not ( = ?auto_5854 ?auto_5855 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( not ( = ?auto_5854 ?auto_5857 ) ) ( not ( = ?auto_5854 ?auto_5858 ) ) ( not ( = ?auto_5854 ?auto_5859 ) ) ( not ( = ?auto_5855 ?auto_5856 ) ) ( not ( = ?auto_5855 ?auto_5857 ) ) ( not ( = ?auto_5855 ?auto_5858 ) ) ( not ( = ?auto_5855 ?auto_5859 ) ) ( not ( = ?auto_5856 ?auto_5857 ) ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5856 ?auto_5859 ) ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( not ( = ?auto_5858 ?auto_5859 ) ) ( CLEAR ?auto_5856 ) ( ON ?auto_5857 ?auto_5858 ) ( CLEAR ?auto_5857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5854 ?auto_5855 ?auto_5856 ?auto_5857 )
      ( MAKE-5PILE ?auto_5854 ?auto_5855 ?auto_5856 ?auto_5857 ?auto_5858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5865 - BLOCK
      ?auto_5866 - BLOCK
      ?auto_5867 - BLOCK
      ?auto_5868 - BLOCK
      ?auto_5869 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5869 ) ( ON-TABLE ?auto_5865 ) ( ON ?auto_5866 ?auto_5865 ) ( ON ?auto_5867 ?auto_5866 ) ( not ( = ?auto_5865 ?auto_5866 ) ) ( not ( = ?auto_5865 ?auto_5867 ) ) ( not ( = ?auto_5865 ?auto_5868 ) ) ( not ( = ?auto_5865 ?auto_5869 ) ) ( not ( = ?auto_5866 ?auto_5867 ) ) ( not ( = ?auto_5866 ?auto_5868 ) ) ( not ( = ?auto_5866 ?auto_5869 ) ) ( not ( = ?auto_5867 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5869 ) ) ( not ( = ?auto_5868 ?auto_5869 ) ) ( CLEAR ?auto_5867 ) ( ON ?auto_5868 ?auto_5869 ) ( CLEAR ?auto_5868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5865 ?auto_5866 ?auto_5867 ?auto_5868 )
      ( MAKE-5PILE ?auto_5865 ?auto_5866 ?auto_5867 ?auto_5868 ?auto_5869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5875 - BLOCK
      ?auto_5876 - BLOCK
      ?auto_5877 - BLOCK
      ?auto_5878 - BLOCK
      ?auto_5879 - BLOCK
    )
    :vars
    (
      ?auto_5880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5879 ?auto_5880 ) ( ON-TABLE ?auto_5875 ) ( ON ?auto_5876 ?auto_5875 ) ( not ( = ?auto_5875 ?auto_5876 ) ) ( not ( = ?auto_5875 ?auto_5877 ) ) ( not ( = ?auto_5875 ?auto_5878 ) ) ( not ( = ?auto_5875 ?auto_5879 ) ) ( not ( = ?auto_5875 ?auto_5880 ) ) ( not ( = ?auto_5876 ?auto_5877 ) ) ( not ( = ?auto_5876 ?auto_5878 ) ) ( not ( = ?auto_5876 ?auto_5879 ) ) ( not ( = ?auto_5876 ?auto_5880 ) ) ( not ( = ?auto_5877 ?auto_5878 ) ) ( not ( = ?auto_5877 ?auto_5879 ) ) ( not ( = ?auto_5877 ?auto_5880 ) ) ( not ( = ?auto_5878 ?auto_5879 ) ) ( not ( = ?auto_5878 ?auto_5880 ) ) ( not ( = ?auto_5879 ?auto_5880 ) ) ( ON ?auto_5878 ?auto_5879 ) ( CLEAR ?auto_5876 ) ( ON ?auto_5877 ?auto_5878 ) ( CLEAR ?auto_5877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5875 ?auto_5876 ?auto_5877 )
      ( MAKE-5PILE ?auto_5875 ?auto_5876 ?auto_5877 ?auto_5878 ?auto_5879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5886 - BLOCK
      ?auto_5887 - BLOCK
      ?auto_5888 - BLOCK
      ?auto_5889 - BLOCK
      ?auto_5890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5890 ) ( ON-TABLE ?auto_5886 ) ( ON ?auto_5887 ?auto_5886 ) ( not ( = ?auto_5886 ?auto_5887 ) ) ( not ( = ?auto_5886 ?auto_5888 ) ) ( not ( = ?auto_5886 ?auto_5889 ) ) ( not ( = ?auto_5886 ?auto_5890 ) ) ( not ( = ?auto_5887 ?auto_5888 ) ) ( not ( = ?auto_5887 ?auto_5889 ) ) ( not ( = ?auto_5887 ?auto_5890 ) ) ( not ( = ?auto_5888 ?auto_5889 ) ) ( not ( = ?auto_5888 ?auto_5890 ) ) ( not ( = ?auto_5889 ?auto_5890 ) ) ( ON ?auto_5889 ?auto_5890 ) ( CLEAR ?auto_5887 ) ( ON ?auto_5888 ?auto_5889 ) ( CLEAR ?auto_5888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5886 ?auto_5887 ?auto_5888 )
      ( MAKE-5PILE ?auto_5886 ?auto_5887 ?auto_5888 ?auto_5889 ?auto_5890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5896 - BLOCK
      ?auto_5897 - BLOCK
      ?auto_5898 - BLOCK
      ?auto_5899 - BLOCK
      ?auto_5900 - BLOCK
    )
    :vars
    (
      ?auto_5901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5900 ?auto_5901 ) ( ON-TABLE ?auto_5896 ) ( not ( = ?auto_5896 ?auto_5897 ) ) ( not ( = ?auto_5896 ?auto_5898 ) ) ( not ( = ?auto_5896 ?auto_5899 ) ) ( not ( = ?auto_5896 ?auto_5900 ) ) ( not ( = ?auto_5896 ?auto_5901 ) ) ( not ( = ?auto_5897 ?auto_5898 ) ) ( not ( = ?auto_5897 ?auto_5899 ) ) ( not ( = ?auto_5897 ?auto_5900 ) ) ( not ( = ?auto_5897 ?auto_5901 ) ) ( not ( = ?auto_5898 ?auto_5899 ) ) ( not ( = ?auto_5898 ?auto_5900 ) ) ( not ( = ?auto_5898 ?auto_5901 ) ) ( not ( = ?auto_5899 ?auto_5900 ) ) ( not ( = ?auto_5899 ?auto_5901 ) ) ( not ( = ?auto_5900 ?auto_5901 ) ) ( ON ?auto_5899 ?auto_5900 ) ( ON ?auto_5898 ?auto_5899 ) ( CLEAR ?auto_5896 ) ( ON ?auto_5897 ?auto_5898 ) ( CLEAR ?auto_5897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5896 ?auto_5897 )
      ( MAKE-5PILE ?auto_5896 ?auto_5897 ?auto_5898 ?auto_5899 ?auto_5900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5907 - BLOCK
      ?auto_5908 - BLOCK
      ?auto_5909 - BLOCK
      ?auto_5910 - BLOCK
      ?auto_5911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5911 ) ( ON-TABLE ?auto_5907 ) ( not ( = ?auto_5907 ?auto_5908 ) ) ( not ( = ?auto_5907 ?auto_5909 ) ) ( not ( = ?auto_5907 ?auto_5910 ) ) ( not ( = ?auto_5907 ?auto_5911 ) ) ( not ( = ?auto_5908 ?auto_5909 ) ) ( not ( = ?auto_5908 ?auto_5910 ) ) ( not ( = ?auto_5908 ?auto_5911 ) ) ( not ( = ?auto_5909 ?auto_5910 ) ) ( not ( = ?auto_5909 ?auto_5911 ) ) ( not ( = ?auto_5910 ?auto_5911 ) ) ( ON ?auto_5910 ?auto_5911 ) ( ON ?auto_5909 ?auto_5910 ) ( CLEAR ?auto_5907 ) ( ON ?auto_5908 ?auto_5909 ) ( CLEAR ?auto_5908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5907 ?auto_5908 )
      ( MAKE-5PILE ?auto_5907 ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5917 - BLOCK
      ?auto_5918 - BLOCK
      ?auto_5919 - BLOCK
      ?auto_5920 - BLOCK
      ?auto_5921 - BLOCK
    )
    :vars
    (
      ?auto_5922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5921 ?auto_5922 ) ( not ( = ?auto_5917 ?auto_5918 ) ) ( not ( = ?auto_5917 ?auto_5919 ) ) ( not ( = ?auto_5917 ?auto_5920 ) ) ( not ( = ?auto_5917 ?auto_5921 ) ) ( not ( = ?auto_5917 ?auto_5922 ) ) ( not ( = ?auto_5918 ?auto_5919 ) ) ( not ( = ?auto_5918 ?auto_5920 ) ) ( not ( = ?auto_5918 ?auto_5921 ) ) ( not ( = ?auto_5918 ?auto_5922 ) ) ( not ( = ?auto_5919 ?auto_5920 ) ) ( not ( = ?auto_5919 ?auto_5921 ) ) ( not ( = ?auto_5919 ?auto_5922 ) ) ( not ( = ?auto_5920 ?auto_5921 ) ) ( not ( = ?auto_5920 ?auto_5922 ) ) ( not ( = ?auto_5921 ?auto_5922 ) ) ( ON ?auto_5920 ?auto_5921 ) ( ON ?auto_5919 ?auto_5920 ) ( ON ?auto_5918 ?auto_5919 ) ( ON ?auto_5917 ?auto_5918 ) ( CLEAR ?auto_5917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5917 )
      ( MAKE-5PILE ?auto_5917 ?auto_5918 ?auto_5919 ?auto_5920 ?auto_5921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5928 - BLOCK
      ?auto_5929 - BLOCK
      ?auto_5930 - BLOCK
      ?auto_5931 - BLOCK
      ?auto_5932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5932 ) ( not ( = ?auto_5928 ?auto_5929 ) ) ( not ( = ?auto_5928 ?auto_5930 ) ) ( not ( = ?auto_5928 ?auto_5931 ) ) ( not ( = ?auto_5928 ?auto_5932 ) ) ( not ( = ?auto_5929 ?auto_5930 ) ) ( not ( = ?auto_5929 ?auto_5931 ) ) ( not ( = ?auto_5929 ?auto_5932 ) ) ( not ( = ?auto_5930 ?auto_5931 ) ) ( not ( = ?auto_5930 ?auto_5932 ) ) ( not ( = ?auto_5931 ?auto_5932 ) ) ( ON ?auto_5931 ?auto_5932 ) ( ON ?auto_5930 ?auto_5931 ) ( ON ?auto_5929 ?auto_5930 ) ( ON ?auto_5928 ?auto_5929 ) ( CLEAR ?auto_5928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5928 )
      ( MAKE-5PILE ?auto_5928 ?auto_5929 ?auto_5930 ?auto_5931 ?auto_5932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5938 - BLOCK
      ?auto_5939 - BLOCK
      ?auto_5940 - BLOCK
      ?auto_5941 - BLOCK
      ?auto_5942 - BLOCK
    )
    :vars
    (
      ?auto_5943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5940 ) ) ( not ( = ?auto_5938 ?auto_5941 ) ) ( not ( = ?auto_5938 ?auto_5942 ) ) ( not ( = ?auto_5939 ?auto_5940 ) ) ( not ( = ?auto_5939 ?auto_5941 ) ) ( not ( = ?auto_5939 ?auto_5942 ) ) ( not ( = ?auto_5940 ?auto_5941 ) ) ( not ( = ?auto_5940 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( ON ?auto_5938 ?auto_5943 ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5938 ?auto_5943 ) ) ( ON ?auto_5939 ?auto_5938 ) ( ON ?auto_5940 ?auto_5939 ) ( ON ?auto_5941 ?auto_5940 ) ( ON ?auto_5942 ?auto_5941 ) ( CLEAR ?auto_5942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_5942 ?auto_5941 ?auto_5940 ?auto_5939 ?auto_5938 )
      ( MAKE-5PILE ?auto_5938 ?auto_5939 ?auto_5940 ?auto_5941 ?auto_5942 ) )
  )

)

