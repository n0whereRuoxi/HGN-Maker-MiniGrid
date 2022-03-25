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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_75747 - BLOCK
      ?auto_75748 - BLOCK
      ?auto_75749 - BLOCK
      ?auto_75750 - BLOCK
      ?auto_75751 - BLOCK
      ?auto_75752 - BLOCK
      ?auto_75753 - BLOCK
    )
    :vars
    (
      ?auto_75754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75754 ?auto_75753 ) ( CLEAR ?auto_75754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75747 ) ( ON ?auto_75748 ?auto_75747 ) ( ON ?auto_75749 ?auto_75748 ) ( ON ?auto_75750 ?auto_75749 ) ( ON ?auto_75751 ?auto_75750 ) ( ON ?auto_75752 ?auto_75751 ) ( ON ?auto_75753 ?auto_75752 ) ( not ( = ?auto_75747 ?auto_75748 ) ) ( not ( = ?auto_75747 ?auto_75749 ) ) ( not ( = ?auto_75747 ?auto_75750 ) ) ( not ( = ?auto_75747 ?auto_75751 ) ) ( not ( = ?auto_75747 ?auto_75752 ) ) ( not ( = ?auto_75747 ?auto_75753 ) ) ( not ( = ?auto_75747 ?auto_75754 ) ) ( not ( = ?auto_75748 ?auto_75749 ) ) ( not ( = ?auto_75748 ?auto_75750 ) ) ( not ( = ?auto_75748 ?auto_75751 ) ) ( not ( = ?auto_75748 ?auto_75752 ) ) ( not ( = ?auto_75748 ?auto_75753 ) ) ( not ( = ?auto_75748 ?auto_75754 ) ) ( not ( = ?auto_75749 ?auto_75750 ) ) ( not ( = ?auto_75749 ?auto_75751 ) ) ( not ( = ?auto_75749 ?auto_75752 ) ) ( not ( = ?auto_75749 ?auto_75753 ) ) ( not ( = ?auto_75749 ?auto_75754 ) ) ( not ( = ?auto_75750 ?auto_75751 ) ) ( not ( = ?auto_75750 ?auto_75752 ) ) ( not ( = ?auto_75750 ?auto_75753 ) ) ( not ( = ?auto_75750 ?auto_75754 ) ) ( not ( = ?auto_75751 ?auto_75752 ) ) ( not ( = ?auto_75751 ?auto_75753 ) ) ( not ( = ?auto_75751 ?auto_75754 ) ) ( not ( = ?auto_75752 ?auto_75753 ) ) ( not ( = ?auto_75752 ?auto_75754 ) ) ( not ( = ?auto_75753 ?auto_75754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75754 ?auto_75753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75756 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75756 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_75756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_75757 - BLOCK
    )
    :vars
    (
      ?auto_75758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75757 ?auto_75758 ) ( CLEAR ?auto_75757 ) ( HAND-EMPTY ) ( not ( = ?auto_75757 ?auto_75758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75757 ?auto_75758 )
      ( MAKE-1PILE ?auto_75757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75765 - BLOCK
      ?auto_75766 - BLOCK
      ?auto_75767 - BLOCK
      ?auto_75768 - BLOCK
      ?auto_75769 - BLOCK
      ?auto_75770 - BLOCK
    )
    :vars
    (
      ?auto_75771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75771 ?auto_75770 ) ( CLEAR ?auto_75771 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75765 ) ( ON ?auto_75766 ?auto_75765 ) ( ON ?auto_75767 ?auto_75766 ) ( ON ?auto_75768 ?auto_75767 ) ( ON ?auto_75769 ?auto_75768 ) ( ON ?auto_75770 ?auto_75769 ) ( not ( = ?auto_75765 ?auto_75766 ) ) ( not ( = ?auto_75765 ?auto_75767 ) ) ( not ( = ?auto_75765 ?auto_75768 ) ) ( not ( = ?auto_75765 ?auto_75769 ) ) ( not ( = ?auto_75765 ?auto_75770 ) ) ( not ( = ?auto_75765 ?auto_75771 ) ) ( not ( = ?auto_75766 ?auto_75767 ) ) ( not ( = ?auto_75766 ?auto_75768 ) ) ( not ( = ?auto_75766 ?auto_75769 ) ) ( not ( = ?auto_75766 ?auto_75770 ) ) ( not ( = ?auto_75766 ?auto_75771 ) ) ( not ( = ?auto_75767 ?auto_75768 ) ) ( not ( = ?auto_75767 ?auto_75769 ) ) ( not ( = ?auto_75767 ?auto_75770 ) ) ( not ( = ?auto_75767 ?auto_75771 ) ) ( not ( = ?auto_75768 ?auto_75769 ) ) ( not ( = ?auto_75768 ?auto_75770 ) ) ( not ( = ?auto_75768 ?auto_75771 ) ) ( not ( = ?auto_75769 ?auto_75770 ) ) ( not ( = ?auto_75769 ?auto_75771 ) ) ( not ( = ?auto_75770 ?auto_75771 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75771 ?auto_75770 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75772 - BLOCK
      ?auto_75773 - BLOCK
      ?auto_75774 - BLOCK
      ?auto_75775 - BLOCK
      ?auto_75776 - BLOCK
      ?auto_75777 - BLOCK
    )
    :vars
    (
      ?auto_75778 - BLOCK
      ?auto_75779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75778 ?auto_75777 ) ( CLEAR ?auto_75778 ) ( ON-TABLE ?auto_75772 ) ( ON ?auto_75773 ?auto_75772 ) ( ON ?auto_75774 ?auto_75773 ) ( ON ?auto_75775 ?auto_75774 ) ( ON ?auto_75776 ?auto_75775 ) ( ON ?auto_75777 ?auto_75776 ) ( not ( = ?auto_75772 ?auto_75773 ) ) ( not ( = ?auto_75772 ?auto_75774 ) ) ( not ( = ?auto_75772 ?auto_75775 ) ) ( not ( = ?auto_75772 ?auto_75776 ) ) ( not ( = ?auto_75772 ?auto_75777 ) ) ( not ( = ?auto_75772 ?auto_75778 ) ) ( not ( = ?auto_75773 ?auto_75774 ) ) ( not ( = ?auto_75773 ?auto_75775 ) ) ( not ( = ?auto_75773 ?auto_75776 ) ) ( not ( = ?auto_75773 ?auto_75777 ) ) ( not ( = ?auto_75773 ?auto_75778 ) ) ( not ( = ?auto_75774 ?auto_75775 ) ) ( not ( = ?auto_75774 ?auto_75776 ) ) ( not ( = ?auto_75774 ?auto_75777 ) ) ( not ( = ?auto_75774 ?auto_75778 ) ) ( not ( = ?auto_75775 ?auto_75776 ) ) ( not ( = ?auto_75775 ?auto_75777 ) ) ( not ( = ?auto_75775 ?auto_75778 ) ) ( not ( = ?auto_75776 ?auto_75777 ) ) ( not ( = ?auto_75776 ?auto_75778 ) ) ( not ( = ?auto_75777 ?auto_75778 ) ) ( HOLDING ?auto_75779 ) ( not ( = ?auto_75772 ?auto_75779 ) ) ( not ( = ?auto_75773 ?auto_75779 ) ) ( not ( = ?auto_75774 ?auto_75779 ) ) ( not ( = ?auto_75775 ?auto_75779 ) ) ( not ( = ?auto_75776 ?auto_75779 ) ) ( not ( = ?auto_75777 ?auto_75779 ) ) ( not ( = ?auto_75778 ?auto_75779 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_75779 )
      ( MAKE-6PILE ?auto_75772 ?auto_75773 ?auto_75774 ?auto_75775 ?auto_75776 ?auto_75777 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_75780 - BLOCK
      ?auto_75781 - BLOCK
      ?auto_75782 - BLOCK
      ?auto_75783 - BLOCK
      ?auto_75784 - BLOCK
      ?auto_75785 - BLOCK
    )
    :vars
    (
      ?auto_75786 - BLOCK
      ?auto_75787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75786 ?auto_75785 ) ( ON-TABLE ?auto_75780 ) ( ON ?auto_75781 ?auto_75780 ) ( ON ?auto_75782 ?auto_75781 ) ( ON ?auto_75783 ?auto_75782 ) ( ON ?auto_75784 ?auto_75783 ) ( ON ?auto_75785 ?auto_75784 ) ( not ( = ?auto_75780 ?auto_75781 ) ) ( not ( = ?auto_75780 ?auto_75782 ) ) ( not ( = ?auto_75780 ?auto_75783 ) ) ( not ( = ?auto_75780 ?auto_75784 ) ) ( not ( = ?auto_75780 ?auto_75785 ) ) ( not ( = ?auto_75780 ?auto_75786 ) ) ( not ( = ?auto_75781 ?auto_75782 ) ) ( not ( = ?auto_75781 ?auto_75783 ) ) ( not ( = ?auto_75781 ?auto_75784 ) ) ( not ( = ?auto_75781 ?auto_75785 ) ) ( not ( = ?auto_75781 ?auto_75786 ) ) ( not ( = ?auto_75782 ?auto_75783 ) ) ( not ( = ?auto_75782 ?auto_75784 ) ) ( not ( = ?auto_75782 ?auto_75785 ) ) ( not ( = ?auto_75782 ?auto_75786 ) ) ( not ( = ?auto_75783 ?auto_75784 ) ) ( not ( = ?auto_75783 ?auto_75785 ) ) ( not ( = ?auto_75783 ?auto_75786 ) ) ( not ( = ?auto_75784 ?auto_75785 ) ) ( not ( = ?auto_75784 ?auto_75786 ) ) ( not ( = ?auto_75785 ?auto_75786 ) ) ( not ( = ?auto_75780 ?auto_75787 ) ) ( not ( = ?auto_75781 ?auto_75787 ) ) ( not ( = ?auto_75782 ?auto_75787 ) ) ( not ( = ?auto_75783 ?auto_75787 ) ) ( not ( = ?auto_75784 ?auto_75787 ) ) ( not ( = ?auto_75785 ?auto_75787 ) ) ( not ( = ?auto_75786 ?auto_75787 ) ) ( ON ?auto_75787 ?auto_75786 ) ( CLEAR ?auto_75787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75780 ?auto_75781 ?auto_75782 ?auto_75783 ?auto_75784 ?auto_75785 ?auto_75786 )
      ( MAKE-6PILE ?auto_75780 ?auto_75781 ?auto_75782 ?auto_75783 ?auto_75784 ?auto_75785 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75790 - BLOCK
      ?auto_75791 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75791 ) ( CLEAR ?auto_75790 ) ( ON-TABLE ?auto_75790 ) ( not ( = ?auto_75790 ?auto_75791 ) ) )
    :subtasks
    ( ( !STACK ?auto_75791 ?auto_75790 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75792 - BLOCK
      ?auto_75793 - BLOCK
    )
    :vars
    (
      ?auto_75794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75792 ) ( ON-TABLE ?auto_75792 ) ( not ( = ?auto_75792 ?auto_75793 ) ) ( ON ?auto_75793 ?auto_75794 ) ( CLEAR ?auto_75793 ) ( HAND-EMPTY ) ( not ( = ?auto_75792 ?auto_75794 ) ) ( not ( = ?auto_75793 ?auto_75794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75793 ?auto_75794 )
      ( MAKE-2PILE ?auto_75792 ?auto_75793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75795 - BLOCK
      ?auto_75796 - BLOCK
    )
    :vars
    (
      ?auto_75797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75795 ?auto_75796 ) ) ( ON ?auto_75796 ?auto_75797 ) ( CLEAR ?auto_75796 ) ( not ( = ?auto_75795 ?auto_75797 ) ) ( not ( = ?auto_75796 ?auto_75797 ) ) ( HOLDING ?auto_75795 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75795 )
      ( MAKE-2PILE ?auto_75795 ?auto_75796 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75798 - BLOCK
      ?auto_75799 - BLOCK
    )
    :vars
    (
      ?auto_75800 - BLOCK
      ?auto_75802 - BLOCK
      ?auto_75805 - BLOCK
      ?auto_75803 - BLOCK
      ?auto_75801 - BLOCK
      ?auto_75804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75798 ?auto_75799 ) ) ( ON ?auto_75799 ?auto_75800 ) ( not ( = ?auto_75798 ?auto_75800 ) ) ( not ( = ?auto_75799 ?auto_75800 ) ) ( ON ?auto_75798 ?auto_75799 ) ( CLEAR ?auto_75798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75802 ) ( ON ?auto_75805 ?auto_75802 ) ( ON ?auto_75803 ?auto_75805 ) ( ON ?auto_75801 ?auto_75803 ) ( ON ?auto_75804 ?auto_75801 ) ( ON ?auto_75800 ?auto_75804 ) ( not ( = ?auto_75802 ?auto_75805 ) ) ( not ( = ?auto_75802 ?auto_75803 ) ) ( not ( = ?auto_75802 ?auto_75801 ) ) ( not ( = ?auto_75802 ?auto_75804 ) ) ( not ( = ?auto_75802 ?auto_75800 ) ) ( not ( = ?auto_75802 ?auto_75799 ) ) ( not ( = ?auto_75802 ?auto_75798 ) ) ( not ( = ?auto_75805 ?auto_75803 ) ) ( not ( = ?auto_75805 ?auto_75801 ) ) ( not ( = ?auto_75805 ?auto_75804 ) ) ( not ( = ?auto_75805 ?auto_75800 ) ) ( not ( = ?auto_75805 ?auto_75799 ) ) ( not ( = ?auto_75805 ?auto_75798 ) ) ( not ( = ?auto_75803 ?auto_75801 ) ) ( not ( = ?auto_75803 ?auto_75804 ) ) ( not ( = ?auto_75803 ?auto_75800 ) ) ( not ( = ?auto_75803 ?auto_75799 ) ) ( not ( = ?auto_75803 ?auto_75798 ) ) ( not ( = ?auto_75801 ?auto_75804 ) ) ( not ( = ?auto_75801 ?auto_75800 ) ) ( not ( = ?auto_75801 ?auto_75799 ) ) ( not ( = ?auto_75801 ?auto_75798 ) ) ( not ( = ?auto_75804 ?auto_75800 ) ) ( not ( = ?auto_75804 ?auto_75799 ) ) ( not ( = ?auto_75804 ?auto_75798 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75802 ?auto_75805 ?auto_75803 ?auto_75801 ?auto_75804 ?auto_75800 ?auto_75799 )
      ( MAKE-2PILE ?auto_75798 ?auto_75799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75811 - BLOCK
      ?auto_75812 - BLOCK
      ?auto_75813 - BLOCK
      ?auto_75814 - BLOCK
      ?auto_75815 - BLOCK
    )
    :vars
    (
      ?auto_75816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75816 ?auto_75815 ) ( CLEAR ?auto_75816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75811 ) ( ON ?auto_75812 ?auto_75811 ) ( ON ?auto_75813 ?auto_75812 ) ( ON ?auto_75814 ?auto_75813 ) ( ON ?auto_75815 ?auto_75814 ) ( not ( = ?auto_75811 ?auto_75812 ) ) ( not ( = ?auto_75811 ?auto_75813 ) ) ( not ( = ?auto_75811 ?auto_75814 ) ) ( not ( = ?auto_75811 ?auto_75815 ) ) ( not ( = ?auto_75811 ?auto_75816 ) ) ( not ( = ?auto_75812 ?auto_75813 ) ) ( not ( = ?auto_75812 ?auto_75814 ) ) ( not ( = ?auto_75812 ?auto_75815 ) ) ( not ( = ?auto_75812 ?auto_75816 ) ) ( not ( = ?auto_75813 ?auto_75814 ) ) ( not ( = ?auto_75813 ?auto_75815 ) ) ( not ( = ?auto_75813 ?auto_75816 ) ) ( not ( = ?auto_75814 ?auto_75815 ) ) ( not ( = ?auto_75814 ?auto_75816 ) ) ( not ( = ?auto_75815 ?auto_75816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75816 ?auto_75815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75817 - BLOCK
      ?auto_75818 - BLOCK
      ?auto_75819 - BLOCK
      ?auto_75820 - BLOCK
      ?auto_75821 - BLOCK
    )
    :vars
    (
      ?auto_75822 - BLOCK
      ?auto_75823 - BLOCK
      ?auto_75824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75822 ?auto_75821 ) ( CLEAR ?auto_75822 ) ( ON-TABLE ?auto_75817 ) ( ON ?auto_75818 ?auto_75817 ) ( ON ?auto_75819 ?auto_75818 ) ( ON ?auto_75820 ?auto_75819 ) ( ON ?auto_75821 ?auto_75820 ) ( not ( = ?auto_75817 ?auto_75818 ) ) ( not ( = ?auto_75817 ?auto_75819 ) ) ( not ( = ?auto_75817 ?auto_75820 ) ) ( not ( = ?auto_75817 ?auto_75821 ) ) ( not ( = ?auto_75817 ?auto_75822 ) ) ( not ( = ?auto_75818 ?auto_75819 ) ) ( not ( = ?auto_75818 ?auto_75820 ) ) ( not ( = ?auto_75818 ?auto_75821 ) ) ( not ( = ?auto_75818 ?auto_75822 ) ) ( not ( = ?auto_75819 ?auto_75820 ) ) ( not ( = ?auto_75819 ?auto_75821 ) ) ( not ( = ?auto_75819 ?auto_75822 ) ) ( not ( = ?auto_75820 ?auto_75821 ) ) ( not ( = ?auto_75820 ?auto_75822 ) ) ( not ( = ?auto_75821 ?auto_75822 ) ) ( HOLDING ?auto_75823 ) ( CLEAR ?auto_75824 ) ( not ( = ?auto_75817 ?auto_75823 ) ) ( not ( = ?auto_75817 ?auto_75824 ) ) ( not ( = ?auto_75818 ?auto_75823 ) ) ( not ( = ?auto_75818 ?auto_75824 ) ) ( not ( = ?auto_75819 ?auto_75823 ) ) ( not ( = ?auto_75819 ?auto_75824 ) ) ( not ( = ?auto_75820 ?auto_75823 ) ) ( not ( = ?auto_75820 ?auto_75824 ) ) ( not ( = ?auto_75821 ?auto_75823 ) ) ( not ( = ?auto_75821 ?auto_75824 ) ) ( not ( = ?auto_75822 ?auto_75823 ) ) ( not ( = ?auto_75822 ?auto_75824 ) ) ( not ( = ?auto_75823 ?auto_75824 ) ) )
    :subtasks
    ( ( !STACK ?auto_75823 ?auto_75824 )
      ( MAKE-5PILE ?auto_75817 ?auto_75818 ?auto_75819 ?auto_75820 ?auto_75821 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75825 - BLOCK
      ?auto_75826 - BLOCK
      ?auto_75827 - BLOCK
      ?auto_75828 - BLOCK
      ?auto_75829 - BLOCK
    )
    :vars
    (
      ?auto_75832 - BLOCK
      ?auto_75830 - BLOCK
      ?auto_75831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75832 ?auto_75829 ) ( ON-TABLE ?auto_75825 ) ( ON ?auto_75826 ?auto_75825 ) ( ON ?auto_75827 ?auto_75826 ) ( ON ?auto_75828 ?auto_75827 ) ( ON ?auto_75829 ?auto_75828 ) ( not ( = ?auto_75825 ?auto_75826 ) ) ( not ( = ?auto_75825 ?auto_75827 ) ) ( not ( = ?auto_75825 ?auto_75828 ) ) ( not ( = ?auto_75825 ?auto_75829 ) ) ( not ( = ?auto_75825 ?auto_75832 ) ) ( not ( = ?auto_75826 ?auto_75827 ) ) ( not ( = ?auto_75826 ?auto_75828 ) ) ( not ( = ?auto_75826 ?auto_75829 ) ) ( not ( = ?auto_75826 ?auto_75832 ) ) ( not ( = ?auto_75827 ?auto_75828 ) ) ( not ( = ?auto_75827 ?auto_75829 ) ) ( not ( = ?auto_75827 ?auto_75832 ) ) ( not ( = ?auto_75828 ?auto_75829 ) ) ( not ( = ?auto_75828 ?auto_75832 ) ) ( not ( = ?auto_75829 ?auto_75832 ) ) ( CLEAR ?auto_75830 ) ( not ( = ?auto_75825 ?auto_75831 ) ) ( not ( = ?auto_75825 ?auto_75830 ) ) ( not ( = ?auto_75826 ?auto_75831 ) ) ( not ( = ?auto_75826 ?auto_75830 ) ) ( not ( = ?auto_75827 ?auto_75831 ) ) ( not ( = ?auto_75827 ?auto_75830 ) ) ( not ( = ?auto_75828 ?auto_75831 ) ) ( not ( = ?auto_75828 ?auto_75830 ) ) ( not ( = ?auto_75829 ?auto_75831 ) ) ( not ( = ?auto_75829 ?auto_75830 ) ) ( not ( = ?auto_75832 ?auto_75831 ) ) ( not ( = ?auto_75832 ?auto_75830 ) ) ( not ( = ?auto_75831 ?auto_75830 ) ) ( ON ?auto_75831 ?auto_75832 ) ( CLEAR ?auto_75831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75825 ?auto_75826 ?auto_75827 ?auto_75828 ?auto_75829 ?auto_75832 )
      ( MAKE-5PILE ?auto_75825 ?auto_75826 ?auto_75827 ?auto_75828 ?auto_75829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75833 - BLOCK
      ?auto_75834 - BLOCK
      ?auto_75835 - BLOCK
      ?auto_75836 - BLOCK
      ?auto_75837 - BLOCK
    )
    :vars
    (
      ?auto_75840 - BLOCK
      ?auto_75838 - BLOCK
      ?auto_75839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75840 ?auto_75837 ) ( ON-TABLE ?auto_75833 ) ( ON ?auto_75834 ?auto_75833 ) ( ON ?auto_75835 ?auto_75834 ) ( ON ?auto_75836 ?auto_75835 ) ( ON ?auto_75837 ?auto_75836 ) ( not ( = ?auto_75833 ?auto_75834 ) ) ( not ( = ?auto_75833 ?auto_75835 ) ) ( not ( = ?auto_75833 ?auto_75836 ) ) ( not ( = ?auto_75833 ?auto_75837 ) ) ( not ( = ?auto_75833 ?auto_75840 ) ) ( not ( = ?auto_75834 ?auto_75835 ) ) ( not ( = ?auto_75834 ?auto_75836 ) ) ( not ( = ?auto_75834 ?auto_75837 ) ) ( not ( = ?auto_75834 ?auto_75840 ) ) ( not ( = ?auto_75835 ?auto_75836 ) ) ( not ( = ?auto_75835 ?auto_75837 ) ) ( not ( = ?auto_75835 ?auto_75840 ) ) ( not ( = ?auto_75836 ?auto_75837 ) ) ( not ( = ?auto_75836 ?auto_75840 ) ) ( not ( = ?auto_75837 ?auto_75840 ) ) ( not ( = ?auto_75833 ?auto_75838 ) ) ( not ( = ?auto_75833 ?auto_75839 ) ) ( not ( = ?auto_75834 ?auto_75838 ) ) ( not ( = ?auto_75834 ?auto_75839 ) ) ( not ( = ?auto_75835 ?auto_75838 ) ) ( not ( = ?auto_75835 ?auto_75839 ) ) ( not ( = ?auto_75836 ?auto_75838 ) ) ( not ( = ?auto_75836 ?auto_75839 ) ) ( not ( = ?auto_75837 ?auto_75838 ) ) ( not ( = ?auto_75837 ?auto_75839 ) ) ( not ( = ?auto_75840 ?auto_75838 ) ) ( not ( = ?auto_75840 ?auto_75839 ) ) ( not ( = ?auto_75838 ?auto_75839 ) ) ( ON ?auto_75838 ?auto_75840 ) ( CLEAR ?auto_75838 ) ( HOLDING ?auto_75839 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75839 )
      ( MAKE-5PILE ?auto_75833 ?auto_75834 ?auto_75835 ?auto_75836 ?auto_75837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_75841 - BLOCK
      ?auto_75842 - BLOCK
      ?auto_75843 - BLOCK
      ?auto_75844 - BLOCK
      ?auto_75845 - BLOCK
    )
    :vars
    (
      ?auto_75846 - BLOCK
      ?auto_75848 - BLOCK
      ?auto_75847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75846 ?auto_75845 ) ( ON-TABLE ?auto_75841 ) ( ON ?auto_75842 ?auto_75841 ) ( ON ?auto_75843 ?auto_75842 ) ( ON ?auto_75844 ?auto_75843 ) ( ON ?auto_75845 ?auto_75844 ) ( not ( = ?auto_75841 ?auto_75842 ) ) ( not ( = ?auto_75841 ?auto_75843 ) ) ( not ( = ?auto_75841 ?auto_75844 ) ) ( not ( = ?auto_75841 ?auto_75845 ) ) ( not ( = ?auto_75841 ?auto_75846 ) ) ( not ( = ?auto_75842 ?auto_75843 ) ) ( not ( = ?auto_75842 ?auto_75844 ) ) ( not ( = ?auto_75842 ?auto_75845 ) ) ( not ( = ?auto_75842 ?auto_75846 ) ) ( not ( = ?auto_75843 ?auto_75844 ) ) ( not ( = ?auto_75843 ?auto_75845 ) ) ( not ( = ?auto_75843 ?auto_75846 ) ) ( not ( = ?auto_75844 ?auto_75845 ) ) ( not ( = ?auto_75844 ?auto_75846 ) ) ( not ( = ?auto_75845 ?auto_75846 ) ) ( not ( = ?auto_75841 ?auto_75848 ) ) ( not ( = ?auto_75841 ?auto_75847 ) ) ( not ( = ?auto_75842 ?auto_75848 ) ) ( not ( = ?auto_75842 ?auto_75847 ) ) ( not ( = ?auto_75843 ?auto_75848 ) ) ( not ( = ?auto_75843 ?auto_75847 ) ) ( not ( = ?auto_75844 ?auto_75848 ) ) ( not ( = ?auto_75844 ?auto_75847 ) ) ( not ( = ?auto_75845 ?auto_75848 ) ) ( not ( = ?auto_75845 ?auto_75847 ) ) ( not ( = ?auto_75846 ?auto_75848 ) ) ( not ( = ?auto_75846 ?auto_75847 ) ) ( not ( = ?auto_75848 ?auto_75847 ) ) ( ON ?auto_75848 ?auto_75846 ) ( ON ?auto_75847 ?auto_75848 ) ( CLEAR ?auto_75847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75841 ?auto_75842 ?auto_75843 ?auto_75844 ?auto_75845 ?auto_75846 ?auto_75848 )
      ( MAKE-5PILE ?auto_75841 ?auto_75842 ?auto_75843 ?auto_75844 ?auto_75845 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75852 - BLOCK
      ?auto_75853 - BLOCK
      ?auto_75854 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75854 ) ( CLEAR ?auto_75853 ) ( ON-TABLE ?auto_75852 ) ( ON ?auto_75853 ?auto_75852 ) ( not ( = ?auto_75852 ?auto_75853 ) ) ( not ( = ?auto_75852 ?auto_75854 ) ) ( not ( = ?auto_75853 ?auto_75854 ) ) )
    :subtasks
    ( ( !STACK ?auto_75854 ?auto_75853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75855 - BLOCK
      ?auto_75856 - BLOCK
      ?auto_75857 - BLOCK
    )
    :vars
    (
      ?auto_75858 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75856 ) ( ON-TABLE ?auto_75855 ) ( ON ?auto_75856 ?auto_75855 ) ( not ( = ?auto_75855 ?auto_75856 ) ) ( not ( = ?auto_75855 ?auto_75857 ) ) ( not ( = ?auto_75856 ?auto_75857 ) ) ( ON ?auto_75857 ?auto_75858 ) ( CLEAR ?auto_75857 ) ( HAND-EMPTY ) ( not ( = ?auto_75855 ?auto_75858 ) ) ( not ( = ?auto_75856 ?auto_75858 ) ) ( not ( = ?auto_75857 ?auto_75858 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75857 ?auto_75858 )
      ( MAKE-3PILE ?auto_75855 ?auto_75856 ?auto_75857 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75859 - BLOCK
      ?auto_75860 - BLOCK
      ?auto_75861 - BLOCK
    )
    :vars
    (
      ?auto_75862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75859 ) ( not ( = ?auto_75859 ?auto_75860 ) ) ( not ( = ?auto_75859 ?auto_75861 ) ) ( not ( = ?auto_75860 ?auto_75861 ) ) ( ON ?auto_75861 ?auto_75862 ) ( CLEAR ?auto_75861 ) ( not ( = ?auto_75859 ?auto_75862 ) ) ( not ( = ?auto_75860 ?auto_75862 ) ) ( not ( = ?auto_75861 ?auto_75862 ) ) ( HOLDING ?auto_75860 ) ( CLEAR ?auto_75859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75859 ?auto_75860 )
      ( MAKE-3PILE ?auto_75859 ?auto_75860 ?auto_75861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75863 - BLOCK
      ?auto_75864 - BLOCK
      ?auto_75865 - BLOCK
    )
    :vars
    (
      ?auto_75866 - BLOCK
      ?auto_75868 - BLOCK
      ?auto_75869 - BLOCK
      ?auto_75870 - BLOCK
      ?auto_75867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75863 ) ( not ( = ?auto_75863 ?auto_75864 ) ) ( not ( = ?auto_75863 ?auto_75865 ) ) ( not ( = ?auto_75864 ?auto_75865 ) ) ( ON ?auto_75865 ?auto_75866 ) ( not ( = ?auto_75863 ?auto_75866 ) ) ( not ( = ?auto_75864 ?auto_75866 ) ) ( not ( = ?auto_75865 ?auto_75866 ) ) ( CLEAR ?auto_75863 ) ( ON ?auto_75864 ?auto_75865 ) ( CLEAR ?auto_75864 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75868 ) ( ON ?auto_75869 ?auto_75868 ) ( ON ?auto_75870 ?auto_75869 ) ( ON ?auto_75867 ?auto_75870 ) ( ON ?auto_75866 ?auto_75867 ) ( not ( = ?auto_75868 ?auto_75869 ) ) ( not ( = ?auto_75868 ?auto_75870 ) ) ( not ( = ?auto_75868 ?auto_75867 ) ) ( not ( = ?auto_75868 ?auto_75866 ) ) ( not ( = ?auto_75868 ?auto_75865 ) ) ( not ( = ?auto_75868 ?auto_75864 ) ) ( not ( = ?auto_75869 ?auto_75870 ) ) ( not ( = ?auto_75869 ?auto_75867 ) ) ( not ( = ?auto_75869 ?auto_75866 ) ) ( not ( = ?auto_75869 ?auto_75865 ) ) ( not ( = ?auto_75869 ?auto_75864 ) ) ( not ( = ?auto_75870 ?auto_75867 ) ) ( not ( = ?auto_75870 ?auto_75866 ) ) ( not ( = ?auto_75870 ?auto_75865 ) ) ( not ( = ?auto_75870 ?auto_75864 ) ) ( not ( = ?auto_75867 ?auto_75866 ) ) ( not ( = ?auto_75867 ?auto_75865 ) ) ( not ( = ?auto_75867 ?auto_75864 ) ) ( not ( = ?auto_75863 ?auto_75868 ) ) ( not ( = ?auto_75863 ?auto_75869 ) ) ( not ( = ?auto_75863 ?auto_75870 ) ) ( not ( = ?auto_75863 ?auto_75867 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75868 ?auto_75869 ?auto_75870 ?auto_75867 ?auto_75866 ?auto_75865 )
      ( MAKE-3PILE ?auto_75863 ?auto_75864 ?auto_75865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75871 - BLOCK
      ?auto_75872 - BLOCK
      ?auto_75873 - BLOCK
    )
    :vars
    (
      ?auto_75878 - BLOCK
      ?auto_75875 - BLOCK
      ?auto_75874 - BLOCK
      ?auto_75876 - BLOCK
      ?auto_75877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75871 ?auto_75872 ) ) ( not ( = ?auto_75871 ?auto_75873 ) ) ( not ( = ?auto_75872 ?auto_75873 ) ) ( ON ?auto_75873 ?auto_75878 ) ( not ( = ?auto_75871 ?auto_75878 ) ) ( not ( = ?auto_75872 ?auto_75878 ) ) ( not ( = ?auto_75873 ?auto_75878 ) ) ( ON ?auto_75872 ?auto_75873 ) ( CLEAR ?auto_75872 ) ( ON-TABLE ?auto_75875 ) ( ON ?auto_75874 ?auto_75875 ) ( ON ?auto_75876 ?auto_75874 ) ( ON ?auto_75877 ?auto_75876 ) ( ON ?auto_75878 ?auto_75877 ) ( not ( = ?auto_75875 ?auto_75874 ) ) ( not ( = ?auto_75875 ?auto_75876 ) ) ( not ( = ?auto_75875 ?auto_75877 ) ) ( not ( = ?auto_75875 ?auto_75878 ) ) ( not ( = ?auto_75875 ?auto_75873 ) ) ( not ( = ?auto_75875 ?auto_75872 ) ) ( not ( = ?auto_75874 ?auto_75876 ) ) ( not ( = ?auto_75874 ?auto_75877 ) ) ( not ( = ?auto_75874 ?auto_75878 ) ) ( not ( = ?auto_75874 ?auto_75873 ) ) ( not ( = ?auto_75874 ?auto_75872 ) ) ( not ( = ?auto_75876 ?auto_75877 ) ) ( not ( = ?auto_75876 ?auto_75878 ) ) ( not ( = ?auto_75876 ?auto_75873 ) ) ( not ( = ?auto_75876 ?auto_75872 ) ) ( not ( = ?auto_75877 ?auto_75878 ) ) ( not ( = ?auto_75877 ?auto_75873 ) ) ( not ( = ?auto_75877 ?auto_75872 ) ) ( not ( = ?auto_75871 ?auto_75875 ) ) ( not ( = ?auto_75871 ?auto_75874 ) ) ( not ( = ?auto_75871 ?auto_75876 ) ) ( not ( = ?auto_75871 ?auto_75877 ) ) ( HOLDING ?auto_75871 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75871 )
      ( MAKE-3PILE ?auto_75871 ?auto_75872 ?auto_75873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_75879 - BLOCK
      ?auto_75880 - BLOCK
      ?auto_75881 - BLOCK
    )
    :vars
    (
      ?auto_75883 - BLOCK
      ?auto_75882 - BLOCK
      ?auto_75884 - BLOCK
      ?auto_75886 - BLOCK
      ?auto_75885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75879 ?auto_75880 ) ) ( not ( = ?auto_75879 ?auto_75881 ) ) ( not ( = ?auto_75880 ?auto_75881 ) ) ( ON ?auto_75881 ?auto_75883 ) ( not ( = ?auto_75879 ?auto_75883 ) ) ( not ( = ?auto_75880 ?auto_75883 ) ) ( not ( = ?auto_75881 ?auto_75883 ) ) ( ON ?auto_75880 ?auto_75881 ) ( ON-TABLE ?auto_75882 ) ( ON ?auto_75884 ?auto_75882 ) ( ON ?auto_75886 ?auto_75884 ) ( ON ?auto_75885 ?auto_75886 ) ( ON ?auto_75883 ?auto_75885 ) ( not ( = ?auto_75882 ?auto_75884 ) ) ( not ( = ?auto_75882 ?auto_75886 ) ) ( not ( = ?auto_75882 ?auto_75885 ) ) ( not ( = ?auto_75882 ?auto_75883 ) ) ( not ( = ?auto_75882 ?auto_75881 ) ) ( not ( = ?auto_75882 ?auto_75880 ) ) ( not ( = ?auto_75884 ?auto_75886 ) ) ( not ( = ?auto_75884 ?auto_75885 ) ) ( not ( = ?auto_75884 ?auto_75883 ) ) ( not ( = ?auto_75884 ?auto_75881 ) ) ( not ( = ?auto_75884 ?auto_75880 ) ) ( not ( = ?auto_75886 ?auto_75885 ) ) ( not ( = ?auto_75886 ?auto_75883 ) ) ( not ( = ?auto_75886 ?auto_75881 ) ) ( not ( = ?auto_75886 ?auto_75880 ) ) ( not ( = ?auto_75885 ?auto_75883 ) ) ( not ( = ?auto_75885 ?auto_75881 ) ) ( not ( = ?auto_75885 ?auto_75880 ) ) ( not ( = ?auto_75879 ?auto_75882 ) ) ( not ( = ?auto_75879 ?auto_75884 ) ) ( not ( = ?auto_75879 ?auto_75886 ) ) ( not ( = ?auto_75879 ?auto_75885 ) ) ( ON ?auto_75879 ?auto_75880 ) ( CLEAR ?auto_75879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75882 ?auto_75884 ?auto_75886 ?auto_75885 ?auto_75883 ?auto_75881 ?auto_75880 )
      ( MAKE-3PILE ?auto_75879 ?auto_75880 ?auto_75881 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75891 - BLOCK
      ?auto_75892 - BLOCK
      ?auto_75893 - BLOCK
      ?auto_75894 - BLOCK
    )
    :vars
    (
      ?auto_75895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75895 ?auto_75894 ) ( CLEAR ?auto_75895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75891 ) ( ON ?auto_75892 ?auto_75891 ) ( ON ?auto_75893 ?auto_75892 ) ( ON ?auto_75894 ?auto_75893 ) ( not ( = ?auto_75891 ?auto_75892 ) ) ( not ( = ?auto_75891 ?auto_75893 ) ) ( not ( = ?auto_75891 ?auto_75894 ) ) ( not ( = ?auto_75891 ?auto_75895 ) ) ( not ( = ?auto_75892 ?auto_75893 ) ) ( not ( = ?auto_75892 ?auto_75894 ) ) ( not ( = ?auto_75892 ?auto_75895 ) ) ( not ( = ?auto_75893 ?auto_75894 ) ) ( not ( = ?auto_75893 ?auto_75895 ) ) ( not ( = ?auto_75894 ?auto_75895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75895 ?auto_75894 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75896 - BLOCK
      ?auto_75897 - BLOCK
      ?auto_75898 - BLOCK
      ?auto_75899 - BLOCK
    )
    :vars
    (
      ?auto_75900 - BLOCK
      ?auto_75901 - BLOCK
      ?auto_75902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75900 ?auto_75899 ) ( CLEAR ?auto_75900 ) ( ON-TABLE ?auto_75896 ) ( ON ?auto_75897 ?auto_75896 ) ( ON ?auto_75898 ?auto_75897 ) ( ON ?auto_75899 ?auto_75898 ) ( not ( = ?auto_75896 ?auto_75897 ) ) ( not ( = ?auto_75896 ?auto_75898 ) ) ( not ( = ?auto_75896 ?auto_75899 ) ) ( not ( = ?auto_75896 ?auto_75900 ) ) ( not ( = ?auto_75897 ?auto_75898 ) ) ( not ( = ?auto_75897 ?auto_75899 ) ) ( not ( = ?auto_75897 ?auto_75900 ) ) ( not ( = ?auto_75898 ?auto_75899 ) ) ( not ( = ?auto_75898 ?auto_75900 ) ) ( not ( = ?auto_75899 ?auto_75900 ) ) ( HOLDING ?auto_75901 ) ( CLEAR ?auto_75902 ) ( not ( = ?auto_75896 ?auto_75901 ) ) ( not ( = ?auto_75896 ?auto_75902 ) ) ( not ( = ?auto_75897 ?auto_75901 ) ) ( not ( = ?auto_75897 ?auto_75902 ) ) ( not ( = ?auto_75898 ?auto_75901 ) ) ( not ( = ?auto_75898 ?auto_75902 ) ) ( not ( = ?auto_75899 ?auto_75901 ) ) ( not ( = ?auto_75899 ?auto_75902 ) ) ( not ( = ?auto_75900 ?auto_75901 ) ) ( not ( = ?auto_75900 ?auto_75902 ) ) ( not ( = ?auto_75901 ?auto_75902 ) ) )
    :subtasks
    ( ( !STACK ?auto_75901 ?auto_75902 )
      ( MAKE-4PILE ?auto_75896 ?auto_75897 ?auto_75898 ?auto_75899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75903 - BLOCK
      ?auto_75904 - BLOCK
      ?auto_75905 - BLOCK
      ?auto_75906 - BLOCK
    )
    :vars
    (
      ?auto_75907 - BLOCK
      ?auto_75908 - BLOCK
      ?auto_75909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75907 ?auto_75906 ) ( ON-TABLE ?auto_75903 ) ( ON ?auto_75904 ?auto_75903 ) ( ON ?auto_75905 ?auto_75904 ) ( ON ?auto_75906 ?auto_75905 ) ( not ( = ?auto_75903 ?auto_75904 ) ) ( not ( = ?auto_75903 ?auto_75905 ) ) ( not ( = ?auto_75903 ?auto_75906 ) ) ( not ( = ?auto_75903 ?auto_75907 ) ) ( not ( = ?auto_75904 ?auto_75905 ) ) ( not ( = ?auto_75904 ?auto_75906 ) ) ( not ( = ?auto_75904 ?auto_75907 ) ) ( not ( = ?auto_75905 ?auto_75906 ) ) ( not ( = ?auto_75905 ?auto_75907 ) ) ( not ( = ?auto_75906 ?auto_75907 ) ) ( CLEAR ?auto_75908 ) ( not ( = ?auto_75903 ?auto_75909 ) ) ( not ( = ?auto_75903 ?auto_75908 ) ) ( not ( = ?auto_75904 ?auto_75909 ) ) ( not ( = ?auto_75904 ?auto_75908 ) ) ( not ( = ?auto_75905 ?auto_75909 ) ) ( not ( = ?auto_75905 ?auto_75908 ) ) ( not ( = ?auto_75906 ?auto_75909 ) ) ( not ( = ?auto_75906 ?auto_75908 ) ) ( not ( = ?auto_75907 ?auto_75909 ) ) ( not ( = ?auto_75907 ?auto_75908 ) ) ( not ( = ?auto_75909 ?auto_75908 ) ) ( ON ?auto_75909 ?auto_75907 ) ( CLEAR ?auto_75909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75903 ?auto_75904 ?auto_75905 ?auto_75906 ?auto_75907 )
      ( MAKE-4PILE ?auto_75903 ?auto_75904 ?auto_75905 ?auto_75906 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75910 - BLOCK
      ?auto_75911 - BLOCK
      ?auto_75912 - BLOCK
      ?auto_75913 - BLOCK
    )
    :vars
    (
      ?auto_75915 - BLOCK
      ?auto_75914 - BLOCK
      ?auto_75916 - BLOCK
      ?auto_75917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75915 ?auto_75913 ) ( ON-TABLE ?auto_75910 ) ( ON ?auto_75911 ?auto_75910 ) ( ON ?auto_75912 ?auto_75911 ) ( ON ?auto_75913 ?auto_75912 ) ( not ( = ?auto_75910 ?auto_75911 ) ) ( not ( = ?auto_75910 ?auto_75912 ) ) ( not ( = ?auto_75910 ?auto_75913 ) ) ( not ( = ?auto_75910 ?auto_75915 ) ) ( not ( = ?auto_75911 ?auto_75912 ) ) ( not ( = ?auto_75911 ?auto_75913 ) ) ( not ( = ?auto_75911 ?auto_75915 ) ) ( not ( = ?auto_75912 ?auto_75913 ) ) ( not ( = ?auto_75912 ?auto_75915 ) ) ( not ( = ?auto_75913 ?auto_75915 ) ) ( not ( = ?auto_75910 ?auto_75914 ) ) ( not ( = ?auto_75910 ?auto_75916 ) ) ( not ( = ?auto_75911 ?auto_75914 ) ) ( not ( = ?auto_75911 ?auto_75916 ) ) ( not ( = ?auto_75912 ?auto_75914 ) ) ( not ( = ?auto_75912 ?auto_75916 ) ) ( not ( = ?auto_75913 ?auto_75914 ) ) ( not ( = ?auto_75913 ?auto_75916 ) ) ( not ( = ?auto_75915 ?auto_75914 ) ) ( not ( = ?auto_75915 ?auto_75916 ) ) ( not ( = ?auto_75914 ?auto_75916 ) ) ( ON ?auto_75914 ?auto_75915 ) ( CLEAR ?auto_75914 ) ( HOLDING ?auto_75916 ) ( CLEAR ?auto_75917 ) ( ON-TABLE ?auto_75917 ) ( not ( = ?auto_75917 ?auto_75916 ) ) ( not ( = ?auto_75910 ?auto_75917 ) ) ( not ( = ?auto_75911 ?auto_75917 ) ) ( not ( = ?auto_75912 ?auto_75917 ) ) ( not ( = ?auto_75913 ?auto_75917 ) ) ( not ( = ?auto_75915 ?auto_75917 ) ) ( not ( = ?auto_75914 ?auto_75917 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75917 ?auto_75916 )
      ( MAKE-4PILE ?auto_75910 ?auto_75911 ?auto_75912 ?auto_75913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75918 - BLOCK
      ?auto_75919 - BLOCK
      ?auto_75920 - BLOCK
      ?auto_75921 - BLOCK
    )
    :vars
    (
      ?auto_75924 - BLOCK
      ?auto_75923 - BLOCK
      ?auto_75922 - BLOCK
      ?auto_75925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75924 ?auto_75921 ) ( ON-TABLE ?auto_75918 ) ( ON ?auto_75919 ?auto_75918 ) ( ON ?auto_75920 ?auto_75919 ) ( ON ?auto_75921 ?auto_75920 ) ( not ( = ?auto_75918 ?auto_75919 ) ) ( not ( = ?auto_75918 ?auto_75920 ) ) ( not ( = ?auto_75918 ?auto_75921 ) ) ( not ( = ?auto_75918 ?auto_75924 ) ) ( not ( = ?auto_75919 ?auto_75920 ) ) ( not ( = ?auto_75919 ?auto_75921 ) ) ( not ( = ?auto_75919 ?auto_75924 ) ) ( not ( = ?auto_75920 ?auto_75921 ) ) ( not ( = ?auto_75920 ?auto_75924 ) ) ( not ( = ?auto_75921 ?auto_75924 ) ) ( not ( = ?auto_75918 ?auto_75923 ) ) ( not ( = ?auto_75918 ?auto_75922 ) ) ( not ( = ?auto_75919 ?auto_75923 ) ) ( not ( = ?auto_75919 ?auto_75922 ) ) ( not ( = ?auto_75920 ?auto_75923 ) ) ( not ( = ?auto_75920 ?auto_75922 ) ) ( not ( = ?auto_75921 ?auto_75923 ) ) ( not ( = ?auto_75921 ?auto_75922 ) ) ( not ( = ?auto_75924 ?auto_75923 ) ) ( not ( = ?auto_75924 ?auto_75922 ) ) ( not ( = ?auto_75923 ?auto_75922 ) ) ( ON ?auto_75923 ?auto_75924 ) ( CLEAR ?auto_75925 ) ( ON-TABLE ?auto_75925 ) ( not ( = ?auto_75925 ?auto_75922 ) ) ( not ( = ?auto_75918 ?auto_75925 ) ) ( not ( = ?auto_75919 ?auto_75925 ) ) ( not ( = ?auto_75920 ?auto_75925 ) ) ( not ( = ?auto_75921 ?auto_75925 ) ) ( not ( = ?auto_75924 ?auto_75925 ) ) ( not ( = ?auto_75923 ?auto_75925 ) ) ( ON ?auto_75922 ?auto_75923 ) ( CLEAR ?auto_75922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75918 ?auto_75919 ?auto_75920 ?auto_75921 ?auto_75924 ?auto_75923 )
      ( MAKE-4PILE ?auto_75918 ?auto_75919 ?auto_75920 ?auto_75921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75926 - BLOCK
      ?auto_75927 - BLOCK
      ?auto_75928 - BLOCK
      ?auto_75929 - BLOCK
    )
    :vars
    (
      ?auto_75933 - BLOCK
      ?auto_75932 - BLOCK
      ?auto_75930 - BLOCK
      ?auto_75931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75933 ?auto_75929 ) ( ON-TABLE ?auto_75926 ) ( ON ?auto_75927 ?auto_75926 ) ( ON ?auto_75928 ?auto_75927 ) ( ON ?auto_75929 ?auto_75928 ) ( not ( = ?auto_75926 ?auto_75927 ) ) ( not ( = ?auto_75926 ?auto_75928 ) ) ( not ( = ?auto_75926 ?auto_75929 ) ) ( not ( = ?auto_75926 ?auto_75933 ) ) ( not ( = ?auto_75927 ?auto_75928 ) ) ( not ( = ?auto_75927 ?auto_75929 ) ) ( not ( = ?auto_75927 ?auto_75933 ) ) ( not ( = ?auto_75928 ?auto_75929 ) ) ( not ( = ?auto_75928 ?auto_75933 ) ) ( not ( = ?auto_75929 ?auto_75933 ) ) ( not ( = ?auto_75926 ?auto_75932 ) ) ( not ( = ?auto_75926 ?auto_75930 ) ) ( not ( = ?auto_75927 ?auto_75932 ) ) ( not ( = ?auto_75927 ?auto_75930 ) ) ( not ( = ?auto_75928 ?auto_75932 ) ) ( not ( = ?auto_75928 ?auto_75930 ) ) ( not ( = ?auto_75929 ?auto_75932 ) ) ( not ( = ?auto_75929 ?auto_75930 ) ) ( not ( = ?auto_75933 ?auto_75932 ) ) ( not ( = ?auto_75933 ?auto_75930 ) ) ( not ( = ?auto_75932 ?auto_75930 ) ) ( ON ?auto_75932 ?auto_75933 ) ( not ( = ?auto_75931 ?auto_75930 ) ) ( not ( = ?auto_75926 ?auto_75931 ) ) ( not ( = ?auto_75927 ?auto_75931 ) ) ( not ( = ?auto_75928 ?auto_75931 ) ) ( not ( = ?auto_75929 ?auto_75931 ) ) ( not ( = ?auto_75933 ?auto_75931 ) ) ( not ( = ?auto_75932 ?auto_75931 ) ) ( ON ?auto_75930 ?auto_75932 ) ( CLEAR ?auto_75930 ) ( HOLDING ?auto_75931 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75931 )
      ( MAKE-4PILE ?auto_75926 ?auto_75927 ?auto_75928 ?auto_75929 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75934 - BLOCK
      ?auto_75935 - BLOCK
      ?auto_75936 - BLOCK
      ?auto_75937 - BLOCK
    )
    :vars
    (
      ?auto_75940 - BLOCK
      ?auto_75938 - BLOCK
      ?auto_75939 - BLOCK
      ?auto_75941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75940 ?auto_75937 ) ( ON-TABLE ?auto_75934 ) ( ON ?auto_75935 ?auto_75934 ) ( ON ?auto_75936 ?auto_75935 ) ( ON ?auto_75937 ?auto_75936 ) ( not ( = ?auto_75934 ?auto_75935 ) ) ( not ( = ?auto_75934 ?auto_75936 ) ) ( not ( = ?auto_75934 ?auto_75937 ) ) ( not ( = ?auto_75934 ?auto_75940 ) ) ( not ( = ?auto_75935 ?auto_75936 ) ) ( not ( = ?auto_75935 ?auto_75937 ) ) ( not ( = ?auto_75935 ?auto_75940 ) ) ( not ( = ?auto_75936 ?auto_75937 ) ) ( not ( = ?auto_75936 ?auto_75940 ) ) ( not ( = ?auto_75937 ?auto_75940 ) ) ( not ( = ?auto_75934 ?auto_75938 ) ) ( not ( = ?auto_75934 ?auto_75939 ) ) ( not ( = ?auto_75935 ?auto_75938 ) ) ( not ( = ?auto_75935 ?auto_75939 ) ) ( not ( = ?auto_75936 ?auto_75938 ) ) ( not ( = ?auto_75936 ?auto_75939 ) ) ( not ( = ?auto_75937 ?auto_75938 ) ) ( not ( = ?auto_75937 ?auto_75939 ) ) ( not ( = ?auto_75940 ?auto_75938 ) ) ( not ( = ?auto_75940 ?auto_75939 ) ) ( not ( = ?auto_75938 ?auto_75939 ) ) ( ON ?auto_75938 ?auto_75940 ) ( not ( = ?auto_75941 ?auto_75939 ) ) ( not ( = ?auto_75934 ?auto_75941 ) ) ( not ( = ?auto_75935 ?auto_75941 ) ) ( not ( = ?auto_75936 ?auto_75941 ) ) ( not ( = ?auto_75937 ?auto_75941 ) ) ( not ( = ?auto_75940 ?auto_75941 ) ) ( not ( = ?auto_75938 ?auto_75941 ) ) ( ON ?auto_75939 ?auto_75938 ) ( ON ?auto_75941 ?auto_75939 ) ( CLEAR ?auto_75941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75934 ?auto_75935 ?auto_75936 ?auto_75937 ?auto_75940 ?auto_75938 ?auto_75939 )
      ( MAKE-4PILE ?auto_75934 ?auto_75935 ?auto_75936 ?auto_75937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75946 - BLOCK
      ?auto_75947 - BLOCK
      ?auto_75948 - BLOCK
      ?auto_75949 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_75949 ) ( CLEAR ?auto_75948 ) ( ON-TABLE ?auto_75946 ) ( ON ?auto_75947 ?auto_75946 ) ( ON ?auto_75948 ?auto_75947 ) ( not ( = ?auto_75946 ?auto_75947 ) ) ( not ( = ?auto_75946 ?auto_75948 ) ) ( not ( = ?auto_75946 ?auto_75949 ) ) ( not ( = ?auto_75947 ?auto_75948 ) ) ( not ( = ?auto_75947 ?auto_75949 ) ) ( not ( = ?auto_75948 ?auto_75949 ) ) )
    :subtasks
    ( ( !STACK ?auto_75949 ?auto_75948 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75950 - BLOCK
      ?auto_75951 - BLOCK
      ?auto_75952 - BLOCK
      ?auto_75953 - BLOCK
    )
    :vars
    (
      ?auto_75954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_75952 ) ( ON-TABLE ?auto_75950 ) ( ON ?auto_75951 ?auto_75950 ) ( ON ?auto_75952 ?auto_75951 ) ( not ( = ?auto_75950 ?auto_75951 ) ) ( not ( = ?auto_75950 ?auto_75952 ) ) ( not ( = ?auto_75950 ?auto_75953 ) ) ( not ( = ?auto_75951 ?auto_75952 ) ) ( not ( = ?auto_75951 ?auto_75953 ) ) ( not ( = ?auto_75952 ?auto_75953 ) ) ( ON ?auto_75953 ?auto_75954 ) ( CLEAR ?auto_75953 ) ( HAND-EMPTY ) ( not ( = ?auto_75950 ?auto_75954 ) ) ( not ( = ?auto_75951 ?auto_75954 ) ) ( not ( = ?auto_75952 ?auto_75954 ) ) ( not ( = ?auto_75953 ?auto_75954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_75953 ?auto_75954 )
      ( MAKE-4PILE ?auto_75950 ?auto_75951 ?auto_75952 ?auto_75953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75955 - BLOCK
      ?auto_75956 - BLOCK
      ?auto_75957 - BLOCK
      ?auto_75958 - BLOCK
    )
    :vars
    (
      ?auto_75959 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75955 ) ( ON ?auto_75956 ?auto_75955 ) ( not ( = ?auto_75955 ?auto_75956 ) ) ( not ( = ?auto_75955 ?auto_75957 ) ) ( not ( = ?auto_75955 ?auto_75958 ) ) ( not ( = ?auto_75956 ?auto_75957 ) ) ( not ( = ?auto_75956 ?auto_75958 ) ) ( not ( = ?auto_75957 ?auto_75958 ) ) ( ON ?auto_75958 ?auto_75959 ) ( CLEAR ?auto_75958 ) ( not ( = ?auto_75955 ?auto_75959 ) ) ( not ( = ?auto_75956 ?auto_75959 ) ) ( not ( = ?auto_75957 ?auto_75959 ) ) ( not ( = ?auto_75958 ?auto_75959 ) ) ( HOLDING ?auto_75957 ) ( CLEAR ?auto_75956 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75955 ?auto_75956 ?auto_75957 )
      ( MAKE-4PILE ?auto_75955 ?auto_75956 ?auto_75957 ?auto_75958 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75960 - BLOCK
      ?auto_75961 - BLOCK
      ?auto_75962 - BLOCK
      ?auto_75963 - BLOCK
    )
    :vars
    (
      ?auto_75964 - BLOCK
      ?auto_75967 - BLOCK
      ?auto_75966 - BLOCK
      ?auto_75965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75960 ) ( ON ?auto_75961 ?auto_75960 ) ( not ( = ?auto_75960 ?auto_75961 ) ) ( not ( = ?auto_75960 ?auto_75962 ) ) ( not ( = ?auto_75960 ?auto_75963 ) ) ( not ( = ?auto_75961 ?auto_75962 ) ) ( not ( = ?auto_75961 ?auto_75963 ) ) ( not ( = ?auto_75962 ?auto_75963 ) ) ( ON ?auto_75963 ?auto_75964 ) ( not ( = ?auto_75960 ?auto_75964 ) ) ( not ( = ?auto_75961 ?auto_75964 ) ) ( not ( = ?auto_75962 ?auto_75964 ) ) ( not ( = ?auto_75963 ?auto_75964 ) ) ( CLEAR ?auto_75961 ) ( ON ?auto_75962 ?auto_75963 ) ( CLEAR ?auto_75962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_75967 ) ( ON ?auto_75966 ?auto_75967 ) ( ON ?auto_75965 ?auto_75966 ) ( ON ?auto_75964 ?auto_75965 ) ( not ( = ?auto_75967 ?auto_75966 ) ) ( not ( = ?auto_75967 ?auto_75965 ) ) ( not ( = ?auto_75967 ?auto_75964 ) ) ( not ( = ?auto_75967 ?auto_75963 ) ) ( not ( = ?auto_75967 ?auto_75962 ) ) ( not ( = ?auto_75966 ?auto_75965 ) ) ( not ( = ?auto_75966 ?auto_75964 ) ) ( not ( = ?auto_75966 ?auto_75963 ) ) ( not ( = ?auto_75966 ?auto_75962 ) ) ( not ( = ?auto_75965 ?auto_75964 ) ) ( not ( = ?auto_75965 ?auto_75963 ) ) ( not ( = ?auto_75965 ?auto_75962 ) ) ( not ( = ?auto_75960 ?auto_75967 ) ) ( not ( = ?auto_75960 ?auto_75966 ) ) ( not ( = ?auto_75960 ?auto_75965 ) ) ( not ( = ?auto_75961 ?auto_75967 ) ) ( not ( = ?auto_75961 ?auto_75966 ) ) ( not ( = ?auto_75961 ?auto_75965 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_75967 ?auto_75966 ?auto_75965 ?auto_75964 ?auto_75963 )
      ( MAKE-4PILE ?auto_75960 ?auto_75961 ?auto_75962 ?auto_75963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75968 - BLOCK
      ?auto_75969 - BLOCK
      ?auto_75970 - BLOCK
      ?auto_75971 - BLOCK
    )
    :vars
    (
      ?auto_75974 - BLOCK
      ?auto_75972 - BLOCK
      ?auto_75973 - BLOCK
      ?auto_75975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75968 ) ( not ( = ?auto_75968 ?auto_75969 ) ) ( not ( = ?auto_75968 ?auto_75970 ) ) ( not ( = ?auto_75968 ?auto_75971 ) ) ( not ( = ?auto_75969 ?auto_75970 ) ) ( not ( = ?auto_75969 ?auto_75971 ) ) ( not ( = ?auto_75970 ?auto_75971 ) ) ( ON ?auto_75971 ?auto_75974 ) ( not ( = ?auto_75968 ?auto_75974 ) ) ( not ( = ?auto_75969 ?auto_75974 ) ) ( not ( = ?auto_75970 ?auto_75974 ) ) ( not ( = ?auto_75971 ?auto_75974 ) ) ( ON ?auto_75970 ?auto_75971 ) ( CLEAR ?auto_75970 ) ( ON-TABLE ?auto_75972 ) ( ON ?auto_75973 ?auto_75972 ) ( ON ?auto_75975 ?auto_75973 ) ( ON ?auto_75974 ?auto_75975 ) ( not ( = ?auto_75972 ?auto_75973 ) ) ( not ( = ?auto_75972 ?auto_75975 ) ) ( not ( = ?auto_75972 ?auto_75974 ) ) ( not ( = ?auto_75972 ?auto_75971 ) ) ( not ( = ?auto_75972 ?auto_75970 ) ) ( not ( = ?auto_75973 ?auto_75975 ) ) ( not ( = ?auto_75973 ?auto_75974 ) ) ( not ( = ?auto_75973 ?auto_75971 ) ) ( not ( = ?auto_75973 ?auto_75970 ) ) ( not ( = ?auto_75975 ?auto_75974 ) ) ( not ( = ?auto_75975 ?auto_75971 ) ) ( not ( = ?auto_75975 ?auto_75970 ) ) ( not ( = ?auto_75968 ?auto_75972 ) ) ( not ( = ?auto_75968 ?auto_75973 ) ) ( not ( = ?auto_75968 ?auto_75975 ) ) ( not ( = ?auto_75969 ?auto_75972 ) ) ( not ( = ?auto_75969 ?auto_75973 ) ) ( not ( = ?auto_75969 ?auto_75975 ) ) ( HOLDING ?auto_75969 ) ( CLEAR ?auto_75968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75968 ?auto_75969 )
      ( MAKE-4PILE ?auto_75968 ?auto_75969 ?auto_75970 ?auto_75971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75976 - BLOCK
      ?auto_75977 - BLOCK
      ?auto_75978 - BLOCK
      ?auto_75979 - BLOCK
    )
    :vars
    (
      ?auto_75981 - BLOCK
      ?auto_75982 - BLOCK
      ?auto_75980 - BLOCK
      ?auto_75983 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75976 ) ( not ( = ?auto_75976 ?auto_75977 ) ) ( not ( = ?auto_75976 ?auto_75978 ) ) ( not ( = ?auto_75976 ?auto_75979 ) ) ( not ( = ?auto_75977 ?auto_75978 ) ) ( not ( = ?auto_75977 ?auto_75979 ) ) ( not ( = ?auto_75978 ?auto_75979 ) ) ( ON ?auto_75979 ?auto_75981 ) ( not ( = ?auto_75976 ?auto_75981 ) ) ( not ( = ?auto_75977 ?auto_75981 ) ) ( not ( = ?auto_75978 ?auto_75981 ) ) ( not ( = ?auto_75979 ?auto_75981 ) ) ( ON ?auto_75978 ?auto_75979 ) ( ON-TABLE ?auto_75982 ) ( ON ?auto_75980 ?auto_75982 ) ( ON ?auto_75983 ?auto_75980 ) ( ON ?auto_75981 ?auto_75983 ) ( not ( = ?auto_75982 ?auto_75980 ) ) ( not ( = ?auto_75982 ?auto_75983 ) ) ( not ( = ?auto_75982 ?auto_75981 ) ) ( not ( = ?auto_75982 ?auto_75979 ) ) ( not ( = ?auto_75982 ?auto_75978 ) ) ( not ( = ?auto_75980 ?auto_75983 ) ) ( not ( = ?auto_75980 ?auto_75981 ) ) ( not ( = ?auto_75980 ?auto_75979 ) ) ( not ( = ?auto_75980 ?auto_75978 ) ) ( not ( = ?auto_75983 ?auto_75981 ) ) ( not ( = ?auto_75983 ?auto_75979 ) ) ( not ( = ?auto_75983 ?auto_75978 ) ) ( not ( = ?auto_75976 ?auto_75982 ) ) ( not ( = ?auto_75976 ?auto_75980 ) ) ( not ( = ?auto_75976 ?auto_75983 ) ) ( not ( = ?auto_75977 ?auto_75982 ) ) ( not ( = ?auto_75977 ?auto_75980 ) ) ( not ( = ?auto_75977 ?auto_75983 ) ) ( CLEAR ?auto_75976 ) ( ON ?auto_75977 ?auto_75978 ) ( CLEAR ?auto_75977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_75982 ?auto_75980 ?auto_75983 ?auto_75981 ?auto_75979 ?auto_75978 )
      ( MAKE-4PILE ?auto_75976 ?auto_75977 ?auto_75978 ?auto_75979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75984 - BLOCK
      ?auto_75985 - BLOCK
      ?auto_75986 - BLOCK
      ?auto_75987 - BLOCK
    )
    :vars
    (
      ?auto_75991 - BLOCK
      ?auto_75990 - BLOCK
      ?auto_75988 - BLOCK
      ?auto_75989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75984 ?auto_75985 ) ) ( not ( = ?auto_75984 ?auto_75986 ) ) ( not ( = ?auto_75984 ?auto_75987 ) ) ( not ( = ?auto_75985 ?auto_75986 ) ) ( not ( = ?auto_75985 ?auto_75987 ) ) ( not ( = ?auto_75986 ?auto_75987 ) ) ( ON ?auto_75987 ?auto_75991 ) ( not ( = ?auto_75984 ?auto_75991 ) ) ( not ( = ?auto_75985 ?auto_75991 ) ) ( not ( = ?auto_75986 ?auto_75991 ) ) ( not ( = ?auto_75987 ?auto_75991 ) ) ( ON ?auto_75986 ?auto_75987 ) ( ON-TABLE ?auto_75990 ) ( ON ?auto_75988 ?auto_75990 ) ( ON ?auto_75989 ?auto_75988 ) ( ON ?auto_75991 ?auto_75989 ) ( not ( = ?auto_75990 ?auto_75988 ) ) ( not ( = ?auto_75990 ?auto_75989 ) ) ( not ( = ?auto_75990 ?auto_75991 ) ) ( not ( = ?auto_75990 ?auto_75987 ) ) ( not ( = ?auto_75990 ?auto_75986 ) ) ( not ( = ?auto_75988 ?auto_75989 ) ) ( not ( = ?auto_75988 ?auto_75991 ) ) ( not ( = ?auto_75988 ?auto_75987 ) ) ( not ( = ?auto_75988 ?auto_75986 ) ) ( not ( = ?auto_75989 ?auto_75991 ) ) ( not ( = ?auto_75989 ?auto_75987 ) ) ( not ( = ?auto_75989 ?auto_75986 ) ) ( not ( = ?auto_75984 ?auto_75990 ) ) ( not ( = ?auto_75984 ?auto_75988 ) ) ( not ( = ?auto_75984 ?auto_75989 ) ) ( not ( = ?auto_75985 ?auto_75990 ) ) ( not ( = ?auto_75985 ?auto_75988 ) ) ( not ( = ?auto_75985 ?auto_75989 ) ) ( ON ?auto_75985 ?auto_75986 ) ( CLEAR ?auto_75985 ) ( HOLDING ?auto_75984 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75984 )
      ( MAKE-4PILE ?auto_75984 ?auto_75985 ?auto_75986 ?auto_75987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_75992 - BLOCK
      ?auto_75993 - BLOCK
      ?auto_75994 - BLOCK
      ?auto_75995 - BLOCK
    )
    :vars
    (
      ?auto_75999 - BLOCK
      ?auto_75996 - BLOCK
      ?auto_75997 - BLOCK
      ?auto_75998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75992 ?auto_75993 ) ) ( not ( = ?auto_75992 ?auto_75994 ) ) ( not ( = ?auto_75992 ?auto_75995 ) ) ( not ( = ?auto_75993 ?auto_75994 ) ) ( not ( = ?auto_75993 ?auto_75995 ) ) ( not ( = ?auto_75994 ?auto_75995 ) ) ( ON ?auto_75995 ?auto_75999 ) ( not ( = ?auto_75992 ?auto_75999 ) ) ( not ( = ?auto_75993 ?auto_75999 ) ) ( not ( = ?auto_75994 ?auto_75999 ) ) ( not ( = ?auto_75995 ?auto_75999 ) ) ( ON ?auto_75994 ?auto_75995 ) ( ON-TABLE ?auto_75996 ) ( ON ?auto_75997 ?auto_75996 ) ( ON ?auto_75998 ?auto_75997 ) ( ON ?auto_75999 ?auto_75998 ) ( not ( = ?auto_75996 ?auto_75997 ) ) ( not ( = ?auto_75996 ?auto_75998 ) ) ( not ( = ?auto_75996 ?auto_75999 ) ) ( not ( = ?auto_75996 ?auto_75995 ) ) ( not ( = ?auto_75996 ?auto_75994 ) ) ( not ( = ?auto_75997 ?auto_75998 ) ) ( not ( = ?auto_75997 ?auto_75999 ) ) ( not ( = ?auto_75997 ?auto_75995 ) ) ( not ( = ?auto_75997 ?auto_75994 ) ) ( not ( = ?auto_75998 ?auto_75999 ) ) ( not ( = ?auto_75998 ?auto_75995 ) ) ( not ( = ?auto_75998 ?auto_75994 ) ) ( not ( = ?auto_75992 ?auto_75996 ) ) ( not ( = ?auto_75992 ?auto_75997 ) ) ( not ( = ?auto_75992 ?auto_75998 ) ) ( not ( = ?auto_75993 ?auto_75996 ) ) ( not ( = ?auto_75993 ?auto_75997 ) ) ( not ( = ?auto_75993 ?auto_75998 ) ) ( ON ?auto_75993 ?auto_75994 ) ( ON ?auto_75992 ?auto_75993 ) ( CLEAR ?auto_75992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_75996 ?auto_75997 ?auto_75998 ?auto_75999 ?auto_75995 ?auto_75994 ?auto_75993 )
      ( MAKE-4PILE ?auto_75992 ?auto_75993 ?auto_75994 ?auto_75995 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76003 - BLOCK
      ?auto_76004 - BLOCK
      ?auto_76005 - BLOCK
    )
    :vars
    (
      ?auto_76006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76006 ?auto_76005 ) ( CLEAR ?auto_76006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76003 ) ( ON ?auto_76004 ?auto_76003 ) ( ON ?auto_76005 ?auto_76004 ) ( not ( = ?auto_76003 ?auto_76004 ) ) ( not ( = ?auto_76003 ?auto_76005 ) ) ( not ( = ?auto_76003 ?auto_76006 ) ) ( not ( = ?auto_76004 ?auto_76005 ) ) ( not ( = ?auto_76004 ?auto_76006 ) ) ( not ( = ?auto_76005 ?auto_76006 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76006 ?auto_76005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76007 - BLOCK
      ?auto_76008 - BLOCK
      ?auto_76009 - BLOCK
    )
    :vars
    (
      ?auto_76010 - BLOCK
      ?auto_76011 - BLOCK
      ?auto_76012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76010 ?auto_76009 ) ( CLEAR ?auto_76010 ) ( ON-TABLE ?auto_76007 ) ( ON ?auto_76008 ?auto_76007 ) ( ON ?auto_76009 ?auto_76008 ) ( not ( = ?auto_76007 ?auto_76008 ) ) ( not ( = ?auto_76007 ?auto_76009 ) ) ( not ( = ?auto_76007 ?auto_76010 ) ) ( not ( = ?auto_76008 ?auto_76009 ) ) ( not ( = ?auto_76008 ?auto_76010 ) ) ( not ( = ?auto_76009 ?auto_76010 ) ) ( HOLDING ?auto_76011 ) ( CLEAR ?auto_76012 ) ( not ( = ?auto_76007 ?auto_76011 ) ) ( not ( = ?auto_76007 ?auto_76012 ) ) ( not ( = ?auto_76008 ?auto_76011 ) ) ( not ( = ?auto_76008 ?auto_76012 ) ) ( not ( = ?auto_76009 ?auto_76011 ) ) ( not ( = ?auto_76009 ?auto_76012 ) ) ( not ( = ?auto_76010 ?auto_76011 ) ) ( not ( = ?auto_76010 ?auto_76012 ) ) ( not ( = ?auto_76011 ?auto_76012 ) ) )
    :subtasks
    ( ( !STACK ?auto_76011 ?auto_76012 )
      ( MAKE-3PILE ?auto_76007 ?auto_76008 ?auto_76009 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76013 - BLOCK
      ?auto_76014 - BLOCK
      ?auto_76015 - BLOCK
    )
    :vars
    (
      ?auto_76017 - BLOCK
      ?auto_76018 - BLOCK
      ?auto_76016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76017 ?auto_76015 ) ( ON-TABLE ?auto_76013 ) ( ON ?auto_76014 ?auto_76013 ) ( ON ?auto_76015 ?auto_76014 ) ( not ( = ?auto_76013 ?auto_76014 ) ) ( not ( = ?auto_76013 ?auto_76015 ) ) ( not ( = ?auto_76013 ?auto_76017 ) ) ( not ( = ?auto_76014 ?auto_76015 ) ) ( not ( = ?auto_76014 ?auto_76017 ) ) ( not ( = ?auto_76015 ?auto_76017 ) ) ( CLEAR ?auto_76018 ) ( not ( = ?auto_76013 ?auto_76016 ) ) ( not ( = ?auto_76013 ?auto_76018 ) ) ( not ( = ?auto_76014 ?auto_76016 ) ) ( not ( = ?auto_76014 ?auto_76018 ) ) ( not ( = ?auto_76015 ?auto_76016 ) ) ( not ( = ?auto_76015 ?auto_76018 ) ) ( not ( = ?auto_76017 ?auto_76016 ) ) ( not ( = ?auto_76017 ?auto_76018 ) ) ( not ( = ?auto_76016 ?auto_76018 ) ) ( ON ?auto_76016 ?auto_76017 ) ( CLEAR ?auto_76016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76013 ?auto_76014 ?auto_76015 ?auto_76017 )
      ( MAKE-3PILE ?auto_76013 ?auto_76014 ?auto_76015 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76019 - BLOCK
      ?auto_76020 - BLOCK
      ?auto_76021 - BLOCK
    )
    :vars
    (
      ?auto_76022 - BLOCK
      ?auto_76023 - BLOCK
      ?auto_76024 - BLOCK
      ?auto_76025 - BLOCK
      ?auto_76026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76022 ?auto_76021 ) ( ON-TABLE ?auto_76019 ) ( ON ?auto_76020 ?auto_76019 ) ( ON ?auto_76021 ?auto_76020 ) ( not ( = ?auto_76019 ?auto_76020 ) ) ( not ( = ?auto_76019 ?auto_76021 ) ) ( not ( = ?auto_76019 ?auto_76022 ) ) ( not ( = ?auto_76020 ?auto_76021 ) ) ( not ( = ?auto_76020 ?auto_76022 ) ) ( not ( = ?auto_76021 ?auto_76022 ) ) ( not ( = ?auto_76019 ?auto_76023 ) ) ( not ( = ?auto_76019 ?auto_76024 ) ) ( not ( = ?auto_76020 ?auto_76023 ) ) ( not ( = ?auto_76020 ?auto_76024 ) ) ( not ( = ?auto_76021 ?auto_76023 ) ) ( not ( = ?auto_76021 ?auto_76024 ) ) ( not ( = ?auto_76022 ?auto_76023 ) ) ( not ( = ?auto_76022 ?auto_76024 ) ) ( not ( = ?auto_76023 ?auto_76024 ) ) ( ON ?auto_76023 ?auto_76022 ) ( CLEAR ?auto_76023 ) ( HOLDING ?auto_76024 ) ( CLEAR ?auto_76025 ) ( ON-TABLE ?auto_76026 ) ( ON ?auto_76025 ?auto_76026 ) ( not ( = ?auto_76026 ?auto_76025 ) ) ( not ( = ?auto_76026 ?auto_76024 ) ) ( not ( = ?auto_76025 ?auto_76024 ) ) ( not ( = ?auto_76019 ?auto_76025 ) ) ( not ( = ?auto_76019 ?auto_76026 ) ) ( not ( = ?auto_76020 ?auto_76025 ) ) ( not ( = ?auto_76020 ?auto_76026 ) ) ( not ( = ?auto_76021 ?auto_76025 ) ) ( not ( = ?auto_76021 ?auto_76026 ) ) ( not ( = ?auto_76022 ?auto_76025 ) ) ( not ( = ?auto_76022 ?auto_76026 ) ) ( not ( = ?auto_76023 ?auto_76025 ) ) ( not ( = ?auto_76023 ?auto_76026 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76026 ?auto_76025 ?auto_76024 )
      ( MAKE-3PILE ?auto_76019 ?auto_76020 ?auto_76021 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76027 - BLOCK
      ?auto_76028 - BLOCK
      ?auto_76029 - BLOCK
    )
    :vars
    (
      ?auto_76031 - BLOCK
      ?auto_76033 - BLOCK
      ?auto_76030 - BLOCK
      ?auto_76032 - BLOCK
      ?auto_76034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76031 ?auto_76029 ) ( ON-TABLE ?auto_76027 ) ( ON ?auto_76028 ?auto_76027 ) ( ON ?auto_76029 ?auto_76028 ) ( not ( = ?auto_76027 ?auto_76028 ) ) ( not ( = ?auto_76027 ?auto_76029 ) ) ( not ( = ?auto_76027 ?auto_76031 ) ) ( not ( = ?auto_76028 ?auto_76029 ) ) ( not ( = ?auto_76028 ?auto_76031 ) ) ( not ( = ?auto_76029 ?auto_76031 ) ) ( not ( = ?auto_76027 ?auto_76033 ) ) ( not ( = ?auto_76027 ?auto_76030 ) ) ( not ( = ?auto_76028 ?auto_76033 ) ) ( not ( = ?auto_76028 ?auto_76030 ) ) ( not ( = ?auto_76029 ?auto_76033 ) ) ( not ( = ?auto_76029 ?auto_76030 ) ) ( not ( = ?auto_76031 ?auto_76033 ) ) ( not ( = ?auto_76031 ?auto_76030 ) ) ( not ( = ?auto_76033 ?auto_76030 ) ) ( ON ?auto_76033 ?auto_76031 ) ( CLEAR ?auto_76032 ) ( ON-TABLE ?auto_76034 ) ( ON ?auto_76032 ?auto_76034 ) ( not ( = ?auto_76034 ?auto_76032 ) ) ( not ( = ?auto_76034 ?auto_76030 ) ) ( not ( = ?auto_76032 ?auto_76030 ) ) ( not ( = ?auto_76027 ?auto_76032 ) ) ( not ( = ?auto_76027 ?auto_76034 ) ) ( not ( = ?auto_76028 ?auto_76032 ) ) ( not ( = ?auto_76028 ?auto_76034 ) ) ( not ( = ?auto_76029 ?auto_76032 ) ) ( not ( = ?auto_76029 ?auto_76034 ) ) ( not ( = ?auto_76031 ?auto_76032 ) ) ( not ( = ?auto_76031 ?auto_76034 ) ) ( not ( = ?auto_76033 ?auto_76032 ) ) ( not ( = ?auto_76033 ?auto_76034 ) ) ( ON ?auto_76030 ?auto_76033 ) ( CLEAR ?auto_76030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76027 ?auto_76028 ?auto_76029 ?auto_76031 ?auto_76033 )
      ( MAKE-3PILE ?auto_76027 ?auto_76028 ?auto_76029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76035 - BLOCK
      ?auto_76036 - BLOCK
      ?auto_76037 - BLOCK
    )
    :vars
    (
      ?auto_76040 - BLOCK
      ?auto_76038 - BLOCK
      ?auto_76042 - BLOCK
      ?auto_76039 - BLOCK
      ?auto_76041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76040 ?auto_76037 ) ( ON-TABLE ?auto_76035 ) ( ON ?auto_76036 ?auto_76035 ) ( ON ?auto_76037 ?auto_76036 ) ( not ( = ?auto_76035 ?auto_76036 ) ) ( not ( = ?auto_76035 ?auto_76037 ) ) ( not ( = ?auto_76035 ?auto_76040 ) ) ( not ( = ?auto_76036 ?auto_76037 ) ) ( not ( = ?auto_76036 ?auto_76040 ) ) ( not ( = ?auto_76037 ?auto_76040 ) ) ( not ( = ?auto_76035 ?auto_76038 ) ) ( not ( = ?auto_76035 ?auto_76042 ) ) ( not ( = ?auto_76036 ?auto_76038 ) ) ( not ( = ?auto_76036 ?auto_76042 ) ) ( not ( = ?auto_76037 ?auto_76038 ) ) ( not ( = ?auto_76037 ?auto_76042 ) ) ( not ( = ?auto_76040 ?auto_76038 ) ) ( not ( = ?auto_76040 ?auto_76042 ) ) ( not ( = ?auto_76038 ?auto_76042 ) ) ( ON ?auto_76038 ?auto_76040 ) ( ON-TABLE ?auto_76039 ) ( not ( = ?auto_76039 ?auto_76041 ) ) ( not ( = ?auto_76039 ?auto_76042 ) ) ( not ( = ?auto_76041 ?auto_76042 ) ) ( not ( = ?auto_76035 ?auto_76041 ) ) ( not ( = ?auto_76035 ?auto_76039 ) ) ( not ( = ?auto_76036 ?auto_76041 ) ) ( not ( = ?auto_76036 ?auto_76039 ) ) ( not ( = ?auto_76037 ?auto_76041 ) ) ( not ( = ?auto_76037 ?auto_76039 ) ) ( not ( = ?auto_76040 ?auto_76041 ) ) ( not ( = ?auto_76040 ?auto_76039 ) ) ( not ( = ?auto_76038 ?auto_76041 ) ) ( not ( = ?auto_76038 ?auto_76039 ) ) ( ON ?auto_76042 ?auto_76038 ) ( CLEAR ?auto_76042 ) ( HOLDING ?auto_76041 ) ( CLEAR ?auto_76039 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76039 ?auto_76041 )
      ( MAKE-3PILE ?auto_76035 ?auto_76036 ?auto_76037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76043 - BLOCK
      ?auto_76044 - BLOCK
      ?auto_76045 - BLOCK
    )
    :vars
    (
      ?auto_76048 - BLOCK
      ?auto_76050 - BLOCK
      ?auto_76046 - BLOCK
      ?auto_76047 - BLOCK
      ?auto_76049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76048 ?auto_76045 ) ( ON-TABLE ?auto_76043 ) ( ON ?auto_76044 ?auto_76043 ) ( ON ?auto_76045 ?auto_76044 ) ( not ( = ?auto_76043 ?auto_76044 ) ) ( not ( = ?auto_76043 ?auto_76045 ) ) ( not ( = ?auto_76043 ?auto_76048 ) ) ( not ( = ?auto_76044 ?auto_76045 ) ) ( not ( = ?auto_76044 ?auto_76048 ) ) ( not ( = ?auto_76045 ?auto_76048 ) ) ( not ( = ?auto_76043 ?auto_76050 ) ) ( not ( = ?auto_76043 ?auto_76046 ) ) ( not ( = ?auto_76044 ?auto_76050 ) ) ( not ( = ?auto_76044 ?auto_76046 ) ) ( not ( = ?auto_76045 ?auto_76050 ) ) ( not ( = ?auto_76045 ?auto_76046 ) ) ( not ( = ?auto_76048 ?auto_76050 ) ) ( not ( = ?auto_76048 ?auto_76046 ) ) ( not ( = ?auto_76050 ?auto_76046 ) ) ( ON ?auto_76050 ?auto_76048 ) ( ON-TABLE ?auto_76047 ) ( not ( = ?auto_76047 ?auto_76049 ) ) ( not ( = ?auto_76047 ?auto_76046 ) ) ( not ( = ?auto_76049 ?auto_76046 ) ) ( not ( = ?auto_76043 ?auto_76049 ) ) ( not ( = ?auto_76043 ?auto_76047 ) ) ( not ( = ?auto_76044 ?auto_76049 ) ) ( not ( = ?auto_76044 ?auto_76047 ) ) ( not ( = ?auto_76045 ?auto_76049 ) ) ( not ( = ?auto_76045 ?auto_76047 ) ) ( not ( = ?auto_76048 ?auto_76049 ) ) ( not ( = ?auto_76048 ?auto_76047 ) ) ( not ( = ?auto_76050 ?auto_76049 ) ) ( not ( = ?auto_76050 ?auto_76047 ) ) ( ON ?auto_76046 ?auto_76050 ) ( CLEAR ?auto_76047 ) ( ON ?auto_76049 ?auto_76046 ) ( CLEAR ?auto_76049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76043 ?auto_76044 ?auto_76045 ?auto_76048 ?auto_76050 ?auto_76046 )
      ( MAKE-3PILE ?auto_76043 ?auto_76044 ?auto_76045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76051 - BLOCK
      ?auto_76052 - BLOCK
      ?auto_76053 - BLOCK
    )
    :vars
    (
      ?auto_76054 - BLOCK
      ?auto_76058 - BLOCK
      ?auto_76055 - BLOCK
      ?auto_76057 - BLOCK
      ?auto_76056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76054 ?auto_76053 ) ( ON-TABLE ?auto_76051 ) ( ON ?auto_76052 ?auto_76051 ) ( ON ?auto_76053 ?auto_76052 ) ( not ( = ?auto_76051 ?auto_76052 ) ) ( not ( = ?auto_76051 ?auto_76053 ) ) ( not ( = ?auto_76051 ?auto_76054 ) ) ( not ( = ?auto_76052 ?auto_76053 ) ) ( not ( = ?auto_76052 ?auto_76054 ) ) ( not ( = ?auto_76053 ?auto_76054 ) ) ( not ( = ?auto_76051 ?auto_76058 ) ) ( not ( = ?auto_76051 ?auto_76055 ) ) ( not ( = ?auto_76052 ?auto_76058 ) ) ( not ( = ?auto_76052 ?auto_76055 ) ) ( not ( = ?auto_76053 ?auto_76058 ) ) ( not ( = ?auto_76053 ?auto_76055 ) ) ( not ( = ?auto_76054 ?auto_76058 ) ) ( not ( = ?auto_76054 ?auto_76055 ) ) ( not ( = ?auto_76058 ?auto_76055 ) ) ( ON ?auto_76058 ?auto_76054 ) ( not ( = ?auto_76057 ?auto_76056 ) ) ( not ( = ?auto_76057 ?auto_76055 ) ) ( not ( = ?auto_76056 ?auto_76055 ) ) ( not ( = ?auto_76051 ?auto_76056 ) ) ( not ( = ?auto_76051 ?auto_76057 ) ) ( not ( = ?auto_76052 ?auto_76056 ) ) ( not ( = ?auto_76052 ?auto_76057 ) ) ( not ( = ?auto_76053 ?auto_76056 ) ) ( not ( = ?auto_76053 ?auto_76057 ) ) ( not ( = ?auto_76054 ?auto_76056 ) ) ( not ( = ?auto_76054 ?auto_76057 ) ) ( not ( = ?auto_76058 ?auto_76056 ) ) ( not ( = ?auto_76058 ?auto_76057 ) ) ( ON ?auto_76055 ?auto_76058 ) ( ON ?auto_76056 ?auto_76055 ) ( CLEAR ?auto_76056 ) ( HOLDING ?auto_76057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76057 )
      ( MAKE-3PILE ?auto_76051 ?auto_76052 ?auto_76053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_76059 - BLOCK
      ?auto_76060 - BLOCK
      ?auto_76061 - BLOCK
    )
    :vars
    (
      ?auto_76065 - BLOCK
      ?auto_76063 - BLOCK
      ?auto_76064 - BLOCK
      ?auto_76066 - BLOCK
      ?auto_76062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76065 ?auto_76061 ) ( ON-TABLE ?auto_76059 ) ( ON ?auto_76060 ?auto_76059 ) ( ON ?auto_76061 ?auto_76060 ) ( not ( = ?auto_76059 ?auto_76060 ) ) ( not ( = ?auto_76059 ?auto_76061 ) ) ( not ( = ?auto_76059 ?auto_76065 ) ) ( not ( = ?auto_76060 ?auto_76061 ) ) ( not ( = ?auto_76060 ?auto_76065 ) ) ( not ( = ?auto_76061 ?auto_76065 ) ) ( not ( = ?auto_76059 ?auto_76063 ) ) ( not ( = ?auto_76059 ?auto_76064 ) ) ( not ( = ?auto_76060 ?auto_76063 ) ) ( not ( = ?auto_76060 ?auto_76064 ) ) ( not ( = ?auto_76061 ?auto_76063 ) ) ( not ( = ?auto_76061 ?auto_76064 ) ) ( not ( = ?auto_76065 ?auto_76063 ) ) ( not ( = ?auto_76065 ?auto_76064 ) ) ( not ( = ?auto_76063 ?auto_76064 ) ) ( ON ?auto_76063 ?auto_76065 ) ( not ( = ?auto_76066 ?auto_76062 ) ) ( not ( = ?auto_76066 ?auto_76064 ) ) ( not ( = ?auto_76062 ?auto_76064 ) ) ( not ( = ?auto_76059 ?auto_76062 ) ) ( not ( = ?auto_76059 ?auto_76066 ) ) ( not ( = ?auto_76060 ?auto_76062 ) ) ( not ( = ?auto_76060 ?auto_76066 ) ) ( not ( = ?auto_76061 ?auto_76062 ) ) ( not ( = ?auto_76061 ?auto_76066 ) ) ( not ( = ?auto_76065 ?auto_76062 ) ) ( not ( = ?auto_76065 ?auto_76066 ) ) ( not ( = ?auto_76063 ?auto_76062 ) ) ( not ( = ?auto_76063 ?auto_76066 ) ) ( ON ?auto_76064 ?auto_76063 ) ( ON ?auto_76062 ?auto_76064 ) ( ON ?auto_76066 ?auto_76062 ) ( CLEAR ?auto_76066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76059 ?auto_76060 ?auto_76061 ?auto_76065 ?auto_76063 ?auto_76064 ?auto_76062 )
      ( MAKE-3PILE ?auto_76059 ?auto_76060 ?auto_76061 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76072 - BLOCK
      ?auto_76073 - BLOCK
      ?auto_76074 - BLOCK
      ?auto_76075 - BLOCK
      ?auto_76076 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76076 ) ( CLEAR ?auto_76075 ) ( ON-TABLE ?auto_76072 ) ( ON ?auto_76073 ?auto_76072 ) ( ON ?auto_76074 ?auto_76073 ) ( ON ?auto_76075 ?auto_76074 ) ( not ( = ?auto_76072 ?auto_76073 ) ) ( not ( = ?auto_76072 ?auto_76074 ) ) ( not ( = ?auto_76072 ?auto_76075 ) ) ( not ( = ?auto_76072 ?auto_76076 ) ) ( not ( = ?auto_76073 ?auto_76074 ) ) ( not ( = ?auto_76073 ?auto_76075 ) ) ( not ( = ?auto_76073 ?auto_76076 ) ) ( not ( = ?auto_76074 ?auto_76075 ) ) ( not ( = ?auto_76074 ?auto_76076 ) ) ( not ( = ?auto_76075 ?auto_76076 ) ) )
    :subtasks
    ( ( !STACK ?auto_76076 ?auto_76075 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76077 - BLOCK
      ?auto_76078 - BLOCK
      ?auto_76079 - BLOCK
      ?auto_76080 - BLOCK
      ?auto_76081 - BLOCK
    )
    :vars
    (
      ?auto_76082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76080 ) ( ON-TABLE ?auto_76077 ) ( ON ?auto_76078 ?auto_76077 ) ( ON ?auto_76079 ?auto_76078 ) ( ON ?auto_76080 ?auto_76079 ) ( not ( = ?auto_76077 ?auto_76078 ) ) ( not ( = ?auto_76077 ?auto_76079 ) ) ( not ( = ?auto_76077 ?auto_76080 ) ) ( not ( = ?auto_76077 ?auto_76081 ) ) ( not ( = ?auto_76078 ?auto_76079 ) ) ( not ( = ?auto_76078 ?auto_76080 ) ) ( not ( = ?auto_76078 ?auto_76081 ) ) ( not ( = ?auto_76079 ?auto_76080 ) ) ( not ( = ?auto_76079 ?auto_76081 ) ) ( not ( = ?auto_76080 ?auto_76081 ) ) ( ON ?auto_76081 ?auto_76082 ) ( CLEAR ?auto_76081 ) ( HAND-EMPTY ) ( not ( = ?auto_76077 ?auto_76082 ) ) ( not ( = ?auto_76078 ?auto_76082 ) ) ( not ( = ?auto_76079 ?auto_76082 ) ) ( not ( = ?auto_76080 ?auto_76082 ) ) ( not ( = ?auto_76081 ?auto_76082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76081 ?auto_76082 )
      ( MAKE-5PILE ?auto_76077 ?auto_76078 ?auto_76079 ?auto_76080 ?auto_76081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76083 - BLOCK
      ?auto_76084 - BLOCK
      ?auto_76085 - BLOCK
      ?auto_76086 - BLOCK
      ?auto_76087 - BLOCK
    )
    :vars
    (
      ?auto_76088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76083 ) ( ON ?auto_76084 ?auto_76083 ) ( ON ?auto_76085 ?auto_76084 ) ( not ( = ?auto_76083 ?auto_76084 ) ) ( not ( = ?auto_76083 ?auto_76085 ) ) ( not ( = ?auto_76083 ?auto_76086 ) ) ( not ( = ?auto_76083 ?auto_76087 ) ) ( not ( = ?auto_76084 ?auto_76085 ) ) ( not ( = ?auto_76084 ?auto_76086 ) ) ( not ( = ?auto_76084 ?auto_76087 ) ) ( not ( = ?auto_76085 ?auto_76086 ) ) ( not ( = ?auto_76085 ?auto_76087 ) ) ( not ( = ?auto_76086 ?auto_76087 ) ) ( ON ?auto_76087 ?auto_76088 ) ( CLEAR ?auto_76087 ) ( not ( = ?auto_76083 ?auto_76088 ) ) ( not ( = ?auto_76084 ?auto_76088 ) ) ( not ( = ?auto_76085 ?auto_76088 ) ) ( not ( = ?auto_76086 ?auto_76088 ) ) ( not ( = ?auto_76087 ?auto_76088 ) ) ( HOLDING ?auto_76086 ) ( CLEAR ?auto_76085 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76083 ?auto_76084 ?auto_76085 ?auto_76086 )
      ( MAKE-5PILE ?auto_76083 ?auto_76084 ?auto_76085 ?auto_76086 ?auto_76087 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76089 - BLOCK
      ?auto_76090 - BLOCK
      ?auto_76091 - BLOCK
      ?auto_76092 - BLOCK
      ?auto_76093 - BLOCK
    )
    :vars
    (
      ?auto_76094 - BLOCK
      ?auto_76095 - BLOCK
      ?auto_76096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76089 ) ( ON ?auto_76090 ?auto_76089 ) ( ON ?auto_76091 ?auto_76090 ) ( not ( = ?auto_76089 ?auto_76090 ) ) ( not ( = ?auto_76089 ?auto_76091 ) ) ( not ( = ?auto_76089 ?auto_76092 ) ) ( not ( = ?auto_76089 ?auto_76093 ) ) ( not ( = ?auto_76090 ?auto_76091 ) ) ( not ( = ?auto_76090 ?auto_76092 ) ) ( not ( = ?auto_76090 ?auto_76093 ) ) ( not ( = ?auto_76091 ?auto_76092 ) ) ( not ( = ?auto_76091 ?auto_76093 ) ) ( not ( = ?auto_76092 ?auto_76093 ) ) ( ON ?auto_76093 ?auto_76094 ) ( not ( = ?auto_76089 ?auto_76094 ) ) ( not ( = ?auto_76090 ?auto_76094 ) ) ( not ( = ?auto_76091 ?auto_76094 ) ) ( not ( = ?auto_76092 ?auto_76094 ) ) ( not ( = ?auto_76093 ?auto_76094 ) ) ( CLEAR ?auto_76091 ) ( ON ?auto_76092 ?auto_76093 ) ( CLEAR ?auto_76092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76095 ) ( ON ?auto_76096 ?auto_76095 ) ( ON ?auto_76094 ?auto_76096 ) ( not ( = ?auto_76095 ?auto_76096 ) ) ( not ( = ?auto_76095 ?auto_76094 ) ) ( not ( = ?auto_76095 ?auto_76093 ) ) ( not ( = ?auto_76095 ?auto_76092 ) ) ( not ( = ?auto_76096 ?auto_76094 ) ) ( not ( = ?auto_76096 ?auto_76093 ) ) ( not ( = ?auto_76096 ?auto_76092 ) ) ( not ( = ?auto_76089 ?auto_76095 ) ) ( not ( = ?auto_76089 ?auto_76096 ) ) ( not ( = ?auto_76090 ?auto_76095 ) ) ( not ( = ?auto_76090 ?auto_76096 ) ) ( not ( = ?auto_76091 ?auto_76095 ) ) ( not ( = ?auto_76091 ?auto_76096 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76095 ?auto_76096 ?auto_76094 ?auto_76093 )
      ( MAKE-5PILE ?auto_76089 ?auto_76090 ?auto_76091 ?auto_76092 ?auto_76093 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76097 - BLOCK
      ?auto_76098 - BLOCK
      ?auto_76099 - BLOCK
      ?auto_76100 - BLOCK
      ?auto_76101 - BLOCK
    )
    :vars
    (
      ?auto_76103 - BLOCK
      ?auto_76104 - BLOCK
      ?auto_76102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76097 ) ( ON ?auto_76098 ?auto_76097 ) ( not ( = ?auto_76097 ?auto_76098 ) ) ( not ( = ?auto_76097 ?auto_76099 ) ) ( not ( = ?auto_76097 ?auto_76100 ) ) ( not ( = ?auto_76097 ?auto_76101 ) ) ( not ( = ?auto_76098 ?auto_76099 ) ) ( not ( = ?auto_76098 ?auto_76100 ) ) ( not ( = ?auto_76098 ?auto_76101 ) ) ( not ( = ?auto_76099 ?auto_76100 ) ) ( not ( = ?auto_76099 ?auto_76101 ) ) ( not ( = ?auto_76100 ?auto_76101 ) ) ( ON ?auto_76101 ?auto_76103 ) ( not ( = ?auto_76097 ?auto_76103 ) ) ( not ( = ?auto_76098 ?auto_76103 ) ) ( not ( = ?auto_76099 ?auto_76103 ) ) ( not ( = ?auto_76100 ?auto_76103 ) ) ( not ( = ?auto_76101 ?auto_76103 ) ) ( ON ?auto_76100 ?auto_76101 ) ( CLEAR ?auto_76100 ) ( ON-TABLE ?auto_76104 ) ( ON ?auto_76102 ?auto_76104 ) ( ON ?auto_76103 ?auto_76102 ) ( not ( = ?auto_76104 ?auto_76102 ) ) ( not ( = ?auto_76104 ?auto_76103 ) ) ( not ( = ?auto_76104 ?auto_76101 ) ) ( not ( = ?auto_76104 ?auto_76100 ) ) ( not ( = ?auto_76102 ?auto_76103 ) ) ( not ( = ?auto_76102 ?auto_76101 ) ) ( not ( = ?auto_76102 ?auto_76100 ) ) ( not ( = ?auto_76097 ?auto_76104 ) ) ( not ( = ?auto_76097 ?auto_76102 ) ) ( not ( = ?auto_76098 ?auto_76104 ) ) ( not ( = ?auto_76098 ?auto_76102 ) ) ( not ( = ?auto_76099 ?auto_76104 ) ) ( not ( = ?auto_76099 ?auto_76102 ) ) ( HOLDING ?auto_76099 ) ( CLEAR ?auto_76098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76097 ?auto_76098 ?auto_76099 )
      ( MAKE-5PILE ?auto_76097 ?auto_76098 ?auto_76099 ?auto_76100 ?auto_76101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76105 - BLOCK
      ?auto_76106 - BLOCK
      ?auto_76107 - BLOCK
      ?auto_76108 - BLOCK
      ?auto_76109 - BLOCK
    )
    :vars
    (
      ?auto_76112 - BLOCK
      ?auto_76111 - BLOCK
      ?auto_76110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76105 ) ( ON ?auto_76106 ?auto_76105 ) ( not ( = ?auto_76105 ?auto_76106 ) ) ( not ( = ?auto_76105 ?auto_76107 ) ) ( not ( = ?auto_76105 ?auto_76108 ) ) ( not ( = ?auto_76105 ?auto_76109 ) ) ( not ( = ?auto_76106 ?auto_76107 ) ) ( not ( = ?auto_76106 ?auto_76108 ) ) ( not ( = ?auto_76106 ?auto_76109 ) ) ( not ( = ?auto_76107 ?auto_76108 ) ) ( not ( = ?auto_76107 ?auto_76109 ) ) ( not ( = ?auto_76108 ?auto_76109 ) ) ( ON ?auto_76109 ?auto_76112 ) ( not ( = ?auto_76105 ?auto_76112 ) ) ( not ( = ?auto_76106 ?auto_76112 ) ) ( not ( = ?auto_76107 ?auto_76112 ) ) ( not ( = ?auto_76108 ?auto_76112 ) ) ( not ( = ?auto_76109 ?auto_76112 ) ) ( ON ?auto_76108 ?auto_76109 ) ( ON-TABLE ?auto_76111 ) ( ON ?auto_76110 ?auto_76111 ) ( ON ?auto_76112 ?auto_76110 ) ( not ( = ?auto_76111 ?auto_76110 ) ) ( not ( = ?auto_76111 ?auto_76112 ) ) ( not ( = ?auto_76111 ?auto_76109 ) ) ( not ( = ?auto_76111 ?auto_76108 ) ) ( not ( = ?auto_76110 ?auto_76112 ) ) ( not ( = ?auto_76110 ?auto_76109 ) ) ( not ( = ?auto_76110 ?auto_76108 ) ) ( not ( = ?auto_76105 ?auto_76111 ) ) ( not ( = ?auto_76105 ?auto_76110 ) ) ( not ( = ?auto_76106 ?auto_76111 ) ) ( not ( = ?auto_76106 ?auto_76110 ) ) ( not ( = ?auto_76107 ?auto_76111 ) ) ( not ( = ?auto_76107 ?auto_76110 ) ) ( CLEAR ?auto_76106 ) ( ON ?auto_76107 ?auto_76108 ) ( CLEAR ?auto_76107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76111 ?auto_76110 ?auto_76112 ?auto_76109 ?auto_76108 )
      ( MAKE-5PILE ?auto_76105 ?auto_76106 ?auto_76107 ?auto_76108 ?auto_76109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76113 - BLOCK
      ?auto_76114 - BLOCK
      ?auto_76115 - BLOCK
      ?auto_76116 - BLOCK
      ?auto_76117 - BLOCK
    )
    :vars
    (
      ?auto_76118 - BLOCK
      ?auto_76120 - BLOCK
      ?auto_76119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76113 ) ( not ( = ?auto_76113 ?auto_76114 ) ) ( not ( = ?auto_76113 ?auto_76115 ) ) ( not ( = ?auto_76113 ?auto_76116 ) ) ( not ( = ?auto_76113 ?auto_76117 ) ) ( not ( = ?auto_76114 ?auto_76115 ) ) ( not ( = ?auto_76114 ?auto_76116 ) ) ( not ( = ?auto_76114 ?auto_76117 ) ) ( not ( = ?auto_76115 ?auto_76116 ) ) ( not ( = ?auto_76115 ?auto_76117 ) ) ( not ( = ?auto_76116 ?auto_76117 ) ) ( ON ?auto_76117 ?auto_76118 ) ( not ( = ?auto_76113 ?auto_76118 ) ) ( not ( = ?auto_76114 ?auto_76118 ) ) ( not ( = ?auto_76115 ?auto_76118 ) ) ( not ( = ?auto_76116 ?auto_76118 ) ) ( not ( = ?auto_76117 ?auto_76118 ) ) ( ON ?auto_76116 ?auto_76117 ) ( ON-TABLE ?auto_76120 ) ( ON ?auto_76119 ?auto_76120 ) ( ON ?auto_76118 ?auto_76119 ) ( not ( = ?auto_76120 ?auto_76119 ) ) ( not ( = ?auto_76120 ?auto_76118 ) ) ( not ( = ?auto_76120 ?auto_76117 ) ) ( not ( = ?auto_76120 ?auto_76116 ) ) ( not ( = ?auto_76119 ?auto_76118 ) ) ( not ( = ?auto_76119 ?auto_76117 ) ) ( not ( = ?auto_76119 ?auto_76116 ) ) ( not ( = ?auto_76113 ?auto_76120 ) ) ( not ( = ?auto_76113 ?auto_76119 ) ) ( not ( = ?auto_76114 ?auto_76120 ) ) ( not ( = ?auto_76114 ?auto_76119 ) ) ( not ( = ?auto_76115 ?auto_76120 ) ) ( not ( = ?auto_76115 ?auto_76119 ) ) ( ON ?auto_76115 ?auto_76116 ) ( CLEAR ?auto_76115 ) ( HOLDING ?auto_76114 ) ( CLEAR ?auto_76113 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76113 ?auto_76114 )
      ( MAKE-5PILE ?auto_76113 ?auto_76114 ?auto_76115 ?auto_76116 ?auto_76117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76121 - BLOCK
      ?auto_76122 - BLOCK
      ?auto_76123 - BLOCK
      ?auto_76124 - BLOCK
      ?auto_76125 - BLOCK
    )
    :vars
    (
      ?auto_76127 - BLOCK
      ?auto_76128 - BLOCK
      ?auto_76126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76121 ) ( not ( = ?auto_76121 ?auto_76122 ) ) ( not ( = ?auto_76121 ?auto_76123 ) ) ( not ( = ?auto_76121 ?auto_76124 ) ) ( not ( = ?auto_76121 ?auto_76125 ) ) ( not ( = ?auto_76122 ?auto_76123 ) ) ( not ( = ?auto_76122 ?auto_76124 ) ) ( not ( = ?auto_76122 ?auto_76125 ) ) ( not ( = ?auto_76123 ?auto_76124 ) ) ( not ( = ?auto_76123 ?auto_76125 ) ) ( not ( = ?auto_76124 ?auto_76125 ) ) ( ON ?auto_76125 ?auto_76127 ) ( not ( = ?auto_76121 ?auto_76127 ) ) ( not ( = ?auto_76122 ?auto_76127 ) ) ( not ( = ?auto_76123 ?auto_76127 ) ) ( not ( = ?auto_76124 ?auto_76127 ) ) ( not ( = ?auto_76125 ?auto_76127 ) ) ( ON ?auto_76124 ?auto_76125 ) ( ON-TABLE ?auto_76128 ) ( ON ?auto_76126 ?auto_76128 ) ( ON ?auto_76127 ?auto_76126 ) ( not ( = ?auto_76128 ?auto_76126 ) ) ( not ( = ?auto_76128 ?auto_76127 ) ) ( not ( = ?auto_76128 ?auto_76125 ) ) ( not ( = ?auto_76128 ?auto_76124 ) ) ( not ( = ?auto_76126 ?auto_76127 ) ) ( not ( = ?auto_76126 ?auto_76125 ) ) ( not ( = ?auto_76126 ?auto_76124 ) ) ( not ( = ?auto_76121 ?auto_76128 ) ) ( not ( = ?auto_76121 ?auto_76126 ) ) ( not ( = ?auto_76122 ?auto_76128 ) ) ( not ( = ?auto_76122 ?auto_76126 ) ) ( not ( = ?auto_76123 ?auto_76128 ) ) ( not ( = ?auto_76123 ?auto_76126 ) ) ( ON ?auto_76123 ?auto_76124 ) ( CLEAR ?auto_76121 ) ( ON ?auto_76122 ?auto_76123 ) ( CLEAR ?auto_76122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76128 ?auto_76126 ?auto_76127 ?auto_76125 ?auto_76124 ?auto_76123 )
      ( MAKE-5PILE ?auto_76121 ?auto_76122 ?auto_76123 ?auto_76124 ?auto_76125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76129 - BLOCK
      ?auto_76130 - BLOCK
      ?auto_76131 - BLOCK
      ?auto_76132 - BLOCK
      ?auto_76133 - BLOCK
    )
    :vars
    (
      ?auto_76135 - BLOCK
      ?auto_76134 - BLOCK
      ?auto_76136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76129 ?auto_76130 ) ) ( not ( = ?auto_76129 ?auto_76131 ) ) ( not ( = ?auto_76129 ?auto_76132 ) ) ( not ( = ?auto_76129 ?auto_76133 ) ) ( not ( = ?auto_76130 ?auto_76131 ) ) ( not ( = ?auto_76130 ?auto_76132 ) ) ( not ( = ?auto_76130 ?auto_76133 ) ) ( not ( = ?auto_76131 ?auto_76132 ) ) ( not ( = ?auto_76131 ?auto_76133 ) ) ( not ( = ?auto_76132 ?auto_76133 ) ) ( ON ?auto_76133 ?auto_76135 ) ( not ( = ?auto_76129 ?auto_76135 ) ) ( not ( = ?auto_76130 ?auto_76135 ) ) ( not ( = ?auto_76131 ?auto_76135 ) ) ( not ( = ?auto_76132 ?auto_76135 ) ) ( not ( = ?auto_76133 ?auto_76135 ) ) ( ON ?auto_76132 ?auto_76133 ) ( ON-TABLE ?auto_76134 ) ( ON ?auto_76136 ?auto_76134 ) ( ON ?auto_76135 ?auto_76136 ) ( not ( = ?auto_76134 ?auto_76136 ) ) ( not ( = ?auto_76134 ?auto_76135 ) ) ( not ( = ?auto_76134 ?auto_76133 ) ) ( not ( = ?auto_76134 ?auto_76132 ) ) ( not ( = ?auto_76136 ?auto_76135 ) ) ( not ( = ?auto_76136 ?auto_76133 ) ) ( not ( = ?auto_76136 ?auto_76132 ) ) ( not ( = ?auto_76129 ?auto_76134 ) ) ( not ( = ?auto_76129 ?auto_76136 ) ) ( not ( = ?auto_76130 ?auto_76134 ) ) ( not ( = ?auto_76130 ?auto_76136 ) ) ( not ( = ?auto_76131 ?auto_76134 ) ) ( not ( = ?auto_76131 ?auto_76136 ) ) ( ON ?auto_76131 ?auto_76132 ) ( ON ?auto_76130 ?auto_76131 ) ( CLEAR ?auto_76130 ) ( HOLDING ?auto_76129 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76129 )
      ( MAKE-5PILE ?auto_76129 ?auto_76130 ?auto_76131 ?auto_76132 ?auto_76133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76137 - BLOCK
      ?auto_76138 - BLOCK
      ?auto_76139 - BLOCK
      ?auto_76140 - BLOCK
      ?auto_76141 - BLOCK
    )
    :vars
    (
      ?auto_76144 - BLOCK
      ?auto_76142 - BLOCK
      ?auto_76143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76137 ?auto_76138 ) ) ( not ( = ?auto_76137 ?auto_76139 ) ) ( not ( = ?auto_76137 ?auto_76140 ) ) ( not ( = ?auto_76137 ?auto_76141 ) ) ( not ( = ?auto_76138 ?auto_76139 ) ) ( not ( = ?auto_76138 ?auto_76140 ) ) ( not ( = ?auto_76138 ?auto_76141 ) ) ( not ( = ?auto_76139 ?auto_76140 ) ) ( not ( = ?auto_76139 ?auto_76141 ) ) ( not ( = ?auto_76140 ?auto_76141 ) ) ( ON ?auto_76141 ?auto_76144 ) ( not ( = ?auto_76137 ?auto_76144 ) ) ( not ( = ?auto_76138 ?auto_76144 ) ) ( not ( = ?auto_76139 ?auto_76144 ) ) ( not ( = ?auto_76140 ?auto_76144 ) ) ( not ( = ?auto_76141 ?auto_76144 ) ) ( ON ?auto_76140 ?auto_76141 ) ( ON-TABLE ?auto_76142 ) ( ON ?auto_76143 ?auto_76142 ) ( ON ?auto_76144 ?auto_76143 ) ( not ( = ?auto_76142 ?auto_76143 ) ) ( not ( = ?auto_76142 ?auto_76144 ) ) ( not ( = ?auto_76142 ?auto_76141 ) ) ( not ( = ?auto_76142 ?auto_76140 ) ) ( not ( = ?auto_76143 ?auto_76144 ) ) ( not ( = ?auto_76143 ?auto_76141 ) ) ( not ( = ?auto_76143 ?auto_76140 ) ) ( not ( = ?auto_76137 ?auto_76142 ) ) ( not ( = ?auto_76137 ?auto_76143 ) ) ( not ( = ?auto_76138 ?auto_76142 ) ) ( not ( = ?auto_76138 ?auto_76143 ) ) ( not ( = ?auto_76139 ?auto_76142 ) ) ( not ( = ?auto_76139 ?auto_76143 ) ) ( ON ?auto_76139 ?auto_76140 ) ( ON ?auto_76138 ?auto_76139 ) ( ON ?auto_76137 ?auto_76138 ) ( CLEAR ?auto_76137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76142 ?auto_76143 ?auto_76144 ?auto_76141 ?auto_76140 ?auto_76139 ?auto_76138 )
      ( MAKE-5PILE ?auto_76137 ?auto_76138 ?auto_76139 ?auto_76140 ?auto_76141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76147 - BLOCK
      ?auto_76148 - BLOCK
    )
    :vars
    (
      ?auto_76149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76149 ?auto_76148 ) ( CLEAR ?auto_76149 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76147 ) ( ON ?auto_76148 ?auto_76147 ) ( not ( = ?auto_76147 ?auto_76148 ) ) ( not ( = ?auto_76147 ?auto_76149 ) ) ( not ( = ?auto_76148 ?auto_76149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76149 ?auto_76148 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76150 - BLOCK
      ?auto_76151 - BLOCK
    )
    :vars
    (
      ?auto_76152 - BLOCK
      ?auto_76153 - BLOCK
      ?auto_76154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76152 ?auto_76151 ) ( CLEAR ?auto_76152 ) ( ON-TABLE ?auto_76150 ) ( ON ?auto_76151 ?auto_76150 ) ( not ( = ?auto_76150 ?auto_76151 ) ) ( not ( = ?auto_76150 ?auto_76152 ) ) ( not ( = ?auto_76151 ?auto_76152 ) ) ( HOLDING ?auto_76153 ) ( CLEAR ?auto_76154 ) ( not ( = ?auto_76150 ?auto_76153 ) ) ( not ( = ?auto_76150 ?auto_76154 ) ) ( not ( = ?auto_76151 ?auto_76153 ) ) ( not ( = ?auto_76151 ?auto_76154 ) ) ( not ( = ?auto_76152 ?auto_76153 ) ) ( not ( = ?auto_76152 ?auto_76154 ) ) ( not ( = ?auto_76153 ?auto_76154 ) ) )
    :subtasks
    ( ( !STACK ?auto_76153 ?auto_76154 )
      ( MAKE-2PILE ?auto_76150 ?auto_76151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76155 - BLOCK
      ?auto_76156 - BLOCK
    )
    :vars
    (
      ?auto_76157 - BLOCK
      ?auto_76159 - BLOCK
      ?auto_76158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76157 ?auto_76156 ) ( ON-TABLE ?auto_76155 ) ( ON ?auto_76156 ?auto_76155 ) ( not ( = ?auto_76155 ?auto_76156 ) ) ( not ( = ?auto_76155 ?auto_76157 ) ) ( not ( = ?auto_76156 ?auto_76157 ) ) ( CLEAR ?auto_76159 ) ( not ( = ?auto_76155 ?auto_76158 ) ) ( not ( = ?auto_76155 ?auto_76159 ) ) ( not ( = ?auto_76156 ?auto_76158 ) ) ( not ( = ?auto_76156 ?auto_76159 ) ) ( not ( = ?auto_76157 ?auto_76158 ) ) ( not ( = ?auto_76157 ?auto_76159 ) ) ( not ( = ?auto_76158 ?auto_76159 ) ) ( ON ?auto_76158 ?auto_76157 ) ( CLEAR ?auto_76158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76155 ?auto_76156 ?auto_76157 )
      ( MAKE-2PILE ?auto_76155 ?auto_76156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76160 - BLOCK
      ?auto_76161 - BLOCK
    )
    :vars
    (
      ?auto_76164 - BLOCK
      ?auto_76162 - BLOCK
      ?auto_76163 - BLOCK
      ?auto_76165 - BLOCK
      ?auto_76167 - BLOCK
      ?auto_76166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76164 ?auto_76161 ) ( ON-TABLE ?auto_76160 ) ( ON ?auto_76161 ?auto_76160 ) ( not ( = ?auto_76160 ?auto_76161 ) ) ( not ( = ?auto_76160 ?auto_76164 ) ) ( not ( = ?auto_76161 ?auto_76164 ) ) ( not ( = ?auto_76160 ?auto_76162 ) ) ( not ( = ?auto_76160 ?auto_76163 ) ) ( not ( = ?auto_76161 ?auto_76162 ) ) ( not ( = ?auto_76161 ?auto_76163 ) ) ( not ( = ?auto_76164 ?auto_76162 ) ) ( not ( = ?auto_76164 ?auto_76163 ) ) ( not ( = ?auto_76162 ?auto_76163 ) ) ( ON ?auto_76162 ?auto_76164 ) ( CLEAR ?auto_76162 ) ( HOLDING ?auto_76163 ) ( CLEAR ?auto_76165 ) ( ON-TABLE ?auto_76167 ) ( ON ?auto_76166 ?auto_76167 ) ( ON ?auto_76165 ?auto_76166 ) ( not ( = ?auto_76167 ?auto_76166 ) ) ( not ( = ?auto_76167 ?auto_76165 ) ) ( not ( = ?auto_76167 ?auto_76163 ) ) ( not ( = ?auto_76166 ?auto_76165 ) ) ( not ( = ?auto_76166 ?auto_76163 ) ) ( not ( = ?auto_76165 ?auto_76163 ) ) ( not ( = ?auto_76160 ?auto_76165 ) ) ( not ( = ?auto_76160 ?auto_76167 ) ) ( not ( = ?auto_76160 ?auto_76166 ) ) ( not ( = ?auto_76161 ?auto_76165 ) ) ( not ( = ?auto_76161 ?auto_76167 ) ) ( not ( = ?auto_76161 ?auto_76166 ) ) ( not ( = ?auto_76164 ?auto_76165 ) ) ( not ( = ?auto_76164 ?auto_76167 ) ) ( not ( = ?auto_76164 ?auto_76166 ) ) ( not ( = ?auto_76162 ?auto_76165 ) ) ( not ( = ?auto_76162 ?auto_76167 ) ) ( not ( = ?auto_76162 ?auto_76166 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76167 ?auto_76166 ?auto_76165 ?auto_76163 )
      ( MAKE-2PILE ?auto_76160 ?auto_76161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76168 - BLOCK
      ?auto_76169 - BLOCK
    )
    :vars
    (
      ?auto_76173 - BLOCK
      ?auto_76171 - BLOCK
      ?auto_76174 - BLOCK
      ?auto_76172 - BLOCK
      ?auto_76175 - BLOCK
      ?auto_76170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76173 ?auto_76169 ) ( ON-TABLE ?auto_76168 ) ( ON ?auto_76169 ?auto_76168 ) ( not ( = ?auto_76168 ?auto_76169 ) ) ( not ( = ?auto_76168 ?auto_76173 ) ) ( not ( = ?auto_76169 ?auto_76173 ) ) ( not ( = ?auto_76168 ?auto_76171 ) ) ( not ( = ?auto_76168 ?auto_76174 ) ) ( not ( = ?auto_76169 ?auto_76171 ) ) ( not ( = ?auto_76169 ?auto_76174 ) ) ( not ( = ?auto_76173 ?auto_76171 ) ) ( not ( = ?auto_76173 ?auto_76174 ) ) ( not ( = ?auto_76171 ?auto_76174 ) ) ( ON ?auto_76171 ?auto_76173 ) ( CLEAR ?auto_76172 ) ( ON-TABLE ?auto_76175 ) ( ON ?auto_76170 ?auto_76175 ) ( ON ?auto_76172 ?auto_76170 ) ( not ( = ?auto_76175 ?auto_76170 ) ) ( not ( = ?auto_76175 ?auto_76172 ) ) ( not ( = ?auto_76175 ?auto_76174 ) ) ( not ( = ?auto_76170 ?auto_76172 ) ) ( not ( = ?auto_76170 ?auto_76174 ) ) ( not ( = ?auto_76172 ?auto_76174 ) ) ( not ( = ?auto_76168 ?auto_76172 ) ) ( not ( = ?auto_76168 ?auto_76175 ) ) ( not ( = ?auto_76168 ?auto_76170 ) ) ( not ( = ?auto_76169 ?auto_76172 ) ) ( not ( = ?auto_76169 ?auto_76175 ) ) ( not ( = ?auto_76169 ?auto_76170 ) ) ( not ( = ?auto_76173 ?auto_76172 ) ) ( not ( = ?auto_76173 ?auto_76175 ) ) ( not ( = ?auto_76173 ?auto_76170 ) ) ( not ( = ?auto_76171 ?auto_76172 ) ) ( not ( = ?auto_76171 ?auto_76175 ) ) ( not ( = ?auto_76171 ?auto_76170 ) ) ( ON ?auto_76174 ?auto_76171 ) ( CLEAR ?auto_76174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76168 ?auto_76169 ?auto_76173 ?auto_76171 )
      ( MAKE-2PILE ?auto_76168 ?auto_76169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76176 - BLOCK
      ?auto_76177 - BLOCK
    )
    :vars
    (
      ?auto_76178 - BLOCK
      ?auto_76179 - BLOCK
      ?auto_76183 - BLOCK
      ?auto_76182 - BLOCK
      ?auto_76181 - BLOCK
      ?auto_76180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76178 ?auto_76177 ) ( ON-TABLE ?auto_76176 ) ( ON ?auto_76177 ?auto_76176 ) ( not ( = ?auto_76176 ?auto_76177 ) ) ( not ( = ?auto_76176 ?auto_76178 ) ) ( not ( = ?auto_76177 ?auto_76178 ) ) ( not ( = ?auto_76176 ?auto_76179 ) ) ( not ( = ?auto_76176 ?auto_76183 ) ) ( not ( = ?auto_76177 ?auto_76179 ) ) ( not ( = ?auto_76177 ?auto_76183 ) ) ( not ( = ?auto_76178 ?auto_76179 ) ) ( not ( = ?auto_76178 ?auto_76183 ) ) ( not ( = ?auto_76179 ?auto_76183 ) ) ( ON ?auto_76179 ?auto_76178 ) ( ON-TABLE ?auto_76182 ) ( ON ?auto_76181 ?auto_76182 ) ( not ( = ?auto_76182 ?auto_76181 ) ) ( not ( = ?auto_76182 ?auto_76180 ) ) ( not ( = ?auto_76182 ?auto_76183 ) ) ( not ( = ?auto_76181 ?auto_76180 ) ) ( not ( = ?auto_76181 ?auto_76183 ) ) ( not ( = ?auto_76180 ?auto_76183 ) ) ( not ( = ?auto_76176 ?auto_76180 ) ) ( not ( = ?auto_76176 ?auto_76182 ) ) ( not ( = ?auto_76176 ?auto_76181 ) ) ( not ( = ?auto_76177 ?auto_76180 ) ) ( not ( = ?auto_76177 ?auto_76182 ) ) ( not ( = ?auto_76177 ?auto_76181 ) ) ( not ( = ?auto_76178 ?auto_76180 ) ) ( not ( = ?auto_76178 ?auto_76182 ) ) ( not ( = ?auto_76178 ?auto_76181 ) ) ( not ( = ?auto_76179 ?auto_76180 ) ) ( not ( = ?auto_76179 ?auto_76182 ) ) ( not ( = ?auto_76179 ?auto_76181 ) ) ( ON ?auto_76183 ?auto_76179 ) ( CLEAR ?auto_76183 ) ( HOLDING ?auto_76180 ) ( CLEAR ?auto_76181 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76182 ?auto_76181 ?auto_76180 )
      ( MAKE-2PILE ?auto_76176 ?auto_76177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76184 - BLOCK
      ?auto_76185 - BLOCK
    )
    :vars
    (
      ?auto_76188 - BLOCK
      ?auto_76190 - BLOCK
      ?auto_76189 - BLOCK
      ?auto_76186 - BLOCK
      ?auto_76191 - BLOCK
      ?auto_76187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76188 ?auto_76185 ) ( ON-TABLE ?auto_76184 ) ( ON ?auto_76185 ?auto_76184 ) ( not ( = ?auto_76184 ?auto_76185 ) ) ( not ( = ?auto_76184 ?auto_76188 ) ) ( not ( = ?auto_76185 ?auto_76188 ) ) ( not ( = ?auto_76184 ?auto_76190 ) ) ( not ( = ?auto_76184 ?auto_76189 ) ) ( not ( = ?auto_76185 ?auto_76190 ) ) ( not ( = ?auto_76185 ?auto_76189 ) ) ( not ( = ?auto_76188 ?auto_76190 ) ) ( not ( = ?auto_76188 ?auto_76189 ) ) ( not ( = ?auto_76190 ?auto_76189 ) ) ( ON ?auto_76190 ?auto_76188 ) ( ON-TABLE ?auto_76186 ) ( ON ?auto_76191 ?auto_76186 ) ( not ( = ?auto_76186 ?auto_76191 ) ) ( not ( = ?auto_76186 ?auto_76187 ) ) ( not ( = ?auto_76186 ?auto_76189 ) ) ( not ( = ?auto_76191 ?auto_76187 ) ) ( not ( = ?auto_76191 ?auto_76189 ) ) ( not ( = ?auto_76187 ?auto_76189 ) ) ( not ( = ?auto_76184 ?auto_76187 ) ) ( not ( = ?auto_76184 ?auto_76186 ) ) ( not ( = ?auto_76184 ?auto_76191 ) ) ( not ( = ?auto_76185 ?auto_76187 ) ) ( not ( = ?auto_76185 ?auto_76186 ) ) ( not ( = ?auto_76185 ?auto_76191 ) ) ( not ( = ?auto_76188 ?auto_76187 ) ) ( not ( = ?auto_76188 ?auto_76186 ) ) ( not ( = ?auto_76188 ?auto_76191 ) ) ( not ( = ?auto_76190 ?auto_76187 ) ) ( not ( = ?auto_76190 ?auto_76186 ) ) ( not ( = ?auto_76190 ?auto_76191 ) ) ( ON ?auto_76189 ?auto_76190 ) ( CLEAR ?auto_76191 ) ( ON ?auto_76187 ?auto_76189 ) ( CLEAR ?auto_76187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76184 ?auto_76185 ?auto_76188 ?auto_76190 ?auto_76189 )
      ( MAKE-2PILE ?auto_76184 ?auto_76185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76192 - BLOCK
      ?auto_76193 - BLOCK
    )
    :vars
    (
      ?auto_76198 - BLOCK
      ?auto_76196 - BLOCK
      ?auto_76197 - BLOCK
      ?auto_76199 - BLOCK
      ?auto_76194 - BLOCK
      ?auto_76195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76198 ?auto_76193 ) ( ON-TABLE ?auto_76192 ) ( ON ?auto_76193 ?auto_76192 ) ( not ( = ?auto_76192 ?auto_76193 ) ) ( not ( = ?auto_76192 ?auto_76198 ) ) ( not ( = ?auto_76193 ?auto_76198 ) ) ( not ( = ?auto_76192 ?auto_76196 ) ) ( not ( = ?auto_76192 ?auto_76197 ) ) ( not ( = ?auto_76193 ?auto_76196 ) ) ( not ( = ?auto_76193 ?auto_76197 ) ) ( not ( = ?auto_76198 ?auto_76196 ) ) ( not ( = ?auto_76198 ?auto_76197 ) ) ( not ( = ?auto_76196 ?auto_76197 ) ) ( ON ?auto_76196 ?auto_76198 ) ( ON-TABLE ?auto_76199 ) ( not ( = ?auto_76199 ?auto_76194 ) ) ( not ( = ?auto_76199 ?auto_76195 ) ) ( not ( = ?auto_76199 ?auto_76197 ) ) ( not ( = ?auto_76194 ?auto_76195 ) ) ( not ( = ?auto_76194 ?auto_76197 ) ) ( not ( = ?auto_76195 ?auto_76197 ) ) ( not ( = ?auto_76192 ?auto_76195 ) ) ( not ( = ?auto_76192 ?auto_76199 ) ) ( not ( = ?auto_76192 ?auto_76194 ) ) ( not ( = ?auto_76193 ?auto_76195 ) ) ( not ( = ?auto_76193 ?auto_76199 ) ) ( not ( = ?auto_76193 ?auto_76194 ) ) ( not ( = ?auto_76198 ?auto_76195 ) ) ( not ( = ?auto_76198 ?auto_76199 ) ) ( not ( = ?auto_76198 ?auto_76194 ) ) ( not ( = ?auto_76196 ?auto_76195 ) ) ( not ( = ?auto_76196 ?auto_76199 ) ) ( not ( = ?auto_76196 ?auto_76194 ) ) ( ON ?auto_76197 ?auto_76196 ) ( ON ?auto_76195 ?auto_76197 ) ( CLEAR ?auto_76195 ) ( HOLDING ?auto_76194 ) ( CLEAR ?auto_76199 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76199 ?auto_76194 )
      ( MAKE-2PILE ?auto_76192 ?auto_76193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76200 - BLOCK
      ?auto_76201 - BLOCK
    )
    :vars
    (
      ?auto_76204 - BLOCK
      ?auto_76206 - BLOCK
      ?auto_76202 - BLOCK
      ?auto_76203 - BLOCK
      ?auto_76207 - BLOCK
      ?auto_76205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76204 ?auto_76201 ) ( ON-TABLE ?auto_76200 ) ( ON ?auto_76201 ?auto_76200 ) ( not ( = ?auto_76200 ?auto_76201 ) ) ( not ( = ?auto_76200 ?auto_76204 ) ) ( not ( = ?auto_76201 ?auto_76204 ) ) ( not ( = ?auto_76200 ?auto_76206 ) ) ( not ( = ?auto_76200 ?auto_76202 ) ) ( not ( = ?auto_76201 ?auto_76206 ) ) ( not ( = ?auto_76201 ?auto_76202 ) ) ( not ( = ?auto_76204 ?auto_76206 ) ) ( not ( = ?auto_76204 ?auto_76202 ) ) ( not ( = ?auto_76206 ?auto_76202 ) ) ( ON ?auto_76206 ?auto_76204 ) ( ON-TABLE ?auto_76203 ) ( not ( = ?auto_76203 ?auto_76207 ) ) ( not ( = ?auto_76203 ?auto_76205 ) ) ( not ( = ?auto_76203 ?auto_76202 ) ) ( not ( = ?auto_76207 ?auto_76205 ) ) ( not ( = ?auto_76207 ?auto_76202 ) ) ( not ( = ?auto_76205 ?auto_76202 ) ) ( not ( = ?auto_76200 ?auto_76205 ) ) ( not ( = ?auto_76200 ?auto_76203 ) ) ( not ( = ?auto_76200 ?auto_76207 ) ) ( not ( = ?auto_76201 ?auto_76205 ) ) ( not ( = ?auto_76201 ?auto_76203 ) ) ( not ( = ?auto_76201 ?auto_76207 ) ) ( not ( = ?auto_76204 ?auto_76205 ) ) ( not ( = ?auto_76204 ?auto_76203 ) ) ( not ( = ?auto_76204 ?auto_76207 ) ) ( not ( = ?auto_76206 ?auto_76205 ) ) ( not ( = ?auto_76206 ?auto_76203 ) ) ( not ( = ?auto_76206 ?auto_76207 ) ) ( ON ?auto_76202 ?auto_76206 ) ( ON ?auto_76205 ?auto_76202 ) ( CLEAR ?auto_76203 ) ( ON ?auto_76207 ?auto_76205 ) ( CLEAR ?auto_76207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76200 ?auto_76201 ?auto_76204 ?auto_76206 ?auto_76202 ?auto_76205 )
      ( MAKE-2PILE ?auto_76200 ?auto_76201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76208 - BLOCK
      ?auto_76209 - BLOCK
    )
    :vars
    (
      ?auto_76213 - BLOCK
      ?auto_76211 - BLOCK
      ?auto_76212 - BLOCK
      ?auto_76210 - BLOCK
      ?auto_76214 - BLOCK
      ?auto_76215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76213 ?auto_76209 ) ( ON-TABLE ?auto_76208 ) ( ON ?auto_76209 ?auto_76208 ) ( not ( = ?auto_76208 ?auto_76209 ) ) ( not ( = ?auto_76208 ?auto_76213 ) ) ( not ( = ?auto_76209 ?auto_76213 ) ) ( not ( = ?auto_76208 ?auto_76211 ) ) ( not ( = ?auto_76208 ?auto_76212 ) ) ( not ( = ?auto_76209 ?auto_76211 ) ) ( not ( = ?auto_76209 ?auto_76212 ) ) ( not ( = ?auto_76213 ?auto_76211 ) ) ( not ( = ?auto_76213 ?auto_76212 ) ) ( not ( = ?auto_76211 ?auto_76212 ) ) ( ON ?auto_76211 ?auto_76213 ) ( not ( = ?auto_76210 ?auto_76214 ) ) ( not ( = ?auto_76210 ?auto_76215 ) ) ( not ( = ?auto_76210 ?auto_76212 ) ) ( not ( = ?auto_76214 ?auto_76215 ) ) ( not ( = ?auto_76214 ?auto_76212 ) ) ( not ( = ?auto_76215 ?auto_76212 ) ) ( not ( = ?auto_76208 ?auto_76215 ) ) ( not ( = ?auto_76208 ?auto_76210 ) ) ( not ( = ?auto_76208 ?auto_76214 ) ) ( not ( = ?auto_76209 ?auto_76215 ) ) ( not ( = ?auto_76209 ?auto_76210 ) ) ( not ( = ?auto_76209 ?auto_76214 ) ) ( not ( = ?auto_76213 ?auto_76215 ) ) ( not ( = ?auto_76213 ?auto_76210 ) ) ( not ( = ?auto_76213 ?auto_76214 ) ) ( not ( = ?auto_76211 ?auto_76215 ) ) ( not ( = ?auto_76211 ?auto_76210 ) ) ( not ( = ?auto_76211 ?auto_76214 ) ) ( ON ?auto_76212 ?auto_76211 ) ( ON ?auto_76215 ?auto_76212 ) ( ON ?auto_76214 ?auto_76215 ) ( CLEAR ?auto_76214 ) ( HOLDING ?auto_76210 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76210 )
      ( MAKE-2PILE ?auto_76208 ?auto_76209 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76216 - BLOCK
      ?auto_76217 - BLOCK
    )
    :vars
    (
      ?auto_76220 - BLOCK
      ?auto_76222 - BLOCK
      ?auto_76218 - BLOCK
      ?auto_76221 - BLOCK
      ?auto_76223 - BLOCK
      ?auto_76219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76220 ?auto_76217 ) ( ON-TABLE ?auto_76216 ) ( ON ?auto_76217 ?auto_76216 ) ( not ( = ?auto_76216 ?auto_76217 ) ) ( not ( = ?auto_76216 ?auto_76220 ) ) ( not ( = ?auto_76217 ?auto_76220 ) ) ( not ( = ?auto_76216 ?auto_76222 ) ) ( not ( = ?auto_76216 ?auto_76218 ) ) ( not ( = ?auto_76217 ?auto_76222 ) ) ( not ( = ?auto_76217 ?auto_76218 ) ) ( not ( = ?auto_76220 ?auto_76222 ) ) ( not ( = ?auto_76220 ?auto_76218 ) ) ( not ( = ?auto_76222 ?auto_76218 ) ) ( ON ?auto_76222 ?auto_76220 ) ( not ( = ?auto_76221 ?auto_76223 ) ) ( not ( = ?auto_76221 ?auto_76219 ) ) ( not ( = ?auto_76221 ?auto_76218 ) ) ( not ( = ?auto_76223 ?auto_76219 ) ) ( not ( = ?auto_76223 ?auto_76218 ) ) ( not ( = ?auto_76219 ?auto_76218 ) ) ( not ( = ?auto_76216 ?auto_76219 ) ) ( not ( = ?auto_76216 ?auto_76221 ) ) ( not ( = ?auto_76216 ?auto_76223 ) ) ( not ( = ?auto_76217 ?auto_76219 ) ) ( not ( = ?auto_76217 ?auto_76221 ) ) ( not ( = ?auto_76217 ?auto_76223 ) ) ( not ( = ?auto_76220 ?auto_76219 ) ) ( not ( = ?auto_76220 ?auto_76221 ) ) ( not ( = ?auto_76220 ?auto_76223 ) ) ( not ( = ?auto_76222 ?auto_76219 ) ) ( not ( = ?auto_76222 ?auto_76221 ) ) ( not ( = ?auto_76222 ?auto_76223 ) ) ( ON ?auto_76218 ?auto_76222 ) ( ON ?auto_76219 ?auto_76218 ) ( ON ?auto_76223 ?auto_76219 ) ( ON ?auto_76221 ?auto_76223 ) ( CLEAR ?auto_76221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76216 ?auto_76217 ?auto_76220 ?auto_76222 ?auto_76218 ?auto_76219 ?auto_76223 )
      ( MAKE-2PILE ?auto_76216 ?auto_76217 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76230 - BLOCK
      ?auto_76231 - BLOCK
      ?auto_76232 - BLOCK
      ?auto_76233 - BLOCK
      ?auto_76234 - BLOCK
      ?auto_76235 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76235 ) ( CLEAR ?auto_76234 ) ( ON-TABLE ?auto_76230 ) ( ON ?auto_76231 ?auto_76230 ) ( ON ?auto_76232 ?auto_76231 ) ( ON ?auto_76233 ?auto_76232 ) ( ON ?auto_76234 ?auto_76233 ) ( not ( = ?auto_76230 ?auto_76231 ) ) ( not ( = ?auto_76230 ?auto_76232 ) ) ( not ( = ?auto_76230 ?auto_76233 ) ) ( not ( = ?auto_76230 ?auto_76234 ) ) ( not ( = ?auto_76230 ?auto_76235 ) ) ( not ( = ?auto_76231 ?auto_76232 ) ) ( not ( = ?auto_76231 ?auto_76233 ) ) ( not ( = ?auto_76231 ?auto_76234 ) ) ( not ( = ?auto_76231 ?auto_76235 ) ) ( not ( = ?auto_76232 ?auto_76233 ) ) ( not ( = ?auto_76232 ?auto_76234 ) ) ( not ( = ?auto_76232 ?auto_76235 ) ) ( not ( = ?auto_76233 ?auto_76234 ) ) ( not ( = ?auto_76233 ?auto_76235 ) ) ( not ( = ?auto_76234 ?auto_76235 ) ) )
    :subtasks
    ( ( !STACK ?auto_76235 ?auto_76234 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76236 - BLOCK
      ?auto_76237 - BLOCK
      ?auto_76238 - BLOCK
      ?auto_76239 - BLOCK
      ?auto_76240 - BLOCK
      ?auto_76241 - BLOCK
    )
    :vars
    (
      ?auto_76242 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76240 ) ( ON-TABLE ?auto_76236 ) ( ON ?auto_76237 ?auto_76236 ) ( ON ?auto_76238 ?auto_76237 ) ( ON ?auto_76239 ?auto_76238 ) ( ON ?auto_76240 ?auto_76239 ) ( not ( = ?auto_76236 ?auto_76237 ) ) ( not ( = ?auto_76236 ?auto_76238 ) ) ( not ( = ?auto_76236 ?auto_76239 ) ) ( not ( = ?auto_76236 ?auto_76240 ) ) ( not ( = ?auto_76236 ?auto_76241 ) ) ( not ( = ?auto_76237 ?auto_76238 ) ) ( not ( = ?auto_76237 ?auto_76239 ) ) ( not ( = ?auto_76237 ?auto_76240 ) ) ( not ( = ?auto_76237 ?auto_76241 ) ) ( not ( = ?auto_76238 ?auto_76239 ) ) ( not ( = ?auto_76238 ?auto_76240 ) ) ( not ( = ?auto_76238 ?auto_76241 ) ) ( not ( = ?auto_76239 ?auto_76240 ) ) ( not ( = ?auto_76239 ?auto_76241 ) ) ( not ( = ?auto_76240 ?auto_76241 ) ) ( ON ?auto_76241 ?auto_76242 ) ( CLEAR ?auto_76241 ) ( HAND-EMPTY ) ( not ( = ?auto_76236 ?auto_76242 ) ) ( not ( = ?auto_76237 ?auto_76242 ) ) ( not ( = ?auto_76238 ?auto_76242 ) ) ( not ( = ?auto_76239 ?auto_76242 ) ) ( not ( = ?auto_76240 ?auto_76242 ) ) ( not ( = ?auto_76241 ?auto_76242 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76241 ?auto_76242 )
      ( MAKE-6PILE ?auto_76236 ?auto_76237 ?auto_76238 ?auto_76239 ?auto_76240 ?auto_76241 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76243 - BLOCK
      ?auto_76244 - BLOCK
      ?auto_76245 - BLOCK
      ?auto_76246 - BLOCK
      ?auto_76247 - BLOCK
      ?auto_76248 - BLOCK
    )
    :vars
    (
      ?auto_76249 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76243 ) ( ON ?auto_76244 ?auto_76243 ) ( ON ?auto_76245 ?auto_76244 ) ( ON ?auto_76246 ?auto_76245 ) ( not ( = ?auto_76243 ?auto_76244 ) ) ( not ( = ?auto_76243 ?auto_76245 ) ) ( not ( = ?auto_76243 ?auto_76246 ) ) ( not ( = ?auto_76243 ?auto_76247 ) ) ( not ( = ?auto_76243 ?auto_76248 ) ) ( not ( = ?auto_76244 ?auto_76245 ) ) ( not ( = ?auto_76244 ?auto_76246 ) ) ( not ( = ?auto_76244 ?auto_76247 ) ) ( not ( = ?auto_76244 ?auto_76248 ) ) ( not ( = ?auto_76245 ?auto_76246 ) ) ( not ( = ?auto_76245 ?auto_76247 ) ) ( not ( = ?auto_76245 ?auto_76248 ) ) ( not ( = ?auto_76246 ?auto_76247 ) ) ( not ( = ?auto_76246 ?auto_76248 ) ) ( not ( = ?auto_76247 ?auto_76248 ) ) ( ON ?auto_76248 ?auto_76249 ) ( CLEAR ?auto_76248 ) ( not ( = ?auto_76243 ?auto_76249 ) ) ( not ( = ?auto_76244 ?auto_76249 ) ) ( not ( = ?auto_76245 ?auto_76249 ) ) ( not ( = ?auto_76246 ?auto_76249 ) ) ( not ( = ?auto_76247 ?auto_76249 ) ) ( not ( = ?auto_76248 ?auto_76249 ) ) ( HOLDING ?auto_76247 ) ( CLEAR ?auto_76246 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76243 ?auto_76244 ?auto_76245 ?auto_76246 ?auto_76247 )
      ( MAKE-6PILE ?auto_76243 ?auto_76244 ?auto_76245 ?auto_76246 ?auto_76247 ?auto_76248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76250 - BLOCK
      ?auto_76251 - BLOCK
      ?auto_76252 - BLOCK
      ?auto_76253 - BLOCK
      ?auto_76254 - BLOCK
      ?auto_76255 - BLOCK
    )
    :vars
    (
      ?auto_76256 - BLOCK
      ?auto_76257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76250 ) ( ON ?auto_76251 ?auto_76250 ) ( ON ?auto_76252 ?auto_76251 ) ( ON ?auto_76253 ?auto_76252 ) ( not ( = ?auto_76250 ?auto_76251 ) ) ( not ( = ?auto_76250 ?auto_76252 ) ) ( not ( = ?auto_76250 ?auto_76253 ) ) ( not ( = ?auto_76250 ?auto_76254 ) ) ( not ( = ?auto_76250 ?auto_76255 ) ) ( not ( = ?auto_76251 ?auto_76252 ) ) ( not ( = ?auto_76251 ?auto_76253 ) ) ( not ( = ?auto_76251 ?auto_76254 ) ) ( not ( = ?auto_76251 ?auto_76255 ) ) ( not ( = ?auto_76252 ?auto_76253 ) ) ( not ( = ?auto_76252 ?auto_76254 ) ) ( not ( = ?auto_76252 ?auto_76255 ) ) ( not ( = ?auto_76253 ?auto_76254 ) ) ( not ( = ?auto_76253 ?auto_76255 ) ) ( not ( = ?auto_76254 ?auto_76255 ) ) ( ON ?auto_76255 ?auto_76256 ) ( not ( = ?auto_76250 ?auto_76256 ) ) ( not ( = ?auto_76251 ?auto_76256 ) ) ( not ( = ?auto_76252 ?auto_76256 ) ) ( not ( = ?auto_76253 ?auto_76256 ) ) ( not ( = ?auto_76254 ?auto_76256 ) ) ( not ( = ?auto_76255 ?auto_76256 ) ) ( CLEAR ?auto_76253 ) ( ON ?auto_76254 ?auto_76255 ) ( CLEAR ?auto_76254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76257 ) ( ON ?auto_76256 ?auto_76257 ) ( not ( = ?auto_76257 ?auto_76256 ) ) ( not ( = ?auto_76257 ?auto_76255 ) ) ( not ( = ?auto_76257 ?auto_76254 ) ) ( not ( = ?auto_76250 ?auto_76257 ) ) ( not ( = ?auto_76251 ?auto_76257 ) ) ( not ( = ?auto_76252 ?auto_76257 ) ) ( not ( = ?auto_76253 ?auto_76257 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76257 ?auto_76256 ?auto_76255 )
      ( MAKE-6PILE ?auto_76250 ?auto_76251 ?auto_76252 ?auto_76253 ?auto_76254 ?auto_76255 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76258 - BLOCK
      ?auto_76259 - BLOCK
      ?auto_76260 - BLOCK
      ?auto_76261 - BLOCK
      ?auto_76262 - BLOCK
      ?auto_76263 - BLOCK
    )
    :vars
    (
      ?auto_76264 - BLOCK
      ?auto_76265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76258 ) ( ON ?auto_76259 ?auto_76258 ) ( ON ?auto_76260 ?auto_76259 ) ( not ( = ?auto_76258 ?auto_76259 ) ) ( not ( = ?auto_76258 ?auto_76260 ) ) ( not ( = ?auto_76258 ?auto_76261 ) ) ( not ( = ?auto_76258 ?auto_76262 ) ) ( not ( = ?auto_76258 ?auto_76263 ) ) ( not ( = ?auto_76259 ?auto_76260 ) ) ( not ( = ?auto_76259 ?auto_76261 ) ) ( not ( = ?auto_76259 ?auto_76262 ) ) ( not ( = ?auto_76259 ?auto_76263 ) ) ( not ( = ?auto_76260 ?auto_76261 ) ) ( not ( = ?auto_76260 ?auto_76262 ) ) ( not ( = ?auto_76260 ?auto_76263 ) ) ( not ( = ?auto_76261 ?auto_76262 ) ) ( not ( = ?auto_76261 ?auto_76263 ) ) ( not ( = ?auto_76262 ?auto_76263 ) ) ( ON ?auto_76263 ?auto_76264 ) ( not ( = ?auto_76258 ?auto_76264 ) ) ( not ( = ?auto_76259 ?auto_76264 ) ) ( not ( = ?auto_76260 ?auto_76264 ) ) ( not ( = ?auto_76261 ?auto_76264 ) ) ( not ( = ?auto_76262 ?auto_76264 ) ) ( not ( = ?auto_76263 ?auto_76264 ) ) ( ON ?auto_76262 ?auto_76263 ) ( CLEAR ?auto_76262 ) ( ON-TABLE ?auto_76265 ) ( ON ?auto_76264 ?auto_76265 ) ( not ( = ?auto_76265 ?auto_76264 ) ) ( not ( = ?auto_76265 ?auto_76263 ) ) ( not ( = ?auto_76265 ?auto_76262 ) ) ( not ( = ?auto_76258 ?auto_76265 ) ) ( not ( = ?auto_76259 ?auto_76265 ) ) ( not ( = ?auto_76260 ?auto_76265 ) ) ( not ( = ?auto_76261 ?auto_76265 ) ) ( HOLDING ?auto_76261 ) ( CLEAR ?auto_76260 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76258 ?auto_76259 ?auto_76260 ?auto_76261 )
      ( MAKE-6PILE ?auto_76258 ?auto_76259 ?auto_76260 ?auto_76261 ?auto_76262 ?auto_76263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76266 - BLOCK
      ?auto_76267 - BLOCK
      ?auto_76268 - BLOCK
      ?auto_76269 - BLOCK
      ?auto_76270 - BLOCK
      ?auto_76271 - BLOCK
    )
    :vars
    (
      ?auto_76272 - BLOCK
      ?auto_76273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76266 ) ( ON ?auto_76267 ?auto_76266 ) ( ON ?auto_76268 ?auto_76267 ) ( not ( = ?auto_76266 ?auto_76267 ) ) ( not ( = ?auto_76266 ?auto_76268 ) ) ( not ( = ?auto_76266 ?auto_76269 ) ) ( not ( = ?auto_76266 ?auto_76270 ) ) ( not ( = ?auto_76266 ?auto_76271 ) ) ( not ( = ?auto_76267 ?auto_76268 ) ) ( not ( = ?auto_76267 ?auto_76269 ) ) ( not ( = ?auto_76267 ?auto_76270 ) ) ( not ( = ?auto_76267 ?auto_76271 ) ) ( not ( = ?auto_76268 ?auto_76269 ) ) ( not ( = ?auto_76268 ?auto_76270 ) ) ( not ( = ?auto_76268 ?auto_76271 ) ) ( not ( = ?auto_76269 ?auto_76270 ) ) ( not ( = ?auto_76269 ?auto_76271 ) ) ( not ( = ?auto_76270 ?auto_76271 ) ) ( ON ?auto_76271 ?auto_76272 ) ( not ( = ?auto_76266 ?auto_76272 ) ) ( not ( = ?auto_76267 ?auto_76272 ) ) ( not ( = ?auto_76268 ?auto_76272 ) ) ( not ( = ?auto_76269 ?auto_76272 ) ) ( not ( = ?auto_76270 ?auto_76272 ) ) ( not ( = ?auto_76271 ?auto_76272 ) ) ( ON ?auto_76270 ?auto_76271 ) ( ON-TABLE ?auto_76273 ) ( ON ?auto_76272 ?auto_76273 ) ( not ( = ?auto_76273 ?auto_76272 ) ) ( not ( = ?auto_76273 ?auto_76271 ) ) ( not ( = ?auto_76273 ?auto_76270 ) ) ( not ( = ?auto_76266 ?auto_76273 ) ) ( not ( = ?auto_76267 ?auto_76273 ) ) ( not ( = ?auto_76268 ?auto_76273 ) ) ( not ( = ?auto_76269 ?auto_76273 ) ) ( CLEAR ?auto_76268 ) ( ON ?auto_76269 ?auto_76270 ) ( CLEAR ?auto_76269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76273 ?auto_76272 ?auto_76271 ?auto_76270 )
      ( MAKE-6PILE ?auto_76266 ?auto_76267 ?auto_76268 ?auto_76269 ?auto_76270 ?auto_76271 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76274 - BLOCK
      ?auto_76275 - BLOCK
      ?auto_76276 - BLOCK
      ?auto_76277 - BLOCK
      ?auto_76278 - BLOCK
      ?auto_76279 - BLOCK
    )
    :vars
    (
      ?auto_76281 - BLOCK
      ?auto_76280 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76274 ) ( ON ?auto_76275 ?auto_76274 ) ( not ( = ?auto_76274 ?auto_76275 ) ) ( not ( = ?auto_76274 ?auto_76276 ) ) ( not ( = ?auto_76274 ?auto_76277 ) ) ( not ( = ?auto_76274 ?auto_76278 ) ) ( not ( = ?auto_76274 ?auto_76279 ) ) ( not ( = ?auto_76275 ?auto_76276 ) ) ( not ( = ?auto_76275 ?auto_76277 ) ) ( not ( = ?auto_76275 ?auto_76278 ) ) ( not ( = ?auto_76275 ?auto_76279 ) ) ( not ( = ?auto_76276 ?auto_76277 ) ) ( not ( = ?auto_76276 ?auto_76278 ) ) ( not ( = ?auto_76276 ?auto_76279 ) ) ( not ( = ?auto_76277 ?auto_76278 ) ) ( not ( = ?auto_76277 ?auto_76279 ) ) ( not ( = ?auto_76278 ?auto_76279 ) ) ( ON ?auto_76279 ?auto_76281 ) ( not ( = ?auto_76274 ?auto_76281 ) ) ( not ( = ?auto_76275 ?auto_76281 ) ) ( not ( = ?auto_76276 ?auto_76281 ) ) ( not ( = ?auto_76277 ?auto_76281 ) ) ( not ( = ?auto_76278 ?auto_76281 ) ) ( not ( = ?auto_76279 ?auto_76281 ) ) ( ON ?auto_76278 ?auto_76279 ) ( ON-TABLE ?auto_76280 ) ( ON ?auto_76281 ?auto_76280 ) ( not ( = ?auto_76280 ?auto_76281 ) ) ( not ( = ?auto_76280 ?auto_76279 ) ) ( not ( = ?auto_76280 ?auto_76278 ) ) ( not ( = ?auto_76274 ?auto_76280 ) ) ( not ( = ?auto_76275 ?auto_76280 ) ) ( not ( = ?auto_76276 ?auto_76280 ) ) ( not ( = ?auto_76277 ?auto_76280 ) ) ( ON ?auto_76277 ?auto_76278 ) ( CLEAR ?auto_76277 ) ( HOLDING ?auto_76276 ) ( CLEAR ?auto_76275 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76274 ?auto_76275 ?auto_76276 )
      ( MAKE-6PILE ?auto_76274 ?auto_76275 ?auto_76276 ?auto_76277 ?auto_76278 ?auto_76279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76282 - BLOCK
      ?auto_76283 - BLOCK
      ?auto_76284 - BLOCK
      ?auto_76285 - BLOCK
      ?auto_76286 - BLOCK
      ?auto_76287 - BLOCK
    )
    :vars
    (
      ?auto_76289 - BLOCK
      ?auto_76288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76282 ) ( ON ?auto_76283 ?auto_76282 ) ( not ( = ?auto_76282 ?auto_76283 ) ) ( not ( = ?auto_76282 ?auto_76284 ) ) ( not ( = ?auto_76282 ?auto_76285 ) ) ( not ( = ?auto_76282 ?auto_76286 ) ) ( not ( = ?auto_76282 ?auto_76287 ) ) ( not ( = ?auto_76283 ?auto_76284 ) ) ( not ( = ?auto_76283 ?auto_76285 ) ) ( not ( = ?auto_76283 ?auto_76286 ) ) ( not ( = ?auto_76283 ?auto_76287 ) ) ( not ( = ?auto_76284 ?auto_76285 ) ) ( not ( = ?auto_76284 ?auto_76286 ) ) ( not ( = ?auto_76284 ?auto_76287 ) ) ( not ( = ?auto_76285 ?auto_76286 ) ) ( not ( = ?auto_76285 ?auto_76287 ) ) ( not ( = ?auto_76286 ?auto_76287 ) ) ( ON ?auto_76287 ?auto_76289 ) ( not ( = ?auto_76282 ?auto_76289 ) ) ( not ( = ?auto_76283 ?auto_76289 ) ) ( not ( = ?auto_76284 ?auto_76289 ) ) ( not ( = ?auto_76285 ?auto_76289 ) ) ( not ( = ?auto_76286 ?auto_76289 ) ) ( not ( = ?auto_76287 ?auto_76289 ) ) ( ON ?auto_76286 ?auto_76287 ) ( ON-TABLE ?auto_76288 ) ( ON ?auto_76289 ?auto_76288 ) ( not ( = ?auto_76288 ?auto_76289 ) ) ( not ( = ?auto_76288 ?auto_76287 ) ) ( not ( = ?auto_76288 ?auto_76286 ) ) ( not ( = ?auto_76282 ?auto_76288 ) ) ( not ( = ?auto_76283 ?auto_76288 ) ) ( not ( = ?auto_76284 ?auto_76288 ) ) ( not ( = ?auto_76285 ?auto_76288 ) ) ( ON ?auto_76285 ?auto_76286 ) ( CLEAR ?auto_76283 ) ( ON ?auto_76284 ?auto_76285 ) ( CLEAR ?auto_76284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76288 ?auto_76289 ?auto_76287 ?auto_76286 ?auto_76285 )
      ( MAKE-6PILE ?auto_76282 ?auto_76283 ?auto_76284 ?auto_76285 ?auto_76286 ?auto_76287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76290 - BLOCK
      ?auto_76291 - BLOCK
      ?auto_76292 - BLOCK
      ?auto_76293 - BLOCK
      ?auto_76294 - BLOCK
      ?auto_76295 - BLOCK
    )
    :vars
    (
      ?auto_76297 - BLOCK
      ?auto_76296 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76290 ) ( not ( = ?auto_76290 ?auto_76291 ) ) ( not ( = ?auto_76290 ?auto_76292 ) ) ( not ( = ?auto_76290 ?auto_76293 ) ) ( not ( = ?auto_76290 ?auto_76294 ) ) ( not ( = ?auto_76290 ?auto_76295 ) ) ( not ( = ?auto_76291 ?auto_76292 ) ) ( not ( = ?auto_76291 ?auto_76293 ) ) ( not ( = ?auto_76291 ?auto_76294 ) ) ( not ( = ?auto_76291 ?auto_76295 ) ) ( not ( = ?auto_76292 ?auto_76293 ) ) ( not ( = ?auto_76292 ?auto_76294 ) ) ( not ( = ?auto_76292 ?auto_76295 ) ) ( not ( = ?auto_76293 ?auto_76294 ) ) ( not ( = ?auto_76293 ?auto_76295 ) ) ( not ( = ?auto_76294 ?auto_76295 ) ) ( ON ?auto_76295 ?auto_76297 ) ( not ( = ?auto_76290 ?auto_76297 ) ) ( not ( = ?auto_76291 ?auto_76297 ) ) ( not ( = ?auto_76292 ?auto_76297 ) ) ( not ( = ?auto_76293 ?auto_76297 ) ) ( not ( = ?auto_76294 ?auto_76297 ) ) ( not ( = ?auto_76295 ?auto_76297 ) ) ( ON ?auto_76294 ?auto_76295 ) ( ON-TABLE ?auto_76296 ) ( ON ?auto_76297 ?auto_76296 ) ( not ( = ?auto_76296 ?auto_76297 ) ) ( not ( = ?auto_76296 ?auto_76295 ) ) ( not ( = ?auto_76296 ?auto_76294 ) ) ( not ( = ?auto_76290 ?auto_76296 ) ) ( not ( = ?auto_76291 ?auto_76296 ) ) ( not ( = ?auto_76292 ?auto_76296 ) ) ( not ( = ?auto_76293 ?auto_76296 ) ) ( ON ?auto_76293 ?auto_76294 ) ( ON ?auto_76292 ?auto_76293 ) ( CLEAR ?auto_76292 ) ( HOLDING ?auto_76291 ) ( CLEAR ?auto_76290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76290 ?auto_76291 )
      ( MAKE-6PILE ?auto_76290 ?auto_76291 ?auto_76292 ?auto_76293 ?auto_76294 ?auto_76295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76298 - BLOCK
      ?auto_76299 - BLOCK
      ?auto_76300 - BLOCK
      ?auto_76301 - BLOCK
      ?auto_76302 - BLOCK
      ?auto_76303 - BLOCK
    )
    :vars
    (
      ?auto_76305 - BLOCK
      ?auto_76304 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76298 ) ( not ( = ?auto_76298 ?auto_76299 ) ) ( not ( = ?auto_76298 ?auto_76300 ) ) ( not ( = ?auto_76298 ?auto_76301 ) ) ( not ( = ?auto_76298 ?auto_76302 ) ) ( not ( = ?auto_76298 ?auto_76303 ) ) ( not ( = ?auto_76299 ?auto_76300 ) ) ( not ( = ?auto_76299 ?auto_76301 ) ) ( not ( = ?auto_76299 ?auto_76302 ) ) ( not ( = ?auto_76299 ?auto_76303 ) ) ( not ( = ?auto_76300 ?auto_76301 ) ) ( not ( = ?auto_76300 ?auto_76302 ) ) ( not ( = ?auto_76300 ?auto_76303 ) ) ( not ( = ?auto_76301 ?auto_76302 ) ) ( not ( = ?auto_76301 ?auto_76303 ) ) ( not ( = ?auto_76302 ?auto_76303 ) ) ( ON ?auto_76303 ?auto_76305 ) ( not ( = ?auto_76298 ?auto_76305 ) ) ( not ( = ?auto_76299 ?auto_76305 ) ) ( not ( = ?auto_76300 ?auto_76305 ) ) ( not ( = ?auto_76301 ?auto_76305 ) ) ( not ( = ?auto_76302 ?auto_76305 ) ) ( not ( = ?auto_76303 ?auto_76305 ) ) ( ON ?auto_76302 ?auto_76303 ) ( ON-TABLE ?auto_76304 ) ( ON ?auto_76305 ?auto_76304 ) ( not ( = ?auto_76304 ?auto_76305 ) ) ( not ( = ?auto_76304 ?auto_76303 ) ) ( not ( = ?auto_76304 ?auto_76302 ) ) ( not ( = ?auto_76298 ?auto_76304 ) ) ( not ( = ?auto_76299 ?auto_76304 ) ) ( not ( = ?auto_76300 ?auto_76304 ) ) ( not ( = ?auto_76301 ?auto_76304 ) ) ( ON ?auto_76301 ?auto_76302 ) ( ON ?auto_76300 ?auto_76301 ) ( CLEAR ?auto_76298 ) ( ON ?auto_76299 ?auto_76300 ) ( CLEAR ?auto_76299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76304 ?auto_76305 ?auto_76303 ?auto_76302 ?auto_76301 ?auto_76300 )
      ( MAKE-6PILE ?auto_76298 ?auto_76299 ?auto_76300 ?auto_76301 ?auto_76302 ?auto_76303 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76306 - BLOCK
      ?auto_76307 - BLOCK
      ?auto_76308 - BLOCK
      ?auto_76309 - BLOCK
      ?auto_76310 - BLOCK
      ?auto_76311 - BLOCK
    )
    :vars
    (
      ?auto_76313 - BLOCK
      ?auto_76312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76306 ?auto_76307 ) ) ( not ( = ?auto_76306 ?auto_76308 ) ) ( not ( = ?auto_76306 ?auto_76309 ) ) ( not ( = ?auto_76306 ?auto_76310 ) ) ( not ( = ?auto_76306 ?auto_76311 ) ) ( not ( = ?auto_76307 ?auto_76308 ) ) ( not ( = ?auto_76307 ?auto_76309 ) ) ( not ( = ?auto_76307 ?auto_76310 ) ) ( not ( = ?auto_76307 ?auto_76311 ) ) ( not ( = ?auto_76308 ?auto_76309 ) ) ( not ( = ?auto_76308 ?auto_76310 ) ) ( not ( = ?auto_76308 ?auto_76311 ) ) ( not ( = ?auto_76309 ?auto_76310 ) ) ( not ( = ?auto_76309 ?auto_76311 ) ) ( not ( = ?auto_76310 ?auto_76311 ) ) ( ON ?auto_76311 ?auto_76313 ) ( not ( = ?auto_76306 ?auto_76313 ) ) ( not ( = ?auto_76307 ?auto_76313 ) ) ( not ( = ?auto_76308 ?auto_76313 ) ) ( not ( = ?auto_76309 ?auto_76313 ) ) ( not ( = ?auto_76310 ?auto_76313 ) ) ( not ( = ?auto_76311 ?auto_76313 ) ) ( ON ?auto_76310 ?auto_76311 ) ( ON-TABLE ?auto_76312 ) ( ON ?auto_76313 ?auto_76312 ) ( not ( = ?auto_76312 ?auto_76313 ) ) ( not ( = ?auto_76312 ?auto_76311 ) ) ( not ( = ?auto_76312 ?auto_76310 ) ) ( not ( = ?auto_76306 ?auto_76312 ) ) ( not ( = ?auto_76307 ?auto_76312 ) ) ( not ( = ?auto_76308 ?auto_76312 ) ) ( not ( = ?auto_76309 ?auto_76312 ) ) ( ON ?auto_76309 ?auto_76310 ) ( ON ?auto_76308 ?auto_76309 ) ( ON ?auto_76307 ?auto_76308 ) ( CLEAR ?auto_76307 ) ( HOLDING ?auto_76306 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76306 )
      ( MAKE-6PILE ?auto_76306 ?auto_76307 ?auto_76308 ?auto_76309 ?auto_76310 ?auto_76311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76314 - BLOCK
      ?auto_76315 - BLOCK
      ?auto_76316 - BLOCK
      ?auto_76317 - BLOCK
      ?auto_76318 - BLOCK
      ?auto_76319 - BLOCK
    )
    :vars
    (
      ?auto_76320 - BLOCK
      ?auto_76321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76314 ?auto_76315 ) ) ( not ( = ?auto_76314 ?auto_76316 ) ) ( not ( = ?auto_76314 ?auto_76317 ) ) ( not ( = ?auto_76314 ?auto_76318 ) ) ( not ( = ?auto_76314 ?auto_76319 ) ) ( not ( = ?auto_76315 ?auto_76316 ) ) ( not ( = ?auto_76315 ?auto_76317 ) ) ( not ( = ?auto_76315 ?auto_76318 ) ) ( not ( = ?auto_76315 ?auto_76319 ) ) ( not ( = ?auto_76316 ?auto_76317 ) ) ( not ( = ?auto_76316 ?auto_76318 ) ) ( not ( = ?auto_76316 ?auto_76319 ) ) ( not ( = ?auto_76317 ?auto_76318 ) ) ( not ( = ?auto_76317 ?auto_76319 ) ) ( not ( = ?auto_76318 ?auto_76319 ) ) ( ON ?auto_76319 ?auto_76320 ) ( not ( = ?auto_76314 ?auto_76320 ) ) ( not ( = ?auto_76315 ?auto_76320 ) ) ( not ( = ?auto_76316 ?auto_76320 ) ) ( not ( = ?auto_76317 ?auto_76320 ) ) ( not ( = ?auto_76318 ?auto_76320 ) ) ( not ( = ?auto_76319 ?auto_76320 ) ) ( ON ?auto_76318 ?auto_76319 ) ( ON-TABLE ?auto_76321 ) ( ON ?auto_76320 ?auto_76321 ) ( not ( = ?auto_76321 ?auto_76320 ) ) ( not ( = ?auto_76321 ?auto_76319 ) ) ( not ( = ?auto_76321 ?auto_76318 ) ) ( not ( = ?auto_76314 ?auto_76321 ) ) ( not ( = ?auto_76315 ?auto_76321 ) ) ( not ( = ?auto_76316 ?auto_76321 ) ) ( not ( = ?auto_76317 ?auto_76321 ) ) ( ON ?auto_76317 ?auto_76318 ) ( ON ?auto_76316 ?auto_76317 ) ( ON ?auto_76315 ?auto_76316 ) ( ON ?auto_76314 ?auto_76315 ) ( CLEAR ?auto_76314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76321 ?auto_76320 ?auto_76319 ?auto_76318 ?auto_76317 ?auto_76316 ?auto_76315 )
      ( MAKE-6PILE ?auto_76314 ?auto_76315 ?auto_76316 ?auto_76317 ?auto_76318 ?auto_76319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76323 - BLOCK
    )
    :vars
    (
      ?auto_76324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76324 ?auto_76323 ) ( CLEAR ?auto_76324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76323 ) ( not ( = ?auto_76323 ?auto_76324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76324 ?auto_76323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76325 - BLOCK
    )
    :vars
    (
      ?auto_76326 - BLOCK
      ?auto_76327 - BLOCK
      ?auto_76328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76326 ?auto_76325 ) ( CLEAR ?auto_76326 ) ( ON-TABLE ?auto_76325 ) ( not ( = ?auto_76325 ?auto_76326 ) ) ( HOLDING ?auto_76327 ) ( CLEAR ?auto_76328 ) ( not ( = ?auto_76325 ?auto_76327 ) ) ( not ( = ?auto_76325 ?auto_76328 ) ) ( not ( = ?auto_76326 ?auto_76327 ) ) ( not ( = ?auto_76326 ?auto_76328 ) ) ( not ( = ?auto_76327 ?auto_76328 ) ) )
    :subtasks
    ( ( !STACK ?auto_76327 ?auto_76328 )
      ( MAKE-1PILE ?auto_76325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76329 - BLOCK
    )
    :vars
    (
      ?auto_76331 - BLOCK
      ?auto_76332 - BLOCK
      ?auto_76330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76331 ?auto_76329 ) ( ON-TABLE ?auto_76329 ) ( not ( = ?auto_76329 ?auto_76331 ) ) ( CLEAR ?auto_76332 ) ( not ( = ?auto_76329 ?auto_76330 ) ) ( not ( = ?auto_76329 ?auto_76332 ) ) ( not ( = ?auto_76331 ?auto_76330 ) ) ( not ( = ?auto_76331 ?auto_76332 ) ) ( not ( = ?auto_76330 ?auto_76332 ) ) ( ON ?auto_76330 ?auto_76331 ) ( CLEAR ?auto_76330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76329 ?auto_76331 )
      ( MAKE-1PILE ?auto_76329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76333 - BLOCK
    )
    :vars
    (
      ?auto_76335 - BLOCK
      ?auto_76336 - BLOCK
      ?auto_76334 - BLOCK
      ?auto_76339 - BLOCK
      ?auto_76337 - BLOCK
      ?auto_76340 - BLOCK
      ?auto_76338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76335 ?auto_76333 ) ( ON-TABLE ?auto_76333 ) ( not ( = ?auto_76333 ?auto_76335 ) ) ( not ( = ?auto_76333 ?auto_76336 ) ) ( not ( = ?auto_76333 ?auto_76334 ) ) ( not ( = ?auto_76335 ?auto_76336 ) ) ( not ( = ?auto_76335 ?auto_76334 ) ) ( not ( = ?auto_76336 ?auto_76334 ) ) ( ON ?auto_76336 ?auto_76335 ) ( CLEAR ?auto_76336 ) ( HOLDING ?auto_76334 ) ( CLEAR ?auto_76339 ) ( ON-TABLE ?auto_76337 ) ( ON ?auto_76340 ?auto_76337 ) ( ON ?auto_76338 ?auto_76340 ) ( ON ?auto_76339 ?auto_76338 ) ( not ( = ?auto_76337 ?auto_76340 ) ) ( not ( = ?auto_76337 ?auto_76338 ) ) ( not ( = ?auto_76337 ?auto_76339 ) ) ( not ( = ?auto_76337 ?auto_76334 ) ) ( not ( = ?auto_76340 ?auto_76338 ) ) ( not ( = ?auto_76340 ?auto_76339 ) ) ( not ( = ?auto_76340 ?auto_76334 ) ) ( not ( = ?auto_76338 ?auto_76339 ) ) ( not ( = ?auto_76338 ?auto_76334 ) ) ( not ( = ?auto_76339 ?auto_76334 ) ) ( not ( = ?auto_76333 ?auto_76339 ) ) ( not ( = ?auto_76333 ?auto_76337 ) ) ( not ( = ?auto_76333 ?auto_76340 ) ) ( not ( = ?auto_76333 ?auto_76338 ) ) ( not ( = ?auto_76335 ?auto_76339 ) ) ( not ( = ?auto_76335 ?auto_76337 ) ) ( not ( = ?auto_76335 ?auto_76340 ) ) ( not ( = ?auto_76335 ?auto_76338 ) ) ( not ( = ?auto_76336 ?auto_76339 ) ) ( not ( = ?auto_76336 ?auto_76337 ) ) ( not ( = ?auto_76336 ?auto_76340 ) ) ( not ( = ?auto_76336 ?auto_76338 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76337 ?auto_76340 ?auto_76338 ?auto_76339 ?auto_76334 )
      ( MAKE-1PILE ?auto_76333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76341 - BLOCK
    )
    :vars
    (
      ?auto_76346 - BLOCK
      ?auto_76342 - BLOCK
      ?auto_76345 - BLOCK
      ?auto_76344 - BLOCK
      ?auto_76347 - BLOCK
      ?auto_76343 - BLOCK
      ?auto_76348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76346 ?auto_76341 ) ( ON-TABLE ?auto_76341 ) ( not ( = ?auto_76341 ?auto_76346 ) ) ( not ( = ?auto_76341 ?auto_76342 ) ) ( not ( = ?auto_76341 ?auto_76345 ) ) ( not ( = ?auto_76346 ?auto_76342 ) ) ( not ( = ?auto_76346 ?auto_76345 ) ) ( not ( = ?auto_76342 ?auto_76345 ) ) ( ON ?auto_76342 ?auto_76346 ) ( CLEAR ?auto_76344 ) ( ON-TABLE ?auto_76347 ) ( ON ?auto_76343 ?auto_76347 ) ( ON ?auto_76348 ?auto_76343 ) ( ON ?auto_76344 ?auto_76348 ) ( not ( = ?auto_76347 ?auto_76343 ) ) ( not ( = ?auto_76347 ?auto_76348 ) ) ( not ( = ?auto_76347 ?auto_76344 ) ) ( not ( = ?auto_76347 ?auto_76345 ) ) ( not ( = ?auto_76343 ?auto_76348 ) ) ( not ( = ?auto_76343 ?auto_76344 ) ) ( not ( = ?auto_76343 ?auto_76345 ) ) ( not ( = ?auto_76348 ?auto_76344 ) ) ( not ( = ?auto_76348 ?auto_76345 ) ) ( not ( = ?auto_76344 ?auto_76345 ) ) ( not ( = ?auto_76341 ?auto_76344 ) ) ( not ( = ?auto_76341 ?auto_76347 ) ) ( not ( = ?auto_76341 ?auto_76343 ) ) ( not ( = ?auto_76341 ?auto_76348 ) ) ( not ( = ?auto_76346 ?auto_76344 ) ) ( not ( = ?auto_76346 ?auto_76347 ) ) ( not ( = ?auto_76346 ?auto_76343 ) ) ( not ( = ?auto_76346 ?auto_76348 ) ) ( not ( = ?auto_76342 ?auto_76344 ) ) ( not ( = ?auto_76342 ?auto_76347 ) ) ( not ( = ?auto_76342 ?auto_76343 ) ) ( not ( = ?auto_76342 ?auto_76348 ) ) ( ON ?auto_76345 ?auto_76342 ) ( CLEAR ?auto_76345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76341 ?auto_76346 ?auto_76342 )
      ( MAKE-1PILE ?auto_76341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76349 - BLOCK
    )
    :vars
    (
      ?auto_76350 - BLOCK
      ?auto_76351 - BLOCK
      ?auto_76355 - BLOCK
      ?auto_76354 - BLOCK
      ?auto_76356 - BLOCK
      ?auto_76352 - BLOCK
      ?auto_76353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76350 ?auto_76349 ) ( ON-TABLE ?auto_76349 ) ( not ( = ?auto_76349 ?auto_76350 ) ) ( not ( = ?auto_76349 ?auto_76351 ) ) ( not ( = ?auto_76349 ?auto_76355 ) ) ( not ( = ?auto_76350 ?auto_76351 ) ) ( not ( = ?auto_76350 ?auto_76355 ) ) ( not ( = ?auto_76351 ?auto_76355 ) ) ( ON ?auto_76351 ?auto_76350 ) ( ON-TABLE ?auto_76354 ) ( ON ?auto_76356 ?auto_76354 ) ( ON ?auto_76352 ?auto_76356 ) ( not ( = ?auto_76354 ?auto_76356 ) ) ( not ( = ?auto_76354 ?auto_76352 ) ) ( not ( = ?auto_76354 ?auto_76353 ) ) ( not ( = ?auto_76354 ?auto_76355 ) ) ( not ( = ?auto_76356 ?auto_76352 ) ) ( not ( = ?auto_76356 ?auto_76353 ) ) ( not ( = ?auto_76356 ?auto_76355 ) ) ( not ( = ?auto_76352 ?auto_76353 ) ) ( not ( = ?auto_76352 ?auto_76355 ) ) ( not ( = ?auto_76353 ?auto_76355 ) ) ( not ( = ?auto_76349 ?auto_76353 ) ) ( not ( = ?auto_76349 ?auto_76354 ) ) ( not ( = ?auto_76349 ?auto_76356 ) ) ( not ( = ?auto_76349 ?auto_76352 ) ) ( not ( = ?auto_76350 ?auto_76353 ) ) ( not ( = ?auto_76350 ?auto_76354 ) ) ( not ( = ?auto_76350 ?auto_76356 ) ) ( not ( = ?auto_76350 ?auto_76352 ) ) ( not ( = ?auto_76351 ?auto_76353 ) ) ( not ( = ?auto_76351 ?auto_76354 ) ) ( not ( = ?auto_76351 ?auto_76356 ) ) ( not ( = ?auto_76351 ?auto_76352 ) ) ( ON ?auto_76355 ?auto_76351 ) ( CLEAR ?auto_76355 ) ( HOLDING ?auto_76353 ) ( CLEAR ?auto_76352 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76354 ?auto_76356 ?auto_76352 ?auto_76353 )
      ( MAKE-1PILE ?auto_76349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76357 - BLOCK
    )
    :vars
    (
      ?auto_76364 - BLOCK
      ?auto_76361 - BLOCK
      ?auto_76358 - BLOCK
      ?auto_76360 - BLOCK
      ?auto_76359 - BLOCK
      ?auto_76363 - BLOCK
      ?auto_76362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76364 ?auto_76357 ) ( ON-TABLE ?auto_76357 ) ( not ( = ?auto_76357 ?auto_76364 ) ) ( not ( = ?auto_76357 ?auto_76361 ) ) ( not ( = ?auto_76357 ?auto_76358 ) ) ( not ( = ?auto_76364 ?auto_76361 ) ) ( not ( = ?auto_76364 ?auto_76358 ) ) ( not ( = ?auto_76361 ?auto_76358 ) ) ( ON ?auto_76361 ?auto_76364 ) ( ON-TABLE ?auto_76360 ) ( ON ?auto_76359 ?auto_76360 ) ( ON ?auto_76363 ?auto_76359 ) ( not ( = ?auto_76360 ?auto_76359 ) ) ( not ( = ?auto_76360 ?auto_76363 ) ) ( not ( = ?auto_76360 ?auto_76362 ) ) ( not ( = ?auto_76360 ?auto_76358 ) ) ( not ( = ?auto_76359 ?auto_76363 ) ) ( not ( = ?auto_76359 ?auto_76362 ) ) ( not ( = ?auto_76359 ?auto_76358 ) ) ( not ( = ?auto_76363 ?auto_76362 ) ) ( not ( = ?auto_76363 ?auto_76358 ) ) ( not ( = ?auto_76362 ?auto_76358 ) ) ( not ( = ?auto_76357 ?auto_76362 ) ) ( not ( = ?auto_76357 ?auto_76360 ) ) ( not ( = ?auto_76357 ?auto_76359 ) ) ( not ( = ?auto_76357 ?auto_76363 ) ) ( not ( = ?auto_76364 ?auto_76362 ) ) ( not ( = ?auto_76364 ?auto_76360 ) ) ( not ( = ?auto_76364 ?auto_76359 ) ) ( not ( = ?auto_76364 ?auto_76363 ) ) ( not ( = ?auto_76361 ?auto_76362 ) ) ( not ( = ?auto_76361 ?auto_76360 ) ) ( not ( = ?auto_76361 ?auto_76359 ) ) ( not ( = ?auto_76361 ?auto_76363 ) ) ( ON ?auto_76358 ?auto_76361 ) ( CLEAR ?auto_76363 ) ( ON ?auto_76362 ?auto_76358 ) ( CLEAR ?auto_76362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76357 ?auto_76364 ?auto_76361 ?auto_76358 )
      ( MAKE-1PILE ?auto_76357 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76365 - BLOCK
    )
    :vars
    (
      ?auto_76367 - BLOCK
      ?auto_76368 - BLOCK
      ?auto_76371 - BLOCK
      ?auto_76370 - BLOCK
      ?auto_76366 - BLOCK
      ?auto_76372 - BLOCK
      ?auto_76369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76367 ?auto_76365 ) ( ON-TABLE ?auto_76365 ) ( not ( = ?auto_76365 ?auto_76367 ) ) ( not ( = ?auto_76365 ?auto_76368 ) ) ( not ( = ?auto_76365 ?auto_76371 ) ) ( not ( = ?auto_76367 ?auto_76368 ) ) ( not ( = ?auto_76367 ?auto_76371 ) ) ( not ( = ?auto_76368 ?auto_76371 ) ) ( ON ?auto_76368 ?auto_76367 ) ( ON-TABLE ?auto_76370 ) ( ON ?auto_76366 ?auto_76370 ) ( not ( = ?auto_76370 ?auto_76366 ) ) ( not ( = ?auto_76370 ?auto_76372 ) ) ( not ( = ?auto_76370 ?auto_76369 ) ) ( not ( = ?auto_76370 ?auto_76371 ) ) ( not ( = ?auto_76366 ?auto_76372 ) ) ( not ( = ?auto_76366 ?auto_76369 ) ) ( not ( = ?auto_76366 ?auto_76371 ) ) ( not ( = ?auto_76372 ?auto_76369 ) ) ( not ( = ?auto_76372 ?auto_76371 ) ) ( not ( = ?auto_76369 ?auto_76371 ) ) ( not ( = ?auto_76365 ?auto_76369 ) ) ( not ( = ?auto_76365 ?auto_76370 ) ) ( not ( = ?auto_76365 ?auto_76366 ) ) ( not ( = ?auto_76365 ?auto_76372 ) ) ( not ( = ?auto_76367 ?auto_76369 ) ) ( not ( = ?auto_76367 ?auto_76370 ) ) ( not ( = ?auto_76367 ?auto_76366 ) ) ( not ( = ?auto_76367 ?auto_76372 ) ) ( not ( = ?auto_76368 ?auto_76369 ) ) ( not ( = ?auto_76368 ?auto_76370 ) ) ( not ( = ?auto_76368 ?auto_76366 ) ) ( not ( = ?auto_76368 ?auto_76372 ) ) ( ON ?auto_76371 ?auto_76368 ) ( ON ?auto_76369 ?auto_76371 ) ( CLEAR ?auto_76369 ) ( HOLDING ?auto_76372 ) ( CLEAR ?auto_76366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76370 ?auto_76366 ?auto_76372 )
      ( MAKE-1PILE ?auto_76365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76373 - BLOCK
    )
    :vars
    (
      ?auto_76374 - BLOCK
      ?auto_76376 - BLOCK
      ?auto_76375 - BLOCK
      ?auto_76380 - BLOCK
      ?auto_76379 - BLOCK
      ?auto_76378 - BLOCK
      ?auto_76377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76374 ?auto_76373 ) ( ON-TABLE ?auto_76373 ) ( not ( = ?auto_76373 ?auto_76374 ) ) ( not ( = ?auto_76373 ?auto_76376 ) ) ( not ( = ?auto_76373 ?auto_76375 ) ) ( not ( = ?auto_76374 ?auto_76376 ) ) ( not ( = ?auto_76374 ?auto_76375 ) ) ( not ( = ?auto_76376 ?auto_76375 ) ) ( ON ?auto_76376 ?auto_76374 ) ( ON-TABLE ?auto_76380 ) ( ON ?auto_76379 ?auto_76380 ) ( not ( = ?auto_76380 ?auto_76379 ) ) ( not ( = ?auto_76380 ?auto_76378 ) ) ( not ( = ?auto_76380 ?auto_76377 ) ) ( not ( = ?auto_76380 ?auto_76375 ) ) ( not ( = ?auto_76379 ?auto_76378 ) ) ( not ( = ?auto_76379 ?auto_76377 ) ) ( not ( = ?auto_76379 ?auto_76375 ) ) ( not ( = ?auto_76378 ?auto_76377 ) ) ( not ( = ?auto_76378 ?auto_76375 ) ) ( not ( = ?auto_76377 ?auto_76375 ) ) ( not ( = ?auto_76373 ?auto_76377 ) ) ( not ( = ?auto_76373 ?auto_76380 ) ) ( not ( = ?auto_76373 ?auto_76379 ) ) ( not ( = ?auto_76373 ?auto_76378 ) ) ( not ( = ?auto_76374 ?auto_76377 ) ) ( not ( = ?auto_76374 ?auto_76380 ) ) ( not ( = ?auto_76374 ?auto_76379 ) ) ( not ( = ?auto_76374 ?auto_76378 ) ) ( not ( = ?auto_76376 ?auto_76377 ) ) ( not ( = ?auto_76376 ?auto_76380 ) ) ( not ( = ?auto_76376 ?auto_76379 ) ) ( not ( = ?auto_76376 ?auto_76378 ) ) ( ON ?auto_76375 ?auto_76376 ) ( ON ?auto_76377 ?auto_76375 ) ( CLEAR ?auto_76379 ) ( ON ?auto_76378 ?auto_76377 ) ( CLEAR ?auto_76378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76373 ?auto_76374 ?auto_76376 ?auto_76375 ?auto_76377 )
      ( MAKE-1PILE ?auto_76373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76381 - BLOCK
    )
    :vars
    (
      ?auto_76388 - BLOCK
      ?auto_76384 - BLOCK
      ?auto_76386 - BLOCK
      ?auto_76383 - BLOCK
      ?auto_76385 - BLOCK
      ?auto_76387 - BLOCK
      ?auto_76382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76388 ?auto_76381 ) ( ON-TABLE ?auto_76381 ) ( not ( = ?auto_76381 ?auto_76388 ) ) ( not ( = ?auto_76381 ?auto_76384 ) ) ( not ( = ?auto_76381 ?auto_76386 ) ) ( not ( = ?auto_76388 ?auto_76384 ) ) ( not ( = ?auto_76388 ?auto_76386 ) ) ( not ( = ?auto_76384 ?auto_76386 ) ) ( ON ?auto_76384 ?auto_76388 ) ( ON-TABLE ?auto_76383 ) ( not ( = ?auto_76383 ?auto_76385 ) ) ( not ( = ?auto_76383 ?auto_76387 ) ) ( not ( = ?auto_76383 ?auto_76382 ) ) ( not ( = ?auto_76383 ?auto_76386 ) ) ( not ( = ?auto_76385 ?auto_76387 ) ) ( not ( = ?auto_76385 ?auto_76382 ) ) ( not ( = ?auto_76385 ?auto_76386 ) ) ( not ( = ?auto_76387 ?auto_76382 ) ) ( not ( = ?auto_76387 ?auto_76386 ) ) ( not ( = ?auto_76382 ?auto_76386 ) ) ( not ( = ?auto_76381 ?auto_76382 ) ) ( not ( = ?auto_76381 ?auto_76383 ) ) ( not ( = ?auto_76381 ?auto_76385 ) ) ( not ( = ?auto_76381 ?auto_76387 ) ) ( not ( = ?auto_76388 ?auto_76382 ) ) ( not ( = ?auto_76388 ?auto_76383 ) ) ( not ( = ?auto_76388 ?auto_76385 ) ) ( not ( = ?auto_76388 ?auto_76387 ) ) ( not ( = ?auto_76384 ?auto_76382 ) ) ( not ( = ?auto_76384 ?auto_76383 ) ) ( not ( = ?auto_76384 ?auto_76385 ) ) ( not ( = ?auto_76384 ?auto_76387 ) ) ( ON ?auto_76386 ?auto_76384 ) ( ON ?auto_76382 ?auto_76386 ) ( ON ?auto_76387 ?auto_76382 ) ( CLEAR ?auto_76387 ) ( HOLDING ?auto_76385 ) ( CLEAR ?auto_76383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76383 ?auto_76385 )
      ( MAKE-1PILE ?auto_76381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76389 - BLOCK
    )
    :vars
    (
      ?auto_76394 - BLOCK
      ?auto_76393 - BLOCK
      ?auto_76391 - BLOCK
      ?auto_76392 - BLOCK
      ?auto_76395 - BLOCK
      ?auto_76396 - BLOCK
      ?auto_76390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76394 ?auto_76389 ) ( ON-TABLE ?auto_76389 ) ( not ( = ?auto_76389 ?auto_76394 ) ) ( not ( = ?auto_76389 ?auto_76393 ) ) ( not ( = ?auto_76389 ?auto_76391 ) ) ( not ( = ?auto_76394 ?auto_76393 ) ) ( not ( = ?auto_76394 ?auto_76391 ) ) ( not ( = ?auto_76393 ?auto_76391 ) ) ( ON ?auto_76393 ?auto_76394 ) ( ON-TABLE ?auto_76392 ) ( not ( = ?auto_76392 ?auto_76395 ) ) ( not ( = ?auto_76392 ?auto_76396 ) ) ( not ( = ?auto_76392 ?auto_76390 ) ) ( not ( = ?auto_76392 ?auto_76391 ) ) ( not ( = ?auto_76395 ?auto_76396 ) ) ( not ( = ?auto_76395 ?auto_76390 ) ) ( not ( = ?auto_76395 ?auto_76391 ) ) ( not ( = ?auto_76396 ?auto_76390 ) ) ( not ( = ?auto_76396 ?auto_76391 ) ) ( not ( = ?auto_76390 ?auto_76391 ) ) ( not ( = ?auto_76389 ?auto_76390 ) ) ( not ( = ?auto_76389 ?auto_76392 ) ) ( not ( = ?auto_76389 ?auto_76395 ) ) ( not ( = ?auto_76389 ?auto_76396 ) ) ( not ( = ?auto_76394 ?auto_76390 ) ) ( not ( = ?auto_76394 ?auto_76392 ) ) ( not ( = ?auto_76394 ?auto_76395 ) ) ( not ( = ?auto_76394 ?auto_76396 ) ) ( not ( = ?auto_76393 ?auto_76390 ) ) ( not ( = ?auto_76393 ?auto_76392 ) ) ( not ( = ?auto_76393 ?auto_76395 ) ) ( not ( = ?auto_76393 ?auto_76396 ) ) ( ON ?auto_76391 ?auto_76393 ) ( ON ?auto_76390 ?auto_76391 ) ( ON ?auto_76396 ?auto_76390 ) ( CLEAR ?auto_76392 ) ( ON ?auto_76395 ?auto_76396 ) ( CLEAR ?auto_76395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76389 ?auto_76394 ?auto_76393 ?auto_76391 ?auto_76390 ?auto_76396 )
      ( MAKE-1PILE ?auto_76389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76397 - BLOCK
    )
    :vars
    (
      ?auto_76404 - BLOCK
      ?auto_76398 - BLOCK
      ?auto_76401 - BLOCK
      ?auto_76399 - BLOCK
      ?auto_76402 - BLOCK
      ?auto_76403 - BLOCK
      ?auto_76400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76404 ?auto_76397 ) ( ON-TABLE ?auto_76397 ) ( not ( = ?auto_76397 ?auto_76404 ) ) ( not ( = ?auto_76397 ?auto_76398 ) ) ( not ( = ?auto_76397 ?auto_76401 ) ) ( not ( = ?auto_76404 ?auto_76398 ) ) ( not ( = ?auto_76404 ?auto_76401 ) ) ( not ( = ?auto_76398 ?auto_76401 ) ) ( ON ?auto_76398 ?auto_76404 ) ( not ( = ?auto_76399 ?auto_76402 ) ) ( not ( = ?auto_76399 ?auto_76403 ) ) ( not ( = ?auto_76399 ?auto_76400 ) ) ( not ( = ?auto_76399 ?auto_76401 ) ) ( not ( = ?auto_76402 ?auto_76403 ) ) ( not ( = ?auto_76402 ?auto_76400 ) ) ( not ( = ?auto_76402 ?auto_76401 ) ) ( not ( = ?auto_76403 ?auto_76400 ) ) ( not ( = ?auto_76403 ?auto_76401 ) ) ( not ( = ?auto_76400 ?auto_76401 ) ) ( not ( = ?auto_76397 ?auto_76400 ) ) ( not ( = ?auto_76397 ?auto_76399 ) ) ( not ( = ?auto_76397 ?auto_76402 ) ) ( not ( = ?auto_76397 ?auto_76403 ) ) ( not ( = ?auto_76404 ?auto_76400 ) ) ( not ( = ?auto_76404 ?auto_76399 ) ) ( not ( = ?auto_76404 ?auto_76402 ) ) ( not ( = ?auto_76404 ?auto_76403 ) ) ( not ( = ?auto_76398 ?auto_76400 ) ) ( not ( = ?auto_76398 ?auto_76399 ) ) ( not ( = ?auto_76398 ?auto_76402 ) ) ( not ( = ?auto_76398 ?auto_76403 ) ) ( ON ?auto_76401 ?auto_76398 ) ( ON ?auto_76400 ?auto_76401 ) ( ON ?auto_76403 ?auto_76400 ) ( ON ?auto_76402 ?auto_76403 ) ( CLEAR ?auto_76402 ) ( HOLDING ?auto_76399 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76399 )
      ( MAKE-1PILE ?auto_76397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76405 - BLOCK
    )
    :vars
    (
      ?auto_76408 - BLOCK
      ?auto_76410 - BLOCK
      ?auto_76409 - BLOCK
      ?auto_76406 - BLOCK
      ?auto_76412 - BLOCK
      ?auto_76411 - BLOCK
      ?auto_76407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76408 ?auto_76405 ) ( ON-TABLE ?auto_76405 ) ( not ( = ?auto_76405 ?auto_76408 ) ) ( not ( = ?auto_76405 ?auto_76410 ) ) ( not ( = ?auto_76405 ?auto_76409 ) ) ( not ( = ?auto_76408 ?auto_76410 ) ) ( not ( = ?auto_76408 ?auto_76409 ) ) ( not ( = ?auto_76410 ?auto_76409 ) ) ( ON ?auto_76410 ?auto_76408 ) ( not ( = ?auto_76406 ?auto_76412 ) ) ( not ( = ?auto_76406 ?auto_76411 ) ) ( not ( = ?auto_76406 ?auto_76407 ) ) ( not ( = ?auto_76406 ?auto_76409 ) ) ( not ( = ?auto_76412 ?auto_76411 ) ) ( not ( = ?auto_76412 ?auto_76407 ) ) ( not ( = ?auto_76412 ?auto_76409 ) ) ( not ( = ?auto_76411 ?auto_76407 ) ) ( not ( = ?auto_76411 ?auto_76409 ) ) ( not ( = ?auto_76407 ?auto_76409 ) ) ( not ( = ?auto_76405 ?auto_76407 ) ) ( not ( = ?auto_76405 ?auto_76406 ) ) ( not ( = ?auto_76405 ?auto_76412 ) ) ( not ( = ?auto_76405 ?auto_76411 ) ) ( not ( = ?auto_76408 ?auto_76407 ) ) ( not ( = ?auto_76408 ?auto_76406 ) ) ( not ( = ?auto_76408 ?auto_76412 ) ) ( not ( = ?auto_76408 ?auto_76411 ) ) ( not ( = ?auto_76410 ?auto_76407 ) ) ( not ( = ?auto_76410 ?auto_76406 ) ) ( not ( = ?auto_76410 ?auto_76412 ) ) ( not ( = ?auto_76410 ?auto_76411 ) ) ( ON ?auto_76409 ?auto_76410 ) ( ON ?auto_76407 ?auto_76409 ) ( ON ?auto_76411 ?auto_76407 ) ( ON ?auto_76412 ?auto_76411 ) ( ON ?auto_76406 ?auto_76412 ) ( CLEAR ?auto_76406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76405 ?auto_76408 ?auto_76410 ?auto_76409 ?auto_76407 ?auto_76411 ?auto_76412 )
      ( MAKE-1PILE ?auto_76405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76420 - BLOCK
      ?auto_76421 - BLOCK
      ?auto_76422 - BLOCK
      ?auto_76423 - BLOCK
      ?auto_76424 - BLOCK
      ?auto_76425 - BLOCK
      ?auto_76426 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76426 ) ( CLEAR ?auto_76425 ) ( ON-TABLE ?auto_76420 ) ( ON ?auto_76421 ?auto_76420 ) ( ON ?auto_76422 ?auto_76421 ) ( ON ?auto_76423 ?auto_76422 ) ( ON ?auto_76424 ?auto_76423 ) ( ON ?auto_76425 ?auto_76424 ) ( not ( = ?auto_76420 ?auto_76421 ) ) ( not ( = ?auto_76420 ?auto_76422 ) ) ( not ( = ?auto_76420 ?auto_76423 ) ) ( not ( = ?auto_76420 ?auto_76424 ) ) ( not ( = ?auto_76420 ?auto_76425 ) ) ( not ( = ?auto_76420 ?auto_76426 ) ) ( not ( = ?auto_76421 ?auto_76422 ) ) ( not ( = ?auto_76421 ?auto_76423 ) ) ( not ( = ?auto_76421 ?auto_76424 ) ) ( not ( = ?auto_76421 ?auto_76425 ) ) ( not ( = ?auto_76421 ?auto_76426 ) ) ( not ( = ?auto_76422 ?auto_76423 ) ) ( not ( = ?auto_76422 ?auto_76424 ) ) ( not ( = ?auto_76422 ?auto_76425 ) ) ( not ( = ?auto_76422 ?auto_76426 ) ) ( not ( = ?auto_76423 ?auto_76424 ) ) ( not ( = ?auto_76423 ?auto_76425 ) ) ( not ( = ?auto_76423 ?auto_76426 ) ) ( not ( = ?auto_76424 ?auto_76425 ) ) ( not ( = ?auto_76424 ?auto_76426 ) ) ( not ( = ?auto_76425 ?auto_76426 ) ) )
    :subtasks
    ( ( !STACK ?auto_76426 ?auto_76425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76427 - BLOCK
      ?auto_76428 - BLOCK
      ?auto_76429 - BLOCK
      ?auto_76430 - BLOCK
      ?auto_76431 - BLOCK
      ?auto_76432 - BLOCK
      ?auto_76433 - BLOCK
    )
    :vars
    (
      ?auto_76434 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76432 ) ( ON-TABLE ?auto_76427 ) ( ON ?auto_76428 ?auto_76427 ) ( ON ?auto_76429 ?auto_76428 ) ( ON ?auto_76430 ?auto_76429 ) ( ON ?auto_76431 ?auto_76430 ) ( ON ?auto_76432 ?auto_76431 ) ( not ( = ?auto_76427 ?auto_76428 ) ) ( not ( = ?auto_76427 ?auto_76429 ) ) ( not ( = ?auto_76427 ?auto_76430 ) ) ( not ( = ?auto_76427 ?auto_76431 ) ) ( not ( = ?auto_76427 ?auto_76432 ) ) ( not ( = ?auto_76427 ?auto_76433 ) ) ( not ( = ?auto_76428 ?auto_76429 ) ) ( not ( = ?auto_76428 ?auto_76430 ) ) ( not ( = ?auto_76428 ?auto_76431 ) ) ( not ( = ?auto_76428 ?auto_76432 ) ) ( not ( = ?auto_76428 ?auto_76433 ) ) ( not ( = ?auto_76429 ?auto_76430 ) ) ( not ( = ?auto_76429 ?auto_76431 ) ) ( not ( = ?auto_76429 ?auto_76432 ) ) ( not ( = ?auto_76429 ?auto_76433 ) ) ( not ( = ?auto_76430 ?auto_76431 ) ) ( not ( = ?auto_76430 ?auto_76432 ) ) ( not ( = ?auto_76430 ?auto_76433 ) ) ( not ( = ?auto_76431 ?auto_76432 ) ) ( not ( = ?auto_76431 ?auto_76433 ) ) ( not ( = ?auto_76432 ?auto_76433 ) ) ( ON ?auto_76433 ?auto_76434 ) ( CLEAR ?auto_76433 ) ( HAND-EMPTY ) ( not ( = ?auto_76427 ?auto_76434 ) ) ( not ( = ?auto_76428 ?auto_76434 ) ) ( not ( = ?auto_76429 ?auto_76434 ) ) ( not ( = ?auto_76430 ?auto_76434 ) ) ( not ( = ?auto_76431 ?auto_76434 ) ) ( not ( = ?auto_76432 ?auto_76434 ) ) ( not ( = ?auto_76433 ?auto_76434 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76433 ?auto_76434 )
      ( MAKE-7PILE ?auto_76427 ?auto_76428 ?auto_76429 ?auto_76430 ?auto_76431 ?auto_76432 ?auto_76433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76435 - BLOCK
      ?auto_76436 - BLOCK
      ?auto_76437 - BLOCK
      ?auto_76438 - BLOCK
      ?auto_76439 - BLOCK
      ?auto_76440 - BLOCK
      ?auto_76441 - BLOCK
    )
    :vars
    (
      ?auto_76442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76435 ) ( ON ?auto_76436 ?auto_76435 ) ( ON ?auto_76437 ?auto_76436 ) ( ON ?auto_76438 ?auto_76437 ) ( ON ?auto_76439 ?auto_76438 ) ( not ( = ?auto_76435 ?auto_76436 ) ) ( not ( = ?auto_76435 ?auto_76437 ) ) ( not ( = ?auto_76435 ?auto_76438 ) ) ( not ( = ?auto_76435 ?auto_76439 ) ) ( not ( = ?auto_76435 ?auto_76440 ) ) ( not ( = ?auto_76435 ?auto_76441 ) ) ( not ( = ?auto_76436 ?auto_76437 ) ) ( not ( = ?auto_76436 ?auto_76438 ) ) ( not ( = ?auto_76436 ?auto_76439 ) ) ( not ( = ?auto_76436 ?auto_76440 ) ) ( not ( = ?auto_76436 ?auto_76441 ) ) ( not ( = ?auto_76437 ?auto_76438 ) ) ( not ( = ?auto_76437 ?auto_76439 ) ) ( not ( = ?auto_76437 ?auto_76440 ) ) ( not ( = ?auto_76437 ?auto_76441 ) ) ( not ( = ?auto_76438 ?auto_76439 ) ) ( not ( = ?auto_76438 ?auto_76440 ) ) ( not ( = ?auto_76438 ?auto_76441 ) ) ( not ( = ?auto_76439 ?auto_76440 ) ) ( not ( = ?auto_76439 ?auto_76441 ) ) ( not ( = ?auto_76440 ?auto_76441 ) ) ( ON ?auto_76441 ?auto_76442 ) ( CLEAR ?auto_76441 ) ( not ( = ?auto_76435 ?auto_76442 ) ) ( not ( = ?auto_76436 ?auto_76442 ) ) ( not ( = ?auto_76437 ?auto_76442 ) ) ( not ( = ?auto_76438 ?auto_76442 ) ) ( not ( = ?auto_76439 ?auto_76442 ) ) ( not ( = ?auto_76440 ?auto_76442 ) ) ( not ( = ?auto_76441 ?auto_76442 ) ) ( HOLDING ?auto_76440 ) ( CLEAR ?auto_76439 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76435 ?auto_76436 ?auto_76437 ?auto_76438 ?auto_76439 ?auto_76440 )
      ( MAKE-7PILE ?auto_76435 ?auto_76436 ?auto_76437 ?auto_76438 ?auto_76439 ?auto_76440 ?auto_76441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76443 - BLOCK
      ?auto_76444 - BLOCK
      ?auto_76445 - BLOCK
      ?auto_76446 - BLOCK
      ?auto_76447 - BLOCK
      ?auto_76448 - BLOCK
      ?auto_76449 - BLOCK
    )
    :vars
    (
      ?auto_76450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76443 ) ( ON ?auto_76444 ?auto_76443 ) ( ON ?auto_76445 ?auto_76444 ) ( ON ?auto_76446 ?auto_76445 ) ( ON ?auto_76447 ?auto_76446 ) ( not ( = ?auto_76443 ?auto_76444 ) ) ( not ( = ?auto_76443 ?auto_76445 ) ) ( not ( = ?auto_76443 ?auto_76446 ) ) ( not ( = ?auto_76443 ?auto_76447 ) ) ( not ( = ?auto_76443 ?auto_76448 ) ) ( not ( = ?auto_76443 ?auto_76449 ) ) ( not ( = ?auto_76444 ?auto_76445 ) ) ( not ( = ?auto_76444 ?auto_76446 ) ) ( not ( = ?auto_76444 ?auto_76447 ) ) ( not ( = ?auto_76444 ?auto_76448 ) ) ( not ( = ?auto_76444 ?auto_76449 ) ) ( not ( = ?auto_76445 ?auto_76446 ) ) ( not ( = ?auto_76445 ?auto_76447 ) ) ( not ( = ?auto_76445 ?auto_76448 ) ) ( not ( = ?auto_76445 ?auto_76449 ) ) ( not ( = ?auto_76446 ?auto_76447 ) ) ( not ( = ?auto_76446 ?auto_76448 ) ) ( not ( = ?auto_76446 ?auto_76449 ) ) ( not ( = ?auto_76447 ?auto_76448 ) ) ( not ( = ?auto_76447 ?auto_76449 ) ) ( not ( = ?auto_76448 ?auto_76449 ) ) ( ON ?auto_76449 ?auto_76450 ) ( not ( = ?auto_76443 ?auto_76450 ) ) ( not ( = ?auto_76444 ?auto_76450 ) ) ( not ( = ?auto_76445 ?auto_76450 ) ) ( not ( = ?auto_76446 ?auto_76450 ) ) ( not ( = ?auto_76447 ?auto_76450 ) ) ( not ( = ?auto_76448 ?auto_76450 ) ) ( not ( = ?auto_76449 ?auto_76450 ) ) ( CLEAR ?auto_76447 ) ( ON ?auto_76448 ?auto_76449 ) ( CLEAR ?auto_76448 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76450 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76450 ?auto_76449 )
      ( MAKE-7PILE ?auto_76443 ?auto_76444 ?auto_76445 ?auto_76446 ?auto_76447 ?auto_76448 ?auto_76449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76451 - BLOCK
      ?auto_76452 - BLOCK
      ?auto_76453 - BLOCK
      ?auto_76454 - BLOCK
      ?auto_76455 - BLOCK
      ?auto_76456 - BLOCK
      ?auto_76457 - BLOCK
    )
    :vars
    (
      ?auto_76458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76451 ) ( ON ?auto_76452 ?auto_76451 ) ( ON ?auto_76453 ?auto_76452 ) ( ON ?auto_76454 ?auto_76453 ) ( not ( = ?auto_76451 ?auto_76452 ) ) ( not ( = ?auto_76451 ?auto_76453 ) ) ( not ( = ?auto_76451 ?auto_76454 ) ) ( not ( = ?auto_76451 ?auto_76455 ) ) ( not ( = ?auto_76451 ?auto_76456 ) ) ( not ( = ?auto_76451 ?auto_76457 ) ) ( not ( = ?auto_76452 ?auto_76453 ) ) ( not ( = ?auto_76452 ?auto_76454 ) ) ( not ( = ?auto_76452 ?auto_76455 ) ) ( not ( = ?auto_76452 ?auto_76456 ) ) ( not ( = ?auto_76452 ?auto_76457 ) ) ( not ( = ?auto_76453 ?auto_76454 ) ) ( not ( = ?auto_76453 ?auto_76455 ) ) ( not ( = ?auto_76453 ?auto_76456 ) ) ( not ( = ?auto_76453 ?auto_76457 ) ) ( not ( = ?auto_76454 ?auto_76455 ) ) ( not ( = ?auto_76454 ?auto_76456 ) ) ( not ( = ?auto_76454 ?auto_76457 ) ) ( not ( = ?auto_76455 ?auto_76456 ) ) ( not ( = ?auto_76455 ?auto_76457 ) ) ( not ( = ?auto_76456 ?auto_76457 ) ) ( ON ?auto_76457 ?auto_76458 ) ( not ( = ?auto_76451 ?auto_76458 ) ) ( not ( = ?auto_76452 ?auto_76458 ) ) ( not ( = ?auto_76453 ?auto_76458 ) ) ( not ( = ?auto_76454 ?auto_76458 ) ) ( not ( = ?auto_76455 ?auto_76458 ) ) ( not ( = ?auto_76456 ?auto_76458 ) ) ( not ( = ?auto_76457 ?auto_76458 ) ) ( ON ?auto_76456 ?auto_76457 ) ( CLEAR ?auto_76456 ) ( ON-TABLE ?auto_76458 ) ( HOLDING ?auto_76455 ) ( CLEAR ?auto_76454 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76451 ?auto_76452 ?auto_76453 ?auto_76454 ?auto_76455 )
      ( MAKE-7PILE ?auto_76451 ?auto_76452 ?auto_76453 ?auto_76454 ?auto_76455 ?auto_76456 ?auto_76457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76459 - BLOCK
      ?auto_76460 - BLOCK
      ?auto_76461 - BLOCK
      ?auto_76462 - BLOCK
      ?auto_76463 - BLOCK
      ?auto_76464 - BLOCK
      ?auto_76465 - BLOCK
    )
    :vars
    (
      ?auto_76466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76459 ) ( ON ?auto_76460 ?auto_76459 ) ( ON ?auto_76461 ?auto_76460 ) ( ON ?auto_76462 ?auto_76461 ) ( not ( = ?auto_76459 ?auto_76460 ) ) ( not ( = ?auto_76459 ?auto_76461 ) ) ( not ( = ?auto_76459 ?auto_76462 ) ) ( not ( = ?auto_76459 ?auto_76463 ) ) ( not ( = ?auto_76459 ?auto_76464 ) ) ( not ( = ?auto_76459 ?auto_76465 ) ) ( not ( = ?auto_76460 ?auto_76461 ) ) ( not ( = ?auto_76460 ?auto_76462 ) ) ( not ( = ?auto_76460 ?auto_76463 ) ) ( not ( = ?auto_76460 ?auto_76464 ) ) ( not ( = ?auto_76460 ?auto_76465 ) ) ( not ( = ?auto_76461 ?auto_76462 ) ) ( not ( = ?auto_76461 ?auto_76463 ) ) ( not ( = ?auto_76461 ?auto_76464 ) ) ( not ( = ?auto_76461 ?auto_76465 ) ) ( not ( = ?auto_76462 ?auto_76463 ) ) ( not ( = ?auto_76462 ?auto_76464 ) ) ( not ( = ?auto_76462 ?auto_76465 ) ) ( not ( = ?auto_76463 ?auto_76464 ) ) ( not ( = ?auto_76463 ?auto_76465 ) ) ( not ( = ?auto_76464 ?auto_76465 ) ) ( ON ?auto_76465 ?auto_76466 ) ( not ( = ?auto_76459 ?auto_76466 ) ) ( not ( = ?auto_76460 ?auto_76466 ) ) ( not ( = ?auto_76461 ?auto_76466 ) ) ( not ( = ?auto_76462 ?auto_76466 ) ) ( not ( = ?auto_76463 ?auto_76466 ) ) ( not ( = ?auto_76464 ?auto_76466 ) ) ( not ( = ?auto_76465 ?auto_76466 ) ) ( ON ?auto_76464 ?auto_76465 ) ( ON-TABLE ?auto_76466 ) ( CLEAR ?auto_76462 ) ( ON ?auto_76463 ?auto_76464 ) ( CLEAR ?auto_76463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76466 ?auto_76465 ?auto_76464 )
      ( MAKE-7PILE ?auto_76459 ?auto_76460 ?auto_76461 ?auto_76462 ?auto_76463 ?auto_76464 ?auto_76465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76467 - BLOCK
      ?auto_76468 - BLOCK
      ?auto_76469 - BLOCK
      ?auto_76470 - BLOCK
      ?auto_76471 - BLOCK
      ?auto_76472 - BLOCK
      ?auto_76473 - BLOCK
    )
    :vars
    (
      ?auto_76474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76467 ) ( ON ?auto_76468 ?auto_76467 ) ( ON ?auto_76469 ?auto_76468 ) ( not ( = ?auto_76467 ?auto_76468 ) ) ( not ( = ?auto_76467 ?auto_76469 ) ) ( not ( = ?auto_76467 ?auto_76470 ) ) ( not ( = ?auto_76467 ?auto_76471 ) ) ( not ( = ?auto_76467 ?auto_76472 ) ) ( not ( = ?auto_76467 ?auto_76473 ) ) ( not ( = ?auto_76468 ?auto_76469 ) ) ( not ( = ?auto_76468 ?auto_76470 ) ) ( not ( = ?auto_76468 ?auto_76471 ) ) ( not ( = ?auto_76468 ?auto_76472 ) ) ( not ( = ?auto_76468 ?auto_76473 ) ) ( not ( = ?auto_76469 ?auto_76470 ) ) ( not ( = ?auto_76469 ?auto_76471 ) ) ( not ( = ?auto_76469 ?auto_76472 ) ) ( not ( = ?auto_76469 ?auto_76473 ) ) ( not ( = ?auto_76470 ?auto_76471 ) ) ( not ( = ?auto_76470 ?auto_76472 ) ) ( not ( = ?auto_76470 ?auto_76473 ) ) ( not ( = ?auto_76471 ?auto_76472 ) ) ( not ( = ?auto_76471 ?auto_76473 ) ) ( not ( = ?auto_76472 ?auto_76473 ) ) ( ON ?auto_76473 ?auto_76474 ) ( not ( = ?auto_76467 ?auto_76474 ) ) ( not ( = ?auto_76468 ?auto_76474 ) ) ( not ( = ?auto_76469 ?auto_76474 ) ) ( not ( = ?auto_76470 ?auto_76474 ) ) ( not ( = ?auto_76471 ?auto_76474 ) ) ( not ( = ?auto_76472 ?auto_76474 ) ) ( not ( = ?auto_76473 ?auto_76474 ) ) ( ON ?auto_76472 ?auto_76473 ) ( ON-TABLE ?auto_76474 ) ( ON ?auto_76471 ?auto_76472 ) ( CLEAR ?auto_76471 ) ( HOLDING ?auto_76470 ) ( CLEAR ?auto_76469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76467 ?auto_76468 ?auto_76469 ?auto_76470 )
      ( MAKE-7PILE ?auto_76467 ?auto_76468 ?auto_76469 ?auto_76470 ?auto_76471 ?auto_76472 ?auto_76473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76475 - BLOCK
      ?auto_76476 - BLOCK
      ?auto_76477 - BLOCK
      ?auto_76478 - BLOCK
      ?auto_76479 - BLOCK
      ?auto_76480 - BLOCK
      ?auto_76481 - BLOCK
    )
    :vars
    (
      ?auto_76482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76475 ) ( ON ?auto_76476 ?auto_76475 ) ( ON ?auto_76477 ?auto_76476 ) ( not ( = ?auto_76475 ?auto_76476 ) ) ( not ( = ?auto_76475 ?auto_76477 ) ) ( not ( = ?auto_76475 ?auto_76478 ) ) ( not ( = ?auto_76475 ?auto_76479 ) ) ( not ( = ?auto_76475 ?auto_76480 ) ) ( not ( = ?auto_76475 ?auto_76481 ) ) ( not ( = ?auto_76476 ?auto_76477 ) ) ( not ( = ?auto_76476 ?auto_76478 ) ) ( not ( = ?auto_76476 ?auto_76479 ) ) ( not ( = ?auto_76476 ?auto_76480 ) ) ( not ( = ?auto_76476 ?auto_76481 ) ) ( not ( = ?auto_76477 ?auto_76478 ) ) ( not ( = ?auto_76477 ?auto_76479 ) ) ( not ( = ?auto_76477 ?auto_76480 ) ) ( not ( = ?auto_76477 ?auto_76481 ) ) ( not ( = ?auto_76478 ?auto_76479 ) ) ( not ( = ?auto_76478 ?auto_76480 ) ) ( not ( = ?auto_76478 ?auto_76481 ) ) ( not ( = ?auto_76479 ?auto_76480 ) ) ( not ( = ?auto_76479 ?auto_76481 ) ) ( not ( = ?auto_76480 ?auto_76481 ) ) ( ON ?auto_76481 ?auto_76482 ) ( not ( = ?auto_76475 ?auto_76482 ) ) ( not ( = ?auto_76476 ?auto_76482 ) ) ( not ( = ?auto_76477 ?auto_76482 ) ) ( not ( = ?auto_76478 ?auto_76482 ) ) ( not ( = ?auto_76479 ?auto_76482 ) ) ( not ( = ?auto_76480 ?auto_76482 ) ) ( not ( = ?auto_76481 ?auto_76482 ) ) ( ON ?auto_76480 ?auto_76481 ) ( ON-TABLE ?auto_76482 ) ( ON ?auto_76479 ?auto_76480 ) ( CLEAR ?auto_76477 ) ( ON ?auto_76478 ?auto_76479 ) ( CLEAR ?auto_76478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76482 ?auto_76481 ?auto_76480 ?auto_76479 )
      ( MAKE-7PILE ?auto_76475 ?auto_76476 ?auto_76477 ?auto_76478 ?auto_76479 ?auto_76480 ?auto_76481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76483 - BLOCK
      ?auto_76484 - BLOCK
      ?auto_76485 - BLOCK
      ?auto_76486 - BLOCK
      ?auto_76487 - BLOCK
      ?auto_76488 - BLOCK
      ?auto_76489 - BLOCK
    )
    :vars
    (
      ?auto_76490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76483 ) ( ON ?auto_76484 ?auto_76483 ) ( not ( = ?auto_76483 ?auto_76484 ) ) ( not ( = ?auto_76483 ?auto_76485 ) ) ( not ( = ?auto_76483 ?auto_76486 ) ) ( not ( = ?auto_76483 ?auto_76487 ) ) ( not ( = ?auto_76483 ?auto_76488 ) ) ( not ( = ?auto_76483 ?auto_76489 ) ) ( not ( = ?auto_76484 ?auto_76485 ) ) ( not ( = ?auto_76484 ?auto_76486 ) ) ( not ( = ?auto_76484 ?auto_76487 ) ) ( not ( = ?auto_76484 ?auto_76488 ) ) ( not ( = ?auto_76484 ?auto_76489 ) ) ( not ( = ?auto_76485 ?auto_76486 ) ) ( not ( = ?auto_76485 ?auto_76487 ) ) ( not ( = ?auto_76485 ?auto_76488 ) ) ( not ( = ?auto_76485 ?auto_76489 ) ) ( not ( = ?auto_76486 ?auto_76487 ) ) ( not ( = ?auto_76486 ?auto_76488 ) ) ( not ( = ?auto_76486 ?auto_76489 ) ) ( not ( = ?auto_76487 ?auto_76488 ) ) ( not ( = ?auto_76487 ?auto_76489 ) ) ( not ( = ?auto_76488 ?auto_76489 ) ) ( ON ?auto_76489 ?auto_76490 ) ( not ( = ?auto_76483 ?auto_76490 ) ) ( not ( = ?auto_76484 ?auto_76490 ) ) ( not ( = ?auto_76485 ?auto_76490 ) ) ( not ( = ?auto_76486 ?auto_76490 ) ) ( not ( = ?auto_76487 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76490 ) ) ( not ( = ?auto_76489 ?auto_76490 ) ) ( ON ?auto_76488 ?auto_76489 ) ( ON-TABLE ?auto_76490 ) ( ON ?auto_76487 ?auto_76488 ) ( ON ?auto_76486 ?auto_76487 ) ( CLEAR ?auto_76486 ) ( HOLDING ?auto_76485 ) ( CLEAR ?auto_76484 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76483 ?auto_76484 ?auto_76485 )
      ( MAKE-7PILE ?auto_76483 ?auto_76484 ?auto_76485 ?auto_76486 ?auto_76487 ?auto_76488 ?auto_76489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76491 - BLOCK
      ?auto_76492 - BLOCK
      ?auto_76493 - BLOCK
      ?auto_76494 - BLOCK
      ?auto_76495 - BLOCK
      ?auto_76496 - BLOCK
      ?auto_76497 - BLOCK
    )
    :vars
    (
      ?auto_76498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76491 ) ( ON ?auto_76492 ?auto_76491 ) ( not ( = ?auto_76491 ?auto_76492 ) ) ( not ( = ?auto_76491 ?auto_76493 ) ) ( not ( = ?auto_76491 ?auto_76494 ) ) ( not ( = ?auto_76491 ?auto_76495 ) ) ( not ( = ?auto_76491 ?auto_76496 ) ) ( not ( = ?auto_76491 ?auto_76497 ) ) ( not ( = ?auto_76492 ?auto_76493 ) ) ( not ( = ?auto_76492 ?auto_76494 ) ) ( not ( = ?auto_76492 ?auto_76495 ) ) ( not ( = ?auto_76492 ?auto_76496 ) ) ( not ( = ?auto_76492 ?auto_76497 ) ) ( not ( = ?auto_76493 ?auto_76494 ) ) ( not ( = ?auto_76493 ?auto_76495 ) ) ( not ( = ?auto_76493 ?auto_76496 ) ) ( not ( = ?auto_76493 ?auto_76497 ) ) ( not ( = ?auto_76494 ?auto_76495 ) ) ( not ( = ?auto_76494 ?auto_76496 ) ) ( not ( = ?auto_76494 ?auto_76497 ) ) ( not ( = ?auto_76495 ?auto_76496 ) ) ( not ( = ?auto_76495 ?auto_76497 ) ) ( not ( = ?auto_76496 ?auto_76497 ) ) ( ON ?auto_76497 ?auto_76498 ) ( not ( = ?auto_76491 ?auto_76498 ) ) ( not ( = ?auto_76492 ?auto_76498 ) ) ( not ( = ?auto_76493 ?auto_76498 ) ) ( not ( = ?auto_76494 ?auto_76498 ) ) ( not ( = ?auto_76495 ?auto_76498 ) ) ( not ( = ?auto_76496 ?auto_76498 ) ) ( not ( = ?auto_76497 ?auto_76498 ) ) ( ON ?auto_76496 ?auto_76497 ) ( ON-TABLE ?auto_76498 ) ( ON ?auto_76495 ?auto_76496 ) ( ON ?auto_76494 ?auto_76495 ) ( CLEAR ?auto_76492 ) ( ON ?auto_76493 ?auto_76494 ) ( CLEAR ?auto_76493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76498 ?auto_76497 ?auto_76496 ?auto_76495 ?auto_76494 )
      ( MAKE-7PILE ?auto_76491 ?auto_76492 ?auto_76493 ?auto_76494 ?auto_76495 ?auto_76496 ?auto_76497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76499 - BLOCK
      ?auto_76500 - BLOCK
      ?auto_76501 - BLOCK
      ?auto_76502 - BLOCK
      ?auto_76503 - BLOCK
      ?auto_76504 - BLOCK
      ?auto_76505 - BLOCK
    )
    :vars
    (
      ?auto_76506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76499 ) ( not ( = ?auto_76499 ?auto_76500 ) ) ( not ( = ?auto_76499 ?auto_76501 ) ) ( not ( = ?auto_76499 ?auto_76502 ) ) ( not ( = ?auto_76499 ?auto_76503 ) ) ( not ( = ?auto_76499 ?auto_76504 ) ) ( not ( = ?auto_76499 ?auto_76505 ) ) ( not ( = ?auto_76500 ?auto_76501 ) ) ( not ( = ?auto_76500 ?auto_76502 ) ) ( not ( = ?auto_76500 ?auto_76503 ) ) ( not ( = ?auto_76500 ?auto_76504 ) ) ( not ( = ?auto_76500 ?auto_76505 ) ) ( not ( = ?auto_76501 ?auto_76502 ) ) ( not ( = ?auto_76501 ?auto_76503 ) ) ( not ( = ?auto_76501 ?auto_76504 ) ) ( not ( = ?auto_76501 ?auto_76505 ) ) ( not ( = ?auto_76502 ?auto_76503 ) ) ( not ( = ?auto_76502 ?auto_76504 ) ) ( not ( = ?auto_76502 ?auto_76505 ) ) ( not ( = ?auto_76503 ?auto_76504 ) ) ( not ( = ?auto_76503 ?auto_76505 ) ) ( not ( = ?auto_76504 ?auto_76505 ) ) ( ON ?auto_76505 ?auto_76506 ) ( not ( = ?auto_76499 ?auto_76506 ) ) ( not ( = ?auto_76500 ?auto_76506 ) ) ( not ( = ?auto_76501 ?auto_76506 ) ) ( not ( = ?auto_76502 ?auto_76506 ) ) ( not ( = ?auto_76503 ?auto_76506 ) ) ( not ( = ?auto_76504 ?auto_76506 ) ) ( not ( = ?auto_76505 ?auto_76506 ) ) ( ON ?auto_76504 ?auto_76505 ) ( ON-TABLE ?auto_76506 ) ( ON ?auto_76503 ?auto_76504 ) ( ON ?auto_76502 ?auto_76503 ) ( ON ?auto_76501 ?auto_76502 ) ( CLEAR ?auto_76501 ) ( HOLDING ?auto_76500 ) ( CLEAR ?auto_76499 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76499 ?auto_76500 )
      ( MAKE-7PILE ?auto_76499 ?auto_76500 ?auto_76501 ?auto_76502 ?auto_76503 ?auto_76504 ?auto_76505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76507 - BLOCK
      ?auto_76508 - BLOCK
      ?auto_76509 - BLOCK
      ?auto_76510 - BLOCK
      ?auto_76511 - BLOCK
      ?auto_76512 - BLOCK
      ?auto_76513 - BLOCK
    )
    :vars
    (
      ?auto_76514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76507 ) ( not ( = ?auto_76507 ?auto_76508 ) ) ( not ( = ?auto_76507 ?auto_76509 ) ) ( not ( = ?auto_76507 ?auto_76510 ) ) ( not ( = ?auto_76507 ?auto_76511 ) ) ( not ( = ?auto_76507 ?auto_76512 ) ) ( not ( = ?auto_76507 ?auto_76513 ) ) ( not ( = ?auto_76508 ?auto_76509 ) ) ( not ( = ?auto_76508 ?auto_76510 ) ) ( not ( = ?auto_76508 ?auto_76511 ) ) ( not ( = ?auto_76508 ?auto_76512 ) ) ( not ( = ?auto_76508 ?auto_76513 ) ) ( not ( = ?auto_76509 ?auto_76510 ) ) ( not ( = ?auto_76509 ?auto_76511 ) ) ( not ( = ?auto_76509 ?auto_76512 ) ) ( not ( = ?auto_76509 ?auto_76513 ) ) ( not ( = ?auto_76510 ?auto_76511 ) ) ( not ( = ?auto_76510 ?auto_76512 ) ) ( not ( = ?auto_76510 ?auto_76513 ) ) ( not ( = ?auto_76511 ?auto_76512 ) ) ( not ( = ?auto_76511 ?auto_76513 ) ) ( not ( = ?auto_76512 ?auto_76513 ) ) ( ON ?auto_76513 ?auto_76514 ) ( not ( = ?auto_76507 ?auto_76514 ) ) ( not ( = ?auto_76508 ?auto_76514 ) ) ( not ( = ?auto_76509 ?auto_76514 ) ) ( not ( = ?auto_76510 ?auto_76514 ) ) ( not ( = ?auto_76511 ?auto_76514 ) ) ( not ( = ?auto_76512 ?auto_76514 ) ) ( not ( = ?auto_76513 ?auto_76514 ) ) ( ON ?auto_76512 ?auto_76513 ) ( ON-TABLE ?auto_76514 ) ( ON ?auto_76511 ?auto_76512 ) ( ON ?auto_76510 ?auto_76511 ) ( ON ?auto_76509 ?auto_76510 ) ( CLEAR ?auto_76507 ) ( ON ?auto_76508 ?auto_76509 ) ( CLEAR ?auto_76508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76514 ?auto_76513 ?auto_76512 ?auto_76511 ?auto_76510 ?auto_76509 )
      ( MAKE-7PILE ?auto_76507 ?auto_76508 ?auto_76509 ?auto_76510 ?auto_76511 ?auto_76512 ?auto_76513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76515 - BLOCK
      ?auto_76516 - BLOCK
      ?auto_76517 - BLOCK
      ?auto_76518 - BLOCK
      ?auto_76519 - BLOCK
      ?auto_76520 - BLOCK
      ?auto_76521 - BLOCK
    )
    :vars
    (
      ?auto_76522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76515 ?auto_76516 ) ) ( not ( = ?auto_76515 ?auto_76517 ) ) ( not ( = ?auto_76515 ?auto_76518 ) ) ( not ( = ?auto_76515 ?auto_76519 ) ) ( not ( = ?auto_76515 ?auto_76520 ) ) ( not ( = ?auto_76515 ?auto_76521 ) ) ( not ( = ?auto_76516 ?auto_76517 ) ) ( not ( = ?auto_76516 ?auto_76518 ) ) ( not ( = ?auto_76516 ?auto_76519 ) ) ( not ( = ?auto_76516 ?auto_76520 ) ) ( not ( = ?auto_76516 ?auto_76521 ) ) ( not ( = ?auto_76517 ?auto_76518 ) ) ( not ( = ?auto_76517 ?auto_76519 ) ) ( not ( = ?auto_76517 ?auto_76520 ) ) ( not ( = ?auto_76517 ?auto_76521 ) ) ( not ( = ?auto_76518 ?auto_76519 ) ) ( not ( = ?auto_76518 ?auto_76520 ) ) ( not ( = ?auto_76518 ?auto_76521 ) ) ( not ( = ?auto_76519 ?auto_76520 ) ) ( not ( = ?auto_76519 ?auto_76521 ) ) ( not ( = ?auto_76520 ?auto_76521 ) ) ( ON ?auto_76521 ?auto_76522 ) ( not ( = ?auto_76515 ?auto_76522 ) ) ( not ( = ?auto_76516 ?auto_76522 ) ) ( not ( = ?auto_76517 ?auto_76522 ) ) ( not ( = ?auto_76518 ?auto_76522 ) ) ( not ( = ?auto_76519 ?auto_76522 ) ) ( not ( = ?auto_76520 ?auto_76522 ) ) ( not ( = ?auto_76521 ?auto_76522 ) ) ( ON ?auto_76520 ?auto_76521 ) ( ON-TABLE ?auto_76522 ) ( ON ?auto_76519 ?auto_76520 ) ( ON ?auto_76518 ?auto_76519 ) ( ON ?auto_76517 ?auto_76518 ) ( ON ?auto_76516 ?auto_76517 ) ( CLEAR ?auto_76516 ) ( HOLDING ?auto_76515 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76515 )
      ( MAKE-7PILE ?auto_76515 ?auto_76516 ?auto_76517 ?auto_76518 ?auto_76519 ?auto_76520 ?auto_76521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_76523 - BLOCK
      ?auto_76524 - BLOCK
      ?auto_76525 - BLOCK
      ?auto_76526 - BLOCK
      ?auto_76527 - BLOCK
      ?auto_76528 - BLOCK
      ?auto_76529 - BLOCK
    )
    :vars
    (
      ?auto_76530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76523 ?auto_76524 ) ) ( not ( = ?auto_76523 ?auto_76525 ) ) ( not ( = ?auto_76523 ?auto_76526 ) ) ( not ( = ?auto_76523 ?auto_76527 ) ) ( not ( = ?auto_76523 ?auto_76528 ) ) ( not ( = ?auto_76523 ?auto_76529 ) ) ( not ( = ?auto_76524 ?auto_76525 ) ) ( not ( = ?auto_76524 ?auto_76526 ) ) ( not ( = ?auto_76524 ?auto_76527 ) ) ( not ( = ?auto_76524 ?auto_76528 ) ) ( not ( = ?auto_76524 ?auto_76529 ) ) ( not ( = ?auto_76525 ?auto_76526 ) ) ( not ( = ?auto_76525 ?auto_76527 ) ) ( not ( = ?auto_76525 ?auto_76528 ) ) ( not ( = ?auto_76525 ?auto_76529 ) ) ( not ( = ?auto_76526 ?auto_76527 ) ) ( not ( = ?auto_76526 ?auto_76528 ) ) ( not ( = ?auto_76526 ?auto_76529 ) ) ( not ( = ?auto_76527 ?auto_76528 ) ) ( not ( = ?auto_76527 ?auto_76529 ) ) ( not ( = ?auto_76528 ?auto_76529 ) ) ( ON ?auto_76529 ?auto_76530 ) ( not ( = ?auto_76523 ?auto_76530 ) ) ( not ( = ?auto_76524 ?auto_76530 ) ) ( not ( = ?auto_76525 ?auto_76530 ) ) ( not ( = ?auto_76526 ?auto_76530 ) ) ( not ( = ?auto_76527 ?auto_76530 ) ) ( not ( = ?auto_76528 ?auto_76530 ) ) ( not ( = ?auto_76529 ?auto_76530 ) ) ( ON ?auto_76528 ?auto_76529 ) ( ON-TABLE ?auto_76530 ) ( ON ?auto_76527 ?auto_76528 ) ( ON ?auto_76526 ?auto_76527 ) ( ON ?auto_76525 ?auto_76526 ) ( ON ?auto_76524 ?auto_76525 ) ( ON ?auto_76523 ?auto_76524 ) ( CLEAR ?auto_76523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76530 ?auto_76529 ?auto_76528 ?auto_76527 ?auto_76526 ?auto_76525 ?auto_76524 )
      ( MAKE-7PILE ?auto_76523 ?auto_76524 ?auto_76525 ?auto_76526 ?auto_76527 ?auto_76528 ?auto_76529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76537 - BLOCK
      ?auto_76538 - BLOCK
      ?auto_76539 - BLOCK
      ?auto_76540 - BLOCK
      ?auto_76541 - BLOCK
      ?auto_76542 - BLOCK
    )
    :vars
    (
      ?auto_76543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76543 ?auto_76542 ) ( CLEAR ?auto_76543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76537 ) ( ON ?auto_76538 ?auto_76537 ) ( ON ?auto_76539 ?auto_76538 ) ( ON ?auto_76540 ?auto_76539 ) ( ON ?auto_76541 ?auto_76540 ) ( ON ?auto_76542 ?auto_76541 ) ( not ( = ?auto_76537 ?auto_76538 ) ) ( not ( = ?auto_76537 ?auto_76539 ) ) ( not ( = ?auto_76537 ?auto_76540 ) ) ( not ( = ?auto_76537 ?auto_76541 ) ) ( not ( = ?auto_76537 ?auto_76542 ) ) ( not ( = ?auto_76537 ?auto_76543 ) ) ( not ( = ?auto_76538 ?auto_76539 ) ) ( not ( = ?auto_76538 ?auto_76540 ) ) ( not ( = ?auto_76538 ?auto_76541 ) ) ( not ( = ?auto_76538 ?auto_76542 ) ) ( not ( = ?auto_76538 ?auto_76543 ) ) ( not ( = ?auto_76539 ?auto_76540 ) ) ( not ( = ?auto_76539 ?auto_76541 ) ) ( not ( = ?auto_76539 ?auto_76542 ) ) ( not ( = ?auto_76539 ?auto_76543 ) ) ( not ( = ?auto_76540 ?auto_76541 ) ) ( not ( = ?auto_76540 ?auto_76542 ) ) ( not ( = ?auto_76540 ?auto_76543 ) ) ( not ( = ?auto_76541 ?auto_76542 ) ) ( not ( = ?auto_76541 ?auto_76543 ) ) ( not ( = ?auto_76542 ?auto_76543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76543 ?auto_76542 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76559 - BLOCK
      ?auto_76560 - BLOCK
      ?auto_76561 - BLOCK
      ?auto_76562 - BLOCK
      ?auto_76563 - BLOCK
      ?auto_76564 - BLOCK
    )
    :vars
    (
      ?auto_76565 - BLOCK
      ?auto_76566 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76559 ) ( ON ?auto_76560 ?auto_76559 ) ( ON ?auto_76561 ?auto_76560 ) ( ON ?auto_76562 ?auto_76561 ) ( ON ?auto_76563 ?auto_76562 ) ( not ( = ?auto_76559 ?auto_76560 ) ) ( not ( = ?auto_76559 ?auto_76561 ) ) ( not ( = ?auto_76559 ?auto_76562 ) ) ( not ( = ?auto_76559 ?auto_76563 ) ) ( not ( = ?auto_76559 ?auto_76564 ) ) ( not ( = ?auto_76559 ?auto_76565 ) ) ( not ( = ?auto_76560 ?auto_76561 ) ) ( not ( = ?auto_76560 ?auto_76562 ) ) ( not ( = ?auto_76560 ?auto_76563 ) ) ( not ( = ?auto_76560 ?auto_76564 ) ) ( not ( = ?auto_76560 ?auto_76565 ) ) ( not ( = ?auto_76561 ?auto_76562 ) ) ( not ( = ?auto_76561 ?auto_76563 ) ) ( not ( = ?auto_76561 ?auto_76564 ) ) ( not ( = ?auto_76561 ?auto_76565 ) ) ( not ( = ?auto_76562 ?auto_76563 ) ) ( not ( = ?auto_76562 ?auto_76564 ) ) ( not ( = ?auto_76562 ?auto_76565 ) ) ( not ( = ?auto_76563 ?auto_76564 ) ) ( not ( = ?auto_76563 ?auto_76565 ) ) ( not ( = ?auto_76564 ?auto_76565 ) ) ( ON ?auto_76565 ?auto_76566 ) ( CLEAR ?auto_76565 ) ( not ( = ?auto_76559 ?auto_76566 ) ) ( not ( = ?auto_76560 ?auto_76566 ) ) ( not ( = ?auto_76561 ?auto_76566 ) ) ( not ( = ?auto_76562 ?auto_76566 ) ) ( not ( = ?auto_76563 ?auto_76566 ) ) ( not ( = ?auto_76564 ?auto_76566 ) ) ( not ( = ?auto_76565 ?auto_76566 ) ) ( HOLDING ?auto_76564 ) ( CLEAR ?auto_76563 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76559 ?auto_76560 ?auto_76561 ?auto_76562 ?auto_76563 ?auto_76564 ?auto_76565 )
      ( MAKE-6PILE ?auto_76559 ?auto_76560 ?auto_76561 ?auto_76562 ?auto_76563 ?auto_76564 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76567 - BLOCK
      ?auto_76568 - BLOCK
      ?auto_76569 - BLOCK
      ?auto_76570 - BLOCK
      ?auto_76571 - BLOCK
      ?auto_76572 - BLOCK
    )
    :vars
    (
      ?auto_76574 - BLOCK
      ?auto_76573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76567 ) ( ON ?auto_76568 ?auto_76567 ) ( ON ?auto_76569 ?auto_76568 ) ( ON ?auto_76570 ?auto_76569 ) ( ON ?auto_76571 ?auto_76570 ) ( not ( = ?auto_76567 ?auto_76568 ) ) ( not ( = ?auto_76567 ?auto_76569 ) ) ( not ( = ?auto_76567 ?auto_76570 ) ) ( not ( = ?auto_76567 ?auto_76571 ) ) ( not ( = ?auto_76567 ?auto_76572 ) ) ( not ( = ?auto_76567 ?auto_76574 ) ) ( not ( = ?auto_76568 ?auto_76569 ) ) ( not ( = ?auto_76568 ?auto_76570 ) ) ( not ( = ?auto_76568 ?auto_76571 ) ) ( not ( = ?auto_76568 ?auto_76572 ) ) ( not ( = ?auto_76568 ?auto_76574 ) ) ( not ( = ?auto_76569 ?auto_76570 ) ) ( not ( = ?auto_76569 ?auto_76571 ) ) ( not ( = ?auto_76569 ?auto_76572 ) ) ( not ( = ?auto_76569 ?auto_76574 ) ) ( not ( = ?auto_76570 ?auto_76571 ) ) ( not ( = ?auto_76570 ?auto_76572 ) ) ( not ( = ?auto_76570 ?auto_76574 ) ) ( not ( = ?auto_76571 ?auto_76572 ) ) ( not ( = ?auto_76571 ?auto_76574 ) ) ( not ( = ?auto_76572 ?auto_76574 ) ) ( ON ?auto_76574 ?auto_76573 ) ( not ( = ?auto_76567 ?auto_76573 ) ) ( not ( = ?auto_76568 ?auto_76573 ) ) ( not ( = ?auto_76569 ?auto_76573 ) ) ( not ( = ?auto_76570 ?auto_76573 ) ) ( not ( = ?auto_76571 ?auto_76573 ) ) ( not ( = ?auto_76572 ?auto_76573 ) ) ( not ( = ?auto_76574 ?auto_76573 ) ) ( CLEAR ?auto_76571 ) ( ON ?auto_76572 ?auto_76574 ) ( CLEAR ?auto_76572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76573 ?auto_76574 )
      ( MAKE-6PILE ?auto_76567 ?auto_76568 ?auto_76569 ?auto_76570 ?auto_76571 ?auto_76572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76575 - BLOCK
      ?auto_76576 - BLOCK
      ?auto_76577 - BLOCK
      ?auto_76578 - BLOCK
      ?auto_76579 - BLOCK
      ?auto_76580 - BLOCK
    )
    :vars
    (
      ?auto_76582 - BLOCK
      ?auto_76581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76575 ) ( ON ?auto_76576 ?auto_76575 ) ( ON ?auto_76577 ?auto_76576 ) ( ON ?auto_76578 ?auto_76577 ) ( not ( = ?auto_76575 ?auto_76576 ) ) ( not ( = ?auto_76575 ?auto_76577 ) ) ( not ( = ?auto_76575 ?auto_76578 ) ) ( not ( = ?auto_76575 ?auto_76579 ) ) ( not ( = ?auto_76575 ?auto_76580 ) ) ( not ( = ?auto_76575 ?auto_76582 ) ) ( not ( = ?auto_76576 ?auto_76577 ) ) ( not ( = ?auto_76576 ?auto_76578 ) ) ( not ( = ?auto_76576 ?auto_76579 ) ) ( not ( = ?auto_76576 ?auto_76580 ) ) ( not ( = ?auto_76576 ?auto_76582 ) ) ( not ( = ?auto_76577 ?auto_76578 ) ) ( not ( = ?auto_76577 ?auto_76579 ) ) ( not ( = ?auto_76577 ?auto_76580 ) ) ( not ( = ?auto_76577 ?auto_76582 ) ) ( not ( = ?auto_76578 ?auto_76579 ) ) ( not ( = ?auto_76578 ?auto_76580 ) ) ( not ( = ?auto_76578 ?auto_76582 ) ) ( not ( = ?auto_76579 ?auto_76580 ) ) ( not ( = ?auto_76579 ?auto_76582 ) ) ( not ( = ?auto_76580 ?auto_76582 ) ) ( ON ?auto_76582 ?auto_76581 ) ( not ( = ?auto_76575 ?auto_76581 ) ) ( not ( = ?auto_76576 ?auto_76581 ) ) ( not ( = ?auto_76577 ?auto_76581 ) ) ( not ( = ?auto_76578 ?auto_76581 ) ) ( not ( = ?auto_76579 ?auto_76581 ) ) ( not ( = ?auto_76580 ?auto_76581 ) ) ( not ( = ?auto_76582 ?auto_76581 ) ) ( ON ?auto_76580 ?auto_76582 ) ( CLEAR ?auto_76580 ) ( ON-TABLE ?auto_76581 ) ( HOLDING ?auto_76579 ) ( CLEAR ?auto_76578 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76575 ?auto_76576 ?auto_76577 ?auto_76578 ?auto_76579 )
      ( MAKE-6PILE ?auto_76575 ?auto_76576 ?auto_76577 ?auto_76578 ?auto_76579 ?auto_76580 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76583 - BLOCK
      ?auto_76584 - BLOCK
      ?auto_76585 - BLOCK
      ?auto_76586 - BLOCK
      ?auto_76587 - BLOCK
      ?auto_76588 - BLOCK
    )
    :vars
    (
      ?auto_76590 - BLOCK
      ?auto_76589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76583 ) ( ON ?auto_76584 ?auto_76583 ) ( ON ?auto_76585 ?auto_76584 ) ( ON ?auto_76586 ?auto_76585 ) ( not ( = ?auto_76583 ?auto_76584 ) ) ( not ( = ?auto_76583 ?auto_76585 ) ) ( not ( = ?auto_76583 ?auto_76586 ) ) ( not ( = ?auto_76583 ?auto_76587 ) ) ( not ( = ?auto_76583 ?auto_76588 ) ) ( not ( = ?auto_76583 ?auto_76590 ) ) ( not ( = ?auto_76584 ?auto_76585 ) ) ( not ( = ?auto_76584 ?auto_76586 ) ) ( not ( = ?auto_76584 ?auto_76587 ) ) ( not ( = ?auto_76584 ?auto_76588 ) ) ( not ( = ?auto_76584 ?auto_76590 ) ) ( not ( = ?auto_76585 ?auto_76586 ) ) ( not ( = ?auto_76585 ?auto_76587 ) ) ( not ( = ?auto_76585 ?auto_76588 ) ) ( not ( = ?auto_76585 ?auto_76590 ) ) ( not ( = ?auto_76586 ?auto_76587 ) ) ( not ( = ?auto_76586 ?auto_76588 ) ) ( not ( = ?auto_76586 ?auto_76590 ) ) ( not ( = ?auto_76587 ?auto_76588 ) ) ( not ( = ?auto_76587 ?auto_76590 ) ) ( not ( = ?auto_76588 ?auto_76590 ) ) ( ON ?auto_76590 ?auto_76589 ) ( not ( = ?auto_76583 ?auto_76589 ) ) ( not ( = ?auto_76584 ?auto_76589 ) ) ( not ( = ?auto_76585 ?auto_76589 ) ) ( not ( = ?auto_76586 ?auto_76589 ) ) ( not ( = ?auto_76587 ?auto_76589 ) ) ( not ( = ?auto_76588 ?auto_76589 ) ) ( not ( = ?auto_76590 ?auto_76589 ) ) ( ON ?auto_76588 ?auto_76590 ) ( ON-TABLE ?auto_76589 ) ( CLEAR ?auto_76586 ) ( ON ?auto_76587 ?auto_76588 ) ( CLEAR ?auto_76587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76589 ?auto_76590 ?auto_76588 )
      ( MAKE-6PILE ?auto_76583 ?auto_76584 ?auto_76585 ?auto_76586 ?auto_76587 ?auto_76588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76591 - BLOCK
      ?auto_76592 - BLOCK
      ?auto_76593 - BLOCK
      ?auto_76594 - BLOCK
      ?auto_76595 - BLOCK
      ?auto_76596 - BLOCK
    )
    :vars
    (
      ?auto_76597 - BLOCK
      ?auto_76598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76591 ) ( ON ?auto_76592 ?auto_76591 ) ( ON ?auto_76593 ?auto_76592 ) ( not ( = ?auto_76591 ?auto_76592 ) ) ( not ( = ?auto_76591 ?auto_76593 ) ) ( not ( = ?auto_76591 ?auto_76594 ) ) ( not ( = ?auto_76591 ?auto_76595 ) ) ( not ( = ?auto_76591 ?auto_76596 ) ) ( not ( = ?auto_76591 ?auto_76597 ) ) ( not ( = ?auto_76592 ?auto_76593 ) ) ( not ( = ?auto_76592 ?auto_76594 ) ) ( not ( = ?auto_76592 ?auto_76595 ) ) ( not ( = ?auto_76592 ?auto_76596 ) ) ( not ( = ?auto_76592 ?auto_76597 ) ) ( not ( = ?auto_76593 ?auto_76594 ) ) ( not ( = ?auto_76593 ?auto_76595 ) ) ( not ( = ?auto_76593 ?auto_76596 ) ) ( not ( = ?auto_76593 ?auto_76597 ) ) ( not ( = ?auto_76594 ?auto_76595 ) ) ( not ( = ?auto_76594 ?auto_76596 ) ) ( not ( = ?auto_76594 ?auto_76597 ) ) ( not ( = ?auto_76595 ?auto_76596 ) ) ( not ( = ?auto_76595 ?auto_76597 ) ) ( not ( = ?auto_76596 ?auto_76597 ) ) ( ON ?auto_76597 ?auto_76598 ) ( not ( = ?auto_76591 ?auto_76598 ) ) ( not ( = ?auto_76592 ?auto_76598 ) ) ( not ( = ?auto_76593 ?auto_76598 ) ) ( not ( = ?auto_76594 ?auto_76598 ) ) ( not ( = ?auto_76595 ?auto_76598 ) ) ( not ( = ?auto_76596 ?auto_76598 ) ) ( not ( = ?auto_76597 ?auto_76598 ) ) ( ON ?auto_76596 ?auto_76597 ) ( ON-TABLE ?auto_76598 ) ( ON ?auto_76595 ?auto_76596 ) ( CLEAR ?auto_76595 ) ( HOLDING ?auto_76594 ) ( CLEAR ?auto_76593 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76591 ?auto_76592 ?auto_76593 ?auto_76594 )
      ( MAKE-6PILE ?auto_76591 ?auto_76592 ?auto_76593 ?auto_76594 ?auto_76595 ?auto_76596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76599 - BLOCK
      ?auto_76600 - BLOCK
      ?auto_76601 - BLOCK
      ?auto_76602 - BLOCK
      ?auto_76603 - BLOCK
      ?auto_76604 - BLOCK
    )
    :vars
    (
      ?auto_76605 - BLOCK
      ?auto_76606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76599 ) ( ON ?auto_76600 ?auto_76599 ) ( ON ?auto_76601 ?auto_76600 ) ( not ( = ?auto_76599 ?auto_76600 ) ) ( not ( = ?auto_76599 ?auto_76601 ) ) ( not ( = ?auto_76599 ?auto_76602 ) ) ( not ( = ?auto_76599 ?auto_76603 ) ) ( not ( = ?auto_76599 ?auto_76604 ) ) ( not ( = ?auto_76599 ?auto_76605 ) ) ( not ( = ?auto_76600 ?auto_76601 ) ) ( not ( = ?auto_76600 ?auto_76602 ) ) ( not ( = ?auto_76600 ?auto_76603 ) ) ( not ( = ?auto_76600 ?auto_76604 ) ) ( not ( = ?auto_76600 ?auto_76605 ) ) ( not ( = ?auto_76601 ?auto_76602 ) ) ( not ( = ?auto_76601 ?auto_76603 ) ) ( not ( = ?auto_76601 ?auto_76604 ) ) ( not ( = ?auto_76601 ?auto_76605 ) ) ( not ( = ?auto_76602 ?auto_76603 ) ) ( not ( = ?auto_76602 ?auto_76604 ) ) ( not ( = ?auto_76602 ?auto_76605 ) ) ( not ( = ?auto_76603 ?auto_76604 ) ) ( not ( = ?auto_76603 ?auto_76605 ) ) ( not ( = ?auto_76604 ?auto_76605 ) ) ( ON ?auto_76605 ?auto_76606 ) ( not ( = ?auto_76599 ?auto_76606 ) ) ( not ( = ?auto_76600 ?auto_76606 ) ) ( not ( = ?auto_76601 ?auto_76606 ) ) ( not ( = ?auto_76602 ?auto_76606 ) ) ( not ( = ?auto_76603 ?auto_76606 ) ) ( not ( = ?auto_76604 ?auto_76606 ) ) ( not ( = ?auto_76605 ?auto_76606 ) ) ( ON ?auto_76604 ?auto_76605 ) ( ON-TABLE ?auto_76606 ) ( ON ?auto_76603 ?auto_76604 ) ( CLEAR ?auto_76601 ) ( ON ?auto_76602 ?auto_76603 ) ( CLEAR ?auto_76602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76606 ?auto_76605 ?auto_76604 ?auto_76603 )
      ( MAKE-6PILE ?auto_76599 ?auto_76600 ?auto_76601 ?auto_76602 ?auto_76603 ?auto_76604 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76607 - BLOCK
      ?auto_76608 - BLOCK
      ?auto_76609 - BLOCK
      ?auto_76610 - BLOCK
      ?auto_76611 - BLOCK
      ?auto_76612 - BLOCK
    )
    :vars
    (
      ?auto_76614 - BLOCK
      ?auto_76613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76607 ) ( ON ?auto_76608 ?auto_76607 ) ( not ( = ?auto_76607 ?auto_76608 ) ) ( not ( = ?auto_76607 ?auto_76609 ) ) ( not ( = ?auto_76607 ?auto_76610 ) ) ( not ( = ?auto_76607 ?auto_76611 ) ) ( not ( = ?auto_76607 ?auto_76612 ) ) ( not ( = ?auto_76607 ?auto_76614 ) ) ( not ( = ?auto_76608 ?auto_76609 ) ) ( not ( = ?auto_76608 ?auto_76610 ) ) ( not ( = ?auto_76608 ?auto_76611 ) ) ( not ( = ?auto_76608 ?auto_76612 ) ) ( not ( = ?auto_76608 ?auto_76614 ) ) ( not ( = ?auto_76609 ?auto_76610 ) ) ( not ( = ?auto_76609 ?auto_76611 ) ) ( not ( = ?auto_76609 ?auto_76612 ) ) ( not ( = ?auto_76609 ?auto_76614 ) ) ( not ( = ?auto_76610 ?auto_76611 ) ) ( not ( = ?auto_76610 ?auto_76612 ) ) ( not ( = ?auto_76610 ?auto_76614 ) ) ( not ( = ?auto_76611 ?auto_76612 ) ) ( not ( = ?auto_76611 ?auto_76614 ) ) ( not ( = ?auto_76612 ?auto_76614 ) ) ( ON ?auto_76614 ?auto_76613 ) ( not ( = ?auto_76607 ?auto_76613 ) ) ( not ( = ?auto_76608 ?auto_76613 ) ) ( not ( = ?auto_76609 ?auto_76613 ) ) ( not ( = ?auto_76610 ?auto_76613 ) ) ( not ( = ?auto_76611 ?auto_76613 ) ) ( not ( = ?auto_76612 ?auto_76613 ) ) ( not ( = ?auto_76614 ?auto_76613 ) ) ( ON ?auto_76612 ?auto_76614 ) ( ON-TABLE ?auto_76613 ) ( ON ?auto_76611 ?auto_76612 ) ( ON ?auto_76610 ?auto_76611 ) ( CLEAR ?auto_76610 ) ( HOLDING ?auto_76609 ) ( CLEAR ?auto_76608 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76607 ?auto_76608 ?auto_76609 )
      ( MAKE-6PILE ?auto_76607 ?auto_76608 ?auto_76609 ?auto_76610 ?auto_76611 ?auto_76612 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76615 - BLOCK
      ?auto_76616 - BLOCK
      ?auto_76617 - BLOCK
      ?auto_76618 - BLOCK
      ?auto_76619 - BLOCK
      ?auto_76620 - BLOCK
    )
    :vars
    (
      ?auto_76622 - BLOCK
      ?auto_76621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76615 ) ( ON ?auto_76616 ?auto_76615 ) ( not ( = ?auto_76615 ?auto_76616 ) ) ( not ( = ?auto_76615 ?auto_76617 ) ) ( not ( = ?auto_76615 ?auto_76618 ) ) ( not ( = ?auto_76615 ?auto_76619 ) ) ( not ( = ?auto_76615 ?auto_76620 ) ) ( not ( = ?auto_76615 ?auto_76622 ) ) ( not ( = ?auto_76616 ?auto_76617 ) ) ( not ( = ?auto_76616 ?auto_76618 ) ) ( not ( = ?auto_76616 ?auto_76619 ) ) ( not ( = ?auto_76616 ?auto_76620 ) ) ( not ( = ?auto_76616 ?auto_76622 ) ) ( not ( = ?auto_76617 ?auto_76618 ) ) ( not ( = ?auto_76617 ?auto_76619 ) ) ( not ( = ?auto_76617 ?auto_76620 ) ) ( not ( = ?auto_76617 ?auto_76622 ) ) ( not ( = ?auto_76618 ?auto_76619 ) ) ( not ( = ?auto_76618 ?auto_76620 ) ) ( not ( = ?auto_76618 ?auto_76622 ) ) ( not ( = ?auto_76619 ?auto_76620 ) ) ( not ( = ?auto_76619 ?auto_76622 ) ) ( not ( = ?auto_76620 ?auto_76622 ) ) ( ON ?auto_76622 ?auto_76621 ) ( not ( = ?auto_76615 ?auto_76621 ) ) ( not ( = ?auto_76616 ?auto_76621 ) ) ( not ( = ?auto_76617 ?auto_76621 ) ) ( not ( = ?auto_76618 ?auto_76621 ) ) ( not ( = ?auto_76619 ?auto_76621 ) ) ( not ( = ?auto_76620 ?auto_76621 ) ) ( not ( = ?auto_76622 ?auto_76621 ) ) ( ON ?auto_76620 ?auto_76622 ) ( ON-TABLE ?auto_76621 ) ( ON ?auto_76619 ?auto_76620 ) ( ON ?auto_76618 ?auto_76619 ) ( CLEAR ?auto_76616 ) ( ON ?auto_76617 ?auto_76618 ) ( CLEAR ?auto_76617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76621 ?auto_76622 ?auto_76620 ?auto_76619 ?auto_76618 )
      ( MAKE-6PILE ?auto_76615 ?auto_76616 ?auto_76617 ?auto_76618 ?auto_76619 ?auto_76620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76623 - BLOCK
      ?auto_76624 - BLOCK
      ?auto_76625 - BLOCK
      ?auto_76626 - BLOCK
      ?auto_76627 - BLOCK
      ?auto_76628 - BLOCK
    )
    :vars
    (
      ?auto_76630 - BLOCK
      ?auto_76629 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76623 ) ( not ( = ?auto_76623 ?auto_76624 ) ) ( not ( = ?auto_76623 ?auto_76625 ) ) ( not ( = ?auto_76623 ?auto_76626 ) ) ( not ( = ?auto_76623 ?auto_76627 ) ) ( not ( = ?auto_76623 ?auto_76628 ) ) ( not ( = ?auto_76623 ?auto_76630 ) ) ( not ( = ?auto_76624 ?auto_76625 ) ) ( not ( = ?auto_76624 ?auto_76626 ) ) ( not ( = ?auto_76624 ?auto_76627 ) ) ( not ( = ?auto_76624 ?auto_76628 ) ) ( not ( = ?auto_76624 ?auto_76630 ) ) ( not ( = ?auto_76625 ?auto_76626 ) ) ( not ( = ?auto_76625 ?auto_76627 ) ) ( not ( = ?auto_76625 ?auto_76628 ) ) ( not ( = ?auto_76625 ?auto_76630 ) ) ( not ( = ?auto_76626 ?auto_76627 ) ) ( not ( = ?auto_76626 ?auto_76628 ) ) ( not ( = ?auto_76626 ?auto_76630 ) ) ( not ( = ?auto_76627 ?auto_76628 ) ) ( not ( = ?auto_76627 ?auto_76630 ) ) ( not ( = ?auto_76628 ?auto_76630 ) ) ( ON ?auto_76630 ?auto_76629 ) ( not ( = ?auto_76623 ?auto_76629 ) ) ( not ( = ?auto_76624 ?auto_76629 ) ) ( not ( = ?auto_76625 ?auto_76629 ) ) ( not ( = ?auto_76626 ?auto_76629 ) ) ( not ( = ?auto_76627 ?auto_76629 ) ) ( not ( = ?auto_76628 ?auto_76629 ) ) ( not ( = ?auto_76630 ?auto_76629 ) ) ( ON ?auto_76628 ?auto_76630 ) ( ON-TABLE ?auto_76629 ) ( ON ?auto_76627 ?auto_76628 ) ( ON ?auto_76626 ?auto_76627 ) ( ON ?auto_76625 ?auto_76626 ) ( CLEAR ?auto_76625 ) ( HOLDING ?auto_76624 ) ( CLEAR ?auto_76623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76623 ?auto_76624 )
      ( MAKE-6PILE ?auto_76623 ?auto_76624 ?auto_76625 ?auto_76626 ?auto_76627 ?auto_76628 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76631 - BLOCK
      ?auto_76632 - BLOCK
      ?auto_76633 - BLOCK
      ?auto_76634 - BLOCK
      ?auto_76635 - BLOCK
      ?auto_76636 - BLOCK
    )
    :vars
    (
      ?auto_76638 - BLOCK
      ?auto_76637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76631 ) ( not ( = ?auto_76631 ?auto_76632 ) ) ( not ( = ?auto_76631 ?auto_76633 ) ) ( not ( = ?auto_76631 ?auto_76634 ) ) ( not ( = ?auto_76631 ?auto_76635 ) ) ( not ( = ?auto_76631 ?auto_76636 ) ) ( not ( = ?auto_76631 ?auto_76638 ) ) ( not ( = ?auto_76632 ?auto_76633 ) ) ( not ( = ?auto_76632 ?auto_76634 ) ) ( not ( = ?auto_76632 ?auto_76635 ) ) ( not ( = ?auto_76632 ?auto_76636 ) ) ( not ( = ?auto_76632 ?auto_76638 ) ) ( not ( = ?auto_76633 ?auto_76634 ) ) ( not ( = ?auto_76633 ?auto_76635 ) ) ( not ( = ?auto_76633 ?auto_76636 ) ) ( not ( = ?auto_76633 ?auto_76638 ) ) ( not ( = ?auto_76634 ?auto_76635 ) ) ( not ( = ?auto_76634 ?auto_76636 ) ) ( not ( = ?auto_76634 ?auto_76638 ) ) ( not ( = ?auto_76635 ?auto_76636 ) ) ( not ( = ?auto_76635 ?auto_76638 ) ) ( not ( = ?auto_76636 ?auto_76638 ) ) ( ON ?auto_76638 ?auto_76637 ) ( not ( = ?auto_76631 ?auto_76637 ) ) ( not ( = ?auto_76632 ?auto_76637 ) ) ( not ( = ?auto_76633 ?auto_76637 ) ) ( not ( = ?auto_76634 ?auto_76637 ) ) ( not ( = ?auto_76635 ?auto_76637 ) ) ( not ( = ?auto_76636 ?auto_76637 ) ) ( not ( = ?auto_76638 ?auto_76637 ) ) ( ON ?auto_76636 ?auto_76638 ) ( ON-TABLE ?auto_76637 ) ( ON ?auto_76635 ?auto_76636 ) ( ON ?auto_76634 ?auto_76635 ) ( ON ?auto_76633 ?auto_76634 ) ( CLEAR ?auto_76631 ) ( ON ?auto_76632 ?auto_76633 ) ( CLEAR ?auto_76632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76637 ?auto_76638 ?auto_76636 ?auto_76635 ?auto_76634 ?auto_76633 )
      ( MAKE-6PILE ?auto_76631 ?auto_76632 ?auto_76633 ?auto_76634 ?auto_76635 ?auto_76636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76639 - BLOCK
      ?auto_76640 - BLOCK
      ?auto_76641 - BLOCK
      ?auto_76642 - BLOCK
      ?auto_76643 - BLOCK
      ?auto_76644 - BLOCK
    )
    :vars
    (
      ?auto_76646 - BLOCK
      ?auto_76645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76639 ?auto_76640 ) ) ( not ( = ?auto_76639 ?auto_76641 ) ) ( not ( = ?auto_76639 ?auto_76642 ) ) ( not ( = ?auto_76639 ?auto_76643 ) ) ( not ( = ?auto_76639 ?auto_76644 ) ) ( not ( = ?auto_76639 ?auto_76646 ) ) ( not ( = ?auto_76640 ?auto_76641 ) ) ( not ( = ?auto_76640 ?auto_76642 ) ) ( not ( = ?auto_76640 ?auto_76643 ) ) ( not ( = ?auto_76640 ?auto_76644 ) ) ( not ( = ?auto_76640 ?auto_76646 ) ) ( not ( = ?auto_76641 ?auto_76642 ) ) ( not ( = ?auto_76641 ?auto_76643 ) ) ( not ( = ?auto_76641 ?auto_76644 ) ) ( not ( = ?auto_76641 ?auto_76646 ) ) ( not ( = ?auto_76642 ?auto_76643 ) ) ( not ( = ?auto_76642 ?auto_76644 ) ) ( not ( = ?auto_76642 ?auto_76646 ) ) ( not ( = ?auto_76643 ?auto_76644 ) ) ( not ( = ?auto_76643 ?auto_76646 ) ) ( not ( = ?auto_76644 ?auto_76646 ) ) ( ON ?auto_76646 ?auto_76645 ) ( not ( = ?auto_76639 ?auto_76645 ) ) ( not ( = ?auto_76640 ?auto_76645 ) ) ( not ( = ?auto_76641 ?auto_76645 ) ) ( not ( = ?auto_76642 ?auto_76645 ) ) ( not ( = ?auto_76643 ?auto_76645 ) ) ( not ( = ?auto_76644 ?auto_76645 ) ) ( not ( = ?auto_76646 ?auto_76645 ) ) ( ON ?auto_76644 ?auto_76646 ) ( ON-TABLE ?auto_76645 ) ( ON ?auto_76643 ?auto_76644 ) ( ON ?auto_76642 ?auto_76643 ) ( ON ?auto_76641 ?auto_76642 ) ( ON ?auto_76640 ?auto_76641 ) ( CLEAR ?auto_76640 ) ( HOLDING ?auto_76639 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76639 )
      ( MAKE-6PILE ?auto_76639 ?auto_76640 ?auto_76641 ?auto_76642 ?auto_76643 ?auto_76644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_76647 - BLOCK
      ?auto_76648 - BLOCK
      ?auto_76649 - BLOCK
      ?auto_76650 - BLOCK
      ?auto_76651 - BLOCK
      ?auto_76652 - BLOCK
    )
    :vars
    (
      ?auto_76654 - BLOCK
      ?auto_76653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76647 ?auto_76648 ) ) ( not ( = ?auto_76647 ?auto_76649 ) ) ( not ( = ?auto_76647 ?auto_76650 ) ) ( not ( = ?auto_76647 ?auto_76651 ) ) ( not ( = ?auto_76647 ?auto_76652 ) ) ( not ( = ?auto_76647 ?auto_76654 ) ) ( not ( = ?auto_76648 ?auto_76649 ) ) ( not ( = ?auto_76648 ?auto_76650 ) ) ( not ( = ?auto_76648 ?auto_76651 ) ) ( not ( = ?auto_76648 ?auto_76652 ) ) ( not ( = ?auto_76648 ?auto_76654 ) ) ( not ( = ?auto_76649 ?auto_76650 ) ) ( not ( = ?auto_76649 ?auto_76651 ) ) ( not ( = ?auto_76649 ?auto_76652 ) ) ( not ( = ?auto_76649 ?auto_76654 ) ) ( not ( = ?auto_76650 ?auto_76651 ) ) ( not ( = ?auto_76650 ?auto_76652 ) ) ( not ( = ?auto_76650 ?auto_76654 ) ) ( not ( = ?auto_76651 ?auto_76652 ) ) ( not ( = ?auto_76651 ?auto_76654 ) ) ( not ( = ?auto_76652 ?auto_76654 ) ) ( ON ?auto_76654 ?auto_76653 ) ( not ( = ?auto_76647 ?auto_76653 ) ) ( not ( = ?auto_76648 ?auto_76653 ) ) ( not ( = ?auto_76649 ?auto_76653 ) ) ( not ( = ?auto_76650 ?auto_76653 ) ) ( not ( = ?auto_76651 ?auto_76653 ) ) ( not ( = ?auto_76652 ?auto_76653 ) ) ( not ( = ?auto_76654 ?auto_76653 ) ) ( ON ?auto_76652 ?auto_76654 ) ( ON-TABLE ?auto_76653 ) ( ON ?auto_76651 ?auto_76652 ) ( ON ?auto_76650 ?auto_76651 ) ( ON ?auto_76649 ?auto_76650 ) ( ON ?auto_76648 ?auto_76649 ) ( ON ?auto_76647 ?auto_76648 ) ( CLEAR ?auto_76647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76653 ?auto_76654 ?auto_76652 ?auto_76651 ?auto_76650 ?auto_76649 ?auto_76648 )
      ( MAKE-6PILE ?auto_76647 ?auto_76648 ?auto_76649 ?auto_76650 ?auto_76651 ?auto_76652 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76656 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76656 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_76656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76657 - BLOCK
    )
    :vars
    (
      ?auto_76658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76657 ?auto_76658 ) ( CLEAR ?auto_76657 ) ( HAND-EMPTY ) ( not ( = ?auto_76657 ?auto_76658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76657 ?auto_76658 )
      ( MAKE-1PILE ?auto_76657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76659 - BLOCK
    )
    :vars
    (
      ?auto_76660 - BLOCK
      ?auto_76665 - BLOCK
      ?auto_76662 - BLOCK
      ?auto_76663 - BLOCK
      ?auto_76664 - BLOCK
      ?auto_76661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76659 ?auto_76660 ) ) ( HOLDING ?auto_76659 ) ( CLEAR ?auto_76660 ) ( ON-TABLE ?auto_76665 ) ( ON ?auto_76662 ?auto_76665 ) ( ON ?auto_76663 ?auto_76662 ) ( ON ?auto_76664 ?auto_76663 ) ( ON ?auto_76661 ?auto_76664 ) ( ON ?auto_76660 ?auto_76661 ) ( not ( = ?auto_76665 ?auto_76662 ) ) ( not ( = ?auto_76665 ?auto_76663 ) ) ( not ( = ?auto_76665 ?auto_76664 ) ) ( not ( = ?auto_76665 ?auto_76661 ) ) ( not ( = ?auto_76665 ?auto_76660 ) ) ( not ( = ?auto_76665 ?auto_76659 ) ) ( not ( = ?auto_76662 ?auto_76663 ) ) ( not ( = ?auto_76662 ?auto_76664 ) ) ( not ( = ?auto_76662 ?auto_76661 ) ) ( not ( = ?auto_76662 ?auto_76660 ) ) ( not ( = ?auto_76662 ?auto_76659 ) ) ( not ( = ?auto_76663 ?auto_76664 ) ) ( not ( = ?auto_76663 ?auto_76661 ) ) ( not ( = ?auto_76663 ?auto_76660 ) ) ( not ( = ?auto_76663 ?auto_76659 ) ) ( not ( = ?auto_76664 ?auto_76661 ) ) ( not ( = ?auto_76664 ?auto_76660 ) ) ( not ( = ?auto_76664 ?auto_76659 ) ) ( not ( = ?auto_76661 ?auto_76660 ) ) ( not ( = ?auto_76661 ?auto_76659 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76665 ?auto_76662 ?auto_76663 ?auto_76664 ?auto_76661 ?auto_76660 ?auto_76659 )
      ( MAKE-1PILE ?auto_76659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76666 - BLOCK
    )
    :vars
    (
      ?auto_76671 - BLOCK
      ?auto_76667 - BLOCK
      ?auto_76672 - BLOCK
      ?auto_76669 - BLOCK
      ?auto_76670 - BLOCK
      ?auto_76668 - BLOCK
      ?auto_76673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76666 ?auto_76671 ) ) ( CLEAR ?auto_76671 ) ( ON-TABLE ?auto_76667 ) ( ON ?auto_76672 ?auto_76667 ) ( ON ?auto_76669 ?auto_76672 ) ( ON ?auto_76670 ?auto_76669 ) ( ON ?auto_76668 ?auto_76670 ) ( ON ?auto_76671 ?auto_76668 ) ( not ( = ?auto_76667 ?auto_76672 ) ) ( not ( = ?auto_76667 ?auto_76669 ) ) ( not ( = ?auto_76667 ?auto_76670 ) ) ( not ( = ?auto_76667 ?auto_76668 ) ) ( not ( = ?auto_76667 ?auto_76671 ) ) ( not ( = ?auto_76667 ?auto_76666 ) ) ( not ( = ?auto_76672 ?auto_76669 ) ) ( not ( = ?auto_76672 ?auto_76670 ) ) ( not ( = ?auto_76672 ?auto_76668 ) ) ( not ( = ?auto_76672 ?auto_76671 ) ) ( not ( = ?auto_76672 ?auto_76666 ) ) ( not ( = ?auto_76669 ?auto_76670 ) ) ( not ( = ?auto_76669 ?auto_76668 ) ) ( not ( = ?auto_76669 ?auto_76671 ) ) ( not ( = ?auto_76669 ?auto_76666 ) ) ( not ( = ?auto_76670 ?auto_76668 ) ) ( not ( = ?auto_76670 ?auto_76671 ) ) ( not ( = ?auto_76670 ?auto_76666 ) ) ( not ( = ?auto_76668 ?auto_76671 ) ) ( not ( = ?auto_76668 ?auto_76666 ) ) ( ON ?auto_76666 ?auto_76673 ) ( CLEAR ?auto_76666 ) ( HAND-EMPTY ) ( not ( = ?auto_76666 ?auto_76673 ) ) ( not ( = ?auto_76671 ?auto_76673 ) ) ( not ( = ?auto_76667 ?auto_76673 ) ) ( not ( = ?auto_76672 ?auto_76673 ) ) ( not ( = ?auto_76669 ?auto_76673 ) ) ( not ( = ?auto_76670 ?auto_76673 ) ) ( not ( = ?auto_76668 ?auto_76673 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76666 ?auto_76673 )
      ( MAKE-1PILE ?auto_76666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76674 - BLOCK
    )
    :vars
    (
      ?auto_76676 - BLOCK
      ?auto_76680 - BLOCK
      ?auto_76681 - BLOCK
      ?auto_76679 - BLOCK
      ?auto_76678 - BLOCK
      ?auto_76677 - BLOCK
      ?auto_76675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76674 ?auto_76676 ) ) ( ON-TABLE ?auto_76680 ) ( ON ?auto_76681 ?auto_76680 ) ( ON ?auto_76679 ?auto_76681 ) ( ON ?auto_76678 ?auto_76679 ) ( ON ?auto_76677 ?auto_76678 ) ( not ( = ?auto_76680 ?auto_76681 ) ) ( not ( = ?auto_76680 ?auto_76679 ) ) ( not ( = ?auto_76680 ?auto_76678 ) ) ( not ( = ?auto_76680 ?auto_76677 ) ) ( not ( = ?auto_76680 ?auto_76676 ) ) ( not ( = ?auto_76680 ?auto_76674 ) ) ( not ( = ?auto_76681 ?auto_76679 ) ) ( not ( = ?auto_76681 ?auto_76678 ) ) ( not ( = ?auto_76681 ?auto_76677 ) ) ( not ( = ?auto_76681 ?auto_76676 ) ) ( not ( = ?auto_76681 ?auto_76674 ) ) ( not ( = ?auto_76679 ?auto_76678 ) ) ( not ( = ?auto_76679 ?auto_76677 ) ) ( not ( = ?auto_76679 ?auto_76676 ) ) ( not ( = ?auto_76679 ?auto_76674 ) ) ( not ( = ?auto_76678 ?auto_76677 ) ) ( not ( = ?auto_76678 ?auto_76676 ) ) ( not ( = ?auto_76678 ?auto_76674 ) ) ( not ( = ?auto_76677 ?auto_76676 ) ) ( not ( = ?auto_76677 ?auto_76674 ) ) ( ON ?auto_76674 ?auto_76675 ) ( CLEAR ?auto_76674 ) ( not ( = ?auto_76674 ?auto_76675 ) ) ( not ( = ?auto_76676 ?auto_76675 ) ) ( not ( = ?auto_76680 ?auto_76675 ) ) ( not ( = ?auto_76681 ?auto_76675 ) ) ( not ( = ?auto_76679 ?auto_76675 ) ) ( not ( = ?auto_76678 ?auto_76675 ) ) ( not ( = ?auto_76677 ?auto_76675 ) ) ( HOLDING ?auto_76676 ) ( CLEAR ?auto_76677 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76680 ?auto_76681 ?auto_76679 ?auto_76678 ?auto_76677 ?auto_76676 )
      ( MAKE-1PILE ?auto_76674 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76682 - BLOCK
    )
    :vars
    (
      ?auto_76683 - BLOCK
      ?auto_76689 - BLOCK
      ?auto_76688 - BLOCK
      ?auto_76686 - BLOCK
      ?auto_76687 - BLOCK
      ?auto_76684 - BLOCK
      ?auto_76685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76682 ?auto_76683 ) ) ( ON-TABLE ?auto_76689 ) ( ON ?auto_76688 ?auto_76689 ) ( ON ?auto_76686 ?auto_76688 ) ( ON ?auto_76687 ?auto_76686 ) ( ON ?auto_76684 ?auto_76687 ) ( not ( = ?auto_76689 ?auto_76688 ) ) ( not ( = ?auto_76689 ?auto_76686 ) ) ( not ( = ?auto_76689 ?auto_76687 ) ) ( not ( = ?auto_76689 ?auto_76684 ) ) ( not ( = ?auto_76689 ?auto_76683 ) ) ( not ( = ?auto_76689 ?auto_76682 ) ) ( not ( = ?auto_76688 ?auto_76686 ) ) ( not ( = ?auto_76688 ?auto_76687 ) ) ( not ( = ?auto_76688 ?auto_76684 ) ) ( not ( = ?auto_76688 ?auto_76683 ) ) ( not ( = ?auto_76688 ?auto_76682 ) ) ( not ( = ?auto_76686 ?auto_76687 ) ) ( not ( = ?auto_76686 ?auto_76684 ) ) ( not ( = ?auto_76686 ?auto_76683 ) ) ( not ( = ?auto_76686 ?auto_76682 ) ) ( not ( = ?auto_76687 ?auto_76684 ) ) ( not ( = ?auto_76687 ?auto_76683 ) ) ( not ( = ?auto_76687 ?auto_76682 ) ) ( not ( = ?auto_76684 ?auto_76683 ) ) ( not ( = ?auto_76684 ?auto_76682 ) ) ( ON ?auto_76682 ?auto_76685 ) ( not ( = ?auto_76682 ?auto_76685 ) ) ( not ( = ?auto_76683 ?auto_76685 ) ) ( not ( = ?auto_76689 ?auto_76685 ) ) ( not ( = ?auto_76688 ?auto_76685 ) ) ( not ( = ?auto_76686 ?auto_76685 ) ) ( not ( = ?auto_76687 ?auto_76685 ) ) ( not ( = ?auto_76684 ?auto_76685 ) ) ( CLEAR ?auto_76684 ) ( ON ?auto_76683 ?auto_76682 ) ( CLEAR ?auto_76683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76685 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76685 ?auto_76682 )
      ( MAKE-1PILE ?auto_76682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76690 - BLOCK
    )
    :vars
    (
      ?auto_76692 - BLOCK
      ?auto_76697 - BLOCK
      ?auto_76695 - BLOCK
      ?auto_76694 - BLOCK
      ?auto_76693 - BLOCK
      ?auto_76696 - BLOCK
      ?auto_76691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76690 ?auto_76692 ) ) ( ON-TABLE ?auto_76697 ) ( ON ?auto_76695 ?auto_76697 ) ( ON ?auto_76694 ?auto_76695 ) ( ON ?auto_76693 ?auto_76694 ) ( not ( = ?auto_76697 ?auto_76695 ) ) ( not ( = ?auto_76697 ?auto_76694 ) ) ( not ( = ?auto_76697 ?auto_76693 ) ) ( not ( = ?auto_76697 ?auto_76696 ) ) ( not ( = ?auto_76697 ?auto_76692 ) ) ( not ( = ?auto_76697 ?auto_76690 ) ) ( not ( = ?auto_76695 ?auto_76694 ) ) ( not ( = ?auto_76695 ?auto_76693 ) ) ( not ( = ?auto_76695 ?auto_76696 ) ) ( not ( = ?auto_76695 ?auto_76692 ) ) ( not ( = ?auto_76695 ?auto_76690 ) ) ( not ( = ?auto_76694 ?auto_76693 ) ) ( not ( = ?auto_76694 ?auto_76696 ) ) ( not ( = ?auto_76694 ?auto_76692 ) ) ( not ( = ?auto_76694 ?auto_76690 ) ) ( not ( = ?auto_76693 ?auto_76696 ) ) ( not ( = ?auto_76693 ?auto_76692 ) ) ( not ( = ?auto_76693 ?auto_76690 ) ) ( not ( = ?auto_76696 ?auto_76692 ) ) ( not ( = ?auto_76696 ?auto_76690 ) ) ( ON ?auto_76690 ?auto_76691 ) ( not ( = ?auto_76690 ?auto_76691 ) ) ( not ( = ?auto_76692 ?auto_76691 ) ) ( not ( = ?auto_76697 ?auto_76691 ) ) ( not ( = ?auto_76695 ?auto_76691 ) ) ( not ( = ?auto_76694 ?auto_76691 ) ) ( not ( = ?auto_76693 ?auto_76691 ) ) ( not ( = ?auto_76696 ?auto_76691 ) ) ( ON ?auto_76692 ?auto_76690 ) ( CLEAR ?auto_76692 ) ( ON-TABLE ?auto_76691 ) ( HOLDING ?auto_76696 ) ( CLEAR ?auto_76693 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76697 ?auto_76695 ?auto_76694 ?auto_76693 ?auto_76696 )
      ( MAKE-1PILE ?auto_76690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76698 - BLOCK
    )
    :vars
    (
      ?auto_76704 - BLOCK
      ?auto_76705 - BLOCK
      ?auto_76702 - BLOCK
      ?auto_76701 - BLOCK
      ?auto_76700 - BLOCK
      ?auto_76703 - BLOCK
      ?auto_76699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76698 ?auto_76704 ) ) ( ON-TABLE ?auto_76705 ) ( ON ?auto_76702 ?auto_76705 ) ( ON ?auto_76701 ?auto_76702 ) ( ON ?auto_76700 ?auto_76701 ) ( not ( = ?auto_76705 ?auto_76702 ) ) ( not ( = ?auto_76705 ?auto_76701 ) ) ( not ( = ?auto_76705 ?auto_76700 ) ) ( not ( = ?auto_76705 ?auto_76703 ) ) ( not ( = ?auto_76705 ?auto_76704 ) ) ( not ( = ?auto_76705 ?auto_76698 ) ) ( not ( = ?auto_76702 ?auto_76701 ) ) ( not ( = ?auto_76702 ?auto_76700 ) ) ( not ( = ?auto_76702 ?auto_76703 ) ) ( not ( = ?auto_76702 ?auto_76704 ) ) ( not ( = ?auto_76702 ?auto_76698 ) ) ( not ( = ?auto_76701 ?auto_76700 ) ) ( not ( = ?auto_76701 ?auto_76703 ) ) ( not ( = ?auto_76701 ?auto_76704 ) ) ( not ( = ?auto_76701 ?auto_76698 ) ) ( not ( = ?auto_76700 ?auto_76703 ) ) ( not ( = ?auto_76700 ?auto_76704 ) ) ( not ( = ?auto_76700 ?auto_76698 ) ) ( not ( = ?auto_76703 ?auto_76704 ) ) ( not ( = ?auto_76703 ?auto_76698 ) ) ( ON ?auto_76698 ?auto_76699 ) ( not ( = ?auto_76698 ?auto_76699 ) ) ( not ( = ?auto_76704 ?auto_76699 ) ) ( not ( = ?auto_76705 ?auto_76699 ) ) ( not ( = ?auto_76702 ?auto_76699 ) ) ( not ( = ?auto_76701 ?auto_76699 ) ) ( not ( = ?auto_76700 ?auto_76699 ) ) ( not ( = ?auto_76703 ?auto_76699 ) ) ( ON ?auto_76704 ?auto_76698 ) ( ON-TABLE ?auto_76699 ) ( CLEAR ?auto_76700 ) ( ON ?auto_76703 ?auto_76704 ) ( CLEAR ?auto_76703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76699 ?auto_76698 ?auto_76704 )
      ( MAKE-1PILE ?auto_76698 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76706 - BLOCK
    )
    :vars
    (
      ?auto_76707 - BLOCK
      ?auto_76708 - BLOCK
      ?auto_76709 - BLOCK
      ?auto_76710 - BLOCK
      ?auto_76713 - BLOCK
      ?auto_76712 - BLOCK
      ?auto_76711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76706 ?auto_76707 ) ) ( ON-TABLE ?auto_76708 ) ( ON ?auto_76709 ?auto_76708 ) ( ON ?auto_76710 ?auto_76709 ) ( not ( = ?auto_76708 ?auto_76709 ) ) ( not ( = ?auto_76708 ?auto_76710 ) ) ( not ( = ?auto_76708 ?auto_76713 ) ) ( not ( = ?auto_76708 ?auto_76712 ) ) ( not ( = ?auto_76708 ?auto_76707 ) ) ( not ( = ?auto_76708 ?auto_76706 ) ) ( not ( = ?auto_76709 ?auto_76710 ) ) ( not ( = ?auto_76709 ?auto_76713 ) ) ( not ( = ?auto_76709 ?auto_76712 ) ) ( not ( = ?auto_76709 ?auto_76707 ) ) ( not ( = ?auto_76709 ?auto_76706 ) ) ( not ( = ?auto_76710 ?auto_76713 ) ) ( not ( = ?auto_76710 ?auto_76712 ) ) ( not ( = ?auto_76710 ?auto_76707 ) ) ( not ( = ?auto_76710 ?auto_76706 ) ) ( not ( = ?auto_76713 ?auto_76712 ) ) ( not ( = ?auto_76713 ?auto_76707 ) ) ( not ( = ?auto_76713 ?auto_76706 ) ) ( not ( = ?auto_76712 ?auto_76707 ) ) ( not ( = ?auto_76712 ?auto_76706 ) ) ( ON ?auto_76706 ?auto_76711 ) ( not ( = ?auto_76706 ?auto_76711 ) ) ( not ( = ?auto_76707 ?auto_76711 ) ) ( not ( = ?auto_76708 ?auto_76711 ) ) ( not ( = ?auto_76709 ?auto_76711 ) ) ( not ( = ?auto_76710 ?auto_76711 ) ) ( not ( = ?auto_76713 ?auto_76711 ) ) ( not ( = ?auto_76712 ?auto_76711 ) ) ( ON ?auto_76707 ?auto_76706 ) ( ON-TABLE ?auto_76711 ) ( ON ?auto_76712 ?auto_76707 ) ( CLEAR ?auto_76712 ) ( HOLDING ?auto_76713 ) ( CLEAR ?auto_76710 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76708 ?auto_76709 ?auto_76710 ?auto_76713 )
      ( MAKE-1PILE ?auto_76706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76714 - BLOCK
    )
    :vars
    (
      ?auto_76718 - BLOCK
      ?auto_76716 - BLOCK
      ?auto_76715 - BLOCK
      ?auto_76721 - BLOCK
      ?auto_76719 - BLOCK
      ?auto_76717 - BLOCK
      ?auto_76720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76714 ?auto_76718 ) ) ( ON-TABLE ?auto_76716 ) ( ON ?auto_76715 ?auto_76716 ) ( ON ?auto_76721 ?auto_76715 ) ( not ( = ?auto_76716 ?auto_76715 ) ) ( not ( = ?auto_76716 ?auto_76721 ) ) ( not ( = ?auto_76716 ?auto_76719 ) ) ( not ( = ?auto_76716 ?auto_76717 ) ) ( not ( = ?auto_76716 ?auto_76718 ) ) ( not ( = ?auto_76716 ?auto_76714 ) ) ( not ( = ?auto_76715 ?auto_76721 ) ) ( not ( = ?auto_76715 ?auto_76719 ) ) ( not ( = ?auto_76715 ?auto_76717 ) ) ( not ( = ?auto_76715 ?auto_76718 ) ) ( not ( = ?auto_76715 ?auto_76714 ) ) ( not ( = ?auto_76721 ?auto_76719 ) ) ( not ( = ?auto_76721 ?auto_76717 ) ) ( not ( = ?auto_76721 ?auto_76718 ) ) ( not ( = ?auto_76721 ?auto_76714 ) ) ( not ( = ?auto_76719 ?auto_76717 ) ) ( not ( = ?auto_76719 ?auto_76718 ) ) ( not ( = ?auto_76719 ?auto_76714 ) ) ( not ( = ?auto_76717 ?auto_76718 ) ) ( not ( = ?auto_76717 ?auto_76714 ) ) ( ON ?auto_76714 ?auto_76720 ) ( not ( = ?auto_76714 ?auto_76720 ) ) ( not ( = ?auto_76718 ?auto_76720 ) ) ( not ( = ?auto_76716 ?auto_76720 ) ) ( not ( = ?auto_76715 ?auto_76720 ) ) ( not ( = ?auto_76721 ?auto_76720 ) ) ( not ( = ?auto_76719 ?auto_76720 ) ) ( not ( = ?auto_76717 ?auto_76720 ) ) ( ON ?auto_76718 ?auto_76714 ) ( ON-TABLE ?auto_76720 ) ( ON ?auto_76717 ?auto_76718 ) ( CLEAR ?auto_76721 ) ( ON ?auto_76719 ?auto_76717 ) ( CLEAR ?auto_76719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76720 ?auto_76714 ?auto_76718 ?auto_76717 )
      ( MAKE-1PILE ?auto_76714 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76722 - BLOCK
    )
    :vars
    (
      ?auto_76724 - BLOCK
      ?auto_76723 - BLOCK
      ?auto_76728 - BLOCK
      ?auto_76727 - BLOCK
      ?auto_76725 - BLOCK
      ?auto_76729 - BLOCK
      ?auto_76726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76722 ?auto_76724 ) ) ( ON-TABLE ?auto_76723 ) ( ON ?auto_76728 ?auto_76723 ) ( not ( = ?auto_76723 ?auto_76728 ) ) ( not ( = ?auto_76723 ?auto_76727 ) ) ( not ( = ?auto_76723 ?auto_76725 ) ) ( not ( = ?auto_76723 ?auto_76729 ) ) ( not ( = ?auto_76723 ?auto_76724 ) ) ( not ( = ?auto_76723 ?auto_76722 ) ) ( not ( = ?auto_76728 ?auto_76727 ) ) ( not ( = ?auto_76728 ?auto_76725 ) ) ( not ( = ?auto_76728 ?auto_76729 ) ) ( not ( = ?auto_76728 ?auto_76724 ) ) ( not ( = ?auto_76728 ?auto_76722 ) ) ( not ( = ?auto_76727 ?auto_76725 ) ) ( not ( = ?auto_76727 ?auto_76729 ) ) ( not ( = ?auto_76727 ?auto_76724 ) ) ( not ( = ?auto_76727 ?auto_76722 ) ) ( not ( = ?auto_76725 ?auto_76729 ) ) ( not ( = ?auto_76725 ?auto_76724 ) ) ( not ( = ?auto_76725 ?auto_76722 ) ) ( not ( = ?auto_76729 ?auto_76724 ) ) ( not ( = ?auto_76729 ?auto_76722 ) ) ( ON ?auto_76722 ?auto_76726 ) ( not ( = ?auto_76722 ?auto_76726 ) ) ( not ( = ?auto_76724 ?auto_76726 ) ) ( not ( = ?auto_76723 ?auto_76726 ) ) ( not ( = ?auto_76728 ?auto_76726 ) ) ( not ( = ?auto_76727 ?auto_76726 ) ) ( not ( = ?auto_76725 ?auto_76726 ) ) ( not ( = ?auto_76729 ?auto_76726 ) ) ( ON ?auto_76724 ?auto_76722 ) ( ON-TABLE ?auto_76726 ) ( ON ?auto_76729 ?auto_76724 ) ( ON ?auto_76725 ?auto_76729 ) ( CLEAR ?auto_76725 ) ( HOLDING ?auto_76727 ) ( CLEAR ?auto_76728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76723 ?auto_76728 ?auto_76727 )
      ( MAKE-1PILE ?auto_76722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76730 - BLOCK
    )
    :vars
    (
      ?auto_76736 - BLOCK
      ?auto_76734 - BLOCK
      ?auto_76737 - BLOCK
      ?auto_76732 - BLOCK
      ?auto_76733 - BLOCK
      ?auto_76735 - BLOCK
      ?auto_76731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76730 ?auto_76736 ) ) ( ON-TABLE ?auto_76734 ) ( ON ?auto_76737 ?auto_76734 ) ( not ( = ?auto_76734 ?auto_76737 ) ) ( not ( = ?auto_76734 ?auto_76732 ) ) ( not ( = ?auto_76734 ?auto_76733 ) ) ( not ( = ?auto_76734 ?auto_76735 ) ) ( not ( = ?auto_76734 ?auto_76736 ) ) ( not ( = ?auto_76734 ?auto_76730 ) ) ( not ( = ?auto_76737 ?auto_76732 ) ) ( not ( = ?auto_76737 ?auto_76733 ) ) ( not ( = ?auto_76737 ?auto_76735 ) ) ( not ( = ?auto_76737 ?auto_76736 ) ) ( not ( = ?auto_76737 ?auto_76730 ) ) ( not ( = ?auto_76732 ?auto_76733 ) ) ( not ( = ?auto_76732 ?auto_76735 ) ) ( not ( = ?auto_76732 ?auto_76736 ) ) ( not ( = ?auto_76732 ?auto_76730 ) ) ( not ( = ?auto_76733 ?auto_76735 ) ) ( not ( = ?auto_76733 ?auto_76736 ) ) ( not ( = ?auto_76733 ?auto_76730 ) ) ( not ( = ?auto_76735 ?auto_76736 ) ) ( not ( = ?auto_76735 ?auto_76730 ) ) ( ON ?auto_76730 ?auto_76731 ) ( not ( = ?auto_76730 ?auto_76731 ) ) ( not ( = ?auto_76736 ?auto_76731 ) ) ( not ( = ?auto_76734 ?auto_76731 ) ) ( not ( = ?auto_76737 ?auto_76731 ) ) ( not ( = ?auto_76732 ?auto_76731 ) ) ( not ( = ?auto_76733 ?auto_76731 ) ) ( not ( = ?auto_76735 ?auto_76731 ) ) ( ON ?auto_76736 ?auto_76730 ) ( ON-TABLE ?auto_76731 ) ( ON ?auto_76735 ?auto_76736 ) ( ON ?auto_76733 ?auto_76735 ) ( CLEAR ?auto_76737 ) ( ON ?auto_76732 ?auto_76733 ) ( CLEAR ?auto_76732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76731 ?auto_76730 ?auto_76736 ?auto_76735 ?auto_76733 )
      ( MAKE-1PILE ?auto_76730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76738 - BLOCK
    )
    :vars
    (
      ?auto_76739 - BLOCK
      ?auto_76745 - BLOCK
      ?auto_76742 - BLOCK
      ?auto_76743 - BLOCK
      ?auto_76741 - BLOCK
      ?auto_76740 - BLOCK
      ?auto_76744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76738 ?auto_76739 ) ) ( ON-TABLE ?auto_76745 ) ( not ( = ?auto_76745 ?auto_76742 ) ) ( not ( = ?auto_76745 ?auto_76743 ) ) ( not ( = ?auto_76745 ?auto_76741 ) ) ( not ( = ?auto_76745 ?auto_76740 ) ) ( not ( = ?auto_76745 ?auto_76739 ) ) ( not ( = ?auto_76745 ?auto_76738 ) ) ( not ( = ?auto_76742 ?auto_76743 ) ) ( not ( = ?auto_76742 ?auto_76741 ) ) ( not ( = ?auto_76742 ?auto_76740 ) ) ( not ( = ?auto_76742 ?auto_76739 ) ) ( not ( = ?auto_76742 ?auto_76738 ) ) ( not ( = ?auto_76743 ?auto_76741 ) ) ( not ( = ?auto_76743 ?auto_76740 ) ) ( not ( = ?auto_76743 ?auto_76739 ) ) ( not ( = ?auto_76743 ?auto_76738 ) ) ( not ( = ?auto_76741 ?auto_76740 ) ) ( not ( = ?auto_76741 ?auto_76739 ) ) ( not ( = ?auto_76741 ?auto_76738 ) ) ( not ( = ?auto_76740 ?auto_76739 ) ) ( not ( = ?auto_76740 ?auto_76738 ) ) ( ON ?auto_76738 ?auto_76744 ) ( not ( = ?auto_76738 ?auto_76744 ) ) ( not ( = ?auto_76739 ?auto_76744 ) ) ( not ( = ?auto_76745 ?auto_76744 ) ) ( not ( = ?auto_76742 ?auto_76744 ) ) ( not ( = ?auto_76743 ?auto_76744 ) ) ( not ( = ?auto_76741 ?auto_76744 ) ) ( not ( = ?auto_76740 ?auto_76744 ) ) ( ON ?auto_76739 ?auto_76738 ) ( ON-TABLE ?auto_76744 ) ( ON ?auto_76740 ?auto_76739 ) ( ON ?auto_76741 ?auto_76740 ) ( ON ?auto_76743 ?auto_76741 ) ( CLEAR ?auto_76743 ) ( HOLDING ?auto_76742 ) ( CLEAR ?auto_76745 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76745 ?auto_76742 )
      ( MAKE-1PILE ?auto_76738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76746 - BLOCK
    )
    :vars
    (
      ?auto_76750 - BLOCK
      ?auto_76747 - BLOCK
      ?auto_76753 - BLOCK
      ?auto_76751 - BLOCK
      ?auto_76749 - BLOCK
      ?auto_76748 - BLOCK
      ?auto_76752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76746 ?auto_76750 ) ) ( ON-TABLE ?auto_76747 ) ( not ( = ?auto_76747 ?auto_76753 ) ) ( not ( = ?auto_76747 ?auto_76751 ) ) ( not ( = ?auto_76747 ?auto_76749 ) ) ( not ( = ?auto_76747 ?auto_76748 ) ) ( not ( = ?auto_76747 ?auto_76750 ) ) ( not ( = ?auto_76747 ?auto_76746 ) ) ( not ( = ?auto_76753 ?auto_76751 ) ) ( not ( = ?auto_76753 ?auto_76749 ) ) ( not ( = ?auto_76753 ?auto_76748 ) ) ( not ( = ?auto_76753 ?auto_76750 ) ) ( not ( = ?auto_76753 ?auto_76746 ) ) ( not ( = ?auto_76751 ?auto_76749 ) ) ( not ( = ?auto_76751 ?auto_76748 ) ) ( not ( = ?auto_76751 ?auto_76750 ) ) ( not ( = ?auto_76751 ?auto_76746 ) ) ( not ( = ?auto_76749 ?auto_76748 ) ) ( not ( = ?auto_76749 ?auto_76750 ) ) ( not ( = ?auto_76749 ?auto_76746 ) ) ( not ( = ?auto_76748 ?auto_76750 ) ) ( not ( = ?auto_76748 ?auto_76746 ) ) ( ON ?auto_76746 ?auto_76752 ) ( not ( = ?auto_76746 ?auto_76752 ) ) ( not ( = ?auto_76750 ?auto_76752 ) ) ( not ( = ?auto_76747 ?auto_76752 ) ) ( not ( = ?auto_76753 ?auto_76752 ) ) ( not ( = ?auto_76751 ?auto_76752 ) ) ( not ( = ?auto_76749 ?auto_76752 ) ) ( not ( = ?auto_76748 ?auto_76752 ) ) ( ON ?auto_76750 ?auto_76746 ) ( ON-TABLE ?auto_76752 ) ( ON ?auto_76748 ?auto_76750 ) ( ON ?auto_76749 ?auto_76748 ) ( ON ?auto_76751 ?auto_76749 ) ( CLEAR ?auto_76747 ) ( ON ?auto_76753 ?auto_76751 ) ( CLEAR ?auto_76753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76752 ?auto_76746 ?auto_76750 ?auto_76748 ?auto_76749 ?auto_76751 )
      ( MAKE-1PILE ?auto_76746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76754 - BLOCK
    )
    :vars
    (
      ?auto_76760 - BLOCK
      ?auto_76758 - BLOCK
      ?auto_76755 - BLOCK
      ?auto_76756 - BLOCK
      ?auto_76759 - BLOCK
      ?auto_76761 - BLOCK
      ?auto_76757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76754 ?auto_76760 ) ) ( not ( = ?auto_76758 ?auto_76755 ) ) ( not ( = ?auto_76758 ?auto_76756 ) ) ( not ( = ?auto_76758 ?auto_76759 ) ) ( not ( = ?auto_76758 ?auto_76761 ) ) ( not ( = ?auto_76758 ?auto_76760 ) ) ( not ( = ?auto_76758 ?auto_76754 ) ) ( not ( = ?auto_76755 ?auto_76756 ) ) ( not ( = ?auto_76755 ?auto_76759 ) ) ( not ( = ?auto_76755 ?auto_76761 ) ) ( not ( = ?auto_76755 ?auto_76760 ) ) ( not ( = ?auto_76755 ?auto_76754 ) ) ( not ( = ?auto_76756 ?auto_76759 ) ) ( not ( = ?auto_76756 ?auto_76761 ) ) ( not ( = ?auto_76756 ?auto_76760 ) ) ( not ( = ?auto_76756 ?auto_76754 ) ) ( not ( = ?auto_76759 ?auto_76761 ) ) ( not ( = ?auto_76759 ?auto_76760 ) ) ( not ( = ?auto_76759 ?auto_76754 ) ) ( not ( = ?auto_76761 ?auto_76760 ) ) ( not ( = ?auto_76761 ?auto_76754 ) ) ( ON ?auto_76754 ?auto_76757 ) ( not ( = ?auto_76754 ?auto_76757 ) ) ( not ( = ?auto_76760 ?auto_76757 ) ) ( not ( = ?auto_76758 ?auto_76757 ) ) ( not ( = ?auto_76755 ?auto_76757 ) ) ( not ( = ?auto_76756 ?auto_76757 ) ) ( not ( = ?auto_76759 ?auto_76757 ) ) ( not ( = ?auto_76761 ?auto_76757 ) ) ( ON ?auto_76760 ?auto_76754 ) ( ON-TABLE ?auto_76757 ) ( ON ?auto_76761 ?auto_76760 ) ( ON ?auto_76759 ?auto_76761 ) ( ON ?auto_76756 ?auto_76759 ) ( ON ?auto_76755 ?auto_76756 ) ( CLEAR ?auto_76755 ) ( HOLDING ?auto_76758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76758 )
      ( MAKE-1PILE ?auto_76754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_76762 - BLOCK
    )
    :vars
    (
      ?auto_76764 - BLOCK
      ?auto_76765 - BLOCK
      ?auto_76766 - BLOCK
      ?auto_76768 - BLOCK
      ?auto_76763 - BLOCK
      ?auto_76769 - BLOCK
      ?auto_76767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76762 ?auto_76764 ) ) ( not ( = ?auto_76765 ?auto_76766 ) ) ( not ( = ?auto_76765 ?auto_76768 ) ) ( not ( = ?auto_76765 ?auto_76763 ) ) ( not ( = ?auto_76765 ?auto_76769 ) ) ( not ( = ?auto_76765 ?auto_76764 ) ) ( not ( = ?auto_76765 ?auto_76762 ) ) ( not ( = ?auto_76766 ?auto_76768 ) ) ( not ( = ?auto_76766 ?auto_76763 ) ) ( not ( = ?auto_76766 ?auto_76769 ) ) ( not ( = ?auto_76766 ?auto_76764 ) ) ( not ( = ?auto_76766 ?auto_76762 ) ) ( not ( = ?auto_76768 ?auto_76763 ) ) ( not ( = ?auto_76768 ?auto_76769 ) ) ( not ( = ?auto_76768 ?auto_76764 ) ) ( not ( = ?auto_76768 ?auto_76762 ) ) ( not ( = ?auto_76763 ?auto_76769 ) ) ( not ( = ?auto_76763 ?auto_76764 ) ) ( not ( = ?auto_76763 ?auto_76762 ) ) ( not ( = ?auto_76769 ?auto_76764 ) ) ( not ( = ?auto_76769 ?auto_76762 ) ) ( ON ?auto_76762 ?auto_76767 ) ( not ( = ?auto_76762 ?auto_76767 ) ) ( not ( = ?auto_76764 ?auto_76767 ) ) ( not ( = ?auto_76765 ?auto_76767 ) ) ( not ( = ?auto_76766 ?auto_76767 ) ) ( not ( = ?auto_76768 ?auto_76767 ) ) ( not ( = ?auto_76763 ?auto_76767 ) ) ( not ( = ?auto_76769 ?auto_76767 ) ) ( ON ?auto_76764 ?auto_76762 ) ( ON-TABLE ?auto_76767 ) ( ON ?auto_76769 ?auto_76764 ) ( ON ?auto_76763 ?auto_76769 ) ( ON ?auto_76768 ?auto_76763 ) ( ON ?auto_76766 ?auto_76768 ) ( ON ?auto_76765 ?auto_76766 ) ( CLEAR ?auto_76765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76767 ?auto_76762 ?auto_76764 ?auto_76769 ?auto_76763 ?auto_76768 ?auto_76766 )
      ( MAKE-1PILE ?auto_76762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76775 - BLOCK
      ?auto_76776 - BLOCK
      ?auto_76777 - BLOCK
      ?auto_76778 - BLOCK
      ?auto_76779 - BLOCK
    )
    :vars
    (
      ?auto_76780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76780 ?auto_76779 ) ( CLEAR ?auto_76780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76775 ) ( ON ?auto_76776 ?auto_76775 ) ( ON ?auto_76777 ?auto_76776 ) ( ON ?auto_76778 ?auto_76777 ) ( ON ?auto_76779 ?auto_76778 ) ( not ( = ?auto_76775 ?auto_76776 ) ) ( not ( = ?auto_76775 ?auto_76777 ) ) ( not ( = ?auto_76775 ?auto_76778 ) ) ( not ( = ?auto_76775 ?auto_76779 ) ) ( not ( = ?auto_76775 ?auto_76780 ) ) ( not ( = ?auto_76776 ?auto_76777 ) ) ( not ( = ?auto_76776 ?auto_76778 ) ) ( not ( = ?auto_76776 ?auto_76779 ) ) ( not ( = ?auto_76776 ?auto_76780 ) ) ( not ( = ?auto_76777 ?auto_76778 ) ) ( not ( = ?auto_76777 ?auto_76779 ) ) ( not ( = ?auto_76777 ?auto_76780 ) ) ( not ( = ?auto_76778 ?auto_76779 ) ) ( not ( = ?auto_76778 ?auto_76780 ) ) ( not ( = ?auto_76779 ?auto_76780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76780 ?auto_76779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76781 - BLOCK
      ?auto_76782 - BLOCK
      ?auto_76783 - BLOCK
      ?auto_76784 - BLOCK
      ?auto_76785 - BLOCK
    )
    :vars
    (
      ?auto_76786 - BLOCK
      ?auto_76787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76786 ?auto_76785 ) ( CLEAR ?auto_76786 ) ( ON-TABLE ?auto_76781 ) ( ON ?auto_76782 ?auto_76781 ) ( ON ?auto_76783 ?auto_76782 ) ( ON ?auto_76784 ?auto_76783 ) ( ON ?auto_76785 ?auto_76784 ) ( not ( = ?auto_76781 ?auto_76782 ) ) ( not ( = ?auto_76781 ?auto_76783 ) ) ( not ( = ?auto_76781 ?auto_76784 ) ) ( not ( = ?auto_76781 ?auto_76785 ) ) ( not ( = ?auto_76781 ?auto_76786 ) ) ( not ( = ?auto_76782 ?auto_76783 ) ) ( not ( = ?auto_76782 ?auto_76784 ) ) ( not ( = ?auto_76782 ?auto_76785 ) ) ( not ( = ?auto_76782 ?auto_76786 ) ) ( not ( = ?auto_76783 ?auto_76784 ) ) ( not ( = ?auto_76783 ?auto_76785 ) ) ( not ( = ?auto_76783 ?auto_76786 ) ) ( not ( = ?auto_76784 ?auto_76785 ) ) ( not ( = ?auto_76784 ?auto_76786 ) ) ( not ( = ?auto_76785 ?auto_76786 ) ) ( HOLDING ?auto_76787 ) ( not ( = ?auto_76781 ?auto_76787 ) ) ( not ( = ?auto_76782 ?auto_76787 ) ) ( not ( = ?auto_76783 ?auto_76787 ) ) ( not ( = ?auto_76784 ?auto_76787 ) ) ( not ( = ?auto_76785 ?auto_76787 ) ) ( not ( = ?auto_76786 ?auto_76787 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_76787 )
      ( MAKE-5PILE ?auto_76781 ?auto_76782 ?auto_76783 ?auto_76784 ?auto_76785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76788 - BLOCK
      ?auto_76789 - BLOCK
      ?auto_76790 - BLOCK
      ?auto_76791 - BLOCK
      ?auto_76792 - BLOCK
    )
    :vars
    (
      ?auto_76794 - BLOCK
      ?auto_76793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76794 ?auto_76792 ) ( ON-TABLE ?auto_76788 ) ( ON ?auto_76789 ?auto_76788 ) ( ON ?auto_76790 ?auto_76789 ) ( ON ?auto_76791 ?auto_76790 ) ( ON ?auto_76792 ?auto_76791 ) ( not ( = ?auto_76788 ?auto_76789 ) ) ( not ( = ?auto_76788 ?auto_76790 ) ) ( not ( = ?auto_76788 ?auto_76791 ) ) ( not ( = ?auto_76788 ?auto_76792 ) ) ( not ( = ?auto_76788 ?auto_76794 ) ) ( not ( = ?auto_76789 ?auto_76790 ) ) ( not ( = ?auto_76789 ?auto_76791 ) ) ( not ( = ?auto_76789 ?auto_76792 ) ) ( not ( = ?auto_76789 ?auto_76794 ) ) ( not ( = ?auto_76790 ?auto_76791 ) ) ( not ( = ?auto_76790 ?auto_76792 ) ) ( not ( = ?auto_76790 ?auto_76794 ) ) ( not ( = ?auto_76791 ?auto_76792 ) ) ( not ( = ?auto_76791 ?auto_76794 ) ) ( not ( = ?auto_76792 ?auto_76794 ) ) ( not ( = ?auto_76788 ?auto_76793 ) ) ( not ( = ?auto_76789 ?auto_76793 ) ) ( not ( = ?auto_76790 ?auto_76793 ) ) ( not ( = ?auto_76791 ?auto_76793 ) ) ( not ( = ?auto_76792 ?auto_76793 ) ) ( not ( = ?auto_76794 ?auto_76793 ) ) ( ON ?auto_76793 ?auto_76794 ) ( CLEAR ?auto_76793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76788 ?auto_76789 ?auto_76790 ?auto_76791 ?auto_76792 ?auto_76794 )
      ( MAKE-5PILE ?auto_76788 ?auto_76789 ?auto_76790 ?auto_76791 ?auto_76792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76795 - BLOCK
      ?auto_76796 - BLOCK
      ?auto_76797 - BLOCK
      ?auto_76798 - BLOCK
      ?auto_76799 - BLOCK
    )
    :vars
    (
      ?auto_76801 - BLOCK
      ?auto_76800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76801 ?auto_76799 ) ( ON-TABLE ?auto_76795 ) ( ON ?auto_76796 ?auto_76795 ) ( ON ?auto_76797 ?auto_76796 ) ( ON ?auto_76798 ?auto_76797 ) ( ON ?auto_76799 ?auto_76798 ) ( not ( = ?auto_76795 ?auto_76796 ) ) ( not ( = ?auto_76795 ?auto_76797 ) ) ( not ( = ?auto_76795 ?auto_76798 ) ) ( not ( = ?auto_76795 ?auto_76799 ) ) ( not ( = ?auto_76795 ?auto_76801 ) ) ( not ( = ?auto_76796 ?auto_76797 ) ) ( not ( = ?auto_76796 ?auto_76798 ) ) ( not ( = ?auto_76796 ?auto_76799 ) ) ( not ( = ?auto_76796 ?auto_76801 ) ) ( not ( = ?auto_76797 ?auto_76798 ) ) ( not ( = ?auto_76797 ?auto_76799 ) ) ( not ( = ?auto_76797 ?auto_76801 ) ) ( not ( = ?auto_76798 ?auto_76799 ) ) ( not ( = ?auto_76798 ?auto_76801 ) ) ( not ( = ?auto_76799 ?auto_76801 ) ) ( not ( = ?auto_76795 ?auto_76800 ) ) ( not ( = ?auto_76796 ?auto_76800 ) ) ( not ( = ?auto_76797 ?auto_76800 ) ) ( not ( = ?auto_76798 ?auto_76800 ) ) ( not ( = ?auto_76799 ?auto_76800 ) ) ( not ( = ?auto_76801 ?auto_76800 ) ) ( HOLDING ?auto_76800 ) ( CLEAR ?auto_76801 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76795 ?auto_76796 ?auto_76797 ?auto_76798 ?auto_76799 ?auto_76801 ?auto_76800 )
      ( MAKE-5PILE ?auto_76795 ?auto_76796 ?auto_76797 ?auto_76798 ?auto_76799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76802 - BLOCK
      ?auto_76803 - BLOCK
      ?auto_76804 - BLOCK
      ?auto_76805 - BLOCK
      ?auto_76806 - BLOCK
    )
    :vars
    (
      ?auto_76808 - BLOCK
      ?auto_76807 - BLOCK
      ?auto_76809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76808 ?auto_76806 ) ( ON-TABLE ?auto_76802 ) ( ON ?auto_76803 ?auto_76802 ) ( ON ?auto_76804 ?auto_76803 ) ( ON ?auto_76805 ?auto_76804 ) ( ON ?auto_76806 ?auto_76805 ) ( not ( = ?auto_76802 ?auto_76803 ) ) ( not ( = ?auto_76802 ?auto_76804 ) ) ( not ( = ?auto_76802 ?auto_76805 ) ) ( not ( = ?auto_76802 ?auto_76806 ) ) ( not ( = ?auto_76802 ?auto_76808 ) ) ( not ( = ?auto_76803 ?auto_76804 ) ) ( not ( = ?auto_76803 ?auto_76805 ) ) ( not ( = ?auto_76803 ?auto_76806 ) ) ( not ( = ?auto_76803 ?auto_76808 ) ) ( not ( = ?auto_76804 ?auto_76805 ) ) ( not ( = ?auto_76804 ?auto_76806 ) ) ( not ( = ?auto_76804 ?auto_76808 ) ) ( not ( = ?auto_76805 ?auto_76806 ) ) ( not ( = ?auto_76805 ?auto_76808 ) ) ( not ( = ?auto_76806 ?auto_76808 ) ) ( not ( = ?auto_76802 ?auto_76807 ) ) ( not ( = ?auto_76803 ?auto_76807 ) ) ( not ( = ?auto_76804 ?auto_76807 ) ) ( not ( = ?auto_76805 ?auto_76807 ) ) ( not ( = ?auto_76806 ?auto_76807 ) ) ( not ( = ?auto_76808 ?auto_76807 ) ) ( CLEAR ?auto_76808 ) ( ON ?auto_76807 ?auto_76809 ) ( CLEAR ?auto_76807 ) ( HAND-EMPTY ) ( not ( = ?auto_76802 ?auto_76809 ) ) ( not ( = ?auto_76803 ?auto_76809 ) ) ( not ( = ?auto_76804 ?auto_76809 ) ) ( not ( = ?auto_76805 ?auto_76809 ) ) ( not ( = ?auto_76806 ?auto_76809 ) ) ( not ( = ?auto_76808 ?auto_76809 ) ) ( not ( = ?auto_76807 ?auto_76809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76807 ?auto_76809 )
      ( MAKE-5PILE ?auto_76802 ?auto_76803 ?auto_76804 ?auto_76805 ?auto_76806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76826 - BLOCK
      ?auto_76827 - BLOCK
      ?auto_76828 - BLOCK
      ?auto_76829 - BLOCK
      ?auto_76830 - BLOCK
    )
    :vars
    (
      ?auto_76833 - BLOCK
      ?auto_76831 - BLOCK
      ?auto_76832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76826 ) ( ON ?auto_76827 ?auto_76826 ) ( ON ?auto_76828 ?auto_76827 ) ( ON ?auto_76829 ?auto_76828 ) ( not ( = ?auto_76826 ?auto_76827 ) ) ( not ( = ?auto_76826 ?auto_76828 ) ) ( not ( = ?auto_76826 ?auto_76829 ) ) ( not ( = ?auto_76826 ?auto_76830 ) ) ( not ( = ?auto_76826 ?auto_76833 ) ) ( not ( = ?auto_76827 ?auto_76828 ) ) ( not ( = ?auto_76827 ?auto_76829 ) ) ( not ( = ?auto_76827 ?auto_76830 ) ) ( not ( = ?auto_76827 ?auto_76833 ) ) ( not ( = ?auto_76828 ?auto_76829 ) ) ( not ( = ?auto_76828 ?auto_76830 ) ) ( not ( = ?auto_76828 ?auto_76833 ) ) ( not ( = ?auto_76829 ?auto_76830 ) ) ( not ( = ?auto_76829 ?auto_76833 ) ) ( not ( = ?auto_76830 ?auto_76833 ) ) ( not ( = ?auto_76826 ?auto_76831 ) ) ( not ( = ?auto_76827 ?auto_76831 ) ) ( not ( = ?auto_76828 ?auto_76831 ) ) ( not ( = ?auto_76829 ?auto_76831 ) ) ( not ( = ?auto_76830 ?auto_76831 ) ) ( not ( = ?auto_76833 ?auto_76831 ) ) ( ON ?auto_76831 ?auto_76832 ) ( not ( = ?auto_76826 ?auto_76832 ) ) ( not ( = ?auto_76827 ?auto_76832 ) ) ( not ( = ?auto_76828 ?auto_76832 ) ) ( not ( = ?auto_76829 ?auto_76832 ) ) ( not ( = ?auto_76830 ?auto_76832 ) ) ( not ( = ?auto_76833 ?auto_76832 ) ) ( not ( = ?auto_76831 ?auto_76832 ) ) ( ON ?auto_76833 ?auto_76831 ) ( CLEAR ?auto_76833 ) ( HOLDING ?auto_76830 ) ( CLEAR ?auto_76829 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76826 ?auto_76827 ?auto_76828 ?auto_76829 ?auto_76830 ?auto_76833 )
      ( MAKE-5PILE ?auto_76826 ?auto_76827 ?auto_76828 ?auto_76829 ?auto_76830 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76834 - BLOCK
      ?auto_76835 - BLOCK
      ?auto_76836 - BLOCK
      ?auto_76837 - BLOCK
      ?auto_76838 - BLOCK
    )
    :vars
    (
      ?auto_76840 - BLOCK
      ?auto_76841 - BLOCK
      ?auto_76839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76834 ) ( ON ?auto_76835 ?auto_76834 ) ( ON ?auto_76836 ?auto_76835 ) ( ON ?auto_76837 ?auto_76836 ) ( not ( = ?auto_76834 ?auto_76835 ) ) ( not ( = ?auto_76834 ?auto_76836 ) ) ( not ( = ?auto_76834 ?auto_76837 ) ) ( not ( = ?auto_76834 ?auto_76838 ) ) ( not ( = ?auto_76834 ?auto_76840 ) ) ( not ( = ?auto_76835 ?auto_76836 ) ) ( not ( = ?auto_76835 ?auto_76837 ) ) ( not ( = ?auto_76835 ?auto_76838 ) ) ( not ( = ?auto_76835 ?auto_76840 ) ) ( not ( = ?auto_76836 ?auto_76837 ) ) ( not ( = ?auto_76836 ?auto_76838 ) ) ( not ( = ?auto_76836 ?auto_76840 ) ) ( not ( = ?auto_76837 ?auto_76838 ) ) ( not ( = ?auto_76837 ?auto_76840 ) ) ( not ( = ?auto_76838 ?auto_76840 ) ) ( not ( = ?auto_76834 ?auto_76841 ) ) ( not ( = ?auto_76835 ?auto_76841 ) ) ( not ( = ?auto_76836 ?auto_76841 ) ) ( not ( = ?auto_76837 ?auto_76841 ) ) ( not ( = ?auto_76838 ?auto_76841 ) ) ( not ( = ?auto_76840 ?auto_76841 ) ) ( ON ?auto_76841 ?auto_76839 ) ( not ( = ?auto_76834 ?auto_76839 ) ) ( not ( = ?auto_76835 ?auto_76839 ) ) ( not ( = ?auto_76836 ?auto_76839 ) ) ( not ( = ?auto_76837 ?auto_76839 ) ) ( not ( = ?auto_76838 ?auto_76839 ) ) ( not ( = ?auto_76840 ?auto_76839 ) ) ( not ( = ?auto_76841 ?auto_76839 ) ) ( ON ?auto_76840 ?auto_76841 ) ( CLEAR ?auto_76837 ) ( ON ?auto_76838 ?auto_76840 ) ( CLEAR ?auto_76838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76839 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76839 ?auto_76841 ?auto_76840 )
      ( MAKE-5PILE ?auto_76834 ?auto_76835 ?auto_76836 ?auto_76837 ?auto_76838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76842 - BLOCK
      ?auto_76843 - BLOCK
      ?auto_76844 - BLOCK
      ?auto_76845 - BLOCK
      ?auto_76846 - BLOCK
    )
    :vars
    (
      ?auto_76849 - BLOCK
      ?auto_76848 - BLOCK
      ?auto_76847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76842 ) ( ON ?auto_76843 ?auto_76842 ) ( ON ?auto_76844 ?auto_76843 ) ( not ( = ?auto_76842 ?auto_76843 ) ) ( not ( = ?auto_76842 ?auto_76844 ) ) ( not ( = ?auto_76842 ?auto_76845 ) ) ( not ( = ?auto_76842 ?auto_76846 ) ) ( not ( = ?auto_76842 ?auto_76849 ) ) ( not ( = ?auto_76843 ?auto_76844 ) ) ( not ( = ?auto_76843 ?auto_76845 ) ) ( not ( = ?auto_76843 ?auto_76846 ) ) ( not ( = ?auto_76843 ?auto_76849 ) ) ( not ( = ?auto_76844 ?auto_76845 ) ) ( not ( = ?auto_76844 ?auto_76846 ) ) ( not ( = ?auto_76844 ?auto_76849 ) ) ( not ( = ?auto_76845 ?auto_76846 ) ) ( not ( = ?auto_76845 ?auto_76849 ) ) ( not ( = ?auto_76846 ?auto_76849 ) ) ( not ( = ?auto_76842 ?auto_76848 ) ) ( not ( = ?auto_76843 ?auto_76848 ) ) ( not ( = ?auto_76844 ?auto_76848 ) ) ( not ( = ?auto_76845 ?auto_76848 ) ) ( not ( = ?auto_76846 ?auto_76848 ) ) ( not ( = ?auto_76849 ?auto_76848 ) ) ( ON ?auto_76848 ?auto_76847 ) ( not ( = ?auto_76842 ?auto_76847 ) ) ( not ( = ?auto_76843 ?auto_76847 ) ) ( not ( = ?auto_76844 ?auto_76847 ) ) ( not ( = ?auto_76845 ?auto_76847 ) ) ( not ( = ?auto_76846 ?auto_76847 ) ) ( not ( = ?auto_76849 ?auto_76847 ) ) ( not ( = ?auto_76848 ?auto_76847 ) ) ( ON ?auto_76849 ?auto_76848 ) ( ON ?auto_76846 ?auto_76849 ) ( CLEAR ?auto_76846 ) ( ON-TABLE ?auto_76847 ) ( HOLDING ?auto_76845 ) ( CLEAR ?auto_76844 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76842 ?auto_76843 ?auto_76844 ?auto_76845 )
      ( MAKE-5PILE ?auto_76842 ?auto_76843 ?auto_76844 ?auto_76845 ?auto_76846 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76850 - BLOCK
      ?auto_76851 - BLOCK
      ?auto_76852 - BLOCK
      ?auto_76853 - BLOCK
      ?auto_76854 - BLOCK
    )
    :vars
    (
      ?auto_76857 - BLOCK
      ?auto_76856 - BLOCK
      ?auto_76855 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76850 ) ( ON ?auto_76851 ?auto_76850 ) ( ON ?auto_76852 ?auto_76851 ) ( not ( = ?auto_76850 ?auto_76851 ) ) ( not ( = ?auto_76850 ?auto_76852 ) ) ( not ( = ?auto_76850 ?auto_76853 ) ) ( not ( = ?auto_76850 ?auto_76854 ) ) ( not ( = ?auto_76850 ?auto_76857 ) ) ( not ( = ?auto_76851 ?auto_76852 ) ) ( not ( = ?auto_76851 ?auto_76853 ) ) ( not ( = ?auto_76851 ?auto_76854 ) ) ( not ( = ?auto_76851 ?auto_76857 ) ) ( not ( = ?auto_76852 ?auto_76853 ) ) ( not ( = ?auto_76852 ?auto_76854 ) ) ( not ( = ?auto_76852 ?auto_76857 ) ) ( not ( = ?auto_76853 ?auto_76854 ) ) ( not ( = ?auto_76853 ?auto_76857 ) ) ( not ( = ?auto_76854 ?auto_76857 ) ) ( not ( = ?auto_76850 ?auto_76856 ) ) ( not ( = ?auto_76851 ?auto_76856 ) ) ( not ( = ?auto_76852 ?auto_76856 ) ) ( not ( = ?auto_76853 ?auto_76856 ) ) ( not ( = ?auto_76854 ?auto_76856 ) ) ( not ( = ?auto_76857 ?auto_76856 ) ) ( ON ?auto_76856 ?auto_76855 ) ( not ( = ?auto_76850 ?auto_76855 ) ) ( not ( = ?auto_76851 ?auto_76855 ) ) ( not ( = ?auto_76852 ?auto_76855 ) ) ( not ( = ?auto_76853 ?auto_76855 ) ) ( not ( = ?auto_76854 ?auto_76855 ) ) ( not ( = ?auto_76857 ?auto_76855 ) ) ( not ( = ?auto_76856 ?auto_76855 ) ) ( ON ?auto_76857 ?auto_76856 ) ( ON ?auto_76854 ?auto_76857 ) ( ON-TABLE ?auto_76855 ) ( CLEAR ?auto_76852 ) ( ON ?auto_76853 ?auto_76854 ) ( CLEAR ?auto_76853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76855 ?auto_76856 ?auto_76857 ?auto_76854 )
      ( MAKE-5PILE ?auto_76850 ?auto_76851 ?auto_76852 ?auto_76853 ?auto_76854 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76858 - BLOCK
      ?auto_76859 - BLOCK
      ?auto_76860 - BLOCK
      ?auto_76861 - BLOCK
      ?auto_76862 - BLOCK
    )
    :vars
    (
      ?auto_76863 - BLOCK
      ?auto_76865 - BLOCK
      ?auto_76864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76858 ) ( ON ?auto_76859 ?auto_76858 ) ( not ( = ?auto_76858 ?auto_76859 ) ) ( not ( = ?auto_76858 ?auto_76860 ) ) ( not ( = ?auto_76858 ?auto_76861 ) ) ( not ( = ?auto_76858 ?auto_76862 ) ) ( not ( = ?auto_76858 ?auto_76863 ) ) ( not ( = ?auto_76859 ?auto_76860 ) ) ( not ( = ?auto_76859 ?auto_76861 ) ) ( not ( = ?auto_76859 ?auto_76862 ) ) ( not ( = ?auto_76859 ?auto_76863 ) ) ( not ( = ?auto_76860 ?auto_76861 ) ) ( not ( = ?auto_76860 ?auto_76862 ) ) ( not ( = ?auto_76860 ?auto_76863 ) ) ( not ( = ?auto_76861 ?auto_76862 ) ) ( not ( = ?auto_76861 ?auto_76863 ) ) ( not ( = ?auto_76862 ?auto_76863 ) ) ( not ( = ?auto_76858 ?auto_76865 ) ) ( not ( = ?auto_76859 ?auto_76865 ) ) ( not ( = ?auto_76860 ?auto_76865 ) ) ( not ( = ?auto_76861 ?auto_76865 ) ) ( not ( = ?auto_76862 ?auto_76865 ) ) ( not ( = ?auto_76863 ?auto_76865 ) ) ( ON ?auto_76865 ?auto_76864 ) ( not ( = ?auto_76858 ?auto_76864 ) ) ( not ( = ?auto_76859 ?auto_76864 ) ) ( not ( = ?auto_76860 ?auto_76864 ) ) ( not ( = ?auto_76861 ?auto_76864 ) ) ( not ( = ?auto_76862 ?auto_76864 ) ) ( not ( = ?auto_76863 ?auto_76864 ) ) ( not ( = ?auto_76865 ?auto_76864 ) ) ( ON ?auto_76863 ?auto_76865 ) ( ON ?auto_76862 ?auto_76863 ) ( ON-TABLE ?auto_76864 ) ( ON ?auto_76861 ?auto_76862 ) ( CLEAR ?auto_76861 ) ( HOLDING ?auto_76860 ) ( CLEAR ?auto_76859 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76858 ?auto_76859 ?auto_76860 )
      ( MAKE-5PILE ?auto_76858 ?auto_76859 ?auto_76860 ?auto_76861 ?auto_76862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76866 - BLOCK
      ?auto_76867 - BLOCK
      ?auto_76868 - BLOCK
      ?auto_76869 - BLOCK
      ?auto_76870 - BLOCK
    )
    :vars
    (
      ?auto_76871 - BLOCK
      ?auto_76873 - BLOCK
      ?auto_76872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76866 ) ( ON ?auto_76867 ?auto_76866 ) ( not ( = ?auto_76866 ?auto_76867 ) ) ( not ( = ?auto_76866 ?auto_76868 ) ) ( not ( = ?auto_76866 ?auto_76869 ) ) ( not ( = ?auto_76866 ?auto_76870 ) ) ( not ( = ?auto_76866 ?auto_76871 ) ) ( not ( = ?auto_76867 ?auto_76868 ) ) ( not ( = ?auto_76867 ?auto_76869 ) ) ( not ( = ?auto_76867 ?auto_76870 ) ) ( not ( = ?auto_76867 ?auto_76871 ) ) ( not ( = ?auto_76868 ?auto_76869 ) ) ( not ( = ?auto_76868 ?auto_76870 ) ) ( not ( = ?auto_76868 ?auto_76871 ) ) ( not ( = ?auto_76869 ?auto_76870 ) ) ( not ( = ?auto_76869 ?auto_76871 ) ) ( not ( = ?auto_76870 ?auto_76871 ) ) ( not ( = ?auto_76866 ?auto_76873 ) ) ( not ( = ?auto_76867 ?auto_76873 ) ) ( not ( = ?auto_76868 ?auto_76873 ) ) ( not ( = ?auto_76869 ?auto_76873 ) ) ( not ( = ?auto_76870 ?auto_76873 ) ) ( not ( = ?auto_76871 ?auto_76873 ) ) ( ON ?auto_76873 ?auto_76872 ) ( not ( = ?auto_76866 ?auto_76872 ) ) ( not ( = ?auto_76867 ?auto_76872 ) ) ( not ( = ?auto_76868 ?auto_76872 ) ) ( not ( = ?auto_76869 ?auto_76872 ) ) ( not ( = ?auto_76870 ?auto_76872 ) ) ( not ( = ?auto_76871 ?auto_76872 ) ) ( not ( = ?auto_76873 ?auto_76872 ) ) ( ON ?auto_76871 ?auto_76873 ) ( ON ?auto_76870 ?auto_76871 ) ( ON-TABLE ?auto_76872 ) ( ON ?auto_76869 ?auto_76870 ) ( CLEAR ?auto_76867 ) ( ON ?auto_76868 ?auto_76869 ) ( CLEAR ?auto_76868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76872 ?auto_76873 ?auto_76871 ?auto_76870 ?auto_76869 )
      ( MAKE-5PILE ?auto_76866 ?auto_76867 ?auto_76868 ?auto_76869 ?auto_76870 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76874 - BLOCK
      ?auto_76875 - BLOCK
      ?auto_76876 - BLOCK
      ?auto_76877 - BLOCK
      ?auto_76878 - BLOCK
    )
    :vars
    (
      ?auto_76881 - BLOCK
      ?auto_76879 - BLOCK
      ?auto_76880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76874 ) ( not ( = ?auto_76874 ?auto_76875 ) ) ( not ( = ?auto_76874 ?auto_76876 ) ) ( not ( = ?auto_76874 ?auto_76877 ) ) ( not ( = ?auto_76874 ?auto_76878 ) ) ( not ( = ?auto_76874 ?auto_76881 ) ) ( not ( = ?auto_76875 ?auto_76876 ) ) ( not ( = ?auto_76875 ?auto_76877 ) ) ( not ( = ?auto_76875 ?auto_76878 ) ) ( not ( = ?auto_76875 ?auto_76881 ) ) ( not ( = ?auto_76876 ?auto_76877 ) ) ( not ( = ?auto_76876 ?auto_76878 ) ) ( not ( = ?auto_76876 ?auto_76881 ) ) ( not ( = ?auto_76877 ?auto_76878 ) ) ( not ( = ?auto_76877 ?auto_76881 ) ) ( not ( = ?auto_76878 ?auto_76881 ) ) ( not ( = ?auto_76874 ?auto_76879 ) ) ( not ( = ?auto_76875 ?auto_76879 ) ) ( not ( = ?auto_76876 ?auto_76879 ) ) ( not ( = ?auto_76877 ?auto_76879 ) ) ( not ( = ?auto_76878 ?auto_76879 ) ) ( not ( = ?auto_76881 ?auto_76879 ) ) ( ON ?auto_76879 ?auto_76880 ) ( not ( = ?auto_76874 ?auto_76880 ) ) ( not ( = ?auto_76875 ?auto_76880 ) ) ( not ( = ?auto_76876 ?auto_76880 ) ) ( not ( = ?auto_76877 ?auto_76880 ) ) ( not ( = ?auto_76878 ?auto_76880 ) ) ( not ( = ?auto_76881 ?auto_76880 ) ) ( not ( = ?auto_76879 ?auto_76880 ) ) ( ON ?auto_76881 ?auto_76879 ) ( ON ?auto_76878 ?auto_76881 ) ( ON-TABLE ?auto_76880 ) ( ON ?auto_76877 ?auto_76878 ) ( ON ?auto_76876 ?auto_76877 ) ( CLEAR ?auto_76876 ) ( HOLDING ?auto_76875 ) ( CLEAR ?auto_76874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76874 ?auto_76875 )
      ( MAKE-5PILE ?auto_76874 ?auto_76875 ?auto_76876 ?auto_76877 ?auto_76878 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76882 - BLOCK
      ?auto_76883 - BLOCK
      ?auto_76884 - BLOCK
      ?auto_76885 - BLOCK
      ?auto_76886 - BLOCK
    )
    :vars
    (
      ?auto_76888 - BLOCK
      ?auto_76889 - BLOCK
      ?auto_76887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_76882 ) ( not ( = ?auto_76882 ?auto_76883 ) ) ( not ( = ?auto_76882 ?auto_76884 ) ) ( not ( = ?auto_76882 ?auto_76885 ) ) ( not ( = ?auto_76882 ?auto_76886 ) ) ( not ( = ?auto_76882 ?auto_76888 ) ) ( not ( = ?auto_76883 ?auto_76884 ) ) ( not ( = ?auto_76883 ?auto_76885 ) ) ( not ( = ?auto_76883 ?auto_76886 ) ) ( not ( = ?auto_76883 ?auto_76888 ) ) ( not ( = ?auto_76884 ?auto_76885 ) ) ( not ( = ?auto_76884 ?auto_76886 ) ) ( not ( = ?auto_76884 ?auto_76888 ) ) ( not ( = ?auto_76885 ?auto_76886 ) ) ( not ( = ?auto_76885 ?auto_76888 ) ) ( not ( = ?auto_76886 ?auto_76888 ) ) ( not ( = ?auto_76882 ?auto_76889 ) ) ( not ( = ?auto_76883 ?auto_76889 ) ) ( not ( = ?auto_76884 ?auto_76889 ) ) ( not ( = ?auto_76885 ?auto_76889 ) ) ( not ( = ?auto_76886 ?auto_76889 ) ) ( not ( = ?auto_76888 ?auto_76889 ) ) ( ON ?auto_76889 ?auto_76887 ) ( not ( = ?auto_76882 ?auto_76887 ) ) ( not ( = ?auto_76883 ?auto_76887 ) ) ( not ( = ?auto_76884 ?auto_76887 ) ) ( not ( = ?auto_76885 ?auto_76887 ) ) ( not ( = ?auto_76886 ?auto_76887 ) ) ( not ( = ?auto_76888 ?auto_76887 ) ) ( not ( = ?auto_76889 ?auto_76887 ) ) ( ON ?auto_76888 ?auto_76889 ) ( ON ?auto_76886 ?auto_76888 ) ( ON-TABLE ?auto_76887 ) ( ON ?auto_76885 ?auto_76886 ) ( ON ?auto_76884 ?auto_76885 ) ( CLEAR ?auto_76882 ) ( ON ?auto_76883 ?auto_76884 ) ( CLEAR ?auto_76883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76887 ?auto_76889 ?auto_76888 ?auto_76886 ?auto_76885 ?auto_76884 )
      ( MAKE-5PILE ?auto_76882 ?auto_76883 ?auto_76884 ?auto_76885 ?auto_76886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76890 - BLOCK
      ?auto_76891 - BLOCK
      ?auto_76892 - BLOCK
      ?auto_76893 - BLOCK
      ?auto_76894 - BLOCK
    )
    :vars
    (
      ?auto_76897 - BLOCK
      ?auto_76895 - BLOCK
      ?auto_76896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76890 ?auto_76891 ) ) ( not ( = ?auto_76890 ?auto_76892 ) ) ( not ( = ?auto_76890 ?auto_76893 ) ) ( not ( = ?auto_76890 ?auto_76894 ) ) ( not ( = ?auto_76890 ?auto_76897 ) ) ( not ( = ?auto_76891 ?auto_76892 ) ) ( not ( = ?auto_76891 ?auto_76893 ) ) ( not ( = ?auto_76891 ?auto_76894 ) ) ( not ( = ?auto_76891 ?auto_76897 ) ) ( not ( = ?auto_76892 ?auto_76893 ) ) ( not ( = ?auto_76892 ?auto_76894 ) ) ( not ( = ?auto_76892 ?auto_76897 ) ) ( not ( = ?auto_76893 ?auto_76894 ) ) ( not ( = ?auto_76893 ?auto_76897 ) ) ( not ( = ?auto_76894 ?auto_76897 ) ) ( not ( = ?auto_76890 ?auto_76895 ) ) ( not ( = ?auto_76891 ?auto_76895 ) ) ( not ( = ?auto_76892 ?auto_76895 ) ) ( not ( = ?auto_76893 ?auto_76895 ) ) ( not ( = ?auto_76894 ?auto_76895 ) ) ( not ( = ?auto_76897 ?auto_76895 ) ) ( ON ?auto_76895 ?auto_76896 ) ( not ( = ?auto_76890 ?auto_76896 ) ) ( not ( = ?auto_76891 ?auto_76896 ) ) ( not ( = ?auto_76892 ?auto_76896 ) ) ( not ( = ?auto_76893 ?auto_76896 ) ) ( not ( = ?auto_76894 ?auto_76896 ) ) ( not ( = ?auto_76897 ?auto_76896 ) ) ( not ( = ?auto_76895 ?auto_76896 ) ) ( ON ?auto_76897 ?auto_76895 ) ( ON ?auto_76894 ?auto_76897 ) ( ON-TABLE ?auto_76896 ) ( ON ?auto_76893 ?auto_76894 ) ( ON ?auto_76892 ?auto_76893 ) ( ON ?auto_76891 ?auto_76892 ) ( CLEAR ?auto_76891 ) ( HOLDING ?auto_76890 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76890 )
      ( MAKE-5PILE ?auto_76890 ?auto_76891 ?auto_76892 ?auto_76893 ?auto_76894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_76898 - BLOCK
      ?auto_76899 - BLOCK
      ?auto_76900 - BLOCK
      ?auto_76901 - BLOCK
      ?auto_76902 - BLOCK
    )
    :vars
    (
      ?auto_76905 - BLOCK
      ?auto_76903 - BLOCK
      ?auto_76904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76898 ?auto_76899 ) ) ( not ( = ?auto_76898 ?auto_76900 ) ) ( not ( = ?auto_76898 ?auto_76901 ) ) ( not ( = ?auto_76898 ?auto_76902 ) ) ( not ( = ?auto_76898 ?auto_76905 ) ) ( not ( = ?auto_76899 ?auto_76900 ) ) ( not ( = ?auto_76899 ?auto_76901 ) ) ( not ( = ?auto_76899 ?auto_76902 ) ) ( not ( = ?auto_76899 ?auto_76905 ) ) ( not ( = ?auto_76900 ?auto_76901 ) ) ( not ( = ?auto_76900 ?auto_76902 ) ) ( not ( = ?auto_76900 ?auto_76905 ) ) ( not ( = ?auto_76901 ?auto_76902 ) ) ( not ( = ?auto_76901 ?auto_76905 ) ) ( not ( = ?auto_76902 ?auto_76905 ) ) ( not ( = ?auto_76898 ?auto_76903 ) ) ( not ( = ?auto_76899 ?auto_76903 ) ) ( not ( = ?auto_76900 ?auto_76903 ) ) ( not ( = ?auto_76901 ?auto_76903 ) ) ( not ( = ?auto_76902 ?auto_76903 ) ) ( not ( = ?auto_76905 ?auto_76903 ) ) ( ON ?auto_76903 ?auto_76904 ) ( not ( = ?auto_76898 ?auto_76904 ) ) ( not ( = ?auto_76899 ?auto_76904 ) ) ( not ( = ?auto_76900 ?auto_76904 ) ) ( not ( = ?auto_76901 ?auto_76904 ) ) ( not ( = ?auto_76902 ?auto_76904 ) ) ( not ( = ?auto_76905 ?auto_76904 ) ) ( not ( = ?auto_76903 ?auto_76904 ) ) ( ON ?auto_76905 ?auto_76903 ) ( ON ?auto_76902 ?auto_76905 ) ( ON-TABLE ?auto_76904 ) ( ON ?auto_76901 ?auto_76902 ) ( ON ?auto_76900 ?auto_76901 ) ( ON ?auto_76899 ?auto_76900 ) ( ON ?auto_76898 ?auto_76899 ) ( CLEAR ?auto_76898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76904 ?auto_76903 ?auto_76905 ?auto_76902 ?auto_76901 ?auto_76900 ?auto_76899 )
      ( MAKE-5PILE ?auto_76898 ?auto_76899 ?auto_76900 ?auto_76901 ?auto_76902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76908 - BLOCK
      ?auto_76909 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_76909 ) ( CLEAR ?auto_76908 ) ( ON-TABLE ?auto_76908 ) ( not ( = ?auto_76908 ?auto_76909 ) ) )
    :subtasks
    ( ( !STACK ?auto_76909 ?auto_76908 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76910 - BLOCK
      ?auto_76911 - BLOCK
    )
    :vars
    (
      ?auto_76912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_76910 ) ( ON-TABLE ?auto_76910 ) ( not ( = ?auto_76910 ?auto_76911 ) ) ( ON ?auto_76911 ?auto_76912 ) ( CLEAR ?auto_76911 ) ( HAND-EMPTY ) ( not ( = ?auto_76910 ?auto_76912 ) ) ( not ( = ?auto_76911 ?auto_76912 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76911 ?auto_76912 )
      ( MAKE-2PILE ?auto_76910 ?auto_76911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76913 - BLOCK
      ?auto_76914 - BLOCK
    )
    :vars
    (
      ?auto_76915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76913 ?auto_76914 ) ) ( ON ?auto_76914 ?auto_76915 ) ( CLEAR ?auto_76914 ) ( not ( = ?auto_76913 ?auto_76915 ) ) ( not ( = ?auto_76914 ?auto_76915 ) ) ( HOLDING ?auto_76913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76913 )
      ( MAKE-2PILE ?auto_76913 ?auto_76914 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76916 - BLOCK
      ?auto_76917 - BLOCK
    )
    :vars
    (
      ?auto_76918 - BLOCK
      ?auto_76921 - BLOCK
      ?auto_76920 - BLOCK
      ?auto_76919 - BLOCK
      ?auto_76922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76916 ?auto_76917 ) ) ( ON ?auto_76917 ?auto_76918 ) ( not ( = ?auto_76916 ?auto_76918 ) ) ( not ( = ?auto_76917 ?auto_76918 ) ) ( ON ?auto_76916 ?auto_76917 ) ( CLEAR ?auto_76916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76921 ) ( ON ?auto_76920 ?auto_76921 ) ( ON ?auto_76919 ?auto_76920 ) ( ON ?auto_76922 ?auto_76919 ) ( ON ?auto_76918 ?auto_76922 ) ( not ( = ?auto_76921 ?auto_76920 ) ) ( not ( = ?auto_76921 ?auto_76919 ) ) ( not ( = ?auto_76921 ?auto_76922 ) ) ( not ( = ?auto_76921 ?auto_76918 ) ) ( not ( = ?auto_76921 ?auto_76917 ) ) ( not ( = ?auto_76921 ?auto_76916 ) ) ( not ( = ?auto_76920 ?auto_76919 ) ) ( not ( = ?auto_76920 ?auto_76922 ) ) ( not ( = ?auto_76920 ?auto_76918 ) ) ( not ( = ?auto_76920 ?auto_76917 ) ) ( not ( = ?auto_76920 ?auto_76916 ) ) ( not ( = ?auto_76919 ?auto_76922 ) ) ( not ( = ?auto_76919 ?auto_76918 ) ) ( not ( = ?auto_76919 ?auto_76917 ) ) ( not ( = ?auto_76919 ?auto_76916 ) ) ( not ( = ?auto_76922 ?auto_76918 ) ) ( not ( = ?auto_76922 ?auto_76917 ) ) ( not ( = ?auto_76922 ?auto_76916 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76921 ?auto_76920 ?auto_76919 ?auto_76922 ?auto_76918 ?auto_76917 )
      ( MAKE-2PILE ?auto_76916 ?auto_76917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76923 - BLOCK
      ?auto_76924 - BLOCK
    )
    :vars
    (
      ?auto_76928 - BLOCK
      ?auto_76926 - BLOCK
      ?auto_76929 - BLOCK
      ?auto_76927 - BLOCK
      ?auto_76925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76923 ?auto_76924 ) ) ( ON ?auto_76924 ?auto_76928 ) ( not ( = ?auto_76923 ?auto_76928 ) ) ( not ( = ?auto_76924 ?auto_76928 ) ) ( ON-TABLE ?auto_76926 ) ( ON ?auto_76929 ?auto_76926 ) ( ON ?auto_76927 ?auto_76929 ) ( ON ?auto_76925 ?auto_76927 ) ( ON ?auto_76928 ?auto_76925 ) ( not ( = ?auto_76926 ?auto_76929 ) ) ( not ( = ?auto_76926 ?auto_76927 ) ) ( not ( = ?auto_76926 ?auto_76925 ) ) ( not ( = ?auto_76926 ?auto_76928 ) ) ( not ( = ?auto_76926 ?auto_76924 ) ) ( not ( = ?auto_76926 ?auto_76923 ) ) ( not ( = ?auto_76929 ?auto_76927 ) ) ( not ( = ?auto_76929 ?auto_76925 ) ) ( not ( = ?auto_76929 ?auto_76928 ) ) ( not ( = ?auto_76929 ?auto_76924 ) ) ( not ( = ?auto_76929 ?auto_76923 ) ) ( not ( = ?auto_76927 ?auto_76925 ) ) ( not ( = ?auto_76927 ?auto_76928 ) ) ( not ( = ?auto_76927 ?auto_76924 ) ) ( not ( = ?auto_76927 ?auto_76923 ) ) ( not ( = ?auto_76925 ?auto_76928 ) ) ( not ( = ?auto_76925 ?auto_76924 ) ) ( not ( = ?auto_76925 ?auto_76923 ) ) ( HOLDING ?auto_76923 ) ( CLEAR ?auto_76924 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_76926 ?auto_76929 ?auto_76927 ?auto_76925 ?auto_76928 ?auto_76924 ?auto_76923 )
      ( MAKE-2PILE ?auto_76923 ?auto_76924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76930 - BLOCK
      ?auto_76931 - BLOCK
    )
    :vars
    (
      ?auto_76935 - BLOCK
      ?auto_76932 - BLOCK
      ?auto_76934 - BLOCK
      ?auto_76936 - BLOCK
      ?auto_76933 - BLOCK
      ?auto_76937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76930 ?auto_76931 ) ) ( ON ?auto_76931 ?auto_76935 ) ( not ( = ?auto_76930 ?auto_76935 ) ) ( not ( = ?auto_76931 ?auto_76935 ) ) ( ON-TABLE ?auto_76932 ) ( ON ?auto_76934 ?auto_76932 ) ( ON ?auto_76936 ?auto_76934 ) ( ON ?auto_76933 ?auto_76936 ) ( ON ?auto_76935 ?auto_76933 ) ( not ( = ?auto_76932 ?auto_76934 ) ) ( not ( = ?auto_76932 ?auto_76936 ) ) ( not ( = ?auto_76932 ?auto_76933 ) ) ( not ( = ?auto_76932 ?auto_76935 ) ) ( not ( = ?auto_76932 ?auto_76931 ) ) ( not ( = ?auto_76932 ?auto_76930 ) ) ( not ( = ?auto_76934 ?auto_76936 ) ) ( not ( = ?auto_76934 ?auto_76933 ) ) ( not ( = ?auto_76934 ?auto_76935 ) ) ( not ( = ?auto_76934 ?auto_76931 ) ) ( not ( = ?auto_76934 ?auto_76930 ) ) ( not ( = ?auto_76936 ?auto_76933 ) ) ( not ( = ?auto_76936 ?auto_76935 ) ) ( not ( = ?auto_76936 ?auto_76931 ) ) ( not ( = ?auto_76936 ?auto_76930 ) ) ( not ( = ?auto_76933 ?auto_76935 ) ) ( not ( = ?auto_76933 ?auto_76931 ) ) ( not ( = ?auto_76933 ?auto_76930 ) ) ( CLEAR ?auto_76931 ) ( ON ?auto_76930 ?auto_76937 ) ( CLEAR ?auto_76930 ) ( HAND-EMPTY ) ( not ( = ?auto_76930 ?auto_76937 ) ) ( not ( = ?auto_76931 ?auto_76937 ) ) ( not ( = ?auto_76935 ?auto_76937 ) ) ( not ( = ?auto_76932 ?auto_76937 ) ) ( not ( = ?auto_76934 ?auto_76937 ) ) ( not ( = ?auto_76936 ?auto_76937 ) ) ( not ( = ?auto_76933 ?auto_76937 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_76930 ?auto_76937 )
      ( MAKE-2PILE ?auto_76930 ?auto_76931 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76938 - BLOCK
      ?auto_76939 - BLOCK
    )
    :vars
    (
      ?auto_76945 - BLOCK
      ?auto_76942 - BLOCK
      ?auto_76944 - BLOCK
      ?auto_76940 - BLOCK
      ?auto_76943 - BLOCK
      ?auto_76941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76938 ?auto_76939 ) ) ( not ( = ?auto_76938 ?auto_76945 ) ) ( not ( = ?auto_76939 ?auto_76945 ) ) ( ON-TABLE ?auto_76942 ) ( ON ?auto_76944 ?auto_76942 ) ( ON ?auto_76940 ?auto_76944 ) ( ON ?auto_76943 ?auto_76940 ) ( ON ?auto_76945 ?auto_76943 ) ( not ( = ?auto_76942 ?auto_76944 ) ) ( not ( = ?auto_76942 ?auto_76940 ) ) ( not ( = ?auto_76942 ?auto_76943 ) ) ( not ( = ?auto_76942 ?auto_76945 ) ) ( not ( = ?auto_76942 ?auto_76939 ) ) ( not ( = ?auto_76942 ?auto_76938 ) ) ( not ( = ?auto_76944 ?auto_76940 ) ) ( not ( = ?auto_76944 ?auto_76943 ) ) ( not ( = ?auto_76944 ?auto_76945 ) ) ( not ( = ?auto_76944 ?auto_76939 ) ) ( not ( = ?auto_76944 ?auto_76938 ) ) ( not ( = ?auto_76940 ?auto_76943 ) ) ( not ( = ?auto_76940 ?auto_76945 ) ) ( not ( = ?auto_76940 ?auto_76939 ) ) ( not ( = ?auto_76940 ?auto_76938 ) ) ( not ( = ?auto_76943 ?auto_76945 ) ) ( not ( = ?auto_76943 ?auto_76939 ) ) ( not ( = ?auto_76943 ?auto_76938 ) ) ( ON ?auto_76938 ?auto_76941 ) ( CLEAR ?auto_76938 ) ( not ( = ?auto_76938 ?auto_76941 ) ) ( not ( = ?auto_76939 ?auto_76941 ) ) ( not ( = ?auto_76945 ?auto_76941 ) ) ( not ( = ?auto_76942 ?auto_76941 ) ) ( not ( = ?auto_76944 ?auto_76941 ) ) ( not ( = ?auto_76940 ?auto_76941 ) ) ( not ( = ?auto_76943 ?auto_76941 ) ) ( HOLDING ?auto_76939 ) ( CLEAR ?auto_76945 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_76942 ?auto_76944 ?auto_76940 ?auto_76943 ?auto_76945 ?auto_76939 )
      ( MAKE-2PILE ?auto_76938 ?auto_76939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76946 - BLOCK
      ?auto_76947 - BLOCK
    )
    :vars
    (
      ?auto_76950 - BLOCK
      ?auto_76951 - BLOCK
      ?auto_76952 - BLOCK
      ?auto_76949 - BLOCK
      ?auto_76948 - BLOCK
      ?auto_76953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76946 ?auto_76947 ) ) ( not ( = ?auto_76946 ?auto_76950 ) ) ( not ( = ?auto_76947 ?auto_76950 ) ) ( ON-TABLE ?auto_76951 ) ( ON ?auto_76952 ?auto_76951 ) ( ON ?auto_76949 ?auto_76952 ) ( ON ?auto_76948 ?auto_76949 ) ( ON ?auto_76950 ?auto_76948 ) ( not ( = ?auto_76951 ?auto_76952 ) ) ( not ( = ?auto_76951 ?auto_76949 ) ) ( not ( = ?auto_76951 ?auto_76948 ) ) ( not ( = ?auto_76951 ?auto_76950 ) ) ( not ( = ?auto_76951 ?auto_76947 ) ) ( not ( = ?auto_76951 ?auto_76946 ) ) ( not ( = ?auto_76952 ?auto_76949 ) ) ( not ( = ?auto_76952 ?auto_76948 ) ) ( not ( = ?auto_76952 ?auto_76950 ) ) ( not ( = ?auto_76952 ?auto_76947 ) ) ( not ( = ?auto_76952 ?auto_76946 ) ) ( not ( = ?auto_76949 ?auto_76948 ) ) ( not ( = ?auto_76949 ?auto_76950 ) ) ( not ( = ?auto_76949 ?auto_76947 ) ) ( not ( = ?auto_76949 ?auto_76946 ) ) ( not ( = ?auto_76948 ?auto_76950 ) ) ( not ( = ?auto_76948 ?auto_76947 ) ) ( not ( = ?auto_76948 ?auto_76946 ) ) ( ON ?auto_76946 ?auto_76953 ) ( not ( = ?auto_76946 ?auto_76953 ) ) ( not ( = ?auto_76947 ?auto_76953 ) ) ( not ( = ?auto_76950 ?auto_76953 ) ) ( not ( = ?auto_76951 ?auto_76953 ) ) ( not ( = ?auto_76952 ?auto_76953 ) ) ( not ( = ?auto_76949 ?auto_76953 ) ) ( not ( = ?auto_76948 ?auto_76953 ) ) ( CLEAR ?auto_76950 ) ( ON ?auto_76947 ?auto_76946 ) ( CLEAR ?auto_76947 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_76953 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_76953 ?auto_76946 )
      ( MAKE-2PILE ?auto_76946 ?auto_76947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76954 - BLOCK
      ?auto_76955 - BLOCK
    )
    :vars
    (
      ?auto_76959 - BLOCK
      ?auto_76961 - BLOCK
      ?auto_76957 - BLOCK
      ?auto_76960 - BLOCK
      ?auto_76956 - BLOCK
      ?auto_76958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76954 ?auto_76955 ) ) ( not ( = ?auto_76954 ?auto_76959 ) ) ( not ( = ?auto_76955 ?auto_76959 ) ) ( ON-TABLE ?auto_76961 ) ( ON ?auto_76957 ?auto_76961 ) ( ON ?auto_76960 ?auto_76957 ) ( ON ?auto_76956 ?auto_76960 ) ( not ( = ?auto_76961 ?auto_76957 ) ) ( not ( = ?auto_76961 ?auto_76960 ) ) ( not ( = ?auto_76961 ?auto_76956 ) ) ( not ( = ?auto_76961 ?auto_76959 ) ) ( not ( = ?auto_76961 ?auto_76955 ) ) ( not ( = ?auto_76961 ?auto_76954 ) ) ( not ( = ?auto_76957 ?auto_76960 ) ) ( not ( = ?auto_76957 ?auto_76956 ) ) ( not ( = ?auto_76957 ?auto_76959 ) ) ( not ( = ?auto_76957 ?auto_76955 ) ) ( not ( = ?auto_76957 ?auto_76954 ) ) ( not ( = ?auto_76960 ?auto_76956 ) ) ( not ( = ?auto_76960 ?auto_76959 ) ) ( not ( = ?auto_76960 ?auto_76955 ) ) ( not ( = ?auto_76960 ?auto_76954 ) ) ( not ( = ?auto_76956 ?auto_76959 ) ) ( not ( = ?auto_76956 ?auto_76955 ) ) ( not ( = ?auto_76956 ?auto_76954 ) ) ( ON ?auto_76954 ?auto_76958 ) ( not ( = ?auto_76954 ?auto_76958 ) ) ( not ( = ?auto_76955 ?auto_76958 ) ) ( not ( = ?auto_76959 ?auto_76958 ) ) ( not ( = ?auto_76961 ?auto_76958 ) ) ( not ( = ?auto_76957 ?auto_76958 ) ) ( not ( = ?auto_76960 ?auto_76958 ) ) ( not ( = ?auto_76956 ?auto_76958 ) ) ( ON ?auto_76955 ?auto_76954 ) ( CLEAR ?auto_76955 ) ( ON-TABLE ?auto_76958 ) ( HOLDING ?auto_76959 ) ( CLEAR ?auto_76956 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76961 ?auto_76957 ?auto_76960 ?auto_76956 ?auto_76959 )
      ( MAKE-2PILE ?auto_76954 ?auto_76955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76962 - BLOCK
      ?auto_76963 - BLOCK
    )
    :vars
    (
      ?auto_76965 - BLOCK
      ?auto_76967 - BLOCK
      ?auto_76966 - BLOCK
      ?auto_76968 - BLOCK
      ?auto_76964 - BLOCK
      ?auto_76969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76962 ?auto_76963 ) ) ( not ( = ?auto_76962 ?auto_76965 ) ) ( not ( = ?auto_76963 ?auto_76965 ) ) ( ON-TABLE ?auto_76967 ) ( ON ?auto_76966 ?auto_76967 ) ( ON ?auto_76968 ?auto_76966 ) ( ON ?auto_76964 ?auto_76968 ) ( not ( = ?auto_76967 ?auto_76966 ) ) ( not ( = ?auto_76967 ?auto_76968 ) ) ( not ( = ?auto_76967 ?auto_76964 ) ) ( not ( = ?auto_76967 ?auto_76965 ) ) ( not ( = ?auto_76967 ?auto_76963 ) ) ( not ( = ?auto_76967 ?auto_76962 ) ) ( not ( = ?auto_76966 ?auto_76968 ) ) ( not ( = ?auto_76966 ?auto_76964 ) ) ( not ( = ?auto_76966 ?auto_76965 ) ) ( not ( = ?auto_76966 ?auto_76963 ) ) ( not ( = ?auto_76966 ?auto_76962 ) ) ( not ( = ?auto_76968 ?auto_76964 ) ) ( not ( = ?auto_76968 ?auto_76965 ) ) ( not ( = ?auto_76968 ?auto_76963 ) ) ( not ( = ?auto_76968 ?auto_76962 ) ) ( not ( = ?auto_76964 ?auto_76965 ) ) ( not ( = ?auto_76964 ?auto_76963 ) ) ( not ( = ?auto_76964 ?auto_76962 ) ) ( ON ?auto_76962 ?auto_76969 ) ( not ( = ?auto_76962 ?auto_76969 ) ) ( not ( = ?auto_76963 ?auto_76969 ) ) ( not ( = ?auto_76965 ?auto_76969 ) ) ( not ( = ?auto_76967 ?auto_76969 ) ) ( not ( = ?auto_76966 ?auto_76969 ) ) ( not ( = ?auto_76968 ?auto_76969 ) ) ( not ( = ?auto_76964 ?auto_76969 ) ) ( ON ?auto_76963 ?auto_76962 ) ( ON-TABLE ?auto_76969 ) ( CLEAR ?auto_76964 ) ( ON ?auto_76965 ?auto_76963 ) ( CLEAR ?auto_76965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76969 ?auto_76962 ?auto_76963 )
      ( MAKE-2PILE ?auto_76962 ?auto_76963 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76970 - BLOCK
      ?auto_76971 - BLOCK
    )
    :vars
    (
      ?auto_76977 - BLOCK
      ?auto_76972 - BLOCK
      ?auto_76974 - BLOCK
      ?auto_76975 - BLOCK
      ?auto_76973 - BLOCK
      ?auto_76976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76970 ?auto_76971 ) ) ( not ( = ?auto_76970 ?auto_76977 ) ) ( not ( = ?auto_76971 ?auto_76977 ) ) ( ON-TABLE ?auto_76972 ) ( ON ?auto_76974 ?auto_76972 ) ( ON ?auto_76975 ?auto_76974 ) ( not ( = ?auto_76972 ?auto_76974 ) ) ( not ( = ?auto_76972 ?auto_76975 ) ) ( not ( = ?auto_76972 ?auto_76973 ) ) ( not ( = ?auto_76972 ?auto_76977 ) ) ( not ( = ?auto_76972 ?auto_76971 ) ) ( not ( = ?auto_76972 ?auto_76970 ) ) ( not ( = ?auto_76974 ?auto_76975 ) ) ( not ( = ?auto_76974 ?auto_76973 ) ) ( not ( = ?auto_76974 ?auto_76977 ) ) ( not ( = ?auto_76974 ?auto_76971 ) ) ( not ( = ?auto_76974 ?auto_76970 ) ) ( not ( = ?auto_76975 ?auto_76973 ) ) ( not ( = ?auto_76975 ?auto_76977 ) ) ( not ( = ?auto_76975 ?auto_76971 ) ) ( not ( = ?auto_76975 ?auto_76970 ) ) ( not ( = ?auto_76973 ?auto_76977 ) ) ( not ( = ?auto_76973 ?auto_76971 ) ) ( not ( = ?auto_76973 ?auto_76970 ) ) ( ON ?auto_76970 ?auto_76976 ) ( not ( = ?auto_76970 ?auto_76976 ) ) ( not ( = ?auto_76971 ?auto_76976 ) ) ( not ( = ?auto_76977 ?auto_76976 ) ) ( not ( = ?auto_76972 ?auto_76976 ) ) ( not ( = ?auto_76974 ?auto_76976 ) ) ( not ( = ?auto_76975 ?auto_76976 ) ) ( not ( = ?auto_76973 ?auto_76976 ) ) ( ON ?auto_76971 ?auto_76970 ) ( ON-TABLE ?auto_76976 ) ( ON ?auto_76977 ?auto_76971 ) ( CLEAR ?auto_76977 ) ( HOLDING ?auto_76973 ) ( CLEAR ?auto_76975 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76972 ?auto_76974 ?auto_76975 ?auto_76973 )
      ( MAKE-2PILE ?auto_76970 ?auto_76971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76978 - BLOCK
      ?auto_76979 - BLOCK
    )
    :vars
    (
      ?auto_76980 - BLOCK
      ?auto_76983 - BLOCK
      ?auto_76984 - BLOCK
      ?auto_76981 - BLOCK
      ?auto_76985 - BLOCK
      ?auto_76982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76978 ?auto_76979 ) ) ( not ( = ?auto_76978 ?auto_76980 ) ) ( not ( = ?auto_76979 ?auto_76980 ) ) ( ON-TABLE ?auto_76983 ) ( ON ?auto_76984 ?auto_76983 ) ( ON ?auto_76981 ?auto_76984 ) ( not ( = ?auto_76983 ?auto_76984 ) ) ( not ( = ?auto_76983 ?auto_76981 ) ) ( not ( = ?auto_76983 ?auto_76985 ) ) ( not ( = ?auto_76983 ?auto_76980 ) ) ( not ( = ?auto_76983 ?auto_76979 ) ) ( not ( = ?auto_76983 ?auto_76978 ) ) ( not ( = ?auto_76984 ?auto_76981 ) ) ( not ( = ?auto_76984 ?auto_76985 ) ) ( not ( = ?auto_76984 ?auto_76980 ) ) ( not ( = ?auto_76984 ?auto_76979 ) ) ( not ( = ?auto_76984 ?auto_76978 ) ) ( not ( = ?auto_76981 ?auto_76985 ) ) ( not ( = ?auto_76981 ?auto_76980 ) ) ( not ( = ?auto_76981 ?auto_76979 ) ) ( not ( = ?auto_76981 ?auto_76978 ) ) ( not ( = ?auto_76985 ?auto_76980 ) ) ( not ( = ?auto_76985 ?auto_76979 ) ) ( not ( = ?auto_76985 ?auto_76978 ) ) ( ON ?auto_76978 ?auto_76982 ) ( not ( = ?auto_76978 ?auto_76982 ) ) ( not ( = ?auto_76979 ?auto_76982 ) ) ( not ( = ?auto_76980 ?auto_76982 ) ) ( not ( = ?auto_76983 ?auto_76982 ) ) ( not ( = ?auto_76984 ?auto_76982 ) ) ( not ( = ?auto_76981 ?auto_76982 ) ) ( not ( = ?auto_76985 ?auto_76982 ) ) ( ON ?auto_76979 ?auto_76978 ) ( ON-TABLE ?auto_76982 ) ( ON ?auto_76980 ?auto_76979 ) ( CLEAR ?auto_76981 ) ( ON ?auto_76985 ?auto_76980 ) ( CLEAR ?auto_76985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_76982 ?auto_76978 ?auto_76979 ?auto_76980 )
      ( MAKE-2PILE ?auto_76978 ?auto_76979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76986 - BLOCK
      ?auto_76987 - BLOCK
    )
    :vars
    (
      ?auto_76988 - BLOCK
      ?auto_76993 - BLOCK
      ?auto_76990 - BLOCK
      ?auto_76992 - BLOCK
      ?auto_76989 - BLOCK
      ?auto_76991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76986 ?auto_76987 ) ) ( not ( = ?auto_76986 ?auto_76988 ) ) ( not ( = ?auto_76987 ?auto_76988 ) ) ( ON-TABLE ?auto_76993 ) ( ON ?auto_76990 ?auto_76993 ) ( not ( = ?auto_76993 ?auto_76990 ) ) ( not ( = ?auto_76993 ?auto_76992 ) ) ( not ( = ?auto_76993 ?auto_76989 ) ) ( not ( = ?auto_76993 ?auto_76988 ) ) ( not ( = ?auto_76993 ?auto_76987 ) ) ( not ( = ?auto_76993 ?auto_76986 ) ) ( not ( = ?auto_76990 ?auto_76992 ) ) ( not ( = ?auto_76990 ?auto_76989 ) ) ( not ( = ?auto_76990 ?auto_76988 ) ) ( not ( = ?auto_76990 ?auto_76987 ) ) ( not ( = ?auto_76990 ?auto_76986 ) ) ( not ( = ?auto_76992 ?auto_76989 ) ) ( not ( = ?auto_76992 ?auto_76988 ) ) ( not ( = ?auto_76992 ?auto_76987 ) ) ( not ( = ?auto_76992 ?auto_76986 ) ) ( not ( = ?auto_76989 ?auto_76988 ) ) ( not ( = ?auto_76989 ?auto_76987 ) ) ( not ( = ?auto_76989 ?auto_76986 ) ) ( ON ?auto_76986 ?auto_76991 ) ( not ( = ?auto_76986 ?auto_76991 ) ) ( not ( = ?auto_76987 ?auto_76991 ) ) ( not ( = ?auto_76988 ?auto_76991 ) ) ( not ( = ?auto_76993 ?auto_76991 ) ) ( not ( = ?auto_76990 ?auto_76991 ) ) ( not ( = ?auto_76992 ?auto_76991 ) ) ( not ( = ?auto_76989 ?auto_76991 ) ) ( ON ?auto_76987 ?auto_76986 ) ( ON-TABLE ?auto_76991 ) ( ON ?auto_76988 ?auto_76987 ) ( ON ?auto_76989 ?auto_76988 ) ( CLEAR ?auto_76989 ) ( HOLDING ?auto_76992 ) ( CLEAR ?auto_76990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_76993 ?auto_76990 ?auto_76992 )
      ( MAKE-2PILE ?auto_76986 ?auto_76987 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_76994 - BLOCK
      ?auto_76995 - BLOCK
    )
    :vars
    (
      ?auto_77000 - BLOCK
      ?auto_76997 - BLOCK
      ?auto_77001 - BLOCK
      ?auto_76999 - BLOCK
      ?auto_76998 - BLOCK
      ?auto_76996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_76994 ?auto_76995 ) ) ( not ( = ?auto_76994 ?auto_77000 ) ) ( not ( = ?auto_76995 ?auto_77000 ) ) ( ON-TABLE ?auto_76997 ) ( ON ?auto_77001 ?auto_76997 ) ( not ( = ?auto_76997 ?auto_77001 ) ) ( not ( = ?auto_76997 ?auto_76999 ) ) ( not ( = ?auto_76997 ?auto_76998 ) ) ( not ( = ?auto_76997 ?auto_77000 ) ) ( not ( = ?auto_76997 ?auto_76995 ) ) ( not ( = ?auto_76997 ?auto_76994 ) ) ( not ( = ?auto_77001 ?auto_76999 ) ) ( not ( = ?auto_77001 ?auto_76998 ) ) ( not ( = ?auto_77001 ?auto_77000 ) ) ( not ( = ?auto_77001 ?auto_76995 ) ) ( not ( = ?auto_77001 ?auto_76994 ) ) ( not ( = ?auto_76999 ?auto_76998 ) ) ( not ( = ?auto_76999 ?auto_77000 ) ) ( not ( = ?auto_76999 ?auto_76995 ) ) ( not ( = ?auto_76999 ?auto_76994 ) ) ( not ( = ?auto_76998 ?auto_77000 ) ) ( not ( = ?auto_76998 ?auto_76995 ) ) ( not ( = ?auto_76998 ?auto_76994 ) ) ( ON ?auto_76994 ?auto_76996 ) ( not ( = ?auto_76994 ?auto_76996 ) ) ( not ( = ?auto_76995 ?auto_76996 ) ) ( not ( = ?auto_77000 ?auto_76996 ) ) ( not ( = ?auto_76997 ?auto_76996 ) ) ( not ( = ?auto_77001 ?auto_76996 ) ) ( not ( = ?auto_76999 ?auto_76996 ) ) ( not ( = ?auto_76998 ?auto_76996 ) ) ( ON ?auto_76995 ?auto_76994 ) ( ON-TABLE ?auto_76996 ) ( ON ?auto_77000 ?auto_76995 ) ( ON ?auto_76998 ?auto_77000 ) ( CLEAR ?auto_77001 ) ( ON ?auto_76999 ?auto_76998 ) ( CLEAR ?auto_76999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_76996 ?auto_76994 ?auto_76995 ?auto_77000 ?auto_76998 )
      ( MAKE-2PILE ?auto_76994 ?auto_76995 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77002 - BLOCK
      ?auto_77003 - BLOCK
    )
    :vars
    (
      ?auto_77009 - BLOCK
      ?auto_77008 - BLOCK
      ?auto_77004 - BLOCK
      ?auto_77007 - BLOCK
      ?auto_77006 - BLOCK
      ?auto_77005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77002 ?auto_77003 ) ) ( not ( = ?auto_77002 ?auto_77009 ) ) ( not ( = ?auto_77003 ?auto_77009 ) ) ( ON-TABLE ?auto_77008 ) ( not ( = ?auto_77008 ?auto_77004 ) ) ( not ( = ?auto_77008 ?auto_77007 ) ) ( not ( = ?auto_77008 ?auto_77006 ) ) ( not ( = ?auto_77008 ?auto_77009 ) ) ( not ( = ?auto_77008 ?auto_77003 ) ) ( not ( = ?auto_77008 ?auto_77002 ) ) ( not ( = ?auto_77004 ?auto_77007 ) ) ( not ( = ?auto_77004 ?auto_77006 ) ) ( not ( = ?auto_77004 ?auto_77009 ) ) ( not ( = ?auto_77004 ?auto_77003 ) ) ( not ( = ?auto_77004 ?auto_77002 ) ) ( not ( = ?auto_77007 ?auto_77006 ) ) ( not ( = ?auto_77007 ?auto_77009 ) ) ( not ( = ?auto_77007 ?auto_77003 ) ) ( not ( = ?auto_77007 ?auto_77002 ) ) ( not ( = ?auto_77006 ?auto_77009 ) ) ( not ( = ?auto_77006 ?auto_77003 ) ) ( not ( = ?auto_77006 ?auto_77002 ) ) ( ON ?auto_77002 ?auto_77005 ) ( not ( = ?auto_77002 ?auto_77005 ) ) ( not ( = ?auto_77003 ?auto_77005 ) ) ( not ( = ?auto_77009 ?auto_77005 ) ) ( not ( = ?auto_77008 ?auto_77005 ) ) ( not ( = ?auto_77004 ?auto_77005 ) ) ( not ( = ?auto_77007 ?auto_77005 ) ) ( not ( = ?auto_77006 ?auto_77005 ) ) ( ON ?auto_77003 ?auto_77002 ) ( ON-TABLE ?auto_77005 ) ( ON ?auto_77009 ?auto_77003 ) ( ON ?auto_77006 ?auto_77009 ) ( ON ?auto_77007 ?auto_77006 ) ( CLEAR ?auto_77007 ) ( HOLDING ?auto_77004 ) ( CLEAR ?auto_77008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77008 ?auto_77004 )
      ( MAKE-2PILE ?auto_77002 ?auto_77003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77010 - BLOCK
      ?auto_77011 - BLOCK
    )
    :vars
    (
      ?auto_77013 - BLOCK
      ?auto_77014 - BLOCK
      ?auto_77012 - BLOCK
      ?auto_77015 - BLOCK
      ?auto_77016 - BLOCK
      ?auto_77017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77010 ?auto_77011 ) ) ( not ( = ?auto_77010 ?auto_77013 ) ) ( not ( = ?auto_77011 ?auto_77013 ) ) ( ON-TABLE ?auto_77014 ) ( not ( = ?auto_77014 ?auto_77012 ) ) ( not ( = ?auto_77014 ?auto_77015 ) ) ( not ( = ?auto_77014 ?auto_77016 ) ) ( not ( = ?auto_77014 ?auto_77013 ) ) ( not ( = ?auto_77014 ?auto_77011 ) ) ( not ( = ?auto_77014 ?auto_77010 ) ) ( not ( = ?auto_77012 ?auto_77015 ) ) ( not ( = ?auto_77012 ?auto_77016 ) ) ( not ( = ?auto_77012 ?auto_77013 ) ) ( not ( = ?auto_77012 ?auto_77011 ) ) ( not ( = ?auto_77012 ?auto_77010 ) ) ( not ( = ?auto_77015 ?auto_77016 ) ) ( not ( = ?auto_77015 ?auto_77013 ) ) ( not ( = ?auto_77015 ?auto_77011 ) ) ( not ( = ?auto_77015 ?auto_77010 ) ) ( not ( = ?auto_77016 ?auto_77013 ) ) ( not ( = ?auto_77016 ?auto_77011 ) ) ( not ( = ?auto_77016 ?auto_77010 ) ) ( ON ?auto_77010 ?auto_77017 ) ( not ( = ?auto_77010 ?auto_77017 ) ) ( not ( = ?auto_77011 ?auto_77017 ) ) ( not ( = ?auto_77013 ?auto_77017 ) ) ( not ( = ?auto_77014 ?auto_77017 ) ) ( not ( = ?auto_77012 ?auto_77017 ) ) ( not ( = ?auto_77015 ?auto_77017 ) ) ( not ( = ?auto_77016 ?auto_77017 ) ) ( ON ?auto_77011 ?auto_77010 ) ( ON-TABLE ?auto_77017 ) ( ON ?auto_77013 ?auto_77011 ) ( ON ?auto_77016 ?auto_77013 ) ( ON ?auto_77015 ?auto_77016 ) ( CLEAR ?auto_77014 ) ( ON ?auto_77012 ?auto_77015 ) ( CLEAR ?auto_77012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77017 ?auto_77010 ?auto_77011 ?auto_77013 ?auto_77016 ?auto_77015 )
      ( MAKE-2PILE ?auto_77010 ?auto_77011 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77018 - BLOCK
      ?auto_77019 - BLOCK
    )
    :vars
    (
      ?auto_77021 - BLOCK
      ?auto_77020 - BLOCK
      ?auto_77025 - BLOCK
      ?auto_77023 - BLOCK
      ?auto_77024 - BLOCK
      ?auto_77022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77018 ?auto_77019 ) ) ( not ( = ?auto_77018 ?auto_77021 ) ) ( not ( = ?auto_77019 ?auto_77021 ) ) ( not ( = ?auto_77020 ?auto_77025 ) ) ( not ( = ?auto_77020 ?auto_77023 ) ) ( not ( = ?auto_77020 ?auto_77024 ) ) ( not ( = ?auto_77020 ?auto_77021 ) ) ( not ( = ?auto_77020 ?auto_77019 ) ) ( not ( = ?auto_77020 ?auto_77018 ) ) ( not ( = ?auto_77025 ?auto_77023 ) ) ( not ( = ?auto_77025 ?auto_77024 ) ) ( not ( = ?auto_77025 ?auto_77021 ) ) ( not ( = ?auto_77025 ?auto_77019 ) ) ( not ( = ?auto_77025 ?auto_77018 ) ) ( not ( = ?auto_77023 ?auto_77024 ) ) ( not ( = ?auto_77023 ?auto_77021 ) ) ( not ( = ?auto_77023 ?auto_77019 ) ) ( not ( = ?auto_77023 ?auto_77018 ) ) ( not ( = ?auto_77024 ?auto_77021 ) ) ( not ( = ?auto_77024 ?auto_77019 ) ) ( not ( = ?auto_77024 ?auto_77018 ) ) ( ON ?auto_77018 ?auto_77022 ) ( not ( = ?auto_77018 ?auto_77022 ) ) ( not ( = ?auto_77019 ?auto_77022 ) ) ( not ( = ?auto_77021 ?auto_77022 ) ) ( not ( = ?auto_77020 ?auto_77022 ) ) ( not ( = ?auto_77025 ?auto_77022 ) ) ( not ( = ?auto_77023 ?auto_77022 ) ) ( not ( = ?auto_77024 ?auto_77022 ) ) ( ON ?auto_77019 ?auto_77018 ) ( ON-TABLE ?auto_77022 ) ( ON ?auto_77021 ?auto_77019 ) ( ON ?auto_77024 ?auto_77021 ) ( ON ?auto_77023 ?auto_77024 ) ( ON ?auto_77025 ?auto_77023 ) ( CLEAR ?auto_77025 ) ( HOLDING ?auto_77020 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77020 )
      ( MAKE-2PILE ?auto_77018 ?auto_77019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77026 - BLOCK
      ?auto_77027 - BLOCK
    )
    :vars
    (
      ?auto_77032 - BLOCK
      ?auto_77033 - BLOCK
      ?auto_77029 - BLOCK
      ?auto_77030 - BLOCK
      ?auto_77028 - BLOCK
      ?auto_77031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77026 ?auto_77027 ) ) ( not ( = ?auto_77026 ?auto_77032 ) ) ( not ( = ?auto_77027 ?auto_77032 ) ) ( not ( = ?auto_77033 ?auto_77029 ) ) ( not ( = ?auto_77033 ?auto_77030 ) ) ( not ( = ?auto_77033 ?auto_77028 ) ) ( not ( = ?auto_77033 ?auto_77032 ) ) ( not ( = ?auto_77033 ?auto_77027 ) ) ( not ( = ?auto_77033 ?auto_77026 ) ) ( not ( = ?auto_77029 ?auto_77030 ) ) ( not ( = ?auto_77029 ?auto_77028 ) ) ( not ( = ?auto_77029 ?auto_77032 ) ) ( not ( = ?auto_77029 ?auto_77027 ) ) ( not ( = ?auto_77029 ?auto_77026 ) ) ( not ( = ?auto_77030 ?auto_77028 ) ) ( not ( = ?auto_77030 ?auto_77032 ) ) ( not ( = ?auto_77030 ?auto_77027 ) ) ( not ( = ?auto_77030 ?auto_77026 ) ) ( not ( = ?auto_77028 ?auto_77032 ) ) ( not ( = ?auto_77028 ?auto_77027 ) ) ( not ( = ?auto_77028 ?auto_77026 ) ) ( ON ?auto_77026 ?auto_77031 ) ( not ( = ?auto_77026 ?auto_77031 ) ) ( not ( = ?auto_77027 ?auto_77031 ) ) ( not ( = ?auto_77032 ?auto_77031 ) ) ( not ( = ?auto_77033 ?auto_77031 ) ) ( not ( = ?auto_77029 ?auto_77031 ) ) ( not ( = ?auto_77030 ?auto_77031 ) ) ( not ( = ?auto_77028 ?auto_77031 ) ) ( ON ?auto_77027 ?auto_77026 ) ( ON-TABLE ?auto_77031 ) ( ON ?auto_77032 ?auto_77027 ) ( ON ?auto_77028 ?auto_77032 ) ( ON ?auto_77030 ?auto_77028 ) ( ON ?auto_77029 ?auto_77030 ) ( ON ?auto_77033 ?auto_77029 ) ( CLEAR ?auto_77033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77031 ?auto_77026 ?auto_77027 ?auto_77032 ?auto_77028 ?auto_77030 ?auto_77029 )
      ( MAKE-2PILE ?auto_77026 ?auto_77027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77038 - BLOCK
      ?auto_77039 - BLOCK
      ?auto_77040 - BLOCK
      ?auto_77041 - BLOCK
    )
    :vars
    (
      ?auto_77042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77042 ?auto_77041 ) ( CLEAR ?auto_77042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77038 ) ( ON ?auto_77039 ?auto_77038 ) ( ON ?auto_77040 ?auto_77039 ) ( ON ?auto_77041 ?auto_77040 ) ( not ( = ?auto_77038 ?auto_77039 ) ) ( not ( = ?auto_77038 ?auto_77040 ) ) ( not ( = ?auto_77038 ?auto_77041 ) ) ( not ( = ?auto_77038 ?auto_77042 ) ) ( not ( = ?auto_77039 ?auto_77040 ) ) ( not ( = ?auto_77039 ?auto_77041 ) ) ( not ( = ?auto_77039 ?auto_77042 ) ) ( not ( = ?auto_77040 ?auto_77041 ) ) ( not ( = ?auto_77040 ?auto_77042 ) ) ( not ( = ?auto_77041 ?auto_77042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77042 ?auto_77041 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77043 - BLOCK
      ?auto_77044 - BLOCK
      ?auto_77045 - BLOCK
      ?auto_77046 - BLOCK
    )
    :vars
    (
      ?auto_77047 - BLOCK
      ?auto_77048 - BLOCK
      ?auto_77049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77047 ?auto_77046 ) ( CLEAR ?auto_77047 ) ( ON-TABLE ?auto_77043 ) ( ON ?auto_77044 ?auto_77043 ) ( ON ?auto_77045 ?auto_77044 ) ( ON ?auto_77046 ?auto_77045 ) ( not ( = ?auto_77043 ?auto_77044 ) ) ( not ( = ?auto_77043 ?auto_77045 ) ) ( not ( = ?auto_77043 ?auto_77046 ) ) ( not ( = ?auto_77043 ?auto_77047 ) ) ( not ( = ?auto_77044 ?auto_77045 ) ) ( not ( = ?auto_77044 ?auto_77046 ) ) ( not ( = ?auto_77044 ?auto_77047 ) ) ( not ( = ?auto_77045 ?auto_77046 ) ) ( not ( = ?auto_77045 ?auto_77047 ) ) ( not ( = ?auto_77046 ?auto_77047 ) ) ( HOLDING ?auto_77048 ) ( CLEAR ?auto_77049 ) ( not ( = ?auto_77043 ?auto_77048 ) ) ( not ( = ?auto_77043 ?auto_77049 ) ) ( not ( = ?auto_77044 ?auto_77048 ) ) ( not ( = ?auto_77044 ?auto_77049 ) ) ( not ( = ?auto_77045 ?auto_77048 ) ) ( not ( = ?auto_77045 ?auto_77049 ) ) ( not ( = ?auto_77046 ?auto_77048 ) ) ( not ( = ?auto_77046 ?auto_77049 ) ) ( not ( = ?auto_77047 ?auto_77048 ) ) ( not ( = ?auto_77047 ?auto_77049 ) ) ( not ( = ?auto_77048 ?auto_77049 ) ) )
    :subtasks
    ( ( !STACK ?auto_77048 ?auto_77049 )
      ( MAKE-4PILE ?auto_77043 ?auto_77044 ?auto_77045 ?auto_77046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77050 - BLOCK
      ?auto_77051 - BLOCK
      ?auto_77052 - BLOCK
      ?auto_77053 - BLOCK
    )
    :vars
    (
      ?auto_77054 - BLOCK
      ?auto_77056 - BLOCK
      ?auto_77055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77054 ?auto_77053 ) ( ON-TABLE ?auto_77050 ) ( ON ?auto_77051 ?auto_77050 ) ( ON ?auto_77052 ?auto_77051 ) ( ON ?auto_77053 ?auto_77052 ) ( not ( = ?auto_77050 ?auto_77051 ) ) ( not ( = ?auto_77050 ?auto_77052 ) ) ( not ( = ?auto_77050 ?auto_77053 ) ) ( not ( = ?auto_77050 ?auto_77054 ) ) ( not ( = ?auto_77051 ?auto_77052 ) ) ( not ( = ?auto_77051 ?auto_77053 ) ) ( not ( = ?auto_77051 ?auto_77054 ) ) ( not ( = ?auto_77052 ?auto_77053 ) ) ( not ( = ?auto_77052 ?auto_77054 ) ) ( not ( = ?auto_77053 ?auto_77054 ) ) ( CLEAR ?auto_77056 ) ( not ( = ?auto_77050 ?auto_77055 ) ) ( not ( = ?auto_77050 ?auto_77056 ) ) ( not ( = ?auto_77051 ?auto_77055 ) ) ( not ( = ?auto_77051 ?auto_77056 ) ) ( not ( = ?auto_77052 ?auto_77055 ) ) ( not ( = ?auto_77052 ?auto_77056 ) ) ( not ( = ?auto_77053 ?auto_77055 ) ) ( not ( = ?auto_77053 ?auto_77056 ) ) ( not ( = ?auto_77054 ?auto_77055 ) ) ( not ( = ?auto_77054 ?auto_77056 ) ) ( not ( = ?auto_77055 ?auto_77056 ) ) ( ON ?auto_77055 ?auto_77054 ) ( CLEAR ?auto_77055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77050 ?auto_77051 ?auto_77052 ?auto_77053 ?auto_77054 )
      ( MAKE-4PILE ?auto_77050 ?auto_77051 ?auto_77052 ?auto_77053 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77057 - BLOCK
      ?auto_77058 - BLOCK
      ?auto_77059 - BLOCK
      ?auto_77060 - BLOCK
    )
    :vars
    (
      ?auto_77063 - BLOCK
      ?auto_77061 - BLOCK
      ?auto_77062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77063 ?auto_77060 ) ( ON-TABLE ?auto_77057 ) ( ON ?auto_77058 ?auto_77057 ) ( ON ?auto_77059 ?auto_77058 ) ( ON ?auto_77060 ?auto_77059 ) ( not ( = ?auto_77057 ?auto_77058 ) ) ( not ( = ?auto_77057 ?auto_77059 ) ) ( not ( = ?auto_77057 ?auto_77060 ) ) ( not ( = ?auto_77057 ?auto_77063 ) ) ( not ( = ?auto_77058 ?auto_77059 ) ) ( not ( = ?auto_77058 ?auto_77060 ) ) ( not ( = ?auto_77058 ?auto_77063 ) ) ( not ( = ?auto_77059 ?auto_77060 ) ) ( not ( = ?auto_77059 ?auto_77063 ) ) ( not ( = ?auto_77060 ?auto_77063 ) ) ( not ( = ?auto_77057 ?auto_77061 ) ) ( not ( = ?auto_77057 ?auto_77062 ) ) ( not ( = ?auto_77058 ?auto_77061 ) ) ( not ( = ?auto_77058 ?auto_77062 ) ) ( not ( = ?auto_77059 ?auto_77061 ) ) ( not ( = ?auto_77059 ?auto_77062 ) ) ( not ( = ?auto_77060 ?auto_77061 ) ) ( not ( = ?auto_77060 ?auto_77062 ) ) ( not ( = ?auto_77063 ?auto_77061 ) ) ( not ( = ?auto_77063 ?auto_77062 ) ) ( not ( = ?auto_77061 ?auto_77062 ) ) ( ON ?auto_77061 ?auto_77063 ) ( CLEAR ?auto_77061 ) ( HOLDING ?auto_77062 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77062 )
      ( MAKE-4PILE ?auto_77057 ?auto_77058 ?auto_77059 ?auto_77060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77064 - BLOCK
      ?auto_77065 - BLOCK
      ?auto_77066 - BLOCK
      ?auto_77067 - BLOCK
    )
    :vars
    (
      ?auto_77069 - BLOCK
      ?auto_77068 - BLOCK
      ?auto_77070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77069 ?auto_77067 ) ( ON-TABLE ?auto_77064 ) ( ON ?auto_77065 ?auto_77064 ) ( ON ?auto_77066 ?auto_77065 ) ( ON ?auto_77067 ?auto_77066 ) ( not ( = ?auto_77064 ?auto_77065 ) ) ( not ( = ?auto_77064 ?auto_77066 ) ) ( not ( = ?auto_77064 ?auto_77067 ) ) ( not ( = ?auto_77064 ?auto_77069 ) ) ( not ( = ?auto_77065 ?auto_77066 ) ) ( not ( = ?auto_77065 ?auto_77067 ) ) ( not ( = ?auto_77065 ?auto_77069 ) ) ( not ( = ?auto_77066 ?auto_77067 ) ) ( not ( = ?auto_77066 ?auto_77069 ) ) ( not ( = ?auto_77067 ?auto_77069 ) ) ( not ( = ?auto_77064 ?auto_77068 ) ) ( not ( = ?auto_77064 ?auto_77070 ) ) ( not ( = ?auto_77065 ?auto_77068 ) ) ( not ( = ?auto_77065 ?auto_77070 ) ) ( not ( = ?auto_77066 ?auto_77068 ) ) ( not ( = ?auto_77066 ?auto_77070 ) ) ( not ( = ?auto_77067 ?auto_77068 ) ) ( not ( = ?auto_77067 ?auto_77070 ) ) ( not ( = ?auto_77069 ?auto_77068 ) ) ( not ( = ?auto_77069 ?auto_77070 ) ) ( not ( = ?auto_77068 ?auto_77070 ) ) ( ON ?auto_77068 ?auto_77069 ) ( ON ?auto_77070 ?auto_77068 ) ( CLEAR ?auto_77070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77064 ?auto_77065 ?auto_77066 ?auto_77067 ?auto_77069 ?auto_77068 )
      ( MAKE-4PILE ?auto_77064 ?auto_77065 ?auto_77066 ?auto_77067 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77071 - BLOCK
      ?auto_77072 - BLOCK
      ?auto_77073 - BLOCK
      ?auto_77074 - BLOCK
    )
    :vars
    (
      ?auto_77077 - BLOCK
      ?auto_77075 - BLOCK
      ?auto_77076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77077 ?auto_77074 ) ( ON-TABLE ?auto_77071 ) ( ON ?auto_77072 ?auto_77071 ) ( ON ?auto_77073 ?auto_77072 ) ( ON ?auto_77074 ?auto_77073 ) ( not ( = ?auto_77071 ?auto_77072 ) ) ( not ( = ?auto_77071 ?auto_77073 ) ) ( not ( = ?auto_77071 ?auto_77074 ) ) ( not ( = ?auto_77071 ?auto_77077 ) ) ( not ( = ?auto_77072 ?auto_77073 ) ) ( not ( = ?auto_77072 ?auto_77074 ) ) ( not ( = ?auto_77072 ?auto_77077 ) ) ( not ( = ?auto_77073 ?auto_77074 ) ) ( not ( = ?auto_77073 ?auto_77077 ) ) ( not ( = ?auto_77074 ?auto_77077 ) ) ( not ( = ?auto_77071 ?auto_77075 ) ) ( not ( = ?auto_77071 ?auto_77076 ) ) ( not ( = ?auto_77072 ?auto_77075 ) ) ( not ( = ?auto_77072 ?auto_77076 ) ) ( not ( = ?auto_77073 ?auto_77075 ) ) ( not ( = ?auto_77073 ?auto_77076 ) ) ( not ( = ?auto_77074 ?auto_77075 ) ) ( not ( = ?auto_77074 ?auto_77076 ) ) ( not ( = ?auto_77077 ?auto_77075 ) ) ( not ( = ?auto_77077 ?auto_77076 ) ) ( not ( = ?auto_77075 ?auto_77076 ) ) ( ON ?auto_77075 ?auto_77077 ) ( HOLDING ?auto_77076 ) ( CLEAR ?auto_77075 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77071 ?auto_77072 ?auto_77073 ?auto_77074 ?auto_77077 ?auto_77075 ?auto_77076 )
      ( MAKE-4PILE ?auto_77071 ?auto_77072 ?auto_77073 ?auto_77074 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77078 - BLOCK
      ?auto_77079 - BLOCK
      ?auto_77080 - BLOCK
      ?auto_77081 - BLOCK
    )
    :vars
    (
      ?auto_77084 - BLOCK
      ?auto_77083 - BLOCK
      ?auto_77082 - BLOCK
      ?auto_77085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77084 ?auto_77081 ) ( ON-TABLE ?auto_77078 ) ( ON ?auto_77079 ?auto_77078 ) ( ON ?auto_77080 ?auto_77079 ) ( ON ?auto_77081 ?auto_77080 ) ( not ( = ?auto_77078 ?auto_77079 ) ) ( not ( = ?auto_77078 ?auto_77080 ) ) ( not ( = ?auto_77078 ?auto_77081 ) ) ( not ( = ?auto_77078 ?auto_77084 ) ) ( not ( = ?auto_77079 ?auto_77080 ) ) ( not ( = ?auto_77079 ?auto_77081 ) ) ( not ( = ?auto_77079 ?auto_77084 ) ) ( not ( = ?auto_77080 ?auto_77081 ) ) ( not ( = ?auto_77080 ?auto_77084 ) ) ( not ( = ?auto_77081 ?auto_77084 ) ) ( not ( = ?auto_77078 ?auto_77083 ) ) ( not ( = ?auto_77078 ?auto_77082 ) ) ( not ( = ?auto_77079 ?auto_77083 ) ) ( not ( = ?auto_77079 ?auto_77082 ) ) ( not ( = ?auto_77080 ?auto_77083 ) ) ( not ( = ?auto_77080 ?auto_77082 ) ) ( not ( = ?auto_77081 ?auto_77083 ) ) ( not ( = ?auto_77081 ?auto_77082 ) ) ( not ( = ?auto_77084 ?auto_77083 ) ) ( not ( = ?auto_77084 ?auto_77082 ) ) ( not ( = ?auto_77083 ?auto_77082 ) ) ( ON ?auto_77083 ?auto_77084 ) ( CLEAR ?auto_77083 ) ( ON ?auto_77082 ?auto_77085 ) ( CLEAR ?auto_77082 ) ( HAND-EMPTY ) ( not ( = ?auto_77078 ?auto_77085 ) ) ( not ( = ?auto_77079 ?auto_77085 ) ) ( not ( = ?auto_77080 ?auto_77085 ) ) ( not ( = ?auto_77081 ?auto_77085 ) ) ( not ( = ?auto_77084 ?auto_77085 ) ) ( not ( = ?auto_77083 ?auto_77085 ) ) ( not ( = ?auto_77082 ?auto_77085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77082 ?auto_77085 )
      ( MAKE-4PILE ?auto_77078 ?auto_77079 ?auto_77080 ?auto_77081 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77086 - BLOCK
      ?auto_77087 - BLOCK
      ?auto_77088 - BLOCK
      ?auto_77089 - BLOCK
    )
    :vars
    (
      ?auto_77092 - BLOCK
      ?auto_77090 - BLOCK
      ?auto_77093 - BLOCK
      ?auto_77091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77092 ?auto_77089 ) ( ON-TABLE ?auto_77086 ) ( ON ?auto_77087 ?auto_77086 ) ( ON ?auto_77088 ?auto_77087 ) ( ON ?auto_77089 ?auto_77088 ) ( not ( = ?auto_77086 ?auto_77087 ) ) ( not ( = ?auto_77086 ?auto_77088 ) ) ( not ( = ?auto_77086 ?auto_77089 ) ) ( not ( = ?auto_77086 ?auto_77092 ) ) ( not ( = ?auto_77087 ?auto_77088 ) ) ( not ( = ?auto_77087 ?auto_77089 ) ) ( not ( = ?auto_77087 ?auto_77092 ) ) ( not ( = ?auto_77088 ?auto_77089 ) ) ( not ( = ?auto_77088 ?auto_77092 ) ) ( not ( = ?auto_77089 ?auto_77092 ) ) ( not ( = ?auto_77086 ?auto_77090 ) ) ( not ( = ?auto_77086 ?auto_77093 ) ) ( not ( = ?auto_77087 ?auto_77090 ) ) ( not ( = ?auto_77087 ?auto_77093 ) ) ( not ( = ?auto_77088 ?auto_77090 ) ) ( not ( = ?auto_77088 ?auto_77093 ) ) ( not ( = ?auto_77089 ?auto_77090 ) ) ( not ( = ?auto_77089 ?auto_77093 ) ) ( not ( = ?auto_77092 ?auto_77090 ) ) ( not ( = ?auto_77092 ?auto_77093 ) ) ( not ( = ?auto_77090 ?auto_77093 ) ) ( ON ?auto_77093 ?auto_77091 ) ( CLEAR ?auto_77093 ) ( not ( = ?auto_77086 ?auto_77091 ) ) ( not ( = ?auto_77087 ?auto_77091 ) ) ( not ( = ?auto_77088 ?auto_77091 ) ) ( not ( = ?auto_77089 ?auto_77091 ) ) ( not ( = ?auto_77092 ?auto_77091 ) ) ( not ( = ?auto_77090 ?auto_77091 ) ) ( not ( = ?auto_77093 ?auto_77091 ) ) ( HOLDING ?auto_77090 ) ( CLEAR ?auto_77092 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77086 ?auto_77087 ?auto_77088 ?auto_77089 ?auto_77092 ?auto_77090 )
      ( MAKE-4PILE ?auto_77086 ?auto_77087 ?auto_77088 ?auto_77089 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77094 - BLOCK
      ?auto_77095 - BLOCK
      ?auto_77096 - BLOCK
      ?auto_77097 - BLOCK
    )
    :vars
    (
      ?auto_77101 - BLOCK
      ?auto_77098 - BLOCK
      ?auto_77099 - BLOCK
      ?auto_77100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77101 ?auto_77097 ) ( ON-TABLE ?auto_77094 ) ( ON ?auto_77095 ?auto_77094 ) ( ON ?auto_77096 ?auto_77095 ) ( ON ?auto_77097 ?auto_77096 ) ( not ( = ?auto_77094 ?auto_77095 ) ) ( not ( = ?auto_77094 ?auto_77096 ) ) ( not ( = ?auto_77094 ?auto_77097 ) ) ( not ( = ?auto_77094 ?auto_77101 ) ) ( not ( = ?auto_77095 ?auto_77096 ) ) ( not ( = ?auto_77095 ?auto_77097 ) ) ( not ( = ?auto_77095 ?auto_77101 ) ) ( not ( = ?auto_77096 ?auto_77097 ) ) ( not ( = ?auto_77096 ?auto_77101 ) ) ( not ( = ?auto_77097 ?auto_77101 ) ) ( not ( = ?auto_77094 ?auto_77098 ) ) ( not ( = ?auto_77094 ?auto_77099 ) ) ( not ( = ?auto_77095 ?auto_77098 ) ) ( not ( = ?auto_77095 ?auto_77099 ) ) ( not ( = ?auto_77096 ?auto_77098 ) ) ( not ( = ?auto_77096 ?auto_77099 ) ) ( not ( = ?auto_77097 ?auto_77098 ) ) ( not ( = ?auto_77097 ?auto_77099 ) ) ( not ( = ?auto_77101 ?auto_77098 ) ) ( not ( = ?auto_77101 ?auto_77099 ) ) ( not ( = ?auto_77098 ?auto_77099 ) ) ( ON ?auto_77099 ?auto_77100 ) ( not ( = ?auto_77094 ?auto_77100 ) ) ( not ( = ?auto_77095 ?auto_77100 ) ) ( not ( = ?auto_77096 ?auto_77100 ) ) ( not ( = ?auto_77097 ?auto_77100 ) ) ( not ( = ?auto_77101 ?auto_77100 ) ) ( not ( = ?auto_77098 ?auto_77100 ) ) ( not ( = ?auto_77099 ?auto_77100 ) ) ( CLEAR ?auto_77101 ) ( ON ?auto_77098 ?auto_77099 ) ( CLEAR ?auto_77098 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77100 ?auto_77099 )
      ( MAKE-4PILE ?auto_77094 ?auto_77095 ?auto_77096 ?auto_77097 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77118 - BLOCK
      ?auto_77119 - BLOCK
      ?auto_77120 - BLOCK
      ?auto_77121 - BLOCK
    )
    :vars
    (
      ?auto_77123 - BLOCK
      ?auto_77122 - BLOCK
      ?auto_77124 - BLOCK
      ?auto_77125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77118 ) ( ON ?auto_77119 ?auto_77118 ) ( ON ?auto_77120 ?auto_77119 ) ( not ( = ?auto_77118 ?auto_77119 ) ) ( not ( = ?auto_77118 ?auto_77120 ) ) ( not ( = ?auto_77118 ?auto_77121 ) ) ( not ( = ?auto_77118 ?auto_77123 ) ) ( not ( = ?auto_77119 ?auto_77120 ) ) ( not ( = ?auto_77119 ?auto_77121 ) ) ( not ( = ?auto_77119 ?auto_77123 ) ) ( not ( = ?auto_77120 ?auto_77121 ) ) ( not ( = ?auto_77120 ?auto_77123 ) ) ( not ( = ?auto_77121 ?auto_77123 ) ) ( not ( = ?auto_77118 ?auto_77122 ) ) ( not ( = ?auto_77118 ?auto_77124 ) ) ( not ( = ?auto_77119 ?auto_77122 ) ) ( not ( = ?auto_77119 ?auto_77124 ) ) ( not ( = ?auto_77120 ?auto_77122 ) ) ( not ( = ?auto_77120 ?auto_77124 ) ) ( not ( = ?auto_77121 ?auto_77122 ) ) ( not ( = ?auto_77121 ?auto_77124 ) ) ( not ( = ?auto_77123 ?auto_77122 ) ) ( not ( = ?auto_77123 ?auto_77124 ) ) ( not ( = ?auto_77122 ?auto_77124 ) ) ( ON ?auto_77124 ?auto_77125 ) ( not ( = ?auto_77118 ?auto_77125 ) ) ( not ( = ?auto_77119 ?auto_77125 ) ) ( not ( = ?auto_77120 ?auto_77125 ) ) ( not ( = ?auto_77121 ?auto_77125 ) ) ( not ( = ?auto_77123 ?auto_77125 ) ) ( not ( = ?auto_77122 ?auto_77125 ) ) ( not ( = ?auto_77124 ?auto_77125 ) ) ( ON ?auto_77122 ?auto_77124 ) ( ON-TABLE ?auto_77125 ) ( ON ?auto_77123 ?auto_77122 ) ( CLEAR ?auto_77123 ) ( HOLDING ?auto_77121 ) ( CLEAR ?auto_77120 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77118 ?auto_77119 ?auto_77120 ?auto_77121 ?auto_77123 )
      ( MAKE-4PILE ?auto_77118 ?auto_77119 ?auto_77120 ?auto_77121 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77126 - BLOCK
      ?auto_77127 - BLOCK
      ?auto_77128 - BLOCK
      ?auto_77129 - BLOCK
    )
    :vars
    (
      ?auto_77133 - BLOCK
      ?auto_77131 - BLOCK
      ?auto_77132 - BLOCK
      ?auto_77130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77126 ) ( ON ?auto_77127 ?auto_77126 ) ( ON ?auto_77128 ?auto_77127 ) ( not ( = ?auto_77126 ?auto_77127 ) ) ( not ( = ?auto_77126 ?auto_77128 ) ) ( not ( = ?auto_77126 ?auto_77129 ) ) ( not ( = ?auto_77126 ?auto_77133 ) ) ( not ( = ?auto_77127 ?auto_77128 ) ) ( not ( = ?auto_77127 ?auto_77129 ) ) ( not ( = ?auto_77127 ?auto_77133 ) ) ( not ( = ?auto_77128 ?auto_77129 ) ) ( not ( = ?auto_77128 ?auto_77133 ) ) ( not ( = ?auto_77129 ?auto_77133 ) ) ( not ( = ?auto_77126 ?auto_77131 ) ) ( not ( = ?auto_77126 ?auto_77132 ) ) ( not ( = ?auto_77127 ?auto_77131 ) ) ( not ( = ?auto_77127 ?auto_77132 ) ) ( not ( = ?auto_77128 ?auto_77131 ) ) ( not ( = ?auto_77128 ?auto_77132 ) ) ( not ( = ?auto_77129 ?auto_77131 ) ) ( not ( = ?auto_77129 ?auto_77132 ) ) ( not ( = ?auto_77133 ?auto_77131 ) ) ( not ( = ?auto_77133 ?auto_77132 ) ) ( not ( = ?auto_77131 ?auto_77132 ) ) ( ON ?auto_77132 ?auto_77130 ) ( not ( = ?auto_77126 ?auto_77130 ) ) ( not ( = ?auto_77127 ?auto_77130 ) ) ( not ( = ?auto_77128 ?auto_77130 ) ) ( not ( = ?auto_77129 ?auto_77130 ) ) ( not ( = ?auto_77133 ?auto_77130 ) ) ( not ( = ?auto_77131 ?auto_77130 ) ) ( not ( = ?auto_77132 ?auto_77130 ) ) ( ON ?auto_77131 ?auto_77132 ) ( ON-TABLE ?auto_77130 ) ( ON ?auto_77133 ?auto_77131 ) ( CLEAR ?auto_77128 ) ( ON ?auto_77129 ?auto_77133 ) ( CLEAR ?auto_77129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77130 ?auto_77132 ?auto_77131 ?auto_77133 )
      ( MAKE-4PILE ?auto_77126 ?auto_77127 ?auto_77128 ?auto_77129 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77134 - BLOCK
      ?auto_77135 - BLOCK
      ?auto_77136 - BLOCK
      ?auto_77137 - BLOCK
    )
    :vars
    (
      ?auto_77139 - BLOCK
      ?auto_77141 - BLOCK
      ?auto_77138 - BLOCK
      ?auto_77140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77134 ) ( ON ?auto_77135 ?auto_77134 ) ( not ( = ?auto_77134 ?auto_77135 ) ) ( not ( = ?auto_77134 ?auto_77136 ) ) ( not ( = ?auto_77134 ?auto_77137 ) ) ( not ( = ?auto_77134 ?auto_77139 ) ) ( not ( = ?auto_77135 ?auto_77136 ) ) ( not ( = ?auto_77135 ?auto_77137 ) ) ( not ( = ?auto_77135 ?auto_77139 ) ) ( not ( = ?auto_77136 ?auto_77137 ) ) ( not ( = ?auto_77136 ?auto_77139 ) ) ( not ( = ?auto_77137 ?auto_77139 ) ) ( not ( = ?auto_77134 ?auto_77141 ) ) ( not ( = ?auto_77134 ?auto_77138 ) ) ( not ( = ?auto_77135 ?auto_77141 ) ) ( not ( = ?auto_77135 ?auto_77138 ) ) ( not ( = ?auto_77136 ?auto_77141 ) ) ( not ( = ?auto_77136 ?auto_77138 ) ) ( not ( = ?auto_77137 ?auto_77141 ) ) ( not ( = ?auto_77137 ?auto_77138 ) ) ( not ( = ?auto_77139 ?auto_77141 ) ) ( not ( = ?auto_77139 ?auto_77138 ) ) ( not ( = ?auto_77141 ?auto_77138 ) ) ( ON ?auto_77138 ?auto_77140 ) ( not ( = ?auto_77134 ?auto_77140 ) ) ( not ( = ?auto_77135 ?auto_77140 ) ) ( not ( = ?auto_77136 ?auto_77140 ) ) ( not ( = ?auto_77137 ?auto_77140 ) ) ( not ( = ?auto_77139 ?auto_77140 ) ) ( not ( = ?auto_77141 ?auto_77140 ) ) ( not ( = ?auto_77138 ?auto_77140 ) ) ( ON ?auto_77141 ?auto_77138 ) ( ON-TABLE ?auto_77140 ) ( ON ?auto_77139 ?auto_77141 ) ( ON ?auto_77137 ?auto_77139 ) ( CLEAR ?auto_77137 ) ( HOLDING ?auto_77136 ) ( CLEAR ?auto_77135 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77134 ?auto_77135 ?auto_77136 )
      ( MAKE-4PILE ?auto_77134 ?auto_77135 ?auto_77136 ?auto_77137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77142 - BLOCK
      ?auto_77143 - BLOCK
      ?auto_77144 - BLOCK
      ?auto_77145 - BLOCK
    )
    :vars
    (
      ?auto_77146 - BLOCK
      ?auto_77149 - BLOCK
      ?auto_77147 - BLOCK
      ?auto_77148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77142 ) ( ON ?auto_77143 ?auto_77142 ) ( not ( = ?auto_77142 ?auto_77143 ) ) ( not ( = ?auto_77142 ?auto_77144 ) ) ( not ( = ?auto_77142 ?auto_77145 ) ) ( not ( = ?auto_77142 ?auto_77146 ) ) ( not ( = ?auto_77143 ?auto_77144 ) ) ( not ( = ?auto_77143 ?auto_77145 ) ) ( not ( = ?auto_77143 ?auto_77146 ) ) ( not ( = ?auto_77144 ?auto_77145 ) ) ( not ( = ?auto_77144 ?auto_77146 ) ) ( not ( = ?auto_77145 ?auto_77146 ) ) ( not ( = ?auto_77142 ?auto_77149 ) ) ( not ( = ?auto_77142 ?auto_77147 ) ) ( not ( = ?auto_77143 ?auto_77149 ) ) ( not ( = ?auto_77143 ?auto_77147 ) ) ( not ( = ?auto_77144 ?auto_77149 ) ) ( not ( = ?auto_77144 ?auto_77147 ) ) ( not ( = ?auto_77145 ?auto_77149 ) ) ( not ( = ?auto_77145 ?auto_77147 ) ) ( not ( = ?auto_77146 ?auto_77149 ) ) ( not ( = ?auto_77146 ?auto_77147 ) ) ( not ( = ?auto_77149 ?auto_77147 ) ) ( ON ?auto_77147 ?auto_77148 ) ( not ( = ?auto_77142 ?auto_77148 ) ) ( not ( = ?auto_77143 ?auto_77148 ) ) ( not ( = ?auto_77144 ?auto_77148 ) ) ( not ( = ?auto_77145 ?auto_77148 ) ) ( not ( = ?auto_77146 ?auto_77148 ) ) ( not ( = ?auto_77149 ?auto_77148 ) ) ( not ( = ?auto_77147 ?auto_77148 ) ) ( ON ?auto_77149 ?auto_77147 ) ( ON-TABLE ?auto_77148 ) ( ON ?auto_77146 ?auto_77149 ) ( ON ?auto_77145 ?auto_77146 ) ( CLEAR ?auto_77143 ) ( ON ?auto_77144 ?auto_77145 ) ( CLEAR ?auto_77144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77148 ?auto_77147 ?auto_77149 ?auto_77146 ?auto_77145 )
      ( MAKE-4PILE ?auto_77142 ?auto_77143 ?auto_77144 ?auto_77145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77150 - BLOCK
      ?auto_77151 - BLOCK
      ?auto_77152 - BLOCK
      ?auto_77153 - BLOCK
    )
    :vars
    (
      ?auto_77155 - BLOCK
      ?auto_77156 - BLOCK
      ?auto_77154 - BLOCK
      ?auto_77157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77150 ) ( not ( = ?auto_77150 ?auto_77151 ) ) ( not ( = ?auto_77150 ?auto_77152 ) ) ( not ( = ?auto_77150 ?auto_77153 ) ) ( not ( = ?auto_77150 ?auto_77155 ) ) ( not ( = ?auto_77151 ?auto_77152 ) ) ( not ( = ?auto_77151 ?auto_77153 ) ) ( not ( = ?auto_77151 ?auto_77155 ) ) ( not ( = ?auto_77152 ?auto_77153 ) ) ( not ( = ?auto_77152 ?auto_77155 ) ) ( not ( = ?auto_77153 ?auto_77155 ) ) ( not ( = ?auto_77150 ?auto_77156 ) ) ( not ( = ?auto_77150 ?auto_77154 ) ) ( not ( = ?auto_77151 ?auto_77156 ) ) ( not ( = ?auto_77151 ?auto_77154 ) ) ( not ( = ?auto_77152 ?auto_77156 ) ) ( not ( = ?auto_77152 ?auto_77154 ) ) ( not ( = ?auto_77153 ?auto_77156 ) ) ( not ( = ?auto_77153 ?auto_77154 ) ) ( not ( = ?auto_77155 ?auto_77156 ) ) ( not ( = ?auto_77155 ?auto_77154 ) ) ( not ( = ?auto_77156 ?auto_77154 ) ) ( ON ?auto_77154 ?auto_77157 ) ( not ( = ?auto_77150 ?auto_77157 ) ) ( not ( = ?auto_77151 ?auto_77157 ) ) ( not ( = ?auto_77152 ?auto_77157 ) ) ( not ( = ?auto_77153 ?auto_77157 ) ) ( not ( = ?auto_77155 ?auto_77157 ) ) ( not ( = ?auto_77156 ?auto_77157 ) ) ( not ( = ?auto_77154 ?auto_77157 ) ) ( ON ?auto_77156 ?auto_77154 ) ( ON-TABLE ?auto_77157 ) ( ON ?auto_77155 ?auto_77156 ) ( ON ?auto_77153 ?auto_77155 ) ( ON ?auto_77152 ?auto_77153 ) ( CLEAR ?auto_77152 ) ( HOLDING ?auto_77151 ) ( CLEAR ?auto_77150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77150 ?auto_77151 )
      ( MAKE-4PILE ?auto_77150 ?auto_77151 ?auto_77152 ?auto_77153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77158 - BLOCK
      ?auto_77159 - BLOCK
      ?auto_77160 - BLOCK
      ?auto_77161 - BLOCK
    )
    :vars
    (
      ?auto_77162 - BLOCK
      ?auto_77164 - BLOCK
      ?auto_77163 - BLOCK
      ?auto_77165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77158 ) ( not ( = ?auto_77158 ?auto_77159 ) ) ( not ( = ?auto_77158 ?auto_77160 ) ) ( not ( = ?auto_77158 ?auto_77161 ) ) ( not ( = ?auto_77158 ?auto_77162 ) ) ( not ( = ?auto_77159 ?auto_77160 ) ) ( not ( = ?auto_77159 ?auto_77161 ) ) ( not ( = ?auto_77159 ?auto_77162 ) ) ( not ( = ?auto_77160 ?auto_77161 ) ) ( not ( = ?auto_77160 ?auto_77162 ) ) ( not ( = ?auto_77161 ?auto_77162 ) ) ( not ( = ?auto_77158 ?auto_77164 ) ) ( not ( = ?auto_77158 ?auto_77163 ) ) ( not ( = ?auto_77159 ?auto_77164 ) ) ( not ( = ?auto_77159 ?auto_77163 ) ) ( not ( = ?auto_77160 ?auto_77164 ) ) ( not ( = ?auto_77160 ?auto_77163 ) ) ( not ( = ?auto_77161 ?auto_77164 ) ) ( not ( = ?auto_77161 ?auto_77163 ) ) ( not ( = ?auto_77162 ?auto_77164 ) ) ( not ( = ?auto_77162 ?auto_77163 ) ) ( not ( = ?auto_77164 ?auto_77163 ) ) ( ON ?auto_77163 ?auto_77165 ) ( not ( = ?auto_77158 ?auto_77165 ) ) ( not ( = ?auto_77159 ?auto_77165 ) ) ( not ( = ?auto_77160 ?auto_77165 ) ) ( not ( = ?auto_77161 ?auto_77165 ) ) ( not ( = ?auto_77162 ?auto_77165 ) ) ( not ( = ?auto_77164 ?auto_77165 ) ) ( not ( = ?auto_77163 ?auto_77165 ) ) ( ON ?auto_77164 ?auto_77163 ) ( ON-TABLE ?auto_77165 ) ( ON ?auto_77162 ?auto_77164 ) ( ON ?auto_77161 ?auto_77162 ) ( ON ?auto_77160 ?auto_77161 ) ( CLEAR ?auto_77158 ) ( ON ?auto_77159 ?auto_77160 ) ( CLEAR ?auto_77159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77165 ?auto_77163 ?auto_77164 ?auto_77162 ?auto_77161 ?auto_77160 )
      ( MAKE-4PILE ?auto_77158 ?auto_77159 ?auto_77160 ?auto_77161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77166 - BLOCK
      ?auto_77167 - BLOCK
      ?auto_77168 - BLOCK
      ?auto_77169 - BLOCK
    )
    :vars
    (
      ?auto_77172 - BLOCK
      ?auto_77171 - BLOCK
      ?auto_77173 - BLOCK
      ?auto_77170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77166 ?auto_77167 ) ) ( not ( = ?auto_77166 ?auto_77168 ) ) ( not ( = ?auto_77166 ?auto_77169 ) ) ( not ( = ?auto_77166 ?auto_77172 ) ) ( not ( = ?auto_77167 ?auto_77168 ) ) ( not ( = ?auto_77167 ?auto_77169 ) ) ( not ( = ?auto_77167 ?auto_77172 ) ) ( not ( = ?auto_77168 ?auto_77169 ) ) ( not ( = ?auto_77168 ?auto_77172 ) ) ( not ( = ?auto_77169 ?auto_77172 ) ) ( not ( = ?auto_77166 ?auto_77171 ) ) ( not ( = ?auto_77166 ?auto_77173 ) ) ( not ( = ?auto_77167 ?auto_77171 ) ) ( not ( = ?auto_77167 ?auto_77173 ) ) ( not ( = ?auto_77168 ?auto_77171 ) ) ( not ( = ?auto_77168 ?auto_77173 ) ) ( not ( = ?auto_77169 ?auto_77171 ) ) ( not ( = ?auto_77169 ?auto_77173 ) ) ( not ( = ?auto_77172 ?auto_77171 ) ) ( not ( = ?auto_77172 ?auto_77173 ) ) ( not ( = ?auto_77171 ?auto_77173 ) ) ( ON ?auto_77173 ?auto_77170 ) ( not ( = ?auto_77166 ?auto_77170 ) ) ( not ( = ?auto_77167 ?auto_77170 ) ) ( not ( = ?auto_77168 ?auto_77170 ) ) ( not ( = ?auto_77169 ?auto_77170 ) ) ( not ( = ?auto_77172 ?auto_77170 ) ) ( not ( = ?auto_77171 ?auto_77170 ) ) ( not ( = ?auto_77173 ?auto_77170 ) ) ( ON ?auto_77171 ?auto_77173 ) ( ON-TABLE ?auto_77170 ) ( ON ?auto_77172 ?auto_77171 ) ( ON ?auto_77169 ?auto_77172 ) ( ON ?auto_77168 ?auto_77169 ) ( ON ?auto_77167 ?auto_77168 ) ( CLEAR ?auto_77167 ) ( HOLDING ?auto_77166 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77166 )
      ( MAKE-4PILE ?auto_77166 ?auto_77167 ?auto_77168 ?auto_77169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77174 - BLOCK
      ?auto_77175 - BLOCK
      ?auto_77176 - BLOCK
      ?auto_77177 - BLOCK
    )
    :vars
    (
      ?auto_77181 - BLOCK
      ?auto_77179 - BLOCK
      ?auto_77180 - BLOCK
      ?auto_77178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77174 ?auto_77175 ) ) ( not ( = ?auto_77174 ?auto_77176 ) ) ( not ( = ?auto_77174 ?auto_77177 ) ) ( not ( = ?auto_77174 ?auto_77181 ) ) ( not ( = ?auto_77175 ?auto_77176 ) ) ( not ( = ?auto_77175 ?auto_77177 ) ) ( not ( = ?auto_77175 ?auto_77181 ) ) ( not ( = ?auto_77176 ?auto_77177 ) ) ( not ( = ?auto_77176 ?auto_77181 ) ) ( not ( = ?auto_77177 ?auto_77181 ) ) ( not ( = ?auto_77174 ?auto_77179 ) ) ( not ( = ?auto_77174 ?auto_77180 ) ) ( not ( = ?auto_77175 ?auto_77179 ) ) ( not ( = ?auto_77175 ?auto_77180 ) ) ( not ( = ?auto_77176 ?auto_77179 ) ) ( not ( = ?auto_77176 ?auto_77180 ) ) ( not ( = ?auto_77177 ?auto_77179 ) ) ( not ( = ?auto_77177 ?auto_77180 ) ) ( not ( = ?auto_77181 ?auto_77179 ) ) ( not ( = ?auto_77181 ?auto_77180 ) ) ( not ( = ?auto_77179 ?auto_77180 ) ) ( ON ?auto_77180 ?auto_77178 ) ( not ( = ?auto_77174 ?auto_77178 ) ) ( not ( = ?auto_77175 ?auto_77178 ) ) ( not ( = ?auto_77176 ?auto_77178 ) ) ( not ( = ?auto_77177 ?auto_77178 ) ) ( not ( = ?auto_77181 ?auto_77178 ) ) ( not ( = ?auto_77179 ?auto_77178 ) ) ( not ( = ?auto_77180 ?auto_77178 ) ) ( ON ?auto_77179 ?auto_77180 ) ( ON-TABLE ?auto_77178 ) ( ON ?auto_77181 ?auto_77179 ) ( ON ?auto_77177 ?auto_77181 ) ( ON ?auto_77176 ?auto_77177 ) ( ON ?auto_77175 ?auto_77176 ) ( ON ?auto_77174 ?auto_77175 ) ( CLEAR ?auto_77174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77178 ?auto_77180 ?auto_77179 ?auto_77181 ?auto_77177 ?auto_77176 ?auto_77175 )
      ( MAKE-4PILE ?auto_77174 ?auto_77175 ?auto_77176 ?auto_77177 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77185 - BLOCK
      ?auto_77186 - BLOCK
      ?auto_77187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_77187 ) ( CLEAR ?auto_77186 ) ( ON-TABLE ?auto_77185 ) ( ON ?auto_77186 ?auto_77185 ) ( not ( = ?auto_77185 ?auto_77186 ) ) ( not ( = ?auto_77185 ?auto_77187 ) ) ( not ( = ?auto_77186 ?auto_77187 ) ) )
    :subtasks
    ( ( !STACK ?auto_77187 ?auto_77186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77188 - BLOCK
      ?auto_77189 - BLOCK
      ?auto_77190 - BLOCK
    )
    :vars
    (
      ?auto_77191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77189 ) ( ON-TABLE ?auto_77188 ) ( ON ?auto_77189 ?auto_77188 ) ( not ( = ?auto_77188 ?auto_77189 ) ) ( not ( = ?auto_77188 ?auto_77190 ) ) ( not ( = ?auto_77189 ?auto_77190 ) ) ( ON ?auto_77190 ?auto_77191 ) ( CLEAR ?auto_77190 ) ( HAND-EMPTY ) ( not ( = ?auto_77188 ?auto_77191 ) ) ( not ( = ?auto_77189 ?auto_77191 ) ) ( not ( = ?auto_77190 ?auto_77191 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77190 ?auto_77191 )
      ( MAKE-3PILE ?auto_77188 ?auto_77189 ?auto_77190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77192 - BLOCK
      ?auto_77193 - BLOCK
      ?auto_77194 - BLOCK
    )
    :vars
    (
      ?auto_77195 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77192 ) ( not ( = ?auto_77192 ?auto_77193 ) ) ( not ( = ?auto_77192 ?auto_77194 ) ) ( not ( = ?auto_77193 ?auto_77194 ) ) ( ON ?auto_77194 ?auto_77195 ) ( CLEAR ?auto_77194 ) ( not ( = ?auto_77192 ?auto_77195 ) ) ( not ( = ?auto_77193 ?auto_77195 ) ) ( not ( = ?auto_77194 ?auto_77195 ) ) ( HOLDING ?auto_77193 ) ( CLEAR ?auto_77192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77192 ?auto_77193 )
      ( MAKE-3PILE ?auto_77192 ?auto_77193 ?auto_77194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77196 - BLOCK
      ?auto_77197 - BLOCK
      ?auto_77198 - BLOCK
    )
    :vars
    (
      ?auto_77199 - BLOCK
      ?auto_77200 - BLOCK
      ?auto_77202 - BLOCK
      ?auto_77201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77196 ) ( not ( = ?auto_77196 ?auto_77197 ) ) ( not ( = ?auto_77196 ?auto_77198 ) ) ( not ( = ?auto_77197 ?auto_77198 ) ) ( ON ?auto_77198 ?auto_77199 ) ( not ( = ?auto_77196 ?auto_77199 ) ) ( not ( = ?auto_77197 ?auto_77199 ) ) ( not ( = ?auto_77198 ?auto_77199 ) ) ( CLEAR ?auto_77196 ) ( ON ?auto_77197 ?auto_77198 ) ( CLEAR ?auto_77197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77200 ) ( ON ?auto_77202 ?auto_77200 ) ( ON ?auto_77201 ?auto_77202 ) ( ON ?auto_77199 ?auto_77201 ) ( not ( = ?auto_77200 ?auto_77202 ) ) ( not ( = ?auto_77200 ?auto_77201 ) ) ( not ( = ?auto_77200 ?auto_77199 ) ) ( not ( = ?auto_77200 ?auto_77198 ) ) ( not ( = ?auto_77200 ?auto_77197 ) ) ( not ( = ?auto_77202 ?auto_77201 ) ) ( not ( = ?auto_77202 ?auto_77199 ) ) ( not ( = ?auto_77202 ?auto_77198 ) ) ( not ( = ?auto_77202 ?auto_77197 ) ) ( not ( = ?auto_77201 ?auto_77199 ) ) ( not ( = ?auto_77201 ?auto_77198 ) ) ( not ( = ?auto_77201 ?auto_77197 ) ) ( not ( = ?auto_77196 ?auto_77200 ) ) ( not ( = ?auto_77196 ?auto_77202 ) ) ( not ( = ?auto_77196 ?auto_77201 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77200 ?auto_77202 ?auto_77201 ?auto_77199 ?auto_77198 )
      ( MAKE-3PILE ?auto_77196 ?auto_77197 ?auto_77198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77203 - BLOCK
      ?auto_77204 - BLOCK
      ?auto_77205 - BLOCK
    )
    :vars
    (
      ?auto_77208 - BLOCK
      ?auto_77209 - BLOCK
      ?auto_77206 - BLOCK
      ?auto_77207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77203 ?auto_77204 ) ) ( not ( = ?auto_77203 ?auto_77205 ) ) ( not ( = ?auto_77204 ?auto_77205 ) ) ( ON ?auto_77205 ?auto_77208 ) ( not ( = ?auto_77203 ?auto_77208 ) ) ( not ( = ?auto_77204 ?auto_77208 ) ) ( not ( = ?auto_77205 ?auto_77208 ) ) ( ON ?auto_77204 ?auto_77205 ) ( CLEAR ?auto_77204 ) ( ON-TABLE ?auto_77209 ) ( ON ?auto_77206 ?auto_77209 ) ( ON ?auto_77207 ?auto_77206 ) ( ON ?auto_77208 ?auto_77207 ) ( not ( = ?auto_77209 ?auto_77206 ) ) ( not ( = ?auto_77209 ?auto_77207 ) ) ( not ( = ?auto_77209 ?auto_77208 ) ) ( not ( = ?auto_77209 ?auto_77205 ) ) ( not ( = ?auto_77209 ?auto_77204 ) ) ( not ( = ?auto_77206 ?auto_77207 ) ) ( not ( = ?auto_77206 ?auto_77208 ) ) ( not ( = ?auto_77206 ?auto_77205 ) ) ( not ( = ?auto_77206 ?auto_77204 ) ) ( not ( = ?auto_77207 ?auto_77208 ) ) ( not ( = ?auto_77207 ?auto_77205 ) ) ( not ( = ?auto_77207 ?auto_77204 ) ) ( not ( = ?auto_77203 ?auto_77209 ) ) ( not ( = ?auto_77203 ?auto_77206 ) ) ( not ( = ?auto_77203 ?auto_77207 ) ) ( HOLDING ?auto_77203 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77203 )
      ( MAKE-3PILE ?auto_77203 ?auto_77204 ?auto_77205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77210 - BLOCK
      ?auto_77211 - BLOCK
      ?auto_77212 - BLOCK
    )
    :vars
    (
      ?auto_77213 - BLOCK
      ?auto_77214 - BLOCK
      ?auto_77216 - BLOCK
      ?auto_77215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77210 ?auto_77211 ) ) ( not ( = ?auto_77210 ?auto_77212 ) ) ( not ( = ?auto_77211 ?auto_77212 ) ) ( ON ?auto_77212 ?auto_77213 ) ( not ( = ?auto_77210 ?auto_77213 ) ) ( not ( = ?auto_77211 ?auto_77213 ) ) ( not ( = ?auto_77212 ?auto_77213 ) ) ( ON ?auto_77211 ?auto_77212 ) ( ON-TABLE ?auto_77214 ) ( ON ?auto_77216 ?auto_77214 ) ( ON ?auto_77215 ?auto_77216 ) ( ON ?auto_77213 ?auto_77215 ) ( not ( = ?auto_77214 ?auto_77216 ) ) ( not ( = ?auto_77214 ?auto_77215 ) ) ( not ( = ?auto_77214 ?auto_77213 ) ) ( not ( = ?auto_77214 ?auto_77212 ) ) ( not ( = ?auto_77214 ?auto_77211 ) ) ( not ( = ?auto_77216 ?auto_77215 ) ) ( not ( = ?auto_77216 ?auto_77213 ) ) ( not ( = ?auto_77216 ?auto_77212 ) ) ( not ( = ?auto_77216 ?auto_77211 ) ) ( not ( = ?auto_77215 ?auto_77213 ) ) ( not ( = ?auto_77215 ?auto_77212 ) ) ( not ( = ?auto_77215 ?auto_77211 ) ) ( not ( = ?auto_77210 ?auto_77214 ) ) ( not ( = ?auto_77210 ?auto_77216 ) ) ( not ( = ?auto_77210 ?auto_77215 ) ) ( ON ?auto_77210 ?auto_77211 ) ( CLEAR ?auto_77210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77214 ?auto_77216 ?auto_77215 ?auto_77213 ?auto_77212 ?auto_77211 )
      ( MAKE-3PILE ?auto_77210 ?auto_77211 ?auto_77212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77217 - BLOCK
      ?auto_77218 - BLOCK
      ?auto_77219 - BLOCK
    )
    :vars
    (
      ?auto_77221 - BLOCK
      ?auto_77223 - BLOCK
      ?auto_77220 - BLOCK
      ?auto_77222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77217 ?auto_77218 ) ) ( not ( = ?auto_77217 ?auto_77219 ) ) ( not ( = ?auto_77218 ?auto_77219 ) ) ( ON ?auto_77219 ?auto_77221 ) ( not ( = ?auto_77217 ?auto_77221 ) ) ( not ( = ?auto_77218 ?auto_77221 ) ) ( not ( = ?auto_77219 ?auto_77221 ) ) ( ON ?auto_77218 ?auto_77219 ) ( ON-TABLE ?auto_77223 ) ( ON ?auto_77220 ?auto_77223 ) ( ON ?auto_77222 ?auto_77220 ) ( ON ?auto_77221 ?auto_77222 ) ( not ( = ?auto_77223 ?auto_77220 ) ) ( not ( = ?auto_77223 ?auto_77222 ) ) ( not ( = ?auto_77223 ?auto_77221 ) ) ( not ( = ?auto_77223 ?auto_77219 ) ) ( not ( = ?auto_77223 ?auto_77218 ) ) ( not ( = ?auto_77220 ?auto_77222 ) ) ( not ( = ?auto_77220 ?auto_77221 ) ) ( not ( = ?auto_77220 ?auto_77219 ) ) ( not ( = ?auto_77220 ?auto_77218 ) ) ( not ( = ?auto_77222 ?auto_77221 ) ) ( not ( = ?auto_77222 ?auto_77219 ) ) ( not ( = ?auto_77222 ?auto_77218 ) ) ( not ( = ?auto_77217 ?auto_77223 ) ) ( not ( = ?auto_77217 ?auto_77220 ) ) ( not ( = ?auto_77217 ?auto_77222 ) ) ( HOLDING ?auto_77217 ) ( CLEAR ?auto_77218 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77223 ?auto_77220 ?auto_77222 ?auto_77221 ?auto_77219 ?auto_77218 ?auto_77217 )
      ( MAKE-3PILE ?auto_77217 ?auto_77218 ?auto_77219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77224 - BLOCK
      ?auto_77225 - BLOCK
      ?auto_77226 - BLOCK
    )
    :vars
    (
      ?auto_77227 - BLOCK
      ?auto_77230 - BLOCK
      ?auto_77228 - BLOCK
      ?auto_77229 - BLOCK
      ?auto_77231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77224 ?auto_77225 ) ) ( not ( = ?auto_77224 ?auto_77226 ) ) ( not ( = ?auto_77225 ?auto_77226 ) ) ( ON ?auto_77226 ?auto_77227 ) ( not ( = ?auto_77224 ?auto_77227 ) ) ( not ( = ?auto_77225 ?auto_77227 ) ) ( not ( = ?auto_77226 ?auto_77227 ) ) ( ON ?auto_77225 ?auto_77226 ) ( ON-TABLE ?auto_77230 ) ( ON ?auto_77228 ?auto_77230 ) ( ON ?auto_77229 ?auto_77228 ) ( ON ?auto_77227 ?auto_77229 ) ( not ( = ?auto_77230 ?auto_77228 ) ) ( not ( = ?auto_77230 ?auto_77229 ) ) ( not ( = ?auto_77230 ?auto_77227 ) ) ( not ( = ?auto_77230 ?auto_77226 ) ) ( not ( = ?auto_77230 ?auto_77225 ) ) ( not ( = ?auto_77228 ?auto_77229 ) ) ( not ( = ?auto_77228 ?auto_77227 ) ) ( not ( = ?auto_77228 ?auto_77226 ) ) ( not ( = ?auto_77228 ?auto_77225 ) ) ( not ( = ?auto_77229 ?auto_77227 ) ) ( not ( = ?auto_77229 ?auto_77226 ) ) ( not ( = ?auto_77229 ?auto_77225 ) ) ( not ( = ?auto_77224 ?auto_77230 ) ) ( not ( = ?auto_77224 ?auto_77228 ) ) ( not ( = ?auto_77224 ?auto_77229 ) ) ( CLEAR ?auto_77225 ) ( ON ?auto_77224 ?auto_77231 ) ( CLEAR ?auto_77224 ) ( HAND-EMPTY ) ( not ( = ?auto_77224 ?auto_77231 ) ) ( not ( = ?auto_77225 ?auto_77231 ) ) ( not ( = ?auto_77226 ?auto_77231 ) ) ( not ( = ?auto_77227 ?auto_77231 ) ) ( not ( = ?auto_77230 ?auto_77231 ) ) ( not ( = ?auto_77228 ?auto_77231 ) ) ( not ( = ?auto_77229 ?auto_77231 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77224 ?auto_77231 )
      ( MAKE-3PILE ?auto_77224 ?auto_77225 ?auto_77226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77232 - BLOCK
      ?auto_77233 - BLOCK
      ?auto_77234 - BLOCK
    )
    :vars
    (
      ?auto_77235 - BLOCK
      ?auto_77239 - BLOCK
      ?auto_77238 - BLOCK
      ?auto_77236 - BLOCK
      ?auto_77237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77232 ?auto_77233 ) ) ( not ( = ?auto_77232 ?auto_77234 ) ) ( not ( = ?auto_77233 ?auto_77234 ) ) ( ON ?auto_77234 ?auto_77235 ) ( not ( = ?auto_77232 ?auto_77235 ) ) ( not ( = ?auto_77233 ?auto_77235 ) ) ( not ( = ?auto_77234 ?auto_77235 ) ) ( ON-TABLE ?auto_77239 ) ( ON ?auto_77238 ?auto_77239 ) ( ON ?auto_77236 ?auto_77238 ) ( ON ?auto_77235 ?auto_77236 ) ( not ( = ?auto_77239 ?auto_77238 ) ) ( not ( = ?auto_77239 ?auto_77236 ) ) ( not ( = ?auto_77239 ?auto_77235 ) ) ( not ( = ?auto_77239 ?auto_77234 ) ) ( not ( = ?auto_77239 ?auto_77233 ) ) ( not ( = ?auto_77238 ?auto_77236 ) ) ( not ( = ?auto_77238 ?auto_77235 ) ) ( not ( = ?auto_77238 ?auto_77234 ) ) ( not ( = ?auto_77238 ?auto_77233 ) ) ( not ( = ?auto_77236 ?auto_77235 ) ) ( not ( = ?auto_77236 ?auto_77234 ) ) ( not ( = ?auto_77236 ?auto_77233 ) ) ( not ( = ?auto_77232 ?auto_77239 ) ) ( not ( = ?auto_77232 ?auto_77238 ) ) ( not ( = ?auto_77232 ?auto_77236 ) ) ( ON ?auto_77232 ?auto_77237 ) ( CLEAR ?auto_77232 ) ( not ( = ?auto_77232 ?auto_77237 ) ) ( not ( = ?auto_77233 ?auto_77237 ) ) ( not ( = ?auto_77234 ?auto_77237 ) ) ( not ( = ?auto_77235 ?auto_77237 ) ) ( not ( = ?auto_77239 ?auto_77237 ) ) ( not ( = ?auto_77238 ?auto_77237 ) ) ( not ( = ?auto_77236 ?auto_77237 ) ) ( HOLDING ?auto_77233 ) ( CLEAR ?auto_77234 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77239 ?auto_77238 ?auto_77236 ?auto_77235 ?auto_77234 ?auto_77233 )
      ( MAKE-3PILE ?auto_77232 ?auto_77233 ?auto_77234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77240 - BLOCK
      ?auto_77241 - BLOCK
      ?auto_77242 - BLOCK
    )
    :vars
    (
      ?auto_77246 - BLOCK
      ?auto_77247 - BLOCK
      ?auto_77245 - BLOCK
      ?auto_77243 - BLOCK
      ?auto_77244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77240 ?auto_77241 ) ) ( not ( = ?auto_77240 ?auto_77242 ) ) ( not ( = ?auto_77241 ?auto_77242 ) ) ( ON ?auto_77242 ?auto_77246 ) ( not ( = ?auto_77240 ?auto_77246 ) ) ( not ( = ?auto_77241 ?auto_77246 ) ) ( not ( = ?auto_77242 ?auto_77246 ) ) ( ON-TABLE ?auto_77247 ) ( ON ?auto_77245 ?auto_77247 ) ( ON ?auto_77243 ?auto_77245 ) ( ON ?auto_77246 ?auto_77243 ) ( not ( = ?auto_77247 ?auto_77245 ) ) ( not ( = ?auto_77247 ?auto_77243 ) ) ( not ( = ?auto_77247 ?auto_77246 ) ) ( not ( = ?auto_77247 ?auto_77242 ) ) ( not ( = ?auto_77247 ?auto_77241 ) ) ( not ( = ?auto_77245 ?auto_77243 ) ) ( not ( = ?auto_77245 ?auto_77246 ) ) ( not ( = ?auto_77245 ?auto_77242 ) ) ( not ( = ?auto_77245 ?auto_77241 ) ) ( not ( = ?auto_77243 ?auto_77246 ) ) ( not ( = ?auto_77243 ?auto_77242 ) ) ( not ( = ?auto_77243 ?auto_77241 ) ) ( not ( = ?auto_77240 ?auto_77247 ) ) ( not ( = ?auto_77240 ?auto_77245 ) ) ( not ( = ?auto_77240 ?auto_77243 ) ) ( ON ?auto_77240 ?auto_77244 ) ( not ( = ?auto_77240 ?auto_77244 ) ) ( not ( = ?auto_77241 ?auto_77244 ) ) ( not ( = ?auto_77242 ?auto_77244 ) ) ( not ( = ?auto_77246 ?auto_77244 ) ) ( not ( = ?auto_77247 ?auto_77244 ) ) ( not ( = ?auto_77245 ?auto_77244 ) ) ( not ( = ?auto_77243 ?auto_77244 ) ) ( CLEAR ?auto_77242 ) ( ON ?auto_77241 ?auto_77240 ) ( CLEAR ?auto_77241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77244 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77244 ?auto_77240 )
      ( MAKE-3PILE ?auto_77240 ?auto_77241 ?auto_77242 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77248 - BLOCK
      ?auto_77249 - BLOCK
      ?auto_77250 - BLOCK
    )
    :vars
    (
      ?auto_77254 - BLOCK
      ?auto_77253 - BLOCK
      ?auto_77251 - BLOCK
      ?auto_77255 - BLOCK
      ?auto_77252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77248 ?auto_77249 ) ) ( not ( = ?auto_77248 ?auto_77250 ) ) ( not ( = ?auto_77249 ?auto_77250 ) ) ( not ( = ?auto_77248 ?auto_77254 ) ) ( not ( = ?auto_77249 ?auto_77254 ) ) ( not ( = ?auto_77250 ?auto_77254 ) ) ( ON-TABLE ?auto_77253 ) ( ON ?auto_77251 ?auto_77253 ) ( ON ?auto_77255 ?auto_77251 ) ( ON ?auto_77254 ?auto_77255 ) ( not ( = ?auto_77253 ?auto_77251 ) ) ( not ( = ?auto_77253 ?auto_77255 ) ) ( not ( = ?auto_77253 ?auto_77254 ) ) ( not ( = ?auto_77253 ?auto_77250 ) ) ( not ( = ?auto_77253 ?auto_77249 ) ) ( not ( = ?auto_77251 ?auto_77255 ) ) ( not ( = ?auto_77251 ?auto_77254 ) ) ( not ( = ?auto_77251 ?auto_77250 ) ) ( not ( = ?auto_77251 ?auto_77249 ) ) ( not ( = ?auto_77255 ?auto_77254 ) ) ( not ( = ?auto_77255 ?auto_77250 ) ) ( not ( = ?auto_77255 ?auto_77249 ) ) ( not ( = ?auto_77248 ?auto_77253 ) ) ( not ( = ?auto_77248 ?auto_77251 ) ) ( not ( = ?auto_77248 ?auto_77255 ) ) ( ON ?auto_77248 ?auto_77252 ) ( not ( = ?auto_77248 ?auto_77252 ) ) ( not ( = ?auto_77249 ?auto_77252 ) ) ( not ( = ?auto_77250 ?auto_77252 ) ) ( not ( = ?auto_77254 ?auto_77252 ) ) ( not ( = ?auto_77253 ?auto_77252 ) ) ( not ( = ?auto_77251 ?auto_77252 ) ) ( not ( = ?auto_77255 ?auto_77252 ) ) ( ON ?auto_77249 ?auto_77248 ) ( CLEAR ?auto_77249 ) ( ON-TABLE ?auto_77252 ) ( HOLDING ?auto_77250 ) ( CLEAR ?auto_77254 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77253 ?auto_77251 ?auto_77255 ?auto_77254 ?auto_77250 )
      ( MAKE-3PILE ?auto_77248 ?auto_77249 ?auto_77250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77256 - BLOCK
      ?auto_77257 - BLOCK
      ?auto_77258 - BLOCK
    )
    :vars
    (
      ?auto_77263 - BLOCK
      ?auto_77261 - BLOCK
      ?auto_77262 - BLOCK
      ?auto_77260 - BLOCK
      ?auto_77259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77256 ?auto_77257 ) ) ( not ( = ?auto_77256 ?auto_77258 ) ) ( not ( = ?auto_77257 ?auto_77258 ) ) ( not ( = ?auto_77256 ?auto_77263 ) ) ( not ( = ?auto_77257 ?auto_77263 ) ) ( not ( = ?auto_77258 ?auto_77263 ) ) ( ON-TABLE ?auto_77261 ) ( ON ?auto_77262 ?auto_77261 ) ( ON ?auto_77260 ?auto_77262 ) ( ON ?auto_77263 ?auto_77260 ) ( not ( = ?auto_77261 ?auto_77262 ) ) ( not ( = ?auto_77261 ?auto_77260 ) ) ( not ( = ?auto_77261 ?auto_77263 ) ) ( not ( = ?auto_77261 ?auto_77258 ) ) ( not ( = ?auto_77261 ?auto_77257 ) ) ( not ( = ?auto_77262 ?auto_77260 ) ) ( not ( = ?auto_77262 ?auto_77263 ) ) ( not ( = ?auto_77262 ?auto_77258 ) ) ( not ( = ?auto_77262 ?auto_77257 ) ) ( not ( = ?auto_77260 ?auto_77263 ) ) ( not ( = ?auto_77260 ?auto_77258 ) ) ( not ( = ?auto_77260 ?auto_77257 ) ) ( not ( = ?auto_77256 ?auto_77261 ) ) ( not ( = ?auto_77256 ?auto_77262 ) ) ( not ( = ?auto_77256 ?auto_77260 ) ) ( ON ?auto_77256 ?auto_77259 ) ( not ( = ?auto_77256 ?auto_77259 ) ) ( not ( = ?auto_77257 ?auto_77259 ) ) ( not ( = ?auto_77258 ?auto_77259 ) ) ( not ( = ?auto_77263 ?auto_77259 ) ) ( not ( = ?auto_77261 ?auto_77259 ) ) ( not ( = ?auto_77262 ?auto_77259 ) ) ( not ( = ?auto_77260 ?auto_77259 ) ) ( ON ?auto_77257 ?auto_77256 ) ( ON-TABLE ?auto_77259 ) ( CLEAR ?auto_77263 ) ( ON ?auto_77258 ?auto_77257 ) ( CLEAR ?auto_77258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77259 ?auto_77256 ?auto_77257 )
      ( MAKE-3PILE ?auto_77256 ?auto_77257 ?auto_77258 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77264 - BLOCK
      ?auto_77265 - BLOCK
      ?auto_77266 - BLOCK
    )
    :vars
    (
      ?auto_77270 - BLOCK
      ?auto_77269 - BLOCK
      ?auto_77271 - BLOCK
      ?auto_77268 - BLOCK
      ?auto_77267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77264 ?auto_77265 ) ) ( not ( = ?auto_77264 ?auto_77266 ) ) ( not ( = ?auto_77265 ?auto_77266 ) ) ( not ( = ?auto_77264 ?auto_77270 ) ) ( not ( = ?auto_77265 ?auto_77270 ) ) ( not ( = ?auto_77266 ?auto_77270 ) ) ( ON-TABLE ?auto_77269 ) ( ON ?auto_77271 ?auto_77269 ) ( ON ?auto_77268 ?auto_77271 ) ( not ( = ?auto_77269 ?auto_77271 ) ) ( not ( = ?auto_77269 ?auto_77268 ) ) ( not ( = ?auto_77269 ?auto_77270 ) ) ( not ( = ?auto_77269 ?auto_77266 ) ) ( not ( = ?auto_77269 ?auto_77265 ) ) ( not ( = ?auto_77271 ?auto_77268 ) ) ( not ( = ?auto_77271 ?auto_77270 ) ) ( not ( = ?auto_77271 ?auto_77266 ) ) ( not ( = ?auto_77271 ?auto_77265 ) ) ( not ( = ?auto_77268 ?auto_77270 ) ) ( not ( = ?auto_77268 ?auto_77266 ) ) ( not ( = ?auto_77268 ?auto_77265 ) ) ( not ( = ?auto_77264 ?auto_77269 ) ) ( not ( = ?auto_77264 ?auto_77271 ) ) ( not ( = ?auto_77264 ?auto_77268 ) ) ( ON ?auto_77264 ?auto_77267 ) ( not ( = ?auto_77264 ?auto_77267 ) ) ( not ( = ?auto_77265 ?auto_77267 ) ) ( not ( = ?auto_77266 ?auto_77267 ) ) ( not ( = ?auto_77270 ?auto_77267 ) ) ( not ( = ?auto_77269 ?auto_77267 ) ) ( not ( = ?auto_77271 ?auto_77267 ) ) ( not ( = ?auto_77268 ?auto_77267 ) ) ( ON ?auto_77265 ?auto_77264 ) ( ON-TABLE ?auto_77267 ) ( ON ?auto_77266 ?auto_77265 ) ( CLEAR ?auto_77266 ) ( HOLDING ?auto_77270 ) ( CLEAR ?auto_77268 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77269 ?auto_77271 ?auto_77268 ?auto_77270 )
      ( MAKE-3PILE ?auto_77264 ?auto_77265 ?auto_77266 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77272 - BLOCK
      ?auto_77273 - BLOCK
      ?auto_77274 - BLOCK
    )
    :vars
    (
      ?auto_77278 - BLOCK
      ?auto_77276 - BLOCK
      ?auto_77275 - BLOCK
      ?auto_77279 - BLOCK
      ?auto_77277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77272 ?auto_77273 ) ) ( not ( = ?auto_77272 ?auto_77274 ) ) ( not ( = ?auto_77273 ?auto_77274 ) ) ( not ( = ?auto_77272 ?auto_77278 ) ) ( not ( = ?auto_77273 ?auto_77278 ) ) ( not ( = ?auto_77274 ?auto_77278 ) ) ( ON-TABLE ?auto_77276 ) ( ON ?auto_77275 ?auto_77276 ) ( ON ?auto_77279 ?auto_77275 ) ( not ( = ?auto_77276 ?auto_77275 ) ) ( not ( = ?auto_77276 ?auto_77279 ) ) ( not ( = ?auto_77276 ?auto_77278 ) ) ( not ( = ?auto_77276 ?auto_77274 ) ) ( not ( = ?auto_77276 ?auto_77273 ) ) ( not ( = ?auto_77275 ?auto_77279 ) ) ( not ( = ?auto_77275 ?auto_77278 ) ) ( not ( = ?auto_77275 ?auto_77274 ) ) ( not ( = ?auto_77275 ?auto_77273 ) ) ( not ( = ?auto_77279 ?auto_77278 ) ) ( not ( = ?auto_77279 ?auto_77274 ) ) ( not ( = ?auto_77279 ?auto_77273 ) ) ( not ( = ?auto_77272 ?auto_77276 ) ) ( not ( = ?auto_77272 ?auto_77275 ) ) ( not ( = ?auto_77272 ?auto_77279 ) ) ( ON ?auto_77272 ?auto_77277 ) ( not ( = ?auto_77272 ?auto_77277 ) ) ( not ( = ?auto_77273 ?auto_77277 ) ) ( not ( = ?auto_77274 ?auto_77277 ) ) ( not ( = ?auto_77278 ?auto_77277 ) ) ( not ( = ?auto_77276 ?auto_77277 ) ) ( not ( = ?auto_77275 ?auto_77277 ) ) ( not ( = ?auto_77279 ?auto_77277 ) ) ( ON ?auto_77273 ?auto_77272 ) ( ON-TABLE ?auto_77277 ) ( ON ?auto_77274 ?auto_77273 ) ( CLEAR ?auto_77279 ) ( ON ?auto_77278 ?auto_77274 ) ( CLEAR ?auto_77278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77277 ?auto_77272 ?auto_77273 ?auto_77274 )
      ( MAKE-3PILE ?auto_77272 ?auto_77273 ?auto_77274 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77280 - BLOCK
      ?auto_77281 - BLOCK
      ?auto_77282 - BLOCK
    )
    :vars
    (
      ?auto_77286 - BLOCK
      ?auto_77284 - BLOCK
      ?auto_77285 - BLOCK
      ?auto_77283 - BLOCK
      ?auto_77287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77280 ?auto_77281 ) ) ( not ( = ?auto_77280 ?auto_77282 ) ) ( not ( = ?auto_77281 ?auto_77282 ) ) ( not ( = ?auto_77280 ?auto_77286 ) ) ( not ( = ?auto_77281 ?auto_77286 ) ) ( not ( = ?auto_77282 ?auto_77286 ) ) ( ON-TABLE ?auto_77284 ) ( ON ?auto_77285 ?auto_77284 ) ( not ( = ?auto_77284 ?auto_77285 ) ) ( not ( = ?auto_77284 ?auto_77283 ) ) ( not ( = ?auto_77284 ?auto_77286 ) ) ( not ( = ?auto_77284 ?auto_77282 ) ) ( not ( = ?auto_77284 ?auto_77281 ) ) ( not ( = ?auto_77285 ?auto_77283 ) ) ( not ( = ?auto_77285 ?auto_77286 ) ) ( not ( = ?auto_77285 ?auto_77282 ) ) ( not ( = ?auto_77285 ?auto_77281 ) ) ( not ( = ?auto_77283 ?auto_77286 ) ) ( not ( = ?auto_77283 ?auto_77282 ) ) ( not ( = ?auto_77283 ?auto_77281 ) ) ( not ( = ?auto_77280 ?auto_77284 ) ) ( not ( = ?auto_77280 ?auto_77285 ) ) ( not ( = ?auto_77280 ?auto_77283 ) ) ( ON ?auto_77280 ?auto_77287 ) ( not ( = ?auto_77280 ?auto_77287 ) ) ( not ( = ?auto_77281 ?auto_77287 ) ) ( not ( = ?auto_77282 ?auto_77287 ) ) ( not ( = ?auto_77286 ?auto_77287 ) ) ( not ( = ?auto_77284 ?auto_77287 ) ) ( not ( = ?auto_77285 ?auto_77287 ) ) ( not ( = ?auto_77283 ?auto_77287 ) ) ( ON ?auto_77281 ?auto_77280 ) ( ON-TABLE ?auto_77287 ) ( ON ?auto_77282 ?auto_77281 ) ( ON ?auto_77286 ?auto_77282 ) ( CLEAR ?auto_77286 ) ( HOLDING ?auto_77283 ) ( CLEAR ?auto_77285 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77284 ?auto_77285 ?auto_77283 )
      ( MAKE-3PILE ?auto_77280 ?auto_77281 ?auto_77282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77288 - BLOCK
      ?auto_77289 - BLOCK
      ?auto_77290 - BLOCK
    )
    :vars
    (
      ?auto_77291 - BLOCK
      ?auto_77294 - BLOCK
      ?auto_77292 - BLOCK
      ?auto_77295 - BLOCK
      ?auto_77293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77288 ?auto_77289 ) ) ( not ( = ?auto_77288 ?auto_77290 ) ) ( not ( = ?auto_77289 ?auto_77290 ) ) ( not ( = ?auto_77288 ?auto_77291 ) ) ( not ( = ?auto_77289 ?auto_77291 ) ) ( not ( = ?auto_77290 ?auto_77291 ) ) ( ON-TABLE ?auto_77294 ) ( ON ?auto_77292 ?auto_77294 ) ( not ( = ?auto_77294 ?auto_77292 ) ) ( not ( = ?auto_77294 ?auto_77295 ) ) ( not ( = ?auto_77294 ?auto_77291 ) ) ( not ( = ?auto_77294 ?auto_77290 ) ) ( not ( = ?auto_77294 ?auto_77289 ) ) ( not ( = ?auto_77292 ?auto_77295 ) ) ( not ( = ?auto_77292 ?auto_77291 ) ) ( not ( = ?auto_77292 ?auto_77290 ) ) ( not ( = ?auto_77292 ?auto_77289 ) ) ( not ( = ?auto_77295 ?auto_77291 ) ) ( not ( = ?auto_77295 ?auto_77290 ) ) ( not ( = ?auto_77295 ?auto_77289 ) ) ( not ( = ?auto_77288 ?auto_77294 ) ) ( not ( = ?auto_77288 ?auto_77292 ) ) ( not ( = ?auto_77288 ?auto_77295 ) ) ( ON ?auto_77288 ?auto_77293 ) ( not ( = ?auto_77288 ?auto_77293 ) ) ( not ( = ?auto_77289 ?auto_77293 ) ) ( not ( = ?auto_77290 ?auto_77293 ) ) ( not ( = ?auto_77291 ?auto_77293 ) ) ( not ( = ?auto_77294 ?auto_77293 ) ) ( not ( = ?auto_77292 ?auto_77293 ) ) ( not ( = ?auto_77295 ?auto_77293 ) ) ( ON ?auto_77289 ?auto_77288 ) ( ON-TABLE ?auto_77293 ) ( ON ?auto_77290 ?auto_77289 ) ( ON ?auto_77291 ?auto_77290 ) ( CLEAR ?auto_77292 ) ( ON ?auto_77295 ?auto_77291 ) ( CLEAR ?auto_77295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77293 ?auto_77288 ?auto_77289 ?auto_77290 ?auto_77291 )
      ( MAKE-3PILE ?auto_77288 ?auto_77289 ?auto_77290 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77296 - BLOCK
      ?auto_77297 - BLOCK
      ?auto_77298 - BLOCK
    )
    :vars
    (
      ?auto_77303 - BLOCK
      ?auto_77300 - BLOCK
      ?auto_77299 - BLOCK
      ?auto_77301 - BLOCK
      ?auto_77302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77296 ?auto_77297 ) ) ( not ( = ?auto_77296 ?auto_77298 ) ) ( not ( = ?auto_77297 ?auto_77298 ) ) ( not ( = ?auto_77296 ?auto_77303 ) ) ( not ( = ?auto_77297 ?auto_77303 ) ) ( not ( = ?auto_77298 ?auto_77303 ) ) ( ON-TABLE ?auto_77300 ) ( not ( = ?auto_77300 ?auto_77299 ) ) ( not ( = ?auto_77300 ?auto_77301 ) ) ( not ( = ?auto_77300 ?auto_77303 ) ) ( not ( = ?auto_77300 ?auto_77298 ) ) ( not ( = ?auto_77300 ?auto_77297 ) ) ( not ( = ?auto_77299 ?auto_77301 ) ) ( not ( = ?auto_77299 ?auto_77303 ) ) ( not ( = ?auto_77299 ?auto_77298 ) ) ( not ( = ?auto_77299 ?auto_77297 ) ) ( not ( = ?auto_77301 ?auto_77303 ) ) ( not ( = ?auto_77301 ?auto_77298 ) ) ( not ( = ?auto_77301 ?auto_77297 ) ) ( not ( = ?auto_77296 ?auto_77300 ) ) ( not ( = ?auto_77296 ?auto_77299 ) ) ( not ( = ?auto_77296 ?auto_77301 ) ) ( ON ?auto_77296 ?auto_77302 ) ( not ( = ?auto_77296 ?auto_77302 ) ) ( not ( = ?auto_77297 ?auto_77302 ) ) ( not ( = ?auto_77298 ?auto_77302 ) ) ( not ( = ?auto_77303 ?auto_77302 ) ) ( not ( = ?auto_77300 ?auto_77302 ) ) ( not ( = ?auto_77299 ?auto_77302 ) ) ( not ( = ?auto_77301 ?auto_77302 ) ) ( ON ?auto_77297 ?auto_77296 ) ( ON-TABLE ?auto_77302 ) ( ON ?auto_77298 ?auto_77297 ) ( ON ?auto_77303 ?auto_77298 ) ( ON ?auto_77301 ?auto_77303 ) ( CLEAR ?auto_77301 ) ( HOLDING ?auto_77299 ) ( CLEAR ?auto_77300 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77300 ?auto_77299 )
      ( MAKE-3PILE ?auto_77296 ?auto_77297 ?auto_77298 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77304 - BLOCK
      ?auto_77305 - BLOCK
      ?auto_77306 - BLOCK
    )
    :vars
    (
      ?auto_77307 - BLOCK
      ?auto_77309 - BLOCK
      ?auto_77308 - BLOCK
      ?auto_77311 - BLOCK
      ?auto_77310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77304 ?auto_77305 ) ) ( not ( = ?auto_77304 ?auto_77306 ) ) ( not ( = ?auto_77305 ?auto_77306 ) ) ( not ( = ?auto_77304 ?auto_77307 ) ) ( not ( = ?auto_77305 ?auto_77307 ) ) ( not ( = ?auto_77306 ?auto_77307 ) ) ( ON-TABLE ?auto_77309 ) ( not ( = ?auto_77309 ?auto_77308 ) ) ( not ( = ?auto_77309 ?auto_77311 ) ) ( not ( = ?auto_77309 ?auto_77307 ) ) ( not ( = ?auto_77309 ?auto_77306 ) ) ( not ( = ?auto_77309 ?auto_77305 ) ) ( not ( = ?auto_77308 ?auto_77311 ) ) ( not ( = ?auto_77308 ?auto_77307 ) ) ( not ( = ?auto_77308 ?auto_77306 ) ) ( not ( = ?auto_77308 ?auto_77305 ) ) ( not ( = ?auto_77311 ?auto_77307 ) ) ( not ( = ?auto_77311 ?auto_77306 ) ) ( not ( = ?auto_77311 ?auto_77305 ) ) ( not ( = ?auto_77304 ?auto_77309 ) ) ( not ( = ?auto_77304 ?auto_77308 ) ) ( not ( = ?auto_77304 ?auto_77311 ) ) ( ON ?auto_77304 ?auto_77310 ) ( not ( = ?auto_77304 ?auto_77310 ) ) ( not ( = ?auto_77305 ?auto_77310 ) ) ( not ( = ?auto_77306 ?auto_77310 ) ) ( not ( = ?auto_77307 ?auto_77310 ) ) ( not ( = ?auto_77309 ?auto_77310 ) ) ( not ( = ?auto_77308 ?auto_77310 ) ) ( not ( = ?auto_77311 ?auto_77310 ) ) ( ON ?auto_77305 ?auto_77304 ) ( ON-TABLE ?auto_77310 ) ( ON ?auto_77306 ?auto_77305 ) ( ON ?auto_77307 ?auto_77306 ) ( ON ?auto_77311 ?auto_77307 ) ( CLEAR ?auto_77309 ) ( ON ?auto_77308 ?auto_77311 ) ( CLEAR ?auto_77308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77310 ?auto_77304 ?auto_77305 ?auto_77306 ?auto_77307 ?auto_77311 )
      ( MAKE-3PILE ?auto_77304 ?auto_77305 ?auto_77306 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77312 - BLOCK
      ?auto_77313 - BLOCK
      ?auto_77314 - BLOCK
    )
    :vars
    (
      ?auto_77317 - BLOCK
      ?auto_77319 - BLOCK
      ?auto_77318 - BLOCK
      ?auto_77316 - BLOCK
      ?auto_77315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77312 ?auto_77313 ) ) ( not ( = ?auto_77312 ?auto_77314 ) ) ( not ( = ?auto_77313 ?auto_77314 ) ) ( not ( = ?auto_77312 ?auto_77317 ) ) ( not ( = ?auto_77313 ?auto_77317 ) ) ( not ( = ?auto_77314 ?auto_77317 ) ) ( not ( = ?auto_77319 ?auto_77318 ) ) ( not ( = ?auto_77319 ?auto_77316 ) ) ( not ( = ?auto_77319 ?auto_77317 ) ) ( not ( = ?auto_77319 ?auto_77314 ) ) ( not ( = ?auto_77319 ?auto_77313 ) ) ( not ( = ?auto_77318 ?auto_77316 ) ) ( not ( = ?auto_77318 ?auto_77317 ) ) ( not ( = ?auto_77318 ?auto_77314 ) ) ( not ( = ?auto_77318 ?auto_77313 ) ) ( not ( = ?auto_77316 ?auto_77317 ) ) ( not ( = ?auto_77316 ?auto_77314 ) ) ( not ( = ?auto_77316 ?auto_77313 ) ) ( not ( = ?auto_77312 ?auto_77319 ) ) ( not ( = ?auto_77312 ?auto_77318 ) ) ( not ( = ?auto_77312 ?auto_77316 ) ) ( ON ?auto_77312 ?auto_77315 ) ( not ( = ?auto_77312 ?auto_77315 ) ) ( not ( = ?auto_77313 ?auto_77315 ) ) ( not ( = ?auto_77314 ?auto_77315 ) ) ( not ( = ?auto_77317 ?auto_77315 ) ) ( not ( = ?auto_77319 ?auto_77315 ) ) ( not ( = ?auto_77318 ?auto_77315 ) ) ( not ( = ?auto_77316 ?auto_77315 ) ) ( ON ?auto_77313 ?auto_77312 ) ( ON-TABLE ?auto_77315 ) ( ON ?auto_77314 ?auto_77313 ) ( ON ?auto_77317 ?auto_77314 ) ( ON ?auto_77316 ?auto_77317 ) ( ON ?auto_77318 ?auto_77316 ) ( CLEAR ?auto_77318 ) ( HOLDING ?auto_77319 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77319 )
      ( MAKE-3PILE ?auto_77312 ?auto_77313 ?auto_77314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77320 - BLOCK
      ?auto_77321 - BLOCK
      ?auto_77322 - BLOCK
    )
    :vars
    (
      ?auto_77327 - BLOCK
      ?auto_77326 - BLOCK
      ?auto_77324 - BLOCK
      ?auto_77323 - BLOCK
      ?auto_77325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77320 ?auto_77321 ) ) ( not ( = ?auto_77320 ?auto_77322 ) ) ( not ( = ?auto_77321 ?auto_77322 ) ) ( not ( = ?auto_77320 ?auto_77327 ) ) ( not ( = ?auto_77321 ?auto_77327 ) ) ( not ( = ?auto_77322 ?auto_77327 ) ) ( not ( = ?auto_77326 ?auto_77324 ) ) ( not ( = ?auto_77326 ?auto_77323 ) ) ( not ( = ?auto_77326 ?auto_77327 ) ) ( not ( = ?auto_77326 ?auto_77322 ) ) ( not ( = ?auto_77326 ?auto_77321 ) ) ( not ( = ?auto_77324 ?auto_77323 ) ) ( not ( = ?auto_77324 ?auto_77327 ) ) ( not ( = ?auto_77324 ?auto_77322 ) ) ( not ( = ?auto_77324 ?auto_77321 ) ) ( not ( = ?auto_77323 ?auto_77327 ) ) ( not ( = ?auto_77323 ?auto_77322 ) ) ( not ( = ?auto_77323 ?auto_77321 ) ) ( not ( = ?auto_77320 ?auto_77326 ) ) ( not ( = ?auto_77320 ?auto_77324 ) ) ( not ( = ?auto_77320 ?auto_77323 ) ) ( ON ?auto_77320 ?auto_77325 ) ( not ( = ?auto_77320 ?auto_77325 ) ) ( not ( = ?auto_77321 ?auto_77325 ) ) ( not ( = ?auto_77322 ?auto_77325 ) ) ( not ( = ?auto_77327 ?auto_77325 ) ) ( not ( = ?auto_77326 ?auto_77325 ) ) ( not ( = ?auto_77324 ?auto_77325 ) ) ( not ( = ?auto_77323 ?auto_77325 ) ) ( ON ?auto_77321 ?auto_77320 ) ( ON-TABLE ?auto_77325 ) ( ON ?auto_77322 ?auto_77321 ) ( ON ?auto_77327 ?auto_77322 ) ( ON ?auto_77323 ?auto_77327 ) ( ON ?auto_77324 ?auto_77323 ) ( ON ?auto_77326 ?auto_77324 ) ( CLEAR ?auto_77326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77325 ?auto_77320 ?auto_77321 ?auto_77322 ?auto_77327 ?auto_77323 ?auto_77324 )
      ( MAKE-3PILE ?auto_77320 ?auto_77321 ?auto_77322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77331 - BLOCK
      ?auto_77332 - BLOCK
      ?auto_77333 - BLOCK
    )
    :vars
    (
      ?auto_77334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77334 ?auto_77333 ) ( CLEAR ?auto_77334 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77331 ) ( ON ?auto_77332 ?auto_77331 ) ( ON ?auto_77333 ?auto_77332 ) ( not ( = ?auto_77331 ?auto_77332 ) ) ( not ( = ?auto_77331 ?auto_77333 ) ) ( not ( = ?auto_77331 ?auto_77334 ) ) ( not ( = ?auto_77332 ?auto_77333 ) ) ( not ( = ?auto_77332 ?auto_77334 ) ) ( not ( = ?auto_77333 ?auto_77334 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77334 ?auto_77333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77335 - BLOCK
      ?auto_77336 - BLOCK
      ?auto_77337 - BLOCK
    )
    :vars
    (
      ?auto_77338 - BLOCK
      ?auto_77339 - BLOCK
      ?auto_77340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77338 ?auto_77337 ) ( CLEAR ?auto_77338 ) ( ON-TABLE ?auto_77335 ) ( ON ?auto_77336 ?auto_77335 ) ( ON ?auto_77337 ?auto_77336 ) ( not ( = ?auto_77335 ?auto_77336 ) ) ( not ( = ?auto_77335 ?auto_77337 ) ) ( not ( = ?auto_77335 ?auto_77338 ) ) ( not ( = ?auto_77336 ?auto_77337 ) ) ( not ( = ?auto_77336 ?auto_77338 ) ) ( not ( = ?auto_77337 ?auto_77338 ) ) ( HOLDING ?auto_77339 ) ( CLEAR ?auto_77340 ) ( not ( = ?auto_77335 ?auto_77339 ) ) ( not ( = ?auto_77335 ?auto_77340 ) ) ( not ( = ?auto_77336 ?auto_77339 ) ) ( not ( = ?auto_77336 ?auto_77340 ) ) ( not ( = ?auto_77337 ?auto_77339 ) ) ( not ( = ?auto_77337 ?auto_77340 ) ) ( not ( = ?auto_77338 ?auto_77339 ) ) ( not ( = ?auto_77338 ?auto_77340 ) ) ( not ( = ?auto_77339 ?auto_77340 ) ) )
    :subtasks
    ( ( !STACK ?auto_77339 ?auto_77340 )
      ( MAKE-3PILE ?auto_77335 ?auto_77336 ?auto_77337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77341 - BLOCK
      ?auto_77342 - BLOCK
      ?auto_77343 - BLOCK
    )
    :vars
    (
      ?auto_77345 - BLOCK
      ?auto_77344 - BLOCK
      ?auto_77346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77345 ?auto_77343 ) ( ON-TABLE ?auto_77341 ) ( ON ?auto_77342 ?auto_77341 ) ( ON ?auto_77343 ?auto_77342 ) ( not ( = ?auto_77341 ?auto_77342 ) ) ( not ( = ?auto_77341 ?auto_77343 ) ) ( not ( = ?auto_77341 ?auto_77345 ) ) ( not ( = ?auto_77342 ?auto_77343 ) ) ( not ( = ?auto_77342 ?auto_77345 ) ) ( not ( = ?auto_77343 ?auto_77345 ) ) ( CLEAR ?auto_77344 ) ( not ( = ?auto_77341 ?auto_77346 ) ) ( not ( = ?auto_77341 ?auto_77344 ) ) ( not ( = ?auto_77342 ?auto_77346 ) ) ( not ( = ?auto_77342 ?auto_77344 ) ) ( not ( = ?auto_77343 ?auto_77346 ) ) ( not ( = ?auto_77343 ?auto_77344 ) ) ( not ( = ?auto_77345 ?auto_77346 ) ) ( not ( = ?auto_77345 ?auto_77344 ) ) ( not ( = ?auto_77346 ?auto_77344 ) ) ( ON ?auto_77346 ?auto_77345 ) ( CLEAR ?auto_77346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77341 ?auto_77342 ?auto_77343 ?auto_77345 )
      ( MAKE-3PILE ?auto_77341 ?auto_77342 ?auto_77343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77347 - BLOCK
      ?auto_77348 - BLOCK
      ?auto_77349 - BLOCK
    )
    :vars
    (
      ?auto_77351 - BLOCK
      ?auto_77352 - BLOCK
      ?auto_77350 - BLOCK
      ?auto_77353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77351 ?auto_77349 ) ( ON-TABLE ?auto_77347 ) ( ON ?auto_77348 ?auto_77347 ) ( ON ?auto_77349 ?auto_77348 ) ( not ( = ?auto_77347 ?auto_77348 ) ) ( not ( = ?auto_77347 ?auto_77349 ) ) ( not ( = ?auto_77347 ?auto_77351 ) ) ( not ( = ?auto_77348 ?auto_77349 ) ) ( not ( = ?auto_77348 ?auto_77351 ) ) ( not ( = ?auto_77349 ?auto_77351 ) ) ( not ( = ?auto_77347 ?auto_77352 ) ) ( not ( = ?auto_77347 ?auto_77350 ) ) ( not ( = ?auto_77348 ?auto_77352 ) ) ( not ( = ?auto_77348 ?auto_77350 ) ) ( not ( = ?auto_77349 ?auto_77352 ) ) ( not ( = ?auto_77349 ?auto_77350 ) ) ( not ( = ?auto_77351 ?auto_77352 ) ) ( not ( = ?auto_77351 ?auto_77350 ) ) ( not ( = ?auto_77352 ?auto_77350 ) ) ( ON ?auto_77352 ?auto_77351 ) ( CLEAR ?auto_77352 ) ( HOLDING ?auto_77350 ) ( CLEAR ?auto_77353 ) ( ON-TABLE ?auto_77353 ) ( not ( = ?auto_77353 ?auto_77350 ) ) ( not ( = ?auto_77347 ?auto_77353 ) ) ( not ( = ?auto_77348 ?auto_77353 ) ) ( not ( = ?auto_77349 ?auto_77353 ) ) ( not ( = ?auto_77351 ?auto_77353 ) ) ( not ( = ?auto_77352 ?auto_77353 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77353 ?auto_77350 )
      ( MAKE-3PILE ?auto_77347 ?auto_77348 ?auto_77349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77354 - BLOCK
      ?auto_77355 - BLOCK
      ?auto_77356 - BLOCK
    )
    :vars
    (
      ?auto_77358 - BLOCK
      ?auto_77359 - BLOCK
      ?auto_77357 - BLOCK
      ?auto_77360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77358 ?auto_77356 ) ( ON-TABLE ?auto_77354 ) ( ON ?auto_77355 ?auto_77354 ) ( ON ?auto_77356 ?auto_77355 ) ( not ( = ?auto_77354 ?auto_77355 ) ) ( not ( = ?auto_77354 ?auto_77356 ) ) ( not ( = ?auto_77354 ?auto_77358 ) ) ( not ( = ?auto_77355 ?auto_77356 ) ) ( not ( = ?auto_77355 ?auto_77358 ) ) ( not ( = ?auto_77356 ?auto_77358 ) ) ( not ( = ?auto_77354 ?auto_77359 ) ) ( not ( = ?auto_77354 ?auto_77357 ) ) ( not ( = ?auto_77355 ?auto_77359 ) ) ( not ( = ?auto_77355 ?auto_77357 ) ) ( not ( = ?auto_77356 ?auto_77359 ) ) ( not ( = ?auto_77356 ?auto_77357 ) ) ( not ( = ?auto_77358 ?auto_77359 ) ) ( not ( = ?auto_77358 ?auto_77357 ) ) ( not ( = ?auto_77359 ?auto_77357 ) ) ( ON ?auto_77359 ?auto_77358 ) ( CLEAR ?auto_77360 ) ( ON-TABLE ?auto_77360 ) ( not ( = ?auto_77360 ?auto_77357 ) ) ( not ( = ?auto_77354 ?auto_77360 ) ) ( not ( = ?auto_77355 ?auto_77360 ) ) ( not ( = ?auto_77356 ?auto_77360 ) ) ( not ( = ?auto_77358 ?auto_77360 ) ) ( not ( = ?auto_77359 ?auto_77360 ) ) ( ON ?auto_77357 ?auto_77359 ) ( CLEAR ?auto_77357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77354 ?auto_77355 ?auto_77356 ?auto_77358 ?auto_77359 )
      ( MAKE-3PILE ?auto_77354 ?auto_77355 ?auto_77356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77361 - BLOCK
      ?auto_77362 - BLOCK
      ?auto_77363 - BLOCK
    )
    :vars
    (
      ?auto_77364 - BLOCK
      ?auto_77366 - BLOCK
      ?auto_77367 - BLOCK
      ?auto_77365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77364 ?auto_77363 ) ( ON-TABLE ?auto_77361 ) ( ON ?auto_77362 ?auto_77361 ) ( ON ?auto_77363 ?auto_77362 ) ( not ( = ?auto_77361 ?auto_77362 ) ) ( not ( = ?auto_77361 ?auto_77363 ) ) ( not ( = ?auto_77361 ?auto_77364 ) ) ( not ( = ?auto_77362 ?auto_77363 ) ) ( not ( = ?auto_77362 ?auto_77364 ) ) ( not ( = ?auto_77363 ?auto_77364 ) ) ( not ( = ?auto_77361 ?auto_77366 ) ) ( not ( = ?auto_77361 ?auto_77367 ) ) ( not ( = ?auto_77362 ?auto_77366 ) ) ( not ( = ?auto_77362 ?auto_77367 ) ) ( not ( = ?auto_77363 ?auto_77366 ) ) ( not ( = ?auto_77363 ?auto_77367 ) ) ( not ( = ?auto_77364 ?auto_77366 ) ) ( not ( = ?auto_77364 ?auto_77367 ) ) ( not ( = ?auto_77366 ?auto_77367 ) ) ( ON ?auto_77366 ?auto_77364 ) ( not ( = ?auto_77365 ?auto_77367 ) ) ( not ( = ?auto_77361 ?auto_77365 ) ) ( not ( = ?auto_77362 ?auto_77365 ) ) ( not ( = ?auto_77363 ?auto_77365 ) ) ( not ( = ?auto_77364 ?auto_77365 ) ) ( not ( = ?auto_77366 ?auto_77365 ) ) ( ON ?auto_77367 ?auto_77366 ) ( CLEAR ?auto_77367 ) ( HOLDING ?auto_77365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77365 )
      ( MAKE-3PILE ?auto_77361 ?auto_77362 ?auto_77363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77368 - BLOCK
      ?auto_77369 - BLOCK
      ?auto_77370 - BLOCK
    )
    :vars
    (
      ?auto_77372 - BLOCK
      ?auto_77373 - BLOCK
      ?auto_77371 - BLOCK
      ?auto_77374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77372 ?auto_77370 ) ( ON-TABLE ?auto_77368 ) ( ON ?auto_77369 ?auto_77368 ) ( ON ?auto_77370 ?auto_77369 ) ( not ( = ?auto_77368 ?auto_77369 ) ) ( not ( = ?auto_77368 ?auto_77370 ) ) ( not ( = ?auto_77368 ?auto_77372 ) ) ( not ( = ?auto_77369 ?auto_77370 ) ) ( not ( = ?auto_77369 ?auto_77372 ) ) ( not ( = ?auto_77370 ?auto_77372 ) ) ( not ( = ?auto_77368 ?auto_77373 ) ) ( not ( = ?auto_77368 ?auto_77371 ) ) ( not ( = ?auto_77369 ?auto_77373 ) ) ( not ( = ?auto_77369 ?auto_77371 ) ) ( not ( = ?auto_77370 ?auto_77373 ) ) ( not ( = ?auto_77370 ?auto_77371 ) ) ( not ( = ?auto_77372 ?auto_77373 ) ) ( not ( = ?auto_77372 ?auto_77371 ) ) ( not ( = ?auto_77373 ?auto_77371 ) ) ( ON ?auto_77373 ?auto_77372 ) ( not ( = ?auto_77374 ?auto_77371 ) ) ( not ( = ?auto_77368 ?auto_77374 ) ) ( not ( = ?auto_77369 ?auto_77374 ) ) ( not ( = ?auto_77370 ?auto_77374 ) ) ( not ( = ?auto_77372 ?auto_77374 ) ) ( not ( = ?auto_77373 ?auto_77374 ) ) ( ON ?auto_77371 ?auto_77373 ) ( ON ?auto_77374 ?auto_77371 ) ( CLEAR ?auto_77374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77368 ?auto_77369 ?auto_77370 ?auto_77372 ?auto_77373 ?auto_77371 )
      ( MAKE-3PILE ?auto_77368 ?auto_77369 ?auto_77370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77375 - BLOCK
      ?auto_77376 - BLOCK
      ?auto_77377 - BLOCK
    )
    :vars
    (
      ?auto_77381 - BLOCK
      ?auto_77380 - BLOCK
      ?auto_77379 - BLOCK
      ?auto_77378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77381 ?auto_77377 ) ( ON-TABLE ?auto_77375 ) ( ON ?auto_77376 ?auto_77375 ) ( ON ?auto_77377 ?auto_77376 ) ( not ( = ?auto_77375 ?auto_77376 ) ) ( not ( = ?auto_77375 ?auto_77377 ) ) ( not ( = ?auto_77375 ?auto_77381 ) ) ( not ( = ?auto_77376 ?auto_77377 ) ) ( not ( = ?auto_77376 ?auto_77381 ) ) ( not ( = ?auto_77377 ?auto_77381 ) ) ( not ( = ?auto_77375 ?auto_77380 ) ) ( not ( = ?auto_77375 ?auto_77379 ) ) ( not ( = ?auto_77376 ?auto_77380 ) ) ( not ( = ?auto_77376 ?auto_77379 ) ) ( not ( = ?auto_77377 ?auto_77380 ) ) ( not ( = ?auto_77377 ?auto_77379 ) ) ( not ( = ?auto_77381 ?auto_77380 ) ) ( not ( = ?auto_77381 ?auto_77379 ) ) ( not ( = ?auto_77380 ?auto_77379 ) ) ( ON ?auto_77380 ?auto_77381 ) ( not ( = ?auto_77378 ?auto_77379 ) ) ( not ( = ?auto_77375 ?auto_77378 ) ) ( not ( = ?auto_77376 ?auto_77378 ) ) ( not ( = ?auto_77377 ?auto_77378 ) ) ( not ( = ?auto_77381 ?auto_77378 ) ) ( not ( = ?auto_77380 ?auto_77378 ) ) ( ON ?auto_77379 ?auto_77380 ) ( HOLDING ?auto_77378 ) ( CLEAR ?auto_77379 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77375 ?auto_77376 ?auto_77377 ?auto_77381 ?auto_77380 ?auto_77379 ?auto_77378 )
      ( MAKE-3PILE ?auto_77375 ?auto_77376 ?auto_77377 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77382 - BLOCK
      ?auto_77383 - BLOCK
      ?auto_77384 - BLOCK
    )
    :vars
    (
      ?auto_77387 - BLOCK
      ?auto_77388 - BLOCK
      ?auto_77385 - BLOCK
      ?auto_77386 - BLOCK
      ?auto_77389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77387 ?auto_77384 ) ( ON-TABLE ?auto_77382 ) ( ON ?auto_77383 ?auto_77382 ) ( ON ?auto_77384 ?auto_77383 ) ( not ( = ?auto_77382 ?auto_77383 ) ) ( not ( = ?auto_77382 ?auto_77384 ) ) ( not ( = ?auto_77382 ?auto_77387 ) ) ( not ( = ?auto_77383 ?auto_77384 ) ) ( not ( = ?auto_77383 ?auto_77387 ) ) ( not ( = ?auto_77384 ?auto_77387 ) ) ( not ( = ?auto_77382 ?auto_77388 ) ) ( not ( = ?auto_77382 ?auto_77385 ) ) ( not ( = ?auto_77383 ?auto_77388 ) ) ( not ( = ?auto_77383 ?auto_77385 ) ) ( not ( = ?auto_77384 ?auto_77388 ) ) ( not ( = ?auto_77384 ?auto_77385 ) ) ( not ( = ?auto_77387 ?auto_77388 ) ) ( not ( = ?auto_77387 ?auto_77385 ) ) ( not ( = ?auto_77388 ?auto_77385 ) ) ( ON ?auto_77388 ?auto_77387 ) ( not ( = ?auto_77386 ?auto_77385 ) ) ( not ( = ?auto_77382 ?auto_77386 ) ) ( not ( = ?auto_77383 ?auto_77386 ) ) ( not ( = ?auto_77384 ?auto_77386 ) ) ( not ( = ?auto_77387 ?auto_77386 ) ) ( not ( = ?auto_77388 ?auto_77386 ) ) ( ON ?auto_77385 ?auto_77388 ) ( CLEAR ?auto_77385 ) ( ON ?auto_77386 ?auto_77389 ) ( CLEAR ?auto_77386 ) ( HAND-EMPTY ) ( not ( = ?auto_77382 ?auto_77389 ) ) ( not ( = ?auto_77383 ?auto_77389 ) ) ( not ( = ?auto_77384 ?auto_77389 ) ) ( not ( = ?auto_77387 ?auto_77389 ) ) ( not ( = ?auto_77388 ?auto_77389 ) ) ( not ( = ?auto_77385 ?auto_77389 ) ) ( not ( = ?auto_77386 ?auto_77389 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77386 ?auto_77389 )
      ( MAKE-3PILE ?auto_77382 ?auto_77383 ?auto_77384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77390 - BLOCK
      ?auto_77391 - BLOCK
      ?auto_77392 - BLOCK
    )
    :vars
    (
      ?auto_77395 - BLOCK
      ?auto_77396 - BLOCK
      ?auto_77394 - BLOCK
      ?auto_77397 - BLOCK
      ?auto_77393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77395 ?auto_77392 ) ( ON-TABLE ?auto_77390 ) ( ON ?auto_77391 ?auto_77390 ) ( ON ?auto_77392 ?auto_77391 ) ( not ( = ?auto_77390 ?auto_77391 ) ) ( not ( = ?auto_77390 ?auto_77392 ) ) ( not ( = ?auto_77390 ?auto_77395 ) ) ( not ( = ?auto_77391 ?auto_77392 ) ) ( not ( = ?auto_77391 ?auto_77395 ) ) ( not ( = ?auto_77392 ?auto_77395 ) ) ( not ( = ?auto_77390 ?auto_77396 ) ) ( not ( = ?auto_77390 ?auto_77394 ) ) ( not ( = ?auto_77391 ?auto_77396 ) ) ( not ( = ?auto_77391 ?auto_77394 ) ) ( not ( = ?auto_77392 ?auto_77396 ) ) ( not ( = ?auto_77392 ?auto_77394 ) ) ( not ( = ?auto_77395 ?auto_77396 ) ) ( not ( = ?auto_77395 ?auto_77394 ) ) ( not ( = ?auto_77396 ?auto_77394 ) ) ( ON ?auto_77396 ?auto_77395 ) ( not ( = ?auto_77397 ?auto_77394 ) ) ( not ( = ?auto_77390 ?auto_77397 ) ) ( not ( = ?auto_77391 ?auto_77397 ) ) ( not ( = ?auto_77392 ?auto_77397 ) ) ( not ( = ?auto_77395 ?auto_77397 ) ) ( not ( = ?auto_77396 ?auto_77397 ) ) ( ON ?auto_77397 ?auto_77393 ) ( CLEAR ?auto_77397 ) ( not ( = ?auto_77390 ?auto_77393 ) ) ( not ( = ?auto_77391 ?auto_77393 ) ) ( not ( = ?auto_77392 ?auto_77393 ) ) ( not ( = ?auto_77395 ?auto_77393 ) ) ( not ( = ?auto_77396 ?auto_77393 ) ) ( not ( = ?auto_77394 ?auto_77393 ) ) ( not ( = ?auto_77397 ?auto_77393 ) ) ( HOLDING ?auto_77394 ) ( CLEAR ?auto_77396 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77390 ?auto_77391 ?auto_77392 ?auto_77395 ?auto_77396 ?auto_77394 )
      ( MAKE-3PILE ?auto_77390 ?auto_77391 ?auto_77392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77398 - BLOCK
      ?auto_77399 - BLOCK
      ?auto_77400 - BLOCK
    )
    :vars
    (
      ?auto_77403 - BLOCK
      ?auto_77401 - BLOCK
      ?auto_77404 - BLOCK
      ?auto_77405 - BLOCK
      ?auto_77402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77403 ?auto_77400 ) ( ON-TABLE ?auto_77398 ) ( ON ?auto_77399 ?auto_77398 ) ( ON ?auto_77400 ?auto_77399 ) ( not ( = ?auto_77398 ?auto_77399 ) ) ( not ( = ?auto_77398 ?auto_77400 ) ) ( not ( = ?auto_77398 ?auto_77403 ) ) ( not ( = ?auto_77399 ?auto_77400 ) ) ( not ( = ?auto_77399 ?auto_77403 ) ) ( not ( = ?auto_77400 ?auto_77403 ) ) ( not ( = ?auto_77398 ?auto_77401 ) ) ( not ( = ?auto_77398 ?auto_77404 ) ) ( not ( = ?auto_77399 ?auto_77401 ) ) ( not ( = ?auto_77399 ?auto_77404 ) ) ( not ( = ?auto_77400 ?auto_77401 ) ) ( not ( = ?auto_77400 ?auto_77404 ) ) ( not ( = ?auto_77403 ?auto_77401 ) ) ( not ( = ?auto_77403 ?auto_77404 ) ) ( not ( = ?auto_77401 ?auto_77404 ) ) ( ON ?auto_77401 ?auto_77403 ) ( not ( = ?auto_77405 ?auto_77404 ) ) ( not ( = ?auto_77398 ?auto_77405 ) ) ( not ( = ?auto_77399 ?auto_77405 ) ) ( not ( = ?auto_77400 ?auto_77405 ) ) ( not ( = ?auto_77403 ?auto_77405 ) ) ( not ( = ?auto_77401 ?auto_77405 ) ) ( ON ?auto_77405 ?auto_77402 ) ( not ( = ?auto_77398 ?auto_77402 ) ) ( not ( = ?auto_77399 ?auto_77402 ) ) ( not ( = ?auto_77400 ?auto_77402 ) ) ( not ( = ?auto_77403 ?auto_77402 ) ) ( not ( = ?auto_77401 ?auto_77402 ) ) ( not ( = ?auto_77404 ?auto_77402 ) ) ( not ( = ?auto_77405 ?auto_77402 ) ) ( CLEAR ?auto_77401 ) ( ON ?auto_77404 ?auto_77405 ) ( CLEAR ?auto_77404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77402 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77402 ?auto_77405 )
      ( MAKE-3PILE ?auto_77398 ?auto_77399 ?auto_77400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77406 - BLOCK
      ?auto_77407 - BLOCK
      ?auto_77408 - BLOCK
    )
    :vars
    (
      ?auto_77409 - BLOCK
      ?auto_77411 - BLOCK
      ?auto_77410 - BLOCK
      ?auto_77412 - BLOCK
      ?auto_77413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77409 ?auto_77408 ) ( ON-TABLE ?auto_77406 ) ( ON ?auto_77407 ?auto_77406 ) ( ON ?auto_77408 ?auto_77407 ) ( not ( = ?auto_77406 ?auto_77407 ) ) ( not ( = ?auto_77406 ?auto_77408 ) ) ( not ( = ?auto_77406 ?auto_77409 ) ) ( not ( = ?auto_77407 ?auto_77408 ) ) ( not ( = ?auto_77407 ?auto_77409 ) ) ( not ( = ?auto_77408 ?auto_77409 ) ) ( not ( = ?auto_77406 ?auto_77411 ) ) ( not ( = ?auto_77406 ?auto_77410 ) ) ( not ( = ?auto_77407 ?auto_77411 ) ) ( not ( = ?auto_77407 ?auto_77410 ) ) ( not ( = ?auto_77408 ?auto_77411 ) ) ( not ( = ?auto_77408 ?auto_77410 ) ) ( not ( = ?auto_77409 ?auto_77411 ) ) ( not ( = ?auto_77409 ?auto_77410 ) ) ( not ( = ?auto_77411 ?auto_77410 ) ) ( not ( = ?auto_77412 ?auto_77410 ) ) ( not ( = ?auto_77406 ?auto_77412 ) ) ( not ( = ?auto_77407 ?auto_77412 ) ) ( not ( = ?auto_77408 ?auto_77412 ) ) ( not ( = ?auto_77409 ?auto_77412 ) ) ( not ( = ?auto_77411 ?auto_77412 ) ) ( ON ?auto_77412 ?auto_77413 ) ( not ( = ?auto_77406 ?auto_77413 ) ) ( not ( = ?auto_77407 ?auto_77413 ) ) ( not ( = ?auto_77408 ?auto_77413 ) ) ( not ( = ?auto_77409 ?auto_77413 ) ) ( not ( = ?auto_77411 ?auto_77413 ) ) ( not ( = ?auto_77410 ?auto_77413 ) ) ( not ( = ?auto_77412 ?auto_77413 ) ) ( ON ?auto_77410 ?auto_77412 ) ( CLEAR ?auto_77410 ) ( ON-TABLE ?auto_77413 ) ( HOLDING ?auto_77411 ) ( CLEAR ?auto_77409 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77406 ?auto_77407 ?auto_77408 ?auto_77409 ?auto_77411 )
      ( MAKE-3PILE ?auto_77406 ?auto_77407 ?auto_77408 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77414 - BLOCK
      ?auto_77415 - BLOCK
      ?auto_77416 - BLOCK
    )
    :vars
    (
      ?auto_77419 - BLOCK
      ?auto_77421 - BLOCK
      ?auto_77420 - BLOCK
      ?auto_77417 - BLOCK
      ?auto_77418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77419 ?auto_77416 ) ( ON-TABLE ?auto_77414 ) ( ON ?auto_77415 ?auto_77414 ) ( ON ?auto_77416 ?auto_77415 ) ( not ( = ?auto_77414 ?auto_77415 ) ) ( not ( = ?auto_77414 ?auto_77416 ) ) ( not ( = ?auto_77414 ?auto_77419 ) ) ( not ( = ?auto_77415 ?auto_77416 ) ) ( not ( = ?auto_77415 ?auto_77419 ) ) ( not ( = ?auto_77416 ?auto_77419 ) ) ( not ( = ?auto_77414 ?auto_77421 ) ) ( not ( = ?auto_77414 ?auto_77420 ) ) ( not ( = ?auto_77415 ?auto_77421 ) ) ( not ( = ?auto_77415 ?auto_77420 ) ) ( not ( = ?auto_77416 ?auto_77421 ) ) ( not ( = ?auto_77416 ?auto_77420 ) ) ( not ( = ?auto_77419 ?auto_77421 ) ) ( not ( = ?auto_77419 ?auto_77420 ) ) ( not ( = ?auto_77421 ?auto_77420 ) ) ( not ( = ?auto_77417 ?auto_77420 ) ) ( not ( = ?auto_77414 ?auto_77417 ) ) ( not ( = ?auto_77415 ?auto_77417 ) ) ( not ( = ?auto_77416 ?auto_77417 ) ) ( not ( = ?auto_77419 ?auto_77417 ) ) ( not ( = ?auto_77421 ?auto_77417 ) ) ( ON ?auto_77417 ?auto_77418 ) ( not ( = ?auto_77414 ?auto_77418 ) ) ( not ( = ?auto_77415 ?auto_77418 ) ) ( not ( = ?auto_77416 ?auto_77418 ) ) ( not ( = ?auto_77419 ?auto_77418 ) ) ( not ( = ?auto_77421 ?auto_77418 ) ) ( not ( = ?auto_77420 ?auto_77418 ) ) ( not ( = ?auto_77417 ?auto_77418 ) ) ( ON ?auto_77420 ?auto_77417 ) ( ON-TABLE ?auto_77418 ) ( CLEAR ?auto_77419 ) ( ON ?auto_77421 ?auto_77420 ) ( CLEAR ?auto_77421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77418 ?auto_77417 ?auto_77420 )
      ( MAKE-3PILE ?auto_77414 ?auto_77415 ?auto_77416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77438 - BLOCK
      ?auto_77439 - BLOCK
      ?auto_77440 - BLOCK
    )
    :vars
    (
      ?auto_77444 - BLOCK
      ?auto_77441 - BLOCK
      ?auto_77445 - BLOCK
      ?auto_77443 - BLOCK
      ?auto_77442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77438 ) ( ON ?auto_77439 ?auto_77438 ) ( not ( = ?auto_77438 ?auto_77439 ) ) ( not ( = ?auto_77438 ?auto_77440 ) ) ( not ( = ?auto_77438 ?auto_77444 ) ) ( not ( = ?auto_77439 ?auto_77440 ) ) ( not ( = ?auto_77439 ?auto_77444 ) ) ( not ( = ?auto_77440 ?auto_77444 ) ) ( not ( = ?auto_77438 ?auto_77441 ) ) ( not ( = ?auto_77438 ?auto_77445 ) ) ( not ( = ?auto_77439 ?auto_77441 ) ) ( not ( = ?auto_77439 ?auto_77445 ) ) ( not ( = ?auto_77440 ?auto_77441 ) ) ( not ( = ?auto_77440 ?auto_77445 ) ) ( not ( = ?auto_77444 ?auto_77441 ) ) ( not ( = ?auto_77444 ?auto_77445 ) ) ( not ( = ?auto_77441 ?auto_77445 ) ) ( not ( = ?auto_77443 ?auto_77445 ) ) ( not ( = ?auto_77438 ?auto_77443 ) ) ( not ( = ?auto_77439 ?auto_77443 ) ) ( not ( = ?auto_77440 ?auto_77443 ) ) ( not ( = ?auto_77444 ?auto_77443 ) ) ( not ( = ?auto_77441 ?auto_77443 ) ) ( ON ?auto_77443 ?auto_77442 ) ( not ( = ?auto_77438 ?auto_77442 ) ) ( not ( = ?auto_77439 ?auto_77442 ) ) ( not ( = ?auto_77440 ?auto_77442 ) ) ( not ( = ?auto_77444 ?auto_77442 ) ) ( not ( = ?auto_77441 ?auto_77442 ) ) ( not ( = ?auto_77445 ?auto_77442 ) ) ( not ( = ?auto_77443 ?auto_77442 ) ) ( ON ?auto_77445 ?auto_77443 ) ( ON-TABLE ?auto_77442 ) ( ON ?auto_77441 ?auto_77445 ) ( ON ?auto_77444 ?auto_77441 ) ( CLEAR ?auto_77444 ) ( HOLDING ?auto_77440 ) ( CLEAR ?auto_77439 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77438 ?auto_77439 ?auto_77440 ?auto_77444 )
      ( MAKE-3PILE ?auto_77438 ?auto_77439 ?auto_77440 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77446 - BLOCK
      ?auto_77447 - BLOCK
      ?auto_77448 - BLOCK
    )
    :vars
    (
      ?auto_77450 - BLOCK
      ?auto_77452 - BLOCK
      ?auto_77451 - BLOCK
      ?auto_77453 - BLOCK
      ?auto_77449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77446 ) ( ON ?auto_77447 ?auto_77446 ) ( not ( = ?auto_77446 ?auto_77447 ) ) ( not ( = ?auto_77446 ?auto_77448 ) ) ( not ( = ?auto_77446 ?auto_77450 ) ) ( not ( = ?auto_77447 ?auto_77448 ) ) ( not ( = ?auto_77447 ?auto_77450 ) ) ( not ( = ?auto_77448 ?auto_77450 ) ) ( not ( = ?auto_77446 ?auto_77452 ) ) ( not ( = ?auto_77446 ?auto_77451 ) ) ( not ( = ?auto_77447 ?auto_77452 ) ) ( not ( = ?auto_77447 ?auto_77451 ) ) ( not ( = ?auto_77448 ?auto_77452 ) ) ( not ( = ?auto_77448 ?auto_77451 ) ) ( not ( = ?auto_77450 ?auto_77452 ) ) ( not ( = ?auto_77450 ?auto_77451 ) ) ( not ( = ?auto_77452 ?auto_77451 ) ) ( not ( = ?auto_77453 ?auto_77451 ) ) ( not ( = ?auto_77446 ?auto_77453 ) ) ( not ( = ?auto_77447 ?auto_77453 ) ) ( not ( = ?auto_77448 ?auto_77453 ) ) ( not ( = ?auto_77450 ?auto_77453 ) ) ( not ( = ?auto_77452 ?auto_77453 ) ) ( ON ?auto_77453 ?auto_77449 ) ( not ( = ?auto_77446 ?auto_77449 ) ) ( not ( = ?auto_77447 ?auto_77449 ) ) ( not ( = ?auto_77448 ?auto_77449 ) ) ( not ( = ?auto_77450 ?auto_77449 ) ) ( not ( = ?auto_77452 ?auto_77449 ) ) ( not ( = ?auto_77451 ?auto_77449 ) ) ( not ( = ?auto_77453 ?auto_77449 ) ) ( ON ?auto_77451 ?auto_77453 ) ( ON-TABLE ?auto_77449 ) ( ON ?auto_77452 ?auto_77451 ) ( ON ?auto_77450 ?auto_77452 ) ( CLEAR ?auto_77447 ) ( ON ?auto_77448 ?auto_77450 ) ( CLEAR ?auto_77448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77449 ?auto_77453 ?auto_77451 ?auto_77452 ?auto_77450 )
      ( MAKE-3PILE ?auto_77446 ?auto_77447 ?auto_77448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77454 - BLOCK
      ?auto_77455 - BLOCK
      ?auto_77456 - BLOCK
    )
    :vars
    (
      ?auto_77460 - BLOCK
      ?auto_77457 - BLOCK
      ?auto_77459 - BLOCK
      ?auto_77461 - BLOCK
      ?auto_77458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77454 ) ( not ( = ?auto_77454 ?auto_77455 ) ) ( not ( = ?auto_77454 ?auto_77456 ) ) ( not ( = ?auto_77454 ?auto_77460 ) ) ( not ( = ?auto_77455 ?auto_77456 ) ) ( not ( = ?auto_77455 ?auto_77460 ) ) ( not ( = ?auto_77456 ?auto_77460 ) ) ( not ( = ?auto_77454 ?auto_77457 ) ) ( not ( = ?auto_77454 ?auto_77459 ) ) ( not ( = ?auto_77455 ?auto_77457 ) ) ( not ( = ?auto_77455 ?auto_77459 ) ) ( not ( = ?auto_77456 ?auto_77457 ) ) ( not ( = ?auto_77456 ?auto_77459 ) ) ( not ( = ?auto_77460 ?auto_77457 ) ) ( not ( = ?auto_77460 ?auto_77459 ) ) ( not ( = ?auto_77457 ?auto_77459 ) ) ( not ( = ?auto_77461 ?auto_77459 ) ) ( not ( = ?auto_77454 ?auto_77461 ) ) ( not ( = ?auto_77455 ?auto_77461 ) ) ( not ( = ?auto_77456 ?auto_77461 ) ) ( not ( = ?auto_77460 ?auto_77461 ) ) ( not ( = ?auto_77457 ?auto_77461 ) ) ( ON ?auto_77461 ?auto_77458 ) ( not ( = ?auto_77454 ?auto_77458 ) ) ( not ( = ?auto_77455 ?auto_77458 ) ) ( not ( = ?auto_77456 ?auto_77458 ) ) ( not ( = ?auto_77460 ?auto_77458 ) ) ( not ( = ?auto_77457 ?auto_77458 ) ) ( not ( = ?auto_77459 ?auto_77458 ) ) ( not ( = ?auto_77461 ?auto_77458 ) ) ( ON ?auto_77459 ?auto_77461 ) ( ON-TABLE ?auto_77458 ) ( ON ?auto_77457 ?auto_77459 ) ( ON ?auto_77460 ?auto_77457 ) ( ON ?auto_77456 ?auto_77460 ) ( CLEAR ?auto_77456 ) ( HOLDING ?auto_77455 ) ( CLEAR ?auto_77454 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77454 ?auto_77455 )
      ( MAKE-3PILE ?auto_77454 ?auto_77455 ?auto_77456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77462 - BLOCK
      ?auto_77463 - BLOCK
      ?auto_77464 - BLOCK
    )
    :vars
    (
      ?auto_77469 - BLOCK
      ?auto_77466 - BLOCK
      ?auto_77468 - BLOCK
      ?auto_77467 - BLOCK
      ?auto_77465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77462 ) ( not ( = ?auto_77462 ?auto_77463 ) ) ( not ( = ?auto_77462 ?auto_77464 ) ) ( not ( = ?auto_77462 ?auto_77469 ) ) ( not ( = ?auto_77463 ?auto_77464 ) ) ( not ( = ?auto_77463 ?auto_77469 ) ) ( not ( = ?auto_77464 ?auto_77469 ) ) ( not ( = ?auto_77462 ?auto_77466 ) ) ( not ( = ?auto_77462 ?auto_77468 ) ) ( not ( = ?auto_77463 ?auto_77466 ) ) ( not ( = ?auto_77463 ?auto_77468 ) ) ( not ( = ?auto_77464 ?auto_77466 ) ) ( not ( = ?auto_77464 ?auto_77468 ) ) ( not ( = ?auto_77469 ?auto_77466 ) ) ( not ( = ?auto_77469 ?auto_77468 ) ) ( not ( = ?auto_77466 ?auto_77468 ) ) ( not ( = ?auto_77467 ?auto_77468 ) ) ( not ( = ?auto_77462 ?auto_77467 ) ) ( not ( = ?auto_77463 ?auto_77467 ) ) ( not ( = ?auto_77464 ?auto_77467 ) ) ( not ( = ?auto_77469 ?auto_77467 ) ) ( not ( = ?auto_77466 ?auto_77467 ) ) ( ON ?auto_77467 ?auto_77465 ) ( not ( = ?auto_77462 ?auto_77465 ) ) ( not ( = ?auto_77463 ?auto_77465 ) ) ( not ( = ?auto_77464 ?auto_77465 ) ) ( not ( = ?auto_77469 ?auto_77465 ) ) ( not ( = ?auto_77466 ?auto_77465 ) ) ( not ( = ?auto_77468 ?auto_77465 ) ) ( not ( = ?auto_77467 ?auto_77465 ) ) ( ON ?auto_77468 ?auto_77467 ) ( ON-TABLE ?auto_77465 ) ( ON ?auto_77466 ?auto_77468 ) ( ON ?auto_77469 ?auto_77466 ) ( ON ?auto_77464 ?auto_77469 ) ( CLEAR ?auto_77462 ) ( ON ?auto_77463 ?auto_77464 ) ( CLEAR ?auto_77463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77465 ?auto_77467 ?auto_77468 ?auto_77466 ?auto_77469 ?auto_77464 )
      ( MAKE-3PILE ?auto_77462 ?auto_77463 ?auto_77464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77470 - BLOCK
      ?auto_77471 - BLOCK
      ?auto_77472 - BLOCK
    )
    :vars
    (
      ?auto_77473 - BLOCK
      ?auto_77477 - BLOCK
      ?auto_77475 - BLOCK
      ?auto_77474 - BLOCK
      ?auto_77476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77470 ?auto_77471 ) ) ( not ( = ?auto_77470 ?auto_77472 ) ) ( not ( = ?auto_77470 ?auto_77473 ) ) ( not ( = ?auto_77471 ?auto_77472 ) ) ( not ( = ?auto_77471 ?auto_77473 ) ) ( not ( = ?auto_77472 ?auto_77473 ) ) ( not ( = ?auto_77470 ?auto_77477 ) ) ( not ( = ?auto_77470 ?auto_77475 ) ) ( not ( = ?auto_77471 ?auto_77477 ) ) ( not ( = ?auto_77471 ?auto_77475 ) ) ( not ( = ?auto_77472 ?auto_77477 ) ) ( not ( = ?auto_77472 ?auto_77475 ) ) ( not ( = ?auto_77473 ?auto_77477 ) ) ( not ( = ?auto_77473 ?auto_77475 ) ) ( not ( = ?auto_77477 ?auto_77475 ) ) ( not ( = ?auto_77474 ?auto_77475 ) ) ( not ( = ?auto_77470 ?auto_77474 ) ) ( not ( = ?auto_77471 ?auto_77474 ) ) ( not ( = ?auto_77472 ?auto_77474 ) ) ( not ( = ?auto_77473 ?auto_77474 ) ) ( not ( = ?auto_77477 ?auto_77474 ) ) ( ON ?auto_77474 ?auto_77476 ) ( not ( = ?auto_77470 ?auto_77476 ) ) ( not ( = ?auto_77471 ?auto_77476 ) ) ( not ( = ?auto_77472 ?auto_77476 ) ) ( not ( = ?auto_77473 ?auto_77476 ) ) ( not ( = ?auto_77477 ?auto_77476 ) ) ( not ( = ?auto_77475 ?auto_77476 ) ) ( not ( = ?auto_77474 ?auto_77476 ) ) ( ON ?auto_77475 ?auto_77474 ) ( ON-TABLE ?auto_77476 ) ( ON ?auto_77477 ?auto_77475 ) ( ON ?auto_77473 ?auto_77477 ) ( ON ?auto_77472 ?auto_77473 ) ( ON ?auto_77471 ?auto_77472 ) ( CLEAR ?auto_77471 ) ( HOLDING ?auto_77470 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77470 )
      ( MAKE-3PILE ?auto_77470 ?auto_77471 ?auto_77472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_77478 - BLOCK
      ?auto_77479 - BLOCK
      ?auto_77480 - BLOCK
    )
    :vars
    (
      ?auto_77482 - BLOCK
      ?auto_77485 - BLOCK
      ?auto_77483 - BLOCK
      ?auto_77484 - BLOCK
      ?auto_77481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77478 ?auto_77479 ) ) ( not ( = ?auto_77478 ?auto_77480 ) ) ( not ( = ?auto_77478 ?auto_77482 ) ) ( not ( = ?auto_77479 ?auto_77480 ) ) ( not ( = ?auto_77479 ?auto_77482 ) ) ( not ( = ?auto_77480 ?auto_77482 ) ) ( not ( = ?auto_77478 ?auto_77485 ) ) ( not ( = ?auto_77478 ?auto_77483 ) ) ( not ( = ?auto_77479 ?auto_77485 ) ) ( not ( = ?auto_77479 ?auto_77483 ) ) ( not ( = ?auto_77480 ?auto_77485 ) ) ( not ( = ?auto_77480 ?auto_77483 ) ) ( not ( = ?auto_77482 ?auto_77485 ) ) ( not ( = ?auto_77482 ?auto_77483 ) ) ( not ( = ?auto_77485 ?auto_77483 ) ) ( not ( = ?auto_77484 ?auto_77483 ) ) ( not ( = ?auto_77478 ?auto_77484 ) ) ( not ( = ?auto_77479 ?auto_77484 ) ) ( not ( = ?auto_77480 ?auto_77484 ) ) ( not ( = ?auto_77482 ?auto_77484 ) ) ( not ( = ?auto_77485 ?auto_77484 ) ) ( ON ?auto_77484 ?auto_77481 ) ( not ( = ?auto_77478 ?auto_77481 ) ) ( not ( = ?auto_77479 ?auto_77481 ) ) ( not ( = ?auto_77480 ?auto_77481 ) ) ( not ( = ?auto_77482 ?auto_77481 ) ) ( not ( = ?auto_77485 ?auto_77481 ) ) ( not ( = ?auto_77483 ?auto_77481 ) ) ( not ( = ?auto_77484 ?auto_77481 ) ) ( ON ?auto_77483 ?auto_77484 ) ( ON-TABLE ?auto_77481 ) ( ON ?auto_77485 ?auto_77483 ) ( ON ?auto_77482 ?auto_77485 ) ( ON ?auto_77480 ?auto_77482 ) ( ON ?auto_77479 ?auto_77480 ) ( ON ?auto_77478 ?auto_77479 ) ( CLEAR ?auto_77478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77481 ?auto_77484 ?auto_77483 ?auto_77485 ?auto_77482 ?auto_77480 ?auto_77479 )
      ( MAKE-3PILE ?auto_77478 ?auto_77479 ?auto_77480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77490 - BLOCK
      ?auto_77491 - BLOCK
      ?auto_77492 - BLOCK
      ?auto_77493 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_77493 ) ( CLEAR ?auto_77492 ) ( ON-TABLE ?auto_77490 ) ( ON ?auto_77491 ?auto_77490 ) ( ON ?auto_77492 ?auto_77491 ) ( not ( = ?auto_77490 ?auto_77491 ) ) ( not ( = ?auto_77490 ?auto_77492 ) ) ( not ( = ?auto_77490 ?auto_77493 ) ) ( not ( = ?auto_77491 ?auto_77492 ) ) ( not ( = ?auto_77491 ?auto_77493 ) ) ( not ( = ?auto_77492 ?auto_77493 ) ) )
    :subtasks
    ( ( !STACK ?auto_77493 ?auto_77492 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77494 - BLOCK
      ?auto_77495 - BLOCK
      ?auto_77496 - BLOCK
      ?auto_77497 - BLOCK
    )
    :vars
    (
      ?auto_77498 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77496 ) ( ON-TABLE ?auto_77494 ) ( ON ?auto_77495 ?auto_77494 ) ( ON ?auto_77496 ?auto_77495 ) ( not ( = ?auto_77494 ?auto_77495 ) ) ( not ( = ?auto_77494 ?auto_77496 ) ) ( not ( = ?auto_77494 ?auto_77497 ) ) ( not ( = ?auto_77495 ?auto_77496 ) ) ( not ( = ?auto_77495 ?auto_77497 ) ) ( not ( = ?auto_77496 ?auto_77497 ) ) ( ON ?auto_77497 ?auto_77498 ) ( CLEAR ?auto_77497 ) ( HAND-EMPTY ) ( not ( = ?auto_77494 ?auto_77498 ) ) ( not ( = ?auto_77495 ?auto_77498 ) ) ( not ( = ?auto_77496 ?auto_77498 ) ) ( not ( = ?auto_77497 ?auto_77498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77497 ?auto_77498 )
      ( MAKE-4PILE ?auto_77494 ?auto_77495 ?auto_77496 ?auto_77497 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77499 - BLOCK
      ?auto_77500 - BLOCK
      ?auto_77501 - BLOCK
      ?auto_77502 - BLOCK
    )
    :vars
    (
      ?auto_77503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77499 ) ( ON ?auto_77500 ?auto_77499 ) ( not ( = ?auto_77499 ?auto_77500 ) ) ( not ( = ?auto_77499 ?auto_77501 ) ) ( not ( = ?auto_77499 ?auto_77502 ) ) ( not ( = ?auto_77500 ?auto_77501 ) ) ( not ( = ?auto_77500 ?auto_77502 ) ) ( not ( = ?auto_77501 ?auto_77502 ) ) ( ON ?auto_77502 ?auto_77503 ) ( CLEAR ?auto_77502 ) ( not ( = ?auto_77499 ?auto_77503 ) ) ( not ( = ?auto_77500 ?auto_77503 ) ) ( not ( = ?auto_77501 ?auto_77503 ) ) ( not ( = ?auto_77502 ?auto_77503 ) ) ( HOLDING ?auto_77501 ) ( CLEAR ?auto_77500 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77499 ?auto_77500 ?auto_77501 )
      ( MAKE-4PILE ?auto_77499 ?auto_77500 ?auto_77501 ?auto_77502 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77504 - BLOCK
      ?auto_77505 - BLOCK
      ?auto_77506 - BLOCK
      ?auto_77507 - BLOCK
    )
    :vars
    (
      ?auto_77508 - BLOCK
      ?auto_77509 - BLOCK
      ?auto_77510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77504 ) ( ON ?auto_77505 ?auto_77504 ) ( not ( = ?auto_77504 ?auto_77505 ) ) ( not ( = ?auto_77504 ?auto_77506 ) ) ( not ( = ?auto_77504 ?auto_77507 ) ) ( not ( = ?auto_77505 ?auto_77506 ) ) ( not ( = ?auto_77505 ?auto_77507 ) ) ( not ( = ?auto_77506 ?auto_77507 ) ) ( ON ?auto_77507 ?auto_77508 ) ( not ( = ?auto_77504 ?auto_77508 ) ) ( not ( = ?auto_77505 ?auto_77508 ) ) ( not ( = ?auto_77506 ?auto_77508 ) ) ( not ( = ?auto_77507 ?auto_77508 ) ) ( CLEAR ?auto_77505 ) ( ON ?auto_77506 ?auto_77507 ) ( CLEAR ?auto_77506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77509 ) ( ON ?auto_77510 ?auto_77509 ) ( ON ?auto_77508 ?auto_77510 ) ( not ( = ?auto_77509 ?auto_77510 ) ) ( not ( = ?auto_77509 ?auto_77508 ) ) ( not ( = ?auto_77509 ?auto_77507 ) ) ( not ( = ?auto_77509 ?auto_77506 ) ) ( not ( = ?auto_77510 ?auto_77508 ) ) ( not ( = ?auto_77510 ?auto_77507 ) ) ( not ( = ?auto_77510 ?auto_77506 ) ) ( not ( = ?auto_77504 ?auto_77509 ) ) ( not ( = ?auto_77504 ?auto_77510 ) ) ( not ( = ?auto_77505 ?auto_77509 ) ) ( not ( = ?auto_77505 ?auto_77510 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77509 ?auto_77510 ?auto_77508 ?auto_77507 )
      ( MAKE-4PILE ?auto_77504 ?auto_77505 ?auto_77506 ?auto_77507 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77511 - BLOCK
      ?auto_77512 - BLOCK
      ?auto_77513 - BLOCK
      ?auto_77514 - BLOCK
    )
    :vars
    (
      ?auto_77517 - BLOCK
      ?auto_77516 - BLOCK
      ?auto_77515 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77511 ) ( not ( = ?auto_77511 ?auto_77512 ) ) ( not ( = ?auto_77511 ?auto_77513 ) ) ( not ( = ?auto_77511 ?auto_77514 ) ) ( not ( = ?auto_77512 ?auto_77513 ) ) ( not ( = ?auto_77512 ?auto_77514 ) ) ( not ( = ?auto_77513 ?auto_77514 ) ) ( ON ?auto_77514 ?auto_77517 ) ( not ( = ?auto_77511 ?auto_77517 ) ) ( not ( = ?auto_77512 ?auto_77517 ) ) ( not ( = ?auto_77513 ?auto_77517 ) ) ( not ( = ?auto_77514 ?auto_77517 ) ) ( ON ?auto_77513 ?auto_77514 ) ( CLEAR ?auto_77513 ) ( ON-TABLE ?auto_77516 ) ( ON ?auto_77515 ?auto_77516 ) ( ON ?auto_77517 ?auto_77515 ) ( not ( = ?auto_77516 ?auto_77515 ) ) ( not ( = ?auto_77516 ?auto_77517 ) ) ( not ( = ?auto_77516 ?auto_77514 ) ) ( not ( = ?auto_77516 ?auto_77513 ) ) ( not ( = ?auto_77515 ?auto_77517 ) ) ( not ( = ?auto_77515 ?auto_77514 ) ) ( not ( = ?auto_77515 ?auto_77513 ) ) ( not ( = ?auto_77511 ?auto_77516 ) ) ( not ( = ?auto_77511 ?auto_77515 ) ) ( not ( = ?auto_77512 ?auto_77516 ) ) ( not ( = ?auto_77512 ?auto_77515 ) ) ( HOLDING ?auto_77512 ) ( CLEAR ?auto_77511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77511 ?auto_77512 )
      ( MAKE-4PILE ?auto_77511 ?auto_77512 ?auto_77513 ?auto_77514 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77518 - BLOCK
      ?auto_77519 - BLOCK
      ?auto_77520 - BLOCK
      ?auto_77521 - BLOCK
    )
    :vars
    (
      ?auto_77522 - BLOCK
      ?auto_77524 - BLOCK
      ?auto_77523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77518 ) ( not ( = ?auto_77518 ?auto_77519 ) ) ( not ( = ?auto_77518 ?auto_77520 ) ) ( not ( = ?auto_77518 ?auto_77521 ) ) ( not ( = ?auto_77519 ?auto_77520 ) ) ( not ( = ?auto_77519 ?auto_77521 ) ) ( not ( = ?auto_77520 ?auto_77521 ) ) ( ON ?auto_77521 ?auto_77522 ) ( not ( = ?auto_77518 ?auto_77522 ) ) ( not ( = ?auto_77519 ?auto_77522 ) ) ( not ( = ?auto_77520 ?auto_77522 ) ) ( not ( = ?auto_77521 ?auto_77522 ) ) ( ON ?auto_77520 ?auto_77521 ) ( ON-TABLE ?auto_77524 ) ( ON ?auto_77523 ?auto_77524 ) ( ON ?auto_77522 ?auto_77523 ) ( not ( = ?auto_77524 ?auto_77523 ) ) ( not ( = ?auto_77524 ?auto_77522 ) ) ( not ( = ?auto_77524 ?auto_77521 ) ) ( not ( = ?auto_77524 ?auto_77520 ) ) ( not ( = ?auto_77523 ?auto_77522 ) ) ( not ( = ?auto_77523 ?auto_77521 ) ) ( not ( = ?auto_77523 ?auto_77520 ) ) ( not ( = ?auto_77518 ?auto_77524 ) ) ( not ( = ?auto_77518 ?auto_77523 ) ) ( not ( = ?auto_77519 ?auto_77524 ) ) ( not ( = ?auto_77519 ?auto_77523 ) ) ( CLEAR ?auto_77518 ) ( ON ?auto_77519 ?auto_77520 ) ( CLEAR ?auto_77519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77524 ?auto_77523 ?auto_77522 ?auto_77521 ?auto_77520 )
      ( MAKE-4PILE ?auto_77518 ?auto_77519 ?auto_77520 ?auto_77521 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77525 - BLOCK
      ?auto_77526 - BLOCK
      ?auto_77527 - BLOCK
      ?auto_77528 - BLOCK
    )
    :vars
    (
      ?auto_77529 - BLOCK
      ?auto_77531 - BLOCK
      ?auto_77530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77525 ?auto_77526 ) ) ( not ( = ?auto_77525 ?auto_77527 ) ) ( not ( = ?auto_77525 ?auto_77528 ) ) ( not ( = ?auto_77526 ?auto_77527 ) ) ( not ( = ?auto_77526 ?auto_77528 ) ) ( not ( = ?auto_77527 ?auto_77528 ) ) ( ON ?auto_77528 ?auto_77529 ) ( not ( = ?auto_77525 ?auto_77529 ) ) ( not ( = ?auto_77526 ?auto_77529 ) ) ( not ( = ?auto_77527 ?auto_77529 ) ) ( not ( = ?auto_77528 ?auto_77529 ) ) ( ON ?auto_77527 ?auto_77528 ) ( ON-TABLE ?auto_77531 ) ( ON ?auto_77530 ?auto_77531 ) ( ON ?auto_77529 ?auto_77530 ) ( not ( = ?auto_77531 ?auto_77530 ) ) ( not ( = ?auto_77531 ?auto_77529 ) ) ( not ( = ?auto_77531 ?auto_77528 ) ) ( not ( = ?auto_77531 ?auto_77527 ) ) ( not ( = ?auto_77530 ?auto_77529 ) ) ( not ( = ?auto_77530 ?auto_77528 ) ) ( not ( = ?auto_77530 ?auto_77527 ) ) ( not ( = ?auto_77525 ?auto_77531 ) ) ( not ( = ?auto_77525 ?auto_77530 ) ) ( not ( = ?auto_77526 ?auto_77531 ) ) ( not ( = ?auto_77526 ?auto_77530 ) ) ( ON ?auto_77526 ?auto_77527 ) ( CLEAR ?auto_77526 ) ( HOLDING ?auto_77525 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77525 )
      ( MAKE-4PILE ?auto_77525 ?auto_77526 ?auto_77527 ?auto_77528 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77532 - BLOCK
      ?auto_77533 - BLOCK
      ?auto_77534 - BLOCK
      ?auto_77535 - BLOCK
    )
    :vars
    (
      ?auto_77536 - BLOCK
      ?auto_77537 - BLOCK
      ?auto_77538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77532 ?auto_77533 ) ) ( not ( = ?auto_77532 ?auto_77534 ) ) ( not ( = ?auto_77532 ?auto_77535 ) ) ( not ( = ?auto_77533 ?auto_77534 ) ) ( not ( = ?auto_77533 ?auto_77535 ) ) ( not ( = ?auto_77534 ?auto_77535 ) ) ( ON ?auto_77535 ?auto_77536 ) ( not ( = ?auto_77532 ?auto_77536 ) ) ( not ( = ?auto_77533 ?auto_77536 ) ) ( not ( = ?auto_77534 ?auto_77536 ) ) ( not ( = ?auto_77535 ?auto_77536 ) ) ( ON ?auto_77534 ?auto_77535 ) ( ON-TABLE ?auto_77537 ) ( ON ?auto_77538 ?auto_77537 ) ( ON ?auto_77536 ?auto_77538 ) ( not ( = ?auto_77537 ?auto_77538 ) ) ( not ( = ?auto_77537 ?auto_77536 ) ) ( not ( = ?auto_77537 ?auto_77535 ) ) ( not ( = ?auto_77537 ?auto_77534 ) ) ( not ( = ?auto_77538 ?auto_77536 ) ) ( not ( = ?auto_77538 ?auto_77535 ) ) ( not ( = ?auto_77538 ?auto_77534 ) ) ( not ( = ?auto_77532 ?auto_77537 ) ) ( not ( = ?auto_77532 ?auto_77538 ) ) ( not ( = ?auto_77533 ?auto_77537 ) ) ( not ( = ?auto_77533 ?auto_77538 ) ) ( ON ?auto_77533 ?auto_77534 ) ( ON ?auto_77532 ?auto_77533 ) ( CLEAR ?auto_77532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77537 ?auto_77538 ?auto_77536 ?auto_77535 ?auto_77534 ?auto_77533 )
      ( MAKE-4PILE ?auto_77532 ?auto_77533 ?auto_77534 ?auto_77535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77539 - BLOCK
      ?auto_77540 - BLOCK
      ?auto_77541 - BLOCK
      ?auto_77542 - BLOCK
    )
    :vars
    (
      ?auto_77545 - BLOCK
      ?auto_77544 - BLOCK
      ?auto_77543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77539 ?auto_77540 ) ) ( not ( = ?auto_77539 ?auto_77541 ) ) ( not ( = ?auto_77539 ?auto_77542 ) ) ( not ( = ?auto_77540 ?auto_77541 ) ) ( not ( = ?auto_77540 ?auto_77542 ) ) ( not ( = ?auto_77541 ?auto_77542 ) ) ( ON ?auto_77542 ?auto_77545 ) ( not ( = ?auto_77539 ?auto_77545 ) ) ( not ( = ?auto_77540 ?auto_77545 ) ) ( not ( = ?auto_77541 ?auto_77545 ) ) ( not ( = ?auto_77542 ?auto_77545 ) ) ( ON ?auto_77541 ?auto_77542 ) ( ON-TABLE ?auto_77544 ) ( ON ?auto_77543 ?auto_77544 ) ( ON ?auto_77545 ?auto_77543 ) ( not ( = ?auto_77544 ?auto_77543 ) ) ( not ( = ?auto_77544 ?auto_77545 ) ) ( not ( = ?auto_77544 ?auto_77542 ) ) ( not ( = ?auto_77544 ?auto_77541 ) ) ( not ( = ?auto_77543 ?auto_77545 ) ) ( not ( = ?auto_77543 ?auto_77542 ) ) ( not ( = ?auto_77543 ?auto_77541 ) ) ( not ( = ?auto_77539 ?auto_77544 ) ) ( not ( = ?auto_77539 ?auto_77543 ) ) ( not ( = ?auto_77540 ?auto_77544 ) ) ( not ( = ?auto_77540 ?auto_77543 ) ) ( ON ?auto_77540 ?auto_77541 ) ( HOLDING ?auto_77539 ) ( CLEAR ?auto_77540 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77544 ?auto_77543 ?auto_77545 ?auto_77542 ?auto_77541 ?auto_77540 ?auto_77539 )
      ( MAKE-4PILE ?auto_77539 ?auto_77540 ?auto_77541 ?auto_77542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77546 - BLOCK
      ?auto_77547 - BLOCK
      ?auto_77548 - BLOCK
      ?auto_77549 - BLOCK
    )
    :vars
    (
      ?auto_77550 - BLOCK
      ?auto_77551 - BLOCK
      ?auto_77552 - BLOCK
      ?auto_77553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77546 ?auto_77547 ) ) ( not ( = ?auto_77546 ?auto_77548 ) ) ( not ( = ?auto_77546 ?auto_77549 ) ) ( not ( = ?auto_77547 ?auto_77548 ) ) ( not ( = ?auto_77547 ?auto_77549 ) ) ( not ( = ?auto_77548 ?auto_77549 ) ) ( ON ?auto_77549 ?auto_77550 ) ( not ( = ?auto_77546 ?auto_77550 ) ) ( not ( = ?auto_77547 ?auto_77550 ) ) ( not ( = ?auto_77548 ?auto_77550 ) ) ( not ( = ?auto_77549 ?auto_77550 ) ) ( ON ?auto_77548 ?auto_77549 ) ( ON-TABLE ?auto_77551 ) ( ON ?auto_77552 ?auto_77551 ) ( ON ?auto_77550 ?auto_77552 ) ( not ( = ?auto_77551 ?auto_77552 ) ) ( not ( = ?auto_77551 ?auto_77550 ) ) ( not ( = ?auto_77551 ?auto_77549 ) ) ( not ( = ?auto_77551 ?auto_77548 ) ) ( not ( = ?auto_77552 ?auto_77550 ) ) ( not ( = ?auto_77552 ?auto_77549 ) ) ( not ( = ?auto_77552 ?auto_77548 ) ) ( not ( = ?auto_77546 ?auto_77551 ) ) ( not ( = ?auto_77546 ?auto_77552 ) ) ( not ( = ?auto_77547 ?auto_77551 ) ) ( not ( = ?auto_77547 ?auto_77552 ) ) ( ON ?auto_77547 ?auto_77548 ) ( CLEAR ?auto_77547 ) ( ON ?auto_77546 ?auto_77553 ) ( CLEAR ?auto_77546 ) ( HAND-EMPTY ) ( not ( = ?auto_77546 ?auto_77553 ) ) ( not ( = ?auto_77547 ?auto_77553 ) ) ( not ( = ?auto_77548 ?auto_77553 ) ) ( not ( = ?auto_77549 ?auto_77553 ) ) ( not ( = ?auto_77550 ?auto_77553 ) ) ( not ( = ?auto_77551 ?auto_77553 ) ) ( not ( = ?auto_77552 ?auto_77553 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77546 ?auto_77553 )
      ( MAKE-4PILE ?auto_77546 ?auto_77547 ?auto_77548 ?auto_77549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77554 - BLOCK
      ?auto_77555 - BLOCK
      ?auto_77556 - BLOCK
      ?auto_77557 - BLOCK
    )
    :vars
    (
      ?auto_77561 - BLOCK
      ?auto_77559 - BLOCK
      ?auto_77560 - BLOCK
      ?auto_77558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77554 ?auto_77555 ) ) ( not ( = ?auto_77554 ?auto_77556 ) ) ( not ( = ?auto_77554 ?auto_77557 ) ) ( not ( = ?auto_77555 ?auto_77556 ) ) ( not ( = ?auto_77555 ?auto_77557 ) ) ( not ( = ?auto_77556 ?auto_77557 ) ) ( ON ?auto_77557 ?auto_77561 ) ( not ( = ?auto_77554 ?auto_77561 ) ) ( not ( = ?auto_77555 ?auto_77561 ) ) ( not ( = ?auto_77556 ?auto_77561 ) ) ( not ( = ?auto_77557 ?auto_77561 ) ) ( ON ?auto_77556 ?auto_77557 ) ( ON-TABLE ?auto_77559 ) ( ON ?auto_77560 ?auto_77559 ) ( ON ?auto_77561 ?auto_77560 ) ( not ( = ?auto_77559 ?auto_77560 ) ) ( not ( = ?auto_77559 ?auto_77561 ) ) ( not ( = ?auto_77559 ?auto_77557 ) ) ( not ( = ?auto_77559 ?auto_77556 ) ) ( not ( = ?auto_77560 ?auto_77561 ) ) ( not ( = ?auto_77560 ?auto_77557 ) ) ( not ( = ?auto_77560 ?auto_77556 ) ) ( not ( = ?auto_77554 ?auto_77559 ) ) ( not ( = ?auto_77554 ?auto_77560 ) ) ( not ( = ?auto_77555 ?auto_77559 ) ) ( not ( = ?auto_77555 ?auto_77560 ) ) ( ON ?auto_77554 ?auto_77558 ) ( CLEAR ?auto_77554 ) ( not ( = ?auto_77554 ?auto_77558 ) ) ( not ( = ?auto_77555 ?auto_77558 ) ) ( not ( = ?auto_77556 ?auto_77558 ) ) ( not ( = ?auto_77557 ?auto_77558 ) ) ( not ( = ?auto_77561 ?auto_77558 ) ) ( not ( = ?auto_77559 ?auto_77558 ) ) ( not ( = ?auto_77560 ?auto_77558 ) ) ( HOLDING ?auto_77555 ) ( CLEAR ?auto_77556 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77559 ?auto_77560 ?auto_77561 ?auto_77557 ?auto_77556 ?auto_77555 )
      ( MAKE-4PILE ?auto_77554 ?auto_77555 ?auto_77556 ?auto_77557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77562 - BLOCK
      ?auto_77563 - BLOCK
      ?auto_77564 - BLOCK
      ?auto_77565 - BLOCK
    )
    :vars
    (
      ?auto_77568 - BLOCK
      ?auto_77567 - BLOCK
      ?auto_77569 - BLOCK
      ?auto_77566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77562 ?auto_77563 ) ) ( not ( = ?auto_77562 ?auto_77564 ) ) ( not ( = ?auto_77562 ?auto_77565 ) ) ( not ( = ?auto_77563 ?auto_77564 ) ) ( not ( = ?auto_77563 ?auto_77565 ) ) ( not ( = ?auto_77564 ?auto_77565 ) ) ( ON ?auto_77565 ?auto_77568 ) ( not ( = ?auto_77562 ?auto_77568 ) ) ( not ( = ?auto_77563 ?auto_77568 ) ) ( not ( = ?auto_77564 ?auto_77568 ) ) ( not ( = ?auto_77565 ?auto_77568 ) ) ( ON ?auto_77564 ?auto_77565 ) ( ON-TABLE ?auto_77567 ) ( ON ?auto_77569 ?auto_77567 ) ( ON ?auto_77568 ?auto_77569 ) ( not ( = ?auto_77567 ?auto_77569 ) ) ( not ( = ?auto_77567 ?auto_77568 ) ) ( not ( = ?auto_77567 ?auto_77565 ) ) ( not ( = ?auto_77567 ?auto_77564 ) ) ( not ( = ?auto_77569 ?auto_77568 ) ) ( not ( = ?auto_77569 ?auto_77565 ) ) ( not ( = ?auto_77569 ?auto_77564 ) ) ( not ( = ?auto_77562 ?auto_77567 ) ) ( not ( = ?auto_77562 ?auto_77569 ) ) ( not ( = ?auto_77563 ?auto_77567 ) ) ( not ( = ?auto_77563 ?auto_77569 ) ) ( ON ?auto_77562 ?auto_77566 ) ( not ( = ?auto_77562 ?auto_77566 ) ) ( not ( = ?auto_77563 ?auto_77566 ) ) ( not ( = ?auto_77564 ?auto_77566 ) ) ( not ( = ?auto_77565 ?auto_77566 ) ) ( not ( = ?auto_77568 ?auto_77566 ) ) ( not ( = ?auto_77567 ?auto_77566 ) ) ( not ( = ?auto_77569 ?auto_77566 ) ) ( CLEAR ?auto_77564 ) ( ON ?auto_77563 ?auto_77562 ) ( CLEAR ?auto_77563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77566 ?auto_77562 )
      ( MAKE-4PILE ?auto_77562 ?auto_77563 ?auto_77564 ?auto_77565 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77570 - BLOCK
      ?auto_77571 - BLOCK
      ?auto_77572 - BLOCK
      ?auto_77573 - BLOCK
    )
    :vars
    (
      ?auto_77576 - BLOCK
      ?auto_77577 - BLOCK
      ?auto_77575 - BLOCK
      ?auto_77574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77570 ?auto_77571 ) ) ( not ( = ?auto_77570 ?auto_77572 ) ) ( not ( = ?auto_77570 ?auto_77573 ) ) ( not ( = ?auto_77571 ?auto_77572 ) ) ( not ( = ?auto_77571 ?auto_77573 ) ) ( not ( = ?auto_77572 ?auto_77573 ) ) ( ON ?auto_77573 ?auto_77576 ) ( not ( = ?auto_77570 ?auto_77576 ) ) ( not ( = ?auto_77571 ?auto_77576 ) ) ( not ( = ?auto_77572 ?auto_77576 ) ) ( not ( = ?auto_77573 ?auto_77576 ) ) ( ON-TABLE ?auto_77577 ) ( ON ?auto_77575 ?auto_77577 ) ( ON ?auto_77576 ?auto_77575 ) ( not ( = ?auto_77577 ?auto_77575 ) ) ( not ( = ?auto_77577 ?auto_77576 ) ) ( not ( = ?auto_77577 ?auto_77573 ) ) ( not ( = ?auto_77577 ?auto_77572 ) ) ( not ( = ?auto_77575 ?auto_77576 ) ) ( not ( = ?auto_77575 ?auto_77573 ) ) ( not ( = ?auto_77575 ?auto_77572 ) ) ( not ( = ?auto_77570 ?auto_77577 ) ) ( not ( = ?auto_77570 ?auto_77575 ) ) ( not ( = ?auto_77571 ?auto_77577 ) ) ( not ( = ?auto_77571 ?auto_77575 ) ) ( ON ?auto_77570 ?auto_77574 ) ( not ( = ?auto_77570 ?auto_77574 ) ) ( not ( = ?auto_77571 ?auto_77574 ) ) ( not ( = ?auto_77572 ?auto_77574 ) ) ( not ( = ?auto_77573 ?auto_77574 ) ) ( not ( = ?auto_77576 ?auto_77574 ) ) ( not ( = ?auto_77577 ?auto_77574 ) ) ( not ( = ?auto_77575 ?auto_77574 ) ) ( ON ?auto_77571 ?auto_77570 ) ( CLEAR ?auto_77571 ) ( ON-TABLE ?auto_77574 ) ( HOLDING ?auto_77572 ) ( CLEAR ?auto_77573 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77577 ?auto_77575 ?auto_77576 ?auto_77573 ?auto_77572 )
      ( MAKE-4PILE ?auto_77570 ?auto_77571 ?auto_77572 ?auto_77573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77578 - BLOCK
      ?auto_77579 - BLOCK
      ?auto_77580 - BLOCK
      ?auto_77581 - BLOCK
    )
    :vars
    (
      ?auto_77583 - BLOCK
      ?auto_77584 - BLOCK
      ?auto_77585 - BLOCK
      ?auto_77582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77578 ?auto_77579 ) ) ( not ( = ?auto_77578 ?auto_77580 ) ) ( not ( = ?auto_77578 ?auto_77581 ) ) ( not ( = ?auto_77579 ?auto_77580 ) ) ( not ( = ?auto_77579 ?auto_77581 ) ) ( not ( = ?auto_77580 ?auto_77581 ) ) ( ON ?auto_77581 ?auto_77583 ) ( not ( = ?auto_77578 ?auto_77583 ) ) ( not ( = ?auto_77579 ?auto_77583 ) ) ( not ( = ?auto_77580 ?auto_77583 ) ) ( not ( = ?auto_77581 ?auto_77583 ) ) ( ON-TABLE ?auto_77584 ) ( ON ?auto_77585 ?auto_77584 ) ( ON ?auto_77583 ?auto_77585 ) ( not ( = ?auto_77584 ?auto_77585 ) ) ( not ( = ?auto_77584 ?auto_77583 ) ) ( not ( = ?auto_77584 ?auto_77581 ) ) ( not ( = ?auto_77584 ?auto_77580 ) ) ( not ( = ?auto_77585 ?auto_77583 ) ) ( not ( = ?auto_77585 ?auto_77581 ) ) ( not ( = ?auto_77585 ?auto_77580 ) ) ( not ( = ?auto_77578 ?auto_77584 ) ) ( not ( = ?auto_77578 ?auto_77585 ) ) ( not ( = ?auto_77579 ?auto_77584 ) ) ( not ( = ?auto_77579 ?auto_77585 ) ) ( ON ?auto_77578 ?auto_77582 ) ( not ( = ?auto_77578 ?auto_77582 ) ) ( not ( = ?auto_77579 ?auto_77582 ) ) ( not ( = ?auto_77580 ?auto_77582 ) ) ( not ( = ?auto_77581 ?auto_77582 ) ) ( not ( = ?auto_77583 ?auto_77582 ) ) ( not ( = ?auto_77584 ?auto_77582 ) ) ( not ( = ?auto_77585 ?auto_77582 ) ) ( ON ?auto_77579 ?auto_77578 ) ( ON-TABLE ?auto_77582 ) ( CLEAR ?auto_77581 ) ( ON ?auto_77580 ?auto_77579 ) ( CLEAR ?auto_77580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77582 ?auto_77578 ?auto_77579 )
      ( MAKE-4PILE ?auto_77578 ?auto_77579 ?auto_77580 ?auto_77581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77586 - BLOCK
      ?auto_77587 - BLOCK
      ?auto_77588 - BLOCK
      ?auto_77589 - BLOCK
    )
    :vars
    (
      ?auto_77593 - BLOCK
      ?auto_77590 - BLOCK
      ?auto_77591 - BLOCK
      ?auto_77592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77586 ?auto_77587 ) ) ( not ( = ?auto_77586 ?auto_77588 ) ) ( not ( = ?auto_77586 ?auto_77589 ) ) ( not ( = ?auto_77587 ?auto_77588 ) ) ( not ( = ?auto_77587 ?auto_77589 ) ) ( not ( = ?auto_77588 ?auto_77589 ) ) ( not ( = ?auto_77586 ?auto_77593 ) ) ( not ( = ?auto_77587 ?auto_77593 ) ) ( not ( = ?auto_77588 ?auto_77593 ) ) ( not ( = ?auto_77589 ?auto_77593 ) ) ( ON-TABLE ?auto_77590 ) ( ON ?auto_77591 ?auto_77590 ) ( ON ?auto_77593 ?auto_77591 ) ( not ( = ?auto_77590 ?auto_77591 ) ) ( not ( = ?auto_77590 ?auto_77593 ) ) ( not ( = ?auto_77590 ?auto_77589 ) ) ( not ( = ?auto_77590 ?auto_77588 ) ) ( not ( = ?auto_77591 ?auto_77593 ) ) ( not ( = ?auto_77591 ?auto_77589 ) ) ( not ( = ?auto_77591 ?auto_77588 ) ) ( not ( = ?auto_77586 ?auto_77590 ) ) ( not ( = ?auto_77586 ?auto_77591 ) ) ( not ( = ?auto_77587 ?auto_77590 ) ) ( not ( = ?auto_77587 ?auto_77591 ) ) ( ON ?auto_77586 ?auto_77592 ) ( not ( = ?auto_77586 ?auto_77592 ) ) ( not ( = ?auto_77587 ?auto_77592 ) ) ( not ( = ?auto_77588 ?auto_77592 ) ) ( not ( = ?auto_77589 ?auto_77592 ) ) ( not ( = ?auto_77593 ?auto_77592 ) ) ( not ( = ?auto_77590 ?auto_77592 ) ) ( not ( = ?auto_77591 ?auto_77592 ) ) ( ON ?auto_77587 ?auto_77586 ) ( ON-TABLE ?auto_77592 ) ( ON ?auto_77588 ?auto_77587 ) ( CLEAR ?auto_77588 ) ( HOLDING ?auto_77589 ) ( CLEAR ?auto_77593 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77590 ?auto_77591 ?auto_77593 ?auto_77589 )
      ( MAKE-4PILE ?auto_77586 ?auto_77587 ?auto_77588 ?auto_77589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77594 - BLOCK
      ?auto_77595 - BLOCK
      ?auto_77596 - BLOCK
      ?auto_77597 - BLOCK
    )
    :vars
    (
      ?auto_77601 - BLOCK
      ?auto_77598 - BLOCK
      ?auto_77600 - BLOCK
      ?auto_77599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77594 ?auto_77595 ) ) ( not ( = ?auto_77594 ?auto_77596 ) ) ( not ( = ?auto_77594 ?auto_77597 ) ) ( not ( = ?auto_77595 ?auto_77596 ) ) ( not ( = ?auto_77595 ?auto_77597 ) ) ( not ( = ?auto_77596 ?auto_77597 ) ) ( not ( = ?auto_77594 ?auto_77601 ) ) ( not ( = ?auto_77595 ?auto_77601 ) ) ( not ( = ?auto_77596 ?auto_77601 ) ) ( not ( = ?auto_77597 ?auto_77601 ) ) ( ON-TABLE ?auto_77598 ) ( ON ?auto_77600 ?auto_77598 ) ( ON ?auto_77601 ?auto_77600 ) ( not ( = ?auto_77598 ?auto_77600 ) ) ( not ( = ?auto_77598 ?auto_77601 ) ) ( not ( = ?auto_77598 ?auto_77597 ) ) ( not ( = ?auto_77598 ?auto_77596 ) ) ( not ( = ?auto_77600 ?auto_77601 ) ) ( not ( = ?auto_77600 ?auto_77597 ) ) ( not ( = ?auto_77600 ?auto_77596 ) ) ( not ( = ?auto_77594 ?auto_77598 ) ) ( not ( = ?auto_77594 ?auto_77600 ) ) ( not ( = ?auto_77595 ?auto_77598 ) ) ( not ( = ?auto_77595 ?auto_77600 ) ) ( ON ?auto_77594 ?auto_77599 ) ( not ( = ?auto_77594 ?auto_77599 ) ) ( not ( = ?auto_77595 ?auto_77599 ) ) ( not ( = ?auto_77596 ?auto_77599 ) ) ( not ( = ?auto_77597 ?auto_77599 ) ) ( not ( = ?auto_77601 ?auto_77599 ) ) ( not ( = ?auto_77598 ?auto_77599 ) ) ( not ( = ?auto_77600 ?auto_77599 ) ) ( ON ?auto_77595 ?auto_77594 ) ( ON-TABLE ?auto_77599 ) ( ON ?auto_77596 ?auto_77595 ) ( CLEAR ?auto_77601 ) ( ON ?auto_77597 ?auto_77596 ) ( CLEAR ?auto_77597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77599 ?auto_77594 ?auto_77595 ?auto_77596 )
      ( MAKE-4PILE ?auto_77594 ?auto_77595 ?auto_77596 ?auto_77597 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77602 - BLOCK
      ?auto_77603 - BLOCK
      ?auto_77604 - BLOCK
      ?auto_77605 - BLOCK
    )
    :vars
    (
      ?auto_77609 - BLOCK
      ?auto_77608 - BLOCK
      ?auto_77606 - BLOCK
      ?auto_77607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77602 ?auto_77603 ) ) ( not ( = ?auto_77602 ?auto_77604 ) ) ( not ( = ?auto_77602 ?auto_77605 ) ) ( not ( = ?auto_77603 ?auto_77604 ) ) ( not ( = ?auto_77603 ?auto_77605 ) ) ( not ( = ?auto_77604 ?auto_77605 ) ) ( not ( = ?auto_77602 ?auto_77609 ) ) ( not ( = ?auto_77603 ?auto_77609 ) ) ( not ( = ?auto_77604 ?auto_77609 ) ) ( not ( = ?auto_77605 ?auto_77609 ) ) ( ON-TABLE ?auto_77608 ) ( ON ?auto_77606 ?auto_77608 ) ( not ( = ?auto_77608 ?auto_77606 ) ) ( not ( = ?auto_77608 ?auto_77609 ) ) ( not ( = ?auto_77608 ?auto_77605 ) ) ( not ( = ?auto_77608 ?auto_77604 ) ) ( not ( = ?auto_77606 ?auto_77609 ) ) ( not ( = ?auto_77606 ?auto_77605 ) ) ( not ( = ?auto_77606 ?auto_77604 ) ) ( not ( = ?auto_77602 ?auto_77608 ) ) ( not ( = ?auto_77602 ?auto_77606 ) ) ( not ( = ?auto_77603 ?auto_77608 ) ) ( not ( = ?auto_77603 ?auto_77606 ) ) ( ON ?auto_77602 ?auto_77607 ) ( not ( = ?auto_77602 ?auto_77607 ) ) ( not ( = ?auto_77603 ?auto_77607 ) ) ( not ( = ?auto_77604 ?auto_77607 ) ) ( not ( = ?auto_77605 ?auto_77607 ) ) ( not ( = ?auto_77609 ?auto_77607 ) ) ( not ( = ?auto_77608 ?auto_77607 ) ) ( not ( = ?auto_77606 ?auto_77607 ) ) ( ON ?auto_77603 ?auto_77602 ) ( ON-TABLE ?auto_77607 ) ( ON ?auto_77604 ?auto_77603 ) ( ON ?auto_77605 ?auto_77604 ) ( CLEAR ?auto_77605 ) ( HOLDING ?auto_77609 ) ( CLEAR ?auto_77606 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77608 ?auto_77606 ?auto_77609 )
      ( MAKE-4PILE ?auto_77602 ?auto_77603 ?auto_77604 ?auto_77605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77610 - BLOCK
      ?auto_77611 - BLOCK
      ?auto_77612 - BLOCK
      ?auto_77613 - BLOCK
    )
    :vars
    (
      ?auto_77615 - BLOCK
      ?auto_77616 - BLOCK
      ?auto_77614 - BLOCK
      ?auto_77617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77610 ?auto_77611 ) ) ( not ( = ?auto_77610 ?auto_77612 ) ) ( not ( = ?auto_77610 ?auto_77613 ) ) ( not ( = ?auto_77611 ?auto_77612 ) ) ( not ( = ?auto_77611 ?auto_77613 ) ) ( not ( = ?auto_77612 ?auto_77613 ) ) ( not ( = ?auto_77610 ?auto_77615 ) ) ( not ( = ?auto_77611 ?auto_77615 ) ) ( not ( = ?auto_77612 ?auto_77615 ) ) ( not ( = ?auto_77613 ?auto_77615 ) ) ( ON-TABLE ?auto_77616 ) ( ON ?auto_77614 ?auto_77616 ) ( not ( = ?auto_77616 ?auto_77614 ) ) ( not ( = ?auto_77616 ?auto_77615 ) ) ( not ( = ?auto_77616 ?auto_77613 ) ) ( not ( = ?auto_77616 ?auto_77612 ) ) ( not ( = ?auto_77614 ?auto_77615 ) ) ( not ( = ?auto_77614 ?auto_77613 ) ) ( not ( = ?auto_77614 ?auto_77612 ) ) ( not ( = ?auto_77610 ?auto_77616 ) ) ( not ( = ?auto_77610 ?auto_77614 ) ) ( not ( = ?auto_77611 ?auto_77616 ) ) ( not ( = ?auto_77611 ?auto_77614 ) ) ( ON ?auto_77610 ?auto_77617 ) ( not ( = ?auto_77610 ?auto_77617 ) ) ( not ( = ?auto_77611 ?auto_77617 ) ) ( not ( = ?auto_77612 ?auto_77617 ) ) ( not ( = ?auto_77613 ?auto_77617 ) ) ( not ( = ?auto_77615 ?auto_77617 ) ) ( not ( = ?auto_77616 ?auto_77617 ) ) ( not ( = ?auto_77614 ?auto_77617 ) ) ( ON ?auto_77611 ?auto_77610 ) ( ON-TABLE ?auto_77617 ) ( ON ?auto_77612 ?auto_77611 ) ( ON ?auto_77613 ?auto_77612 ) ( CLEAR ?auto_77614 ) ( ON ?auto_77615 ?auto_77613 ) ( CLEAR ?auto_77615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77617 ?auto_77610 ?auto_77611 ?auto_77612 ?auto_77613 )
      ( MAKE-4PILE ?auto_77610 ?auto_77611 ?auto_77612 ?auto_77613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77618 - BLOCK
      ?auto_77619 - BLOCK
      ?auto_77620 - BLOCK
      ?auto_77621 - BLOCK
    )
    :vars
    (
      ?auto_77625 - BLOCK
      ?auto_77624 - BLOCK
      ?auto_77622 - BLOCK
      ?auto_77623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77618 ?auto_77619 ) ) ( not ( = ?auto_77618 ?auto_77620 ) ) ( not ( = ?auto_77618 ?auto_77621 ) ) ( not ( = ?auto_77619 ?auto_77620 ) ) ( not ( = ?auto_77619 ?auto_77621 ) ) ( not ( = ?auto_77620 ?auto_77621 ) ) ( not ( = ?auto_77618 ?auto_77625 ) ) ( not ( = ?auto_77619 ?auto_77625 ) ) ( not ( = ?auto_77620 ?auto_77625 ) ) ( not ( = ?auto_77621 ?auto_77625 ) ) ( ON-TABLE ?auto_77624 ) ( not ( = ?auto_77624 ?auto_77622 ) ) ( not ( = ?auto_77624 ?auto_77625 ) ) ( not ( = ?auto_77624 ?auto_77621 ) ) ( not ( = ?auto_77624 ?auto_77620 ) ) ( not ( = ?auto_77622 ?auto_77625 ) ) ( not ( = ?auto_77622 ?auto_77621 ) ) ( not ( = ?auto_77622 ?auto_77620 ) ) ( not ( = ?auto_77618 ?auto_77624 ) ) ( not ( = ?auto_77618 ?auto_77622 ) ) ( not ( = ?auto_77619 ?auto_77624 ) ) ( not ( = ?auto_77619 ?auto_77622 ) ) ( ON ?auto_77618 ?auto_77623 ) ( not ( = ?auto_77618 ?auto_77623 ) ) ( not ( = ?auto_77619 ?auto_77623 ) ) ( not ( = ?auto_77620 ?auto_77623 ) ) ( not ( = ?auto_77621 ?auto_77623 ) ) ( not ( = ?auto_77625 ?auto_77623 ) ) ( not ( = ?auto_77624 ?auto_77623 ) ) ( not ( = ?auto_77622 ?auto_77623 ) ) ( ON ?auto_77619 ?auto_77618 ) ( ON-TABLE ?auto_77623 ) ( ON ?auto_77620 ?auto_77619 ) ( ON ?auto_77621 ?auto_77620 ) ( ON ?auto_77625 ?auto_77621 ) ( CLEAR ?auto_77625 ) ( HOLDING ?auto_77622 ) ( CLEAR ?auto_77624 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77624 ?auto_77622 )
      ( MAKE-4PILE ?auto_77618 ?auto_77619 ?auto_77620 ?auto_77621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77626 - BLOCK
      ?auto_77627 - BLOCK
      ?auto_77628 - BLOCK
      ?auto_77629 - BLOCK
    )
    :vars
    (
      ?auto_77631 - BLOCK
      ?auto_77633 - BLOCK
      ?auto_77632 - BLOCK
      ?auto_77630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77626 ?auto_77627 ) ) ( not ( = ?auto_77626 ?auto_77628 ) ) ( not ( = ?auto_77626 ?auto_77629 ) ) ( not ( = ?auto_77627 ?auto_77628 ) ) ( not ( = ?auto_77627 ?auto_77629 ) ) ( not ( = ?auto_77628 ?auto_77629 ) ) ( not ( = ?auto_77626 ?auto_77631 ) ) ( not ( = ?auto_77627 ?auto_77631 ) ) ( not ( = ?auto_77628 ?auto_77631 ) ) ( not ( = ?auto_77629 ?auto_77631 ) ) ( ON-TABLE ?auto_77633 ) ( not ( = ?auto_77633 ?auto_77632 ) ) ( not ( = ?auto_77633 ?auto_77631 ) ) ( not ( = ?auto_77633 ?auto_77629 ) ) ( not ( = ?auto_77633 ?auto_77628 ) ) ( not ( = ?auto_77632 ?auto_77631 ) ) ( not ( = ?auto_77632 ?auto_77629 ) ) ( not ( = ?auto_77632 ?auto_77628 ) ) ( not ( = ?auto_77626 ?auto_77633 ) ) ( not ( = ?auto_77626 ?auto_77632 ) ) ( not ( = ?auto_77627 ?auto_77633 ) ) ( not ( = ?auto_77627 ?auto_77632 ) ) ( ON ?auto_77626 ?auto_77630 ) ( not ( = ?auto_77626 ?auto_77630 ) ) ( not ( = ?auto_77627 ?auto_77630 ) ) ( not ( = ?auto_77628 ?auto_77630 ) ) ( not ( = ?auto_77629 ?auto_77630 ) ) ( not ( = ?auto_77631 ?auto_77630 ) ) ( not ( = ?auto_77633 ?auto_77630 ) ) ( not ( = ?auto_77632 ?auto_77630 ) ) ( ON ?auto_77627 ?auto_77626 ) ( ON-TABLE ?auto_77630 ) ( ON ?auto_77628 ?auto_77627 ) ( ON ?auto_77629 ?auto_77628 ) ( ON ?auto_77631 ?auto_77629 ) ( CLEAR ?auto_77633 ) ( ON ?auto_77632 ?auto_77631 ) ( CLEAR ?auto_77632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77630 ?auto_77626 ?auto_77627 ?auto_77628 ?auto_77629 ?auto_77631 )
      ( MAKE-4PILE ?auto_77626 ?auto_77627 ?auto_77628 ?auto_77629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77634 - BLOCK
      ?auto_77635 - BLOCK
      ?auto_77636 - BLOCK
      ?auto_77637 - BLOCK
    )
    :vars
    (
      ?auto_77639 - BLOCK
      ?auto_77638 - BLOCK
      ?auto_77640 - BLOCK
      ?auto_77641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77634 ?auto_77635 ) ) ( not ( = ?auto_77634 ?auto_77636 ) ) ( not ( = ?auto_77634 ?auto_77637 ) ) ( not ( = ?auto_77635 ?auto_77636 ) ) ( not ( = ?auto_77635 ?auto_77637 ) ) ( not ( = ?auto_77636 ?auto_77637 ) ) ( not ( = ?auto_77634 ?auto_77639 ) ) ( not ( = ?auto_77635 ?auto_77639 ) ) ( not ( = ?auto_77636 ?auto_77639 ) ) ( not ( = ?auto_77637 ?auto_77639 ) ) ( not ( = ?auto_77638 ?auto_77640 ) ) ( not ( = ?auto_77638 ?auto_77639 ) ) ( not ( = ?auto_77638 ?auto_77637 ) ) ( not ( = ?auto_77638 ?auto_77636 ) ) ( not ( = ?auto_77640 ?auto_77639 ) ) ( not ( = ?auto_77640 ?auto_77637 ) ) ( not ( = ?auto_77640 ?auto_77636 ) ) ( not ( = ?auto_77634 ?auto_77638 ) ) ( not ( = ?auto_77634 ?auto_77640 ) ) ( not ( = ?auto_77635 ?auto_77638 ) ) ( not ( = ?auto_77635 ?auto_77640 ) ) ( ON ?auto_77634 ?auto_77641 ) ( not ( = ?auto_77634 ?auto_77641 ) ) ( not ( = ?auto_77635 ?auto_77641 ) ) ( not ( = ?auto_77636 ?auto_77641 ) ) ( not ( = ?auto_77637 ?auto_77641 ) ) ( not ( = ?auto_77639 ?auto_77641 ) ) ( not ( = ?auto_77638 ?auto_77641 ) ) ( not ( = ?auto_77640 ?auto_77641 ) ) ( ON ?auto_77635 ?auto_77634 ) ( ON-TABLE ?auto_77641 ) ( ON ?auto_77636 ?auto_77635 ) ( ON ?auto_77637 ?auto_77636 ) ( ON ?auto_77639 ?auto_77637 ) ( ON ?auto_77640 ?auto_77639 ) ( CLEAR ?auto_77640 ) ( HOLDING ?auto_77638 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77638 )
      ( MAKE-4PILE ?auto_77634 ?auto_77635 ?auto_77636 ?auto_77637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_77642 - BLOCK
      ?auto_77643 - BLOCK
      ?auto_77644 - BLOCK
      ?auto_77645 - BLOCK
    )
    :vars
    (
      ?auto_77646 - BLOCK
      ?auto_77649 - BLOCK
      ?auto_77648 - BLOCK
      ?auto_77647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77642 ?auto_77643 ) ) ( not ( = ?auto_77642 ?auto_77644 ) ) ( not ( = ?auto_77642 ?auto_77645 ) ) ( not ( = ?auto_77643 ?auto_77644 ) ) ( not ( = ?auto_77643 ?auto_77645 ) ) ( not ( = ?auto_77644 ?auto_77645 ) ) ( not ( = ?auto_77642 ?auto_77646 ) ) ( not ( = ?auto_77643 ?auto_77646 ) ) ( not ( = ?auto_77644 ?auto_77646 ) ) ( not ( = ?auto_77645 ?auto_77646 ) ) ( not ( = ?auto_77649 ?auto_77648 ) ) ( not ( = ?auto_77649 ?auto_77646 ) ) ( not ( = ?auto_77649 ?auto_77645 ) ) ( not ( = ?auto_77649 ?auto_77644 ) ) ( not ( = ?auto_77648 ?auto_77646 ) ) ( not ( = ?auto_77648 ?auto_77645 ) ) ( not ( = ?auto_77648 ?auto_77644 ) ) ( not ( = ?auto_77642 ?auto_77649 ) ) ( not ( = ?auto_77642 ?auto_77648 ) ) ( not ( = ?auto_77643 ?auto_77649 ) ) ( not ( = ?auto_77643 ?auto_77648 ) ) ( ON ?auto_77642 ?auto_77647 ) ( not ( = ?auto_77642 ?auto_77647 ) ) ( not ( = ?auto_77643 ?auto_77647 ) ) ( not ( = ?auto_77644 ?auto_77647 ) ) ( not ( = ?auto_77645 ?auto_77647 ) ) ( not ( = ?auto_77646 ?auto_77647 ) ) ( not ( = ?auto_77649 ?auto_77647 ) ) ( not ( = ?auto_77648 ?auto_77647 ) ) ( ON ?auto_77643 ?auto_77642 ) ( ON-TABLE ?auto_77647 ) ( ON ?auto_77644 ?auto_77643 ) ( ON ?auto_77645 ?auto_77644 ) ( ON ?auto_77646 ?auto_77645 ) ( ON ?auto_77648 ?auto_77646 ) ( ON ?auto_77649 ?auto_77648 ) ( CLEAR ?auto_77649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77647 ?auto_77642 ?auto_77643 ?auto_77644 ?auto_77645 ?auto_77646 ?auto_77648 )
      ( MAKE-4PILE ?auto_77642 ?auto_77643 ?auto_77644 ?auto_77645 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77652 - BLOCK
      ?auto_77653 - BLOCK
    )
    :vars
    (
      ?auto_77654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77654 ?auto_77653 ) ( CLEAR ?auto_77654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77652 ) ( ON ?auto_77653 ?auto_77652 ) ( not ( = ?auto_77652 ?auto_77653 ) ) ( not ( = ?auto_77652 ?auto_77654 ) ) ( not ( = ?auto_77653 ?auto_77654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77654 ?auto_77653 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77655 - BLOCK
      ?auto_77656 - BLOCK
    )
    :vars
    (
      ?auto_77657 - BLOCK
      ?auto_77658 - BLOCK
      ?auto_77659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77657 ?auto_77656 ) ( CLEAR ?auto_77657 ) ( ON-TABLE ?auto_77655 ) ( ON ?auto_77656 ?auto_77655 ) ( not ( = ?auto_77655 ?auto_77656 ) ) ( not ( = ?auto_77655 ?auto_77657 ) ) ( not ( = ?auto_77656 ?auto_77657 ) ) ( HOLDING ?auto_77658 ) ( CLEAR ?auto_77659 ) ( not ( = ?auto_77655 ?auto_77658 ) ) ( not ( = ?auto_77655 ?auto_77659 ) ) ( not ( = ?auto_77656 ?auto_77658 ) ) ( not ( = ?auto_77656 ?auto_77659 ) ) ( not ( = ?auto_77657 ?auto_77658 ) ) ( not ( = ?auto_77657 ?auto_77659 ) ) ( not ( = ?auto_77658 ?auto_77659 ) ) )
    :subtasks
    ( ( !STACK ?auto_77658 ?auto_77659 )
      ( MAKE-2PILE ?auto_77655 ?auto_77656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77660 - BLOCK
      ?auto_77661 - BLOCK
    )
    :vars
    (
      ?auto_77664 - BLOCK
      ?auto_77662 - BLOCK
      ?auto_77663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77664 ?auto_77661 ) ( ON-TABLE ?auto_77660 ) ( ON ?auto_77661 ?auto_77660 ) ( not ( = ?auto_77660 ?auto_77661 ) ) ( not ( = ?auto_77660 ?auto_77664 ) ) ( not ( = ?auto_77661 ?auto_77664 ) ) ( CLEAR ?auto_77662 ) ( not ( = ?auto_77660 ?auto_77663 ) ) ( not ( = ?auto_77660 ?auto_77662 ) ) ( not ( = ?auto_77661 ?auto_77663 ) ) ( not ( = ?auto_77661 ?auto_77662 ) ) ( not ( = ?auto_77664 ?auto_77663 ) ) ( not ( = ?auto_77664 ?auto_77662 ) ) ( not ( = ?auto_77663 ?auto_77662 ) ) ( ON ?auto_77663 ?auto_77664 ) ( CLEAR ?auto_77663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77660 ?auto_77661 ?auto_77664 )
      ( MAKE-2PILE ?auto_77660 ?auto_77661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77665 - BLOCK
      ?auto_77666 - BLOCK
    )
    :vars
    (
      ?auto_77667 - BLOCK
      ?auto_77669 - BLOCK
      ?auto_77668 - BLOCK
      ?auto_77670 - BLOCK
      ?auto_77671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77667 ?auto_77666 ) ( ON-TABLE ?auto_77665 ) ( ON ?auto_77666 ?auto_77665 ) ( not ( = ?auto_77665 ?auto_77666 ) ) ( not ( = ?auto_77665 ?auto_77667 ) ) ( not ( = ?auto_77666 ?auto_77667 ) ) ( not ( = ?auto_77665 ?auto_77669 ) ) ( not ( = ?auto_77665 ?auto_77668 ) ) ( not ( = ?auto_77666 ?auto_77669 ) ) ( not ( = ?auto_77666 ?auto_77668 ) ) ( not ( = ?auto_77667 ?auto_77669 ) ) ( not ( = ?auto_77667 ?auto_77668 ) ) ( not ( = ?auto_77669 ?auto_77668 ) ) ( ON ?auto_77669 ?auto_77667 ) ( CLEAR ?auto_77669 ) ( HOLDING ?auto_77668 ) ( CLEAR ?auto_77670 ) ( ON-TABLE ?auto_77671 ) ( ON ?auto_77670 ?auto_77671 ) ( not ( = ?auto_77671 ?auto_77670 ) ) ( not ( = ?auto_77671 ?auto_77668 ) ) ( not ( = ?auto_77670 ?auto_77668 ) ) ( not ( = ?auto_77665 ?auto_77670 ) ) ( not ( = ?auto_77665 ?auto_77671 ) ) ( not ( = ?auto_77666 ?auto_77670 ) ) ( not ( = ?auto_77666 ?auto_77671 ) ) ( not ( = ?auto_77667 ?auto_77670 ) ) ( not ( = ?auto_77667 ?auto_77671 ) ) ( not ( = ?auto_77669 ?auto_77670 ) ) ( not ( = ?auto_77669 ?auto_77671 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77671 ?auto_77670 ?auto_77668 )
      ( MAKE-2PILE ?auto_77665 ?auto_77666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77672 - BLOCK
      ?auto_77673 - BLOCK
    )
    :vars
    (
      ?auto_77675 - BLOCK
      ?auto_77677 - BLOCK
      ?auto_77676 - BLOCK
      ?auto_77678 - BLOCK
      ?auto_77674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77675 ?auto_77673 ) ( ON-TABLE ?auto_77672 ) ( ON ?auto_77673 ?auto_77672 ) ( not ( = ?auto_77672 ?auto_77673 ) ) ( not ( = ?auto_77672 ?auto_77675 ) ) ( not ( = ?auto_77673 ?auto_77675 ) ) ( not ( = ?auto_77672 ?auto_77677 ) ) ( not ( = ?auto_77672 ?auto_77676 ) ) ( not ( = ?auto_77673 ?auto_77677 ) ) ( not ( = ?auto_77673 ?auto_77676 ) ) ( not ( = ?auto_77675 ?auto_77677 ) ) ( not ( = ?auto_77675 ?auto_77676 ) ) ( not ( = ?auto_77677 ?auto_77676 ) ) ( ON ?auto_77677 ?auto_77675 ) ( CLEAR ?auto_77678 ) ( ON-TABLE ?auto_77674 ) ( ON ?auto_77678 ?auto_77674 ) ( not ( = ?auto_77674 ?auto_77678 ) ) ( not ( = ?auto_77674 ?auto_77676 ) ) ( not ( = ?auto_77678 ?auto_77676 ) ) ( not ( = ?auto_77672 ?auto_77678 ) ) ( not ( = ?auto_77672 ?auto_77674 ) ) ( not ( = ?auto_77673 ?auto_77678 ) ) ( not ( = ?auto_77673 ?auto_77674 ) ) ( not ( = ?auto_77675 ?auto_77678 ) ) ( not ( = ?auto_77675 ?auto_77674 ) ) ( not ( = ?auto_77677 ?auto_77678 ) ) ( not ( = ?auto_77677 ?auto_77674 ) ) ( ON ?auto_77676 ?auto_77677 ) ( CLEAR ?auto_77676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77672 ?auto_77673 ?auto_77675 ?auto_77677 )
      ( MAKE-2PILE ?auto_77672 ?auto_77673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77679 - BLOCK
      ?auto_77680 - BLOCK
    )
    :vars
    (
      ?auto_77682 - BLOCK
      ?auto_77685 - BLOCK
      ?auto_77683 - BLOCK
      ?auto_77681 - BLOCK
      ?auto_77684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77682 ?auto_77680 ) ( ON-TABLE ?auto_77679 ) ( ON ?auto_77680 ?auto_77679 ) ( not ( = ?auto_77679 ?auto_77680 ) ) ( not ( = ?auto_77679 ?auto_77682 ) ) ( not ( = ?auto_77680 ?auto_77682 ) ) ( not ( = ?auto_77679 ?auto_77685 ) ) ( not ( = ?auto_77679 ?auto_77683 ) ) ( not ( = ?auto_77680 ?auto_77685 ) ) ( not ( = ?auto_77680 ?auto_77683 ) ) ( not ( = ?auto_77682 ?auto_77685 ) ) ( not ( = ?auto_77682 ?auto_77683 ) ) ( not ( = ?auto_77685 ?auto_77683 ) ) ( ON ?auto_77685 ?auto_77682 ) ( ON-TABLE ?auto_77681 ) ( not ( = ?auto_77681 ?auto_77684 ) ) ( not ( = ?auto_77681 ?auto_77683 ) ) ( not ( = ?auto_77684 ?auto_77683 ) ) ( not ( = ?auto_77679 ?auto_77684 ) ) ( not ( = ?auto_77679 ?auto_77681 ) ) ( not ( = ?auto_77680 ?auto_77684 ) ) ( not ( = ?auto_77680 ?auto_77681 ) ) ( not ( = ?auto_77682 ?auto_77684 ) ) ( not ( = ?auto_77682 ?auto_77681 ) ) ( not ( = ?auto_77685 ?auto_77684 ) ) ( not ( = ?auto_77685 ?auto_77681 ) ) ( ON ?auto_77683 ?auto_77685 ) ( CLEAR ?auto_77683 ) ( HOLDING ?auto_77684 ) ( CLEAR ?auto_77681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77681 ?auto_77684 )
      ( MAKE-2PILE ?auto_77679 ?auto_77680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77686 - BLOCK
      ?auto_77687 - BLOCK
    )
    :vars
    (
      ?auto_77691 - BLOCK
      ?auto_77692 - BLOCK
      ?auto_77688 - BLOCK
      ?auto_77689 - BLOCK
      ?auto_77690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77691 ?auto_77687 ) ( ON-TABLE ?auto_77686 ) ( ON ?auto_77687 ?auto_77686 ) ( not ( = ?auto_77686 ?auto_77687 ) ) ( not ( = ?auto_77686 ?auto_77691 ) ) ( not ( = ?auto_77687 ?auto_77691 ) ) ( not ( = ?auto_77686 ?auto_77692 ) ) ( not ( = ?auto_77686 ?auto_77688 ) ) ( not ( = ?auto_77687 ?auto_77692 ) ) ( not ( = ?auto_77687 ?auto_77688 ) ) ( not ( = ?auto_77691 ?auto_77692 ) ) ( not ( = ?auto_77691 ?auto_77688 ) ) ( not ( = ?auto_77692 ?auto_77688 ) ) ( ON ?auto_77692 ?auto_77691 ) ( ON-TABLE ?auto_77689 ) ( not ( = ?auto_77689 ?auto_77690 ) ) ( not ( = ?auto_77689 ?auto_77688 ) ) ( not ( = ?auto_77690 ?auto_77688 ) ) ( not ( = ?auto_77686 ?auto_77690 ) ) ( not ( = ?auto_77686 ?auto_77689 ) ) ( not ( = ?auto_77687 ?auto_77690 ) ) ( not ( = ?auto_77687 ?auto_77689 ) ) ( not ( = ?auto_77691 ?auto_77690 ) ) ( not ( = ?auto_77691 ?auto_77689 ) ) ( not ( = ?auto_77692 ?auto_77690 ) ) ( not ( = ?auto_77692 ?auto_77689 ) ) ( ON ?auto_77688 ?auto_77692 ) ( CLEAR ?auto_77689 ) ( ON ?auto_77690 ?auto_77688 ) ( CLEAR ?auto_77690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77686 ?auto_77687 ?auto_77691 ?auto_77692 ?auto_77688 )
      ( MAKE-2PILE ?auto_77686 ?auto_77687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77693 - BLOCK
      ?auto_77694 - BLOCK
    )
    :vars
    (
      ?auto_77699 - BLOCK
      ?auto_77695 - BLOCK
      ?auto_77698 - BLOCK
      ?auto_77697 - BLOCK
      ?auto_77696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77699 ?auto_77694 ) ( ON-TABLE ?auto_77693 ) ( ON ?auto_77694 ?auto_77693 ) ( not ( = ?auto_77693 ?auto_77694 ) ) ( not ( = ?auto_77693 ?auto_77699 ) ) ( not ( = ?auto_77694 ?auto_77699 ) ) ( not ( = ?auto_77693 ?auto_77695 ) ) ( not ( = ?auto_77693 ?auto_77698 ) ) ( not ( = ?auto_77694 ?auto_77695 ) ) ( not ( = ?auto_77694 ?auto_77698 ) ) ( not ( = ?auto_77699 ?auto_77695 ) ) ( not ( = ?auto_77699 ?auto_77698 ) ) ( not ( = ?auto_77695 ?auto_77698 ) ) ( ON ?auto_77695 ?auto_77699 ) ( not ( = ?auto_77697 ?auto_77696 ) ) ( not ( = ?auto_77697 ?auto_77698 ) ) ( not ( = ?auto_77696 ?auto_77698 ) ) ( not ( = ?auto_77693 ?auto_77696 ) ) ( not ( = ?auto_77693 ?auto_77697 ) ) ( not ( = ?auto_77694 ?auto_77696 ) ) ( not ( = ?auto_77694 ?auto_77697 ) ) ( not ( = ?auto_77699 ?auto_77696 ) ) ( not ( = ?auto_77699 ?auto_77697 ) ) ( not ( = ?auto_77695 ?auto_77696 ) ) ( not ( = ?auto_77695 ?auto_77697 ) ) ( ON ?auto_77698 ?auto_77695 ) ( ON ?auto_77696 ?auto_77698 ) ( CLEAR ?auto_77696 ) ( HOLDING ?auto_77697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77697 )
      ( MAKE-2PILE ?auto_77693 ?auto_77694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77700 - BLOCK
      ?auto_77701 - BLOCK
    )
    :vars
    (
      ?auto_77703 - BLOCK
      ?auto_77704 - BLOCK
      ?auto_77702 - BLOCK
      ?auto_77706 - BLOCK
      ?auto_77705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77703 ?auto_77701 ) ( ON-TABLE ?auto_77700 ) ( ON ?auto_77701 ?auto_77700 ) ( not ( = ?auto_77700 ?auto_77701 ) ) ( not ( = ?auto_77700 ?auto_77703 ) ) ( not ( = ?auto_77701 ?auto_77703 ) ) ( not ( = ?auto_77700 ?auto_77704 ) ) ( not ( = ?auto_77700 ?auto_77702 ) ) ( not ( = ?auto_77701 ?auto_77704 ) ) ( not ( = ?auto_77701 ?auto_77702 ) ) ( not ( = ?auto_77703 ?auto_77704 ) ) ( not ( = ?auto_77703 ?auto_77702 ) ) ( not ( = ?auto_77704 ?auto_77702 ) ) ( ON ?auto_77704 ?auto_77703 ) ( not ( = ?auto_77706 ?auto_77705 ) ) ( not ( = ?auto_77706 ?auto_77702 ) ) ( not ( = ?auto_77705 ?auto_77702 ) ) ( not ( = ?auto_77700 ?auto_77705 ) ) ( not ( = ?auto_77700 ?auto_77706 ) ) ( not ( = ?auto_77701 ?auto_77705 ) ) ( not ( = ?auto_77701 ?auto_77706 ) ) ( not ( = ?auto_77703 ?auto_77705 ) ) ( not ( = ?auto_77703 ?auto_77706 ) ) ( not ( = ?auto_77704 ?auto_77705 ) ) ( not ( = ?auto_77704 ?auto_77706 ) ) ( ON ?auto_77702 ?auto_77704 ) ( ON ?auto_77705 ?auto_77702 ) ( ON ?auto_77706 ?auto_77705 ) ( CLEAR ?auto_77706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77700 ?auto_77701 ?auto_77703 ?auto_77704 ?auto_77702 ?auto_77705 )
      ( MAKE-2PILE ?auto_77700 ?auto_77701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77707 - BLOCK
      ?auto_77708 - BLOCK
    )
    :vars
    (
      ?auto_77713 - BLOCK
      ?auto_77709 - BLOCK
      ?auto_77712 - BLOCK
      ?auto_77710 - BLOCK
      ?auto_77711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77713 ?auto_77708 ) ( ON-TABLE ?auto_77707 ) ( ON ?auto_77708 ?auto_77707 ) ( not ( = ?auto_77707 ?auto_77708 ) ) ( not ( = ?auto_77707 ?auto_77713 ) ) ( not ( = ?auto_77708 ?auto_77713 ) ) ( not ( = ?auto_77707 ?auto_77709 ) ) ( not ( = ?auto_77707 ?auto_77712 ) ) ( not ( = ?auto_77708 ?auto_77709 ) ) ( not ( = ?auto_77708 ?auto_77712 ) ) ( not ( = ?auto_77713 ?auto_77709 ) ) ( not ( = ?auto_77713 ?auto_77712 ) ) ( not ( = ?auto_77709 ?auto_77712 ) ) ( ON ?auto_77709 ?auto_77713 ) ( not ( = ?auto_77710 ?auto_77711 ) ) ( not ( = ?auto_77710 ?auto_77712 ) ) ( not ( = ?auto_77711 ?auto_77712 ) ) ( not ( = ?auto_77707 ?auto_77711 ) ) ( not ( = ?auto_77707 ?auto_77710 ) ) ( not ( = ?auto_77708 ?auto_77711 ) ) ( not ( = ?auto_77708 ?auto_77710 ) ) ( not ( = ?auto_77713 ?auto_77711 ) ) ( not ( = ?auto_77713 ?auto_77710 ) ) ( not ( = ?auto_77709 ?auto_77711 ) ) ( not ( = ?auto_77709 ?auto_77710 ) ) ( ON ?auto_77712 ?auto_77709 ) ( ON ?auto_77711 ?auto_77712 ) ( HOLDING ?auto_77710 ) ( CLEAR ?auto_77711 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77707 ?auto_77708 ?auto_77713 ?auto_77709 ?auto_77712 ?auto_77711 ?auto_77710 )
      ( MAKE-2PILE ?auto_77707 ?auto_77708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77714 - BLOCK
      ?auto_77715 - BLOCK
    )
    :vars
    (
      ?auto_77717 - BLOCK
      ?auto_77716 - BLOCK
      ?auto_77718 - BLOCK
      ?auto_77719 - BLOCK
      ?auto_77720 - BLOCK
      ?auto_77721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77717 ?auto_77715 ) ( ON-TABLE ?auto_77714 ) ( ON ?auto_77715 ?auto_77714 ) ( not ( = ?auto_77714 ?auto_77715 ) ) ( not ( = ?auto_77714 ?auto_77717 ) ) ( not ( = ?auto_77715 ?auto_77717 ) ) ( not ( = ?auto_77714 ?auto_77716 ) ) ( not ( = ?auto_77714 ?auto_77718 ) ) ( not ( = ?auto_77715 ?auto_77716 ) ) ( not ( = ?auto_77715 ?auto_77718 ) ) ( not ( = ?auto_77717 ?auto_77716 ) ) ( not ( = ?auto_77717 ?auto_77718 ) ) ( not ( = ?auto_77716 ?auto_77718 ) ) ( ON ?auto_77716 ?auto_77717 ) ( not ( = ?auto_77719 ?auto_77720 ) ) ( not ( = ?auto_77719 ?auto_77718 ) ) ( not ( = ?auto_77720 ?auto_77718 ) ) ( not ( = ?auto_77714 ?auto_77720 ) ) ( not ( = ?auto_77714 ?auto_77719 ) ) ( not ( = ?auto_77715 ?auto_77720 ) ) ( not ( = ?auto_77715 ?auto_77719 ) ) ( not ( = ?auto_77717 ?auto_77720 ) ) ( not ( = ?auto_77717 ?auto_77719 ) ) ( not ( = ?auto_77716 ?auto_77720 ) ) ( not ( = ?auto_77716 ?auto_77719 ) ) ( ON ?auto_77718 ?auto_77716 ) ( ON ?auto_77720 ?auto_77718 ) ( CLEAR ?auto_77720 ) ( ON ?auto_77719 ?auto_77721 ) ( CLEAR ?auto_77719 ) ( HAND-EMPTY ) ( not ( = ?auto_77714 ?auto_77721 ) ) ( not ( = ?auto_77715 ?auto_77721 ) ) ( not ( = ?auto_77717 ?auto_77721 ) ) ( not ( = ?auto_77716 ?auto_77721 ) ) ( not ( = ?auto_77718 ?auto_77721 ) ) ( not ( = ?auto_77719 ?auto_77721 ) ) ( not ( = ?auto_77720 ?auto_77721 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77719 ?auto_77721 )
      ( MAKE-2PILE ?auto_77714 ?auto_77715 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77722 - BLOCK
      ?auto_77723 - BLOCK
    )
    :vars
    (
      ?auto_77727 - BLOCK
      ?auto_77726 - BLOCK
      ?auto_77724 - BLOCK
      ?auto_77728 - BLOCK
      ?auto_77725 - BLOCK
      ?auto_77729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77727 ?auto_77723 ) ( ON-TABLE ?auto_77722 ) ( ON ?auto_77723 ?auto_77722 ) ( not ( = ?auto_77722 ?auto_77723 ) ) ( not ( = ?auto_77722 ?auto_77727 ) ) ( not ( = ?auto_77723 ?auto_77727 ) ) ( not ( = ?auto_77722 ?auto_77726 ) ) ( not ( = ?auto_77722 ?auto_77724 ) ) ( not ( = ?auto_77723 ?auto_77726 ) ) ( not ( = ?auto_77723 ?auto_77724 ) ) ( not ( = ?auto_77727 ?auto_77726 ) ) ( not ( = ?auto_77727 ?auto_77724 ) ) ( not ( = ?auto_77726 ?auto_77724 ) ) ( ON ?auto_77726 ?auto_77727 ) ( not ( = ?auto_77728 ?auto_77725 ) ) ( not ( = ?auto_77728 ?auto_77724 ) ) ( not ( = ?auto_77725 ?auto_77724 ) ) ( not ( = ?auto_77722 ?auto_77725 ) ) ( not ( = ?auto_77722 ?auto_77728 ) ) ( not ( = ?auto_77723 ?auto_77725 ) ) ( not ( = ?auto_77723 ?auto_77728 ) ) ( not ( = ?auto_77727 ?auto_77725 ) ) ( not ( = ?auto_77727 ?auto_77728 ) ) ( not ( = ?auto_77726 ?auto_77725 ) ) ( not ( = ?auto_77726 ?auto_77728 ) ) ( ON ?auto_77724 ?auto_77726 ) ( ON ?auto_77728 ?auto_77729 ) ( CLEAR ?auto_77728 ) ( not ( = ?auto_77722 ?auto_77729 ) ) ( not ( = ?auto_77723 ?auto_77729 ) ) ( not ( = ?auto_77727 ?auto_77729 ) ) ( not ( = ?auto_77726 ?auto_77729 ) ) ( not ( = ?auto_77724 ?auto_77729 ) ) ( not ( = ?auto_77728 ?auto_77729 ) ) ( not ( = ?auto_77725 ?auto_77729 ) ) ( HOLDING ?auto_77725 ) ( CLEAR ?auto_77724 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77722 ?auto_77723 ?auto_77727 ?auto_77726 ?auto_77724 ?auto_77725 )
      ( MAKE-2PILE ?auto_77722 ?auto_77723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77730 - BLOCK
      ?auto_77731 - BLOCK
    )
    :vars
    (
      ?auto_77735 - BLOCK
      ?auto_77736 - BLOCK
      ?auto_77734 - BLOCK
      ?auto_77732 - BLOCK
      ?auto_77733 - BLOCK
      ?auto_77737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77735 ?auto_77731 ) ( ON-TABLE ?auto_77730 ) ( ON ?auto_77731 ?auto_77730 ) ( not ( = ?auto_77730 ?auto_77731 ) ) ( not ( = ?auto_77730 ?auto_77735 ) ) ( not ( = ?auto_77731 ?auto_77735 ) ) ( not ( = ?auto_77730 ?auto_77736 ) ) ( not ( = ?auto_77730 ?auto_77734 ) ) ( not ( = ?auto_77731 ?auto_77736 ) ) ( not ( = ?auto_77731 ?auto_77734 ) ) ( not ( = ?auto_77735 ?auto_77736 ) ) ( not ( = ?auto_77735 ?auto_77734 ) ) ( not ( = ?auto_77736 ?auto_77734 ) ) ( ON ?auto_77736 ?auto_77735 ) ( not ( = ?auto_77732 ?auto_77733 ) ) ( not ( = ?auto_77732 ?auto_77734 ) ) ( not ( = ?auto_77733 ?auto_77734 ) ) ( not ( = ?auto_77730 ?auto_77733 ) ) ( not ( = ?auto_77730 ?auto_77732 ) ) ( not ( = ?auto_77731 ?auto_77733 ) ) ( not ( = ?auto_77731 ?auto_77732 ) ) ( not ( = ?auto_77735 ?auto_77733 ) ) ( not ( = ?auto_77735 ?auto_77732 ) ) ( not ( = ?auto_77736 ?auto_77733 ) ) ( not ( = ?auto_77736 ?auto_77732 ) ) ( ON ?auto_77734 ?auto_77736 ) ( ON ?auto_77732 ?auto_77737 ) ( not ( = ?auto_77730 ?auto_77737 ) ) ( not ( = ?auto_77731 ?auto_77737 ) ) ( not ( = ?auto_77735 ?auto_77737 ) ) ( not ( = ?auto_77736 ?auto_77737 ) ) ( not ( = ?auto_77734 ?auto_77737 ) ) ( not ( = ?auto_77732 ?auto_77737 ) ) ( not ( = ?auto_77733 ?auto_77737 ) ) ( CLEAR ?auto_77734 ) ( ON ?auto_77733 ?auto_77732 ) ( CLEAR ?auto_77733 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77737 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77737 ?auto_77732 )
      ( MAKE-2PILE ?auto_77730 ?auto_77731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77738 - BLOCK
      ?auto_77739 - BLOCK
    )
    :vars
    (
      ?auto_77745 - BLOCK
      ?auto_77742 - BLOCK
      ?auto_77740 - BLOCK
      ?auto_77744 - BLOCK
      ?auto_77743 - BLOCK
      ?auto_77741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77745 ?auto_77739 ) ( ON-TABLE ?auto_77738 ) ( ON ?auto_77739 ?auto_77738 ) ( not ( = ?auto_77738 ?auto_77739 ) ) ( not ( = ?auto_77738 ?auto_77745 ) ) ( not ( = ?auto_77739 ?auto_77745 ) ) ( not ( = ?auto_77738 ?auto_77742 ) ) ( not ( = ?auto_77738 ?auto_77740 ) ) ( not ( = ?auto_77739 ?auto_77742 ) ) ( not ( = ?auto_77739 ?auto_77740 ) ) ( not ( = ?auto_77745 ?auto_77742 ) ) ( not ( = ?auto_77745 ?auto_77740 ) ) ( not ( = ?auto_77742 ?auto_77740 ) ) ( ON ?auto_77742 ?auto_77745 ) ( not ( = ?auto_77744 ?auto_77743 ) ) ( not ( = ?auto_77744 ?auto_77740 ) ) ( not ( = ?auto_77743 ?auto_77740 ) ) ( not ( = ?auto_77738 ?auto_77743 ) ) ( not ( = ?auto_77738 ?auto_77744 ) ) ( not ( = ?auto_77739 ?auto_77743 ) ) ( not ( = ?auto_77739 ?auto_77744 ) ) ( not ( = ?auto_77745 ?auto_77743 ) ) ( not ( = ?auto_77745 ?auto_77744 ) ) ( not ( = ?auto_77742 ?auto_77743 ) ) ( not ( = ?auto_77742 ?auto_77744 ) ) ( ON ?auto_77744 ?auto_77741 ) ( not ( = ?auto_77738 ?auto_77741 ) ) ( not ( = ?auto_77739 ?auto_77741 ) ) ( not ( = ?auto_77745 ?auto_77741 ) ) ( not ( = ?auto_77742 ?auto_77741 ) ) ( not ( = ?auto_77740 ?auto_77741 ) ) ( not ( = ?auto_77744 ?auto_77741 ) ) ( not ( = ?auto_77743 ?auto_77741 ) ) ( ON ?auto_77743 ?auto_77744 ) ( CLEAR ?auto_77743 ) ( ON-TABLE ?auto_77741 ) ( HOLDING ?auto_77740 ) ( CLEAR ?auto_77742 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77738 ?auto_77739 ?auto_77745 ?auto_77742 ?auto_77740 )
      ( MAKE-2PILE ?auto_77738 ?auto_77739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77746 - BLOCK
      ?auto_77747 - BLOCK
    )
    :vars
    (
      ?auto_77748 - BLOCK
      ?auto_77750 - BLOCK
      ?auto_77751 - BLOCK
      ?auto_77752 - BLOCK
      ?auto_77753 - BLOCK
      ?auto_77749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77748 ?auto_77747 ) ( ON-TABLE ?auto_77746 ) ( ON ?auto_77747 ?auto_77746 ) ( not ( = ?auto_77746 ?auto_77747 ) ) ( not ( = ?auto_77746 ?auto_77748 ) ) ( not ( = ?auto_77747 ?auto_77748 ) ) ( not ( = ?auto_77746 ?auto_77750 ) ) ( not ( = ?auto_77746 ?auto_77751 ) ) ( not ( = ?auto_77747 ?auto_77750 ) ) ( not ( = ?auto_77747 ?auto_77751 ) ) ( not ( = ?auto_77748 ?auto_77750 ) ) ( not ( = ?auto_77748 ?auto_77751 ) ) ( not ( = ?auto_77750 ?auto_77751 ) ) ( ON ?auto_77750 ?auto_77748 ) ( not ( = ?auto_77752 ?auto_77753 ) ) ( not ( = ?auto_77752 ?auto_77751 ) ) ( not ( = ?auto_77753 ?auto_77751 ) ) ( not ( = ?auto_77746 ?auto_77753 ) ) ( not ( = ?auto_77746 ?auto_77752 ) ) ( not ( = ?auto_77747 ?auto_77753 ) ) ( not ( = ?auto_77747 ?auto_77752 ) ) ( not ( = ?auto_77748 ?auto_77753 ) ) ( not ( = ?auto_77748 ?auto_77752 ) ) ( not ( = ?auto_77750 ?auto_77753 ) ) ( not ( = ?auto_77750 ?auto_77752 ) ) ( ON ?auto_77752 ?auto_77749 ) ( not ( = ?auto_77746 ?auto_77749 ) ) ( not ( = ?auto_77747 ?auto_77749 ) ) ( not ( = ?auto_77748 ?auto_77749 ) ) ( not ( = ?auto_77750 ?auto_77749 ) ) ( not ( = ?auto_77751 ?auto_77749 ) ) ( not ( = ?auto_77752 ?auto_77749 ) ) ( not ( = ?auto_77753 ?auto_77749 ) ) ( ON ?auto_77753 ?auto_77752 ) ( ON-TABLE ?auto_77749 ) ( CLEAR ?auto_77750 ) ( ON ?auto_77751 ?auto_77753 ) ( CLEAR ?auto_77751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77749 ?auto_77752 ?auto_77753 )
      ( MAKE-2PILE ?auto_77746 ?auto_77747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77754 - BLOCK
      ?auto_77755 - BLOCK
    )
    :vars
    (
      ?auto_77757 - BLOCK
      ?auto_77759 - BLOCK
      ?auto_77756 - BLOCK
      ?auto_77760 - BLOCK
      ?auto_77758 - BLOCK
      ?auto_77761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77757 ?auto_77755 ) ( ON-TABLE ?auto_77754 ) ( ON ?auto_77755 ?auto_77754 ) ( not ( = ?auto_77754 ?auto_77755 ) ) ( not ( = ?auto_77754 ?auto_77757 ) ) ( not ( = ?auto_77755 ?auto_77757 ) ) ( not ( = ?auto_77754 ?auto_77759 ) ) ( not ( = ?auto_77754 ?auto_77756 ) ) ( not ( = ?auto_77755 ?auto_77759 ) ) ( not ( = ?auto_77755 ?auto_77756 ) ) ( not ( = ?auto_77757 ?auto_77759 ) ) ( not ( = ?auto_77757 ?auto_77756 ) ) ( not ( = ?auto_77759 ?auto_77756 ) ) ( not ( = ?auto_77760 ?auto_77758 ) ) ( not ( = ?auto_77760 ?auto_77756 ) ) ( not ( = ?auto_77758 ?auto_77756 ) ) ( not ( = ?auto_77754 ?auto_77758 ) ) ( not ( = ?auto_77754 ?auto_77760 ) ) ( not ( = ?auto_77755 ?auto_77758 ) ) ( not ( = ?auto_77755 ?auto_77760 ) ) ( not ( = ?auto_77757 ?auto_77758 ) ) ( not ( = ?auto_77757 ?auto_77760 ) ) ( not ( = ?auto_77759 ?auto_77758 ) ) ( not ( = ?auto_77759 ?auto_77760 ) ) ( ON ?auto_77760 ?auto_77761 ) ( not ( = ?auto_77754 ?auto_77761 ) ) ( not ( = ?auto_77755 ?auto_77761 ) ) ( not ( = ?auto_77757 ?auto_77761 ) ) ( not ( = ?auto_77759 ?auto_77761 ) ) ( not ( = ?auto_77756 ?auto_77761 ) ) ( not ( = ?auto_77760 ?auto_77761 ) ) ( not ( = ?auto_77758 ?auto_77761 ) ) ( ON ?auto_77758 ?auto_77760 ) ( ON-TABLE ?auto_77761 ) ( ON ?auto_77756 ?auto_77758 ) ( CLEAR ?auto_77756 ) ( HOLDING ?auto_77759 ) ( CLEAR ?auto_77757 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77754 ?auto_77755 ?auto_77757 ?auto_77759 )
      ( MAKE-2PILE ?auto_77754 ?auto_77755 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77762 - BLOCK
      ?auto_77763 - BLOCK
    )
    :vars
    (
      ?auto_77764 - BLOCK
      ?auto_77765 - BLOCK
      ?auto_77769 - BLOCK
      ?auto_77766 - BLOCK
      ?auto_77768 - BLOCK
      ?auto_77767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_77764 ?auto_77763 ) ( ON-TABLE ?auto_77762 ) ( ON ?auto_77763 ?auto_77762 ) ( not ( = ?auto_77762 ?auto_77763 ) ) ( not ( = ?auto_77762 ?auto_77764 ) ) ( not ( = ?auto_77763 ?auto_77764 ) ) ( not ( = ?auto_77762 ?auto_77765 ) ) ( not ( = ?auto_77762 ?auto_77769 ) ) ( not ( = ?auto_77763 ?auto_77765 ) ) ( not ( = ?auto_77763 ?auto_77769 ) ) ( not ( = ?auto_77764 ?auto_77765 ) ) ( not ( = ?auto_77764 ?auto_77769 ) ) ( not ( = ?auto_77765 ?auto_77769 ) ) ( not ( = ?auto_77766 ?auto_77768 ) ) ( not ( = ?auto_77766 ?auto_77769 ) ) ( not ( = ?auto_77768 ?auto_77769 ) ) ( not ( = ?auto_77762 ?auto_77768 ) ) ( not ( = ?auto_77762 ?auto_77766 ) ) ( not ( = ?auto_77763 ?auto_77768 ) ) ( not ( = ?auto_77763 ?auto_77766 ) ) ( not ( = ?auto_77764 ?auto_77768 ) ) ( not ( = ?auto_77764 ?auto_77766 ) ) ( not ( = ?auto_77765 ?auto_77768 ) ) ( not ( = ?auto_77765 ?auto_77766 ) ) ( ON ?auto_77766 ?auto_77767 ) ( not ( = ?auto_77762 ?auto_77767 ) ) ( not ( = ?auto_77763 ?auto_77767 ) ) ( not ( = ?auto_77764 ?auto_77767 ) ) ( not ( = ?auto_77765 ?auto_77767 ) ) ( not ( = ?auto_77769 ?auto_77767 ) ) ( not ( = ?auto_77766 ?auto_77767 ) ) ( not ( = ?auto_77768 ?auto_77767 ) ) ( ON ?auto_77768 ?auto_77766 ) ( ON-TABLE ?auto_77767 ) ( ON ?auto_77769 ?auto_77768 ) ( CLEAR ?auto_77764 ) ( ON ?auto_77765 ?auto_77769 ) ( CLEAR ?auto_77765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77767 ?auto_77766 ?auto_77768 ?auto_77769 )
      ( MAKE-2PILE ?auto_77762 ?auto_77763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77786 - BLOCK
      ?auto_77787 - BLOCK
    )
    :vars
    (
      ?auto_77793 - BLOCK
      ?auto_77788 - BLOCK
      ?auto_77791 - BLOCK
      ?auto_77789 - BLOCK
      ?auto_77790 - BLOCK
      ?auto_77792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77786 ) ( not ( = ?auto_77786 ?auto_77787 ) ) ( not ( = ?auto_77786 ?auto_77793 ) ) ( not ( = ?auto_77787 ?auto_77793 ) ) ( not ( = ?auto_77786 ?auto_77788 ) ) ( not ( = ?auto_77786 ?auto_77791 ) ) ( not ( = ?auto_77787 ?auto_77788 ) ) ( not ( = ?auto_77787 ?auto_77791 ) ) ( not ( = ?auto_77793 ?auto_77788 ) ) ( not ( = ?auto_77793 ?auto_77791 ) ) ( not ( = ?auto_77788 ?auto_77791 ) ) ( not ( = ?auto_77789 ?auto_77790 ) ) ( not ( = ?auto_77789 ?auto_77791 ) ) ( not ( = ?auto_77790 ?auto_77791 ) ) ( not ( = ?auto_77786 ?auto_77790 ) ) ( not ( = ?auto_77786 ?auto_77789 ) ) ( not ( = ?auto_77787 ?auto_77790 ) ) ( not ( = ?auto_77787 ?auto_77789 ) ) ( not ( = ?auto_77793 ?auto_77790 ) ) ( not ( = ?auto_77793 ?auto_77789 ) ) ( not ( = ?auto_77788 ?auto_77790 ) ) ( not ( = ?auto_77788 ?auto_77789 ) ) ( ON ?auto_77789 ?auto_77792 ) ( not ( = ?auto_77786 ?auto_77792 ) ) ( not ( = ?auto_77787 ?auto_77792 ) ) ( not ( = ?auto_77793 ?auto_77792 ) ) ( not ( = ?auto_77788 ?auto_77792 ) ) ( not ( = ?auto_77791 ?auto_77792 ) ) ( not ( = ?auto_77789 ?auto_77792 ) ) ( not ( = ?auto_77790 ?auto_77792 ) ) ( ON ?auto_77790 ?auto_77789 ) ( ON-TABLE ?auto_77792 ) ( ON ?auto_77791 ?auto_77790 ) ( ON ?auto_77788 ?auto_77791 ) ( ON ?auto_77793 ?auto_77788 ) ( CLEAR ?auto_77793 ) ( HOLDING ?auto_77787 ) ( CLEAR ?auto_77786 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77786 ?auto_77787 ?auto_77793 )
      ( MAKE-2PILE ?auto_77786 ?auto_77787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77794 - BLOCK
      ?auto_77795 - BLOCK
    )
    :vars
    (
      ?auto_77798 - BLOCK
      ?auto_77796 - BLOCK
      ?auto_77799 - BLOCK
      ?auto_77800 - BLOCK
      ?auto_77801 - BLOCK
      ?auto_77797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77794 ) ( not ( = ?auto_77794 ?auto_77795 ) ) ( not ( = ?auto_77794 ?auto_77798 ) ) ( not ( = ?auto_77795 ?auto_77798 ) ) ( not ( = ?auto_77794 ?auto_77796 ) ) ( not ( = ?auto_77794 ?auto_77799 ) ) ( not ( = ?auto_77795 ?auto_77796 ) ) ( not ( = ?auto_77795 ?auto_77799 ) ) ( not ( = ?auto_77798 ?auto_77796 ) ) ( not ( = ?auto_77798 ?auto_77799 ) ) ( not ( = ?auto_77796 ?auto_77799 ) ) ( not ( = ?auto_77800 ?auto_77801 ) ) ( not ( = ?auto_77800 ?auto_77799 ) ) ( not ( = ?auto_77801 ?auto_77799 ) ) ( not ( = ?auto_77794 ?auto_77801 ) ) ( not ( = ?auto_77794 ?auto_77800 ) ) ( not ( = ?auto_77795 ?auto_77801 ) ) ( not ( = ?auto_77795 ?auto_77800 ) ) ( not ( = ?auto_77798 ?auto_77801 ) ) ( not ( = ?auto_77798 ?auto_77800 ) ) ( not ( = ?auto_77796 ?auto_77801 ) ) ( not ( = ?auto_77796 ?auto_77800 ) ) ( ON ?auto_77800 ?auto_77797 ) ( not ( = ?auto_77794 ?auto_77797 ) ) ( not ( = ?auto_77795 ?auto_77797 ) ) ( not ( = ?auto_77798 ?auto_77797 ) ) ( not ( = ?auto_77796 ?auto_77797 ) ) ( not ( = ?auto_77799 ?auto_77797 ) ) ( not ( = ?auto_77800 ?auto_77797 ) ) ( not ( = ?auto_77801 ?auto_77797 ) ) ( ON ?auto_77801 ?auto_77800 ) ( ON-TABLE ?auto_77797 ) ( ON ?auto_77799 ?auto_77801 ) ( ON ?auto_77796 ?auto_77799 ) ( ON ?auto_77798 ?auto_77796 ) ( CLEAR ?auto_77794 ) ( ON ?auto_77795 ?auto_77798 ) ( CLEAR ?auto_77795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77797 ?auto_77800 ?auto_77801 ?auto_77799 ?auto_77796 ?auto_77798 )
      ( MAKE-2PILE ?auto_77794 ?auto_77795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77802 - BLOCK
      ?auto_77803 - BLOCK
    )
    :vars
    (
      ?auto_77804 - BLOCK
      ?auto_77805 - BLOCK
      ?auto_77808 - BLOCK
      ?auto_77809 - BLOCK
      ?auto_77806 - BLOCK
      ?auto_77807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77802 ?auto_77803 ) ) ( not ( = ?auto_77802 ?auto_77804 ) ) ( not ( = ?auto_77803 ?auto_77804 ) ) ( not ( = ?auto_77802 ?auto_77805 ) ) ( not ( = ?auto_77802 ?auto_77808 ) ) ( not ( = ?auto_77803 ?auto_77805 ) ) ( not ( = ?auto_77803 ?auto_77808 ) ) ( not ( = ?auto_77804 ?auto_77805 ) ) ( not ( = ?auto_77804 ?auto_77808 ) ) ( not ( = ?auto_77805 ?auto_77808 ) ) ( not ( = ?auto_77809 ?auto_77806 ) ) ( not ( = ?auto_77809 ?auto_77808 ) ) ( not ( = ?auto_77806 ?auto_77808 ) ) ( not ( = ?auto_77802 ?auto_77806 ) ) ( not ( = ?auto_77802 ?auto_77809 ) ) ( not ( = ?auto_77803 ?auto_77806 ) ) ( not ( = ?auto_77803 ?auto_77809 ) ) ( not ( = ?auto_77804 ?auto_77806 ) ) ( not ( = ?auto_77804 ?auto_77809 ) ) ( not ( = ?auto_77805 ?auto_77806 ) ) ( not ( = ?auto_77805 ?auto_77809 ) ) ( ON ?auto_77809 ?auto_77807 ) ( not ( = ?auto_77802 ?auto_77807 ) ) ( not ( = ?auto_77803 ?auto_77807 ) ) ( not ( = ?auto_77804 ?auto_77807 ) ) ( not ( = ?auto_77805 ?auto_77807 ) ) ( not ( = ?auto_77808 ?auto_77807 ) ) ( not ( = ?auto_77809 ?auto_77807 ) ) ( not ( = ?auto_77806 ?auto_77807 ) ) ( ON ?auto_77806 ?auto_77809 ) ( ON-TABLE ?auto_77807 ) ( ON ?auto_77808 ?auto_77806 ) ( ON ?auto_77805 ?auto_77808 ) ( ON ?auto_77804 ?auto_77805 ) ( ON ?auto_77803 ?auto_77804 ) ( CLEAR ?auto_77803 ) ( HOLDING ?auto_77802 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77802 )
      ( MAKE-2PILE ?auto_77802 ?auto_77803 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_77810 - BLOCK
      ?auto_77811 - BLOCK
    )
    :vars
    (
      ?auto_77815 - BLOCK
      ?auto_77812 - BLOCK
      ?auto_77813 - BLOCK
      ?auto_77814 - BLOCK
      ?auto_77817 - BLOCK
      ?auto_77816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77810 ?auto_77811 ) ) ( not ( = ?auto_77810 ?auto_77815 ) ) ( not ( = ?auto_77811 ?auto_77815 ) ) ( not ( = ?auto_77810 ?auto_77812 ) ) ( not ( = ?auto_77810 ?auto_77813 ) ) ( not ( = ?auto_77811 ?auto_77812 ) ) ( not ( = ?auto_77811 ?auto_77813 ) ) ( not ( = ?auto_77815 ?auto_77812 ) ) ( not ( = ?auto_77815 ?auto_77813 ) ) ( not ( = ?auto_77812 ?auto_77813 ) ) ( not ( = ?auto_77814 ?auto_77817 ) ) ( not ( = ?auto_77814 ?auto_77813 ) ) ( not ( = ?auto_77817 ?auto_77813 ) ) ( not ( = ?auto_77810 ?auto_77817 ) ) ( not ( = ?auto_77810 ?auto_77814 ) ) ( not ( = ?auto_77811 ?auto_77817 ) ) ( not ( = ?auto_77811 ?auto_77814 ) ) ( not ( = ?auto_77815 ?auto_77817 ) ) ( not ( = ?auto_77815 ?auto_77814 ) ) ( not ( = ?auto_77812 ?auto_77817 ) ) ( not ( = ?auto_77812 ?auto_77814 ) ) ( ON ?auto_77814 ?auto_77816 ) ( not ( = ?auto_77810 ?auto_77816 ) ) ( not ( = ?auto_77811 ?auto_77816 ) ) ( not ( = ?auto_77815 ?auto_77816 ) ) ( not ( = ?auto_77812 ?auto_77816 ) ) ( not ( = ?auto_77813 ?auto_77816 ) ) ( not ( = ?auto_77814 ?auto_77816 ) ) ( not ( = ?auto_77817 ?auto_77816 ) ) ( ON ?auto_77817 ?auto_77814 ) ( ON-TABLE ?auto_77816 ) ( ON ?auto_77813 ?auto_77817 ) ( ON ?auto_77812 ?auto_77813 ) ( ON ?auto_77815 ?auto_77812 ) ( ON ?auto_77811 ?auto_77815 ) ( ON ?auto_77810 ?auto_77811 ) ( CLEAR ?auto_77810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77816 ?auto_77814 ?auto_77817 ?auto_77813 ?auto_77812 ?auto_77815 ?auto_77811 )
      ( MAKE-2PILE ?auto_77810 ?auto_77811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77823 - BLOCK
      ?auto_77824 - BLOCK
      ?auto_77825 - BLOCK
      ?auto_77826 - BLOCK
      ?auto_77827 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_77827 ) ( CLEAR ?auto_77826 ) ( ON-TABLE ?auto_77823 ) ( ON ?auto_77824 ?auto_77823 ) ( ON ?auto_77825 ?auto_77824 ) ( ON ?auto_77826 ?auto_77825 ) ( not ( = ?auto_77823 ?auto_77824 ) ) ( not ( = ?auto_77823 ?auto_77825 ) ) ( not ( = ?auto_77823 ?auto_77826 ) ) ( not ( = ?auto_77823 ?auto_77827 ) ) ( not ( = ?auto_77824 ?auto_77825 ) ) ( not ( = ?auto_77824 ?auto_77826 ) ) ( not ( = ?auto_77824 ?auto_77827 ) ) ( not ( = ?auto_77825 ?auto_77826 ) ) ( not ( = ?auto_77825 ?auto_77827 ) ) ( not ( = ?auto_77826 ?auto_77827 ) ) )
    :subtasks
    ( ( !STACK ?auto_77827 ?auto_77826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77828 - BLOCK
      ?auto_77829 - BLOCK
      ?auto_77830 - BLOCK
      ?auto_77831 - BLOCK
      ?auto_77832 - BLOCK
    )
    :vars
    (
      ?auto_77833 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77831 ) ( ON-TABLE ?auto_77828 ) ( ON ?auto_77829 ?auto_77828 ) ( ON ?auto_77830 ?auto_77829 ) ( ON ?auto_77831 ?auto_77830 ) ( not ( = ?auto_77828 ?auto_77829 ) ) ( not ( = ?auto_77828 ?auto_77830 ) ) ( not ( = ?auto_77828 ?auto_77831 ) ) ( not ( = ?auto_77828 ?auto_77832 ) ) ( not ( = ?auto_77829 ?auto_77830 ) ) ( not ( = ?auto_77829 ?auto_77831 ) ) ( not ( = ?auto_77829 ?auto_77832 ) ) ( not ( = ?auto_77830 ?auto_77831 ) ) ( not ( = ?auto_77830 ?auto_77832 ) ) ( not ( = ?auto_77831 ?auto_77832 ) ) ( ON ?auto_77832 ?auto_77833 ) ( CLEAR ?auto_77832 ) ( HAND-EMPTY ) ( not ( = ?auto_77828 ?auto_77833 ) ) ( not ( = ?auto_77829 ?auto_77833 ) ) ( not ( = ?auto_77830 ?auto_77833 ) ) ( not ( = ?auto_77831 ?auto_77833 ) ) ( not ( = ?auto_77832 ?auto_77833 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77832 ?auto_77833 )
      ( MAKE-5PILE ?auto_77828 ?auto_77829 ?auto_77830 ?auto_77831 ?auto_77832 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77834 - BLOCK
      ?auto_77835 - BLOCK
      ?auto_77836 - BLOCK
      ?auto_77837 - BLOCK
      ?auto_77838 - BLOCK
    )
    :vars
    (
      ?auto_77839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77834 ) ( ON ?auto_77835 ?auto_77834 ) ( ON ?auto_77836 ?auto_77835 ) ( not ( = ?auto_77834 ?auto_77835 ) ) ( not ( = ?auto_77834 ?auto_77836 ) ) ( not ( = ?auto_77834 ?auto_77837 ) ) ( not ( = ?auto_77834 ?auto_77838 ) ) ( not ( = ?auto_77835 ?auto_77836 ) ) ( not ( = ?auto_77835 ?auto_77837 ) ) ( not ( = ?auto_77835 ?auto_77838 ) ) ( not ( = ?auto_77836 ?auto_77837 ) ) ( not ( = ?auto_77836 ?auto_77838 ) ) ( not ( = ?auto_77837 ?auto_77838 ) ) ( ON ?auto_77838 ?auto_77839 ) ( CLEAR ?auto_77838 ) ( not ( = ?auto_77834 ?auto_77839 ) ) ( not ( = ?auto_77835 ?auto_77839 ) ) ( not ( = ?auto_77836 ?auto_77839 ) ) ( not ( = ?auto_77837 ?auto_77839 ) ) ( not ( = ?auto_77838 ?auto_77839 ) ) ( HOLDING ?auto_77837 ) ( CLEAR ?auto_77836 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77834 ?auto_77835 ?auto_77836 ?auto_77837 )
      ( MAKE-5PILE ?auto_77834 ?auto_77835 ?auto_77836 ?auto_77837 ?auto_77838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77840 - BLOCK
      ?auto_77841 - BLOCK
      ?auto_77842 - BLOCK
      ?auto_77843 - BLOCK
      ?auto_77844 - BLOCK
    )
    :vars
    (
      ?auto_77845 - BLOCK
      ?auto_77846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77840 ) ( ON ?auto_77841 ?auto_77840 ) ( ON ?auto_77842 ?auto_77841 ) ( not ( = ?auto_77840 ?auto_77841 ) ) ( not ( = ?auto_77840 ?auto_77842 ) ) ( not ( = ?auto_77840 ?auto_77843 ) ) ( not ( = ?auto_77840 ?auto_77844 ) ) ( not ( = ?auto_77841 ?auto_77842 ) ) ( not ( = ?auto_77841 ?auto_77843 ) ) ( not ( = ?auto_77841 ?auto_77844 ) ) ( not ( = ?auto_77842 ?auto_77843 ) ) ( not ( = ?auto_77842 ?auto_77844 ) ) ( not ( = ?auto_77843 ?auto_77844 ) ) ( ON ?auto_77844 ?auto_77845 ) ( not ( = ?auto_77840 ?auto_77845 ) ) ( not ( = ?auto_77841 ?auto_77845 ) ) ( not ( = ?auto_77842 ?auto_77845 ) ) ( not ( = ?auto_77843 ?auto_77845 ) ) ( not ( = ?auto_77844 ?auto_77845 ) ) ( CLEAR ?auto_77842 ) ( ON ?auto_77843 ?auto_77844 ) ( CLEAR ?auto_77843 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77846 ) ( ON ?auto_77845 ?auto_77846 ) ( not ( = ?auto_77846 ?auto_77845 ) ) ( not ( = ?auto_77846 ?auto_77844 ) ) ( not ( = ?auto_77846 ?auto_77843 ) ) ( not ( = ?auto_77840 ?auto_77846 ) ) ( not ( = ?auto_77841 ?auto_77846 ) ) ( not ( = ?auto_77842 ?auto_77846 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77846 ?auto_77845 ?auto_77844 )
      ( MAKE-5PILE ?auto_77840 ?auto_77841 ?auto_77842 ?auto_77843 ?auto_77844 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77847 - BLOCK
      ?auto_77848 - BLOCK
      ?auto_77849 - BLOCK
      ?auto_77850 - BLOCK
      ?auto_77851 - BLOCK
    )
    :vars
    (
      ?auto_77853 - BLOCK
      ?auto_77852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77847 ) ( ON ?auto_77848 ?auto_77847 ) ( not ( = ?auto_77847 ?auto_77848 ) ) ( not ( = ?auto_77847 ?auto_77849 ) ) ( not ( = ?auto_77847 ?auto_77850 ) ) ( not ( = ?auto_77847 ?auto_77851 ) ) ( not ( = ?auto_77848 ?auto_77849 ) ) ( not ( = ?auto_77848 ?auto_77850 ) ) ( not ( = ?auto_77848 ?auto_77851 ) ) ( not ( = ?auto_77849 ?auto_77850 ) ) ( not ( = ?auto_77849 ?auto_77851 ) ) ( not ( = ?auto_77850 ?auto_77851 ) ) ( ON ?auto_77851 ?auto_77853 ) ( not ( = ?auto_77847 ?auto_77853 ) ) ( not ( = ?auto_77848 ?auto_77853 ) ) ( not ( = ?auto_77849 ?auto_77853 ) ) ( not ( = ?auto_77850 ?auto_77853 ) ) ( not ( = ?auto_77851 ?auto_77853 ) ) ( ON ?auto_77850 ?auto_77851 ) ( CLEAR ?auto_77850 ) ( ON-TABLE ?auto_77852 ) ( ON ?auto_77853 ?auto_77852 ) ( not ( = ?auto_77852 ?auto_77853 ) ) ( not ( = ?auto_77852 ?auto_77851 ) ) ( not ( = ?auto_77852 ?auto_77850 ) ) ( not ( = ?auto_77847 ?auto_77852 ) ) ( not ( = ?auto_77848 ?auto_77852 ) ) ( not ( = ?auto_77849 ?auto_77852 ) ) ( HOLDING ?auto_77849 ) ( CLEAR ?auto_77848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77847 ?auto_77848 ?auto_77849 )
      ( MAKE-5PILE ?auto_77847 ?auto_77848 ?auto_77849 ?auto_77850 ?auto_77851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77854 - BLOCK
      ?auto_77855 - BLOCK
      ?auto_77856 - BLOCK
      ?auto_77857 - BLOCK
      ?auto_77858 - BLOCK
    )
    :vars
    (
      ?auto_77859 - BLOCK
      ?auto_77860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77854 ) ( ON ?auto_77855 ?auto_77854 ) ( not ( = ?auto_77854 ?auto_77855 ) ) ( not ( = ?auto_77854 ?auto_77856 ) ) ( not ( = ?auto_77854 ?auto_77857 ) ) ( not ( = ?auto_77854 ?auto_77858 ) ) ( not ( = ?auto_77855 ?auto_77856 ) ) ( not ( = ?auto_77855 ?auto_77857 ) ) ( not ( = ?auto_77855 ?auto_77858 ) ) ( not ( = ?auto_77856 ?auto_77857 ) ) ( not ( = ?auto_77856 ?auto_77858 ) ) ( not ( = ?auto_77857 ?auto_77858 ) ) ( ON ?auto_77858 ?auto_77859 ) ( not ( = ?auto_77854 ?auto_77859 ) ) ( not ( = ?auto_77855 ?auto_77859 ) ) ( not ( = ?auto_77856 ?auto_77859 ) ) ( not ( = ?auto_77857 ?auto_77859 ) ) ( not ( = ?auto_77858 ?auto_77859 ) ) ( ON ?auto_77857 ?auto_77858 ) ( ON-TABLE ?auto_77860 ) ( ON ?auto_77859 ?auto_77860 ) ( not ( = ?auto_77860 ?auto_77859 ) ) ( not ( = ?auto_77860 ?auto_77858 ) ) ( not ( = ?auto_77860 ?auto_77857 ) ) ( not ( = ?auto_77854 ?auto_77860 ) ) ( not ( = ?auto_77855 ?auto_77860 ) ) ( not ( = ?auto_77856 ?auto_77860 ) ) ( CLEAR ?auto_77855 ) ( ON ?auto_77856 ?auto_77857 ) ( CLEAR ?auto_77856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77860 ?auto_77859 ?auto_77858 ?auto_77857 )
      ( MAKE-5PILE ?auto_77854 ?auto_77855 ?auto_77856 ?auto_77857 ?auto_77858 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77861 - BLOCK
      ?auto_77862 - BLOCK
      ?auto_77863 - BLOCK
      ?auto_77864 - BLOCK
      ?auto_77865 - BLOCK
    )
    :vars
    (
      ?auto_77866 - BLOCK
      ?auto_77867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77861 ) ( not ( = ?auto_77861 ?auto_77862 ) ) ( not ( = ?auto_77861 ?auto_77863 ) ) ( not ( = ?auto_77861 ?auto_77864 ) ) ( not ( = ?auto_77861 ?auto_77865 ) ) ( not ( = ?auto_77862 ?auto_77863 ) ) ( not ( = ?auto_77862 ?auto_77864 ) ) ( not ( = ?auto_77862 ?auto_77865 ) ) ( not ( = ?auto_77863 ?auto_77864 ) ) ( not ( = ?auto_77863 ?auto_77865 ) ) ( not ( = ?auto_77864 ?auto_77865 ) ) ( ON ?auto_77865 ?auto_77866 ) ( not ( = ?auto_77861 ?auto_77866 ) ) ( not ( = ?auto_77862 ?auto_77866 ) ) ( not ( = ?auto_77863 ?auto_77866 ) ) ( not ( = ?auto_77864 ?auto_77866 ) ) ( not ( = ?auto_77865 ?auto_77866 ) ) ( ON ?auto_77864 ?auto_77865 ) ( ON-TABLE ?auto_77867 ) ( ON ?auto_77866 ?auto_77867 ) ( not ( = ?auto_77867 ?auto_77866 ) ) ( not ( = ?auto_77867 ?auto_77865 ) ) ( not ( = ?auto_77867 ?auto_77864 ) ) ( not ( = ?auto_77861 ?auto_77867 ) ) ( not ( = ?auto_77862 ?auto_77867 ) ) ( not ( = ?auto_77863 ?auto_77867 ) ) ( ON ?auto_77863 ?auto_77864 ) ( CLEAR ?auto_77863 ) ( HOLDING ?auto_77862 ) ( CLEAR ?auto_77861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77861 ?auto_77862 )
      ( MAKE-5PILE ?auto_77861 ?auto_77862 ?auto_77863 ?auto_77864 ?auto_77865 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77868 - BLOCK
      ?auto_77869 - BLOCK
      ?auto_77870 - BLOCK
      ?auto_77871 - BLOCK
      ?auto_77872 - BLOCK
    )
    :vars
    (
      ?auto_77873 - BLOCK
      ?auto_77874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_77868 ) ( not ( = ?auto_77868 ?auto_77869 ) ) ( not ( = ?auto_77868 ?auto_77870 ) ) ( not ( = ?auto_77868 ?auto_77871 ) ) ( not ( = ?auto_77868 ?auto_77872 ) ) ( not ( = ?auto_77869 ?auto_77870 ) ) ( not ( = ?auto_77869 ?auto_77871 ) ) ( not ( = ?auto_77869 ?auto_77872 ) ) ( not ( = ?auto_77870 ?auto_77871 ) ) ( not ( = ?auto_77870 ?auto_77872 ) ) ( not ( = ?auto_77871 ?auto_77872 ) ) ( ON ?auto_77872 ?auto_77873 ) ( not ( = ?auto_77868 ?auto_77873 ) ) ( not ( = ?auto_77869 ?auto_77873 ) ) ( not ( = ?auto_77870 ?auto_77873 ) ) ( not ( = ?auto_77871 ?auto_77873 ) ) ( not ( = ?auto_77872 ?auto_77873 ) ) ( ON ?auto_77871 ?auto_77872 ) ( ON-TABLE ?auto_77874 ) ( ON ?auto_77873 ?auto_77874 ) ( not ( = ?auto_77874 ?auto_77873 ) ) ( not ( = ?auto_77874 ?auto_77872 ) ) ( not ( = ?auto_77874 ?auto_77871 ) ) ( not ( = ?auto_77868 ?auto_77874 ) ) ( not ( = ?auto_77869 ?auto_77874 ) ) ( not ( = ?auto_77870 ?auto_77874 ) ) ( ON ?auto_77870 ?auto_77871 ) ( CLEAR ?auto_77868 ) ( ON ?auto_77869 ?auto_77870 ) ( CLEAR ?auto_77869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77874 ?auto_77873 ?auto_77872 ?auto_77871 ?auto_77870 )
      ( MAKE-5PILE ?auto_77868 ?auto_77869 ?auto_77870 ?auto_77871 ?auto_77872 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77875 - BLOCK
      ?auto_77876 - BLOCK
      ?auto_77877 - BLOCK
      ?auto_77878 - BLOCK
      ?auto_77879 - BLOCK
    )
    :vars
    (
      ?auto_77880 - BLOCK
      ?auto_77881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77875 ?auto_77876 ) ) ( not ( = ?auto_77875 ?auto_77877 ) ) ( not ( = ?auto_77875 ?auto_77878 ) ) ( not ( = ?auto_77875 ?auto_77879 ) ) ( not ( = ?auto_77876 ?auto_77877 ) ) ( not ( = ?auto_77876 ?auto_77878 ) ) ( not ( = ?auto_77876 ?auto_77879 ) ) ( not ( = ?auto_77877 ?auto_77878 ) ) ( not ( = ?auto_77877 ?auto_77879 ) ) ( not ( = ?auto_77878 ?auto_77879 ) ) ( ON ?auto_77879 ?auto_77880 ) ( not ( = ?auto_77875 ?auto_77880 ) ) ( not ( = ?auto_77876 ?auto_77880 ) ) ( not ( = ?auto_77877 ?auto_77880 ) ) ( not ( = ?auto_77878 ?auto_77880 ) ) ( not ( = ?auto_77879 ?auto_77880 ) ) ( ON ?auto_77878 ?auto_77879 ) ( ON-TABLE ?auto_77881 ) ( ON ?auto_77880 ?auto_77881 ) ( not ( = ?auto_77881 ?auto_77880 ) ) ( not ( = ?auto_77881 ?auto_77879 ) ) ( not ( = ?auto_77881 ?auto_77878 ) ) ( not ( = ?auto_77875 ?auto_77881 ) ) ( not ( = ?auto_77876 ?auto_77881 ) ) ( not ( = ?auto_77877 ?auto_77881 ) ) ( ON ?auto_77877 ?auto_77878 ) ( ON ?auto_77876 ?auto_77877 ) ( CLEAR ?auto_77876 ) ( HOLDING ?auto_77875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77875 )
      ( MAKE-5PILE ?auto_77875 ?auto_77876 ?auto_77877 ?auto_77878 ?auto_77879 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77882 - BLOCK
      ?auto_77883 - BLOCK
      ?auto_77884 - BLOCK
      ?auto_77885 - BLOCK
      ?auto_77886 - BLOCK
    )
    :vars
    (
      ?auto_77887 - BLOCK
      ?auto_77888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77882 ?auto_77883 ) ) ( not ( = ?auto_77882 ?auto_77884 ) ) ( not ( = ?auto_77882 ?auto_77885 ) ) ( not ( = ?auto_77882 ?auto_77886 ) ) ( not ( = ?auto_77883 ?auto_77884 ) ) ( not ( = ?auto_77883 ?auto_77885 ) ) ( not ( = ?auto_77883 ?auto_77886 ) ) ( not ( = ?auto_77884 ?auto_77885 ) ) ( not ( = ?auto_77884 ?auto_77886 ) ) ( not ( = ?auto_77885 ?auto_77886 ) ) ( ON ?auto_77886 ?auto_77887 ) ( not ( = ?auto_77882 ?auto_77887 ) ) ( not ( = ?auto_77883 ?auto_77887 ) ) ( not ( = ?auto_77884 ?auto_77887 ) ) ( not ( = ?auto_77885 ?auto_77887 ) ) ( not ( = ?auto_77886 ?auto_77887 ) ) ( ON ?auto_77885 ?auto_77886 ) ( ON-TABLE ?auto_77888 ) ( ON ?auto_77887 ?auto_77888 ) ( not ( = ?auto_77888 ?auto_77887 ) ) ( not ( = ?auto_77888 ?auto_77886 ) ) ( not ( = ?auto_77888 ?auto_77885 ) ) ( not ( = ?auto_77882 ?auto_77888 ) ) ( not ( = ?auto_77883 ?auto_77888 ) ) ( not ( = ?auto_77884 ?auto_77888 ) ) ( ON ?auto_77884 ?auto_77885 ) ( ON ?auto_77883 ?auto_77884 ) ( ON ?auto_77882 ?auto_77883 ) ( CLEAR ?auto_77882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77888 ?auto_77887 ?auto_77886 ?auto_77885 ?auto_77884 ?auto_77883 )
      ( MAKE-5PILE ?auto_77882 ?auto_77883 ?auto_77884 ?auto_77885 ?auto_77886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77889 - BLOCK
      ?auto_77890 - BLOCK
      ?auto_77891 - BLOCK
      ?auto_77892 - BLOCK
      ?auto_77893 - BLOCK
    )
    :vars
    (
      ?auto_77894 - BLOCK
      ?auto_77895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77889 ?auto_77890 ) ) ( not ( = ?auto_77889 ?auto_77891 ) ) ( not ( = ?auto_77889 ?auto_77892 ) ) ( not ( = ?auto_77889 ?auto_77893 ) ) ( not ( = ?auto_77890 ?auto_77891 ) ) ( not ( = ?auto_77890 ?auto_77892 ) ) ( not ( = ?auto_77890 ?auto_77893 ) ) ( not ( = ?auto_77891 ?auto_77892 ) ) ( not ( = ?auto_77891 ?auto_77893 ) ) ( not ( = ?auto_77892 ?auto_77893 ) ) ( ON ?auto_77893 ?auto_77894 ) ( not ( = ?auto_77889 ?auto_77894 ) ) ( not ( = ?auto_77890 ?auto_77894 ) ) ( not ( = ?auto_77891 ?auto_77894 ) ) ( not ( = ?auto_77892 ?auto_77894 ) ) ( not ( = ?auto_77893 ?auto_77894 ) ) ( ON ?auto_77892 ?auto_77893 ) ( ON-TABLE ?auto_77895 ) ( ON ?auto_77894 ?auto_77895 ) ( not ( = ?auto_77895 ?auto_77894 ) ) ( not ( = ?auto_77895 ?auto_77893 ) ) ( not ( = ?auto_77895 ?auto_77892 ) ) ( not ( = ?auto_77889 ?auto_77895 ) ) ( not ( = ?auto_77890 ?auto_77895 ) ) ( not ( = ?auto_77891 ?auto_77895 ) ) ( ON ?auto_77891 ?auto_77892 ) ( ON ?auto_77890 ?auto_77891 ) ( HOLDING ?auto_77889 ) ( CLEAR ?auto_77890 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77895 ?auto_77894 ?auto_77893 ?auto_77892 ?auto_77891 ?auto_77890 ?auto_77889 )
      ( MAKE-5PILE ?auto_77889 ?auto_77890 ?auto_77891 ?auto_77892 ?auto_77893 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77896 - BLOCK
      ?auto_77897 - BLOCK
      ?auto_77898 - BLOCK
      ?auto_77899 - BLOCK
      ?auto_77900 - BLOCK
    )
    :vars
    (
      ?auto_77901 - BLOCK
      ?auto_77902 - BLOCK
      ?auto_77903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77896 ?auto_77897 ) ) ( not ( = ?auto_77896 ?auto_77898 ) ) ( not ( = ?auto_77896 ?auto_77899 ) ) ( not ( = ?auto_77896 ?auto_77900 ) ) ( not ( = ?auto_77897 ?auto_77898 ) ) ( not ( = ?auto_77897 ?auto_77899 ) ) ( not ( = ?auto_77897 ?auto_77900 ) ) ( not ( = ?auto_77898 ?auto_77899 ) ) ( not ( = ?auto_77898 ?auto_77900 ) ) ( not ( = ?auto_77899 ?auto_77900 ) ) ( ON ?auto_77900 ?auto_77901 ) ( not ( = ?auto_77896 ?auto_77901 ) ) ( not ( = ?auto_77897 ?auto_77901 ) ) ( not ( = ?auto_77898 ?auto_77901 ) ) ( not ( = ?auto_77899 ?auto_77901 ) ) ( not ( = ?auto_77900 ?auto_77901 ) ) ( ON ?auto_77899 ?auto_77900 ) ( ON-TABLE ?auto_77902 ) ( ON ?auto_77901 ?auto_77902 ) ( not ( = ?auto_77902 ?auto_77901 ) ) ( not ( = ?auto_77902 ?auto_77900 ) ) ( not ( = ?auto_77902 ?auto_77899 ) ) ( not ( = ?auto_77896 ?auto_77902 ) ) ( not ( = ?auto_77897 ?auto_77902 ) ) ( not ( = ?auto_77898 ?auto_77902 ) ) ( ON ?auto_77898 ?auto_77899 ) ( ON ?auto_77897 ?auto_77898 ) ( CLEAR ?auto_77897 ) ( ON ?auto_77896 ?auto_77903 ) ( CLEAR ?auto_77896 ) ( HAND-EMPTY ) ( not ( = ?auto_77896 ?auto_77903 ) ) ( not ( = ?auto_77897 ?auto_77903 ) ) ( not ( = ?auto_77898 ?auto_77903 ) ) ( not ( = ?auto_77899 ?auto_77903 ) ) ( not ( = ?auto_77900 ?auto_77903 ) ) ( not ( = ?auto_77901 ?auto_77903 ) ) ( not ( = ?auto_77902 ?auto_77903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_77896 ?auto_77903 )
      ( MAKE-5PILE ?auto_77896 ?auto_77897 ?auto_77898 ?auto_77899 ?auto_77900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77904 - BLOCK
      ?auto_77905 - BLOCK
      ?auto_77906 - BLOCK
      ?auto_77907 - BLOCK
      ?auto_77908 - BLOCK
    )
    :vars
    (
      ?auto_77911 - BLOCK
      ?auto_77910 - BLOCK
      ?auto_77909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77904 ?auto_77905 ) ) ( not ( = ?auto_77904 ?auto_77906 ) ) ( not ( = ?auto_77904 ?auto_77907 ) ) ( not ( = ?auto_77904 ?auto_77908 ) ) ( not ( = ?auto_77905 ?auto_77906 ) ) ( not ( = ?auto_77905 ?auto_77907 ) ) ( not ( = ?auto_77905 ?auto_77908 ) ) ( not ( = ?auto_77906 ?auto_77907 ) ) ( not ( = ?auto_77906 ?auto_77908 ) ) ( not ( = ?auto_77907 ?auto_77908 ) ) ( ON ?auto_77908 ?auto_77911 ) ( not ( = ?auto_77904 ?auto_77911 ) ) ( not ( = ?auto_77905 ?auto_77911 ) ) ( not ( = ?auto_77906 ?auto_77911 ) ) ( not ( = ?auto_77907 ?auto_77911 ) ) ( not ( = ?auto_77908 ?auto_77911 ) ) ( ON ?auto_77907 ?auto_77908 ) ( ON-TABLE ?auto_77910 ) ( ON ?auto_77911 ?auto_77910 ) ( not ( = ?auto_77910 ?auto_77911 ) ) ( not ( = ?auto_77910 ?auto_77908 ) ) ( not ( = ?auto_77910 ?auto_77907 ) ) ( not ( = ?auto_77904 ?auto_77910 ) ) ( not ( = ?auto_77905 ?auto_77910 ) ) ( not ( = ?auto_77906 ?auto_77910 ) ) ( ON ?auto_77906 ?auto_77907 ) ( ON ?auto_77904 ?auto_77909 ) ( CLEAR ?auto_77904 ) ( not ( = ?auto_77904 ?auto_77909 ) ) ( not ( = ?auto_77905 ?auto_77909 ) ) ( not ( = ?auto_77906 ?auto_77909 ) ) ( not ( = ?auto_77907 ?auto_77909 ) ) ( not ( = ?auto_77908 ?auto_77909 ) ) ( not ( = ?auto_77911 ?auto_77909 ) ) ( not ( = ?auto_77910 ?auto_77909 ) ) ( HOLDING ?auto_77905 ) ( CLEAR ?auto_77906 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77910 ?auto_77911 ?auto_77908 ?auto_77907 ?auto_77906 ?auto_77905 )
      ( MAKE-5PILE ?auto_77904 ?auto_77905 ?auto_77906 ?auto_77907 ?auto_77908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77912 - BLOCK
      ?auto_77913 - BLOCK
      ?auto_77914 - BLOCK
      ?auto_77915 - BLOCK
      ?auto_77916 - BLOCK
    )
    :vars
    (
      ?auto_77919 - BLOCK
      ?auto_77917 - BLOCK
      ?auto_77918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77912 ?auto_77913 ) ) ( not ( = ?auto_77912 ?auto_77914 ) ) ( not ( = ?auto_77912 ?auto_77915 ) ) ( not ( = ?auto_77912 ?auto_77916 ) ) ( not ( = ?auto_77913 ?auto_77914 ) ) ( not ( = ?auto_77913 ?auto_77915 ) ) ( not ( = ?auto_77913 ?auto_77916 ) ) ( not ( = ?auto_77914 ?auto_77915 ) ) ( not ( = ?auto_77914 ?auto_77916 ) ) ( not ( = ?auto_77915 ?auto_77916 ) ) ( ON ?auto_77916 ?auto_77919 ) ( not ( = ?auto_77912 ?auto_77919 ) ) ( not ( = ?auto_77913 ?auto_77919 ) ) ( not ( = ?auto_77914 ?auto_77919 ) ) ( not ( = ?auto_77915 ?auto_77919 ) ) ( not ( = ?auto_77916 ?auto_77919 ) ) ( ON ?auto_77915 ?auto_77916 ) ( ON-TABLE ?auto_77917 ) ( ON ?auto_77919 ?auto_77917 ) ( not ( = ?auto_77917 ?auto_77919 ) ) ( not ( = ?auto_77917 ?auto_77916 ) ) ( not ( = ?auto_77917 ?auto_77915 ) ) ( not ( = ?auto_77912 ?auto_77917 ) ) ( not ( = ?auto_77913 ?auto_77917 ) ) ( not ( = ?auto_77914 ?auto_77917 ) ) ( ON ?auto_77914 ?auto_77915 ) ( ON ?auto_77912 ?auto_77918 ) ( not ( = ?auto_77912 ?auto_77918 ) ) ( not ( = ?auto_77913 ?auto_77918 ) ) ( not ( = ?auto_77914 ?auto_77918 ) ) ( not ( = ?auto_77915 ?auto_77918 ) ) ( not ( = ?auto_77916 ?auto_77918 ) ) ( not ( = ?auto_77919 ?auto_77918 ) ) ( not ( = ?auto_77917 ?auto_77918 ) ) ( CLEAR ?auto_77914 ) ( ON ?auto_77913 ?auto_77912 ) ( CLEAR ?auto_77913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_77918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77918 ?auto_77912 )
      ( MAKE-5PILE ?auto_77912 ?auto_77913 ?auto_77914 ?auto_77915 ?auto_77916 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77920 - BLOCK
      ?auto_77921 - BLOCK
      ?auto_77922 - BLOCK
      ?auto_77923 - BLOCK
      ?auto_77924 - BLOCK
    )
    :vars
    (
      ?auto_77926 - BLOCK
      ?auto_77927 - BLOCK
      ?auto_77925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77920 ?auto_77921 ) ) ( not ( = ?auto_77920 ?auto_77922 ) ) ( not ( = ?auto_77920 ?auto_77923 ) ) ( not ( = ?auto_77920 ?auto_77924 ) ) ( not ( = ?auto_77921 ?auto_77922 ) ) ( not ( = ?auto_77921 ?auto_77923 ) ) ( not ( = ?auto_77921 ?auto_77924 ) ) ( not ( = ?auto_77922 ?auto_77923 ) ) ( not ( = ?auto_77922 ?auto_77924 ) ) ( not ( = ?auto_77923 ?auto_77924 ) ) ( ON ?auto_77924 ?auto_77926 ) ( not ( = ?auto_77920 ?auto_77926 ) ) ( not ( = ?auto_77921 ?auto_77926 ) ) ( not ( = ?auto_77922 ?auto_77926 ) ) ( not ( = ?auto_77923 ?auto_77926 ) ) ( not ( = ?auto_77924 ?auto_77926 ) ) ( ON ?auto_77923 ?auto_77924 ) ( ON-TABLE ?auto_77927 ) ( ON ?auto_77926 ?auto_77927 ) ( not ( = ?auto_77927 ?auto_77926 ) ) ( not ( = ?auto_77927 ?auto_77924 ) ) ( not ( = ?auto_77927 ?auto_77923 ) ) ( not ( = ?auto_77920 ?auto_77927 ) ) ( not ( = ?auto_77921 ?auto_77927 ) ) ( not ( = ?auto_77922 ?auto_77927 ) ) ( ON ?auto_77920 ?auto_77925 ) ( not ( = ?auto_77920 ?auto_77925 ) ) ( not ( = ?auto_77921 ?auto_77925 ) ) ( not ( = ?auto_77922 ?auto_77925 ) ) ( not ( = ?auto_77923 ?auto_77925 ) ) ( not ( = ?auto_77924 ?auto_77925 ) ) ( not ( = ?auto_77926 ?auto_77925 ) ) ( not ( = ?auto_77927 ?auto_77925 ) ) ( ON ?auto_77921 ?auto_77920 ) ( CLEAR ?auto_77921 ) ( ON-TABLE ?auto_77925 ) ( HOLDING ?auto_77922 ) ( CLEAR ?auto_77923 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77927 ?auto_77926 ?auto_77924 ?auto_77923 ?auto_77922 )
      ( MAKE-5PILE ?auto_77920 ?auto_77921 ?auto_77922 ?auto_77923 ?auto_77924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77928 - BLOCK
      ?auto_77929 - BLOCK
      ?auto_77930 - BLOCK
      ?auto_77931 - BLOCK
      ?auto_77932 - BLOCK
    )
    :vars
    (
      ?auto_77935 - BLOCK
      ?auto_77934 - BLOCK
      ?auto_77933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77928 ?auto_77929 ) ) ( not ( = ?auto_77928 ?auto_77930 ) ) ( not ( = ?auto_77928 ?auto_77931 ) ) ( not ( = ?auto_77928 ?auto_77932 ) ) ( not ( = ?auto_77929 ?auto_77930 ) ) ( not ( = ?auto_77929 ?auto_77931 ) ) ( not ( = ?auto_77929 ?auto_77932 ) ) ( not ( = ?auto_77930 ?auto_77931 ) ) ( not ( = ?auto_77930 ?auto_77932 ) ) ( not ( = ?auto_77931 ?auto_77932 ) ) ( ON ?auto_77932 ?auto_77935 ) ( not ( = ?auto_77928 ?auto_77935 ) ) ( not ( = ?auto_77929 ?auto_77935 ) ) ( not ( = ?auto_77930 ?auto_77935 ) ) ( not ( = ?auto_77931 ?auto_77935 ) ) ( not ( = ?auto_77932 ?auto_77935 ) ) ( ON ?auto_77931 ?auto_77932 ) ( ON-TABLE ?auto_77934 ) ( ON ?auto_77935 ?auto_77934 ) ( not ( = ?auto_77934 ?auto_77935 ) ) ( not ( = ?auto_77934 ?auto_77932 ) ) ( not ( = ?auto_77934 ?auto_77931 ) ) ( not ( = ?auto_77928 ?auto_77934 ) ) ( not ( = ?auto_77929 ?auto_77934 ) ) ( not ( = ?auto_77930 ?auto_77934 ) ) ( ON ?auto_77928 ?auto_77933 ) ( not ( = ?auto_77928 ?auto_77933 ) ) ( not ( = ?auto_77929 ?auto_77933 ) ) ( not ( = ?auto_77930 ?auto_77933 ) ) ( not ( = ?auto_77931 ?auto_77933 ) ) ( not ( = ?auto_77932 ?auto_77933 ) ) ( not ( = ?auto_77935 ?auto_77933 ) ) ( not ( = ?auto_77934 ?auto_77933 ) ) ( ON ?auto_77929 ?auto_77928 ) ( ON-TABLE ?auto_77933 ) ( CLEAR ?auto_77931 ) ( ON ?auto_77930 ?auto_77929 ) ( CLEAR ?auto_77930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77933 ?auto_77928 ?auto_77929 )
      ( MAKE-5PILE ?auto_77928 ?auto_77929 ?auto_77930 ?auto_77931 ?auto_77932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77936 - BLOCK
      ?auto_77937 - BLOCK
      ?auto_77938 - BLOCK
      ?auto_77939 - BLOCK
      ?auto_77940 - BLOCK
    )
    :vars
    (
      ?auto_77943 - BLOCK
      ?auto_77942 - BLOCK
      ?auto_77941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77936 ?auto_77937 ) ) ( not ( = ?auto_77936 ?auto_77938 ) ) ( not ( = ?auto_77936 ?auto_77939 ) ) ( not ( = ?auto_77936 ?auto_77940 ) ) ( not ( = ?auto_77937 ?auto_77938 ) ) ( not ( = ?auto_77937 ?auto_77939 ) ) ( not ( = ?auto_77937 ?auto_77940 ) ) ( not ( = ?auto_77938 ?auto_77939 ) ) ( not ( = ?auto_77938 ?auto_77940 ) ) ( not ( = ?auto_77939 ?auto_77940 ) ) ( ON ?auto_77940 ?auto_77943 ) ( not ( = ?auto_77936 ?auto_77943 ) ) ( not ( = ?auto_77937 ?auto_77943 ) ) ( not ( = ?auto_77938 ?auto_77943 ) ) ( not ( = ?auto_77939 ?auto_77943 ) ) ( not ( = ?auto_77940 ?auto_77943 ) ) ( ON-TABLE ?auto_77942 ) ( ON ?auto_77943 ?auto_77942 ) ( not ( = ?auto_77942 ?auto_77943 ) ) ( not ( = ?auto_77942 ?auto_77940 ) ) ( not ( = ?auto_77942 ?auto_77939 ) ) ( not ( = ?auto_77936 ?auto_77942 ) ) ( not ( = ?auto_77937 ?auto_77942 ) ) ( not ( = ?auto_77938 ?auto_77942 ) ) ( ON ?auto_77936 ?auto_77941 ) ( not ( = ?auto_77936 ?auto_77941 ) ) ( not ( = ?auto_77937 ?auto_77941 ) ) ( not ( = ?auto_77938 ?auto_77941 ) ) ( not ( = ?auto_77939 ?auto_77941 ) ) ( not ( = ?auto_77940 ?auto_77941 ) ) ( not ( = ?auto_77943 ?auto_77941 ) ) ( not ( = ?auto_77942 ?auto_77941 ) ) ( ON ?auto_77937 ?auto_77936 ) ( ON-TABLE ?auto_77941 ) ( ON ?auto_77938 ?auto_77937 ) ( CLEAR ?auto_77938 ) ( HOLDING ?auto_77939 ) ( CLEAR ?auto_77940 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77942 ?auto_77943 ?auto_77940 ?auto_77939 )
      ( MAKE-5PILE ?auto_77936 ?auto_77937 ?auto_77938 ?auto_77939 ?auto_77940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77944 - BLOCK
      ?auto_77945 - BLOCK
      ?auto_77946 - BLOCK
      ?auto_77947 - BLOCK
      ?auto_77948 - BLOCK
    )
    :vars
    (
      ?auto_77951 - BLOCK
      ?auto_77949 - BLOCK
      ?auto_77950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77944 ?auto_77945 ) ) ( not ( = ?auto_77944 ?auto_77946 ) ) ( not ( = ?auto_77944 ?auto_77947 ) ) ( not ( = ?auto_77944 ?auto_77948 ) ) ( not ( = ?auto_77945 ?auto_77946 ) ) ( not ( = ?auto_77945 ?auto_77947 ) ) ( not ( = ?auto_77945 ?auto_77948 ) ) ( not ( = ?auto_77946 ?auto_77947 ) ) ( not ( = ?auto_77946 ?auto_77948 ) ) ( not ( = ?auto_77947 ?auto_77948 ) ) ( ON ?auto_77948 ?auto_77951 ) ( not ( = ?auto_77944 ?auto_77951 ) ) ( not ( = ?auto_77945 ?auto_77951 ) ) ( not ( = ?auto_77946 ?auto_77951 ) ) ( not ( = ?auto_77947 ?auto_77951 ) ) ( not ( = ?auto_77948 ?auto_77951 ) ) ( ON-TABLE ?auto_77949 ) ( ON ?auto_77951 ?auto_77949 ) ( not ( = ?auto_77949 ?auto_77951 ) ) ( not ( = ?auto_77949 ?auto_77948 ) ) ( not ( = ?auto_77949 ?auto_77947 ) ) ( not ( = ?auto_77944 ?auto_77949 ) ) ( not ( = ?auto_77945 ?auto_77949 ) ) ( not ( = ?auto_77946 ?auto_77949 ) ) ( ON ?auto_77944 ?auto_77950 ) ( not ( = ?auto_77944 ?auto_77950 ) ) ( not ( = ?auto_77945 ?auto_77950 ) ) ( not ( = ?auto_77946 ?auto_77950 ) ) ( not ( = ?auto_77947 ?auto_77950 ) ) ( not ( = ?auto_77948 ?auto_77950 ) ) ( not ( = ?auto_77951 ?auto_77950 ) ) ( not ( = ?auto_77949 ?auto_77950 ) ) ( ON ?auto_77945 ?auto_77944 ) ( ON-TABLE ?auto_77950 ) ( ON ?auto_77946 ?auto_77945 ) ( CLEAR ?auto_77948 ) ( ON ?auto_77947 ?auto_77946 ) ( CLEAR ?auto_77947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_77950 ?auto_77944 ?auto_77945 ?auto_77946 )
      ( MAKE-5PILE ?auto_77944 ?auto_77945 ?auto_77946 ?auto_77947 ?auto_77948 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77952 - BLOCK
      ?auto_77953 - BLOCK
      ?auto_77954 - BLOCK
      ?auto_77955 - BLOCK
      ?auto_77956 - BLOCK
    )
    :vars
    (
      ?auto_77958 - BLOCK
      ?auto_77957 - BLOCK
      ?auto_77959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77952 ?auto_77953 ) ) ( not ( = ?auto_77952 ?auto_77954 ) ) ( not ( = ?auto_77952 ?auto_77955 ) ) ( not ( = ?auto_77952 ?auto_77956 ) ) ( not ( = ?auto_77953 ?auto_77954 ) ) ( not ( = ?auto_77953 ?auto_77955 ) ) ( not ( = ?auto_77953 ?auto_77956 ) ) ( not ( = ?auto_77954 ?auto_77955 ) ) ( not ( = ?auto_77954 ?auto_77956 ) ) ( not ( = ?auto_77955 ?auto_77956 ) ) ( not ( = ?auto_77952 ?auto_77958 ) ) ( not ( = ?auto_77953 ?auto_77958 ) ) ( not ( = ?auto_77954 ?auto_77958 ) ) ( not ( = ?auto_77955 ?auto_77958 ) ) ( not ( = ?auto_77956 ?auto_77958 ) ) ( ON-TABLE ?auto_77957 ) ( ON ?auto_77958 ?auto_77957 ) ( not ( = ?auto_77957 ?auto_77958 ) ) ( not ( = ?auto_77957 ?auto_77956 ) ) ( not ( = ?auto_77957 ?auto_77955 ) ) ( not ( = ?auto_77952 ?auto_77957 ) ) ( not ( = ?auto_77953 ?auto_77957 ) ) ( not ( = ?auto_77954 ?auto_77957 ) ) ( ON ?auto_77952 ?auto_77959 ) ( not ( = ?auto_77952 ?auto_77959 ) ) ( not ( = ?auto_77953 ?auto_77959 ) ) ( not ( = ?auto_77954 ?auto_77959 ) ) ( not ( = ?auto_77955 ?auto_77959 ) ) ( not ( = ?auto_77956 ?auto_77959 ) ) ( not ( = ?auto_77958 ?auto_77959 ) ) ( not ( = ?auto_77957 ?auto_77959 ) ) ( ON ?auto_77953 ?auto_77952 ) ( ON-TABLE ?auto_77959 ) ( ON ?auto_77954 ?auto_77953 ) ( ON ?auto_77955 ?auto_77954 ) ( CLEAR ?auto_77955 ) ( HOLDING ?auto_77956 ) ( CLEAR ?auto_77958 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_77957 ?auto_77958 ?auto_77956 )
      ( MAKE-5PILE ?auto_77952 ?auto_77953 ?auto_77954 ?auto_77955 ?auto_77956 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77960 - BLOCK
      ?auto_77961 - BLOCK
      ?auto_77962 - BLOCK
      ?auto_77963 - BLOCK
      ?auto_77964 - BLOCK
    )
    :vars
    (
      ?auto_77967 - BLOCK
      ?auto_77966 - BLOCK
      ?auto_77965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77960 ?auto_77961 ) ) ( not ( = ?auto_77960 ?auto_77962 ) ) ( not ( = ?auto_77960 ?auto_77963 ) ) ( not ( = ?auto_77960 ?auto_77964 ) ) ( not ( = ?auto_77961 ?auto_77962 ) ) ( not ( = ?auto_77961 ?auto_77963 ) ) ( not ( = ?auto_77961 ?auto_77964 ) ) ( not ( = ?auto_77962 ?auto_77963 ) ) ( not ( = ?auto_77962 ?auto_77964 ) ) ( not ( = ?auto_77963 ?auto_77964 ) ) ( not ( = ?auto_77960 ?auto_77967 ) ) ( not ( = ?auto_77961 ?auto_77967 ) ) ( not ( = ?auto_77962 ?auto_77967 ) ) ( not ( = ?auto_77963 ?auto_77967 ) ) ( not ( = ?auto_77964 ?auto_77967 ) ) ( ON-TABLE ?auto_77966 ) ( ON ?auto_77967 ?auto_77966 ) ( not ( = ?auto_77966 ?auto_77967 ) ) ( not ( = ?auto_77966 ?auto_77964 ) ) ( not ( = ?auto_77966 ?auto_77963 ) ) ( not ( = ?auto_77960 ?auto_77966 ) ) ( not ( = ?auto_77961 ?auto_77966 ) ) ( not ( = ?auto_77962 ?auto_77966 ) ) ( ON ?auto_77960 ?auto_77965 ) ( not ( = ?auto_77960 ?auto_77965 ) ) ( not ( = ?auto_77961 ?auto_77965 ) ) ( not ( = ?auto_77962 ?auto_77965 ) ) ( not ( = ?auto_77963 ?auto_77965 ) ) ( not ( = ?auto_77964 ?auto_77965 ) ) ( not ( = ?auto_77967 ?auto_77965 ) ) ( not ( = ?auto_77966 ?auto_77965 ) ) ( ON ?auto_77961 ?auto_77960 ) ( ON-TABLE ?auto_77965 ) ( ON ?auto_77962 ?auto_77961 ) ( ON ?auto_77963 ?auto_77962 ) ( CLEAR ?auto_77967 ) ( ON ?auto_77964 ?auto_77963 ) ( CLEAR ?auto_77964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_77965 ?auto_77960 ?auto_77961 ?auto_77962 ?auto_77963 )
      ( MAKE-5PILE ?auto_77960 ?auto_77961 ?auto_77962 ?auto_77963 ?auto_77964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77968 - BLOCK
      ?auto_77969 - BLOCK
      ?auto_77970 - BLOCK
      ?auto_77971 - BLOCK
      ?auto_77972 - BLOCK
    )
    :vars
    (
      ?auto_77975 - BLOCK
      ?auto_77973 - BLOCK
      ?auto_77974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77968 ?auto_77969 ) ) ( not ( = ?auto_77968 ?auto_77970 ) ) ( not ( = ?auto_77968 ?auto_77971 ) ) ( not ( = ?auto_77968 ?auto_77972 ) ) ( not ( = ?auto_77969 ?auto_77970 ) ) ( not ( = ?auto_77969 ?auto_77971 ) ) ( not ( = ?auto_77969 ?auto_77972 ) ) ( not ( = ?auto_77970 ?auto_77971 ) ) ( not ( = ?auto_77970 ?auto_77972 ) ) ( not ( = ?auto_77971 ?auto_77972 ) ) ( not ( = ?auto_77968 ?auto_77975 ) ) ( not ( = ?auto_77969 ?auto_77975 ) ) ( not ( = ?auto_77970 ?auto_77975 ) ) ( not ( = ?auto_77971 ?auto_77975 ) ) ( not ( = ?auto_77972 ?auto_77975 ) ) ( ON-TABLE ?auto_77973 ) ( not ( = ?auto_77973 ?auto_77975 ) ) ( not ( = ?auto_77973 ?auto_77972 ) ) ( not ( = ?auto_77973 ?auto_77971 ) ) ( not ( = ?auto_77968 ?auto_77973 ) ) ( not ( = ?auto_77969 ?auto_77973 ) ) ( not ( = ?auto_77970 ?auto_77973 ) ) ( ON ?auto_77968 ?auto_77974 ) ( not ( = ?auto_77968 ?auto_77974 ) ) ( not ( = ?auto_77969 ?auto_77974 ) ) ( not ( = ?auto_77970 ?auto_77974 ) ) ( not ( = ?auto_77971 ?auto_77974 ) ) ( not ( = ?auto_77972 ?auto_77974 ) ) ( not ( = ?auto_77975 ?auto_77974 ) ) ( not ( = ?auto_77973 ?auto_77974 ) ) ( ON ?auto_77969 ?auto_77968 ) ( ON-TABLE ?auto_77974 ) ( ON ?auto_77970 ?auto_77969 ) ( ON ?auto_77971 ?auto_77970 ) ( ON ?auto_77972 ?auto_77971 ) ( CLEAR ?auto_77972 ) ( HOLDING ?auto_77975 ) ( CLEAR ?auto_77973 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_77973 ?auto_77975 )
      ( MAKE-5PILE ?auto_77968 ?auto_77969 ?auto_77970 ?auto_77971 ?auto_77972 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77976 - BLOCK
      ?auto_77977 - BLOCK
      ?auto_77978 - BLOCK
      ?auto_77979 - BLOCK
      ?auto_77980 - BLOCK
    )
    :vars
    (
      ?auto_77983 - BLOCK
      ?auto_77982 - BLOCK
      ?auto_77981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77976 ?auto_77977 ) ) ( not ( = ?auto_77976 ?auto_77978 ) ) ( not ( = ?auto_77976 ?auto_77979 ) ) ( not ( = ?auto_77976 ?auto_77980 ) ) ( not ( = ?auto_77977 ?auto_77978 ) ) ( not ( = ?auto_77977 ?auto_77979 ) ) ( not ( = ?auto_77977 ?auto_77980 ) ) ( not ( = ?auto_77978 ?auto_77979 ) ) ( not ( = ?auto_77978 ?auto_77980 ) ) ( not ( = ?auto_77979 ?auto_77980 ) ) ( not ( = ?auto_77976 ?auto_77983 ) ) ( not ( = ?auto_77977 ?auto_77983 ) ) ( not ( = ?auto_77978 ?auto_77983 ) ) ( not ( = ?auto_77979 ?auto_77983 ) ) ( not ( = ?auto_77980 ?auto_77983 ) ) ( ON-TABLE ?auto_77982 ) ( not ( = ?auto_77982 ?auto_77983 ) ) ( not ( = ?auto_77982 ?auto_77980 ) ) ( not ( = ?auto_77982 ?auto_77979 ) ) ( not ( = ?auto_77976 ?auto_77982 ) ) ( not ( = ?auto_77977 ?auto_77982 ) ) ( not ( = ?auto_77978 ?auto_77982 ) ) ( ON ?auto_77976 ?auto_77981 ) ( not ( = ?auto_77976 ?auto_77981 ) ) ( not ( = ?auto_77977 ?auto_77981 ) ) ( not ( = ?auto_77978 ?auto_77981 ) ) ( not ( = ?auto_77979 ?auto_77981 ) ) ( not ( = ?auto_77980 ?auto_77981 ) ) ( not ( = ?auto_77983 ?auto_77981 ) ) ( not ( = ?auto_77982 ?auto_77981 ) ) ( ON ?auto_77977 ?auto_77976 ) ( ON-TABLE ?auto_77981 ) ( ON ?auto_77978 ?auto_77977 ) ( ON ?auto_77979 ?auto_77978 ) ( ON ?auto_77980 ?auto_77979 ) ( CLEAR ?auto_77982 ) ( ON ?auto_77983 ?auto_77980 ) ( CLEAR ?auto_77983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_77981 ?auto_77976 ?auto_77977 ?auto_77978 ?auto_77979 ?auto_77980 )
      ( MAKE-5PILE ?auto_77976 ?auto_77977 ?auto_77978 ?auto_77979 ?auto_77980 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77984 - BLOCK
      ?auto_77985 - BLOCK
      ?auto_77986 - BLOCK
      ?auto_77987 - BLOCK
      ?auto_77988 - BLOCK
    )
    :vars
    (
      ?auto_77989 - BLOCK
      ?auto_77990 - BLOCK
      ?auto_77991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77984 ?auto_77985 ) ) ( not ( = ?auto_77984 ?auto_77986 ) ) ( not ( = ?auto_77984 ?auto_77987 ) ) ( not ( = ?auto_77984 ?auto_77988 ) ) ( not ( = ?auto_77985 ?auto_77986 ) ) ( not ( = ?auto_77985 ?auto_77987 ) ) ( not ( = ?auto_77985 ?auto_77988 ) ) ( not ( = ?auto_77986 ?auto_77987 ) ) ( not ( = ?auto_77986 ?auto_77988 ) ) ( not ( = ?auto_77987 ?auto_77988 ) ) ( not ( = ?auto_77984 ?auto_77989 ) ) ( not ( = ?auto_77985 ?auto_77989 ) ) ( not ( = ?auto_77986 ?auto_77989 ) ) ( not ( = ?auto_77987 ?auto_77989 ) ) ( not ( = ?auto_77988 ?auto_77989 ) ) ( not ( = ?auto_77990 ?auto_77989 ) ) ( not ( = ?auto_77990 ?auto_77988 ) ) ( not ( = ?auto_77990 ?auto_77987 ) ) ( not ( = ?auto_77984 ?auto_77990 ) ) ( not ( = ?auto_77985 ?auto_77990 ) ) ( not ( = ?auto_77986 ?auto_77990 ) ) ( ON ?auto_77984 ?auto_77991 ) ( not ( = ?auto_77984 ?auto_77991 ) ) ( not ( = ?auto_77985 ?auto_77991 ) ) ( not ( = ?auto_77986 ?auto_77991 ) ) ( not ( = ?auto_77987 ?auto_77991 ) ) ( not ( = ?auto_77988 ?auto_77991 ) ) ( not ( = ?auto_77989 ?auto_77991 ) ) ( not ( = ?auto_77990 ?auto_77991 ) ) ( ON ?auto_77985 ?auto_77984 ) ( ON-TABLE ?auto_77991 ) ( ON ?auto_77986 ?auto_77985 ) ( ON ?auto_77987 ?auto_77986 ) ( ON ?auto_77988 ?auto_77987 ) ( ON ?auto_77989 ?auto_77988 ) ( CLEAR ?auto_77989 ) ( HOLDING ?auto_77990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_77990 )
      ( MAKE-5PILE ?auto_77984 ?auto_77985 ?auto_77986 ?auto_77987 ?auto_77988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_77992 - BLOCK
      ?auto_77993 - BLOCK
      ?auto_77994 - BLOCK
      ?auto_77995 - BLOCK
      ?auto_77996 - BLOCK
    )
    :vars
    (
      ?auto_77997 - BLOCK
      ?auto_77998 - BLOCK
      ?auto_77999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_77992 ?auto_77993 ) ) ( not ( = ?auto_77992 ?auto_77994 ) ) ( not ( = ?auto_77992 ?auto_77995 ) ) ( not ( = ?auto_77992 ?auto_77996 ) ) ( not ( = ?auto_77993 ?auto_77994 ) ) ( not ( = ?auto_77993 ?auto_77995 ) ) ( not ( = ?auto_77993 ?auto_77996 ) ) ( not ( = ?auto_77994 ?auto_77995 ) ) ( not ( = ?auto_77994 ?auto_77996 ) ) ( not ( = ?auto_77995 ?auto_77996 ) ) ( not ( = ?auto_77992 ?auto_77997 ) ) ( not ( = ?auto_77993 ?auto_77997 ) ) ( not ( = ?auto_77994 ?auto_77997 ) ) ( not ( = ?auto_77995 ?auto_77997 ) ) ( not ( = ?auto_77996 ?auto_77997 ) ) ( not ( = ?auto_77998 ?auto_77997 ) ) ( not ( = ?auto_77998 ?auto_77996 ) ) ( not ( = ?auto_77998 ?auto_77995 ) ) ( not ( = ?auto_77992 ?auto_77998 ) ) ( not ( = ?auto_77993 ?auto_77998 ) ) ( not ( = ?auto_77994 ?auto_77998 ) ) ( ON ?auto_77992 ?auto_77999 ) ( not ( = ?auto_77992 ?auto_77999 ) ) ( not ( = ?auto_77993 ?auto_77999 ) ) ( not ( = ?auto_77994 ?auto_77999 ) ) ( not ( = ?auto_77995 ?auto_77999 ) ) ( not ( = ?auto_77996 ?auto_77999 ) ) ( not ( = ?auto_77997 ?auto_77999 ) ) ( not ( = ?auto_77998 ?auto_77999 ) ) ( ON ?auto_77993 ?auto_77992 ) ( ON-TABLE ?auto_77999 ) ( ON ?auto_77994 ?auto_77993 ) ( ON ?auto_77995 ?auto_77994 ) ( ON ?auto_77996 ?auto_77995 ) ( ON ?auto_77997 ?auto_77996 ) ( ON ?auto_77998 ?auto_77997 ) ( CLEAR ?auto_77998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_77999 ?auto_77992 ?auto_77993 ?auto_77994 ?auto_77995 ?auto_77996 ?auto_77997 )
      ( MAKE-5PILE ?auto_77992 ?auto_77993 ?auto_77994 ?auto_77995 ?auto_77996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78001 - BLOCK
    )
    :vars
    (
      ?auto_78002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78002 ?auto_78001 ) ( CLEAR ?auto_78002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78001 ) ( not ( = ?auto_78001 ?auto_78002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78002 ?auto_78001 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78003 - BLOCK
    )
    :vars
    (
      ?auto_78004 - BLOCK
      ?auto_78005 - BLOCK
      ?auto_78006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78004 ?auto_78003 ) ( CLEAR ?auto_78004 ) ( ON-TABLE ?auto_78003 ) ( not ( = ?auto_78003 ?auto_78004 ) ) ( HOLDING ?auto_78005 ) ( CLEAR ?auto_78006 ) ( not ( = ?auto_78003 ?auto_78005 ) ) ( not ( = ?auto_78003 ?auto_78006 ) ) ( not ( = ?auto_78004 ?auto_78005 ) ) ( not ( = ?auto_78004 ?auto_78006 ) ) ( not ( = ?auto_78005 ?auto_78006 ) ) )
    :subtasks
    ( ( !STACK ?auto_78005 ?auto_78006 )
      ( MAKE-1PILE ?auto_78003 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78007 - BLOCK
    )
    :vars
    (
      ?auto_78008 - BLOCK
      ?auto_78009 - BLOCK
      ?auto_78010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78008 ?auto_78007 ) ( ON-TABLE ?auto_78007 ) ( not ( = ?auto_78007 ?auto_78008 ) ) ( CLEAR ?auto_78009 ) ( not ( = ?auto_78007 ?auto_78010 ) ) ( not ( = ?auto_78007 ?auto_78009 ) ) ( not ( = ?auto_78008 ?auto_78010 ) ) ( not ( = ?auto_78008 ?auto_78009 ) ) ( not ( = ?auto_78010 ?auto_78009 ) ) ( ON ?auto_78010 ?auto_78008 ) ( CLEAR ?auto_78010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78007 ?auto_78008 )
      ( MAKE-1PILE ?auto_78007 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78011 - BLOCK
    )
    :vars
    (
      ?auto_78013 - BLOCK
      ?auto_78014 - BLOCK
      ?auto_78012 - BLOCK
      ?auto_78015 - BLOCK
      ?auto_78016 - BLOCK
      ?auto_78017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78013 ?auto_78011 ) ( ON-TABLE ?auto_78011 ) ( not ( = ?auto_78011 ?auto_78013 ) ) ( not ( = ?auto_78011 ?auto_78014 ) ) ( not ( = ?auto_78011 ?auto_78012 ) ) ( not ( = ?auto_78013 ?auto_78014 ) ) ( not ( = ?auto_78013 ?auto_78012 ) ) ( not ( = ?auto_78014 ?auto_78012 ) ) ( ON ?auto_78014 ?auto_78013 ) ( CLEAR ?auto_78014 ) ( HOLDING ?auto_78012 ) ( CLEAR ?auto_78015 ) ( ON-TABLE ?auto_78016 ) ( ON ?auto_78017 ?auto_78016 ) ( ON ?auto_78015 ?auto_78017 ) ( not ( = ?auto_78016 ?auto_78017 ) ) ( not ( = ?auto_78016 ?auto_78015 ) ) ( not ( = ?auto_78016 ?auto_78012 ) ) ( not ( = ?auto_78017 ?auto_78015 ) ) ( not ( = ?auto_78017 ?auto_78012 ) ) ( not ( = ?auto_78015 ?auto_78012 ) ) ( not ( = ?auto_78011 ?auto_78015 ) ) ( not ( = ?auto_78011 ?auto_78016 ) ) ( not ( = ?auto_78011 ?auto_78017 ) ) ( not ( = ?auto_78013 ?auto_78015 ) ) ( not ( = ?auto_78013 ?auto_78016 ) ) ( not ( = ?auto_78013 ?auto_78017 ) ) ( not ( = ?auto_78014 ?auto_78015 ) ) ( not ( = ?auto_78014 ?auto_78016 ) ) ( not ( = ?auto_78014 ?auto_78017 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78016 ?auto_78017 ?auto_78015 ?auto_78012 )
      ( MAKE-1PILE ?auto_78011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78018 - BLOCK
    )
    :vars
    (
      ?auto_78019 - BLOCK
      ?auto_78020 - BLOCK
      ?auto_78021 - BLOCK
      ?auto_78022 - BLOCK
      ?auto_78023 - BLOCK
      ?auto_78024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78019 ?auto_78018 ) ( ON-TABLE ?auto_78018 ) ( not ( = ?auto_78018 ?auto_78019 ) ) ( not ( = ?auto_78018 ?auto_78020 ) ) ( not ( = ?auto_78018 ?auto_78021 ) ) ( not ( = ?auto_78019 ?auto_78020 ) ) ( not ( = ?auto_78019 ?auto_78021 ) ) ( not ( = ?auto_78020 ?auto_78021 ) ) ( ON ?auto_78020 ?auto_78019 ) ( CLEAR ?auto_78022 ) ( ON-TABLE ?auto_78023 ) ( ON ?auto_78024 ?auto_78023 ) ( ON ?auto_78022 ?auto_78024 ) ( not ( = ?auto_78023 ?auto_78024 ) ) ( not ( = ?auto_78023 ?auto_78022 ) ) ( not ( = ?auto_78023 ?auto_78021 ) ) ( not ( = ?auto_78024 ?auto_78022 ) ) ( not ( = ?auto_78024 ?auto_78021 ) ) ( not ( = ?auto_78022 ?auto_78021 ) ) ( not ( = ?auto_78018 ?auto_78022 ) ) ( not ( = ?auto_78018 ?auto_78023 ) ) ( not ( = ?auto_78018 ?auto_78024 ) ) ( not ( = ?auto_78019 ?auto_78022 ) ) ( not ( = ?auto_78019 ?auto_78023 ) ) ( not ( = ?auto_78019 ?auto_78024 ) ) ( not ( = ?auto_78020 ?auto_78022 ) ) ( not ( = ?auto_78020 ?auto_78023 ) ) ( not ( = ?auto_78020 ?auto_78024 ) ) ( ON ?auto_78021 ?auto_78020 ) ( CLEAR ?auto_78021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78018 ?auto_78019 ?auto_78020 )
      ( MAKE-1PILE ?auto_78018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78025 - BLOCK
    )
    :vars
    (
      ?auto_78031 - BLOCK
      ?auto_78030 - BLOCK
      ?auto_78028 - BLOCK
      ?auto_78027 - BLOCK
      ?auto_78026 - BLOCK
      ?auto_78029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78031 ?auto_78025 ) ( ON-TABLE ?auto_78025 ) ( not ( = ?auto_78025 ?auto_78031 ) ) ( not ( = ?auto_78025 ?auto_78030 ) ) ( not ( = ?auto_78025 ?auto_78028 ) ) ( not ( = ?auto_78031 ?auto_78030 ) ) ( not ( = ?auto_78031 ?auto_78028 ) ) ( not ( = ?auto_78030 ?auto_78028 ) ) ( ON ?auto_78030 ?auto_78031 ) ( ON-TABLE ?auto_78027 ) ( ON ?auto_78026 ?auto_78027 ) ( not ( = ?auto_78027 ?auto_78026 ) ) ( not ( = ?auto_78027 ?auto_78029 ) ) ( not ( = ?auto_78027 ?auto_78028 ) ) ( not ( = ?auto_78026 ?auto_78029 ) ) ( not ( = ?auto_78026 ?auto_78028 ) ) ( not ( = ?auto_78029 ?auto_78028 ) ) ( not ( = ?auto_78025 ?auto_78029 ) ) ( not ( = ?auto_78025 ?auto_78027 ) ) ( not ( = ?auto_78025 ?auto_78026 ) ) ( not ( = ?auto_78031 ?auto_78029 ) ) ( not ( = ?auto_78031 ?auto_78027 ) ) ( not ( = ?auto_78031 ?auto_78026 ) ) ( not ( = ?auto_78030 ?auto_78029 ) ) ( not ( = ?auto_78030 ?auto_78027 ) ) ( not ( = ?auto_78030 ?auto_78026 ) ) ( ON ?auto_78028 ?auto_78030 ) ( CLEAR ?auto_78028 ) ( HOLDING ?auto_78029 ) ( CLEAR ?auto_78026 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78027 ?auto_78026 ?auto_78029 )
      ( MAKE-1PILE ?auto_78025 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78032 - BLOCK
    )
    :vars
    (
      ?auto_78036 - BLOCK
      ?auto_78035 - BLOCK
      ?auto_78037 - BLOCK
      ?auto_78034 - BLOCK
      ?auto_78033 - BLOCK
      ?auto_78038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78036 ?auto_78032 ) ( ON-TABLE ?auto_78032 ) ( not ( = ?auto_78032 ?auto_78036 ) ) ( not ( = ?auto_78032 ?auto_78035 ) ) ( not ( = ?auto_78032 ?auto_78037 ) ) ( not ( = ?auto_78036 ?auto_78035 ) ) ( not ( = ?auto_78036 ?auto_78037 ) ) ( not ( = ?auto_78035 ?auto_78037 ) ) ( ON ?auto_78035 ?auto_78036 ) ( ON-TABLE ?auto_78034 ) ( ON ?auto_78033 ?auto_78034 ) ( not ( = ?auto_78034 ?auto_78033 ) ) ( not ( = ?auto_78034 ?auto_78038 ) ) ( not ( = ?auto_78034 ?auto_78037 ) ) ( not ( = ?auto_78033 ?auto_78038 ) ) ( not ( = ?auto_78033 ?auto_78037 ) ) ( not ( = ?auto_78038 ?auto_78037 ) ) ( not ( = ?auto_78032 ?auto_78038 ) ) ( not ( = ?auto_78032 ?auto_78034 ) ) ( not ( = ?auto_78032 ?auto_78033 ) ) ( not ( = ?auto_78036 ?auto_78038 ) ) ( not ( = ?auto_78036 ?auto_78034 ) ) ( not ( = ?auto_78036 ?auto_78033 ) ) ( not ( = ?auto_78035 ?auto_78038 ) ) ( not ( = ?auto_78035 ?auto_78034 ) ) ( not ( = ?auto_78035 ?auto_78033 ) ) ( ON ?auto_78037 ?auto_78035 ) ( CLEAR ?auto_78033 ) ( ON ?auto_78038 ?auto_78037 ) ( CLEAR ?auto_78038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78032 ?auto_78036 ?auto_78035 ?auto_78037 )
      ( MAKE-1PILE ?auto_78032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78039 - BLOCK
    )
    :vars
    (
      ?auto_78040 - BLOCK
      ?auto_78041 - BLOCK
      ?auto_78042 - BLOCK
      ?auto_78044 - BLOCK
      ?auto_78045 - BLOCK
      ?auto_78043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78040 ?auto_78039 ) ( ON-TABLE ?auto_78039 ) ( not ( = ?auto_78039 ?auto_78040 ) ) ( not ( = ?auto_78039 ?auto_78041 ) ) ( not ( = ?auto_78039 ?auto_78042 ) ) ( not ( = ?auto_78040 ?auto_78041 ) ) ( not ( = ?auto_78040 ?auto_78042 ) ) ( not ( = ?auto_78041 ?auto_78042 ) ) ( ON ?auto_78041 ?auto_78040 ) ( ON-TABLE ?auto_78044 ) ( not ( = ?auto_78044 ?auto_78045 ) ) ( not ( = ?auto_78044 ?auto_78043 ) ) ( not ( = ?auto_78044 ?auto_78042 ) ) ( not ( = ?auto_78045 ?auto_78043 ) ) ( not ( = ?auto_78045 ?auto_78042 ) ) ( not ( = ?auto_78043 ?auto_78042 ) ) ( not ( = ?auto_78039 ?auto_78043 ) ) ( not ( = ?auto_78039 ?auto_78044 ) ) ( not ( = ?auto_78039 ?auto_78045 ) ) ( not ( = ?auto_78040 ?auto_78043 ) ) ( not ( = ?auto_78040 ?auto_78044 ) ) ( not ( = ?auto_78040 ?auto_78045 ) ) ( not ( = ?auto_78041 ?auto_78043 ) ) ( not ( = ?auto_78041 ?auto_78044 ) ) ( not ( = ?auto_78041 ?auto_78045 ) ) ( ON ?auto_78042 ?auto_78041 ) ( ON ?auto_78043 ?auto_78042 ) ( CLEAR ?auto_78043 ) ( HOLDING ?auto_78045 ) ( CLEAR ?auto_78044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78044 ?auto_78045 )
      ( MAKE-1PILE ?auto_78039 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78046 - BLOCK
    )
    :vars
    (
      ?auto_78051 - BLOCK
      ?auto_78048 - BLOCK
      ?auto_78049 - BLOCK
      ?auto_78052 - BLOCK
      ?auto_78047 - BLOCK
      ?auto_78050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78051 ?auto_78046 ) ( ON-TABLE ?auto_78046 ) ( not ( = ?auto_78046 ?auto_78051 ) ) ( not ( = ?auto_78046 ?auto_78048 ) ) ( not ( = ?auto_78046 ?auto_78049 ) ) ( not ( = ?auto_78051 ?auto_78048 ) ) ( not ( = ?auto_78051 ?auto_78049 ) ) ( not ( = ?auto_78048 ?auto_78049 ) ) ( ON ?auto_78048 ?auto_78051 ) ( ON-TABLE ?auto_78052 ) ( not ( = ?auto_78052 ?auto_78047 ) ) ( not ( = ?auto_78052 ?auto_78050 ) ) ( not ( = ?auto_78052 ?auto_78049 ) ) ( not ( = ?auto_78047 ?auto_78050 ) ) ( not ( = ?auto_78047 ?auto_78049 ) ) ( not ( = ?auto_78050 ?auto_78049 ) ) ( not ( = ?auto_78046 ?auto_78050 ) ) ( not ( = ?auto_78046 ?auto_78052 ) ) ( not ( = ?auto_78046 ?auto_78047 ) ) ( not ( = ?auto_78051 ?auto_78050 ) ) ( not ( = ?auto_78051 ?auto_78052 ) ) ( not ( = ?auto_78051 ?auto_78047 ) ) ( not ( = ?auto_78048 ?auto_78050 ) ) ( not ( = ?auto_78048 ?auto_78052 ) ) ( not ( = ?auto_78048 ?auto_78047 ) ) ( ON ?auto_78049 ?auto_78048 ) ( ON ?auto_78050 ?auto_78049 ) ( CLEAR ?auto_78052 ) ( ON ?auto_78047 ?auto_78050 ) ( CLEAR ?auto_78047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78046 ?auto_78051 ?auto_78048 ?auto_78049 ?auto_78050 )
      ( MAKE-1PILE ?auto_78046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78053 - BLOCK
    )
    :vars
    (
      ?auto_78054 - BLOCK
      ?auto_78058 - BLOCK
      ?auto_78055 - BLOCK
      ?auto_78057 - BLOCK
      ?auto_78059 - BLOCK
      ?auto_78056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78054 ?auto_78053 ) ( ON-TABLE ?auto_78053 ) ( not ( = ?auto_78053 ?auto_78054 ) ) ( not ( = ?auto_78053 ?auto_78058 ) ) ( not ( = ?auto_78053 ?auto_78055 ) ) ( not ( = ?auto_78054 ?auto_78058 ) ) ( not ( = ?auto_78054 ?auto_78055 ) ) ( not ( = ?auto_78058 ?auto_78055 ) ) ( ON ?auto_78058 ?auto_78054 ) ( not ( = ?auto_78057 ?auto_78059 ) ) ( not ( = ?auto_78057 ?auto_78056 ) ) ( not ( = ?auto_78057 ?auto_78055 ) ) ( not ( = ?auto_78059 ?auto_78056 ) ) ( not ( = ?auto_78059 ?auto_78055 ) ) ( not ( = ?auto_78056 ?auto_78055 ) ) ( not ( = ?auto_78053 ?auto_78056 ) ) ( not ( = ?auto_78053 ?auto_78057 ) ) ( not ( = ?auto_78053 ?auto_78059 ) ) ( not ( = ?auto_78054 ?auto_78056 ) ) ( not ( = ?auto_78054 ?auto_78057 ) ) ( not ( = ?auto_78054 ?auto_78059 ) ) ( not ( = ?auto_78058 ?auto_78056 ) ) ( not ( = ?auto_78058 ?auto_78057 ) ) ( not ( = ?auto_78058 ?auto_78059 ) ) ( ON ?auto_78055 ?auto_78058 ) ( ON ?auto_78056 ?auto_78055 ) ( ON ?auto_78059 ?auto_78056 ) ( CLEAR ?auto_78059 ) ( HOLDING ?auto_78057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78057 )
      ( MAKE-1PILE ?auto_78053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78060 - BLOCK
    )
    :vars
    (
      ?auto_78062 - BLOCK
      ?auto_78065 - BLOCK
      ?auto_78063 - BLOCK
      ?auto_78066 - BLOCK
      ?auto_78061 - BLOCK
      ?auto_78064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78062 ?auto_78060 ) ( ON-TABLE ?auto_78060 ) ( not ( = ?auto_78060 ?auto_78062 ) ) ( not ( = ?auto_78060 ?auto_78065 ) ) ( not ( = ?auto_78060 ?auto_78063 ) ) ( not ( = ?auto_78062 ?auto_78065 ) ) ( not ( = ?auto_78062 ?auto_78063 ) ) ( not ( = ?auto_78065 ?auto_78063 ) ) ( ON ?auto_78065 ?auto_78062 ) ( not ( = ?auto_78066 ?auto_78061 ) ) ( not ( = ?auto_78066 ?auto_78064 ) ) ( not ( = ?auto_78066 ?auto_78063 ) ) ( not ( = ?auto_78061 ?auto_78064 ) ) ( not ( = ?auto_78061 ?auto_78063 ) ) ( not ( = ?auto_78064 ?auto_78063 ) ) ( not ( = ?auto_78060 ?auto_78064 ) ) ( not ( = ?auto_78060 ?auto_78066 ) ) ( not ( = ?auto_78060 ?auto_78061 ) ) ( not ( = ?auto_78062 ?auto_78064 ) ) ( not ( = ?auto_78062 ?auto_78066 ) ) ( not ( = ?auto_78062 ?auto_78061 ) ) ( not ( = ?auto_78065 ?auto_78064 ) ) ( not ( = ?auto_78065 ?auto_78066 ) ) ( not ( = ?auto_78065 ?auto_78061 ) ) ( ON ?auto_78063 ?auto_78065 ) ( ON ?auto_78064 ?auto_78063 ) ( ON ?auto_78061 ?auto_78064 ) ( ON ?auto_78066 ?auto_78061 ) ( CLEAR ?auto_78066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78060 ?auto_78062 ?auto_78065 ?auto_78063 ?auto_78064 ?auto_78061 )
      ( MAKE-1PILE ?auto_78060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78067 - BLOCK
    )
    :vars
    (
      ?auto_78069 - BLOCK
      ?auto_78071 - BLOCK
      ?auto_78073 - BLOCK
      ?auto_78070 - BLOCK
      ?auto_78068 - BLOCK
      ?auto_78072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78069 ?auto_78067 ) ( ON-TABLE ?auto_78067 ) ( not ( = ?auto_78067 ?auto_78069 ) ) ( not ( = ?auto_78067 ?auto_78071 ) ) ( not ( = ?auto_78067 ?auto_78073 ) ) ( not ( = ?auto_78069 ?auto_78071 ) ) ( not ( = ?auto_78069 ?auto_78073 ) ) ( not ( = ?auto_78071 ?auto_78073 ) ) ( ON ?auto_78071 ?auto_78069 ) ( not ( = ?auto_78070 ?auto_78068 ) ) ( not ( = ?auto_78070 ?auto_78072 ) ) ( not ( = ?auto_78070 ?auto_78073 ) ) ( not ( = ?auto_78068 ?auto_78072 ) ) ( not ( = ?auto_78068 ?auto_78073 ) ) ( not ( = ?auto_78072 ?auto_78073 ) ) ( not ( = ?auto_78067 ?auto_78072 ) ) ( not ( = ?auto_78067 ?auto_78070 ) ) ( not ( = ?auto_78067 ?auto_78068 ) ) ( not ( = ?auto_78069 ?auto_78072 ) ) ( not ( = ?auto_78069 ?auto_78070 ) ) ( not ( = ?auto_78069 ?auto_78068 ) ) ( not ( = ?auto_78071 ?auto_78072 ) ) ( not ( = ?auto_78071 ?auto_78070 ) ) ( not ( = ?auto_78071 ?auto_78068 ) ) ( ON ?auto_78073 ?auto_78071 ) ( ON ?auto_78072 ?auto_78073 ) ( ON ?auto_78068 ?auto_78072 ) ( HOLDING ?auto_78070 ) ( CLEAR ?auto_78068 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78067 ?auto_78069 ?auto_78071 ?auto_78073 ?auto_78072 ?auto_78068 ?auto_78070 )
      ( MAKE-1PILE ?auto_78067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78074 - BLOCK
    )
    :vars
    (
      ?auto_78075 - BLOCK
      ?auto_78079 - BLOCK
      ?auto_78077 - BLOCK
      ?auto_78080 - BLOCK
      ?auto_78078 - BLOCK
      ?auto_78076 - BLOCK
      ?auto_78081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78075 ?auto_78074 ) ( ON-TABLE ?auto_78074 ) ( not ( = ?auto_78074 ?auto_78075 ) ) ( not ( = ?auto_78074 ?auto_78079 ) ) ( not ( = ?auto_78074 ?auto_78077 ) ) ( not ( = ?auto_78075 ?auto_78079 ) ) ( not ( = ?auto_78075 ?auto_78077 ) ) ( not ( = ?auto_78079 ?auto_78077 ) ) ( ON ?auto_78079 ?auto_78075 ) ( not ( = ?auto_78080 ?auto_78078 ) ) ( not ( = ?auto_78080 ?auto_78076 ) ) ( not ( = ?auto_78080 ?auto_78077 ) ) ( not ( = ?auto_78078 ?auto_78076 ) ) ( not ( = ?auto_78078 ?auto_78077 ) ) ( not ( = ?auto_78076 ?auto_78077 ) ) ( not ( = ?auto_78074 ?auto_78076 ) ) ( not ( = ?auto_78074 ?auto_78080 ) ) ( not ( = ?auto_78074 ?auto_78078 ) ) ( not ( = ?auto_78075 ?auto_78076 ) ) ( not ( = ?auto_78075 ?auto_78080 ) ) ( not ( = ?auto_78075 ?auto_78078 ) ) ( not ( = ?auto_78079 ?auto_78076 ) ) ( not ( = ?auto_78079 ?auto_78080 ) ) ( not ( = ?auto_78079 ?auto_78078 ) ) ( ON ?auto_78077 ?auto_78079 ) ( ON ?auto_78076 ?auto_78077 ) ( ON ?auto_78078 ?auto_78076 ) ( CLEAR ?auto_78078 ) ( ON ?auto_78080 ?auto_78081 ) ( CLEAR ?auto_78080 ) ( HAND-EMPTY ) ( not ( = ?auto_78074 ?auto_78081 ) ) ( not ( = ?auto_78075 ?auto_78081 ) ) ( not ( = ?auto_78079 ?auto_78081 ) ) ( not ( = ?auto_78077 ?auto_78081 ) ) ( not ( = ?auto_78080 ?auto_78081 ) ) ( not ( = ?auto_78078 ?auto_78081 ) ) ( not ( = ?auto_78076 ?auto_78081 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78080 ?auto_78081 )
      ( MAKE-1PILE ?auto_78074 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78082 - BLOCK
    )
    :vars
    (
      ?auto_78089 - BLOCK
      ?auto_78084 - BLOCK
      ?auto_78087 - BLOCK
      ?auto_78086 - BLOCK
      ?auto_78085 - BLOCK
      ?auto_78088 - BLOCK
      ?auto_78083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78089 ?auto_78082 ) ( ON-TABLE ?auto_78082 ) ( not ( = ?auto_78082 ?auto_78089 ) ) ( not ( = ?auto_78082 ?auto_78084 ) ) ( not ( = ?auto_78082 ?auto_78087 ) ) ( not ( = ?auto_78089 ?auto_78084 ) ) ( not ( = ?auto_78089 ?auto_78087 ) ) ( not ( = ?auto_78084 ?auto_78087 ) ) ( ON ?auto_78084 ?auto_78089 ) ( not ( = ?auto_78086 ?auto_78085 ) ) ( not ( = ?auto_78086 ?auto_78088 ) ) ( not ( = ?auto_78086 ?auto_78087 ) ) ( not ( = ?auto_78085 ?auto_78088 ) ) ( not ( = ?auto_78085 ?auto_78087 ) ) ( not ( = ?auto_78088 ?auto_78087 ) ) ( not ( = ?auto_78082 ?auto_78088 ) ) ( not ( = ?auto_78082 ?auto_78086 ) ) ( not ( = ?auto_78082 ?auto_78085 ) ) ( not ( = ?auto_78089 ?auto_78088 ) ) ( not ( = ?auto_78089 ?auto_78086 ) ) ( not ( = ?auto_78089 ?auto_78085 ) ) ( not ( = ?auto_78084 ?auto_78088 ) ) ( not ( = ?auto_78084 ?auto_78086 ) ) ( not ( = ?auto_78084 ?auto_78085 ) ) ( ON ?auto_78087 ?auto_78084 ) ( ON ?auto_78088 ?auto_78087 ) ( ON ?auto_78086 ?auto_78083 ) ( CLEAR ?auto_78086 ) ( not ( = ?auto_78082 ?auto_78083 ) ) ( not ( = ?auto_78089 ?auto_78083 ) ) ( not ( = ?auto_78084 ?auto_78083 ) ) ( not ( = ?auto_78087 ?auto_78083 ) ) ( not ( = ?auto_78086 ?auto_78083 ) ) ( not ( = ?auto_78085 ?auto_78083 ) ) ( not ( = ?auto_78088 ?auto_78083 ) ) ( HOLDING ?auto_78085 ) ( CLEAR ?auto_78088 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78082 ?auto_78089 ?auto_78084 ?auto_78087 ?auto_78088 ?auto_78085 )
      ( MAKE-1PILE ?auto_78082 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78090 - BLOCK
    )
    :vars
    (
      ?auto_78097 - BLOCK
      ?auto_78094 - BLOCK
      ?auto_78096 - BLOCK
      ?auto_78095 - BLOCK
      ?auto_78093 - BLOCK
      ?auto_78091 - BLOCK
      ?auto_78092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78097 ?auto_78090 ) ( ON-TABLE ?auto_78090 ) ( not ( = ?auto_78090 ?auto_78097 ) ) ( not ( = ?auto_78090 ?auto_78094 ) ) ( not ( = ?auto_78090 ?auto_78096 ) ) ( not ( = ?auto_78097 ?auto_78094 ) ) ( not ( = ?auto_78097 ?auto_78096 ) ) ( not ( = ?auto_78094 ?auto_78096 ) ) ( ON ?auto_78094 ?auto_78097 ) ( not ( = ?auto_78095 ?auto_78093 ) ) ( not ( = ?auto_78095 ?auto_78091 ) ) ( not ( = ?auto_78095 ?auto_78096 ) ) ( not ( = ?auto_78093 ?auto_78091 ) ) ( not ( = ?auto_78093 ?auto_78096 ) ) ( not ( = ?auto_78091 ?auto_78096 ) ) ( not ( = ?auto_78090 ?auto_78091 ) ) ( not ( = ?auto_78090 ?auto_78095 ) ) ( not ( = ?auto_78090 ?auto_78093 ) ) ( not ( = ?auto_78097 ?auto_78091 ) ) ( not ( = ?auto_78097 ?auto_78095 ) ) ( not ( = ?auto_78097 ?auto_78093 ) ) ( not ( = ?auto_78094 ?auto_78091 ) ) ( not ( = ?auto_78094 ?auto_78095 ) ) ( not ( = ?auto_78094 ?auto_78093 ) ) ( ON ?auto_78096 ?auto_78094 ) ( ON ?auto_78091 ?auto_78096 ) ( ON ?auto_78095 ?auto_78092 ) ( not ( = ?auto_78090 ?auto_78092 ) ) ( not ( = ?auto_78097 ?auto_78092 ) ) ( not ( = ?auto_78094 ?auto_78092 ) ) ( not ( = ?auto_78096 ?auto_78092 ) ) ( not ( = ?auto_78095 ?auto_78092 ) ) ( not ( = ?auto_78093 ?auto_78092 ) ) ( not ( = ?auto_78091 ?auto_78092 ) ) ( CLEAR ?auto_78091 ) ( ON ?auto_78093 ?auto_78095 ) ( CLEAR ?auto_78093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78092 ?auto_78095 )
      ( MAKE-1PILE ?auto_78090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78098 - BLOCK
    )
    :vars
    (
      ?auto_78104 - BLOCK
      ?auto_78102 - BLOCK
      ?auto_78099 - BLOCK
      ?auto_78105 - BLOCK
      ?auto_78101 - BLOCK
      ?auto_78100 - BLOCK
      ?auto_78103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78104 ?auto_78098 ) ( ON-TABLE ?auto_78098 ) ( not ( = ?auto_78098 ?auto_78104 ) ) ( not ( = ?auto_78098 ?auto_78102 ) ) ( not ( = ?auto_78098 ?auto_78099 ) ) ( not ( = ?auto_78104 ?auto_78102 ) ) ( not ( = ?auto_78104 ?auto_78099 ) ) ( not ( = ?auto_78102 ?auto_78099 ) ) ( ON ?auto_78102 ?auto_78104 ) ( not ( = ?auto_78105 ?auto_78101 ) ) ( not ( = ?auto_78105 ?auto_78100 ) ) ( not ( = ?auto_78105 ?auto_78099 ) ) ( not ( = ?auto_78101 ?auto_78100 ) ) ( not ( = ?auto_78101 ?auto_78099 ) ) ( not ( = ?auto_78100 ?auto_78099 ) ) ( not ( = ?auto_78098 ?auto_78100 ) ) ( not ( = ?auto_78098 ?auto_78105 ) ) ( not ( = ?auto_78098 ?auto_78101 ) ) ( not ( = ?auto_78104 ?auto_78100 ) ) ( not ( = ?auto_78104 ?auto_78105 ) ) ( not ( = ?auto_78104 ?auto_78101 ) ) ( not ( = ?auto_78102 ?auto_78100 ) ) ( not ( = ?auto_78102 ?auto_78105 ) ) ( not ( = ?auto_78102 ?auto_78101 ) ) ( ON ?auto_78099 ?auto_78102 ) ( ON ?auto_78105 ?auto_78103 ) ( not ( = ?auto_78098 ?auto_78103 ) ) ( not ( = ?auto_78104 ?auto_78103 ) ) ( not ( = ?auto_78102 ?auto_78103 ) ) ( not ( = ?auto_78099 ?auto_78103 ) ) ( not ( = ?auto_78105 ?auto_78103 ) ) ( not ( = ?auto_78101 ?auto_78103 ) ) ( not ( = ?auto_78100 ?auto_78103 ) ) ( ON ?auto_78101 ?auto_78105 ) ( CLEAR ?auto_78101 ) ( ON-TABLE ?auto_78103 ) ( HOLDING ?auto_78100 ) ( CLEAR ?auto_78099 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78098 ?auto_78104 ?auto_78102 ?auto_78099 ?auto_78100 )
      ( MAKE-1PILE ?auto_78098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78106 - BLOCK
    )
    :vars
    (
      ?auto_78107 - BLOCK
      ?auto_78110 - BLOCK
      ?auto_78113 - BLOCK
      ?auto_78111 - BLOCK
      ?auto_78108 - BLOCK
      ?auto_78109 - BLOCK
      ?auto_78112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78107 ?auto_78106 ) ( ON-TABLE ?auto_78106 ) ( not ( = ?auto_78106 ?auto_78107 ) ) ( not ( = ?auto_78106 ?auto_78110 ) ) ( not ( = ?auto_78106 ?auto_78113 ) ) ( not ( = ?auto_78107 ?auto_78110 ) ) ( not ( = ?auto_78107 ?auto_78113 ) ) ( not ( = ?auto_78110 ?auto_78113 ) ) ( ON ?auto_78110 ?auto_78107 ) ( not ( = ?auto_78111 ?auto_78108 ) ) ( not ( = ?auto_78111 ?auto_78109 ) ) ( not ( = ?auto_78111 ?auto_78113 ) ) ( not ( = ?auto_78108 ?auto_78109 ) ) ( not ( = ?auto_78108 ?auto_78113 ) ) ( not ( = ?auto_78109 ?auto_78113 ) ) ( not ( = ?auto_78106 ?auto_78109 ) ) ( not ( = ?auto_78106 ?auto_78111 ) ) ( not ( = ?auto_78106 ?auto_78108 ) ) ( not ( = ?auto_78107 ?auto_78109 ) ) ( not ( = ?auto_78107 ?auto_78111 ) ) ( not ( = ?auto_78107 ?auto_78108 ) ) ( not ( = ?auto_78110 ?auto_78109 ) ) ( not ( = ?auto_78110 ?auto_78111 ) ) ( not ( = ?auto_78110 ?auto_78108 ) ) ( ON ?auto_78113 ?auto_78110 ) ( ON ?auto_78111 ?auto_78112 ) ( not ( = ?auto_78106 ?auto_78112 ) ) ( not ( = ?auto_78107 ?auto_78112 ) ) ( not ( = ?auto_78110 ?auto_78112 ) ) ( not ( = ?auto_78113 ?auto_78112 ) ) ( not ( = ?auto_78111 ?auto_78112 ) ) ( not ( = ?auto_78108 ?auto_78112 ) ) ( not ( = ?auto_78109 ?auto_78112 ) ) ( ON ?auto_78108 ?auto_78111 ) ( ON-TABLE ?auto_78112 ) ( CLEAR ?auto_78113 ) ( ON ?auto_78109 ?auto_78108 ) ( CLEAR ?auto_78109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78112 ?auto_78111 ?auto_78108 )
      ( MAKE-1PILE ?auto_78106 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78114 - BLOCK
    )
    :vars
    (
      ?auto_78120 - BLOCK
      ?auto_78115 - BLOCK
      ?auto_78121 - BLOCK
      ?auto_78117 - BLOCK
      ?auto_78116 - BLOCK
      ?auto_78119 - BLOCK
      ?auto_78118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78120 ?auto_78114 ) ( ON-TABLE ?auto_78114 ) ( not ( = ?auto_78114 ?auto_78120 ) ) ( not ( = ?auto_78114 ?auto_78115 ) ) ( not ( = ?auto_78114 ?auto_78121 ) ) ( not ( = ?auto_78120 ?auto_78115 ) ) ( not ( = ?auto_78120 ?auto_78121 ) ) ( not ( = ?auto_78115 ?auto_78121 ) ) ( ON ?auto_78115 ?auto_78120 ) ( not ( = ?auto_78117 ?auto_78116 ) ) ( not ( = ?auto_78117 ?auto_78119 ) ) ( not ( = ?auto_78117 ?auto_78121 ) ) ( not ( = ?auto_78116 ?auto_78119 ) ) ( not ( = ?auto_78116 ?auto_78121 ) ) ( not ( = ?auto_78119 ?auto_78121 ) ) ( not ( = ?auto_78114 ?auto_78119 ) ) ( not ( = ?auto_78114 ?auto_78117 ) ) ( not ( = ?auto_78114 ?auto_78116 ) ) ( not ( = ?auto_78120 ?auto_78119 ) ) ( not ( = ?auto_78120 ?auto_78117 ) ) ( not ( = ?auto_78120 ?auto_78116 ) ) ( not ( = ?auto_78115 ?auto_78119 ) ) ( not ( = ?auto_78115 ?auto_78117 ) ) ( not ( = ?auto_78115 ?auto_78116 ) ) ( ON ?auto_78117 ?auto_78118 ) ( not ( = ?auto_78114 ?auto_78118 ) ) ( not ( = ?auto_78120 ?auto_78118 ) ) ( not ( = ?auto_78115 ?auto_78118 ) ) ( not ( = ?auto_78121 ?auto_78118 ) ) ( not ( = ?auto_78117 ?auto_78118 ) ) ( not ( = ?auto_78116 ?auto_78118 ) ) ( not ( = ?auto_78119 ?auto_78118 ) ) ( ON ?auto_78116 ?auto_78117 ) ( ON-TABLE ?auto_78118 ) ( ON ?auto_78119 ?auto_78116 ) ( CLEAR ?auto_78119 ) ( HOLDING ?auto_78121 ) ( CLEAR ?auto_78115 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78114 ?auto_78120 ?auto_78115 ?auto_78121 )
      ( MAKE-1PILE ?auto_78114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78122 - BLOCK
    )
    :vars
    (
      ?auto_78123 - BLOCK
      ?auto_78124 - BLOCK
      ?auto_78129 - BLOCK
      ?auto_78126 - BLOCK
      ?auto_78125 - BLOCK
      ?auto_78128 - BLOCK
      ?auto_78127 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78123 ?auto_78122 ) ( ON-TABLE ?auto_78122 ) ( not ( = ?auto_78122 ?auto_78123 ) ) ( not ( = ?auto_78122 ?auto_78124 ) ) ( not ( = ?auto_78122 ?auto_78129 ) ) ( not ( = ?auto_78123 ?auto_78124 ) ) ( not ( = ?auto_78123 ?auto_78129 ) ) ( not ( = ?auto_78124 ?auto_78129 ) ) ( ON ?auto_78124 ?auto_78123 ) ( not ( = ?auto_78126 ?auto_78125 ) ) ( not ( = ?auto_78126 ?auto_78128 ) ) ( not ( = ?auto_78126 ?auto_78129 ) ) ( not ( = ?auto_78125 ?auto_78128 ) ) ( not ( = ?auto_78125 ?auto_78129 ) ) ( not ( = ?auto_78128 ?auto_78129 ) ) ( not ( = ?auto_78122 ?auto_78128 ) ) ( not ( = ?auto_78122 ?auto_78126 ) ) ( not ( = ?auto_78122 ?auto_78125 ) ) ( not ( = ?auto_78123 ?auto_78128 ) ) ( not ( = ?auto_78123 ?auto_78126 ) ) ( not ( = ?auto_78123 ?auto_78125 ) ) ( not ( = ?auto_78124 ?auto_78128 ) ) ( not ( = ?auto_78124 ?auto_78126 ) ) ( not ( = ?auto_78124 ?auto_78125 ) ) ( ON ?auto_78126 ?auto_78127 ) ( not ( = ?auto_78122 ?auto_78127 ) ) ( not ( = ?auto_78123 ?auto_78127 ) ) ( not ( = ?auto_78124 ?auto_78127 ) ) ( not ( = ?auto_78129 ?auto_78127 ) ) ( not ( = ?auto_78126 ?auto_78127 ) ) ( not ( = ?auto_78125 ?auto_78127 ) ) ( not ( = ?auto_78128 ?auto_78127 ) ) ( ON ?auto_78125 ?auto_78126 ) ( ON-TABLE ?auto_78127 ) ( ON ?auto_78128 ?auto_78125 ) ( CLEAR ?auto_78124 ) ( ON ?auto_78129 ?auto_78128 ) ( CLEAR ?auto_78129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78127 ?auto_78126 ?auto_78125 ?auto_78128 )
      ( MAKE-1PILE ?auto_78122 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78130 - BLOCK
    )
    :vars
    (
      ?auto_78137 - BLOCK
      ?auto_78135 - BLOCK
      ?auto_78136 - BLOCK
      ?auto_78133 - BLOCK
      ?auto_78131 - BLOCK
      ?auto_78132 - BLOCK
      ?auto_78134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78137 ?auto_78130 ) ( ON-TABLE ?auto_78130 ) ( not ( = ?auto_78130 ?auto_78137 ) ) ( not ( = ?auto_78130 ?auto_78135 ) ) ( not ( = ?auto_78130 ?auto_78136 ) ) ( not ( = ?auto_78137 ?auto_78135 ) ) ( not ( = ?auto_78137 ?auto_78136 ) ) ( not ( = ?auto_78135 ?auto_78136 ) ) ( not ( = ?auto_78133 ?auto_78131 ) ) ( not ( = ?auto_78133 ?auto_78132 ) ) ( not ( = ?auto_78133 ?auto_78136 ) ) ( not ( = ?auto_78131 ?auto_78132 ) ) ( not ( = ?auto_78131 ?auto_78136 ) ) ( not ( = ?auto_78132 ?auto_78136 ) ) ( not ( = ?auto_78130 ?auto_78132 ) ) ( not ( = ?auto_78130 ?auto_78133 ) ) ( not ( = ?auto_78130 ?auto_78131 ) ) ( not ( = ?auto_78137 ?auto_78132 ) ) ( not ( = ?auto_78137 ?auto_78133 ) ) ( not ( = ?auto_78137 ?auto_78131 ) ) ( not ( = ?auto_78135 ?auto_78132 ) ) ( not ( = ?auto_78135 ?auto_78133 ) ) ( not ( = ?auto_78135 ?auto_78131 ) ) ( ON ?auto_78133 ?auto_78134 ) ( not ( = ?auto_78130 ?auto_78134 ) ) ( not ( = ?auto_78137 ?auto_78134 ) ) ( not ( = ?auto_78135 ?auto_78134 ) ) ( not ( = ?auto_78136 ?auto_78134 ) ) ( not ( = ?auto_78133 ?auto_78134 ) ) ( not ( = ?auto_78131 ?auto_78134 ) ) ( not ( = ?auto_78132 ?auto_78134 ) ) ( ON ?auto_78131 ?auto_78133 ) ( ON-TABLE ?auto_78134 ) ( ON ?auto_78132 ?auto_78131 ) ( ON ?auto_78136 ?auto_78132 ) ( CLEAR ?auto_78136 ) ( HOLDING ?auto_78135 ) ( CLEAR ?auto_78137 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78130 ?auto_78137 ?auto_78135 )
      ( MAKE-1PILE ?auto_78130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78138 - BLOCK
    )
    :vars
    (
      ?auto_78142 - BLOCK
      ?auto_78145 - BLOCK
      ?auto_78140 - BLOCK
      ?auto_78143 - BLOCK
      ?auto_78139 - BLOCK
      ?auto_78141 - BLOCK
      ?auto_78144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_78142 ?auto_78138 ) ( ON-TABLE ?auto_78138 ) ( not ( = ?auto_78138 ?auto_78142 ) ) ( not ( = ?auto_78138 ?auto_78145 ) ) ( not ( = ?auto_78138 ?auto_78140 ) ) ( not ( = ?auto_78142 ?auto_78145 ) ) ( not ( = ?auto_78142 ?auto_78140 ) ) ( not ( = ?auto_78145 ?auto_78140 ) ) ( not ( = ?auto_78143 ?auto_78139 ) ) ( not ( = ?auto_78143 ?auto_78141 ) ) ( not ( = ?auto_78143 ?auto_78140 ) ) ( not ( = ?auto_78139 ?auto_78141 ) ) ( not ( = ?auto_78139 ?auto_78140 ) ) ( not ( = ?auto_78141 ?auto_78140 ) ) ( not ( = ?auto_78138 ?auto_78141 ) ) ( not ( = ?auto_78138 ?auto_78143 ) ) ( not ( = ?auto_78138 ?auto_78139 ) ) ( not ( = ?auto_78142 ?auto_78141 ) ) ( not ( = ?auto_78142 ?auto_78143 ) ) ( not ( = ?auto_78142 ?auto_78139 ) ) ( not ( = ?auto_78145 ?auto_78141 ) ) ( not ( = ?auto_78145 ?auto_78143 ) ) ( not ( = ?auto_78145 ?auto_78139 ) ) ( ON ?auto_78143 ?auto_78144 ) ( not ( = ?auto_78138 ?auto_78144 ) ) ( not ( = ?auto_78142 ?auto_78144 ) ) ( not ( = ?auto_78145 ?auto_78144 ) ) ( not ( = ?auto_78140 ?auto_78144 ) ) ( not ( = ?auto_78143 ?auto_78144 ) ) ( not ( = ?auto_78139 ?auto_78144 ) ) ( not ( = ?auto_78141 ?auto_78144 ) ) ( ON ?auto_78139 ?auto_78143 ) ( ON-TABLE ?auto_78144 ) ( ON ?auto_78141 ?auto_78139 ) ( ON ?auto_78140 ?auto_78141 ) ( CLEAR ?auto_78142 ) ( ON ?auto_78145 ?auto_78140 ) ( CLEAR ?auto_78145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78144 ?auto_78143 ?auto_78139 ?auto_78141 ?auto_78140 )
      ( MAKE-1PILE ?auto_78138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78162 - BLOCK
    )
    :vars
    (
      ?auto_78167 - BLOCK
      ?auto_78169 - BLOCK
      ?auto_78165 - BLOCK
      ?auto_78166 - BLOCK
      ?auto_78168 - BLOCK
      ?auto_78163 - BLOCK
      ?auto_78164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78162 ?auto_78167 ) ) ( not ( = ?auto_78162 ?auto_78169 ) ) ( not ( = ?auto_78162 ?auto_78165 ) ) ( not ( = ?auto_78167 ?auto_78169 ) ) ( not ( = ?auto_78167 ?auto_78165 ) ) ( not ( = ?auto_78169 ?auto_78165 ) ) ( not ( = ?auto_78166 ?auto_78168 ) ) ( not ( = ?auto_78166 ?auto_78163 ) ) ( not ( = ?auto_78166 ?auto_78165 ) ) ( not ( = ?auto_78168 ?auto_78163 ) ) ( not ( = ?auto_78168 ?auto_78165 ) ) ( not ( = ?auto_78163 ?auto_78165 ) ) ( not ( = ?auto_78162 ?auto_78163 ) ) ( not ( = ?auto_78162 ?auto_78166 ) ) ( not ( = ?auto_78162 ?auto_78168 ) ) ( not ( = ?auto_78167 ?auto_78163 ) ) ( not ( = ?auto_78167 ?auto_78166 ) ) ( not ( = ?auto_78167 ?auto_78168 ) ) ( not ( = ?auto_78169 ?auto_78163 ) ) ( not ( = ?auto_78169 ?auto_78166 ) ) ( not ( = ?auto_78169 ?auto_78168 ) ) ( ON ?auto_78166 ?auto_78164 ) ( not ( = ?auto_78162 ?auto_78164 ) ) ( not ( = ?auto_78167 ?auto_78164 ) ) ( not ( = ?auto_78169 ?auto_78164 ) ) ( not ( = ?auto_78165 ?auto_78164 ) ) ( not ( = ?auto_78166 ?auto_78164 ) ) ( not ( = ?auto_78168 ?auto_78164 ) ) ( not ( = ?auto_78163 ?auto_78164 ) ) ( ON ?auto_78168 ?auto_78166 ) ( ON-TABLE ?auto_78164 ) ( ON ?auto_78163 ?auto_78168 ) ( ON ?auto_78165 ?auto_78163 ) ( ON ?auto_78169 ?auto_78165 ) ( ON ?auto_78167 ?auto_78169 ) ( CLEAR ?auto_78167 ) ( HOLDING ?auto_78162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78162 ?auto_78167 )
      ( MAKE-1PILE ?auto_78162 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_78170 - BLOCK
    )
    :vars
    (
      ?auto_78174 - BLOCK
      ?auto_78177 - BLOCK
      ?auto_78172 - BLOCK
      ?auto_78176 - BLOCK
      ?auto_78171 - BLOCK
      ?auto_78175 - BLOCK
      ?auto_78173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78170 ?auto_78174 ) ) ( not ( = ?auto_78170 ?auto_78177 ) ) ( not ( = ?auto_78170 ?auto_78172 ) ) ( not ( = ?auto_78174 ?auto_78177 ) ) ( not ( = ?auto_78174 ?auto_78172 ) ) ( not ( = ?auto_78177 ?auto_78172 ) ) ( not ( = ?auto_78176 ?auto_78171 ) ) ( not ( = ?auto_78176 ?auto_78175 ) ) ( not ( = ?auto_78176 ?auto_78172 ) ) ( not ( = ?auto_78171 ?auto_78175 ) ) ( not ( = ?auto_78171 ?auto_78172 ) ) ( not ( = ?auto_78175 ?auto_78172 ) ) ( not ( = ?auto_78170 ?auto_78175 ) ) ( not ( = ?auto_78170 ?auto_78176 ) ) ( not ( = ?auto_78170 ?auto_78171 ) ) ( not ( = ?auto_78174 ?auto_78175 ) ) ( not ( = ?auto_78174 ?auto_78176 ) ) ( not ( = ?auto_78174 ?auto_78171 ) ) ( not ( = ?auto_78177 ?auto_78175 ) ) ( not ( = ?auto_78177 ?auto_78176 ) ) ( not ( = ?auto_78177 ?auto_78171 ) ) ( ON ?auto_78176 ?auto_78173 ) ( not ( = ?auto_78170 ?auto_78173 ) ) ( not ( = ?auto_78174 ?auto_78173 ) ) ( not ( = ?auto_78177 ?auto_78173 ) ) ( not ( = ?auto_78172 ?auto_78173 ) ) ( not ( = ?auto_78176 ?auto_78173 ) ) ( not ( = ?auto_78171 ?auto_78173 ) ) ( not ( = ?auto_78175 ?auto_78173 ) ) ( ON ?auto_78171 ?auto_78176 ) ( ON-TABLE ?auto_78173 ) ( ON ?auto_78175 ?auto_78171 ) ( ON ?auto_78172 ?auto_78175 ) ( ON ?auto_78177 ?auto_78172 ) ( ON ?auto_78174 ?auto_78177 ) ( ON ?auto_78170 ?auto_78174 ) ( CLEAR ?auto_78170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78173 ?auto_78176 ?auto_78171 ?auto_78175 ?auto_78172 ?auto_78177 ?auto_78174 )
      ( MAKE-1PILE ?auto_78170 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78184 - BLOCK
      ?auto_78185 - BLOCK
      ?auto_78186 - BLOCK
      ?auto_78187 - BLOCK
      ?auto_78188 - BLOCK
      ?auto_78189 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78189 ) ( CLEAR ?auto_78188 ) ( ON-TABLE ?auto_78184 ) ( ON ?auto_78185 ?auto_78184 ) ( ON ?auto_78186 ?auto_78185 ) ( ON ?auto_78187 ?auto_78186 ) ( ON ?auto_78188 ?auto_78187 ) ( not ( = ?auto_78184 ?auto_78185 ) ) ( not ( = ?auto_78184 ?auto_78186 ) ) ( not ( = ?auto_78184 ?auto_78187 ) ) ( not ( = ?auto_78184 ?auto_78188 ) ) ( not ( = ?auto_78184 ?auto_78189 ) ) ( not ( = ?auto_78185 ?auto_78186 ) ) ( not ( = ?auto_78185 ?auto_78187 ) ) ( not ( = ?auto_78185 ?auto_78188 ) ) ( not ( = ?auto_78185 ?auto_78189 ) ) ( not ( = ?auto_78186 ?auto_78187 ) ) ( not ( = ?auto_78186 ?auto_78188 ) ) ( not ( = ?auto_78186 ?auto_78189 ) ) ( not ( = ?auto_78187 ?auto_78188 ) ) ( not ( = ?auto_78187 ?auto_78189 ) ) ( not ( = ?auto_78188 ?auto_78189 ) ) )
    :subtasks
    ( ( !STACK ?auto_78189 ?auto_78188 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78190 - BLOCK
      ?auto_78191 - BLOCK
      ?auto_78192 - BLOCK
      ?auto_78193 - BLOCK
      ?auto_78194 - BLOCK
      ?auto_78195 - BLOCK
    )
    :vars
    (
      ?auto_78196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78194 ) ( ON-TABLE ?auto_78190 ) ( ON ?auto_78191 ?auto_78190 ) ( ON ?auto_78192 ?auto_78191 ) ( ON ?auto_78193 ?auto_78192 ) ( ON ?auto_78194 ?auto_78193 ) ( not ( = ?auto_78190 ?auto_78191 ) ) ( not ( = ?auto_78190 ?auto_78192 ) ) ( not ( = ?auto_78190 ?auto_78193 ) ) ( not ( = ?auto_78190 ?auto_78194 ) ) ( not ( = ?auto_78190 ?auto_78195 ) ) ( not ( = ?auto_78191 ?auto_78192 ) ) ( not ( = ?auto_78191 ?auto_78193 ) ) ( not ( = ?auto_78191 ?auto_78194 ) ) ( not ( = ?auto_78191 ?auto_78195 ) ) ( not ( = ?auto_78192 ?auto_78193 ) ) ( not ( = ?auto_78192 ?auto_78194 ) ) ( not ( = ?auto_78192 ?auto_78195 ) ) ( not ( = ?auto_78193 ?auto_78194 ) ) ( not ( = ?auto_78193 ?auto_78195 ) ) ( not ( = ?auto_78194 ?auto_78195 ) ) ( ON ?auto_78195 ?auto_78196 ) ( CLEAR ?auto_78195 ) ( HAND-EMPTY ) ( not ( = ?auto_78190 ?auto_78196 ) ) ( not ( = ?auto_78191 ?auto_78196 ) ) ( not ( = ?auto_78192 ?auto_78196 ) ) ( not ( = ?auto_78193 ?auto_78196 ) ) ( not ( = ?auto_78194 ?auto_78196 ) ) ( not ( = ?auto_78195 ?auto_78196 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78195 ?auto_78196 )
      ( MAKE-6PILE ?auto_78190 ?auto_78191 ?auto_78192 ?auto_78193 ?auto_78194 ?auto_78195 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78197 - BLOCK
      ?auto_78198 - BLOCK
      ?auto_78199 - BLOCK
      ?auto_78200 - BLOCK
      ?auto_78201 - BLOCK
      ?auto_78202 - BLOCK
    )
    :vars
    (
      ?auto_78203 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78197 ) ( ON ?auto_78198 ?auto_78197 ) ( ON ?auto_78199 ?auto_78198 ) ( ON ?auto_78200 ?auto_78199 ) ( not ( = ?auto_78197 ?auto_78198 ) ) ( not ( = ?auto_78197 ?auto_78199 ) ) ( not ( = ?auto_78197 ?auto_78200 ) ) ( not ( = ?auto_78197 ?auto_78201 ) ) ( not ( = ?auto_78197 ?auto_78202 ) ) ( not ( = ?auto_78198 ?auto_78199 ) ) ( not ( = ?auto_78198 ?auto_78200 ) ) ( not ( = ?auto_78198 ?auto_78201 ) ) ( not ( = ?auto_78198 ?auto_78202 ) ) ( not ( = ?auto_78199 ?auto_78200 ) ) ( not ( = ?auto_78199 ?auto_78201 ) ) ( not ( = ?auto_78199 ?auto_78202 ) ) ( not ( = ?auto_78200 ?auto_78201 ) ) ( not ( = ?auto_78200 ?auto_78202 ) ) ( not ( = ?auto_78201 ?auto_78202 ) ) ( ON ?auto_78202 ?auto_78203 ) ( CLEAR ?auto_78202 ) ( not ( = ?auto_78197 ?auto_78203 ) ) ( not ( = ?auto_78198 ?auto_78203 ) ) ( not ( = ?auto_78199 ?auto_78203 ) ) ( not ( = ?auto_78200 ?auto_78203 ) ) ( not ( = ?auto_78201 ?auto_78203 ) ) ( not ( = ?auto_78202 ?auto_78203 ) ) ( HOLDING ?auto_78201 ) ( CLEAR ?auto_78200 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78197 ?auto_78198 ?auto_78199 ?auto_78200 ?auto_78201 )
      ( MAKE-6PILE ?auto_78197 ?auto_78198 ?auto_78199 ?auto_78200 ?auto_78201 ?auto_78202 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78204 - BLOCK
      ?auto_78205 - BLOCK
      ?auto_78206 - BLOCK
      ?auto_78207 - BLOCK
      ?auto_78208 - BLOCK
      ?auto_78209 - BLOCK
    )
    :vars
    (
      ?auto_78210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78204 ) ( ON ?auto_78205 ?auto_78204 ) ( ON ?auto_78206 ?auto_78205 ) ( ON ?auto_78207 ?auto_78206 ) ( not ( = ?auto_78204 ?auto_78205 ) ) ( not ( = ?auto_78204 ?auto_78206 ) ) ( not ( = ?auto_78204 ?auto_78207 ) ) ( not ( = ?auto_78204 ?auto_78208 ) ) ( not ( = ?auto_78204 ?auto_78209 ) ) ( not ( = ?auto_78205 ?auto_78206 ) ) ( not ( = ?auto_78205 ?auto_78207 ) ) ( not ( = ?auto_78205 ?auto_78208 ) ) ( not ( = ?auto_78205 ?auto_78209 ) ) ( not ( = ?auto_78206 ?auto_78207 ) ) ( not ( = ?auto_78206 ?auto_78208 ) ) ( not ( = ?auto_78206 ?auto_78209 ) ) ( not ( = ?auto_78207 ?auto_78208 ) ) ( not ( = ?auto_78207 ?auto_78209 ) ) ( not ( = ?auto_78208 ?auto_78209 ) ) ( ON ?auto_78209 ?auto_78210 ) ( not ( = ?auto_78204 ?auto_78210 ) ) ( not ( = ?auto_78205 ?auto_78210 ) ) ( not ( = ?auto_78206 ?auto_78210 ) ) ( not ( = ?auto_78207 ?auto_78210 ) ) ( not ( = ?auto_78208 ?auto_78210 ) ) ( not ( = ?auto_78209 ?auto_78210 ) ) ( CLEAR ?auto_78207 ) ( ON ?auto_78208 ?auto_78209 ) ( CLEAR ?auto_78208 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78210 ?auto_78209 )
      ( MAKE-6PILE ?auto_78204 ?auto_78205 ?auto_78206 ?auto_78207 ?auto_78208 ?auto_78209 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78211 - BLOCK
      ?auto_78212 - BLOCK
      ?auto_78213 - BLOCK
      ?auto_78214 - BLOCK
      ?auto_78215 - BLOCK
      ?auto_78216 - BLOCK
    )
    :vars
    (
      ?auto_78217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78211 ) ( ON ?auto_78212 ?auto_78211 ) ( ON ?auto_78213 ?auto_78212 ) ( not ( = ?auto_78211 ?auto_78212 ) ) ( not ( = ?auto_78211 ?auto_78213 ) ) ( not ( = ?auto_78211 ?auto_78214 ) ) ( not ( = ?auto_78211 ?auto_78215 ) ) ( not ( = ?auto_78211 ?auto_78216 ) ) ( not ( = ?auto_78212 ?auto_78213 ) ) ( not ( = ?auto_78212 ?auto_78214 ) ) ( not ( = ?auto_78212 ?auto_78215 ) ) ( not ( = ?auto_78212 ?auto_78216 ) ) ( not ( = ?auto_78213 ?auto_78214 ) ) ( not ( = ?auto_78213 ?auto_78215 ) ) ( not ( = ?auto_78213 ?auto_78216 ) ) ( not ( = ?auto_78214 ?auto_78215 ) ) ( not ( = ?auto_78214 ?auto_78216 ) ) ( not ( = ?auto_78215 ?auto_78216 ) ) ( ON ?auto_78216 ?auto_78217 ) ( not ( = ?auto_78211 ?auto_78217 ) ) ( not ( = ?auto_78212 ?auto_78217 ) ) ( not ( = ?auto_78213 ?auto_78217 ) ) ( not ( = ?auto_78214 ?auto_78217 ) ) ( not ( = ?auto_78215 ?auto_78217 ) ) ( not ( = ?auto_78216 ?auto_78217 ) ) ( ON ?auto_78215 ?auto_78216 ) ( CLEAR ?auto_78215 ) ( ON-TABLE ?auto_78217 ) ( HOLDING ?auto_78214 ) ( CLEAR ?auto_78213 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78211 ?auto_78212 ?auto_78213 ?auto_78214 )
      ( MAKE-6PILE ?auto_78211 ?auto_78212 ?auto_78213 ?auto_78214 ?auto_78215 ?auto_78216 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78218 - BLOCK
      ?auto_78219 - BLOCK
      ?auto_78220 - BLOCK
      ?auto_78221 - BLOCK
      ?auto_78222 - BLOCK
      ?auto_78223 - BLOCK
    )
    :vars
    (
      ?auto_78224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78218 ) ( ON ?auto_78219 ?auto_78218 ) ( ON ?auto_78220 ?auto_78219 ) ( not ( = ?auto_78218 ?auto_78219 ) ) ( not ( = ?auto_78218 ?auto_78220 ) ) ( not ( = ?auto_78218 ?auto_78221 ) ) ( not ( = ?auto_78218 ?auto_78222 ) ) ( not ( = ?auto_78218 ?auto_78223 ) ) ( not ( = ?auto_78219 ?auto_78220 ) ) ( not ( = ?auto_78219 ?auto_78221 ) ) ( not ( = ?auto_78219 ?auto_78222 ) ) ( not ( = ?auto_78219 ?auto_78223 ) ) ( not ( = ?auto_78220 ?auto_78221 ) ) ( not ( = ?auto_78220 ?auto_78222 ) ) ( not ( = ?auto_78220 ?auto_78223 ) ) ( not ( = ?auto_78221 ?auto_78222 ) ) ( not ( = ?auto_78221 ?auto_78223 ) ) ( not ( = ?auto_78222 ?auto_78223 ) ) ( ON ?auto_78223 ?auto_78224 ) ( not ( = ?auto_78218 ?auto_78224 ) ) ( not ( = ?auto_78219 ?auto_78224 ) ) ( not ( = ?auto_78220 ?auto_78224 ) ) ( not ( = ?auto_78221 ?auto_78224 ) ) ( not ( = ?auto_78222 ?auto_78224 ) ) ( not ( = ?auto_78223 ?auto_78224 ) ) ( ON ?auto_78222 ?auto_78223 ) ( ON-TABLE ?auto_78224 ) ( CLEAR ?auto_78220 ) ( ON ?auto_78221 ?auto_78222 ) ( CLEAR ?auto_78221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78224 ?auto_78223 ?auto_78222 )
      ( MAKE-6PILE ?auto_78218 ?auto_78219 ?auto_78220 ?auto_78221 ?auto_78222 ?auto_78223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78225 - BLOCK
      ?auto_78226 - BLOCK
      ?auto_78227 - BLOCK
      ?auto_78228 - BLOCK
      ?auto_78229 - BLOCK
      ?auto_78230 - BLOCK
    )
    :vars
    (
      ?auto_78231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78225 ) ( ON ?auto_78226 ?auto_78225 ) ( not ( = ?auto_78225 ?auto_78226 ) ) ( not ( = ?auto_78225 ?auto_78227 ) ) ( not ( = ?auto_78225 ?auto_78228 ) ) ( not ( = ?auto_78225 ?auto_78229 ) ) ( not ( = ?auto_78225 ?auto_78230 ) ) ( not ( = ?auto_78226 ?auto_78227 ) ) ( not ( = ?auto_78226 ?auto_78228 ) ) ( not ( = ?auto_78226 ?auto_78229 ) ) ( not ( = ?auto_78226 ?auto_78230 ) ) ( not ( = ?auto_78227 ?auto_78228 ) ) ( not ( = ?auto_78227 ?auto_78229 ) ) ( not ( = ?auto_78227 ?auto_78230 ) ) ( not ( = ?auto_78228 ?auto_78229 ) ) ( not ( = ?auto_78228 ?auto_78230 ) ) ( not ( = ?auto_78229 ?auto_78230 ) ) ( ON ?auto_78230 ?auto_78231 ) ( not ( = ?auto_78225 ?auto_78231 ) ) ( not ( = ?auto_78226 ?auto_78231 ) ) ( not ( = ?auto_78227 ?auto_78231 ) ) ( not ( = ?auto_78228 ?auto_78231 ) ) ( not ( = ?auto_78229 ?auto_78231 ) ) ( not ( = ?auto_78230 ?auto_78231 ) ) ( ON ?auto_78229 ?auto_78230 ) ( ON-TABLE ?auto_78231 ) ( ON ?auto_78228 ?auto_78229 ) ( CLEAR ?auto_78228 ) ( HOLDING ?auto_78227 ) ( CLEAR ?auto_78226 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78225 ?auto_78226 ?auto_78227 )
      ( MAKE-6PILE ?auto_78225 ?auto_78226 ?auto_78227 ?auto_78228 ?auto_78229 ?auto_78230 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78232 - BLOCK
      ?auto_78233 - BLOCK
      ?auto_78234 - BLOCK
      ?auto_78235 - BLOCK
      ?auto_78236 - BLOCK
      ?auto_78237 - BLOCK
    )
    :vars
    (
      ?auto_78238 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78232 ) ( ON ?auto_78233 ?auto_78232 ) ( not ( = ?auto_78232 ?auto_78233 ) ) ( not ( = ?auto_78232 ?auto_78234 ) ) ( not ( = ?auto_78232 ?auto_78235 ) ) ( not ( = ?auto_78232 ?auto_78236 ) ) ( not ( = ?auto_78232 ?auto_78237 ) ) ( not ( = ?auto_78233 ?auto_78234 ) ) ( not ( = ?auto_78233 ?auto_78235 ) ) ( not ( = ?auto_78233 ?auto_78236 ) ) ( not ( = ?auto_78233 ?auto_78237 ) ) ( not ( = ?auto_78234 ?auto_78235 ) ) ( not ( = ?auto_78234 ?auto_78236 ) ) ( not ( = ?auto_78234 ?auto_78237 ) ) ( not ( = ?auto_78235 ?auto_78236 ) ) ( not ( = ?auto_78235 ?auto_78237 ) ) ( not ( = ?auto_78236 ?auto_78237 ) ) ( ON ?auto_78237 ?auto_78238 ) ( not ( = ?auto_78232 ?auto_78238 ) ) ( not ( = ?auto_78233 ?auto_78238 ) ) ( not ( = ?auto_78234 ?auto_78238 ) ) ( not ( = ?auto_78235 ?auto_78238 ) ) ( not ( = ?auto_78236 ?auto_78238 ) ) ( not ( = ?auto_78237 ?auto_78238 ) ) ( ON ?auto_78236 ?auto_78237 ) ( ON-TABLE ?auto_78238 ) ( ON ?auto_78235 ?auto_78236 ) ( CLEAR ?auto_78233 ) ( ON ?auto_78234 ?auto_78235 ) ( CLEAR ?auto_78234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78238 ?auto_78237 ?auto_78236 ?auto_78235 )
      ( MAKE-6PILE ?auto_78232 ?auto_78233 ?auto_78234 ?auto_78235 ?auto_78236 ?auto_78237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78239 - BLOCK
      ?auto_78240 - BLOCK
      ?auto_78241 - BLOCK
      ?auto_78242 - BLOCK
      ?auto_78243 - BLOCK
      ?auto_78244 - BLOCK
    )
    :vars
    (
      ?auto_78245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78239 ) ( not ( = ?auto_78239 ?auto_78240 ) ) ( not ( = ?auto_78239 ?auto_78241 ) ) ( not ( = ?auto_78239 ?auto_78242 ) ) ( not ( = ?auto_78239 ?auto_78243 ) ) ( not ( = ?auto_78239 ?auto_78244 ) ) ( not ( = ?auto_78240 ?auto_78241 ) ) ( not ( = ?auto_78240 ?auto_78242 ) ) ( not ( = ?auto_78240 ?auto_78243 ) ) ( not ( = ?auto_78240 ?auto_78244 ) ) ( not ( = ?auto_78241 ?auto_78242 ) ) ( not ( = ?auto_78241 ?auto_78243 ) ) ( not ( = ?auto_78241 ?auto_78244 ) ) ( not ( = ?auto_78242 ?auto_78243 ) ) ( not ( = ?auto_78242 ?auto_78244 ) ) ( not ( = ?auto_78243 ?auto_78244 ) ) ( ON ?auto_78244 ?auto_78245 ) ( not ( = ?auto_78239 ?auto_78245 ) ) ( not ( = ?auto_78240 ?auto_78245 ) ) ( not ( = ?auto_78241 ?auto_78245 ) ) ( not ( = ?auto_78242 ?auto_78245 ) ) ( not ( = ?auto_78243 ?auto_78245 ) ) ( not ( = ?auto_78244 ?auto_78245 ) ) ( ON ?auto_78243 ?auto_78244 ) ( ON-TABLE ?auto_78245 ) ( ON ?auto_78242 ?auto_78243 ) ( ON ?auto_78241 ?auto_78242 ) ( CLEAR ?auto_78241 ) ( HOLDING ?auto_78240 ) ( CLEAR ?auto_78239 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78239 ?auto_78240 )
      ( MAKE-6PILE ?auto_78239 ?auto_78240 ?auto_78241 ?auto_78242 ?auto_78243 ?auto_78244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78246 - BLOCK
      ?auto_78247 - BLOCK
      ?auto_78248 - BLOCK
      ?auto_78249 - BLOCK
      ?auto_78250 - BLOCK
      ?auto_78251 - BLOCK
    )
    :vars
    (
      ?auto_78252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78246 ) ( not ( = ?auto_78246 ?auto_78247 ) ) ( not ( = ?auto_78246 ?auto_78248 ) ) ( not ( = ?auto_78246 ?auto_78249 ) ) ( not ( = ?auto_78246 ?auto_78250 ) ) ( not ( = ?auto_78246 ?auto_78251 ) ) ( not ( = ?auto_78247 ?auto_78248 ) ) ( not ( = ?auto_78247 ?auto_78249 ) ) ( not ( = ?auto_78247 ?auto_78250 ) ) ( not ( = ?auto_78247 ?auto_78251 ) ) ( not ( = ?auto_78248 ?auto_78249 ) ) ( not ( = ?auto_78248 ?auto_78250 ) ) ( not ( = ?auto_78248 ?auto_78251 ) ) ( not ( = ?auto_78249 ?auto_78250 ) ) ( not ( = ?auto_78249 ?auto_78251 ) ) ( not ( = ?auto_78250 ?auto_78251 ) ) ( ON ?auto_78251 ?auto_78252 ) ( not ( = ?auto_78246 ?auto_78252 ) ) ( not ( = ?auto_78247 ?auto_78252 ) ) ( not ( = ?auto_78248 ?auto_78252 ) ) ( not ( = ?auto_78249 ?auto_78252 ) ) ( not ( = ?auto_78250 ?auto_78252 ) ) ( not ( = ?auto_78251 ?auto_78252 ) ) ( ON ?auto_78250 ?auto_78251 ) ( ON-TABLE ?auto_78252 ) ( ON ?auto_78249 ?auto_78250 ) ( ON ?auto_78248 ?auto_78249 ) ( CLEAR ?auto_78246 ) ( ON ?auto_78247 ?auto_78248 ) ( CLEAR ?auto_78247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78252 ?auto_78251 ?auto_78250 ?auto_78249 ?auto_78248 )
      ( MAKE-6PILE ?auto_78246 ?auto_78247 ?auto_78248 ?auto_78249 ?auto_78250 ?auto_78251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78253 - BLOCK
      ?auto_78254 - BLOCK
      ?auto_78255 - BLOCK
      ?auto_78256 - BLOCK
      ?auto_78257 - BLOCK
      ?auto_78258 - BLOCK
    )
    :vars
    (
      ?auto_78259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78253 ?auto_78254 ) ) ( not ( = ?auto_78253 ?auto_78255 ) ) ( not ( = ?auto_78253 ?auto_78256 ) ) ( not ( = ?auto_78253 ?auto_78257 ) ) ( not ( = ?auto_78253 ?auto_78258 ) ) ( not ( = ?auto_78254 ?auto_78255 ) ) ( not ( = ?auto_78254 ?auto_78256 ) ) ( not ( = ?auto_78254 ?auto_78257 ) ) ( not ( = ?auto_78254 ?auto_78258 ) ) ( not ( = ?auto_78255 ?auto_78256 ) ) ( not ( = ?auto_78255 ?auto_78257 ) ) ( not ( = ?auto_78255 ?auto_78258 ) ) ( not ( = ?auto_78256 ?auto_78257 ) ) ( not ( = ?auto_78256 ?auto_78258 ) ) ( not ( = ?auto_78257 ?auto_78258 ) ) ( ON ?auto_78258 ?auto_78259 ) ( not ( = ?auto_78253 ?auto_78259 ) ) ( not ( = ?auto_78254 ?auto_78259 ) ) ( not ( = ?auto_78255 ?auto_78259 ) ) ( not ( = ?auto_78256 ?auto_78259 ) ) ( not ( = ?auto_78257 ?auto_78259 ) ) ( not ( = ?auto_78258 ?auto_78259 ) ) ( ON ?auto_78257 ?auto_78258 ) ( ON-TABLE ?auto_78259 ) ( ON ?auto_78256 ?auto_78257 ) ( ON ?auto_78255 ?auto_78256 ) ( ON ?auto_78254 ?auto_78255 ) ( CLEAR ?auto_78254 ) ( HOLDING ?auto_78253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78253 )
      ( MAKE-6PILE ?auto_78253 ?auto_78254 ?auto_78255 ?auto_78256 ?auto_78257 ?auto_78258 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78260 - BLOCK
      ?auto_78261 - BLOCK
      ?auto_78262 - BLOCK
      ?auto_78263 - BLOCK
      ?auto_78264 - BLOCK
      ?auto_78265 - BLOCK
    )
    :vars
    (
      ?auto_78266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78260 ?auto_78261 ) ) ( not ( = ?auto_78260 ?auto_78262 ) ) ( not ( = ?auto_78260 ?auto_78263 ) ) ( not ( = ?auto_78260 ?auto_78264 ) ) ( not ( = ?auto_78260 ?auto_78265 ) ) ( not ( = ?auto_78261 ?auto_78262 ) ) ( not ( = ?auto_78261 ?auto_78263 ) ) ( not ( = ?auto_78261 ?auto_78264 ) ) ( not ( = ?auto_78261 ?auto_78265 ) ) ( not ( = ?auto_78262 ?auto_78263 ) ) ( not ( = ?auto_78262 ?auto_78264 ) ) ( not ( = ?auto_78262 ?auto_78265 ) ) ( not ( = ?auto_78263 ?auto_78264 ) ) ( not ( = ?auto_78263 ?auto_78265 ) ) ( not ( = ?auto_78264 ?auto_78265 ) ) ( ON ?auto_78265 ?auto_78266 ) ( not ( = ?auto_78260 ?auto_78266 ) ) ( not ( = ?auto_78261 ?auto_78266 ) ) ( not ( = ?auto_78262 ?auto_78266 ) ) ( not ( = ?auto_78263 ?auto_78266 ) ) ( not ( = ?auto_78264 ?auto_78266 ) ) ( not ( = ?auto_78265 ?auto_78266 ) ) ( ON ?auto_78264 ?auto_78265 ) ( ON-TABLE ?auto_78266 ) ( ON ?auto_78263 ?auto_78264 ) ( ON ?auto_78262 ?auto_78263 ) ( ON ?auto_78261 ?auto_78262 ) ( ON ?auto_78260 ?auto_78261 ) ( CLEAR ?auto_78260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78266 ?auto_78265 ?auto_78264 ?auto_78263 ?auto_78262 ?auto_78261 )
      ( MAKE-6PILE ?auto_78260 ?auto_78261 ?auto_78262 ?auto_78263 ?auto_78264 ?auto_78265 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78267 - BLOCK
      ?auto_78268 - BLOCK
      ?auto_78269 - BLOCK
      ?auto_78270 - BLOCK
      ?auto_78271 - BLOCK
      ?auto_78272 - BLOCK
    )
    :vars
    (
      ?auto_78273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78267 ?auto_78268 ) ) ( not ( = ?auto_78267 ?auto_78269 ) ) ( not ( = ?auto_78267 ?auto_78270 ) ) ( not ( = ?auto_78267 ?auto_78271 ) ) ( not ( = ?auto_78267 ?auto_78272 ) ) ( not ( = ?auto_78268 ?auto_78269 ) ) ( not ( = ?auto_78268 ?auto_78270 ) ) ( not ( = ?auto_78268 ?auto_78271 ) ) ( not ( = ?auto_78268 ?auto_78272 ) ) ( not ( = ?auto_78269 ?auto_78270 ) ) ( not ( = ?auto_78269 ?auto_78271 ) ) ( not ( = ?auto_78269 ?auto_78272 ) ) ( not ( = ?auto_78270 ?auto_78271 ) ) ( not ( = ?auto_78270 ?auto_78272 ) ) ( not ( = ?auto_78271 ?auto_78272 ) ) ( ON ?auto_78272 ?auto_78273 ) ( not ( = ?auto_78267 ?auto_78273 ) ) ( not ( = ?auto_78268 ?auto_78273 ) ) ( not ( = ?auto_78269 ?auto_78273 ) ) ( not ( = ?auto_78270 ?auto_78273 ) ) ( not ( = ?auto_78271 ?auto_78273 ) ) ( not ( = ?auto_78272 ?auto_78273 ) ) ( ON ?auto_78271 ?auto_78272 ) ( ON-TABLE ?auto_78273 ) ( ON ?auto_78270 ?auto_78271 ) ( ON ?auto_78269 ?auto_78270 ) ( ON ?auto_78268 ?auto_78269 ) ( HOLDING ?auto_78267 ) ( CLEAR ?auto_78268 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78273 ?auto_78272 ?auto_78271 ?auto_78270 ?auto_78269 ?auto_78268 ?auto_78267 )
      ( MAKE-6PILE ?auto_78267 ?auto_78268 ?auto_78269 ?auto_78270 ?auto_78271 ?auto_78272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78274 - BLOCK
      ?auto_78275 - BLOCK
      ?auto_78276 - BLOCK
      ?auto_78277 - BLOCK
      ?auto_78278 - BLOCK
      ?auto_78279 - BLOCK
    )
    :vars
    (
      ?auto_78280 - BLOCK
      ?auto_78281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78274 ?auto_78275 ) ) ( not ( = ?auto_78274 ?auto_78276 ) ) ( not ( = ?auto_78274 ?auto_78277 ) ) ( not ( = ?auto_78274 ?auto_78278 ) ) ( not ( = ?auto_78274 ?auto_78279 ) ) ( not ( = ?auto_78275 ?auto_78276 ) ) ( not ( = ?auto_78275 ?auto_78277 ) ) ( not ( = ?auto_78275 ?auto_78278 ) ) ( not ( = ?auto_78275 ?auto_78279 ) ) ( not ( = ?auto_78276 ?auto_78277 ) ) ( not ( = ?auto_78276 ?auto_78278 ) ) ( not ( = ?auto_78276 ?auto_78279 ) ) ( not ( = ?auto_78277 ?auto_78278 ) ) ( not ( = ?auto_78277 ?auto_78279 ) ) ( not ( = ?auto_78278 ?auto_78279 ) ) ( ON ?auto_78279 ?auto_78280 ) ( not ( = ?auto_78274 ?auto_78280 ) ) ( not ( = ?auto_78275 ?auto_78280 ) ) ( not ( = ?auto_78276 ?auto_78280 ) ) ( not ( = ?auto_78277 ?auto_78280 ) ) ( not ( = ?auto_78278 ?auto_78280 ) ) ( not ( = ?auto_78279 ?auto_78280 ) ) ( ON ?auto_78278 ?auto_78279 ) ( ON-TABLE ?auto_78280 ) ( ON ?auto_78277 ?auto_78278 ) ( ON ?auto_78276 ?auto_78277 ) ( ON ?auto_78275 ?auto_78276 ) ( CLEAR ?auto_78275 ) ( ON ?auto_78274 ?auto_78281 ) ( CLEAR ?auto_78274 ) ( HAND-EMPTY ) ( not ( = ?auto_78274 ?auto_78281 ) ) ( not ( = ?auto_78275 ?auto_78281 ) ) ( not ( = ?auto_78276 ?auto_78281 ) ) ( not ( = ?auto_78277 ?auto_78281 ) ) ( not ( = ?auto_78278 ?auto_78281 ) ) ( not ( = ?auto_78279 ?auto_78281 ) ) ( not ( = ?auto_78280 ?auto_78281 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78274 ?auto_78281 )
      ( MAKE-6PILE ?auto_78274 ?auto_78275 ?auto_78276 ?auto_78277 ?auto_78278 ?auto_78279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78282 - BLOCK
      ?auto_78283 - BLOCK
      ?auto_78284 - BLOCK
      ?auto_78285 - BLOCK
      ?auto_78286 - BLOCK
      ?auto_78287 - BLOCK
    )
    :vars
    (
      ?auto_78289 - BLOCK
      ?auto_78288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78282 ?auto_78283 ) ) ( not ( = ?auto_78282 ?auto_78284 ) ) ( not ( = ?auto_78282 ?auto_78285 ) ) ( not ( = ?auto_78282 ?auto_78286 ) ) ( not ( = ?auto_78282 ?auto_78287 ) ) ( not ( = ?auto_78283 ?auto_78284 ) ) ( not ( = ?auto_78283 ?auto_78285 ) ) ( not ( = ?auto_78283 ?auto_78286 ) ) ( not ( = ?auto_78283 ?auto_78287 ) ) ( not ( = ?auto_78284 ?auto_78285 ) ) ( not ( = ?auto_78284 ?auto_78286 ) ) ( not ( = ?auto_78284 ?auto_78287 ) ) ( not ( = ?auto_78285 ?auto_78286 ) ) ( not ( = ?auto_78285 ?auto_78287 ) ) ( not ( = ?auto_78286 ?auto_78287 ) ) ( ON ?auto_78287 ?auto_78289 ) ( not ( = ?auto_78282 ?auto_78289 ) ) ( not ( = ?auto_78283 ?auto_78289 ) ) ( not ( = ?auto_78284 ?auto_78289 ) ) ( not ( = ?auto_78285 ?auto_78289 ) ) ( not ( = ?auto_78286 ?auto_78289 ) ) ( not ( = ?auto_78287 ?auto_78289 ) ) ( ON ?auto_78286 ?auto_78287 ) ( ON-TABLE ?auto_78289 ) ( ON ?auto_78285 ?auto_78286 ) ( ON ?auto_78284 ?auto_78285 ) ( ON ?auto_78282 ?auto_78288 ) ( CLEAR ?auto_78282 ) ( not ( = ?auto_78282 ?auto_78288 ) ) ( not ( = ?auto_78283 ?auto_78288 ) ) ( not ( = ?auto_78284 ?auto_78288 ) ) ( not ( = ?auto_78285 ?auto_78288 ) ) ( not ( = ?auto_78286 ?auto_78288 ) ) ( not ( = ?auto_78287 ?auto_78288 ) ) ( not ( = ?auto_78289 ?auto_78288 ) ) ( HOLDING ?auto_78283 ) ( CLEAR ?auto_78284 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78289 ?auto_78287 ?auto_78286 ?auto_78285 ?auto_78284 ?auto_78283 )
      ( MAKE-6PILE ?auto_78282 ?auto_78283 ?auto_78284 ?auto_78285 ?auto_78286 ?auto_78287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78290 - BLOCK
      ?auto_78291 - BLOCK
      ?auto_78292 - BLOCK
      ?auto_78293 - BLOCK
      ?auto_78294 - BLOCK
      ?auto_78295 - BLOCK
    )
    :vars
    (
      ?auto_78297 - BLOCK
      ?auto_78296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78290 ?auto_78291 ) ) ( not ( = ?auto_78290 ?auto_78292 ) ) ( not ( = ?auto_78290 ?auto_78293 ) ) ( not ( = ?auto_78290 ?auto_78294 ) ) ( not ( = ?auto_78290 ?auto_78295 ) ) ( not ( = ?auto_78291 ?auto_78292 ) ) ( not ( = ?auto_78291 ?auto_78293 ) ) ( not ( = ?auto_78291 ?auto_78294 ) ) ( not ( = ?auto_78291 ?auto_78295 ) ) ( not ( = ?auto_78292 ?auto_78293 ) ) ( not ( = ?auto_78292 ?auto_78294 ) ) ( not ( = ?auto_78292 ?auto_78295 ) ) ( not ( = ?auto_78293 ?auto_78294 ) ) ( not ( = ?auto_78293 ?auto_78295 ) ) ( not ( = ?auto_78294 ?auto_78295 ) ) ( ON ?auto_78295 ?auto_78297 ) ( not ( = ?auto_78290 ?auto_78297 ) ) ( not ( = ?auto_78291 ?auto_78297 ) ) ( not ( = ?auto_78292 ?auto_78297 ) ) ( not ( = ?auto_78293 ?auto_78297 ) ) ( not ( = ?auto_78294 ?auto_78297 ) ) ( not ( = ?auto_78295 ?auto_78297 ) ) ( ON ?auto_78294 ?auto_78295 ) ( ON-TABLE ?auto_78297 ) ( ON ?auto_78293 ?auto_78294 ) ( ON ?auto_78292 ?auto_78293 ) ( ON ?auto_78290 ?auto_78296 ) ( not ( = ?auto_78290 ?auto_78296 ) ) ( not ( = ?auto_78291 ?auto_78296 ) ) ( not ( = ?auto_78292 ?auto_78296 ) ) ( not ( = ?auto_78293 ?auto_78296 ) ) ( not ( = ?auto_78294 ?auto_78296 ) ) ( not ( = ?auto_78295 ?auto_78296 ) ) ( not ( = ?auto_78297 ?auto_78296 ) ) ( CLEAR ?auto_78292 ) ( ON ?auto_78291 ?auto_78290 ) ( CLEAR ?auto_78291 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78296 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78296 ?auto_78290 )
      ( MAKE-6PILE ?auto_78290 ?auto_78291 ?auto_78292 ?auto_78293 ?auto_78294 ?auto_78295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78298 - BLOCK
      ?auto_78299 - BLOCK
      ?auto_78300 - BLOCK
      ?auto_78301 - BLOCK
      ?auto_78302 - BLOCK
      ?auto_78303 - BLOCK
    )
    :vars
    (
      ?auto_78305 - BLOCK
      ?auto_78304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78298 ?auto_78299 ) ) ( not ( = ?auto_78298 ?auto_78300 ) ) ( not ( = ?auto_78298 ?auto_78301 ) ) ( not ( = ?auto_78298 ?auto_78302 ) ) ( not ( = ?auto_78298 ?auto_78303 ) ) ( not ( = ?auto_78299 ?auto_78300 ) ) ( not ( = ?auto_78299 ?auto_78301 ) ) ( not ( = ?auto_78299 ?auto_78302 ) ) ( not ( = ?auto_78299 ?auto_78303 ) ) ( not ( = ?auto_78300 ?auto_78301 ) ) ( not ( = ?auto_78300 ?auto_78302 ) ) ( not ( = ?auto_78300 ?auto_78303 ) ) ( not ( = ?auto_78301 ?auto_78302 ) ) ( not ( = ?auto_78301 ?auto_78303 ) ) ( not ( = ?auto_78302 ?auto_78303 ) ) ( ON ?auto_78303 ?auto_78305 ) ( not ( = ?auto_78298 ?auto_78305 ) ) ( not ( = ?auto_78299 ?auto_78305 ) ) ( not ( = ?auto_78300 ?auto_78305 ) ) ( not ( = ?auto_78301 ?auto_78305 ) ) ( not ( = ?auto_78302 ?auto_78305 ) ) ( not ( = ?auto_78303 ?auto_78305 ) ) ( ON ?auto_78302 ?auto_78303 ) ( ON-TABLE ?auto_78305 ) ( ON ?auto_78301 ?auto_78302 ) ( ON ?auto_78298 ?auto_78304 ) ( not ( = ?auto_78298 ?auto_78304 ) ) ( not ( = ?auto_78299 ?auto_78304 ) ) ( not ( = ?auto_78300 ?auto_78304 ) ) ( not ( = ?auto_78301 ?auto_78304 ) ) ( not ( = ?auto_78302 ?auto_78304 ) ) ( not ( = ?auto_78303 ?auto_78304 ) ) ( not ( = ?auto_78305 ?auto_78304 ) ) ( ON ?auto_78299 ?auto_78298 ) ( CLEAR ?auto_78299 ) ( ON-TABLE ?auto_78304 ) ( HOLDING ?auto_78300 ) ( CLEAR ?auto_78301 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78305 ?auto_78303 ?auto_78302 ?auto_78301 ?auto_78300 )
      ( MAKE-6PILE ?auto_78298 ?auto_78299 ?auto_78300 ?auto_78301 ?auto_78302 ?auto_78303 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78306 - BLOCK
      ?auto_78307 - BLOCK
      ?auto_78308 - BLOCK
      ?auto_78309 - BLOCK
      ?auto_78310 - BLOCK
      ?auto_78311 - BLOCK
    )
    :vars
    (
      ?auto_78313 - BLOCK
      ?auto_78312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78306 ?auto_78307 ) ) ( not ( = ?auto_78306 ?auto_78308 ) ) ( not ( = ?auto_78306 ?auto_78309 ) ) ( not ( = ?auto_78306 ?auto_78310 ) ) ( not ( = ?auto_78306 ?auto_78311 ) ) ( not ( = ?auto_78307 ?auto_78308 ) ) ( not ( = ?auto_78307 ?auto_78309 ) ) ( not ( = ?auto_78307 ?auto_78310 ) ) ( not ( = ?auto_78307 ?auto_78311 ) ) ( not ( = ?auto_78308 ?auto_78309 ) ) ( not ( = ?auto_78308 ?auto_78310 ) ) ( not ( = ?auto_78308 ?auto_78311 ) ) ( not ( = ?auto_78309 ?auto_78310 ) ) ( not ( = ?auto_78309 ?auto_78311 ) ) ( not ( = ?auto_78310 ?auto_78311 ) ) ( ON ?auto_78311 ?auto_78313 ) ( not ( = ?auto_78306 ?auto_78313 ) ) ( not ( = ?auto_78307 ?auto_78313 ) ) ( not ( = ?auto_78308 ?auto_78313 ) ) ( not ( = ?auto_78309 ?auto_78313 ) ) ( not ( = ?auto_78310 ?auto_78313 ) ) ( not ( = ?auto_78311 ?auto_78313 ) ) ( ON ?auto_78310 ?auto_78311 ) ( ON-TABLE ?auto_78313 ) ( ON ?auto_78309 ?auto_78310 ) ( ON ?auto_78306 ?auto_78312 ) ( not ( = ?auto_78306 ?auto_78312 ) ) ( not ( = ?auto_78307 ?auto_78312 ) ) ( not ( = ?auto_78308 ?auto_78312 ) ) ( not ( = ?auto_78309 ?auto_78312 ) ) ( not ( = ?auto_78310 ?auto_78312 ) ) ( not ( = ?auto_78311 ?auto_78312 ) ) ( not ( = ?auto_78313 ?auto_78312 ) ) ( ON ?auto_78307 ?auto_78306 ) ( ON-TABLE ?auto_78312 ) ( CLEAR ?auto_78309 ) ( ON ?auto_78308 ?auto_78307 ) ( CLEAR ?auto_78308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78312 ?auto_78306 ?auto_78307 )
      ( MAKE-6PILE ?auto_78306 ?auto_78307 ?auto_78308 ?auto_78309 ?auto_78310 ?auto_78311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78314 - BLOCK
      ?auto_78315 - BLOCK
      ?auto_78316 - BLOCK
      ?auto_78317 - BLOCK
      ?auto_78318 - BLOCK
      ?auto_78319 - BLOCK
    )
    :vars
    (
      ?auto_78320 - BLOCK
      ?auto_78321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78314 ?auto_78315 ) ) ( not ( = ?auto_78314 ?auto_78316 ) ) ( not ( = ?auto_78314 ?auto_78317 ) ) ( not ( = ?auto_78314 ?auto_78318 ) ) ( not ( = ?auto_78314 ?auto_78319 ) ) ( not ( = ?auto_78315 ?auto_78316 ) ) ( not ( = ?auto_78315 ?auto_78317 ) ) ( not ( = ?auto_78315 ?auto_78318 ) ) ( not ( = ?auto_78315 ?auto_78319 ) ) ( not ( = ?auto_78316 ?auto_78317 ) ) ( not ( = ?auto_78316 ?auto_78318 ) ) ( not ( = ?auto_78316 ?auto_78319 ) ) ( not ( = ?auto_78317 ?auto_78318 ) ) ( not ( = ?auto_78317 ?auto_78319 ) ) ( not ( = ?auto_78318 ?auto_78319 ) ) ( ON ?auto_78319 ?auto_78320 ) ( not ( = ?auto_78314 ?auto_78320 ) ) ( not ( = ?auto_78315 ?auto_78320 ) ) ( not ( = ?auto_78316 ?auto_78320 ) ) ( not ( = ?auto_78317 ?auto_78320 ) ) ( not ( = ?auto_78318 ?auto_78320 ) ) ( not ( = ?auto_78319 ?auto_78320 ) ) ( ON ?auto_78318 ?auto_78319 ) ( ON-TABLE ?auto_78320 ) ( ON ?auto_78314 ?auto_78321 ) ( not ( = ?auto_78314 ?auto_78321 ) ) ( not ( = ?auto_78315 ?auto_78321 ) ) ( not ( = ?auto_78316 ?auto_78321 ) ) ( not ( = ?auto_78317 ?auto_78321 ) ) ( not ( = ?auto_78318 ?auto_78321 ) ) ( not ( = ?auto_78319 ?auto_78321 ) ) ( not ( = ?auto_78320 ?auto_78321 ) ) ( ON ?auto_78315 ?auto_78314 ) ( ON-TABLE ?auto_78321 ) ( ON ?auto_78316 ?auto_78315 ) ( CLEAR ?auto_78316 ) ( HOLDING ?auto_78317 ) ( CLEAR ?auto_78318 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78320 ?auto_78319 ?auto_78318 ?auto_78317 )
      ( MAKE-6PILE ?auto_78314 ?auto_78315 ?auto_78316 ?auto_78317 ?auto_78318 ?auto_78319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78322 - BLOCK
      ?auto_78323 - BLOCK
      ?auto_78324 - BLOCK
      ?auto_78325 - BLOCK
      ?auto_78326 - BLOCK
      ?auto_78327 - BLOCK
    )
    :vars
    (
      ?auto_78329 - BLOCK
      ?auto_78328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78322 ?auto_78323 ) ) ( not ( = ?auto_78322 ?auto_78324 ) ) ( not ( = ?auto_78322 ?auto_78325 ) ) ( not ( = ?auto_78322 ?auto_78326 ) ) ( not ( = ?auto_78322 ?auto_78327 ) ) ( not ( = ?auto_78323 ?auto_78324 ) ) ( not ( = ?auto_78323 ?auto_78325 ) ) ( not ( = ?auto_78323 ?auto_78326 ) ) ( not ( = ?auto_78323 ?auto_78327 ) ) ( not ( = ?auto_78324 ?auto_78325 ) ) ( not ( = ?auto_78324 ?auto_78326 ) ) ( not ( = ?auto_78324 ?auto_78327 ) ) ( not ( = ?auto_78325 ?auto_78326 ) ) ( not ( = ?auto_78325 ?auto_78327 ) ) ( not ( = ?auto_78326 ?auto_78327 ) ) ( ON ?auto_78327 ?auto_78329 ) ( not ( = ?auto_78322 ?auto_78329 ) ) ( not ( = ?auto_78323 ?auto_78329 ) ) ( not ( = ?auto_78324 ?auto_78329 ) ) ( not ( = ?auto_78325 ?auto_78329 ) ) ( not ( = ?auto_78326 ?auto_78329 ) ) ( not ( = ?auto_78327 ?auto_78329 ) ) ( ON ?auto_78326 ?auto_78327 ) ( ON-TABLE ?auto_78329 ) ( ON ?auto_78322 ?auto_78328 ) ( not ( = ?auto_78322 ?auto_78328 ) ) ( not ( = ?auto_78323 ?auto_78328 ) ) ( not ( = ?auto_78324 ?auto_78328 ) ) ( not ( = ?auto_78325 ?auto_78328 ) ) ( not ( = ?auto_78326 ?auto_78328 ) ) ( not ( = ?auto_78327 ?auto_78328 ) ) ( not ( = ?auto_78329 ?auto_78328 ) ) ( ON ?auto_78323 ?auto_78322 ) ( ON-TABLE ?auto_78328 ) ( ON ?auto_78324 ?auto_78323 ) ( CLEAR ?auto_78326 ) ( ON ?auto_78325 ?auto_78324 ) ( CLEAR ?auto_78325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78328 ?auto_78322 ?auto_78323 ?auto_78324 )
      ( MAKE-6PILE ?auto_78322 ?auto_78323 ?auto_78324 ?auto_78325 ?auto_78326 ?auto_78327 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78330 - BLOCK
      ?auto_78331 - BLOCK
      ?auto_78332 - BLOCK
      ?auto_78333 - BLOCK
      ?auto_78334 - BLOCK
      ?auto_78335 - BLOCK
    )
    :vars
    (
      ?auto_78337 - BLOCK
      ?auto_78336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78330 ?auto_78331 ) ) ( not ( = ?auto_78330 ?auto_78332 ) ) ( not ( = ?auto_78330 ?auto_78333 ) ) ( not ( = ?auto_78330 ?auto_78334 ) ) ( not ( = ?auto_78330 ?auto_78335 ) ) ( not ( = ?auto_78331 ?auto_78332 ) ) ( not ( = ?auto_78331 ?auto_78333 ) ) ( not ( = ?auto_78331 ?auto_78334 ) ) ( not ( = ?auto_78331 ?auto_78335 ) ) ( not ( = ?auto_78332 ?auto_78333 ) ) ( not ( = ?auto_78332 ?auto_78334 ) ) ( not ( = ?auto_78332 ?auto_78335 ) ) ( not ( = ?auto_78333 ?auto_78334 ) ) ( not ( = ?auto_78333 ?auto_78335 ) ) ( not ( = ?auto_78334 ?auto_78335 ) ) ( ON ?auto_78335 ?auto_78337 ) ( not ( = ?auto_78330 ?auto_78337 ) ) ( not ( = ?auto_78331 ?auto_78337 ) ) ( not ( = ?auto_78332 ?auto_78337 ) ) ( not ( = ?auto_78333 ?auto_78337 ) ) ( not ( = ?auto_78334 ?auto_78337 ) ) ( not ( = ?auto_78335 ?auto_78337 ) ) ( ON-TABLE ?auto_78337 ) ( ON ?auto_78330 ?auto_78336 ) ( not ( = ?auto_78330 ?auto_78336 ) ) ( not ( = ?auto_78331 ?auto_78336 ) ) ( not ( = ?auto_78332 ?auto_78336 ) ) ( not ( = ?auto_78333 ?auto_78336 ) ) ( not ( = ?auto_78334 ?auto_78336 ) ) ( not ( = ?auto_78335 ?auto_78336 ) ) ( not ( = ?auto_78337 ?auto_78336 ) ) ( ON ?auto_78331 ?auto_78330 ) ( ON-TABLE ?auto_78336 ) ( ON ?auto_78332 ?auto_78331 ) ( ON ?auto_78333 ?auto_78332 ) ( CLEAR ?auto_78333 ) ( HOLDING ?auto_78334 ) ( CLEAR ?auto_78335 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78337 ?auto_78335 ?auto_78334 )
      ( MAKE-6PILE ?auto_78330 ?auto_78331 ?auto_78332 ?auto_78333 ?auto_78334 ?auto_78335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78338 - BLOCK
      ?auto_78339 - BLOCK
      ?auto_78340 - BLOCK
      ?auto_78341 - BLOCK
      ?auto_78342 - BLOCK
      ?auto_78343 - BLOCK
    )
    :vars
    (
      ?auto_78344 - BLOCK
      ?auto_78345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78338 ?auto_78339 ) ) ( not ( = ?auto_78338 ?auto_78340 ) ) ( not ( = ?auto_78338 ?auto_78341 ) ) ( not ( = ?auto_78338 ?auto_78342 ) ) ( not ( = ?auto_78338 ?auto_78343 ) ) ( not ( = ?auto_78339 ?auto_78340 ) ) ( not ( = ?auto_78339 ?auto_78341 ) ) ( not ( = ?auto_78339 ?auto_78342 ) ) ( not ( = ?auto_78339 ?auto_78343 ) ) ( not ( = ?auto_78340 ?auto_78341 ) ) ( not ( = ?auto_78340 ?auto_78342 ) ) ( not ( = ?auto_78340 ?auto_78343 ) ) ( not ( = ?auto_78341 ?auto_78342 ) ) ( not ( = ?auto_78341 ?auto_78343 ) ) ( not ( = ?auto_78342 ?auto_78343 ) ) ( ON ?auto_78343 ?auto_78344 ) ( not ( = ?auto_78338 ?auto_78344 ) ) ( not ( = ?auto_78339 ?auto_78344 ) ) ( not ( = ?auto_78340 ?auto_78344 ) ) ( not ( = ?auto_78341 ?auto_78344 ) ) ( not ( = ?auto_78342 ?auto_78344 ) ) ( not ( = ?auto_78343 ?auto_78344 ) ) ( ON-TABLE ?auto_78344 ) ( ON ?auto_78338 ?auto_78345 ) ( not ( = ?auto_78338 ?auto_78345 ) ) ( not ( = ?auto_78339 ?auto_78345 ) ) ( not ( = ?auto_78340 ?auto_78345 ) ) ( not ( = ?auto_78341 ?auto_78345 ) ) ( not ( = ?auto_78342 ?auto_78345 ) ) ( not ( = ?auto_78343 ?auto_78345 ) ) ( not ( = ?auto_78344 ?auto_78345 ) ) ( ON ?auto_78339 ?auto_78338 ) ( ON-TABLE ?auto_78345 ) ( ON ?auto_78340 ?auto_78339 ) ( ON ?auto_78341 ?auto_78340 ) ( CLEAR ?auto_78343 ) ( ON ?auto_78342 ?auto_78341 ) ( CLEAR ?auto_78342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78345 ?auto_78338 ?auto_78339 ?auto_78340 ?auto_78341 )
      ( MAKE-6PILE ?auto_78338 ?auto_78339 ?auto_78340 ?auto_78341 ?auto_78342 ?auto_78343 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78346 - BLOCK
      ?auto_78347 - BLOCK
      ?auto_78348 - BLOCK
      ?auto_78349 - BLOCK
      ?auto_78350 - BLOCK
      ?auto_78351 - BLOCK
    )
    :vars
    (
      ?auto_78352 - BLOCK
      ?auto_78353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78346 ?auto_78347 ) ) ( not ( = ?auto_78346 ?auto_78348 ) ) ( not ( = ?auto_78346 ?auto_78349 ) ) ( not ( = ?auto_78346 ?auto_78350 ) ) ( not ( = ?auto_78346 ?auto_78351 ) ) ( not ( = ?auto_78347 ?auto_78348 ) ) ( not ( = ?auto_78347 ?auto_78349 ) ) ( not ( = ?auto_78347 ?auto_78350 ) ) ( not ( = ?auto_78347 ?auto_78351 ) ) ( not ( = ?auto_78348 ?auto_78349 ) ) ( not ( = ?auto_78348 ?auto_78350 ) ) ( not ( = ?auto_78348 ?auto_78351 ) ) ( not ( = ?auto_78349 ?auto_78350 ) ) ( not ( = ?auto_78349 ?auto_78351 ) ) ( not ( = ?auto_78350 ?auto_78351 ) ) ( not ( = ?auto_78346 ?auto_78352 ) ) ( not ( = ?auto_78347 ?auto_78352 ) ) ( not ( = ?auto_78348 ?auto_78352 ) ) ( not ( = ?auto_78349 ?auto_78352 ) ) ( not ( = ?auto_78350 ?auto_78352 ) ) ( not ( = ?auto_78351 ?auto_78352 ) ) ( ON-TABLE ?auto_78352 ) ( ON ?auto_78346 ?auto_78353 ) ( not ( = ?auto_78346 ?auto_78353 ) ) ( not ( = ?auto_78347 ?auto_78353 ) ) ( not ( = ?auto_78348 ?auto_78353 ) ) ( not ( = ?auto_78349 ?auto_78353 ) ) ( not ( = ?auto_78350 ?auto_78353 ) ) ( not ( = ?auto_78351 ?auto_78353 ) ) ( not ( = ?auto_78352 ?auto_78353 ) ) ( ON ?auto_78347 ?auto_78346 ) ( ON-TABLE ?auto_78353 ) ( ON ?auto_78348 ?auto_78347 ) ( ON ?auto_78349 ?auto_78348 ) ( ON ?auto_78350 ?auto_78349 ) ( CLEAR ?auto_78350 ) ( HOLDING ?auto_78351 ) ( CLEAR ?auto_78352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78352 ?auto_78351 )
      ( MAKE-6PILE ?auto_78346 ?auto_78347 ?auto_78348 ?auto_78349 ?auto_78350 ?auto_78351 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78354 - BLOCK
      ?auto_78355 - BLOCK
      ?auto_78356 - BLOCK
      ?auto_78357 - BLOCK
      ?auto_78358 - BLOCK
      ?auto_78359 - BLOCK
    )
    :vars
    (
      ?auto_78360 - BLOCK
      ?auto_78361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78354 ?auto_78355 ) ) ( not ( = ?auto_78354 ?auto_78356 ) ) ( not ( = ?auto_78354 ?auto_78357 ) ) ( not ( = ?auto_78354 ?auto_78358 ) ) ( not ( = ?auto_78354 ?auto_78359 ) ) ( not ( = ?auto_78355 ?auto_78356 ) ) ( not ( = ?auto_78355 ?auto_78357 ) ) ( not ( = ?auto_78355 ?auto_78358 ) ) ( not ( = ?auto_78355 ?auto_78359 ) ) ( not ( = ?auto_78356 ?auto_78357 ) ) ( not ( = ?auto_78356 ?auto_78358 ) ) ( not ( = ?auto_78356 ?auto_78359 ) ) ( not ( = ?auto_78357 ?auto_78358 ) ) ( not ( = ?auto_78357 ?auto_78359 ) ) ( not ( = ?auto_78358 ?auto_78359 ) ) ( not ( = ?auto_78354 ?auto_78360 ) ) ( not ( = ?auto_78355 ?auto_78360 ) ) ( not ( = ?auto_78356 ?auto_78360 ) ) ( not ( = ?auto_78357 ?auto_78360 ) ) ( not ( = ?auto_78358 ?auto_78360 ) ) ( not ( = ?auto_78359 ?auto_78360 ) ) ( ON-TABLE ?auto_78360 ) ( ON ?auto_78354 ?auto_78361 ) ( not ( = ?auto_78354 ?auto_78361 ) ) ( not ( = ?auto_78355 ?auto_78361 ) ) ( not ( = ?auto_78356 ?auto_78361 ) ) ( not ( = ?auto_78357 ?auto_78361 ) ) ( not ( = ?auto_78358 ?auto_78361 ) ) ( not ( = ?auto_78359 ?auto_78361 ) ) ( not ( = ?auto_78360 ?auto_78361 ) ) ( ON ?auto_78355 ?auto_78354 ) ( ON-TABLE ?auto_78361 ) ( ON ?auto_78356 ?auto_78355 ) ( ON ?auto_78357 ?auto_78356 ) ( ON ?auto_78358 ?auto_78357 ) ( CLEAR ?auto_78360 ) ( ON ?auto_78359 ?auto_78358 ) ( CLEAR ?auto_78359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78361 ?auto_78354 ?auto_78355 ?auto_78356 ?auto_78357 ?auto_78358 )
      ( MAKE-6PILE ?auto_78354 ?auto_78355 ?auto_78356 ?auto_78357 ?auto_78358 ?auto_78359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78362 - BLOCK
      ?auto_78363 - BLOCK
      ?auto_78364 - BLOCK
      ?auto_78365 - BLOCK
      ?auto_78366 - BLOCK
      ?auto_78367 - BLOCK
    )
    :vars
    (
      ?auto_78368 - BLOCK
      ?auto_78369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78362 ?auto_78363 ) ) ( not ( = ?auto_78362 ?auto_78364 ) ) ( not ( = ?auto_78362 ?auto_78365 ) ) ( not ( = ?auto_78362 ?auto_78366 ) ) ( not ( = ?auto_78362 ?auto_78367 ) ) ( not ( = ?auto_78363 ?auto_78364 ) ) ( not ( = ?auto_78363 ?auto_78365 ) ) ( not ( = ?auto_78363 ?auto_78366 ) ) ( not ( = ?auto_78363 ?auto_78367 ) ) ( not ( = ?auto_78364 ?auto_78365 ) ) ( not ( = ?auto_78364 ?auto_78366 ) ) ( not ( = ?auto_78364 ?auto_78367 ) ) ( not ( = ?auto_78365 ?auto_78366 ) ) ( not ( = ?auto_78365 ?auto_78367 ) ) ( not ( = ?auto_78366 ?auto_78367 ) ) ( not ( = ?auto_78362 ?auto_78368 ) ) ( not ( = ?auto_78363 ?auto_78368 ) ) ( not ( = ?auto_78364 ?auto_78368 ) ) ( not ( = ?auto_78365 ?auto_78368 ) ) ( not ( = ?auto_78366 ?auto_78368 ) ) ( not ( = ?auto_78367 ?auto_78368 ) ) ( ON ?auto_78362 ?auto_78369 ) ( not ( = ?auto_78362 ?auto_78369 ) ) ( not ( = ?auto_78363 ?auto_78369 ) ) ( not ( = ?auto_78364 ?auto_78369 ) ) ( not ( = ?auto_78365 ?auto_78369 ) ) ( not ( = ?auto_78366 ?auto_78369 ) ) ( not ( = ?auto_78367 ?auto_78369 ) ) ( not ( = ?auto_78368 ?auto_78369 ) ) ( ON ?auto_78363 ?auto_78362 ) ( ON-TABLE ?auto_78369 ) ( ON ?auto_78364 ?auto_78363 ) ( ON ?auto_78365 ?auto_78364 ) ( ON ?auto_78366 ?auto_78365 ) ( ON ?auto_78367 ?auto_78366 ) ( CLEAR ?auto_78367 ) ( HOLDING ?auto_78368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78368 )
      ( MAKE-6PILE ?auto_78362 ?auto_78363 ?auto_78364 ?auto_78365 ?auto_78366 ?auto_78367 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_78370 - BLOCK
      ?auto_78371 - BLOCK
      ?auto_78372 - BLOCK
      ?auto_78373 - BLOCK
      ?auto_78374 - BLOCK
      ?auto_78375 - BLOCK
    )
    :vars
    (
      ?auto_78376 - BLOCK
      ?auto_78377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78370 ?auto_78371 ) ) ( not ( = ?auto_78370 ?auto_78372 ) ) ( not ( = ?auto_78370 ?auto_78373 ) ) ( not ( = ?auto_78370 ?auto_78374 ) ) ( not ( = ?auto_78370 ?auto_78375 ) ) ( not ( = ?auto_78371 ?auto_78372 ) ) ( not ( = ?auto_78371 ?auto_78373 ) ) ( not ( = ?auto_78371 ?auto_78374 ) ) ( not ( = ?auto_78371 ?auto_78375 ) ) ( not ( = ?auto_78372 ?auto_78373 ) ) ( not ( = ?auto_78372 ?auto_78374 ) ) ( not ( = ?auto_78372 ?auto_78375 ) ) ( not ( = ?auto_78373 ?auto_78374 ) ) ( not ( = ?auto_78373 ?auto_78375 ) ) ( not ( = ?auto_78374 ?auto_78375 ) ) ( not ( = ?auto_78370 ?auto_78376 ) ) ( not ( = ?auto_78371 ?auto_78376 ) ) ( not ( = ?auto_78372 ?auto_78376 ) ) ( not ( = ?auto_78373 ?auto_78376 ) ) ( not ( = ?auto_78374 ?auto_78376 ) ) ( not ( = ?auto_78375 ?auto_78376 ) ) ( ON ?auto_78370 ?auto_78377 ) ( not ( = ?auto_78370 ?auto_78377 ) ) ( not ( = ?auto_78371 ?auto_78377 ) ) ( not ( = ?auto_78372 ?auto_78377 ) ) ( not ( = ?auto_78373 ?auto_78377 ) ) ( not ( = ?auto_78374 ?auto_78377 ) ) ( not ( = ?auto_78375 ?auto_78377 ) ) ( not ( = ?auto_78376 ?auto_78377 ) ) ( ON ?auto_78371 ?auto_78370 ) ( ON-TABLE ?auto_78377 ) ( ON ?auto_78372 ?auto_78371 ) ( ON ?auto_78373 ?auto_78372 ) ( ON ?auto_78374 ?auto_78373 ) ( ON ?auto_78375 ?auto_78374 ) ( ON ?auto_78376 ?auto_78375 ) ( CLEAR ?auto_78376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78377 ?auto_78370 ?auto_78371 ?auto_78372 ?auto_78373 ?auto_78374 ?auto_78375 )
      ( MAKE-6PILE ?auto_78370 ?auto_78371 ?auto_78372 ?auto_78373 ?auto_78374 ?auto_78375 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78385 - BLOCK
      ?auto_78386 - BLOCK
      ?auto_78387 - BLOCK
      ?auto_78388 - BLOCK
      ?auto_78389 - BLOCK
      ?auto_78390 - BLOCK
      ?auto_78391 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_78391 ) ( CLEAR ?auto_78390 ) ( ON-TABLE ?auto_78385 ) ( ON ?auto_78386 ?auto_78385 ) ( ON ?auto_78387 ?auto_78386 ) ( ON ?auto_78388 ?auto_78387 ) ( ON ?auto_78389 ?auto_78388 ) ( ON ?auto_78390 ?auto_78389 ) ( not ( = ?auto_78385 ?auto_78386 ) ) ( not ( = ?auto_78385 ?auto_78387 ) ) ( not ( = ?auto_78385 ?auto_78388 ) ) ( not ( = ?auto_78385 ?auto_78389 ) ) ( not ( = ?auto_78385 ?auto_78390 ) ) ( not ( = ?auto_78385 ?auto_78391 ) ) ( not ( = ?auto_78386 ?auto_78387 ) ) ( not ( = ?auto_78386 ?auto_78388 ) ) ( not ( = ?auto_78386 ?auto_78389 ) ) ( not ( = ?auto_78386 ?auto_78390 ) ) ( not ( = ?auto_78386 ?auto_78391 ) ) ( not ( = ?auto_78387 ?auto_78388 ) ) ( not ( = ?auto_78387 ?auto_78389 ) ) ( not ( = ?auto_78387 ?auto_78390 ) ) ( not ( = ?auto_78387 ?auto_78391 ) ) ( not ( = ?auto_78388 ?auto_78389 ) ) ( not ( = ?auto_78388 ?auto_78390 ) ) ( not ( = ?auto_78388 ?auto_78391 ) ) ( not ( = ?auto_78389 ?auto_78390 ) ) ( not ( = ?auto_78389 ?auto_78391 ) ) ( not ( = ?auto_78390 ?auto_78391 ) ) )
    :subtasks
    ( ( !STACK ?auto_78391 ?auto_78390 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78392 - BLOCK
      ?auto_78393 - BLOCK
      ?auto_78394 - BLOCK
      ?auto_78395 - BLOCK
      ?auto_78396 - BLOCK
      ?auto_78397 - BLOCK
      ?auto_78398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_78397 ) ( ON-TABLE ?auto_78392 ) ( ON ?auto_78393 ?auto_78392 ) ( ON ?auto_78394 ?auto_78393 ) ( ON ?auto_78395 ?auto_78394 ) ( ON ?auto_78396 ?auto_78395 ) ( ON ?auto_78397 ?auto_78396 ) ( not ( = ?auto_78392 ?auto_78393 ) ) ( not ( = ?auto_78392 ?auto_78394 ) ) ( not ( = ?auto_78392 ?auto_78395 ) ) ( not ( = ?auto_78392 ?auto_78396 ) ) ( not ( = ?auto_78392 ?auto_78397 ) ) ( not ( = ?auto_78392 ?auto_78398 ) ) ( not ( = ?auto_78393 ?auto_78394 ) ) ( not ( = ?auto_78393 ?auto_78395 ) ) ( not ( = ?auto_78393 ?auto_78396 ) ) ( not ( = ?auto_78393 ?auto_78397 ) ) ( not ( = ?auto_78393 ?auto_78398 ) ) ( not ( = ?auto_78394 ?auto_78395 ) ) ( not ( = ?auto_78394 ?auto_78396 ) ) ( not ( = ?auto_78394 ?auto_78397 ) ) ( not ( = ?auto_78394 ?auto_78398 ) ) ( not ( = ?auto_78395 ?auto_78396 ) ) ( not ( = ?auto_78395 ?auto_78397 ) ) ( not ( = ?auto_78395 ?auto_78398 ) ) ( not ( = ?auto_78396 ?auto_78397 ) ) ( not ( = ?auto_78396 ?auto_78398 ) ) ( not ( = ?auto_78397 ?auto_78398 ) ) ( ON-TABLE ?auto_78398 ) ( CLEAR ?auto_78398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_78398 )
      ( MAKE-7PILE ?auto_78392 ?auto_78393 ?auto_78394 ?auto_78395 ?auto_78396 ?auto_78397 ?auto_78398 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78399 - BLOCK
      ?auto_78400 - BLOCK
      ?auto_78401 - BLOCK
      ?auto_78402 - BLOCK
      ?auto_78403 - BLOCK
      ?auto_78404 - BLOCK
      ?auto_78405 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78399 ) ( ON ?auto_78400 ?auto_78399 ) ( ON ?auto_78401 ?auto_78400 ) ( ON ?auto_78402 ?auto_78401 ) ( ON ?auto_78403 ?auto_78402 ) ( not ( = ?auto_78399 ?auto_78400 ) ) ( not ( = ?auto_78399 ?auto_78401 ) ) ( not ( = ?auto_78399 ?auto_78402 ) ) ( not ( = ?auto_78399 ?auto_78403 ) ) ( not ( = ?auto_78399 ?auto_78404 ) ) ( not ( = ?auto_78399 ?auto_78405 ) ) ( not ( = ?auto_78400 ?auto_78401 ) ) ( not ( = ?auto_78400 ?auto_78402 ) ) ( not ( = ?auto_78400 ?auto_78403 ) ) ( not ( = ?auto_78400 ?auto_78404 ) ) ( not ( = ?auto_78400 ?auto_78405 ) ) ( not ( = ?auto_78401 ?auto_78402 ) ) ( not ( = ?auto_78401 ?auto_78403 ) ) ( not ( = ?auto_78401 ?auto_78404 ) ) ( not ( = ?auto_78401 ?auto_78405 ) ) ( not ( = ?auto_78402 ?auto_78403 ) ) ( not ( = ?auto_78402 ?auto_78404 ) ) ( not ( = ?auto_78402 ?auto_78405 ) ) ( not ( = ?auto_78403 ?auto_78404 ) ) ( not ( = ?auto_78403 ?auto_78405 ) ) ( not ( = ?auto_78404 ?auto_78405 ) ) ( ON-TABLE ?auto_78405 ) ( CLEAR ?auto_78405 ) ( HOLDING ?auto_78404 ) ( CLEAR ?auto_78403 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78399 ?auto_78400 ?auto_78401 ?auto_78402 ?auto_78403 ?auto_78404 )
      ( MAKE-7PILE ?auto_78399 ?auto_78400 ?auto_78401 ?auto_78402 ?auto_78403 ?auto_78404 ?auto_78405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78406 - BLOCK
      ?auto_78407 - BLOCK
      ?auto_78408 - BLOCK
      ?auto_78409 - BLOCK
      ?auto_78410 - BLOCK
      ?auto_78411 - BLOCK
      ?auto_78412 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78406 ) ( ON ?auto_78407 ?auto_78406 ) ( ON ?auto_78408 ?auto_78407 ) ( ON ?auto_78409 ?auto_78408 ) ( ON ?auto_78410 ?auto_78409 ) ( not ( = ?auto_78406 ?auto_78407 ) ) ( not ( = ?auto_78406 ?auto_78408 ) ) ( not ( = ?auto_78406 ?auto_78409 ) ) ( not ( = ?auto_78406 ?auto_78410 ) ) ( not ( = ?auto_78406 ?auto_78411 ) ) ( not ( = ?auto_78406 ?auto_78412 ) ) ( not ( = ?auto_78407 ?auto_78408 ) ) ( not ( = ?auto_78407 ?auto_78409 ) ) ( not ( = ?auto_78407 ?auto_78410 ) ) ( not ( = ?auto_78407 ?auto_78411 ) ) ( not ( = ?auto_78407 ?auto_78412 ) ) ( not ( = ?auto_78408 ?auto_78409 ) ) ( not ( = ?auto_78408 ?auto_78410 ) ) ( not ( = ?auto_78408 ?auto_78411 ) ) ( not ( = ?auto_78408 ?auto_78412 ) ) ( not ( = ?auto_78409 ?auto_78410 ) ) ( not ( = ?auto_78409 ?auto_78411 ) ) ( not ( = ?auto_78409 ?auto_78412 ) ) ( not ( = ?auto_78410 ?auto_78411 ) ) ( not ( = ?auto_78410 ?auto_78412 ) ) ( not ( = ?auto_78411 ?auto_78412 ) ) ( ON-TABLE ?auto_78412 ) ( CLEAR ?auto_78410 ) ( ON ?auto_78411 ?auto_78412 ) ( CLEAR ?auto_78411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78412 )
      ( MAKE-7PILE ?auto_78406 ?auto_78407 ?auto_78408 ?auto_78409 ?auto_78410 ?auto_78411 ?auto_78412 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78413 - BLOCK
      ?auto_78414 - BLOCK
      ?auto_78415 - BLOCK
      ?auto_78416 - BLOCK
      ?auto_78417 - BLOCK
      ?auto_78418 - BLOCK
      ?auto_78419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78413 ) ( ON ?auto_78414 ?auto_78413 ) ( ON ?auto_78415 ?auto_78414 ) ( ON ?auto_78416 ?auto_78415 ) ( not ( = ?auto_78413 ?auto_78414 ) ) ( not ( = ?auto_78413 ?auto_78415 ) ) ( not ( = ?auto_78413 ?auto_78416 ) ) ( not ( = ?auto_78413 ?auto_78417 ) ) ( not ( = ?auto_78413 ?auto_78418 ) ) ( not ( = ?auto_78413 ?auto_78419 ) ) ( not ( = ?auto_78414 ?auto_78415 ) ) ( not ( = ?auto_78414 ?auto_78416 ) ) ( not ( = ?auto_78414 ?auto_78417 ) ) ( not ( = ?auto_78414 ?auto_78418 ) ) ( not ( = ?auto_78414 ?auto_78419 ) ) ( not ( = ?auto_78415 ?auto_78416 ) ) ( not ( = ?auto_78415 ?auto_78417 ) ) ( not ( = ?auto_78415 ?auto_78418 ) ) ( not ( = ?auto_78415 ?auto_78419 ) ) ( not ( = ?auto_78416 ?auto_78417 ) ) ( not ( = ?auto_78416 ?auto_78418 ) ) ( not ( = ?auto_78416 ?auto_78419 ) ) ( not ( = ?auto_78417 ?auto_78418 ) ) ( not ( = ?auto_78417 ?auto_78419 ) ) ( not ( = ?auto_78418 ?auto_78419 ) ) ( ON-TABLE ?auto_78419 ) ( ON ?auto_78418 ?auto_78419 ) ( CLEAR ?auto_78418 ) ( HOLDING ?auto_78417 ) ( CLEAR ?auto_78416 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78413 ?auto_78414 ?auto_78415 ?auto_78416 ?auto_78417 )
      ( MAKE-7PILE ?auto_78413 ?auto_78414 ?auto_78415 ?auto_78416 ?auto_78417 ?auto_78418 ?auto_78419 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78420 - BLOCK
      ?auto_78421 - BLOCK
      ?auto_78422 - BLOCK
      ?auto_78423 - BLOCK
      ?auto_78424 - BLOCK
      ?auto_78425 - BLOCK
      ?auto_78426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78420 ) ( ON ?auto_78421 ?auto_78420 ) ( ON ?auto_78422 ?auto_78421 ) ( ON ?auto_78423 ?auto_78422 ) ( not ( = ?auto_78420 ?auto_78421 ) ) ( not ( = ?auto_78420 ?auto_78422 ) ) ( not ( = ?auto_78420 ?auto_78423 ) ) ( not ( = ?auto_78420 ?auto_78424 ) ) ( not ( = ?auto_78420 ?auto_78425 ) ) ( not ( = ?auto_78420 ?auto_78426 ) ) ( not ( = ?auto_78421 ?auto_78422 ) ) ( not ( = ?auto_78421 ?auto_78423 ) ) ( not ( = ?auto_78421 ?auto_78424 ) ) ( not ( = ?auto_78421 ?auto_78425 ) ) ( not ( = ?auto_78421 ?auto_78426 ) ) ( not ( = ?auto_78422 ?auto_78423 ) ) ( not ( = ?auto_78422 ?auto_78424 ) ) ( not ( = ?auto_78422 ?auto_78425 ) ) ( not ( = ?auto_78422 ?auto_78426 ) ) ( not ( = ?auto_78423 ?auto_78424 ) ) ( not ( = ?auto_78423 ?auto_78425 ) ) ( not ( = ?auto_78423 ?auto_78426 ) ) ( not ( = ?auto_78424 ?auto_78425 ) ) ( not ( = ?auto_78424 ?auto_78426 ) ) ( not ( = ?auto_78425 ?auto_78426 ) ) ( ON-TABLE ?auto_78426 ) ( ON ?auto_78425 ?auto_78426 ) ( CLEAR ?auto_78423 ) ( ON ?auto_78424 ?auto_78425 ) ( CLEAR ?auto_78424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78426 ?auto_78425 )
      ( MAKE-7PILE ?auto_78420 ?auto_78421 ?auto_78422 ?auto_78423 ?auto_78424 ?auto_78425 ?auto_78426 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78427 - BLOCK
      ?auto_78428 - BLOCK
      ?auto_78429 - BLOCK
      ?auto_78430 - BLOCK
      ?auto_78431 - BLOCK
      ?auto_78432 - BLOCK
      ?auto_78433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78427 ) ( ON ?auto_78428 ?auto_78427 ) ( ON ?auto_78429 ?auto_78428 ) ( not ( = ?auto_78427 ?auto_78428 ) ) ( not ( = ?auto_78427 ?auto_78429 ) ) ( not ( = ?auto_78427 ?auto_78430 ) ) ( not ( = ?auto_78427 ?auto_78431 ) ) ( not ( = ?auto_78427 ?auto_78432 ) ) ( not ( = ?auto_78427 ?auto_78433 ) ) ( not ( = ?auto_78428 ?auto_78429 ) ) ( not ( = ?auto_78428 ?auto_78430 ) ) ( not ( = ?auto_78428 ?auto_78431 ) ) ( not ( = ?auto_78428 ?auto_78432 ) ) ( not ( = ?auto_78428 ?auto_78433 ) ) ( not ( = ?auto_78429 ?auto_78430 ) ) ( not ( = ?auto_78429 ?auto_78431 ) ) ( not ( = ?auto_78429 ?auto_78432 ) ) ( not ( = ?auto_78429 ?auto_78433 ) ) ( not ( = ?auto_78430 ?auto_78431 ) ) ( not ( = ?auto_78430 ?auto_78432 ) ) ( not ( = ?auto_78430 ?auto_78433 ) ) ( not ( = ?auto_78431 ?auto_78432 ) ) ( not ( = ?auto_78431 ?auto_78433 ) ) ( not ( = ?auto_78432 ?auto_78433 ) ) ( ON-TABLE ?auto_78433 ) ( ON ?auto_78432 ?auto_78433 ) ( ON ?auto_78431 ?auto_78432 ) ( CLEAR ?auto_78431 ) ( HOLDING ?auto_78430 ) ( CLEAR ?auto_78429 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78427 ?auto_78428 ?auto_78429 ?auto_78430 )
      ( MAKE-7PILE ?auto_78427 ?auto_78428 ?auto_78429 ?auto_78430 ?auto_78431 ?auto_78432 ?auto_78433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78434 - BLOCK
      ?auto_78435 - BLOCK
      ?auto_78436 - BLOCK
      ?auto_78437 - BLOCK
      ?auto_78438 - BLOCK
      ?auto_78439 - BLOCK
      ?auto_78440 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78434 ) ( ON ?auto_78435 ?auto_78434 ) ( ON ?auto_78436 ?auto_78435 ) ( not ( = ?auto_78434 ?auto_78435 ) ) ( not ( = ?auto_78434 ?auto_78436 ) ) ( not ( = ?auto_78434 ?auto_78437 ) ) ( not ( = ?auto_78434 ?auto_78438 ) ) ( not ( = ?auto_78434 ?auto_78439 ) ) ( not ( = ?auto_78434 ?auto_78440 ) ) ( not ( = ?auto_78435 ?auto_78436 ) ) ( not ( = ?auto_78435 ?auto_78437 ) ) ( not ( = ?auto_78435 ?auto_78438 ) ) ( not ( = ?auto_78435 ?auto_78439 ) ) ( not ( = ?auto_78435 ?auto_78440 ) ) ( not ( = ?auto_78436 ?auto_78437 ) ) ( not ( = ?auto_78436 ?auto_78438 ) ) ( not ( = ?auto_78436 ?auto_78439 ) ) ( not ( = ?auto_78436 ?auto_78440 ) ) ( not ( = ?auto_78437 ?auto_78438 ) ) ( not ( = ?auto_78437 ?auto_78439 ) ) ( not ( = ?auto_78437 ?auto_78440 ) ) ( not ( = ?auto_78438 ?auto_78439 ) ) ( not ( = ?auto_78438 ?auto_78440 ) ) ( not ( = ?auto_78439 ?auto_78440 ) ) ( ON-TABLE ?auto_78440 ) ( ON ?auto_78439 ?auto_78440 ) ( ON ?auto_78438 ?auto_78439 ) ( CLEAR ?auto_78436 ) ( ON ?auto_78437 ?auto_78438 ) ( CLEAR ?auto_78437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78440 ?auto_78439 ?auto_78438 )
      ( MAKE-7PILE ?auto_78434 ?auto_78435 ?auto_78436 ?auto_78437 ?auto_78438 ?auto_78439 ?auto_78440 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78441 - BLOCK
      ?auto_78442 - BLOCK
      ?auto_78443 - BLOCK
      ?auto_78444 - BLOCK
      ?auto_78445 - BLOCK
      ?auto_78446 - BLOCK
      ?auto_78447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78441 ) ( ON ?auto_78442 ?auto_78441 ) ( not ( = ?auto_78441 ?auto_78442 ) ) ( not ( = ?auto_78441 ?auto_78443 ) ) ( not ( = ?auto_78441 ?auto_78444 ) ) ( not ( = ?auto_78441 ?auto_78445 ) ) ( not ( = ?auto_78441 ?auto_78446 ) ) ( not ( = ?auto_78441 ?auto_78447 ) ) ( not ( = ?auto_78442 ?auto_78443 ) ) ( not ( = ?auto_78442 ?auto_78444 ) ) ( not ( = ?auto_78442 ?auto_78445 ) ) ( not ( = ?auto_78442 ?auto_78446 ) ) ( not ( = ?auto_78442 ?auto_78447 ) ) ( not ( = ?auto_78443 ?auto_78444 ) ) ( not ( = ?auto_78443 ?auto_78445 ) ) ( not ( = ?auto_78443 ?auto_78446 ) ) ( not ( = ?auto_78443 ?auto_78447 ) ) ( not ( = ?auto_78444 ?auto_78445 ) ) ( not ( = ?auto_78444 ?auto_78446 ) ) ( not ( = ?auto_78444 ?auto_78447 ) ) ( not ( = ?auto_78445 ?auto_78446 ) ) ( not ( = ?auto_78445 ?auto_78447 ) ) ( not ( = ?auto_78446 ?auto_78447 ) ) ( ON-TABLE ?auto_78447 ) ( ON ?auto_78446 ?auto_78447 ) ( ON ?auto_78445 ?auto_78446 ) ( ON ?auto_78444 ?auto_78445 ) ( CLEAR ?auto_78444 ) ( HOLDING ?auto_78443 ) ( CLEAR ?auto_78442 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78441 ?auto_78442 ?auto_78443 )
      ( MAKE-7PILE ?auto_78441 ?auto_78442 ?auto_78443 ?auto_78444 ?auto_78445 ?auto_78446 ?auto_78447 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78448 - BLOCK
      ?auto_78449 - BLOCK
      ?auto_78450 - BLOCK
      ?auto_78451 - BLOCK
      ?auto_78452 - BLOCK
      ?auto_78453 - BLOCK
      ?auto_78454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78448 ) ( ON ?auto_78449 ?auto_78448 ) ( not ( = ?auto_78448 ?auto_78449 ) ) ( not ( = ?auto_78448 ?auto_78450 ) ) ( not ( = ?auto_78448 ?auto_78451 ) ) ( not ( = ?auto_78448 ?auto_78452 ) ) ( not ( = ?auto_78448 ?auto_78453 ) ) ( not ( = ?auto_78448 ?auto_78454 ) ) ( not ( = ?auto_78449 ?auto_78450 ) ) ( not ( = ?auto_78449 ?auto_78451 ) ) ( not ( = ?auto_78449 ?auto_78452 ) ) ( not ( = ?auto_78449 ?auto_78453 ) ) ( not ( = ?auto_78449 ?auto_78454 ) ) ( not ( = ?auto_78450 ?auto_78451 ) ) ( not ( = ?auto_78450 ?auto_78452 ) ) ( not ( = ?auto_78450 ?auto_78453 ) ) ( not ( = ?auto_78450 ?auto_78454 ) ) ( not ( = ?auto_78451 ?auto_78452 ) ) ( not ( = ?auto_78451 ?auto_78453 ) ) ( not ( = ?auto_78451 ?auto_78454 ) ) ( not ( = ?auto_78452 ?auto_78453 ) ) ( not ( = ?auto_78452 ?auto_78454 ) ) ( not ( = ?auto_78453 ?auto_78454 ) ) ( ON-TABLE ?auto_78454 ) ( ON ?auto_78453 ?auto_78454 ) ( ON ?auto_78452 ?auto_78453 ) ( ON ?auto_78451 ?auto_78452 ) ( CLEAR ?auto_78449 ) ( ON ?auto_78450 ?auto_78451 ) ( CLEAR ?auto_78450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78454 ?auto_78453 ?auto_78452 ?auto_78451 )
      ( MAKE-7PILE ?auto_78448 ?auto_78449 ?auto_78450 ?auto_78451 ?auto_78452 ?auto_78453 ?auto_78454 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78455 - BLOCK
      ?auto_78456 - BLOCK
      ?auto_78457 - BLOCK
      ?auto_78458 - BLOCK
      ?auto_78459 - BLOCK
      ?auto_78460 - BLOCK
      ?auto_78461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78455 ) ( not ( = ?auto_78455 ?auto_78456 ) ) ( not ( = ?auto_78455 ?auto_78457 ) ) ( not ( = ?auto_78455 ?auto_78458 ) ) ( not ( = ?auto_78455 ?auto_78459 ) ) ( not ( = ?auto_78455 ?auto_78460 ) ) ( not ( = ?auto_78455 ?auto_78461 ) ) ( not ( = ?auto_78456 ?auto_78457 ) ) ( not ( = ?auto_78456 ?auto_78458 ) ) ( not ( = ?auto_78456 ?auto_78459 ) ) ( not ( = ?auto_78456 ?auto_78460 ) ) ( not ( = ?auto_78456 ?auto_78461 ) ) ( not ( = ?auto_78457 ?auto_78458 ) ) ( not ( = ?auto_78457 ?auto_78459 ) ) ( not ( = ?auto_78457 ?auto_78460 ) ) ( not ( = ?auto_78457 ?auto_78461 ) ) ( not ( = ?auto_78458 ?auto_78459 ) ) ( not ( = ?auto_78458 ?auto_78460 ) ) ( not ( = ?auto_78458 ?auto_78461 ) ) ( not ( = ?auto_78459 ?auto_78460 ) ) ( not ( = ?auto_78459 ?auto_78461 ) ) ( not ( = ?auto_78460 ?auto_78461 ) ) ( ON-TABLE ?auto_78461 ) ( ON ?auto_78460 ?auto_78461 ) ( ON ?auto_78459 ?auto_78460 ) ( ON ?auto_78458 ?auto_78459 ) ( ON ?auto_78457 ?auto_78458 ) ( CLEAR ?auto_78457 ) ( HOLDING ?auto_78456 ) ( CLEAR ?auto_78455 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78455 ?auto_78456 )
      ( MAKE-7PILE ?auto_78455 ?auto_78456 ?auto_78457 ?auto_78458 ?auto_78459 ?auto_78460 ?auto_78461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78462 - BLOCK
      ?auto_78463 - BLOCK
      ?auto_78464 - BLOCK
      ?auto_78465 - BLOCK
      ?auto_78466 - BLOCK
      ?auto_78467 - BLOCK
      ?auto_78468 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_78462 ) ( not ( = ?auto_78462 ?auto_78463 ) ) ( not ( = ?auto_78462 ?auto_78464 ) ) ( not ( = ?auto_78462 ?auto_78465 ) ) ( not ( = ?auto_78462 ?auto_78466 ) ) ( not ( = ?auto_78462 ?auto_78467 ) ) ( not ( = ?auto_78462 ?auto_78468 ) ) ( not ( = ?auto_78463 ?auto_78464 ) ) ( not ( = ?auto_78463 ?auto_78465 ) ) ( not ( = ?auto_78463 ?auto_78466 ) ) ( not ( = ?auto_78463 ?auto_78467 ) ) ( not ( = ?auto_78463 ?auto_78468 ) ) ( not ( = ?auto_78464 ?auto_78465 ) ) ( not ( = ?auto_78464 ?auto_78466 ) ) ( not ( = ?auto_78464 ?auto_78467 ) ) ( not ( = ?auto_78464 ?auto_78468 ) ) ( not ( = ?auto_78465 ?auto_78466 ) ) ( not ( = ?auto_78465 ?auto_78467 ) ) ( not ( = ?auto_78465 ?auto_78468 ) ) ( not ( = ?auto_78466 ?auto_78467 ) ) ( not ( = ?auto_78466 ?auto_78468 ) ) ( not ( = ?auto_78467 ?auto_78468 ) ) ( ON-TABLE ?auto_78468 ) ( ON ?auto_78467 ?auto_78468 ) ( ON ?auto_78466 ?auto_78467 ) ( ON ?auto_78465 ?auto_78466 ) ( ON ?auto_78464 ?auto_78465 ) ( CLEAR ?auto_78462 ) ( ON ?auto_78463 ?auto_78464 ) ( CLEAR ?auto_78463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78468 ?auto_78467 ?auto_78466 ?auto_78465 ?auto_78464 )
      ( MAKE-7PILE ?auto_78462 ?auto_78463 ?auto_78464 ?auto_78465 ?auto_78466 ?auto_78467 ?auto_78468 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78469 - BLOCK
      ?auto_78470 - BLOCK
      ?auto_78471 - BLOCK
      ?auto_78472 - BLOCK
      ?auto_78473 - BLOCK
      ?auto_78474 - BLOCK
      ?auto_78475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78469 ?auto_78470 ) ) ( not ( = ?auto_78469 ?auto_78471 ) ) ( not ( = ?auto_78469 ?auto_78472 ) ) ( not ( = ?auto_78469 ?auto_78473 ) ) ( not ( = ?auto_78469 ?auto_78474 ) ) ( not ( = ?auto_78469 ?auto_78475 ) ) ( not ( = ?auto_78470 ?auto_78471 ) ) ( not ( = ?auto_78470 ?auto_78472 ) ) ( not ( = ?auto_78470 ?auto_78473 ) ) ( not ( = ?auto_78470 ?auto_78474 ) ) ( not ( = ?auto_78470 ?auto_78475 ) ) ( not ( = ?auto_78471 ?auto_78472 ) ) ( not ( = ?auto_78471 ?auto_78473 ) ) ( not ( = ?auto_78471 ?auto_78474 ) ) ( not ( = ?auto_78471 ?auto_78475 ) ) ( not ( = ?auto_78472 ?auto_78473 ) ) ( not ( = ?auto_78472 ?auto_78474 ) ) ( not ( = ?auto_78472 ?auto_78475 ) ) ( not ( = ?auto_78473 ?auto_78474 ) ) ( not ( = ?auto_78473 ?auto_78475 ) ) ( not ( = ?auto_78474 ?auto_78475 ) ) ( ON-TABLE ?auto_78475 ) ( ON ?auto_78474 ?auto_78475 ) ( ON ?auto_78473 ?auto_78474 ) ( ON ?auto_78472 ?auto_78473 ) ( ON ?auto_78471 ?auto_78472 ) ( ON ?auto_78470 ?auto_78471 ) ( CLEAR ?auto_78470 ) ( HOLDING ?auto_78469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78469 )
      ( MAKE-7PILE ?auto_78469 ?auto_78470 ?auto_78471 ?auto_78472 ?auto_78473 ?auto_78474 ?auto_78475 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78476 - BLOCK
      ?auto_78477 - BLOCK
      ?auto_78478 - BLOCK
      ?auto_78479 - BLOCK
      ?auto_78480 - BLOCK
      ?auto_78481 - BLOCK
      ?auto_78482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78476 ?auto_78477 ) ) ( not ( = ?auto_78476 ?auto_78478 ) ) ( not ( = ?auto_78476 ?auto_78479 ) ) ( not ( = ?auto_78476 ?auto_78480 ) ) ( not ( = ?auto_78476 ?auto_78481 ) ) ( not ( = ?auto_78476 ?auto_78482 ) ) ( not ( = ?auto_78477 ?auto_78478 ) ) ( not ( = ?auto_78477 ?auto_78479 ) ) ( not ( = ?auto_78477 ?auto_78480 ) ) ( not ( = ?auto_78477 ?auto_78481 ) ) ( not ( = ?auto_78477 ?auto_78482 ) ) ( not ( = ?auto_78478 ?auto_78479 ) ) ( not ( = ?auto_78478 ?auto_78480 ) ) ( not ( = ?auto_78478 ?auto_78481 ) ) ( not ( = ?auto_78478 ?auto_78482 ) ) ( not ( = ?auto_78479 ?auto_78480 ) ) ( not ( = ?auto_78479 ?auto_78481 ) ) ( not ( = ?auto_78479 ?auto_78482 ) ) ( not ( = ?auto_78480 ?auto_78481 ) ) ( not ( = ?auto_78480 ?auto_78482 ) ) ( not ( = ?auto_78481 ?auto_78482 ) ) ( ON-TABLE ?auto_78482 ) ( ON ?auto_78481 ?auto_78482 ) ( ON ?auto_78480 ?auto_78481 ) ( ON ?auto_78479 ?auto_78480 ) ( ON ?auto_78478 ?auto_78479 ) ( ON ?auto_78477 ?auto_78478 ) ( ON ?auto_78476 ?auto_78477 ) ( CLEAR ?auto_78476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78482 ?auto_78481 ?auto_78480 ?auto_78479 ?auto_78478 ?auto_78477 )
      ( MAKE-7PILE ?auto_78476 ?auto_78477 ?auto_78478 ?auto_78479 ?auto_78480 ?auto_78481 ?auto_78482 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78483 - BLOCK
      ?auto_78484 - BLOCK
      ?auto_78485 - BLOCK
      ?auto_78486 - BLOCK
      ?auto_78487 - BLOCK
      ?auto_78488 - BLOCK
      ?auto_78489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78483 ?auto_78484 ) ) ( not ( = ?auto_78483 ?auto_78485 ) ) ( not ( = ?auto_78483 ?auto_78486 ) ) ( not ( = ?auto_78483 ?auto_78487 ) ) ( not ( = ?auto_78483 ?auto_78488 ) ) ( not ( = ?auto_78483 ?auto_78489 ) ) ( not ( = ?auto_78484 ?auto_78485 ) ) ( not ( = ?auto_78484 ?auto_78486 ) ) ( not ( = ?auto_78484 ?auto_78487 ) ) ( not ( = ?auto_78484 ?auto_78488 ) ) ( not ( = ?auto_78484 ?auto_78489 ) ) ( not ( = ?auto_78485 ?auto_78486 ) ) ( not ( = ?auto_78485 ?auto_78487 ) ) ( not ( = ?auto_78485 ?auto_78488 ) ) ( not ( = ?auto_78485 ?auto_78489 ) ) ( not ( = ?auto_78486 ?auto_78487 ) ) ( not ( = ?auto_78486 ?auto_78488 ) ) ( not ( = ?auto_78486 ?auto_78489 ) ) ( not ( = ?auto_78487 ?auto_78488 ) ) ( not ( = ?auto_78487 ?auto_78489 ) ) ( not ( = ?auto_78488 ?auto_78489 ) ) ( ON-TABLE ?auto_78489 ) ( ON ?auto_78488 ?auto_78489 ) ( ON ?auto_78487 ?auto_78488 ) ( ON ?auto_78486 ?auto_78487 ) ( ON ?auto_78485 ?auto_78486 ) ( ON ?auto_78484 ?auto_78485 ) ( HOLDING ?auto_78483 ) ( CLEAR ?auto_78484 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78489 ?auto_78488 ?auto_78487 ?auto_78486 ?auto_78485 ?auto_78484 ?auto_78483 )
      ( MAKE-7PILE ?auto_78483 ?auto_78484 ?auto_78485 ?auto_78486 ?auto_78487 ?auto_78488 ?auto_78489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78490 - BLOCK
      ?auto_78491 - BLOCK
      ?auto_78492 - BLOCK
      ?auto_78493 - BLOCK
      ?auto_78494 - BLOCK
      ?auto_78495 - BLOCK
      ?auto_78496 - BLOCK
    )
    :vars
    (
      ?auto_78497 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78490 ?auto_78491 ) ) ( not ( = ?auto_78490 ?auto_78492 ) ) ( not ( = ?auto_78490 ?auto_78493 ) ) ( not ( = ?auto_78490 ?auto_78494 ) ) ( not ( = ?auto_78490 ?auto_78495 ) ) ( not ( = ?auto_78490 ?auto_78496 ) ) ( not ( = ?auto_78491 ?auto_78492 ) ) ( not ( = ?auto_78491 ?auto_78493 ) ) ( not ( = ?auto_78491 ?auto_78494 ) ) ( not ( = ?auto_78491 ?auto_78495 ) ) ( not ( = ?auto_78491 ?auto_78496 ) ) ( not ( = ?auto_78492 ?auto_78493 ) ) ( not ( = ?auto_78492 ?auto_78494 ) ) ( not ( = ?auto_78492 ?auto_78495 ) ) ( not ( = ?auto_78492 ?auto_78496 ) ) ( not ( = ?auto_78493 ?auto_78494 ) ) ( not ( = ?auto_78493 ?auto_78495 ) ) ( not ( = ?auto_78493 ?auto_78496 ) ) ( not ( = ?auto_78494 ?auto_78495 ) ) ( not ( = ?auto_78494 ?auto_78496 ) ) ( not ( = ?auto_78495 ?auto_78496 ) ) ( ON-TABLE ?auto_78496 ) ( ON ?auto_78495 ?auto_78496 ) ( ON ?auto_78494 ?auto_78495 ) ( ON ?auto_78493 ?auto_78494 ) ( ON ?auto_78492 ?auto_78493 ) ( ON ?auto_78491 ?auto_78492 ) ( CLEAR ?auto_78491 ) ( ON ?auto_78490 ?auto_78497 ) ( CLEAR ?auto_78490 ) ( HAND-EMPTY ) ( not ( = ?auto_78490 ?auto_78497 ) ) ( not ( = ?auto_78491 ?auto_78497 ) ) ( not ( = ?auto_78492 ?auto_78497 ) ) ( not ( = ?auto_78493 ?auto_78497 ) ) ( not ( = ?auto_78494 ?auto_78497 ) ) ( not ( = ?auto_78495 ?auto_78497 ) ) ( not ( = ?auto_78496 ?auto_78497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_78490 ?auto_78497 )
      ( MAKE-7PILE ?auto_78490 ?auto_78491 ?auto_78492 ?auto_78493 ?auto_78494 ?auto_78495 ?auto_78496 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78498 - BLOCK
      ?auto_78499 - BLOCK
      ?auto_78500 - BLOCK
      ?auto_78501 - BLOCK
      ?auto_78502 - BLOCK
      ?auto_78503 - BLOCK
      ?auto_78504 - BLOCK
    )
    :vars
    (
      ?auto_78505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78498 ?auto_78499 ) ) ( not ( = ?auto_78498 ?auto_78500 ) ) ( not ( = ?auto_78498 ?auto_78501 ) ) ( not ( = ?auto_78498 ?auto_78502 ) ) ( not ( = ?auto_78498 ?auto_78503 ) ) ( not ( = ?auto_78498 ?auto_78504 ) ) ( not ( = ?auto_78499 ?auto_78500 ) ) ( not ( = ?auto_78499 ?auto_78501 ) ) ( not ( = ?auto_78499 ?auto_78502 ) ) ( not ( = ?auto_78499 ?auto_78503 ) ) ( not ( = ?auto_78499 ?auto_78504 ) ) ( not ( = ?auto_78500 ?auto_78501 ) ) ( not ( = ?auto_78500 ?auto_78502 ) ) ( not ( = ?auto_78500 ?auto_78503 ) ) ( not ( = ?auto_78500 ?auto_78504 ) ) ( not ( = ?auto_78501 ?auto_78502 ) ) ( not ( = ?auto_78501 ?auto_78503 ) ) ( not ( = ?auto_78501 ?auto_78504 ) ) ( not ( = ?auto_78502 ?auto_78503 ) ) ( not ( = ?auto_78502 ?auto_78504 ) ) ( not ( = ?auto_78503 ?auto_78504 ) ) ( ON-TABLE ?auto_78504 ) ( ON ?auto_78503 ?auto_78504 ) ( ON ?auto_78502 ?auto_78503 ) ( ON ?auto_78501 ?auto_78502 ) ( ON ?auto_78500 ?auto_78501 ) ( ON ?auto_78498 ?auto_78505 ) ( CLEAR ?auto_78498 ) ( not ( = ?auto_78498 ?auto_78505 ) ) ( not ( = ?auto_78499 ?auto_78505 ) ) ( not ( = ?auto_78500 ?auto_78505 ) ) ( not ( = ?auto_78501 ?auto_78505 ) ) ( not ( = ?auto_78502 ?auto_78505 ) ) ( not ( = ?auto_78503 ?auto_78505 ) ) ( not ( = ?auto_78504 ?auto_78505 ) ) ( HOLDING ?auto_78499 ) ( CLEAR ?auto_78500 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78504 ?auto_78503 ?auto_78502 ?auto_78501 ?auto_78500 ?auto_78499 )
      ( MAKE-7PILE ?auto_78498 ?auto_78499 ?auto_78500 ?auto_78501 ?auto_78502 ?auto_78503 ?auto_78504 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78506 - BLOCK
      ?auto_78507 - BLOCK
      ?auto_78508 - BLOCK
      ?auto_78509 - BLOCK
      ?auto_78510 - BLOCK
      ?auto_78511 - BLOCK
      ?auto_78512 - BLOCK
    )
    :vars
    (
      ?auto_78513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78506 ?auto_78507 ) ) ( not ( = ?auto_78506 ?auto_78508 ) ) ( not ( = ?auto_78506 ?auto_78509 ) ) ( not ( = ?auto_78506 ?auto_78510 ) ) ( not ( = ?auto_78506 ?auto_78511 ) ) ( not ( = ?auto_78506 ?auto_78512 ) ) ( not ( = ?auto_78507 ?auto_78508 ) ) ( not ( = ?auto_78507 ?auto_78509 ) ) ( not ( = ?auto_78507 ?auto_78510 ) ) ( not ( = ?auto_78507 ?auto_78511 ) ) ( not ( = ?auto_78507 ?auto_78512 ) ) ( not ( = ?auto_78508 ?auto_78509 ) ) ( not ( = ?auto_78508 ?auto_78510 ) ) ( not ( = ?auto_78508 ?auto_78511 ) ) ( not ( = ?auto_78508 ?auto_78512 ) ) ( not ( = ?auto_78509 ?auto_78510 ) ) ( not ( = ?auto_78509 ?auto_78511 ) ) ( not ( = ?auto_78509 ?auto_78512 ) ) ( not ( = ?auto_78510 ?auto_78511 ) ) ( not ( = ?auto_78510 ?auto_78512 ) ) ( not ( = ?auto_78511 ?auto_78512 ) ) ( ON-TABLE ?auto_78512 ) ( ON ?auto_78511 ?auto_78512 ) ( ON ?auto_78510 ?auto_78511 ) ( ON ?auto_78509 ?auto_78510 ) ( ON ?auto_78508 ?auto_78509 ) ( ON ?auto_78506 ?auto_78513 ) ( not ( = ?auto_78506 ?auto_78513 ) ) ( not ( = ?auto_78507 ?auto_78513 ) ) ( not ( = ?auto_78508 ?auto_78513 ) ) ( not ( = ?auto_78509 ?auto_78513 ) ) ( not ( = ?auto_78510 ?auto_78513 ) ) ( not ( = ?auto_78511 ?auto_78513 ) ) ( not ( = ?auto_78512 ?auto_78513 ) ) ( CLEAR ?auto_78508 ) ( ON ?auto_78507 ?auto_78506 ) ( CLEAR ?auto_78507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_78513 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78513 ?auto_78506 )
      ( MAKE-7PILE ?auto_78506 ?auto_78507 ?auto_78508 ?auto_78509 ?auto_78510 ?auto_78511 ?auto_78512 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78514 - BLOCK
      ?auto_78515 - BLOCK
      ?auto_78516 - BLOCK
      ?auto_78517 - BLOCK
      ?auto_78518 - BLOCK
      ?auto_78519 - BLOCK
      ?auto_78520 - BLOCK
    )
    :vars
    (
      ?auto_78521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78514 ?auto_78515 ) ) ( not ( = ?auto_78514 ?auto_78516 ) ) ( not ( = ?auto_78514 ?auto_78517 ) ) ( not ( = ?auto_78514 ?auto_78518 ) ) ( not ( = ?auto_78514 ?auto_78519 ) ) ( not ( = ?auto_78514 ?auto_78520 ) ) ( not ( = ?auto_78515 ?auto_78516 ) ) ( not ( = ?auto_78515 ?auto_78517 ) ) ( not ( = ?auto_78515 ?auto_78518 ) ) ( not ( = ?auto_78515 ?auto_78519 ) ) ( not ( = ?auto_78515 ?auto_78520 ) ) ( not ( = ?auto_78516 ?auto_78517 ) ) ( not ( = ?auto_78516 ?auto_78518 ) ) ( not ( = ?auto_78516 ?auto_78519 ) ) ( not ( = ?auto_78516 ?auto_78520 ) ) ( not ( = ?auto_78517 ?auto_78518 ) ) ( not ( = ?auto_78517 ?auto_78519 ) ) ( not ( = ?auto_78517 ?auto_78520 ) ) ( not ( = ?auto_78518 ?auto_78519 ) ) ( not ( = ?auto_78518 ?auto_78520 ) ) ( not ( = ?auto_78519 ?auto_78520 ) ) ( ON-TABLE ?auto_78520 ) ( ON ?auto_78519 ?auto_78520 ) ( ON ?auto_78518 ?auto_78519 ) ( ON ?auto_78517 ?auto_78518 ) ( ON ?auto_78514 ?auto_78521 ) ( not ( = ?auto_78514 ?auto_78521 ) ) ( not ( = ?auto_78515 ?auto_78521 ) ) ( not ( = ?auto_78516 ?auto_78521 ) ) ( not ( = ?auto_78517 ?auto_78521 ) ) ( not ( = ?auto_78518 ?auto_78521 ) ) ( not ( = ?auto_78519 ?auto_78521 ) ) ( not ( = ?auto_78520 ?auto_78521 ) ) ( ON ?auto_78515 ?auto_78514 ) ( CLEAR ?auto_78515 ) ( ON-TABLE ?auto_78521 ) ( HOLDING ?auto_78516 ) ( CLEAR ?auto_78517 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78520 ?auto_78519 ?auto_78518 ?auto_78517 ?auto_78516 )
      ( MAKE-7PILE ?auto_78514 ?auto_78515 ?auto_78516 ?auto_78517 ?auto_78518 ?auto_78519 ?auto_78520 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78522 - BLOCK
      ?auto_78523 - BLOCK
      ?auto_78524 - BLOCK
      ?auto_78525 - BLOCK
      ?auto_78526 - BLOCK
      ?auto_78527 - BLOCK
      ?auto_78528 - BLOCK
    )
    :vars
    (
      ?auto_78529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78522 ?auto_78523 ) ) ( not ( = ?auto_78522 ?auto_78524 ) ) ( not ( = ?auto_78522 ?auto_78525 ) ) ( not ( = ?auto_78522 ?auto_78526 ) ) ( not ( = ?auto_78522 ?auto_78527 ) ) ( not ( = ?auto_78522 ?auto_78528 ) ) ( not ( = ?auto_78523 ?auto_78524 ) ) ( not ( = ?auto_78523 ?auto_78525 ) ) ( not ( = ?auto_78523 ?auto_78526 ) ) ( not ( = ?auto_78523 ?auto_78527 ) ) ( not ( = ?auto_78523 ?auto_78528 ) ) ( not ( = ?auto_78524 ?auto_78525 ) ) ( not ( = ?auto_78524 ?auto_78526 ) ) ( not ( = ?auto_78524 ?auto_78527 ) ) ( not ( = ?auto_78524 ?auto_78528 ) ) ( not ( = ?auto_78525 ?auto_78526 ) ) ( not ( = ?auto_78525 ?auto_78527 ) ) ( not ( = ?auto_78525 ?auto_78528 ) ) ( not ( = ?auto_78526 ?auto_78527 ) ) ( not ( = ?auto_78526 ?auto_78528 ) ) ( not ( = ?auto_78527 ?auto_78528 ) ) ( ON-TABLE ?auto_78528 ) ( ON ?auto_78527 ?auto_78528 ) ( ON ?auto_78526 ?auto_78527 ) ( ON ?auto_78525 ?auto_78526 ) ( ON ?auto_78522 ?auto_78529 ) ( not ( = ?auto_78522 ?auto_78529 ) ) ( not ( = ?auto_78523 ?auto_78529 ) ) ( not ( = ?auto_78524 ?auto_78529 ) ) ( not ( = ?auto_78525 ?auto_78529 ) ) ( not ( = ?auto_78526 ?auto_78529 ) ) ( not ( = ?auto_78527 ?auto_78529 ) ) ( not ( = ?auto_78528 ?auto_78529 ) ) ( ON ?auto_78523 ?auto_78522 ) ( ON-TABLE ?auto_78529 ) ( CLEAR ?auto_78525 ) ( ON ?auto_78524 ?auto_78523 ) ( CLEAR ?auto_78524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78529 ?auto_78522 ?auto_78523 )
      ( MAKE-7PILE ?auto_78522 ?auto_78523 ?auto_78524 ?auto_78525 ?auto_78526 ?auto_78527 ?auto_78528 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78530 - BLOCK
      ?auto_78531 - BLOCK
      ?auto_78532 - BLOCK
      ?auto_78533 - BLOCK
      ?auto_78534 - BLOCK
      ?auto_78535 - BLOCK
      ?auto_78536 - BLOCK
    )
    :vars
    (
      ?auto_78537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78530 ?auto_78531 ) ) ( not ( = ?auto_78530 ?auto_78532 ) ) ( not ( = ?auto_78530 ?auto_78533 ) ) ( not ( = ?auto_78530 ?auto_78534 ) ) ( not ( = ?auto_78530 ?auto_78535 ) ) ( not ( = ?auto_78530 ?auto_78536 ) ) ( not ( = ?auto_78531 ?auto_78532 ) ) ( not ( = ?auto_78531 ?auto_78533 ) ) ( not ( = ?auto_78531 ?auto_78534 ) ) ( not ( = ?auto_78531 ?auto_78535 ) ) ( not ( = ?auto_78531 ?auto_78536 ) ) ( not ( = ?auto_78532 ?auto_78533 ) ) ( not ( = ?auto_78532 ?auto_78534 ) ) ( not ( = ?auto_78532 ?auto_78535 ) ) ( not ( = ?auto_78532 ?auto_78536 ) ) ( not ( = ?auto_78533 ?auto_78534 ) ) ( not ( = ?auto_78533 ?auto_78535 ) ) ( not ( = ?auto_78533 ?auto_78536 ) ) ( not ( = ?auto_78534 ?auto_78535 ) ) ( not ( = ?auto_78534 ?auto_78536 ) ) ( not ( = ?auto_78535 ?auto_78536 ) ) ( ON-TABLE ?auto_78536 ) ( ON ?auto_78535 ?auto_78536 ) ( ON ?auto_78534 ?auto_78535 ) ( ON ?auto_78530 ?auto_78537 ) ( not ( = ?auto_78530 ?auto_78537 ) ) ( not ( = ?auto_78531 ?auto_78537 ) ) ( not ( = ?auto_78532 ?auto_78537 ) ) ( not ( = ?auto_78533 ?auto_78537 ) ) ( not ( = ?auto_78534 ?auto_78537 ) ) ( not ( = ?auto_78535 ?auto_78537 ) ) ( not ( = ?auto_78536 ?auto_78537 ) ) ( ON ?auto_78531 ?auto_78530 ) ( ON-TABLE ?auto_78537 ) ( ON ?auto_78532 ?auto_78531 ) ( CLEAR ?auto_78532 ) ( HOLDING ?auto_78533 ) ( CLEAR ?auto_78534 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78536 ?auto_78535 ?auto_78534 ?auto_78533 )
      ( MAKE-7PILE ?auto_78530 ?auto_78531 ?auto_78532 ?auto_78533 ?auto_78534 ?auto_78535 ?auto_78536 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78538 - BLOCK
      ?auto_78539 - BLOCK
      ?auto_78540 - BLOCK
      ?auto_78541 - BLOCK
      ?auto_78542 - BLOCK
      ?auto_78543 - BLOCK
      ?auto_78544 - BLOCK
    )
    :vars
    (
      ?auto_78545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78538 ?auto_78539 ) ) ( not ( = ?auto_78538 ?auto_78540 ) ) ( not ( = ?auto_78538 ?auto_78541 ) ) ( not ( = ?auto_78538 ?auto_78542 ) ) ( not ( = ?auto_78538 ?auto_78543 ) ) ( not ( = ?auto_78538 ?auto_78544 ) ) ( not ( = ?auto_78539 ?auto_78540 ) ) ( not ( = ?auto_78539 ?auto_78541 ) ) ( not ( = ?auto_78539 ?auto_78542 ) ) ( not ( = ?auto_78539 ?auto_78543 ) ) ( not ( = ?auto_78539 ?auto_78544 ) ) ( not ( = ?auto_78540 ?auto_78541 ) ) ( not ( = ?auto_78540 ?auto_78542 ) ) ( not ( = ?auto_78540 ?auto_78543 ) ) ( not ( = ?auto_78540 ?auto_78544 ) ) ( not ( = ?auto_78541 ?auto_78542 ) ) ( not ( = ?auto_78541 ?auto_78543 ) ) ( not ( = ?auto_78541 ?auto_78544 ) ) ( not ( = ?auto_78542 ?auto_78543 ) ) ( not ( = ?auto_78542 ?auto_78544 ) ) ( not ( = ?auto_78543 ?auto_78544 ) ) ( ON-TABLE ?auto_78544 ) ( ON ?auto_78543 ?auto_78544 ) ( ON ?auto_78542 ?auto_78543 ) ( ON ?auto_78538 ?auto_78545 ) ( not ( = ?auto_78538 ?auto_78545 ) ) ( not ( = ?auto_78539 ?auto_78545 ) ) ( not ( = ?auto_78540 ?auto_78545 ) ) ( not ( = ?auto_78541 ?auto_78545 ) ) ( not ( = ?auto_78542 ?auto_78545 ) ) ( not ( = ?auto_78543 ?auto_78545 ) ) ( not ( = ?auto_78544 ?auto_78545 ) ) ( ON ?auto_78539 ?auto_78538 ) ( ON-TABLE ?auto_78545 ) ( ON ?auto_78540 ?auto_78539 ) ( CLEAR ?auto_78542 ) ( ON ?auto_78541 ?auto_78540 ) ( CLEAR ?auto_78541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_78545 ?auto_78538 ?auto_78539 ?auto_78540 )
      ( MAKE-7PILE ?auto_78538 ?auto_78539 ?auto_78540 ?auto_78541 ?auto_78542 ?auto_78543 ?auto_78544 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78546 - BLOCK
      ?auto_78547 - BLOCK
      ?auto_78548 - BLOCK
      ?auto_78549 - BLOCK
      ?auto_78550 - BLOCK
      ?auto_78551 - BLOCK
      ?auto_78552 - BLOCK
    )
    :vars
    (
      ?auto_78553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78546 ?auto_78547 ) ) ( not ( = ?auto_78546 ?auto_78548 ) ) ( not ( = ?auto_78546 ?auto_78549 ) ) ( not ( = ?auto_78546 ?auto_78550 ) ) ( not ( = ?auto_78546 ?auto_78551 ) ) ( not ( = ?auto_78546 ?auto_78552 ) ) ( not ( = ?auto_78547 ?auto_78548 ) ) ( not ( = ?auto_78547 ?auto_78549 ) ) ( not ( = ?auto_78547 ?auto_78550 ) ) ( not ( = ?auto_78547 ?auto_78551 ) ) ( not ( = ?auto_78547 ?auto_78552 ) ) ( not ( = ?auto_78548 ?auto_78549 ) ) ( not ( = ?auto_78548 ?auto_78550 ) ) ( not ( = ?auto_78548 ?auto_78551 ) ) ( not ( = ?auto_78548 ?auto_78552 ) ) ( not ( = ?auto_78549 ?auto_78550 ) ) ( not ( = ?auto_78549 ?auto_78551 ) ) ( not ( = ?auto_78549 ?auto_78552 ) ) ( not ( = ?auto_78550 ?auto_78551 ) ) ( not ( = ?auto_78550 ?auto_78552 ) ) ( not ( = ?auto_78551 ?auto_78552 ) ) ( ON-TABLE ?auto_78552 ) ( ON ?auto_78551 ?auto_78552 ) ( ON ?auto_78546 ?auto_78553 ) ( not ( = ?auto_78546 ?auto_78553 ) ) ( not ( = ?auto_78547 ?auto_78553 ) ) ( not ( = ?auto_78548 ?auto_78553 ) ) ( not ( = ?auto_78549 ?auto_78553 ) ) ( not ( = ?auto_78550 ?auto_78553 ) ) ( not ( = ?auto_78551 ?auto_78553 ) ) ( not ( = ?auto_78552 ?auto_78553 ) ) ( ON ?auto_78547 ?auto_78546 ) ( ON-TABLE ?auto_78553 ) ( ON ?auto_78548 ?auto_78547 ) ( ON ?auto_78549 ?auto_78548 ) ( CLEAR ?auto_78549 ) ( HOLDING ?auto_78550 ) ( CLEAR ?auto_78551 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_78552 ?auto_78551 ?auto_78550 )
      ( MAKE-7PILE ?auto_78546 ?auto_78547 ?auto_78548 ?auto_78549 ?auto_78550 ?auto_78551 ?auto_78552 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78554 - BLOCK
      ?auto_78555 - BLOCK
      ?auto_78556 - BLOCK
      ?auto_78557 - BLOCK
      ?auto_78558 - BLOCK
      ?auto_78559 - BLOCK
      ?auto_78560 - BLOCK
    )
    :vars
    (
      ?auto_78561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78554 ?auto_78555 ) ) ( not ( = ?auto_78554 ?auto_78556 ) ) ( not ( = ?auto_78554 ?auto_78557 ) ) ( not ( = ?auto_78554 ?auto_78558 ) ) ( not ( = ?auto_78554 ?auto_78559 ) ) ( not ( = ?auto_78554 ?auto_78560 ) ) ( not ( = ?auto_78555 ?auto_78556 ) ) ( not ( = ?auto_78555 ?auto_78557 ) ) ( not ( = ?auto_78555 ?auto_78558 ) ) ( not ( = ?auto_78555 ?auto_78559 ) ) ( not ( = ?auto_78555 ?auto_78560 ) ) ( not ( = ?auto_78556 ?auto_78557 ) ) ( not ( = ?auto_78556 ?auto_78558 ) ) ( not ( = ?auto_78556 ?auto_78559 ) ) ( not ( = ?auto_78556 ?auto_78560 ) ) ( not ( = ?auto_78557 ?auto_78558 ) ) ( not ( = ?auto_78557 ?auto_78559 ) ) ( not ( = ?auto_78557 ?auto_78560 ) ) ( not ( = ?auto_78558 ?auto_78559 ) ) ( not ( = ?auto_78558 ?auto_78560 ) ) ( not ( = ?auto_78559 ?auto_78560 ) ) ( ON-TABLE ?auto_78560 ) ( ON ?auto_78559 ?auto_78560 ) ( ON ?auto_78554 ?auto_78561 ) ( not ( = ?auto_78554 ?auto_78561 ) ) ( not ( = ?auto_78555 ?auto_78561 ) ) ( not ( = ?auto_78556 ?auto_78561 ) ) ( not ( = ?auto_78557 ?auto_78561 ) ) ( not ( = ?auto_78558 ?auto_78561 ) ) ( not ( = ?auto_78559 ?auto_78561 ) ) ( not ( = ?auto_78560 ?auto_78561 ) ) ( ON ?auto_78555 ?auto_78554 ) ( ON-TABLE ?auto_78561 ) ( ON ?auto_78556 ?auto_78555 ) ( ON ?auto_78557 ?auto_78556 ) ( CLEAR ?auto_78559 ) ( ON ?auto_78558 ?auto_78557 ) ( CLEAR ?auto_78558 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_78561 ?auto_78554 ?auto_78555 ?auto_78556 ?auto_78557 )
      ( MAKE-7PILE ?auto_78554 ?auto_78555 ?auto_78556 ?auto_78557 ?auto_78558 ?auto_78559 ?auto_78560 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78562 - BLOCK
      ?auto_78563 - BLOCK
      ?auto_78564 - BLOCK
      ?auto_78565 - BLOCK
      ?auto_78566 - BLOCK
      ?auto_78567 - BLOCK
      ?auto_78568 - BLOCK
    )
    :vars
    (
      ?auto_78569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78562 ?auto_78563 ) ) ( not ( = ?auto_78562 ?auto_78564 ) ) ( not ( = ?auto_78562 ?auto_78565 ) ) ( not ( = ?auto_78562 ?auto_78566 ) ) ( not ( = ?auto_78562 ?auto_78567 ) ) ( not ( = ?auto_78562 ?auto_78568 ) ) ( not ( = ?auto_78563 ?auto_78564 ) ) ( not ( = ?auto_78563 ?auto_78565 ) ) ( not ( = ?auto_78563 ?auto_78566 ) ) ( not ( = ?auto_78563 ?auto_78567 ) ) ( not ( = ?auto_78563 ?auto_78568 ) ) ( not ( = ?auto_78564 ?auto_78565 ) ) ( not ( = ?auto_78564 ?auto_78566 ) ) ( not ( = ?auto_78564 ?auto_78567 ) ) ( not ( = ?auto_78564 ?auto_78568 ) ) ( not ( = ?auto_78565 ?auto_78566 ) ) ( not ( = ?auto_78565 ?auto_78567 ) ) ( not ( = ?auto_78565 ?auto_78568 ) ) ( not ( = ?auto_78566 ?auto_78567 ) ) ( not ( = ?auto_78566 ?auto_78568 ) ) ( not ( = ?auto_78567 ?auto_78568 ) ) ( ON-TABLE ?auto_78568 ) ( ON ?auto_78562 ?auto_78569 ) ( not ( = ?auto_78562 ?auto_78569 ) ) ( not ( = ?auto_78563 ?auto_78569 ) ) ( not ( = ?auto_78564 ?auto_78569 ) ) ( not ( = ?auto_78565 ?auto_78569 ) ) ( not ( = ?auto_78566 ?auto_78569 ) ) ( not ( = ?auto_78567 ?auto_78569 ) ) ( not ( = ?auto_78568 ?auto_78569 ) ) ( ON ?auto_78563 ?auto_78562 ) ( ON-TABLE ?auto_78569 ) ( ON ?auto_78564 ?auto_78563 ) ( ON ?auto_78565 ?auto_78564 ) ( ON ?auto_78566 ?auto_78565 ) ( CLEAR ?auto_78566 ) ( HOLDING ?auto_78567 ) ( CLEAR ?auto_78568 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_78568 ?auto_78567 )
      ( MAKE-7PILE ?auto_78562 ?auto_78563 ?auto_78564 ?auto_78565 ?auto_78566 ?auto_78567 ?auto_78568 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78570 - BLOCK
      ?auto_78571 - BLOCK
      ?auto_78572 - BLOCK
      ?auto_78573 - BLOCK
      ?auto_78574 - BLOCK
      ?auto_78575 - BLOCK
      ?auto_78576 - BLOCK
    )
    :vars
    (
      ?auto_78577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78570 ?auto_78571 ) ) ( not ( = ?auto_78570 ?auto_78572 ) ) ( not ( = ?auto_78570 ?auto_78573 ) ) ( not ( = ?auto_78570 ?auto_78574 ) ) ( not ( = ?auto_78570 ?auto_78575 ) ) ( not ( = ?auto_78570 ?auto_78576 ) ) ( not ( = ?auto_78571 ?auto_78572 ) ) ( not ( = ?auto_78571 ?auto_78573 ) ) ( not ( = ?auto_78571 ?auto_78574 ) ) ( not ( = ?auto_78571 ?auto_78575 ) ) ( not ( = ?auto_78571 ?auto_78576 ) ) ( not ( = ?auto_78572 ?auto_78573 ) ) ( not ( = ?auto_78572 ?auto_78574 ) ) ( not ( = ?auto_78572 ?auto_78575 ) ) ( not ( = ?auto_78572 ?auto_78576 ) ) ( not ( = ?auto_78573 ?auto_78574 ) ) ( not ( = ?auto_78573 ?auto_78575 ) ) ( not ( = ?auto_78573 ?auto_78576 ) ) ( not ( = ?auto_78574 ?auto_78575 ) ) ( not ( = ?auto_78574 ?auto_78576 ) ) ( not ( = ?auto_78575 ?auto_78576 ) ) ( ON-TABLE ?auto_78576 ) ( ON ?auto_78570 ?auto_78577 ) ( not ( = ?auto_78570 ?auto_78577 ) ) ( not ( = ?auto_78571 ?auto_78577 ) ) ( not ( = ?auto_78572 ?auto_78577 ) ) ( not ( = ?auto_78573 ?auto_78577 ) ) ( not ( = ?auto_78574 ?auto_78577 ) ) ( not ( = ?auto_78575 ?auto_78577 ) ) ( not ( = ?auto_78576 ?auto_78577 ) ) ( ON ?auto_78571 ?auto_78570 ) ( ON-TABLE ?auto_78577 ) ( ON ?auto_78572 ?auto_78571 ) ( ON ?auto_78573 ?auto_78572 ) ( ON ?auto_78574 ?auto_78573 ) ( CLEAR ?auto_78576 ) ( ON ?auto_78575 ?auto_78574 ) ( CLEAR ?auto_78575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_78577 ?auto_78570 ?auto_78571 ?auto_78572 ?auto_78573 ?auto_78574 )
      ( MAKE-7PILE ?auto_78570 ?auto_78571 ?auto_78572 ?auto_78573 ?auto_78574 ?auto_78575 ?auto_78576 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78578 - BLOCK
      ?auto_78579 - BLOCK
      ?auto_78580 - BLOCK
      ?auto_78581 - BLOCK
      ?auto_78582 - BLOCK
      ?auto_78583 - BLOCK
      ?auto_78584 - BLOCK
    )
    :vars
    (
      ?auto_78585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78578 ?auto_78579 ) ) ( not ( = ?auto_78578 ?auto_78580 ) ) ( not ( = ?auto_78578 ?auto_78581 ) ) ( not ( = ?auto_78578 ?auto_78582 ) ) ( not ( = ?auto_78578 ?auto_78583 ) ) ( not ( = ?auto_78578 ?auto_78584 ) ) ( not ( = ?auto_78579 ?auto_78580 ) ) ( not ( = ?auto_78579 ?auto_78581 ) ) ( not ( = ?auto_78579 ?auto_78582 ) ) ( not ( = ?auto_78579 ?auto_78583 ) ) ( not ( = ?auto_78579 ?auto_78584 ) ) ( not ( = ?auto_78580 ?auto_78581 ) ) ( not ( = ?auto_78580 ?auto_78582 ) ) ( not ( = ?auto_78580 ?auto_78583 ) ) ( not ( = ?auto_78580 ?auto_78584 ) ) ( not ( = ?auto_78581 ?auto_78582 ) ) ( not ( = ?auto_78581 ?auto_78583 ) ) ( not ( = ?auto_78581 ?auto_78584 ) ) ( not ( = ?auto_78582 ?auto_78583 ) ) ( not ( = ?auto_78582 ?auto_78584 ) ) ( not ( = ?auto_78583 ?auto_78584 ) ) ( ON ?auto_78578 ?auto_78585 ) ( not ( = ?auto_78578 ?auto_78585 ) ) ( not ( = ?auto_78579 ?auto_78585 ) ) ( not ( = ?auto_78580 ?auto_78585 ) ) ( not ( = ?auto_78581 ?auto_78585 ) ) ( not ( = ?auto_78582 ?auto_78585 ) ) ( not ( = ?auto_78583 ?auto_78585 ) ) ( not ( = ?auto_78584 ?auto_78585 ) ) ( ON ?auto_78579 ?auto_78578 ) ( ON-TABLE ?auto_78585 ) ( ON ?auto_78580 ?auto_78579 ) ( ON ?auto_78581 ?auto_78580 ) ( ON ?auto_78582 ?auto_78581 ) ( ON ?auto_78583 ?auto_78582 ) ( CLEAR ?auto_78583 ) ( HOLDING ?auto_78584 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_78584 )
      ( MAKE-7PILE ?auto_78578 ?auto_78579 ?auto_78580 ?auto_78581 ?auto_78582 ?auto_78583 ?auto_78584 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_78586 - BLOCK
      ?auto_78587 - BLOCK
      ?auto_78588 - BLOCK
      ?auto_78589 - BLOCK
      ?auto_78590 - BLOCK
      ?auto_78591 - BLOCK
      ?auto_78592 - BLOCK
    )
    :vars
    (
      ?auto_78593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78586 ?auto_78587 ) ) ( not ( = ?auto_78586 ?auto_78588 ) ) ( not ( = ?auto_78586 ?auto_78589 ) ) ( not ( = ?auto_78586 ?auto_78590 ) ) ( not ( = ?auto_78586 ?auto_78591 ) ) ( not ( = ?auto_78586 ?auto_78592 ) ) ( not ( = ?auto_78587 ?auto_78588 ) ) ( not ( = ?auto_78587 ?auto_78589 ) ) ( not ( = ?auto_78587 ?auto_78590 ) ) ( not ( = ?auto_78587 ?auto_78591 ) ) ( not ( = ?auto_78587 ?auto_78592 ) ) ( not ( = ?auto_78588 ?auto_78589 ) ) ( not ( = ?auto_78588 ?auto_78590 ) ) ( not ( = ?auto_78588 ?auto_78591 ) ) ( not ( = ?auto_78588 ?auto_78592 ) ) ( not ( = ?auto_78589 ?auto_78590 ) ) ( not ( = ?auto_78589 ?auto_78591 ) ) ( not ( = ?auto_78589 ?auto_78592 ) ) ( not ( = ?auto_78590 ?auto_78591 ) ) ( not ( = ?auto_78590 ?auto_78592 ) ) ( not ( = ?auto_78591 ?auto_78592 ) ) ( ON ?auto_78586 ?auto_78593 ) ( not ( = ?auto_78586 ?auto_78593 ) ) ( not ( = ?auto_78587 ?auto_78593 ) ) ( not ( = ?auto_78588 ?auto_78593 ) ) ( not ( = ?auto_78589 ?auto_78593 ) ) ( not ( = ?auto_78590 ?auto_78593 ) ) ( not ( = ?auto_78591 ?auto_78593 ) ) ( not ( = ?auto_78592 ?auto_78593 ) ) ( ON ?auto_78587 ?auto_78586 ) ( ON-TABLE ?auto_78593 ) ( ON ?auto_78588 ?auto_78587 ) ( ON ?auto_78589 ?auto_78588 ) ( ON ?auto_78590 ?auto_78589 ) ( ON ?auto_78591 ?auto_78590 ) ( ON ?auto_78592 ?auto_78591 ) ( CLEAR ?auto_78592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_78593 ?auto_78586 ?auto_78587 ?auto_78588 ?auto_78589 ?auto_78590 ?auto_78591 )
      ( MAKE-7PILE ?auto_78586 ?auto_78587 ?auto_78588 ?auto_78589 ?auto_78590 ?auto_78591 ?auto_78592 ) )
  )

)

